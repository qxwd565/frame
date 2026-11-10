"""Bind existing native minion profiles to their own original DXT mip bytes.

Identical native byte streams are represented once; a binding never substitutes
another version and cannot change the original dimensions or sampler.
"""
import copy
import gzip
import hashlib
import json
import pathlib

ROOT=pathlib.Path(__file__).resolve().parent.parent
HIST=ROOT/'v7.14.4-webgpu-20261109/assets/unity/historical-frames'
MIPS=pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교\베타-오리지널 원본 텍스처 밉맵.json')
OUT=HIST/'early-native/minion-mip-bindings.json.gz'

def read(path): return json.loads(gzip.decompress(path.read_bytes()))
def apply(base,patch):
    if patch['baseVersion']!=base['version']: raise ValueError('Profile chain mismatch')
    data=copy.deepcopy(base)
    for op in patch['operations']:
        target=data
        for key in op['path'][:-1]: target=target[key]
        if op.get('remove'):target.pop(op['path'][-1])
        else:target[op['path'][-1]]=op['value']
    if data['version']!=patch['version']: raise ValueError('Profile version mismatch')
    return data

def main():
    profiles=[read(HIST/'minion(2013-08-17).json.gz')]
    for path in ['minion(2013-10-03).patch.json.gz','minion(2013-12-12).patch.json.gz','minion(2014-03-13).patch.json.gz']:
        profiles.append(apply(profiles[-1],read(HIST/path)))
    metadata=json.loads(MIPS.read_text(encoding='utf8'))
    textures={};bindings={};skipped=[]
    for profile in profiles:
        version=profile['version']
        snapshot=read(HIST/('early-native/snapshots/pc-'+version+'.json.gz'))
        source=next(v for v in metadata['versions'] if v['source']['platform']=='Windows' and v['source']['version']==version)
        by_key={a['key']:a for a in source['textures']}
        groups={}
        for a in snapshot['assets']:
            if a['type']==28:groups.setdefault((a['name'],a.get('rgbaSha256'),a.get('width'),a.get('height')),[]).append(a)
        values={}
        for key, row in profile['textures'].items():
            candidates=groups.get((row['name'],row.get('rgbaSha256'),row['width'],row['height']),[])
            candidates=[a for a in candidates if a.get('sampler')==row['sampler']]
            if not candidates:
                skipped.append({'version':version,'texture':key,'reason':'source bytes not uniquely identified'})
                continue
            matches=[by_key[a['key']] for a in candidates]
            signatures={(a['nativeSha256'],a['unityFormat'],a['nativeBytes']) for a in matches}
            if len(signatures)!=1:raise ValueError('Different original compressed streams for '+version+' '+key)
            original=matches[0]
            if original['unityFormat'] not in (10,12) or not original['levels']:
                skipped.append({'version':version,'texture':key,'reason':'format is not original DXT'})
                continue
            identity=original['nativeSha256']
            descriptor={'encoding':'unity-dxt-mips','width':original['width'],'height':original['height'],
                        'unityFormat':original['unityFormat'],'mipmapped':original['mipmapped'],
                        'nativeBytes':original['nativeBytes'],'nativeSha256':identity,
                        'file':original['nativeImage']['file'],'levels':original['levels']}
            if identity in textures and textures[identity]!=descriptor:raise ValueError('Native texture identity collision')
            textures[identity]=descriptor;values[key]=identity
        bindings[version]=values
    result={'schema':1,'scope':'Original PC DXT texture bytes and mip levels, resolved by original source version and pixel/sampler identity.',
            'textures':textures,'bindings':bindings,'skipped':skipped}
    payload=gzip.compress((json.dumps(result,ensure_ascii=False,sort_keys=True,separators=(',',':'))+'\n').encode(),mtime=0)
    if OUT.exists() and OUT.read_bytes()!=payload:raise FileExistsError('Existing binding differs')
    OUT.write_bytes(payload)
    print(json.dumps({'bytes':len(payload),'sha256':hashlib.sha256(payload).hexdigest(),
                      'uniqueOriginalTextures':len(textures),'bindings':{k:len(v) for k,v in bindings.items()},'skipped':skipped},ensure_ascii=False))

if __name__=='__main__':main()
