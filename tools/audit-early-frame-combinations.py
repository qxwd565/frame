"""Read original early PC/iOS card graphs and preserve their source assets.

ZIP/MPQ members stay in RAM. Output is a content-addressed frame API source,
not a claim that source-build release dates equal Korean patch dates.
"""
import argparse
import base64
import gzip
import hashlib
import importlib.util
import io
import json
import pathlib
import re
import subprocess
import sys

from PIL import Image
sys.dont_write_bytecode = True

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUTPUT = ROOT / 'v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native'
IPA = pathlib.Path(r'E:\hearthstone card\하스스톤 IPA 전체 버전')
DEVELOPMENT = pathlib.Path(r'E:\HSPlus\development')
VERSIONS = json.loads((IPA / '버전 목록.json').read_bytes())['versions']
PC = ['3664', '3749', '3890', '3937', '4217', '4243', '4458', '4482', '4944']
PREFABS = ['Card_Hand_' + f + suffix for f in ['Ally', 'Ability', 'Weapon'] for suffix in ['', '_Premium']]

def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec); spec.loader.exec_module(value)
    return value

native = module('native', DEVELOPMENT / 'scripts/native-component-source.py')
components = module('components', DEVELOPMENT / 'scripts/export-historical-components.py')

def sha(data): return hashlib.sha256(data).hexdigest()
def encoded(value): return (json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(',', ':'))+'\n').encode()
def put(relative, data):
    target = OUTPUT / relative; target.parent.mkdir(parents=True, exist_ok=True)
    if target.exists() and target.read_bytes() != data: raise ValueError('Existing different resource: ' + str(target))
    if not target.exists(): target.write_bytes(data)
    return 'early-native/' + relative.as_posix()
BLOB_CACHE = {}
def blob(kind, raw, extension):
    digest = sha(raw); name = pathlib.Path('objects') / kind / (digest + extension); key = name.as_posix()
    if key in BLOB_CACHE: return BLOB_CACHE[key]
    target = OUTPUT / name
    if target.exists():
        payload=target.read_bytes(); checked=gzip.decompress(payload) if extension.endswith('.gz') else payload
        if sha(checked)!=digest: raise ValueError('Existing original object corrupted: '+str(target))
        file='early-native/'+key
    else:
        payload = gzip.compress(raw, compresslevel=6, mtime=0) if extension.endswith('.gz') else raw
        file=put(name,payload)
    result={'file':file, 'rawSha256':digest, 'rawBytes':len(raw), 'bytes':len(payload), 'sha256':sha(payload)}
    BLOB_CACHE[key]=result
    return result

def archive(platform, identity):
    if platform == 'pc': return components.beta_archive(identity), {'version': '1.0.0.' + identity, 'platform': 'Windows'}
    row = VERSIONS[identity]
    provenance = IPA / '카드별 변경 이력/외형 원본/versions' / (identity + '.json')
    return native.Archive(row['file'], provenance), {'version': row['version'], 'platform': 'iOS', 'archiveId': identity,
        'archiveSha256': row.get('sha256'), 'appStoreReleaseDateUtc': row.get('releaseDate')}

def mpq_member(name):
    import ctypes as c
    from ctypes import wintypes as w
    root = DEVELOPMENT / '.codex-work/beta-client-originals-20261101'
    lib = c.WinDLL(str(root / 'tools/stormlib/StormLib.dll')); H=w.HANDLE; D=w.DWORD
    for method, args, result in [('SFileOpenArchive',[w.LPCWSTR,D,D,c.POINTER(H)],c.c_bool),
            ('SFileOpenFileEx',[H,c.c_char_p,D,c.POINTER(H)],c.c_bool), ('SFileGetFileSize',[H,c.POINTER(D)],D),
            ('SFileReadFile',[H,c.c_void_p,D,c.POINTER(D),c.c_void_p],c.c_bool), ('SFileCloseFile',[H],c.c_bool), ('SFileCloseArchive',[H],c.c_bool)]:
        getattr(lib,method).argtypes=args; getattr(lib,method).restype=result
    archive=H(); member=H()
    if not lib.SFileOpenArchive(str(root / '3749-input/base-Win.MPQ'),0,0x100,c.byref(archive)): raise OSError('MPQ open failed')
    try:
        if not lib.SFileOpenFileEx(archive,name.encode(),0,c.byref(member)): raise FileNotFoundError(name)
        try:
            high=D(); size=lib.SFileGetFileSize(member,c.byref(high)); data=c.create_string_buffer(size); read=D()
            if high.value or not lib.SFileReadFile(member,data,size,c.byref(read),None) or read.value!=size: raise OSError('MPQ read failed')
            return data.raw
        finally: lib.SFileCloseFile(member)
    finally: lib.SFileCloseArchive(archive)

