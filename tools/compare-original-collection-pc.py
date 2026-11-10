"""Compare source PC frames, including prior full-size mip chains.

Only a fixed collection scene, lighting, placeholder art, two animation times
and the listed classes/types are compared. Equal hashes do not prove complete
in-game equivalence. The CSV is an incremental result, not an API decision.
"""
import base64
import contextlib
import csv
import functools
import gzip
import hashlib
import io
import json
import os
import pathlib
import subprocess
import sys

from PIL import Image

ROOT = pathlib.Path(__file__).resolve().parent.parent
RENDERER = ROOT/'tools/render-original-collection-pc.py'
OUTPUT = pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교\베타-오리지널 PC 렌더 비교.csv')
BUILDS = ['3664','3749','3890','3937','4217','4243','4458','4482','4944']
CLASSES = ['NEUTRAL','DRUID','HUNTER','MAGE','PALADIN','PRIEST','ROGUE','SHAMAN','WARLOCK','WARRIOR']
FIELDS = ['버전','직전 버전','유형','직업','마감','희귀도','시각(초)','현재 렌더 SHA256','직전 렌더 SHA256',
          '직전과 비교','직전 원본 큰 텍스처 사용 렌더 SHA256','대체 후 직전과 비교','대체한 텍스처',
          '화면 픽셀 크기','출력 범위와 미검증 항목']

PS = r"""
$ErrorActionPreference='Stop'
$asm=[Reflection.Assembly]::LoadFrom('E:\HSPlus\development\plugins\hsplugin\HSPlugin.exe')
$reader=$asm.GetType('HSPlus.Storage.PortableJson').GetMethod('Read',[Reflection.BindingFlags]'Static,NonPublic')
$rt=$asm.GetType('HSPlus.Rendering.PortableRenderer');$cache=@{};$renderer=$null;$current=''
$callback=[Func[string,byte[]]]({param($k) return ,$cache[$k]}.GetNewClosure())
try {
 while($null -ne ($line=[Console]::In.ReadLine())) {
  try {
   $p=$line|ConvertFrom-Json
   foreach($v in $p.resources.PSObject.Properties){$cache[$v.Name]=[Convert]::FromBase64String([string]$v.Value)}
   if($null -eq $renderer -or $current -ne $p.libraryKey){
    if($renderer){$renderer.Dispose()}
    $lib=$reader.MakeGenericMethod($asm.GetType('HSPlus.Models.PortableShaderLibrary')).Invoke($null,@([string]$p.library))
    $renderer=[Activator]::CreateInstance($rt,[Reflection.BindingFlags]'Instance,NonPublic',$null,@($lib),$null);$current=$p.libraryKey
   }
   $scene=$reader.MakeGenericMethod($asm.GetType('HSPlus.Models.PortableCardScene')).Invoke($null,@([string]$p.scene))
   $pixels=[byte[]]$rt.GetMethod('RenderPixels',[Reflection.BindingFlags]'Instance,NonPublic').Invoke($renderer,[object[]]@($scene,$callback,[float[]]@(0,0,0,0)))
   $h=[Security.Cryptography.SHA256]::Create();try{$hash=([BitConverter]::ToString($h.ComputeHash($pixels))).Replace('-','').ToLowerInvariant()}finally{$h.Dispose()}
   [Console]::Out.WriteLine((@{sha256=$hash}|ConvertTo-Json -Compress))
  } catch { [Console]::Out.WriteLine((@{error=$_.Exception.ToString()}|ConvertTo-Json -Compress)) }
 }
} finally { if($renderer){$renderer.Dispose()} }
"""


@functools.lru_cache(maxsize=64)
def gz_json(path):
    return json.loads(gzip.decompress(path.read_bytes()))


@functools.lru_cache(maxsize=8)
def text_json(path):
    return json.loads(path.read_text(encoding='utf-8'))


@functools.lru_cache(maxsize=256)
def raw_gzip(path):
    return gzip.decompress(path.read_bytes())


@functools.lru_cache(maxsize=256)
def image_read(path):
    with Image.open(path) as im:
        return im.convert('RGBA')


