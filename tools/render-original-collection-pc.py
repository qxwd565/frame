"""Prototype: render a PC source card through its collection camera.

Source textures/meshes/shader bytecode are kept at original size. The screen
resolution is an explicit input, since it is not an intrinsic card dimension.
This diagnostic excludes text and card-specific golden-art animation.
"""
import ast
import base64
import copy
import gzip
import hashlib
import json
import pathlib
import re
import struct
import subprocess
import sys
import collections

import numpy as np
from PIL import Image

ROOT = pathlib.Path(r'E:\HSdeck\frame\v7.14.4-webgpu-20261109\assets\unity\historical-frames')
EXTRACTED = pathlib.Path(r'E:\hearthstone card\하수인 원본 렌더\원본 추출')
REPORTS = pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교')
SOURCE = pathlib.Path(r'E:\HSPlus\development\scripts\render-native-beta-archive.py')

build = sys.argv[1]
family = sys.argv[2]
card_class = sys.argv[3]
golden = sys.argv[4] == 'golden'
render_time = float(sys.argv[sys.argv.index('--time')+1]) if '--time' in sys.argv else 0.0
rarity = sys.argv[sys.argv.index('--rarity')+1] if '--rarity' in sys.argv else 'FREE'
if rarity not in ('FREE','LEGENDARY'): raise ValueError('Unsupported comparison rarity')
if not np.isfinite(render_time) or render_time < 0: raise ValueError('Invalid render time')
replacement_build = sys.argv[sys.argv.index('--replace-half-from')+1] if '--replace-half-from' in sys.argv else None
if replacement_build and replacement_build not in ['3664','3749','3890','3937','4217','4243','4458','4482']:
    raise ValueError('Unsupported replacement build')
if build not in ['3664','3749','3890','3937','4217','4243','4458','4482','4944']:
    raise ValueError('Unsupported source build')
sequence = ['3664','3749','3890','3937','4217','4243','4458','4482','4944']
if replacement_build and (sequence.index(build)==0 or sequence[sequence.index(build)-1] != replacement_build):
    raise ValueError('Replacement must use the immediately preceding source build')
if family not in ['Ally','Ability','Weapon']:
    raise ValueError('Unsupported source family')

doc = json.loads(gzip.decompress((ROOT / ('early-native/snapshots/pc-1.0.0.'+build+'.json.gz')).read_bytes()))
old = json.loads(gzip.decompress((EXTRACTED / ('PC 1.0.0.'+build+'.json.gz')).read_bytes()))
camera_data = json.loads((REPORTS / '베타-오리지널 원본 카메라.json').read_text(encoding='utf-8'))
version = '1.0.0.' + build
cam = next(x for x in camera_data['cameras'] if x['platform']=='PC' and x['version']==version and x['camera']=='TheBoxCamera')
anchors = [x for x in camera_data['collectionAnchors'] if x['platform']=='PC' and x['version']==version and x['anchor']=='8_CollectionCardStartPosition']
anchor = next((x for x in anchors if any(t['name']=='CollectionPageA' for t in x['transformChain'])), anchors[0])
layouts = json.loads((REPORTS / '베타-오리지널 수집품 배치 코드.json').read_text(encoding='utf-8'))
layout = next(x for x in layouts['versions'] if x['version']==version)
method = next(m for m in layout['methods'] if 'CollectionPageDisplay::GetCollectionCardVisual' in m['name'])
if not any('ldc.r4 0.73' in s for s in method['instructions']):
    raise ValueError('Collection eight-card scale is not verified for this build')
page = next(m for m in layout['methods'] if 'CollectionPageManager::.cctor' in m['name'])
page_text = '\n'.join(page['instructions'])
if not re.search(r'ldc\.r4 0\n.*ldc\.r4 0\.25\n.*ldc\.r4 0\n.*Vector3::.ctor.*\n.*CURRENT_PAGE_LOCAL_POS', page_text):
    raise ValueError('Current collection page position is not verified for this build')

