"""Compare the original PC minion draw path under one fixed card input.

The original D3D renderer executes in memory; no rendered images are written.
This covers the reference minion, not every class, card family or effect.
"""
import hashlib
import json
import pathlib
import sys

sys.path.insert(0, r'E:\hearthstone card\tools\unitypy')
source = pathlib.Path(r'E:\HSPlus\development\scripts\render-native-beta-archive.py')
build = sys.argv[1]
sys.argv = [str(source), build, r'E:\hearthstone card']
program = source.read_text(encoding='utf-8')
marker = " im=gpu();path=HERE/"
if program.count(marker) != 1: raise ValueError('Original render entry point changed')
program = program[:program.index(marker)] + ' return gpu()\n'
namespace = {'__name__':'__reference_render__','__file__':str(source)}
exec(compile(program,str(source),'exec'),namespace)
data=namespace['D']; asset_map=namespace['A']
portrait=(data['card'].get('m_PortraitTexture') or {}).get('ref') or data['cardAssets'].get('portrait')
portrait_hash=asset_map.get(portrait,{}).get('rgbaSha256')
if portrait_hash!='555c906148350a34a36efe5e00f2bb63870621c75754a66fa91d0ea1e4b2dcf1':
    raise ValueError('Reference artwork differs from the common comparison input')
namespace['TEXT'] = {'NameUberText':'동일한 카드', 'PowersUberText':'전투의 함성: 카드를 뽑습니다.',
    'CostUberText':'3','AttackUberText':'2','HealthUberText':'4','RaceUberText':'멀록'}
rows=[]
for golden in [False,True]:
    image=namespace['run'](golden).convert('RGBA')
    rows.append({'golden':golden,'width':image.width,'height':image.height,
                 'rgbaSha256':hashlib.sha256(image.tobytes()).hexdigest()})
print(json.dumps({'version':'1.0.0.'+build,'fixedInput':'same card, text, art and render time', 'portraitRgbaSha256':portrait_hash,
    'scope':'reference minion normal and golden, using original PC D3D shaders', 'renders':rows}),flush=True)