class D3D:
    def __init__(self):
        command = base64.b64encode(PS.encode('utf-16le')).decode('ascii')
        self.child = subprocess.Popen(['powershell.exe','-NoProfile','-NonInteractive','-EncodedCommand',command],
                                      stdin=subprocess.PIPE,stdout=subprocess.PIPE,stderr=subprocess.PIPE,
                                      text=True,encoding='utf-8',bufsize=1,creationflags=0x08000000)
        self.known = set()

    def render(self,ns,width,height):
        library=json.dumps({'schema':1,'shaders':list(ns['LIB'].values())},separators=(',',':'))
        resources={k:v for k,v in ns['RES'].items() if k not in self.known}
        payload={'libraryKey':hashlib.sha256(library.encode()).hexdigest(),'library':library,
                 'scene':json.dumps({'schema':1,'width':width,'height':height,'draws':ns['DRAWS']},separators=(',',':')),
                 'resources':resources}
        self.child.stdin.write(json.dumps(payload,separators=(',',':'))+'\n');self.child.stdin.flush()
        line=self.child.stdout.readline()
        if not line: raise RuntimeError('Native D3D worker stopped: '+self.child.stderr.read()[-4000:])
        response=json.loads(line)
        if response.get('error'): raise RuntimeError(response['error'])
        self.known.update(resources)
        return type('Rendered',(),{'digest':response['sha256']})()

    def close(self):
        self.child.stdin.close()
        try: self.child.wait(timeout=10)
        except subprocess.TimeoutExpired: self.child.kill();self.child.wait()


def prepared_script():
    source=RENDERER.read_text(encoding='utf-8')
    edits={
      "json.loads(gzip.decompress((ROOT / ('early-native/snapshots/pc-1.0.0.'+build+'.json.gz')).read_bytes()))":"BATCH_GZ_JSON(ROOT / ('early-native/snapshots/pc-1.0.0.'+build+'.json.gz'))",
      "json.loads(gzip.decompress((EXTRACTED / ('PC 1.0.0.'+build+'.json.gz')).read_bytes()))":"BATCH_GZ_JSON(EXTRACTED / ('PC 1.0.0.'+build+'.json.gz'))",
      "json.loads(gzip.decompress((ROOT / ('early-native/snapshots/pc-1.0.0.'+replacement_build+'.json.gz')).read_bytes()))":"BATCH_GZ_JSON(ROOT / ('early-native/snapshots/pc-1.0.0.'+replacement_build+'.json.gz'))",
      "json.loads((REPORTS / '베타-오리지널 원본 카메라.json').read_text(encoding='utf-8'))":"BATCH_JSON(REPORTS / '베타-오리지널 원본 카메라.json')",
      "json.loads((REPORTS / '베타-오리지널 수집품 배치 코드.json').read_text(encoding='utf-8'))":"BATCH_JSON(REPORTS / '베타-오리지널 수집품 배치 코드.json')",
      "json.loads((REPORTS / '베타-오리지널 원본 텍스처 밉맵.json').read_text(encoding='utf-8'))":"BATCH_JSON(REPORTS / '베타-오리지널 원본 텍스처 밉맵.json')",
      "json.loads(gzip.decompress((ROOT / 'minion(2013-08-17).json.gz').read_bytes()))":"BATCH_GZ_JSON(ROOT / 'minion(2013-08-17).json.gz')",
      "Image.open(ROOT / item['png']['file']).convert('RGBA')":"BATCH_IMAGE(ROOT / item['png']['file'])",
      "Image.open(ROOT / before['png']['file']).convert('RGBA')":"BATCH_IMAGE(ROOT / before['png']['file'])",
      "gzip.decompress((ROOT / item['shaderSource']['file']).read_bytes())":"BATCH_GZIP(ROOT / item['shaderSource']['file'])",
      "gzip.decompress((ROOT/meta['nativeImage']['file']).read_bytes())":"BATCH_GZIP(ROOT/meta['nativeImage']['file'])",
      "image = ns['gpu'](width,height)":"image = BATCH_GPU(ns,width,height)",
      "hashlib.sha256(image.tobytes()).hexdigest()":"image.digest",
    }
    for old,new in edits.items():
        if source.count(old)!=1: raise ValueError('Batch renderer source has changed: '+old)
        source=source.replace(old,new)
    return compile(source,str(RENDERER),'exec')


