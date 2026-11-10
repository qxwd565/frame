"""Inventory beta/original source changes; unresolved render equivalence stays pending.

This deliberately does not equate equal source files with equal final pixels,
or assume that the card's in-game placement is encoded in its prefab.
"""
import collections
import csv
import gzip
import hashlib
import importlib.util
import json
import pathlib
import re
import sys
import zipfile

sys.dont_write_bytecode = True
ROOT = pathlib.Path(__file__).resolve().parent.parent
SNAPSHOTS = ROOT / 'v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/snapshots'
OUTPUT = pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교')
IPA = pathlib.Path(r'E:\hearthstone card\하스스톤 IPA 전체 버전')
DEV = pathlib.Path(r'E:\HSPlus\development')
PC = ['3664', '3749', '3890', '3937', '4217', '4243', '4458', '4482', '4944']
IOS = [('1.0.0', '14836313'), ('1.0.5361', '563785077'),
       ('1.0.5435', '588883794'), ('1.0.5834', '608602673')]

sys.path.insert(0, r'E:\hearthstone card\tools\unitypy')
import UnityPy

spec = importlib.util.spec_from_file_location('early_index', ROOT / 'tools/index-early-frame-combinations.py')
early = importlib.util.module_from_spec(spec)
spec.loader.exec_module(early)


def source_documents():
    for build in PC:
        yield 'PC', '1.0.0.' + build, early.read(SNAPSHOTS / ('pc-1.0.0.' + build + '.json.gz'))
    for version, identifier in IOS:
        yield 'iOS', version, early.read(SNAPSHOTS / ('ios-' + version + '-' + identifier + '.json.gz'))


def description(items):
    if not items:
        return ''
    return json.dumps(items, ensure_ascii=False, sort_keys=True, separators=(',', ':'))


def rows():
    prior = {}
    for platform, version, doc in source_documents():
        groups, missing = early.analyze(doc)
        if missing:
            raise ValueError('Unresolved references in ' + version)
        old = prior.get(platform)
        if old:
            before_version, before = old
            for category in ('meshes', 'materials', 'shaders', 'textures', 'prefabs'):
                for name in sorted(set(before[category]) | set(groups[category])):
                    a = before[category].get(name)
                    b = groups[category].get(name)
                    if a == b:
                        status = '원본 항목 동일'
                    elif a is None:
                        status = '추가'
                    elif b is None:
                        status = '제거'
                    elif category == 'textures' and len(a) == len(b) == 1 and a[0]['width'] == b[0]['width'] * 2 and a[0]['height'] == b[0]['height'] * 2:
                        status = '가로·세로 1/2: 직전 원본 대체 렌더 확인 필요'
                    elif category == 'shaders' and len(a) == len(b) == 1 and a[0]['programsFound'] and b[0]['programsFound'] and a[0]['programSha256'] == b[0]['programSha256']:
                        status = '셰이더 원문 변경, 추출한 GPU 프로그램 동일'
                    else:
                        status = '원본 항목 변경'
                    yield {'플랫폼':platform, '직전 버전':before_version, '현재 버전':version,
                           '분류':category, '원본 이름':name, '원본 비교':status,
                           '직전 원본':description(a), '현재 원본':description(b),
                           '렌더 결과':'원본 카메라 및 배치 확인 후 판정',
                           'API·플러그인 판정':'렌더 결과 확인 대기'}
        prior[platform] = (version, groups)


def camera_records(bundle, platform, version, member, names=('Main Camera', 'TooltipCamera')):
    env = UnityPy.load(bundle)
    found = []
    for obj in env.objects:
        if obj.type.name != 'Camera':
            continue
        camera = obj.read_typetree()
        game_object = obj.assets_file.objects[camera['m_GameObject']['m_PathID']]
        go = game_object.read_typetree()
        name = go['m_Name']
        if name not in names:
            continue
        transform = None
        for component in go['m_Component']:
            if isinstance(component, (list, tuple)):
                kind, ref = component
            else:
                ref = component.get('component', component)
                candidate = obj.assets_file.objects.get(ref.get('m_PathID'))
                kind = candidate.type.value if candidate else None
            if kind == 4:
                transform = obj.assets_file.objects.get(ref['m_PathID'])
                break
        chain = []
        seen = set()
        while transform:
            if transform.path_id in seen:
                raise ValueError('Cyclic transform in camera source')
            seen.add(transform.path_id)
            t = transform.read_typetree()
            owner = obj.assets_file.objects[t['m_GameObject']['m_PathID']].read()
            chain.append({'name':owner.m_Name, 'position':t['m_LocalPosition'],
                          'rotation':t['m_LocalRotation'], 'scale':t['m_LocalScale']})
            transform = obj.assets_file.objects.get(t['m_Father']['m_PathID'])
        found.append({'platform':platform, 'version':version, 'bundle':member,
                      'camera':name, 'pathId':str(obj.path_id), 'fields':camera,
                      'transformChain':chain})
    return found


