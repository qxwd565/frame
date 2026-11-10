"""Inventory original in-play hero-power frames; do not infer render equality."""
import collections
import csv
import gzip
import hashlib
import importlib.util
import json
import pathlib
import re
import sys

sys.dont_write_bytecode=True
ROOT=pathlib.Path(__file__).resolve().parent.parent
OUT=pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교')
spec=importlib.util.spec_from_file_location('original_audit',ROOT/'tools/audit-early-frame-combinations.py')
audit=importlib.util.module_from_spec(spec);spec.loader.exec_module(audit)
PC=['3664','3749','3890','3937','4217','4243','4458','4482','4944']
IOS=['14836313','563785077','588883794','608602673']
NAMES=['Card_Play_HeroPower','Card_Play_HeroPower_Premium']

def local_component_blob(kind,raw,extension):
    if kind!='unity-object' or extension!='.bin.gz':raise ValueError('Unexpected hero component blob')
    sha=hashlib.sha256(raw).hexdigest();folder=OUT/'영웅 능력 원본 (미검증)';folder.mkdir(exist_ok=True)
    path=folder/(sha+extension)
    if path.exists():
        packed=path.read_bytes()
        if hashlib.sha256(gzip.decompress(packed)).hexdigest()!=sha:raise ValueError('Existing original hero component corrupted')
    else:
        packed=gzip.compress(raw,compresslevel=6,mtime=0);path.write_bytes(packed)
    return {'file':'영웅 능력 원본 (미검증)/'+path.name,'rawSha256':sha,'rawBytes':len(raw),
            'bytes':len(packed),'sha256':hashlib.sha256(packed).hexdigest()}

def digest(value):
    return hashlib.sha256(json.dumps(value,sort_keys=True,ensure_ascii=False,separators=(',',':')).encode()).hexdigest()

def original_root(a,name):
    # Loading the native hand-card actor bundle gives access to power actors.
    a.prefab('Card_Hand_Ally')
    candidates=[]
    for obj in a.env.objects:
        if obj.type.name!='GameObject' or obj.peek_name()!=name:continue
        tree=obj.read_typetree()
        transforms=[]
        for pair in tree['m_Component']:
            pointer=pair[1] if isinstance(pair,(tuple,list)) else pair.get('component',pair.get('second'))
            ref=a.ref(pointer,obj.assets_file)
            if ref:
                item=a.obj(ref)
                if item.type.name=='Transform':transforms.append(item.read_typetree())
        if len(transforms)==1 and not transforms[0]['m_Father']['m_PathID']:candidates.append(obj)
    if len(candidates)>1:raise ValueError('Multiple independent source roots: '+name)
    if not candidates:return None
    obj=candidates[0]
    bundle=a.meta['frameSources']['Card_Hand_Ally'][0]['source']['bundle']
    a.meta['frameSources'][name]=[{'source':{'bundle':bundle,'serializedFile':obj.assets_file.name,'pathId':obj.path_id}}]
    return a.prefab(name)

def inspect(platform,identity):
    a,source=audit.archive(platform,identity)
    results=[]
    try:
        prefabs={name:original_root(a,name) for name in NAMES}
        reconstruction_failures=[]
        if platform=='ios':
            original_blob=audit.blob;audit.blob=local_component_blob
            try:audit.reconstruct(a,[p for p in prefabs.values() if p],platform,reconstruction_failures)
            finally:audit.blob=original_blob
        for name in NAMES:
            prefab=prefabs[name]
            if prefab is None:
                results.append({'name':name,'status':'source_prefab_not_found'});continue
            keys=set()
            for node in prefab['nodes']:
                for key in [node.get('mesh'),*node.get('materials',[])]:
                    if key:a.include(key);keys.add(key)
            # include() recursively adds the material dependencies.
            assets=[]
            for key,item in a.assets.items():
                record={'key':key,'name':item['name'],'type':item['type'],'originalObjectSha256':item['sourceSha256']}
                if item['type']==43:record['meshSha256']=digest(item['mesh'])
                elif item['type']==28:record.update(width=item['width'],height=item['height'],rgbaSha256=item['rgbaSha256'],nativeSha256=item['nativeSha256'],sampler=item['sampler'])
                elif item['type']==21:record['properties']=item['properties']
                elif item['type']==48:
                    script=a.obj(key).read_typetree().get('m_Script');script=script.encode() if isinstance(script,str) else script
                    if script:
                        record['shaderSourceSha256']=hashlib.sha256(script).hexdigest()
                        text=script.decode('utf8','replace')
                        record['programs']=sorted(set(hashlib.sha256(x.group(1).encode()).hexdigest() for x in re.finditer(r'"(!!GLES.*?)(?<!\\)"',text,re.S)))
                assets.append(record)
            results.append({'name':name,'status':'source_found_render_unverified','prefab':prefab,
                            'assets':assets,'unresolvedComponents':sum(bool(c.get('unresolved')) for n in prefab['nodes'] for c in n['components'])})
            a.assets={}
        return {'source':source,'heroPowers':results,'reconstructionFailures':reconstruction_failures}
    finally:a.close()

def main():
    json_path=OUT/'베타-오리지널 영웅 능력 원본 조사.json';csv_path=OUT/'베타-오리지널 영웅 능력 조사.csv'
    if (json_path.exists() or csv_path.exists()) and '--refresh' not in sys.argv:raise FileExistsError('Existing hero-power source report')
    records=[]
    for platform,identities in [('pc',PC),('ios',IOS)]:
        for identity in identities:
            record=inspect(platform,identity);records.append(record)
            print(json.dumps({'source':record['source'],'status':[x['status'] for x in record['heroPowers']]},ensure_ascii=False),flush=True)
    json_path.write_text(json.dumps({'scope':'In-play hero-power source inventory. No rendering or runtime equivalence is established.','versions':records},ensure_ascii=False,separators=(',',':')),encoding='utf8')
    with csv_path.open('w',encoding='utf-8-sig',newline='') as stream:
        writer=csv.writer(stream);writer.writerow(['플랫폼','버전','영웅 능력 프리팹','원본 상태','노드 수','참조 에셋 수','미해석 컴포넌트','렌더 비교'])
        for record in records:
            for row in record['heroPowers']:
                writer.writerow([record['source']['platform'],record['source']['version'],row['name'],row['status'],len(row.get('prefab',{}).get('nodes',[])),len(row.get('assets',[])),row.get('unresolvedComponents',''),'미수행'])

if __name__=='__main__':main()
