"""Build the requested PC texture history from existing client exports."""
import hashlib
import gzip
import io
import json
import pathlib
import sys

from PIL import Image

sys.path.insert(0, r'E:\hearthstone card\tools\unitypy')
import UnityPy
from UnityPy.export.Texture2DConverter import parse_image_data

ROOT = pathlib.Path(__file__).resolve().parent.parent
SOURCE = ROOT / 'v7.14.4-webgpu-20261109/assets/unity/historical-frames'
OUTPUT = SOURCE / 'texture-history'
COMPARISON = pathlib.Path(r'E:\hearthstone card\하수인 프레임 텍스처 비교')
CLIENT = pathlib.Path(r'E:\HSPlus\development\.codex-work\beta-extracted-20261101\1.0.0.3664\Data')
NAMES = ('caustic1 clouds3 clouds4 clouds7 FlowMapTunnel Gem_Attack_D Gem_Attack_Premium '
         'Gem_Health_D Gem_Health_Premium Gem_Mana_D Lines motes01 RarityGems Set1_Icon '
         'sidelines white32x32 Black32x32 Bubbles').split()
DATES = {'1.0.0.3664': '2013-08-17', '1.0.0.3890': '2013-10-03', '1.0.0.4217': '2013-12-12'}
ARCHIVE = pathlib.Path(r'E:\hearthstone card\하수인 원본 렌더\원본 추출')


def hash_pixels(image):
    return hashlib.sha256(image.convert('RGBA').tobytes()).hexdigest()


def original_missing(names):
    found = {}
    for bundle in CLIENT.glob('*.unity3d'):
        for obj in UnityPy.load(str(bundle)).objects:
            if obj.type.name != 'Texture2D' or obj.peek_name() not in names:
                continue
            value = obj.read()
            image = parse_image_data(value.get_image_data(), value.m_Width, value.m_Height,
                value.m_TextureFormat, obj.version, obj.platform, getattr(value, 'm_PlatformBlob', None), False).convert('RGBA')
            name = obj.peek_name()
            if name in found and hash_pixels(found[name]) != hash_pixels(image):
                raise ValueError('Ambiguous 3664 texture ' + name)
            found[name] = image
        if found.keys() >= names:
            break
    if found.keys() != names:
        raise ValueError('Missing 3664 textures: ' + repr(names - found.keys()))
    return found


def main():
    rows = {}
    snapshots = {version: json.loads(gzip.decompress((ARCHIVE / ('PC ' + version + '.json.gz')).read_bytes()))
                 for version in DATES}
    missing = {name for name in NAMES if name != 'FlowMapTunnel' and not list((COMPARISON / name).glob('PC 1.0.0.3664 - *.png'))}
    extracted = original_missing(missing)
    for name in NAMES:
        versions = ['1.0.0.3890'] if name == 'FlowMapTunnel' else ['1.0.0.3664']
        if name == 'clouds7': versions += ['1.0.0.3890', '1.0.0.4217']
        if name == 'motes01': versions += ['1.0.0.4217']
        entries = []
        for version in versions:
            matches = list((COMPARISON / name).glob('PC ' + version + ' - *.png'))
            if version == '1.0.0.3664' and name in extracted:
                image = extracted[name]
                # Verify source pixels against a separately archived identical copy.
                reference = next((COMPARISON / name).glob('PC *.png'))
                with Image.open(reference) as check:
                    if hash_pixels(image) != hash_pixels(check):
                        raise ValueError('3664 reference differs: ' + name)
            elif len(matches) == 1:
                with Image.open(matches[0]) as src: image = src.convert('RGBA')
            else:
                raise ValueError('Texture input unavailable: ' + name + ' ' + version)
            stream = io.BytesIO(); image.save(stream, format='PNG')
            data = stream.getvalue(); path = OUTPUT / version / (name + '.png')
            path.parent.mkdir(parents=True, exist_ok=True)
            if path.exists() and path.read_bytes() != data:
                raise FileExistsError(str(path))
            path.write_bytes(data)
            entry = {'version': version, 'effectiveFromKst': DATES[version],
                'file': 'texture-history/' + version + '/' + name + '.png',
                'width': image.width, 'height': image.height, 'rgbaSha256': hash_pixels(image),
                'pngSha256': hashlib.sha256(data).hexdigest()}
            sources = [item for item in snapshots[version]['assets'] if item['type'] == 28 and item['name'] == name]
            if len(sources) == 1:
                if sources[0]['rgbaSha256'] != entry['rgbaSha256']:
                    raise ValueError('Archived source pixel mismatch: ' + name + ' ' + version)
                entry['sampler'] = sources[0]['sampler']
            entries.append(entry)
        rows[name] = entries
    # The two premium materials that use clouds7 have unchanged original
    # bindings, and their D3D11 shader programs match between 3890 and 4217.
    evidence = []
    for material in ['Card_Inhand_Premium', 'Card_InHand_BannerAtlas_Premium']:
        pair = [next(a for a in snapshots[v]['assets'] if a['type'] == 21 and a['name'] == material)
                for v in ('1.0.0.3890', '1.0.0.4217')]
        if pair[0]['sourceSha256'] != pair[1]['sourceSha256']:
            raise ValueError('Changed material binding: ' + material)
        evidence.append({'material': material, 'objectSha256': pair[0]['sourceSha256']})
    shaders = [next(a for a in snapshots[v]['assets'] if a['type'] == 48 and a['name'] == 'Card_UnlitTextureReflection')
               for v in ('1.0.0.3890', '1.0.0.4217')]
    programs = [[p['sha256'] for p in shader['d3d11Programs']] for shader in shaders]
    if not programs[0] or programs[0] != programs[1]: raise ValueError('Changed clouds7 shader programs')
    manifest = {'schema': 1, 'platform': 'Windows', 'basis': 'first observed source build; resolution-only differences omitted',
        'flowMapNote': 'Not found by name in 3664 or 3749 indexed Unity assets; 3890 is the first confirmed source.',
        'clouds7Compatibility': {'versions': ['1.0.0.3890', '1.0.0.4217'], 'materials': evidence, 'd3d11Programs': programs[0]},
        'textures': rows}
    (OUTPUT / 'index.json').write_text(json.dumps(manifest, ensure_ascii=False, separators=(',', ':'))+'\n', encoding='utf-8')
    print(json.dumps({'textures': len(rows), 'variants': sum(map(len, rows.values()))}))


if __name__ == '__main__': main()