# Reuse the existing source-bytecode D3D draw builder, keeping all source data
# in memory. Override its illustrative camera position with the extracted one.
script = SOURCE.read_text(encoding='utf-8')
start = script.index('def enc(b):')
end = script.index('XML=ET.fromstring', start)
body = script[start:end].replace("'_WorldSpaceCameraPos':[0,12,0,0]", "'_WorldSpaceCameraPos':CAMERA_POS")
body = body[:body.index('fontdir=')] + body[body.index('def trs('):]
body = body.replace("'unity_Scale':[1,1,1,1]", "'unity_Scale':[1,1,1,1/float(np.linalg.norm(model[:3,0]))]")
body = body.replace(" for k,t in props['m_TexEnvs'].items():values[k+'_ST']",
    " values.update({k:[0,0,0,0] for k in ['unity_SHAr','unity_SHAg','unity_SHAb','unity_SHBr','unity_SHBg','unity_SHBb','unity_SHC']}); values['_WorldSpaceLightPos0']=[0,1,0,0]; values['_Time']=[RENDER_TIME/20,RENDER_TIME,RENDER_TIME*2,RENDER_TIME*3]; values['_SinTime']=[math.sin(RENDER_TIME/x) for x in (8,4,2,1)]; values['_CosTime']=[math.cos(RENDER_TIME/x) for x in (8,4,2,1)]; values['_ShaderTime']=[RENDER_TIME/20]\n for k,t in props['m_TexEnvs'].items():values[k+'_ST']")
tree = ast.parse(body)
code = compile(tree, str(SOURCE), 'exec')
ns = {'np':np, 'b64':base64, 'hashlib':hashlib, 'gzip':gzip, 'json':json, 'math':__import__('math'),
      'pathlib':pathlib, 're':re, 'struct':struct, 'subprocess':subprocess, 'Image':Image,
      'W':1920, 'H':1080, 'PROJ':np.eye(4)}
exec(code, ns)


def matrix(item):
    return ns['trs']({'position':item['position'], 'rotation':item['rotation'], 'scale':item['scale']})


def product(chain):
    value = np.eye(4)
    for item in reversed(chain):
        value = value @ matrix(item)
    return value


cam_transform = product(cam['transformChain'])
# Camera transforms ignore parent scale when constructing the view orientation;
# the hierarchy still contributes to the camera's world-space position.
rotation = cam_transform[:3,:3]
rotation = rotation / np.linalg.norm(rotation,axis=0)
camera_rigid = np.eye(4)
camera_rigid[:3,:3] = rotation
camera_rigid[:3,3] = cam_transform[:3,3]
view = np.linalg.inv(camera_rigid)
camera = cam['fields']
if camera['orthographic'] or camera['m_NormalizedViewPortRect'] != {'x':0.0,'y':0.0,'width':1.0,'height':1.0}:
    raise ValueError('Unsupported original collection camera')
width, height = 1920, 1080
near, far = camera['near clip plane'], camera['far clip plane']
f = 1.0 / np.tan(np.deg2rad(camera['field of view'])/2)
projection = np.array([[f/(width/height),0,0,0],[0,f,0,0],
                       [0,0,far/(far-near),-near*far/(far-near)],[0,0,1,0]],dtype=float)
chain = copy.deepcopy(anchor['transformChain'])
start_position = chain.pop(0)['position']
for entry in chain:
    if entry['name'] in ('CollectionPageA','CollectionPage'): entry['position']={'x':0.0,'y':0.25,'z':0.0}
actor = product(chain) @ matrix({'position':start_position,'rotation':{'x':0,'y':0,'z':0,'w':1},'scale':{'x':0.73,'y':0.73,'z':0.73}})
ns.update({'W':width, 'H':height, 'PROJ':projection @ view, 'CAMERA_POS':[*cam_transform[:3,3].tolist(),0], 'RENDER_TIME':render_time,
           'GPU_SCRIPT':re.search(r'GPU_SCRIPT=(".*")\nW,H=', script).group(1),
           'RES':{},'LIB':{},'DRAWS':[],'TEXTURES':{}})
