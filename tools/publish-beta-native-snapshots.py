"""Publish original beta minion meshes, shaders and text fields without textures."""
import base64
import gzip
import hashlib
import importlib.util
import json
import pathlib
import urllib.parse
import urllib.request

root = pathlib.Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location('frame_apis', root / 'tools/publish-frame-apis.py')
api = importlib.util.module_from_spec(spec)
spec.loader.exec_module(api)
source = pathlib.Path(r'E:\hearthstone card\하수인 원본 렌더\원본 추출')
index_path = root / 'plugin/hscard/assets/unity/frame-api-index.json'
destination = root / 'v7.14.4-webgpu-20261109/assets/unity'
repo = 'legacy'
builds = ['3664', '3749', '3890', '3937', '4217', '4243', '4458', '4482', '4944']


def get(commit, name):
    url = f'https://raw.githubusercontent.com/qxwd565/{repo}/{commit}/frame/' + urllib.parse.quote(name, safe='/')
    with urllib.request.urlopen(url, timeout=60) as response:
        return response.read()


def snapshot(build):
    data = json.loads(gzip.decompress((source / ('PC 1.0.0.' + build + '.json.gz')).read_bytes()))
    if data['source']['version'] != '1.0.0.' + build or len(data['prefabs']) != 2:
        raise ValueError('Source identity or minion prefabs: ' + build)
    assets = [item for item in data['assets'] if item['type'] != 28]
    for item in assets:
        if hashlib.sha256(base64.b64decode(item['rawObject'], validate=True)).hexdigest() != item['sourceSha256']:
            raise ValueError('Original Unity object checksum: ' + build + ' ' + item['name'])
        for program in item.get('d3d11Programs', []):
            if hashlib.sha256(base64.b64decode(program['bytecode'], validate=True)).hexdigest() != program['sha256']:
                raise ValueError('Original shader bytecode checksum: ' + build + ' ' + item['name'])
    fonts = [{key: value for key, value in item.items() if key not in ('fontData', 'rawObject')} for item in data['fonts']]
    result = {'schema': 1, 'scope': 'native minion mesh, material, shader and text; texture bytes excluded',
              'version': data['source']['version'], 'source': data['source'], 'prefabs': data['prefabs'],
              'assets': assets, 'fonts': fonts, 'classColors': data['classColors'],
              'localizedFontDefsKoKR': data.get('localizedFontDefsKoKR', [])}
    if 'originalTextRuntime' in data:
        runtime = data['originalTextRuntime']
        result['originalTextRuntime'] = {k: v for k, v in runtime.items() if k != 'managedModules'}
        result['originalTextRuntime']['managedModules'] = [{k: v for k, v in m.items() if k in ('name', 'sha256')} for m in runtime['managedModules']]
    packed = gzip.compress(api.encoded(result), mtime=0)
    if json.loads(gzip.decompress(packed)) != result:
        raise ValueError('Snapshot serialization mismatch')
    return packed, len(assets)


def main():
    index = json.loads(index_path.read_bytes())
    remote = 'https://github.com/qxwd565/legacy.git'
    api.git('fetch', '--no-tags', '--filter=blob:none', remote, 'main')
    parent = api.git('rev-parse', 'FETCH_HEAD').decode().strip()
    tree = api.tree_entries(parent)
    catalog = json.loads(get(parent, 'index.json'))
    updates, records = {}, {}
    for build in builds:
        name = 'historical-frames/native-snapshots/pc-1.0.0.' + build + '.json.gz'
        packed, count = snapshot(build)
        record = {'repository': repo, 'bytes': len(packed), 'sha256': hashlib.sha256(packed).hexdigest(),
                  'sourceVersions': ['1.0.0.' + build], 'scope': 'native-snapshot-without-textures'}
        catalog['files'][name] = record
        updates[name] = api.git('hash-object', '-w', '--stdin', data=packed).decode().strip()
        records[name] = (packed, record)
        print(json.dumps({'version': '1.0.0.' + build, 'nonTextureAssets': count, 'bytes': len(packed)}), flush=True)
    updates['index.json'] = api.git('hash-object', '-w', '--stdin', data=api.encoded(catalog)).decode().strip()
    tree['frame'] = ('040000', 'tree', api.overlay_tree(tree['frame'][2], updates))
    commit = api.git('commit-tree', api.write_tree(tree), '-p', parent,
                     data=b'Add original beta minion meshes, shaders and text snapshots without textures\n').decode().strip()
    changed = set(api.git('diff-tree', '--no-commit-id', '--name-only', '-r', parent, commit).decode().splitlines())
    if changed != {'frame/index.json'} | {'frame/' + name for name in records}:
        raise ValueError('Unexpected changes in beta snapshot commit')
    api.git('push', remote, commit + ':refs/heads/main')
    for name, (packed, record) in records.items():
        if get(commit, name) != packed:
            raise ValueError('Public read-back mismatch: ' + name)
        path = destination / name
        path.parent.mkdir(parents=True, exist_ok=True)
        if path.exists() and path.read_bytes() != packed:
            raise FileExistsError('Existing different native snapshot: ' + name)
        path.write_bytes(packed)
        index['files'][name] = record
    index['repositories'][repo] = {'commit': commit, 'base': f'https://raw.githubusercontent.com/qxwd565/{repo}/{commit}/frame/'}
    index_path.write_bytes(api.encoded(index))
    print(json.dumps({'repository': repo, 'commit': commit, 'snapshots': len(records)}), flush=True)


if __name__ == '__main__':
    main()
