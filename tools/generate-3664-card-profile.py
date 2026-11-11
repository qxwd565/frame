"""Build spell/weapon render profiles from the archived 3664 PC objects."""
import copy
import gzip
import hashlib
import importlib.util
import json
import pathlib
import re
import sys

sys.dont_write_bytecode = True
ROOT = pathlib.Path(__file__).resolve().parent.parent
HIST = ROOT / 'v7.14.4-webgpu-20261109/assets/unity/historical-frames'

def read(name):
    return json.loads(gzip.decompress((HIST / name).read_bytes()))

def digest(data):
    return hashlib.sha256(data).hexdigest()

spec = importlib.util.spec_from_file_location('profile_helpers', ROOT / 'tools/generate-pc-4217-minion.py')
helpers = importlib.util.module_from_spec(spec)
spec.loader.exec_module(helpers)
spec = importlib.util.spec_from_file_location('components', r'E:\HSPlus\development\scripts\export-historical-components.py')
components = importlib.util.module_from_spec(spec)
spec.loader.exec_module(components)

snap = read('early-native/snapshots/pc-1.0.0.3664.json.gz')
old = read('native-snapshots/pc-1.0.0.3664.json.gz')
minion = read('minion(2013-08-17).json.gz')
mip_report = json.loads(pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교\베타-오리지널 원본 텍스처 밉맵.json').read_text(encoding='utf-8'))
mips = {row['key']: row for version in mip_report['versions']
        if version['source']['version'] == '1.0.0.3664' and version['source']['platform'] == 'Windows'
        for row in version['textures']}
assets = {x['key']: x for x in snap['assets']}
by_name = {}
for asset in snap['assets']:
    by_name.setdefault((asset['type'], asset.get('name')), []).append(asset)

# The already validated minion bank contains these exact 3664 programs.
shader_aliases = {}
for name, material in minion['materials'].items():
    candidates = by_name.get((21, name), [])
    for row in candidates:
        ref = row['properties']['m_Shader']['ref']
        if ref in assets:
            original = assets[ref]['name']
            existing = shader_aliases.setdefault(original, material['shader'])
            if existing != material['shader']:
                raise ValueError('Ambiguous original shader mapping: ' + original)
shader_aliases.update({
    'Self-Illumin_Diffuse': 'Native/PC3664/Self-Illumin_Diffuse',
    'Unlit_TransparentColor': 'Native/PC3664/Unlit_TransparentColor',
})

classes = ['NEUTRAL', 'WARLOCK', 'ROGUE', 'DRUID', 'SHAMAN', 'HUNTER', 'MAGE', 'PALADIN', 'PRIEST', 'WARRIOR']
roles = ['m_nameTextMesh', 'm_powersTextMesh', 'm_costTextMesh', 'm_attackTextMesh', 'm_healthTextMesh']
prefabs = [x for x in snap['prefabs'] if x['name'] in (
    'Card_Hand_Ability', 'Card_Hand_Ability_Premium', 'Card_Hand_Weapon', 'Card_Hand_Weapon_Premium')]
if len(prefabs) != 4:
    raise ValueError('Missing original 3664 spell or weapon prefab')

selected = {}
for prefab in prefabs:
    actor = next(c['settings'] for c in prefab['nodes'][0]['components'] if 'm_cardFrontMatIdx' in c.get('settings', {}))
    selected[prefab['name']] = [role for role in roles if actor.get(role, {}).get('ref')]
text = components.beta_text_profile('3664', selected)
textures, meshes, materials, packages, texts = {}, {}, {}, [], {}

def texture(key):
    item = assets[key]
    if item['type'] != 28 or not item.get('png'):
        raise ValueError('Missing original texture: ' + key)
    if key not in textures:
        mip = mips.get(key)
        if not mip or mip['unityFormat'] not in (10, 12) or not mip.get('levels') or mip['nativeSha256'] != item['nativeSha256']:
            raise ValueError('Original DXT texture/mip metadata unavailable: ' + item['name'])
        textures[key] = {'name': item['name'], 'width': item['width'], 'height': item['height'],
            'rgbaSha256': item['rgbaSha256'], 'encoding': 'unity-dxt-mips', 'file': item['nativeImage']['file'],
            'nativeSha256': mip['nativeSha256'], 'nativeBytes': mip['nativeBytes'], 'unityFormat': mip['unityFormat'],
            'mipmapped': mip['mipmapped'], 'levels': mip['levels'], 'sampler': item['sampler']}
    return key

def mesh(key):
    item = assets[key]
    if item['type'] != 43:
        raise ValueError('Missing original mesh: ' + key)
    meshes.setdefault(key, {'name': item['name'], **item['mesh']})
    return key

def material(key):
    if key in materials:
        return key
    item = assets[key]
    prop = item['properties']
    shader = assets[prop['m_Shader']['ref']]
    if shader['name'] not in shader_aliases:
        raise ValueError('Unconverted original shader: ' + shader['name'])
    source = gzip.decompress((HIST / shader['shaderSource']['file']).read_bytes())
    if digest(source) != shader['shaderSource']['rawSha256']:
        raise ValueError('Original shader changed: ' + shader['name'])
    head = source.decode('utf-8', 'replace').split('Program "vp"')[0]
    values = {}
    for name, value in re.findall(r'\b(\w+)\s*\("[^"\n]*",\s*(?:Float|Range\([^)]*\))\)\s*=\s*([-+.0-9eE]+)', head):
        values[name] = [float(value)]
    for name, value in re.findall(r'\b(\w+)\s*\("[^"\n]*",\s*(?:Color|Vector)\)\s*=\s*\(([^)]+)\)', head):
        values[name] = list(map(float, value.split(',')))
    saved = prop['m_SavedProperties']
    values.update({k: [v] for k, v in saved['m_Floats'].items()})
    values.update({k: [v[c] for c in ('r', 'g', 'b', 'a')] if isinstance(v, dict) else v for k, v in saved['m_Colors'].items()})
    bindings = {}
    for name, value in saved['m_TexEnvs'].items():
        ref = value['m_Texture']['ref']
        if ref:
            bindings[name] = {'key': texture(ref), 'st': [value['m_Scale']['x'], value['m_Scale']['y'], value['m_Offset']['x'], value['m_Offset']['y']]}
    keywords = prop.get('m_ShaderKeywords', [])
    if shader['name'] == 'Self-Illumin_Diffuse':
        # Match the explicitly controlled original D3D comparison lighting.
        keywords = ['DIRECTIONAL', 'SHADOWS_OFF', 'LIGHTMAP_OFF', 'DIRLIGHTMAP_OFF']
    materials[key] = {'name': item['name'], 'shader': shader_aliases[shader['name']], 'queue': prop.get('m_CustomRenderQueue', -1),
        'keywords': keywords, 'values': values, 'textures': bindings}
    return key

class_tables = {}
for kind, field in [('SPELL', 'spellCardTextures'), ('WEAPON', 'weaponCardTextures')]:
    refs = old['classColors'][field]
    if len(refs) != len(classes):
        raise ValueError('Unexpected source class table: ' + kind)
    class_tables[kind] = {name: texture(ref['ref']) for name, ref in zip(classes, refs)}

for prefab in prefabs:
    actor = next(c['settings'] for c in prefab['nodes'][0]['components'] if 'm_cardFrontMatIdx' in c.get('settings', {}))
    objects = {n['source']: n for n in prefab['nodes']}
    for n in prefab['nodes']:
        for c in n['components']:
            objects[c['source']] = n
    def object_path(role):
        owner = objects.get(actor.get(role, {}).get('ref'))
        return owner['path'] if owner else None
    dynamic = {k: object_path(k) for k in ['m_cardMesh', 'm_portraitMesh', 'm_descriptionMesh', 'm_rarityFrameMesh', 'm_rarityGemMesh', 'm_eliteObject', 'm_racePlateObject']}
    nodes = []
    for n in prefab['nodes']:
        path = n['path']
        enabled = any(r['settings'].get('m_Enabled') for r in n.get('renderers', []))
        if not n.get('mesh') or not n.get('materials') or not n['gameObject'].get('m_IsActive') or not enabled:
            continue
        if any(part in path for part in ('CurvedText', 'GhostCard', 'FakeShadow')) or any(path.startswith(p['path'] + '/') and not p['gameObject'].get('m_IsActive') for p in prefab['nodes']):
            continue
        slots = []
        for index, key in enumerate(n['materials']):
            if not key or (path == dynamic['m_cardMesh'] and index == actor['m_cardBackMatIdx']):
                continue
            if assets[key]['name'] == 'Card_Back_Default_D':
                continue
            slots.append({'slot': index, 'material': material(key)})
        if slots:
            nodes.append({'path': path, 'mesh': mesh(n['mesh']), 'pose': helpers.pose(prefab, path), 'legendary': False, 'slots': slots})
    packages.append({'name': prefab['name'], 'kind': 'SPELL' if 'Ability' in prefab['name'] else 'WEAPON',
        'golden': prefab['name'].endswith('_Premium'), 'nodes': nodes, 'dynamic': dynamic,
        'actor': {k: actor[k] for k in ['m_cardFrontMatIdx', 'm_portraitMatIdx', 'm_portraitFrameMatIdx', 'm_premiumRibbon']}})
    texts[prefab['name']] = {}

for row in text['rows']:
    role = row['role']
    fallback = minion['texts']['Card_Hand_Ally_Premium' if row['prefab'].endswith('_Premium') else 'Card_Hand_Ally'][role]
    settings = row['settings']
    locale = settings.get('m_LocalizedSettings', {})
    if isinstance(locale.get('m_LocaleAdjustments'), list):
        locale['m_LocaleAdjustments'] = {'Array': locale['m_LocaleAdjustments']}
    target = row.get('mesh')
    if target:
        mesh(target['key'])
    texts[row['prefab']][role] = {'settings': settings, 'font': fallback.get('font'), 'useCurrentFont': fallback.get('useCurrentFont', False),
        'binding': {'sourcePose': row['sourcePose'], 'destinationPose': row['destinationPose']}, 'mesh': target['key'] if target else None}

out = {'schema': 1, 'version': '1.0.0.3664', 'source': snap['source'], 'classes': class_tables, 'palette': minion['palette'],
    'packages': packages, 'textures': textures, 'meshes': meshes, 'materials': materials, 'texts': texts,
    'fonts': minion['fonts'], 'fontSettings': minion['fontSettings'], 'textShaders': minion['textShaders']}
encoded = (json.dumps(out, ensure_ascii=False, sort_keys=True, separators=(',', ':')) + '\n').encode()
packed = gzip.compress(encoded, mtime=0)
path = HIST / 'card-3664-spell-weapon.json.gz'
if path.exists() and path.read_bytes() != packed and '--replace' not in sys.argv:
    raise ValueError('Existing profile differs: ' + str(path))
path.write_bytes(packed)
print(json.dumps({'file': str(path), 'sha256': digest(packed), 'bytes': len(packed), 'packages': len(packages),
                  'textures': len(textures), 'meshes': len(meshes), 'materials': len(materials)}))
