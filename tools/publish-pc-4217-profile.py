"""Publish verified 4217/4944 minion profiles and their original inputs."""
import gzip, hashlib, importlib.util, json, pathlib, urllib.parse, urllib.request
root=pathlib.Path(__file__).resolve().parent.parent
spec=importlib.util.spec_from_file_location('api',root/'tools/publish-frame-apis.py');api=importlib.util.module_from_spec(spec);spec.loader.exec_module(api)
source=root/'v7.14.4-webgpu-20261109/assets/unity'; prefix='historical-frames/'
index_path=root/'plugin/hscard/assets/unity/frame-api-index.json';index=json.loads(index_path.read_bytes())
def read(name):return json.loads(gzip.decompress((source/(prefix+name)).read_bytes()))
def apply(base,patch):
 import copy
 out=copy.deepcopy(base)
 for op in patch['operations']:
  target=out
  for k in op['path'][:-1]:target=target[k]
  if op.get('remove'):target.pop(op['path'][-1],None)
  else:target[op['path'][-1]]=op['value']
 return out
first=apply(apply(read('minion(2013-08-17).json.gz'),read('minion(2013-10-03).patch.json.gz')),read('minion(2013-12-12).patch.json.gz'))
second=apply(first,read('minion(2014-03-13).patch.json.gz'))
if first['version']!='1.0.0.4217' or second['version']!='1.0.0.4944':raise ValueError('Unexpected profiles')
names={prefix+'native-minion-profiles.json',prefix+'native-beta-shaders.json.gz',prefix+'minion(2013-12-12).patch.json.gz',
       prefix+'minion(2014-03-13).patch.json.gz',prefix+first['fonts']['file']}
sources={}
for profile in (first,second):
 for texture in profile['textures'].values():
  name=prefix+texture['file'];names.add(name);sources.setdefault(name,set()).add(profile['version'])
records={}
for name in names:
 data=(source/name).read_bytes()
 if name==prefix+'native-minion-profiles.json':record=dict(index['files'][name],bytes=len(data),sha256=hashlib.sha256(data).hexdigest())
 elif name==prefix+'native-beta-shaders.json.gz':record=dict(index['files'][name],bytes=len(data),sha256=hashlib.sha256(data).hexdigest(),sourceVersions=['1.0.0.3664','1.0.0.3890','1.0.0.4944'])
 else:record={'repository':'legacy','bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),
              'sourceVersions':sorted(sources.get(name,{'1.0.0.4944' if '2014-03-13' in name else '1.0.0.4217'})),
              'scope':'original-texture' if name.endswith('.png') else 'native-snapshot'}
 records[name]=record
remote='https://github.com/qxwd565/legacy.git';api.git('fetch','--no-tags','--filter=blob:none',remote,'main');parent=api.git('rev-parse','FETCH_HEAD').decode().strip()
def get(commit,name):
 url='https://raw.githubusercontent.com/qxwd565/legacy/'+commit+'/frame/'+urllib.parse.quote(name,safe='/')
 with urllib.request.urlopen(url,timeout=90) as response:return response.read()
catalog=json.loads(get(parent,'index.json'));catalog['files'].update(records)
updates={n:api.git('hash-object','-w','--stdin',data=(source/n).read_bytes()).decode().strip() for n in names}
updates['index.json']=api.git('hash-object','-w','--stdin',data=api.encoded(catalog)).decode().strip()
tree=api.tree_entries(parent);tree['frame']=('040000','tree',api.overlay_tree(tree['frame'][2],updates));tree_id=api.write_tree(tree)
if tree_id==api.git('rev-parse',parent+'^{tree}').decode().strip():commit=parent
else:
 commit=api.git('commit-tree',tree_id,'-p',parent,data=b'Add original PC 4217 minion frame profile\n').decode().strip()
 changed=set(api.git('diff-tree','--no-commit-id','--name-only','-r',parent,commit).decode().splitlines());allowed={'frame/index.json'}|{'frame/'+n for n in names}
 if changed-allowed:raise ValueError('Unexpected file in 4217 publication')
 api.git('push',remote,commit+':refs/heads/main')
for name in names:
 if get(commit,name)!=(source/name).read_bytes():raise ValueError('Profile public read-back mismatch '+name)
index['files'].update(records);index['repositories']['legacy']={'commit':commit,'base':f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/'}
index_path.write_bytes(api.encoded(index));print(json.dumps({'commit':commit,'files':len(names),'profiles':[first['version'],second['version']]}))