ns['GPU_SCRIPT'] = ast.literal_eval(ns['GPU_SCRIPT'])
ns['draw'].__defaults__ = (projection @ view,)

assets = {}
all_mips = json.loads((REPORTS / '베타-오리지널 원본 텍스처 밉맵.json').read_text(encoding='utf-8'))
current_mips = next(v for v in all_mips['versions'] if v['source']['platform']=='Windows' and v['source']['version']==version)
mips_by_key = {t['key']:t for t in current_mips['textures']}
for item in doc['assets']:
    item = copy.deepcopy(item)
    if item['type'] == 28 and item.get('png'):
        image = Image.open(ROOT / item['png']['file']).convert('RGBA')
        item['pixels'] = image.tobytes()
        if hashlib.sha256(item['pixels']).hexdigest() != item['rgbaSha256']:
            raise ValueError('Source texture pixel checksum mismatch: '+item['name'])
        item['sourceMip'] = mips_by_key[item['key']]
    if item['type'] == 48 and item.get('shaderSource'):
        source = gzip.decompress((ROOT / item['shaderSource']['file']).read_bytes())
        if hashlib.sha256(source).hexdigest() != item['shaderSource']['rawSha256']:
            raise ValueError('Source shader checksum mismatch')
        item['nativeShader'] = ns['enc'](source)
        item['d3d11Programs'] = ns['programs'](source.decode('utf-8','replace'))
    assets[item['key']] = item
replacements = {}
if replacement_build:
    previous = json.loads(gzip.decompress((ROOT / ('early-native/snapshots/pc-1.0.0.'+replacement_build+'.json.gz')).read_bytes()))
    def by_name(rows):
        result = collections.defaultdict(list)
        for row in rows:
            if row['type']==28 and row.get('png'): result[row['name']].append(row)
        return result
    old_names, current_names = by_name(previous['assets']), by_name(doc['assets'])
    previous_mips = next(v for v in all_mips['versions'] if v['source']['platform']=='Windows' and v['source']['version']=='1.0.0.'+replacement_build)
    previous_mips_by_key = {t['key']:t for t in previous_mips['textures']}
    for name in sorted(old_names.keys() & current_names.keys()):
        if len(old_names[name]) != 1 or len(current_names[name]) != 1: continue
        before, current = old_names[name][0], current_names[name][0]
        if before['width'] != 2*current['width'] or before['height'] != 2*current['height']: continue
        item = assets[current['key']]
        image = Image.open(ROOT / before['png']['file']).convert('RGBA')
        pixels = image.tobytes()
        if image.size != (before['width'],before['height']) or hashlib.sha256(pixels).hexdigest()!=before['rgbaSha256']:
            raise ValueError('Previous original texture checksum mismatch: '+name)
        item.update({'width':before['width'],'height':before['height'],'pixels':pixels,
                     'sourceMip':previous_mips_by_key[before['key']]})
        replacements[current['key']] = {'name':name,'fromVersion':'1.0.0.'+replacement_build,
                                         'fromSize':[before['width'],before['height']],
                                         'currentSize':[current['width'],current['height']],
                                         'sourceRgbaSha256':before['rgbaSha256']}
