"""Create a 4217 minion profile from original PC resources, as a sparse patch."""
import base64
import copy
import gzip
import hashlib
import importlib.util
import json
import pathlib
import re
import sys

import numpy as np
sys.dont_write_bytecode=True
sys.path.insert(0,r'E:\hearthstone card\tools\unitypy')
import UnityPy

ROOT=pathlib.Path(__file__).resolve().parent.parent
HIST=ROOT/'v7.14.4-webgpu-20261109/assets/unity/historical-frames'
ORIGINAL=pathlib.Path(r'E:\hearthstone card\하수인 원본 렌더\원본 추출')
def read(path):return json.loads(gzip.decompress(path.read_bytes()))
def encode(value):return (json.dumps(value,ensure_ascii=False,sort_keys=True,separators=(',',':'))+'\n').encode()
def sha(data):return hashlib.sha256(data).hexdigest()
def write(name,data):
    path=HIST/name
    if path.exists() and path.read_bytes()!=data:raise ValueError('Existing different profile: '+str(path))
    path.write_bytes(data)
    return {'file':name,'bytes':len(data),'sha256':sha(data)}
def apply(base,patch):
    result=copy.deepcopy(base)
    for op in patch['operations']:
        target=result
        for key in op['path'][:-1]:target=target[key]
        if op.get('remove'):target.pop(op['path'][-1],None)
        else:target[op['path'][-1]]=op['value']
    return result
def trs(node):
    q=node['rotation'];x,y,z=[q[k] for k in 'xyz'];w=q['w']
    cross=np.array([[0,-z,y],[z,0,-x],[-y,x,0]])
    out=np.eye(4);out[:3,:3]=(np.eye(3)+2*w*cross+2*cross@cross)@np.diag([node['scale'][k] for k in 'xyz']);out[:3,3]=[node['position'][k] for k in 'xyz'];return out
def pose(prefab,path):
    result=np.eye(4)
    for node in prefab['nodes']:
        if node['path']!=prefab['name'] and (path==node['path'] or path.startswith(node['path']+'/')):result=result@trs(node)
    return result.flatten(order='F').tolist()
def diff(old,new,path=()):
    if old==new:return []
    if isinstance(old,dict) and isinstance(new,dict):
        out=[]
        for key in sorted(old.keys()-new.keys()):out.append({'path':[*path,key],'remove':True})
        for key in sorted(new.keys()-old.keys()):out.append({'path':[*path,key],'value':new[key]})
        for key in sorted(old.keys()&new.keys()):out.extend(diff(old[key],new[key],(*path,key)))
        return out
    return [{'path':list(path),'value':new}]