def collection_anchors(bundle, platform, version, member):
    env = UnityPy.load(bundle)
    result = []
    for obj in env.objects:
        if obj.type.name != 'GameObject' or obj.peek_name() not in (
                '8_CollectionCardStartPosition', '15_CollectionCardStartPosition'):
            continue
        go = obj.read_typetree()
        ref = next((ref for kind, ref in go['m_Component'] if kind == 4), None)
        transform = obj.assets_file.objects.get(ref['m_PathID']) if ref else None
        chain = []
        seen = set()
        while transform:
            if transform.path_id in seen:
                raise ValueError('Cyclic collection transform')
            seen.add(transform.path_id)
            t = transform.read_typetree()
            owner = obj.assets_file.objects[t['m_GameObject']['m_PathID']].read()
            chain.append({'name':owner.m_Name, 'position':t['m_LocalPosition'],
                          'rotation':t['m_LocalRotation'], 'scale':t['m_LocalScale']})
            transform = obj.assets_file.objects.get(t['m_Father']['m_PathID'])
        result.append({'platform':platform, 'version':version, 'bundle':member,
                       'anchor':go['m_Name'], 'pathId':str(obj.path_id), 'transformChain':chain})
    return result


def cameras():
    # Reuse the existing, read-only MPQ member reader for this source build.
    spec = importlib.util.spec_from_file_location('early_audit', ROOT / 'tools/audit-early-frame-combinations.py')
    audit = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(audit)
    result = []
    anchors = []
    for build in PC:
        filename = 'gameobjects.unity3d' if build == '3664' else 'gameobjects0.unity3d'
        if build == '3749':
            data = audit.mpq_member('Data\\' + filename)
            path = '3749-input/base-Win.MPQ!Data/' + filename
        else:
            folder = DEV / '.codex-work/beta-extracted-20261101' / ('1.0.0.' + build) / 'Data'
            if (folder / 'Win').is_dir():
                folder /= 'Win'
            source = folder / filename
            data = source.read_bytes()
            path = str(source)
        result.extend(camera_records(data, 'PC', '1.0.0.' + build, path))
        ui_name = 'uiscreens.unity3d' if build == '3664' else 'uiscreens0.unity3d'
        if build == '3749':
            data = audit.mpq_member('Data\\' + ui_name)
            ui_path = '3749-input/base-Win.MPQ!Data/' + ui_name
        else:
            ui_source = folder / ui_name
            data = ui_source.read_bytes()
            ui_path = str(ui_source)
        result.extend(camera_records(data, 'PC', '1.0.0.' + build, ui_path, ('TheBoxCamera', 'TooltipCamera')))
        anchors.extend(collection_anchors(data, 'PC', '1.0.0.' + build, ui_path))
    for version, identifier in IOS:
        path = IPA / ('Hearthstone-' + version + '--' + identifier + '.ipa')
        with zipfile.ZipFile(path) as archive:
            member = next(x for x in archive.namelist() if x.endswith('/gameobjects0.unity3d'))
            data = archive.read(member)
        result.extend(camera_records(data, 'iOS', version, str(path) + '!' + member))
        with zipfile.ZipFile(path) as archive:
            ui = next(x for x in archive.namelist() if x.endswith('/uiscreens0.unity3d'))
            data = archive.read(ui)
        ui_path = str(path) + '!' + ui
        result.extend(camera_records(data, 'iOS', version, ui_path, ('TheBoxCamera', 'TooltipCamera')))
        anchors.extend(collection_anchors(data, 'iOS', version, ui_path))
    return result, anchors


def main():
    if not OUTPUT.is_dir():
        raise FileNotFoundError('Existing result folder not found')
    data = list(rows())
    destination = OUTPUT / '베타-오리지널 원본 자원 비교.csv'
    camera_path = OUTPUT / '베타-오리지널 원본 카메라.json'
    if (destination.exists() or camera_path.exists()) and '--refresh' not in sys.argv:
        raise FileExistsError('Use --refresh to replace this tool’s own previously generated reports')
    camera_data, anchors = cameras()
    with destination.open('w', newline='', encoding='utf-8-sig') as stream:
        writer = csv.DictWriter(stream, fieldnames=list(data[0]))
        writer.writeheader()
        writer.writerows(data)
    camera_path.write_text(json.dumps({'scope':'Raw source camera fields and collection anchor transform chains. The active camera, runtime scene transforms and dynamic card placement are not established by this inventory.', 'cameras':camera_data, 'collectionAnchors':anchors}, ensure_ascii=False, indent=2), encoding='utf-8')
    counts = collections.Counter(row['원본 비교'] for row in data)
    print(json.dumps({'rows':len(data), 'counts':counts, 'csv':str(destination), 'camera':str(camera_path)}, ensure_ascii=False))


if __name__ == '__main__':
    main()