ns['A'] = assets
fallback_texture = ns['texture']
def texture_with_original_mips(item):
    if isinstance(item,str): item=assets[item]
    meta=item.get('sourceMip')
    if not meta: return fallback_texture(item)
    if meta['unityFormat']==3 and not meta['mipmapped']:
        # D3D11 has no RGB24 texture format. This source has only one mip;
        # UnityPy's checked RGB→RGBA decode preserves each RGB channel.
        return fallback_texture(item)
    if meta['unityFormat'] not in (10,12) or meta['levels'] is None:
        raise ValueError('Unsupported original texture format/mips: '+item['name'])
    key=item['key']
    if key in ns['TEXTURES']: return ns['TEXTURES'][key]
    raw=gzip.decompress((ROOT/meta['nativeImage']['file']).read_bytes())
    if hashlib.sha256(raw).hexdigest()!=meta['nativeSha256']:
        raise ValueError('Original compressed texture bytes changed: '+item['name'])
    parts=[struct.pack('<iiiii',0x31545048,meta['width'],meta['height'],71 if meta['unityFormat']==10 else 77,len(meta['levels']))]
    for level in meta['levels']:
        chunk=raw[level['offset']:level['offset']+level['bytes']]
        if len(chunk)!=level['bytes']: raise ValueError('Truncated original mip: '+item['name'])
        parts.extend([struct.pack('<i',len(chunk)),chunk])
    result=ns['res'](b''.join(parts));ns['TEXTURES'][key]=result;return result
ns['texture']=texture_with_original_mips
palette = json.loads(gzip.decompress((ROOT / 'minion(2013-08-17).json.gz').read_bytes()))['palette']
actor_constructor=next(m for m in layout['methods'] if 'Actor::.ctor()' in m['name'])['instructions']
verified_colors=set()
for i,line in enumerate(actor_constructor):
    hit=re.search(r'stfld UnityEngine.Color Actor::(CLASS_COLOR_\w+|GEM_COLOR_\w+)',line)
    if not hit: continue
    components=[float(m.group(1)) for instruction in actor_constructor[max(0,i-5):i]
                if (m:=re.search(r'ldc\.r4 ([-.0-9]+)',instruction))]
    if len(components)==3:components.append(1.0)
    if len(components)!=4 or hit.group(1) not in palette or any(abs(x-y)>1e-6 for x,y in zip(components,palette[hit.group(1)])):
        raise ValueError('Source actor color mismatch: '+hit.group(1))
    verified_colors.add(hit.group(1))
if not all('CLASS_COLOR_'+x in verified_colors for x in ('GENERIC','WARLOCK','ROGUE','DRUID','SHAMAN','HUNTER','MAGE','PALADIN','PRIEST','WARRIOR')):
    raise ValueError('Original actor class palette is incomplete')
classes = ['NEUTRAL','WARLOCK','ROGUE','DRUID','SHAMAN','HUNTER','MAGE','PALADIN','PRIEST','WARRIOR']
idx = classes.index(card_class)
kind = {'Ally':'minionCardTextures','Ability':'spellCardTextures','Weapon':'weaponCardTextures'}[family]
class_key = old['classColors'][kind][idx]['ref']
if class_key not in assets:
    raise ValueError('Original class texture is missing')
