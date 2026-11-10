"""Create the original 4944 minion profile from the preceding 4217 profile."""
import copy, gzip, importlib.util, json, pathlib, re, base64, sys
sys.dont_write_bytecode=True
ROOT=pathlib.Path(__file__).resolve().parent.parent
spec=importlib.util.spec_from_file_location('previous',ROOT/'tools/generate-pc-4217-minion.py');g=importlib.util.module_from_spec(spec);spec.loader.exec_module(g)
HIST=g.HIST
def read(name):return g.read(HIST/name)

def main():
    profile=g.apply(g.apply(read('minion(2013-08-17).json.gz'),read('minion(2013-10-03).patch.json.gz')),read('minion(2013-12-12).patch.json.gz'))
    base=copy.deepcopy(profile);old=g.read(g.ORIGINAL/'PC 1.0.0.4217.json.gz');target=g.read(g.ORIGINAL/'PC 1.0.0.4944.json.gz')
    snap=read('early-native/snapshots/pc-1.0.0.4944.json.gz')
    if old['localizedFontDefsKoKR']!=target['localizedFontDefsKoKR']:raise ValueError('Original localized font definitions changed')
    for name in ['YDISapphIIM_Outline','2002']:
        a=[x['sha256'] for x in old['fonts'] if x['name']==name];b=[x['sha256'] for x in target['fonts'] if x['name']==name]
        if a!=b or len(a)!=1:raise ValueError('Original localized font changed: '+name)
    old_by_key={x['key']:x for x in old['assets']};new_by_key={x['key']:x for x in target['assets']};snapshot_assets={x['key']:x for x in snap['assets']}
    def names(doc,kind):
        result={}
        for item in doc['assets']:
            if item['type']==kind:result.setdefault(item['name'],[]).append(item)
        return result
    old_m=names(old,21);new_m=names(target,21);meshes=names(target,43)
    profile['version']='1.0.0.4944';profile['effectiveFromKst']='2014-03-13'
    profile['source']={'platform':'Windows','snapshot':'early-native/snapshots/pc-1.0.0.4944.json.gz',
        'snapshotSha256':g.sha((HIST/'early-native/snapshots/pc-1.0.0.4944.json.gz').read_bytes()),'bundles':snap['evidence']['bundles']}
    for name in profile['meshes']:
        choices=meshes.get(name,[])
        if len(choices)!=1:raise ValueError('Ambiguous 4944 mesh: '+name)
        profile['meshes'][name]={'name':name,**choices[0]['mesh']}
    textures={}
    def texture(item):
        if item['type']!=28 or 'png' not in item:raise ValueError('Original texture missing '+item['name'])
        key=item['name']+'@'+item['rgbaSha256'][:16]+'@'+str(item['sampler']['m_FilterMode'])
        row={'name':item['name'],'width':item['width'],'height':item['height'],'rgbaSha256':item['rgbaSha256'],
             'encoding':'png-rgba32','file':item['png']['file'],'pngSha256':item['png']['sha256'],'sampler':item['sampler']}
        if key in textures and textures[key]!=row:raise ValueError('Texture key collision')
        textures[key]=row;return key
    classes=['NEUTRAL','WARLOCK','ROGUE','DRUID','SHAMAN','HUNTER','MAGE','PALADIN','PRIEST','WARRIOR']
    refs=target['classColors']['minionCardTextures']
    if len(refs)!=len(classes):raise ValueError('Unexpected original class texture table')
    for cls,ref in zip(classes,refs):
        key=ref['ref']
        if key not in snapshot_assets:raise ValueError('Original class texture unavailable '+cls)
        profile['classes'][cls]=texture(snapshot_assets[key])
    for name,m in profile['materials'].items():
        if len(old_m.get(name,[]))!=1 or len(new_m.get(name,[]))!=1:raise ValueError('Original material unavailable '+name)
        om=old_m[name][0]['properties'];nm=new_m[name][0]['properties'];os=old_by_key[om['m_Shader']['ref']];ns=new_by_key[nm['m_Shader']['ref']]
        programs=lambda x:sorted(p['sha256'] for p in x['d3d11Programs'])
        if os['name']!=ns['name']:raise ValueError('Shader identity changed '+name)
        if programs(os)!=programs(ns):
            if ns['name']!='DiffuseAlphaMaskScroller':raise ValueError('Untranslated 4944 shader '+name)
            if not any(p['sha256']=='568bd70a9cf0f914e66a3a7654da47394c5085e1ecb2c1c783cf93b2454091f0' for p in ns['d3d11Programs']):raise ValueError('Wrong original 4944 vertex program')
            m['shader']='Native/DiffuseAlphaMaskScroller_PC4944'
        props=nm['m_SavedProperties'];head=base64.b64decode(ns['nativeShader']).decode().split('Program "vp"')[0];values={}
        for k,v in re.findall(r'\b(\w+)\s*\("[^"\n]*",\s*(?:Float|Range\([^)]*\))\)\s*=\s*([-+.0-9eE]+)',head):values[k]=[float(v)]
        for k,v in re.findall(r'\b(\w+)\s*\("[^"\n]*",\s*(?:Color|Vector)\)\s*=\s*\(([^)]+)\)',head):values[k]=list(map(float,v.split(',')))
        values.update({k:[v] for k,v in props['m_Floats'].items()});values.update({k:list(v.values()) if isinstance(v,dict) else v for k,v in props['m_Colors'].items()})
        old_tex=m['textures'];new_tex={}
        for prop,val in props['m_TexEnvs'].items():
            ref=val['m_Texture']['ref']
            if ref:
                if ref not in snapshot_assets:raise ValueError('Original material texture missing '+name+' '+prop)
                new_tex[prop]={'key':texture(snapshot_assets[ref]),'st':[val['m_Scale']['x'],val['m_Scale']['y'],val['m_Offset']['x'],val['m_Offset']['y']]}
            elif prop=='_MainTex' and 'AllyPortrait' in name and prop in old_tex:
                # Portrait is supplied dynamically at render time. Retain a
                # placeholder binding; its pixels are never used as card art.
                placeholder=old_tex[prop]['key'];textures[placeholder]=base['textures'][placeholder];new_tex[prop]=old_tex[prop]
        m.update({'keywords':nm.get('m_ShaderKeywords',[]),'queue':nm.get('m_CustomRenderQueue',-1),'values':values,'textures':new_tex})
    profile['textures']=textures
    for package in profile['packages']:
        prefab=next(p for p in target['prefabs'] if p['name']==package['name']);by_path={n['path']:n for n in prefab['nodes']}
        actor=next(c['settings'] for c in prefab['nodes'][0]['components'] if 'm_cardFrontMatIdx' in c.get('settings',{}))
        for k in package['actor']:
            if actor[k]!=package['actor'][k]:raise ValueError('Actor slot changed '+k)
        for node in package['nodes']:
            if node['path'] not in by_path:raise ValueError('Original frame node missing '+node['path'])
            original=by_path[node['path']];node['pose']=g.pose(prefab,node['path'])
            if original.get('mesh') and new_by_key[original['mesh']]['name']!=node['mesh']:raise ValueError('Node mesh association changed '+node['path'])
            for slot in node['slots']:
                refs=original.get('materials',[])
                if slot['slot']>=len(refs) or new_by_key[refs[slot['slot']]]['name']!=slot['material']:raise ValueError('Node material association changed '+node['path'])
    spec=importlib.util.spec_from_file_location('components',r'E:\HSPlus\development\scripts\export-historical-components.py');components=importlib.util.module_from_spec(spec);spec.loader.exec_module(components)
    roles=['m_nameTextMesh','m_powersTextMesh','m_costTextMesh','m_attackTextMesh','m_healthTextMesh','m_raceTextMesh']
    text=components.beta_text_profile('4944',{'Card_Hand_Ally':roles,'Card_Hand_Ally_Premium':roles})
    for row in text['rows']:
        current=profile['texts'][row['prefab']][row['role']];settings=row['settings']
        for key,value in current['settings'].items():
            if key.endswith('Modifier') or key=='m_SingleLineAdjustment':settings[key]=value
        locale=settings.get('m_LocalizedSettings',{});adjustments=locale.get('m_LocaleAdjustments')
        if isinstance(adjustments,list):locale['m_LocaleAdjustments']={'Array':adjustments}
        current['settings']=settings;current['binding']={'sourcePose':row['sourcePose'],'destinationPose':row['destinationPose']}
        if row['mesh']:
            mesh=new_by_key[row['mesh']['key']]['name']
            if mesh not in profile['meshes']:raise ValueError('Text destination mesh unavailable')
            current['mesh']=mesh
        else:current['mesh']=None
    patch={'schema':1,'baseVersion':'1.0.0.4217','version':'1.0.0.4944','operations':g.diff(base,profile)}
    packed=gzip.compress(g.encode(patch),mtime=0);descriptor=g.write('minion(2014-03-13).patch.json.gz',packed)
    descriptor.update({'version':'1.0.0.4944','baseVersion':'1.0.0.4217','effectiveFromKst':'2014-03-13'})
    manifest=json.loads((HIST/'native-minion-profiles.json').read_bytes());matches=[x for x in manifest['profiles'] if x['version']=='1.0.0.4944']
    if matches and matches!=[descriptor]:raise ValueError('Existing 4944 manifest differs')
    if not matches:manifest['profiles'].append(descriptor)
    (HIST/'native-minion-profiles.json').write_bytes(g.encode(manifest))
    print(json.dumps({'version':profile['version'],'operations':len(patch['operations']),'textures':len(textures),'materials':len(profile['materials']),'meshes':len(profile['meshes'])}))
if __name__=='__main__':main()