def extra_class_textures(a, platform, identity):
    if platform == 'ios':
        for name in a.zip.namelist():
            if re.search(r'/gameobjects\d+\.unity3d$', name): a.load(name)
    else:
        name = 'gameobjects.unity3d' if identity == '3664' else 'gameobjects0.unity3d'
        if identity == '3749': data = mpq_member('Data\\' + name)
        else:
            folder = DEVELOPMENT / '.codex-work/beta-extracted-20261101' / ('1.0.0.' + identity) / 'Data'
            if (folder / 'Win').is_dir(): folder /= 'Win'
            data = (folder / name).read_bytes()
        a.env.load_file(data, name=name); a.loaded[name] = sha(data)
    count = 0
    for obj in list(a.env.objects):
        if obj.type.name == 'Texture2D' and re.match(r'^Card_InHand_', obj.peek_name() or '', re.I):
            a.include(a.key(obj)); count += 1
    return count

def reconstruct(a, prefabs, platform, failures):
    unresolved=[]; classes=set()
    for prefab in prefabs:
        for node in prefab['nodes']:
            for component in node['components']:
                obj=a.obj(component['source'])
                component['originalObject']=blob('unity-object',obj.get_raw_data(),'.bin.gz')
                if component.get('unresolved'):
                    try:
                        head=obj.read_typetree(check_read=False); ref=a.ref(head.get('m_Script'),obj.assets_file)
                        script=a.obj(ref).read(); full=(script.m_Namespace+'.' if script.m_Namespace else '')+script.m_ClassName
                        unresolved.append((component,obj,full)); classes.add(full)
                    except Exception as error: failures.append({'component':component['source'],'reason':str(error)})
    if not unresolved or platform!='ios': return
    from UnityPy.helpers.TypeTreeNode import TypeTreeNode
    unity='.'.join(str(n) for n in list(unresolved[0][1].version)[:3])
    shell=r'C:\Users\e_ldy\.cache\codex-runtimes\codex-primary-runtime\dependencies\native\powershell\pwsh.exe'
    cmd=[shell,'-NoProfile','-NonInteractive','-File',str(DEVELOPMENT/'scripts/read-ipa-typetrees.ps1'),
         '-Ipa',str(a.ipa),'-Unity',unity,'-Classes',','.join(sorted(classes))]
    try:
        result=subprocess.run(cmd,stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=180)
        if result.returncode: raise ValueError(result.stderr.decode(errors='replace')[:400])
        trees={name:TypeTreeNode.from_list(rows) for name,rows in json.loads(result.stdout.decode('utf-8-sig')).items()}
        for component,obj,name in unresolved:
            try:
                component['settings']=a.normalize(obj.read_typetree(nodes=trees[name]),obj.assets_file)
                component['typeTreeFromOriginalManagedAssembly']=name
                component.pop('unresolved',None)
            except Exception as error: failures.append({'component':component['source'],'class':name,'reason':str(error)})
    except Exception as error: failures.append({'originalManagedTypeTrees':sorted(classes),'reason':str(error)})