blank = {'key':'comparison-placeholder','name':'comparison-placeholder','width':1,'height':1,'pixels':bytes([80,130,190,255]), 'sampler':{'m_FilterMode':1,'m_WrapMode':1}}
assets[blank['key']] = blank
prefab = next(p for p in doc['prefabs'] if p['name']=='Card_Hand_'+family+('_Premium' if golden else ''))
draws = []
used_replacements = set()
for node in prefab['nodes']:
    path = node['path']
    legendary = 'Unique_Ally_Dragon' in path
    enabled = any(r['settings'].get('m_Enabled') for r in node.get('renderers',[]))
    if not node.get('mesh') or not node['gameObject'].get('m_IsActive') or not (enabled or legendary and rarity=='LEGENDARY'):
        continue
    if any(x in path for x in ('CurvedText','GhostCard','FakeShadow')) or (legendary and rarity!='LEGENDARY') or ('RarityGem' in path and rarity=='FREE'):
        continue
    if any(path.startswith(p['path']+'/') and not p['gameObject'].get('m_IsActive') for p in prefab['nodes']):
        continue
    model = actor @ ns['pose'](prefab,node)
    for slot, ref in enumerate(node.get('materials',[])):
        material = copy.deepcopy(assets[ref])
        name = material['name']
        if name == 'Card_Back_Default_D': continue
        props = material['properties']['m_SavedProperties']
        if not golden and re.fullmatch(r'Card_Inhand_(?:Ability_|Weapon_)?Warlock(?:_transparent)?',name):
            props['m_TexEnvs']['_MainTex']['m_Texture']['ref'] = class_key
        if golden and name.endswith('_Premium_Warlock') and path.endswith('/RootObject/Mesh'):
            rgba = palette['CLASS_COLOR_'+('GENERIC' if card_class=='NEUTRAL' else card_class)]
            props['m_Colors']['_Color'] = dict(zip(('r','g','b','a'),rgba))
        if path.endswith('/PortraitFrame_mesh') and 'portrait' in name.lower():
            if '_MainTex' in props['m_TexEnvs']:
                props['m_TexEnvs']['_MainTex']['m_Texture']['ref'] = blank['key']
        if path.endswith('/RarityGem') and rarity=='LEGENDARY':
            props['m_Colors']['_tint'] = palette['GEM_COLOR_LEGENDARY']
            if '_MainTex' in props['m_TexEnvs']:
                props['m_TexEnvs']['_MainTex']['m_Offset'] = {'x':0.5,'y':0.5}
        for entry in props['m_TexEnvs'].values():
            ref = entry.get('m_Texture',{}).get('ref')
            if ref in replacements: used_replacements.add(ref)
        # Canonical RGBA order; JSON object key ordering is not channel order.
        for key, value in list(props['m_Colors'].items()):
            if isinstance(value,dict): props['m_Colors'][key] = [value[k] for k in ('r','g','b','a')]
        shader = assets[material['properties']['m_Shader']['ref']]
        if shader['name'] == 'Self-Illumin_Diffuse':
            # Forward directional-light variant, with lightmaps and shadows off.
            # This is a controlled comparison setting, not a claim that every
            # historical board used the same runtime lighting.
            material['properties']['m_ShaderKeywords'] = ['DIRECTIONAL','SHADOWS_OFF','LIGHTMAP_OFF','DIRLIGHTMAP_OFF']
        head = base64.b64decode(shader['nativeShader']).decode('utf-8','replace').split('Program "vp"')[0]
        queue = material['properties'].get('m_CustomRenderQueue',-1)
        if queue < 0: queue = 3000 if re.search(r'"Queue"\s*=\s*"Transparent',head,re.I) else 2000
        draws.append((queue, model[1,3],node,slot,material,model))
draws.sort(key=lambda x:(x[0],-x[1] if x[0]<2500 else x[1]))
for _,__,node,slot,material,model in draws:
    ns['draw'](assets[node['mesh']]['mesh'],slot,material,model)
image = ns['gpu'](width,height)
output = None
if '--digest-only' not in sys.argv:
    output = REPORTS / ('원본 수집품 카메라 시험 - '+version+' '+family+' '+card_class+(' 황금' if golden else ' 일반')+(' - 전설' if rarity=='LEGENDARY' else '')+(' - '+replacement_build+' 원본 텍스처' if replacement_build else '')+(' - '+str(render_time)+'초' if render_time else '')+'.png')
    if output.exists(): raise FileExistsError(output)
    image.save(output)
print(json.dumps({'output':str(output) if output else None,'rgbaSha256':hashlib.sha256(image.tobytes()).hexdigest(),
                  'size':[width,height],'time':render_time,'rarity':rarity,'camera':cam['camera'],'cameraFov':camera['field of view'],
                  'replacements':[replacements[k] for k in sorted(used_replacements)],
                  'draws':len(draws),'scope':'Source prefab, meshes, original compressed textures and mip levels, and D3D shader bytecode; fixed comparison lighting and placeholder art; text and card-specific golden art excluded. Source camera and collection anchor; runtime scene/camera assumptions require validation.'},ensure_ascii=False))
