"""Preserve the 3664 summon effect's original Unity objects and fields.

This is source evidence, not a claim that its particle simulator is ported.
"""
import gzip
import hashlib
import importlib.util
import json
import math
import pathlib
import sys
import base64

sys.dont_write_bytecode = True
ROOT = pathlib.Path(__file__).resolve().parent.parent
HISTORY = ROOT / 'v7.14.4-webgpu-20261109/assets/unity/historical-frames'
spec = importlib.util.spec_from_file_location('components', r'E:\HSPlus\development\scripts\export-historical-components.py')
components = importlib.util.module_from_spec(spec)
spec.loader.exec_module(components)
archive = components.beta_archive('3664')

def digest(data):
    return hashlib.sha256(data).hexdigest()

def sanitize(value):
    if isinstance(value, float) and not math.isfinite(value):
        return 'Infinity' if value > 0 else '-Infinity' if value < 0 else 'NaN'
    if isinstance(value, dict):
        return {k: sanitize(v) for k, v in value.items()}
    if isinstance(value, (list, tuple)):
        return [sanitize(v) for v in value]
    if isinstance(value, bytes):
        return {'bytes': len(value), 'sha256': digest(value)}
    return value

def store(raw):
    name = digest(raw)
    relative = 'early-native/objects/unity-object/' + name + '.bin.gz'
    target = HISTORY / relative
    data = gzip.compress(raw, mtime=0)
    if target.exists():
        data = target.read_bytes()
        if gzip.decompress(data) != raw:
            raise ValueError('Conflicting source object: ' + str(target))
    else:
        target.write_bytes(data)
    return {'file': relative, 'rawSha256': name, 'sha256': digest(data), 'rawBytes': len(raw)}

# IDs come from the actual Card_Hand_Ally_SpellTable/SummonIn hierarchy.
selected = {
    3383: 'ScryLines GameObject', 6356: 'ScryLines Transform',
    10919: 'ScryLines MeshFilter', 9269: 'ScryLines MeshRenderer',
    12429: 'ScryLines Animation', 1218: 'WeldSparkQuad Mesh',
    1615: 'AllyInHandScryLines AnimationClip',
    1616: 'AllyInHandScryLines_Forge AnimationClip',
    84: 'ScryLines Material', 596: 'AllyInHandSummon Texture2D',
    3440: 'FX_BlueRays GameObject', 6448: 'FX_BlueRays Transform',
    12871: 'FX_BlueRays ParticleSystem', 13273: 'FX_BlueRays ParticleSystemRenderer',
    103: 'FX_BlueMotes_Grave Material', 724: 'moteB Texture2D',
    1551: 'Additive Shader',
}
actor = next(obj.assets_file for obj in archive.env.objects
             if obj.type.name == 'GameObject' and obj.read().m_Name == 'Card_Hand_Ally')
entries = []
for path_id, role in selected.items():
    obj = actor.objects[path_id]
    raw = obj.get_raw_data()
    tree = sanitize(archive.normalize(obj.read_typetree(), obj.assets_file))
    entries.append({'role': role, 'sourceKey': archive.key(obj), 'type': obj.type.name,
                    'sourceObject': store(raw), 'fields': tree})
main_data = pathlib.Path(r'E:\HSPlus\development\.codex-work\beta-extracted-20261101\1.0.0.3664\Hearthstone_Data\mainData')
main_bytes = main_data.read_bytes()
quality_env = components.native.UnityPy.load(main_bytes)
qualities = [obj for obj in quality_env.objects if obj.type.name == 'QualitySettings']
if len(qualities) != 1:
    raise ValueError('Original 3664 QualitySettings unavailable or ambiguous')
quality = qualities[0]
result = {'schema': 1, 'sourceVersion': '1.0.0.3664',
          'sourceHierarchy': 'Card_Hand_Ally_SpellTable/SummonIn/GameObjectContainer',
          'sourceBundles': archive.evidence()['bundles'], 'objects': entries,
          'qualitySettings': {'sourceFile': 'Hearthstone_Data/mainData', 'fileSha256': digest(main_bytes),
                              'sourceObject': store(quality.get_raw_data()), 'fields': sanitize(quality.read_typetree())},
          'limitations': ['Source settings alone do not establish exact runtime event timing or random particle trajectories.']}
