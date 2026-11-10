"""Save deduplicated in-play hero-power source assets for later comparison.

Rendering and version equivalence are deliberately not inferred here.
"""
import base64
import gzip
import hashlib
import importlib.util
import io
import json
import pathlib
import sys
from PIL import Image

sys.dont_write_bytecode=True
ROOT=pathlib.Path(__file__).resolve().parent.parent
REPORTS=pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교')
DEST=REPORTS/'영웅 능력 원본 (미검증)'
spec=importlib.util.spec_from_file_location('hero_audit',ROOT/'tools/audit-original-hero-power.py')
hero=importlib.util.module_from_spec(spec);spec.loader.exec_module(hero)
spec=importlib.util.spec_from_file_location('mips_audit',ROOT/'tools/audit-original-texture-mips.py')
mips=importlib.util.module_from_spec(spec);spec.loader.exec_module(mips)

def sha(value):return hashlib.sha256(value).hexdigest()
def store(data,suffix,packed=False):
    identity=sha(data);path=DEST/(identity+suffix);payload=gzip.compress(data,compresslevel=6,mtime=0) if packed else data
    if path.exists():
        existing=path.read_bytes();verified=gzip.decompress(existing) if packed else existing
        if sha(verified)!=identity:raise ValueError('Existing hero asset checksum mismatch')
        payload=existing
    else:path.write_bytes(payload)
    return {'file':path.name,'rawSha256':identity,'rawBytes':len(data),'bytes':len(payload),'sha256':sha(payload)}

def main():
    if not DEST.is_dir():raise FileNotFoundError('Hero source evidence folder missing')
    inventory=json.loads((REPORTS/'베타-오리지널 영웅 능력 원본 조사.json').read_text(encoding='utf8'))
    for record in inventory['versions']:
        source=record['source'];platform='pc' if source['platform']=='Windows' else 'ios'
        identity=source['version'].split('.')[-1] if platform=='pc' else source['archiveId']
        filename=platform+'-'+source['version']+('-'+identity if platform=='ios' else '')+'.json.gz';target=DEST/filename
        if target.exists():raise FileExistsError(target)
        a,_=hero.audit.archive(platform,identity)
        try:
            for row in record['heroPowers']:
                if row['status']!='source_found_render_unverified':continue
                p=hero.original_root(a,row['name'])
                for node in p['nodes']:
                    for ref in [node.get('mesh'),*node.get('materials',[])]:
                        if ref:a.include(ref)
            assets=[]
            for key,item in a.assets.items():
                obj=a.obj(key);row={k:v for k,v in item.items() if k!='data'}
                if sha(obj.get_raw_data())!=item['sourceSha256']:raise ValueError('Original object changed: '+key)
                if item['type']==28:
                    raw=gzip.decompress(base64.b64decode(item['data'],validate=True))
                    if sha(raw)!=item['rgbaSha256']:raise ValueError('Original decoded pixels changed')
                    img=Image.frombytes('RGBA',(item['width'],item['height']),raw);buf=io.BytesIO();img.save(buf,format='PNG')
                    row['png']=store(buf.getvalue(),'.png')
                    native=obj.read().get_image_data();tree=obj.read_typetree()
                    if sha(native)!=item['nativeSha256']:raise ValueError('Original native texture changed')
                    row['nativeImage']=store(native,'.texture.gz',True)
                    fmt=tree['m_TextureFormat'];has_mips=bool(tree.get('m_MipMap',tree.get('m_MipCount',1)>1))
                    row['textureFormat']={'unityFormat':fmt,'mipmapped':has_mips,'levels':mips.levels(item['width'],item['height'],fmt,has_mips,len(native))}
                elif item['type']==48:
                    script=obj.read_typetree().get('m_Script')
                    if isinstance(script,str):script=script.encode('utf8')
                    if script:row['shaderSource']=store(script,'.shader.gz',True)
                assets.append(row)
            result={'source':source,'scope':'Original in-play hero-power source inventory; rendering and runtime equivalence not yet established.',
                    'heroPowers':[{k:v for k,v in h.items() if k!='assets'} for h in record['heroPowers']],'assets':assets}
            data=(json.dumps(result,ensure_ascii=False,sort_keys=True,separators=(',',':'))+'\n').encode()
            target.write_bytes(gzip.compress(data,compresslevel=6,mtime=0))
            print(json.dumps({'version':source['version'],'platform':source['platform'],'assets':len(assets),'snapshot':target.name},ensure_ascii=False),flush=True)
        finally:a.close()

if __name__=='__main__':main()