def include_component_dependencies(a,prefabs,failures):
    known={n['source'] for p in prefabs for n in p['nodes']}
    known.update(c['source'] for p in prefabs for n in p['nodes'] for c in n['components'])
    known.update(r['source'] for p in prefabs for n in p['nodes'] for r in n.get('renderers',[]))
    refs=set()
    def walk(value):
        if isinstance(value,dict):
            if set(value)=={'ref'} and isinstance(value['ref'],str): refs.add(value['ref'])
            else:
                for item in value.values(): walk(item)
        elif isinstance(value,list):
            for item in value: walk(item)
    walk(prefabs)
    seen=set()
    while refs-seen:
        ref=(refs-seen).pop();seen.add(ref)
        if ref in known: continue
        try:
            obj=a.obj(ref); typ=obj.type.name
            if typ in ('Material','Mesh','Shader','Texture2D'):
                if ref not in a.assets: a.include(ref)
                walk(a.assets[ref].get('properties')); continue
            if ref not in a.assets:
                raw=obj.get_raw_data(); tree=obj.read_typetree()
                row={'key':ref,'type':obj.type.value,'name':tree.get('m_Name',''), 'sourceSha256':sha(raw)}
                if typ=='Font':
                    font=bytes(obj.read().m_FontData or b'')
                    row['fontData']=blob('font',font,'.font.gz') if font else None
                    row['fontMetadata']={k:v for k,v in tree.items() if k not in ('m_FontData','m_CharacterRects')}
                elif typ=='MonoScript':
                    row['scriptMetadata']={k:v for k,v in tree.items() if k in ('m_ClassName','m_Namespace','m_AssemblyName')}
                else:
                    row['referenceMetadata']={'unityType':typ}
                a.assets[ref]=row
        except Exception as error: failures.append({'referencedObject':ref,'reason':str(error)})

def managed_assemblies(a,platform,identity,failures):
    names=sorted({a['scriptMetadata'].get('m_AssemblyName','') for a in a.assets.values() if a.get('scriptMetadata')})
    result=[]
    for name in names:
        if not name:continue
        try:
            if platform=='ios':
                entries=[x for x in a.zip.namelist() if x.lower().endswith('/managed/'+name.lower())]
                if not entries and name=='Assembly-CSharp.dll':
                    info={'name':name,'kind':'IL2CPP','original':None}
                    metadata=[x for x in a.zip.namelist() if x.lower().endswith('/metadata/global-metadata.dat')]
                    if len(metadata)==1: info['metadata']=blob('il2cpp-metadata',a.zip.read(metadata[0]),'.dat.gz')
                    executables=[x for x in a.zip.infolist() if x.filename.lower().endswith('/hearthstone.app/hearthstone')]
                    if len(executables)==1:
                        exe=executables[0];info['nativeExecutable']={'archivePath':exe.filename,'bytes':exe.file_size,'crc32':format(exe.CRC,'08x'),'exported':False}
                    result.append(info)
                    failures.append({'nativeExecutableNotExported':name,'reason':'IL2CPP code is in the original IPA executable; the executable is not included in the API.'})
                    continue
                if len(entries)!=1: raise FileNotFoundError('Managed assembly absent or ambiguous: '+name)
                raw=a.zip.read(entries[0])
            elif identity=='3749':raw=mpq_member('Hearthstone_Data\\Managed\\'+name)
            else:raw=(DEVELOPMENT/'.codex-work/beta-extracted-20261101'/('1.0.0.'+identity)/'Hearthstone_Data/Managed'/name).read_bytes()
            result.append({'name':name, 'original':blob('managed-assembly',raw,'.dll.gz')})
        except Exception as error: failures.append({'managedAssembly':name,'reason':str(error)})
    return result

