"""Publishable, byte-verified 3664 hand-effect texture sources."""
import base64
import csv
import gzip
import hashlib
import importlib.util
import json
import pathlib
import sys

sys.dont_write_bytecode = True
ROOT = pathlib.Path(__file__).resolve().parent.parent
HIST = ROOT / 'v7.14.4-webgpu-20261109/assets/unity/historical-frames'
COMPARISON = pathlib.Path(r'E:\hearthstone card\하수인 프레임 텍스처 비교')
spec = importlib.util.spec_from_file_location('components', r'E:\HSPlus\development\scripts\export-historical-components.py')
components = importlib.util.module_from_spec(spec)
spec.loader.exec_module(components)
spec = importlib.util.spec_from_file_location('texture_mips', ROOT / 'tools/audit-original-texture-mips.py')
mips = importlib.util.module_from_spec(spec)
spec.loader.exec_module(mips)
sha = lambda b: hashlib.sha256(b).hexdigest()
names = {'AllyInHandSummonForge', 'AllyInHandSummon_Lrg', 'AllyInHandSummon_Premium', 'AllyInHandTwistedGlow',
         'AllyInHandSummon', 'AllyInHandFuse', 'AllyInHandBurn1', 'AllyInHandExchangeDis1'}
with (COMPARISON / '중복 정리 내역.csv').open(encoding='utf-8-sig', newline='') as source:
    rows = {r['Texture']: r for r in csv.DictReader(source)
            if r['Texture'] in names and r['Version'] == '1.0.0.3664' and r['Platform'] == 'PC'}
if set(rows) != names:
    raise ValueError('Missing original comparison records')

def put(kind, raw, suffix, compress=False):
    payload = gzip.compress(raw, mtime=0) if compress else raw
    path = 'early-native/objects/' + kind + '/' + sha(raw) + suffix
    target = HIST / path
    if target.exists() and target.read_bytes() != payload:
        raise ValueError('Conflicting object: ' + path)
    if not target.exists():
        target.write_bytes(payload)
    return {'file': path, 'bytes': len(payload), 'sha256': sha(payload), 'rawBytes': len(raw), 'rawSha256': sha(raw)}

a = components.beta_archive('3664')
results = []
sample = None
try:
    for name in sorted(names):
        row = rows[name]
        obj = a.obj(row['SourceUnityID'])
        tree = obj.read_typetree()
        if tree['m_Name'] != name:
            raise ValueError('Original name mismatch: ' + name)
        a.include(row['SourceUnityID'])
        value = a.assets.pop(row['SourceUnityID'])
        pixels = gzip.decompress(base64.b64decode(value['data']))
        if sha(pixels) != row['RGBA_SHA256']:
            raise ValueError('Original RGBA pixels mismatch: ' + name)
        native = obj.read().get_image_data()
        if sha(native) != value['nativeSha256']:
            raise ValueError('Original native texture bytes mismatch: ' + name)
        png = (COMPARISON / pathlib.PureWindowsPath(row['FirstFile'])).read_bytes()
        levels = mips.levels(tree['m_Width'], tree['m_Height'], tree['m_TextureFormat'], bool(tree['m_MipMap']), len(native))
        results.append({'name': name, 'sourceVersion': '1.0.0.3664', 'sourceKey': row['SourceUnityID'],
            'width': tree['m_Width'], 'height': tree['m_Height'], 'rgbaSha256': sha(pixels), 'sampler': value['sampler'],
            'unityFormat': tree['m_TextureFormat'], 'mipmapped': bool(tree['m_MipMap']), 'nativeBytes': len(native),
            'nativeSha256': sha(native), 'levels': levels, 'png': put('texture', png, '.png'),
            'nativeImage': put('texture-native', native, '.bin.gz', True),
            'originalObject': put('unity-object', obj.get_raw_data(), '.bin.gz', True)})
    # This comparison image is card artwork, not a shared frame texture. Keep
    # it separately, with its actual original cards bundle and object identity.
    from PIL import Image
    import io
    cards = pathlib.Path(r'E:\HSPlus\development\.codex-work\beta-extracted-20261101\1.0.0.3664\Data\cards.unity3d')
    a.env.load_file(cards.read_bytes(), name=cards.name)
    key = 'cab-d9cf4cf9d6f3d28499aaac1000d39d77:3794'
    obj = a.obj(key)
    if obj.peek_name() != 'PROMO_001_D':
        raise ValueError('Original comparison artwork object changed')
    a.include(key)
    value = a.assets.pop(key)
    pixels = gzip.decompress(base64.b64decode(value['data']))
    png = (COMPARISON / 'PROMO_001_D' / '1.0.0.3664 - PROMO_001_D.png').read_bytes()
    if Image.open(io.BytesIO(png)).convert('RGBA').tobytes() != pixels:
        raise ValueError('Original comparison artwork pixels changed')
    native = obj.read().get_image_data()
    sample = {'name': 'PROMO_001_D', 'role': 'comparison-artwork', 'sourceVersion': '1.0.0.3664',
              'sourceBundle': 'cards.unity3d', 'sourceKey': key, 'width': value['width'], 'height': value['height'],
              'rgbaSha256': sha(pixels), 'png': put('texture', png, '.png'),
              'nativeImage': put('texture-native', native, '.bin.gz', True),
              'originalObject': put('unity-object', obj.get_raw_data(), '.bin.gz', True)}
finally:
    a.close()

manifest = {'schema': 1, 'sourceVersion': '1.0.0.3664', 'scope': 'Original hand-effect textures; their particle-system behavior is separate.', 'textures': results, 'sampleArt': sample}
content = (json.dumps(manifest, ensure_ascii=False, sort_keys=True, separators=(',', ':')) + '\n').encode()
path = HIST / 'early-native/pc-1.0.0.3664-effects.json'
if path.exists() and path.read_bytes() != content and '--replace' not in sys.argv:
    raise ValueError('Conflicting effect manifest')
if not path.exists() or '--replace' in sys.argv:
    path.write_bytes(content)
print(json.dumps({'path': str(path), 'textures': len(results), 'bytes': len(content), 'sha256': sha(content)}))