def main():
    resume='--resume' in sys.argv
    limit=int(sys.argv[sys.argv.index('--limit')+1]) if '--limit' in sys.argv else None
    if OUTPUT.exists() and not resume: raise FileExistsError('Comparison table already exists; use --resume')
    completed={}
    if OUTPUT.exists():
        with OUTPUT.open(encoding='utf-8-sig',newline='') as source_stream:
            reader=csv.DictReader(source_stream)
            if reader.fieldnames!=FIELDS: raise ValueError('Unexpected existing comparison table schema')
            for row in reader:
                key=(row['버전'].removeprefix('1.0.0.'),row['유형'],row['직업'],row['마감'],row['희귀도'],float(row['시각(초)']))
                if key in completed: raise ValueError('Duplicate completed comparison row')
                completed[key]=row
    source=prepared_script();worker=D3D();saved_argv=sys.argv[:];previous={}
    try:
        with OUTPUT.open('a' if OUTPUT.exists() else 'x',encoding='utf-8-sig',newline='') as stream:
            writer=csv.DictWriter(stream,fieldnames=FIELDS)
            if not completed: writer.writeheader();stream.flush()
            count=0
            for build in BUILDS:
                for family in ['Ally','Ability','Weapon']:
                    for finish in ['normal','golden']:
                        for cls in CLASSES:
                          for rarity in ['FREE','LEGENDARY']:
                            for time in [0.0,1.25]:
                                key=(family,cls,finish,rarity,time);done_key=(build,family,cls,finish,rarity,time)
                                if done_key in completed:
                                    previous[key]={'build':build,'hash':completed[done_key]['현재 렌더 SHA256']}
                                    continue
                                def run(replace=None):
                                    sys.argv=[str(RENDERER),build,family,cls,finish,'--digest-only','--time',str(time),'--rarity',rarity]
                                    if replace:sys.argv+=['--replace-half-from',replace]
                                    captured=io.StringIO()
                                    env={'__name__':'__batch_render__','__file__':str(RENDERER),'BATCH_GZ_JSON':gz_json,
                                         'BATCH_JSON':text_json,'BATCH_GZIP':raw_gzip,'BATCH_IMAGE':image_read,'BATCH_GPU':worker.render}
                                    with contextlib.redirect_stdout(captured):exec(source,env)
                                    return json.loads(captured.getvalue())
                                result=run();old=previous.get(key);different=old and old['hash']!=result['rgbaSha256']
                                replacement=None
                                if different and build in ('3890','4217'):
                                    replacement=run(old['build'])
                                row={'버전':'1.0.0.'+build,'직전 버전':('1.0.0.'+old['build']) if old else '',
                                     '유형':family,'직업':cls,'마감':finish,'희귀도':rarity,'시각(초)':time,
                                     '현재 렌더 SHA256':result['rgbaSha256'],'직전 렌더 SHA256':old['hash'] if old else '',
                                     '직전과 비교':('다름' if different else '같음') if old else '첫 버전',
                                     '직전 원본 큰 텍스처 사용 렌더 SHA256':replacement['rgbaSha256'] if replacement and replacement['replacements'] else '',
                                     '대체 후 직전과 비교':('같음' if replacement['rgbaSha256']==old['hash'] else '다름') if replacement and replacement['replacements'] else ('해당 없음' if replacement else ''),
                                     '대체한 텍스처':json.dumps(replacement['replacements'],ensure_ascii=False,separators=(',',':')) if replacement else '',
                                     '화면 픽셀 크기':'1920x1080','출력 범위와 미검증 항목':result['scope']}
                                writer.writerow(row);stream.flush();previous[key]={'build':build,'hash':result['rgbaSha256']};count+=1
                                if count%20==0:print(json.dumps({'completed':count,'build':build,'family':family},ensure_ascii=False),flush=True)
                                if limit is not None and count>=limit:
                                    print(json.dumps({'stoppedAfterRequestedLimit':count},ensure_ascii=False),flush=True)
                                    return
    finally:
        sys.argv=saved_argv;worker.close()


if __name__=='__main__':main()