def audit(platform, identity, refresh=False):
    a, source = archive(platform, identity)
    failures = []; prefabs = []
    try:
        for name in PREFABS:
            try:
                p = a.prefab(name)
                for node in p['nodes']:
                    game=a.obj(node['source']); tree=game.read_typetree()
                    node['originalObject']=blob('unity-object',game.get_raw_data(),'.bin.gz')
                    node['gameObject']={k:tree[k] for k in ('m_Layer','m_Tag','m_IsActive') if k in tree}
                    node['renderers']=[]
                    for pair in tree['m_Component']:
                        pointer=pair[1] if isinstance(pair,(list,tuple)) else pair.get('component',pair.get('second'))
                        ref=a.ref(pointer,game.assets_file)
                        if not ref: continue
                        renderer=a.obj(ref)
                        if renderer.type.name=='MeshRenderer':
                            node['renderers'].append({'source':ref, 'settings':a.normalize(renderer.read_typetree(),renderer.assets_file),
                                'originalObject':blob('unity-object',renderer.get_raw_data(),'.bin.gz')})
                    for ref in [node.get('mesh'), *node.get('materials', [])]:
                        if ref: a.include(ref)
                prefabs.append(p)
            except Exception as error:
                failures.append({'prefab': name, 'reason': str(error)})
        reconstruct(a,prefabs,platform,failures)
        try: dynamic = extra_class_textures(a, platform, identity)
        except Exception as error:
            failures.append({'dynamicClassTextures': str(error)}); dynamic = 0
        include_component_dependencies(a,prefabs,failures)
        assemblies=managed_assemblies(a,platform,identity,failures)
        assets = []
        for key, item in a.assets.items():
            row = {k: v for k, v in item.items() if k != 'data'}
            try:
                obj = a.obj(key)
                raw = obj.get_raw_data()
                if sha(raw) != item['sourceSha256']: raise ValueError('Unity object hash mismatch')
                row['originalObject'] = blob('unity-object', raw, '.bin.gz')
                if item['type'] == 28:
                    pixels = gzip.decompress(base64.b64decode(item['data'], validate=True))
                    if sha(pixels) != item['rgbaSha256'] or len(pixels) != 4*item['width']*item['height']:
                        raise ValueError('Texture pixels mismatch')
                    img = Image.frombytes('RGBA', (item['width'], item['height']), pixels); out = io.BytesIO(); img.save(out, format='PNG')
                    row['png'] = blob('texture', out.getvalue(), '.png')
                    raw_image = obj.read().get_image_data()
                    if sha(raw_image) != item['nativeSha256']: raise ValueError('Native texture bytes mismatch')
                    row['nativeImage'] = blob('texture-native', raw_image, '.bin.gz')
                if item['type'] == 48:
                    script = obj.read_typetree().get('m_Script')
                    if isinstance(script, str): row['shaderSource'] = blob('shader', script.encode('utf-8'), '.shader.gz')
                    elif isinstance(script, bytes): row['shaderSource'] = blob('shader', script, '.shader.gz')
                    else: failures.append({'shaderSource': key, 'reason': 'No legacy shader script field'})
            except Exception as error:
                failures.append({'asset': key, 'reason': str(error)})
            assets.append(row)
        evidence = a.evidence()
        result = {'schema': 1, 'source': source, 'evidence': evidence, 'prefabs': prefabs, 'assets': assets, 'managedAssemblies':assemblies,
            'coverage': {'requestedPrefabs': PREFABS, 'readPrefabs': len(prefabs), 'dynamicClassTextures': dynamic,
                         'unresolvedMonoBehaviours': sum(bool(c.get('unresolved')) for p in prefabs for n in p['nodes'] for c in n['components']),
                         'failures': failures}}
        payload = gzip.compress(encoded(result), compresslevel=6, mtime=0)
        name = pathlib.Path('snapshots') / (platform + '-' + source['version'] + ('-' + identity if platform == 'ios' else '') + '.json.gz')
        destination = OUTPUT / name; destination.parent.mkdir(parents=True, exist_ok=True)
        if destination.exists() and destination.read_bytes() != payload:
            if not refresh or json.loads(gzip.decompress(destination.read_bytes()))['source'] != source:
                raise ValueError('Snapshot changed: ' + str(destination))
            destination.write_bytes(payload)
        elif not destination.exists(): destination.write_bytes(payload)
        print(json.dumps({'source': source, 'snapshot': 'early-native/' + name.as_posix(), 'assets': len(assets),
            'objects': sum(1 for a in assets if a.get('originalObject')), 'errors': len(failures), 'unresolved': result['coverage']['unresolvedMonoBehaviours']}, ensure_ascii=False), flush=True)
    finally: a.close()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(); parser.add_argument('platform', choices=['pc', 'ios']); parser.add_argument('identity'); parser.add_argument('--refresh',action='store_true')
    args = parser.parse_args(); audit(args.platform, args.identity, args.refresh)
