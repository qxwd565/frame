"""Recover original Unity texture formats and mip-level boundaries in memory."""
import collections
import gzip
import hashlib
import importlib.util
import json
import pathlib
import sys

sys.dont_write_bytecode = True
ROOT = pathlib.Path(__file__).resolve().parent.parent
OUTPUT = pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교\베타-오리지널 원본 텍스처 밉맵.json')
spec = importlib.util.spec_from_file_location('original_audit', ROOT / 'tools/audit-early-frame-combinations.py')
audit = importlib.util.module_from_spec(spec)
spec.loader.exec_module(audit)
PC = ['3664','3749','3890','3937','4217','4243','4458','4482','4944']
IOS = ['14836313','563785077','588883794','608602673']


def levels(width, height, kind, mipmapped, size):
    if kind not in (10,12,32,33):
        return None
    offset = 0
    result = []
    while True:
        length = (max(width,8)*max(height,8)//2 if kind in (32,33) else
                  max(1,(width+3)//4) * max(1,(height+3)//4) * (8 if kind==10 else 16))
        result.append({'width':width,'height':height,'offset':offset,'bytes':length})
        offset += length
        if not mipmapped or (width == 1 and height == 1): break
        width, height = max(1,width//2), max(1,height//2)
    if offset != size:
        raise ValueError('Native compressed mip sizes do not match source bytes')
    return result


def read(platform, identity):
    a, source = audit.archive(platform, identity)
    try:
        if platform == 'pc':
            name = 'gameobjects.unity3d' if identity=='3664' else 'gameobjects0.unity3d'
            if identity=='3749': data=audit.mpq_member('Data\\'+name)
            else:
                folder=audit.DEVELOPMENT/'.codex-work/beta-extracted-20261101'/('1.0.0.'+identity)/'Data'
                if (folder/'Win').is_dir(): folder /= 'Win'
                data=(folder/name).read_bytes()
            a.env.load_file(data,name=name)
        else:
            name=next(n for n in a.zip.namelist() if n.endswith('/gameobjects0.unity3d'))
            a.load(name)
        path=audit.OUTPUT/'snapshots'/(platform+'-'+source['version']+('-'+identity if platform=='ios' else '')+'.json.gz')
        doc=json.loads(gzip.decompress(path.read_bytes()))
        result=[]
        for entry in doc['assets']:
            if entry['type']!=28: continue
            obj=a.obj(entry['key']); tree=obj.read_typetree()
            if hashlib.sha256(obj.get_raw_data()).hexdigest()!=entry['sourceSha256']:
                raise ValueError('Original serialized texture changed: '+entry['key'])
            image=obj.read().get_image_data()
            if hashlib.sha256(image).hexdigest()!=entry['nativeSha256']:
                raise ValueError('Original texture image changed: '+entry['key'])
            mip=bool(tree.get('m_MipMap',tree.get('m_MipCount',1)>1))
            fmt=tree['m_TextureFormat']
            result.append({'key':entry['key'],'name':entry['name'],'width':tree['m_Width'],'height':tree['m_Height'],
                           'unityFormat':fmt,'mipmapped':mip,'nativeBytes':len(image),'nativeSha256':entry['nativeSha256'],
                           'unityVersion':list(obj.version),'buildTarget':int(obj.platform),
                           'rgbaSha256':entry.get('rgbaSha256'),
                           'nativeImage':entry['nativeImage'],'levels':levels(tree['m_Width'],tree['m_Height'],fmt,mip,len(image))})
        return {'source':source,'textures':result}
    finally:
        a.close()


def main():
    if OUTPUT.exists() and '--refresh' not in sys.argv: raise FileExistsError(OUTPUT)
    records=[]
    for platform, identities in [('pc',PC),('ios',IOS)]:
        for identity in identities:
            row=read(platform,identity); records.append(row)
            kinds=collections.Counter((x['unityFormat'],x['mipmapped']) for x in row['textures'])
            print(json.dumps({'source':row['source'],'textures':len(row['textures']),'formats':str(kinds)},ensure_ascii=False),flush=True)
    OUTPUT.write_text(json.dumps({'scope':'Original serialized texture formats and raw mip byte ranges. A null levels field indicates an unimplemented format, not absence of mip data.','versions':records},ensure_ascii=False,indent=2),encoding='utf-8')


if __name__=='__main__': main()
