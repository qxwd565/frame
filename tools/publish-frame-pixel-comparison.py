"""Publish 0-second source-frame evidence, without uploading duplicate assets."""
import csv
import gzip
import hashlib
import importlib.util
import json
import pathlib
import urllib.parse
import urllib.request

ROOT=pathlib.Path(__file__).resolve().parent.parent
SOURCE=ROOT/'v7.14.4-webgpu-20261109/assets/unity'
REPORTS=pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교')
NAME='historical-frames/early-native/original-frame-pixel-comparison.json.gz'
INDEX=ROOT/'plugin/hscard/assets/unity/frame-api-index.json'


def main():
    with (REPORTS/'베타-오리지널 PC 프레임 원본 크기 비교.csv').open(encoding='utf-8-sig',newline='') as stream:
        pc=list(csv.DictReader(stream))
    ios=json.loads((REPORTS/'베타-오리지널 iOS 프레임 원본 크기 비교.json').read_text(encoding='utf8'))['cases']
    if len(pc)!=540 or len(ios)!=240 or any(float(r['시각(초)'])!=0 for r in pc) or any(r['time']!=0 for r in ios):
        raise ValueError('Expected all 0-second frame comparisons')
    pc_cases=[{'version':r['버전'],'previousVersion':r['직전 버전'] or None,'family':r['유형'],'class':r['직업'],
               'finish':r['마감'],'time':0,'rarity':r['희귀도'],'rgbaSha256':r['원본 크기 렌더 SHA256'],
               'previousRgbaSha256':r['직전 렌더 SHA256'] or None,'comparison':r['직전과 비교'],
               'priorFullSizeRgbaSha256':r['직전 큰 원본 텍스처 대체 SHA256'] or None,
               'priorFullSizeComparison':r['대체 후 직전과 비교'],
               'replacedTextures':json.loads(r['대체한 원본 텍스처']) if r['대체한 원본 텍스처'] else [],
               'pngSize':r['저장 PNG 크기']} for r in pc]
    ios_cases=[{k:r[k] for k in ('version','archiveId','family','golden','time','cardClass','rarity',
                                  'rgbaSha256','previous','sameAsPrevious','pngSize')} for r in ios]
    report={'schema':1,'scope':'Frame-only, FREE rarity, 0-second test cases with fixed lighting and a placeholder portrait. Text, card-specific golden art, complete animation and real runtime fidelity are not covered.',
            'pc':{'conditions':'Common 3664 camera and card placement, ~1:1 flat-front texel density of 1024px source, each version original D3D shader, mesh and compressed mip chain. A depth near-plane of 10 improves D24 precision without changing x/y projection; clipping is checked. RGBA hash is after lossless transparent-border crop.', 'cases':pc_cases},
            'ios':{'conditions':'~1:1 flat-front texel density of 512px source, each version original GLES shader, mesh and PVRTC mip chain in desktop WebGL. Actual iOS runtime camera and GPU precision remain unverified. RGBA hash refers to the common full WebGL framebuffer.', 'cases':ios_cases}}
    raw=(json.dumps(report,ensure_ascii=False,sort_keys=True,separators=(',',':'))+'\n').encode();payload=gzip.compress(raw,compresslevel=6,mtime=0)
    target=SOURCE/NAME
    if target.exists() and target.read_bytes()!=payload:raise FileExistsError('Existing comparison evidence differs')
    target.write_bytes(payload)
    spec=importlib.util.spec_from_file_location('api',ROOT/'tools/publish-frame-apis.py');api=importlib.util.module_from_spec(spec);spec.loader.exec_module(api)
    record=api.plan()[NAME]
    if record['repository']!='legacy':raise ValueError('Unexpected comparison destination')
    remote='https://github.com/qxwd565/legacy.git';api.git('fetch','--no-tags','--filter=blob:none',remote,'main');parent=api.git('rev-parse','FETCH_HEAD').decode().strip()
    def get(commit,name):
        url='https://raw.githubusercontent.com/qxwd565/legacy/'+commit+'/frame/'+urllib.parse.quote(name,safe='/')
        with urllib.request.urlopen(url,timeout=90) as response:return response.read()
    catalog=json.loads(get(parent,'index.json'));catalog['files'][NAME]=record
    updates={NAME:api.git('hash-object','--no-filters','-w','--stdin',data=payload).decode().strip(),
             'index.json':api.git('hash-object','--no-filters','-w','--stdin',data=api.encoded(catalog)).decode().strip()}
    tree=api.tree_entries(parent);tree['frame']=('040000','tree',api.overlay_tree(tree['frame'][2],updates));tree_id=api.write_tree(tree)
    if tree_id==api.git('rev-parse',parent+'^{tree}').decode().strip():commit=parent
    else:
        commit=api.git('commit-tree',tree_id,'-p',parent,data=b'Add source-scale zero-second frame comparison\n').decode().strip()
        changed=set(api.git('diff-tree','--no-commit-id','--name-only','-r',parent,commit).decode().splitlines())
        if changed-{'frame/index.json','frame/'+NAME}:raise ValueError('Unexpected API publication files')
        api.git('push',remote,commit+':refs/heads/main')
    if get(commit,NAME)!=payload:raise ValueError('Published evidence differs')
    index=json.loads(INDEX.read_bytes());index['files'][NAME]=record;index['repositories']['legacy']={'commit':commit,'base':f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/'}
    INDEX.write_bytes(api.encoded(index))
    print(json.dumps({'commit':commit,'pc':len(pc),'ios':len(ios),'sha256':hashlib.sha256(payload).hexdigest()}))


if __name__=='__main__':main()
