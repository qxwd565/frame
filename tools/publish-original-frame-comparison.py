"""Publish the qualified comparison table only; do not upload unchanged assets."""
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
NAME='historical-frames/early-native/original-collection-comparison.json.gz'
INDEX=ROOT/'plugin/hscard/assets/unity/frame-api-index.json'

def main():
    with (REPORTS/'베타-오리지널 PC 렌더 비교.csv').open(encoding='utf-8-sig',newline='') as stream:
        pc=list(csv.DictReader(stream))
    ios=json.loads((REPORTS/'베타-오리지널 iOS 렌더 비교.json').read_text(encoding='utf8'))
    if len(pc)!=2160 or len(ios['records'])!=4 or sum(len(v['results']) for v in ios['records'])!=960:
        raise ValueError('Original comparison is incomplete')
    if any(x['status']!='rendered' for v in ios['records'] for x in v['results']):
        raise ValueError('Original iOS comparison has rendering failures')
    cases=[]
    for row in pc:
        cases.append({'version':row['버전'],'previousVersion':row['직전 버전'] or None,'family':row['유형'],
                      'class':row['직업'],'finish':row['마감'],'rarity':row['희귀도'],'time':float(row['시각(초)']),
                      'rgbaSha256':row['현재 렌더 SHA256'],'previousRgbaSha256':row['직전 렌더 SHA256'] or None,
                      'comparison':row['직전과 비교'],'priorFullSizeRgbaSha256':row['직전 원본 큰 텍스처 사용 렌더 SHA256'] or None,
                      'priorFullSizeComparison':row['대체 후 직전과 비교'] or None,
                      'replacedTextures':json.loads(row['대체한 텍스처']) if row['대체한 텍스처'] else []})
    report={'schema':1,'scope':'Beta through pre-Naxx original source comparison; equal pixels apply only to the specified test cases, not all runtime states.',
            'pc':{'screen':[1920,1080],'conditions':'Original PC mesh, DXT mip levels and D3D shaders; fixed lighting and placeholder art. Text and card-specific golden animation excluded. Collection runtime placement requires validation.',
                  'cases':cases},
            'ios':{'screen':[2048,1536],'conditions':ios['scope'],'versions':ios['records']}}
    raw=(json.dumps(report,ensure_ascii=False,sort_keys=True,separators=(',',':'))+'\n').encode()
    payload=gzip.compress(raw,compresslevel=6,mtime=0);target=SOURCE/NAME
    if target.exists() and target.read_bytes()!=payload:raise FileExistsError('Existing comparison evidence differs')
    target.write_bytes(payload)
    spec=importlib.util.spec_from_file_location('api',ROOT/'tools/publish-frame-apis.py');api=importlib.util.module_from_spec(spec);spec.loader.exec_module(api)
    row=api.plan()[NAME]
    if row['repository']!='legacy':raise ValueError('Unexpected comparison destination')
    remote='https://github.com/qxwd565/legacy.git';api.git('fetch','--no-tags','--filter=blob:none',remote,'main');parent=api.git('rev-parse','FETCH_HEAD').decode().strip()
    def get(commit,name):
        url='https://raw.githubusercontent.com/qxwd565/legacy/'+commit+'/frame/'+urllib.parse.quote(name,safe='/')
        with urllib.request.urlopen(url,timeout=90) as response:return response.read()
    catalog=json.loads(get(parent,'index.json'));catalog['files'][NAME]=row
    updates={NAME:api.git('hash-object','--no-filters','-w','--stdin',data=payload).decode().strip(),
             'index.json':api.git('hash-object','--no-filters','-w','--stdin',data=api.encoded(catalog)).decode().strip()}
    tree=api.tree_entries(parent);tree['frame']=('040000','tree',api.overlay_tree(tree['frame'][2],updates));tree_id=api.write_tree(tree)
    if tree_id==api.git('rev-parse',parent+'^{tree}').decode().strip():commit=parent
    else:
        commit=api.git('commit-tree',tree_id,'-p',parent,data=b'Add qualified original collection frame comparison\n').decode().strip()
        changed=set(api.git('diff-tree','--no-commit-id','--name-only','-r',parent,commit).decode().splitlines())
        if changed-{'frame/index.json','frame/'+NAME}:raise ValueError('Unexpected API publication files')
        api.git('push',remote,commit+':refs/heads/main')
    if get(commit,NAME)!=payload:raise ValueError('Published evidence does not match local bytes')
    index=json.loads(INDEX.read_bytes());index['files'][NAME]=row;index['repositories']['legacy']={'commit':commit,'base':f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/'}
    INDEX.write_bytes(api.encoded(index))
    print(json.dumps({'commit':commit,'sourceCases':len(pc)+sum(len(v['results']) for v in ios['records']),
                      'publishedFiles':[NAME],'compressedBytes':len(payload),'sha256':hashlib.sha256(payload).hexdigest()}))

if __name__=='__main__':main()