def main():
    base=apply(read(HIST/'minion(2013-08-17).json.gz'),read(HIST/'minion(2013-10-03).patch.json.gz'))
    old=read(ORIGINAL/'PC 1.0.0.3890.json.gz'); target=read(ORIGINAL/'PC 1.0.0.4217.json.gz')
    snap=read(HIST/'early-native/snapshots/pc-1.0.0.4217.json.gz')
    if old['classColors']!=target['classColors'] or old['localizedFontDefsKoKR']!=target['localizedFontDefsKoKR']:
        raise ValueError('Class or Korean font binding changed; update converter')
    old_assets={x['key']:x for x in old['assets']}; new_assets={x['key']:x for x in target['assets']}; snapshot_assets={x['key']:x for x in snap['assets']}
    def names(doc,kind):
        groups={}
        for item in doc['assets']:
            if item['type']==kind:groups.setdefault(item['name'],[]).append(item)
        return groups
    old_materials=names(old,21);new_materials=names(target,21);new_meshes=names(target,43);textures=names(snap,28)
    profile=copy.deepcopy(base);profile['version']='1.0.0.4217';profile['effectiveFromKst']='2013-12-12'
    profile['source']={'platform':'Windows','snapshot':'early-native/snapshots/pc-1.0.0.4217.json.gz',
        'snapshotSha256':sha((HIST/'early-native/snapshots/pc-1.0.0.4217.json.gz').read_bytes()),'bundles':snap['evidence']['bundles']}
    for name,mesh in list(profile['meshes'].items()):
        choices=new_meshes.get(name,[])
        if len(choices)!=1:raise ValueError('Ambiguous 4217 mesh: '+name)
        profile['meshes'][name]={'name':name,**choices[0]['mesh']}
    texture_rows={}
    def texture(item):
        if item['type']!=28 or 'png' not in item:raise ValueError('Missing original PNG '+item['name'])
        key=item['name']+'@'+item['rgbaSha256'][:16]+'@'+str(item['sampler']['m_FilterMode'])
        row={'name':item['name'],'width':item['width'],'height':item['height'],'rgbaSha256':item['rgbaSha256'],
             'encoding':'png-rgba32','file':item['png']['file'],'pngSha256':item['png']['sha256'],'sampler':item['sampler']}
        if key in texture_rows and texture_rows[key]!=row:raise ValueError('Texture key collision')
        texture_rows[key]=row;return key
    for cls,old_name in list(profile['classes'].items()):
        choices=textures.get(old_name,[])
        if not choices or len({(x['rgbaSha256'],json.dumps(x['sampler'],sort_keys=True)) for x in choices})!=1:raise ValueError('Ambiguous class texture '+old_name)
        profile['classes'][cls]=texture(choices[0])
    for name,m in profile['materials'].items():
        if len(new_materials.get(name,[]))!=1 or len(old_materials.get(name,[]))!=1:raise ValueError('Material unavailable '+name)
        old_mat=old_materials[name][0]['properties']; mat=new_materials[name][0]['properties']
        old_shader=old_assets[old_mat['m_Shader']['ref']];new_shader=new_assets[mat['m_Shader']['ref']]
        programs=lambda x:sorted(p['sha256'] for p in x['d3d11Programs'])
        if old_shader['name']!=new_shader['name'] or programs(old_shader)!=programs(new_shader):raise ValueError('Untranslated 4217 shader '+name)
        p=mat['m_SavedProperties']; head=base64.b64decode(new_shader['nativeShader']).decode().split('Program "vp"')[0];values={}
        for k,v in re.findall(r'\b(\w+)\s*\("[^"\n]*",\s*(?:Float|Range\([^)]*\))\)\s*=\s*([-+.0-9eE]+)',head):values[k]=[float(v)]
        for k,v in re.findall(r'\b(\w+)\s*\("[^"\n]*",\s*(?:Color|Vector)\)\s*=\s*\(([^)]+)\)',head):values[k]=list(map(float,v.split(',')))
        values.update({k:[v] for k,v in p['m_Floats'].items()});values.update({k:list(v.values()) if isinstance(v,dict) else v for k,v in p['m_Colors'].items()})
        tex={}
        for prop,v in p['m_TexEnvs'].items():
            ref=v['m_Texture']['ref']
            if ref:
                if ref not in snapshot_assets:raise ValueError('Material texture missing '+name+' '+prop)
                tex[prop]={'key':texture(snapshot_assets[ref]),'st':[v['m_Scale']['x'],v['m_Scale']['y'],v['m_Offset']['x'],v['m_Offset']['y']]}
        m.update({'keywords':mat.get('m_ShaderKeywords',[]),'queue':mat.get('m_CustomRenderQueue',-1),'values':values,'textures':tex})
    profile['textures']=texture_rows
    for package in profile['packages']:
        src=next(p for p in target['prefabs'] if p['name']==package['name']);by_path={n['path']:n for n in src['nodes']}
        for node in package['nodes']:
            if node['path'] not in by_path:raise ValueError('4217 frame node missing '+node['path'])
            original=by_path[node['path']];node['pose']=pose(src,node['path'])
            if original.get('mesh'):
                actual=new_assets[original['mesh']]['name']
                if actual!=node['mesh']:raise ValueError('Changed node mesh association: '+node['path'])
            for slot in node['slots']:
                refs=original.get('materials',[])
                if slot['slot']>=len(refs) or new_assets[refs[slot['slot']]]['name']!=slot['material']:
                    raise ValueError('Changed node material association: '+node['path'])
    # Reuse localized modifier mappings only after exact equality was checked above.
    spec=importlib.util.spec_from_file_location('components',r'E:\HSPlus\development\scripts\export-historical-components.py')
    components=importlib.util.module_from_spec(spec);spec.loader.exec_module(components)
    roles=['m_nameTextMesh','m_powersTextMesh','m_costTextMesh','m_attackTextMesh','m_healthTextMesh','m_raceTextMesh']
    text_profile=components.beta_text_profile('4217',{'Card_Hand_Ally':roles,'Card_Hand_Ally_Premium':roles})
    for row in text_profile['rows']:
        current=profile['texts'][row['prefab']][row['role']];settings=row['settings']
        for key,value in current['settings'].items():
            if key.endswith('Modifier') or key=='m_SingleLineAdjustment':settings[key]=value
        loc=settings.get('m_LocalizedSettings',{});adjustments=loc.get('m_LocaleAdjustments')
        if isinstance(adjustments,list):loc['m_LocaleAdjustments']={'Array':adjustments}
        current['settings']=settings;current['binding']={'sourcePose':row['sourcePose'],'destinationPose':row['destinationPose']}
        if row['mesh']:
            mesh=new_assets[row['mesh']['key']]['name']
            if mesh not in profile['meshes']:raise ValueError('Text destination mesh unavailable')
            current['mesh']=mesh
        else:current['mesh']=None
        if current['font']:current['font']=current['font'].replace('PC3890-','PC4217-')
    fontroot=pathlib.Path(r'E:\HSPlus\development\.codex-work\beta-extracted-20261101\1.0.0.4217\Data\Win')
    fontmeta={}
    for obj in UnityPy.load(str(fontroot/'fontskoKR0.unity3d')).objects:
        if obj.type.name=='Font' and obj.peek_name() in ('YDISapphIIM_Outline','2002'):
            tree=obj.read_typetree();fontmeta[obj.peek_name()]={k:tree[k] for k in ['m_Ascent','m_CharacterPadding','m_FontSize','m_LineSpacing']}
    fontmap={};fontsettings=[]
    for name in ['YDISapphIIM_Outline','2002']:
        matches=[x for x in target['fonts'] if x['name']==name]
        if len(matches)!=1 or name not in fontmeta:raise ValueError('Original Korean font missing '+name)
        item=matches[0];binary=base64.b64decode(item['fontData'],validate=True)
        if sha(binary)!=item['sha256']:raise ValueError('Original Korean font changed')
        fontname='PC4217-'+name;fontmap[fontname]={'name':fontname,'sha256':item['sha256'],'data':item['fontData']}
        fontsettings.append({'name':fontname,'sha256':item['sha256'],'settings':fontmeta[name]})
    packed=gzip.compress(encode({'schema':1,'fonts':fontmap}),mtime=0)
    profile['fonts']=write('minion-fonts(2013-12-12).json.gz',packed);profile['fontSettings']=fontsettings
    patch={'schema':1,'baseVersion':'1.0.0.3890','version':'1.0.0.4217','operations':diff(base,profile)}
    packed=gzip.compress(encode(patch),mtime=0);descriptor=write('minion(2013-12-12).patch.json.gz',packed)
    descriptor.update({'version':'1.0.0.4217','baseVersion':'1.0.0.3890','effectiveFromKst':'2013-12-12'})
    manifest=json.loads((HIST/'native-minion-profiles.json').read_bytes());matches=[x for x in manifest['profiles'] if x['version']=='1.0.0.4217']
    if matches and matches!=[descriptor]:raise ValueError('Existing 4217 manifest differs')
    if not matches:manifest['profiles'].append(descriptor)
    (HIST/'native-minion-profiles.json').write_bytes(encode(manifest))
    print(json.dumps({'version':profile['version'],'operations':len(patch['operations']),'textures':len(texture_rows),'materials':len(profile['materials']),'meshes':len(profile['meshes'])}))

if __name__=='__main__':main()