data = (json.dumps(result, ensure_ascii=False, sort_keys=True, separators=(',', ':'), allow_nan=False) + '\n').encode('utf-8')
path = HISTORY / 'early-native/pc-1.0.0.3664-summon-source.json'
if path.exists() and path.read_bytes() != data and '--replace' not in sys.argv:
    raise ValueError('Existing source manifest differs; use --replace after review')
path.write_bytes(data)
print(json.dumps({'path': str(path), 'objects': len(entries), 'sha256': digest(data), 'bytes': len(data)}))

# Runtime package preserves the source mesh and the decoded image bytes. The
# original serialized objects remain separately addressable above.
def transform_chain(path_id):
    chain = []
    seen = set()
    obj = actor.objects[path_id]
    while obj:
        key = archive.key(obj)
        if key in seen:
            raise ValueError('Transform parent cycle')
        seen.add(key)
        tree = obj.read_typetree()
        game = archive.obj(archive.ref(tree['m_GameObject'], obj.assets_file))
        chain.append({'name': game.read().m_Name, 'sourceKey': key,
                      'position': tree['m_LocalPosition'], 'rotation': tree['m_LocalRotation'], 'scale': tree['m_LocalScale']})
        parent = archive.ref(tree['m_Father'], obj.assets_file)
        obj = archive.obj(parent) if parent else None
    return list(reversed(chain))

def include(path_id):
    key = archive.key(actor.objects[path_id])
    archive.include(key)
    return archive.assets[key]

def texture(path_id):
    entry = dict(include(path_id))
    obj = actor.objects[path_id]
    tree = obj.read_typetree()
    raw = obj.read().get_image_data()
    fmt = tree['m_TextureFormat']
    if fmt not in (10, 12):
        raise ValueError('Unsupported original summon texture format')
    width, height, pos, levels = tree['m_Width'], tree['m_Height'], 0, []
    while True:
        size = max(1, (width + 3) // 4) * max(1, (height + 3) // 4) * (8 if fmt == 10 else 16)
        levels.append({'width': width, 'height': height, 'offset': pos, 'bytes': size})
        pos += size
        if not tree['m_MipMap'] or (width == 1 and height == 1):
            break
        width, height = max(1, width // 2), max(1, height // 2)
    if pos != len(raw):
        raise ValueError('Unexpected original summon texture mip data')
    entry.update(unityFormat=fmt, mipmapped=bool(tree['m_MipMap']), nativeBytes=len(raw),
                 levels=levels, nativeData=base64.b64encode(gzip.compress(raw, mtime=0)).decode('ascii'))
    return entry

runtime = {'schema': 1, 'sourceVersion': '1.0.0.3664',
           'mesh': include(1218), 'scryTexture': texture(596), 'particleTexture': texture(724),
           'scryChain': transform_chain(6356), 'particleChain': transform_chain(6448),
           'scryMaterial': next(x['fields'] for x in entries if x['role'] == 'ScryLines Material'),
           'particleMaterial': next(x['fields'] for x in entries if x['role'] == 'FX_BlueMotes_Grave Material'),
           'animation': next(x['fields'] for x in entries if x['role'] == 'AllyInHandScryLines AnimationClip'),
           'particleSystem': next(x['fields'] for x in entries if x['role'] == 'FX_BlueRays ParticleSystem'),
           'particleRenderer': next(x['fields'] for x in entries if x['role'] == 'FX_BlueRays ParticleSystemRenderer')}
raw = (json.dumps(sanitize(runtime), ensure_ascii=False, sort_keys=True, separators=(',', ':'), allow_nan=False) + '\n').encode('utf-8')
packed = gzip.compress(raw, mtime=0)
out = HISTORY / 'native-3664-summon.json.gz'
if out.exists() and gzip.decompress(out.read_bytes()) != raw and '--replace' not in sys.argv:
    raise ValueError('Existing runtime package differs; use --replace after review')
if not out.exists() or '--replace' in sys.argv:
    out.write_bytes(packed)
print(json.dumps({'path': str(out), 'sha256': digest(out.read_bytes()), 'bytes': out.stat().st_size}))
