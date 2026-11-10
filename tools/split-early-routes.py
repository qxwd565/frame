"""Move audit-only lookups into a verified, on-demand route table."""
import gzip,hashlib,importlib.util,json,pathlib,urllib.parse,urllib.request
root=pathlib.Path(__file__).resolve().parent.parent
spec=importlib.util.spec_from_file_location('api',root/'tools/publish-frame-apis.py');api=importlib.util.module_from_spec(spec);spec.loader.exec_module(api)
source=root/'v7.14.4-webgpu-20261109/assets/unity';index_path=root/'plugin/hscard/assets/unity/frame-api-index.json'
prefix='historical-frames/';early=prefix+'early-native/';route_name=early+'routes.json.gz'
def read(name):return json.loads(gzip.decompress((source/(prefix+name)).read_bytes()))
def apply(base,patch):
 import copy
 out=copy.deepcopy(base)
 for op in patch['operations']:
  t=out
  for k in op['path'][:-1]:t=t[k]
  if op.get('remove'):t.pop(op['path'][-1],None)
  else:t[op['path'][-1]]=op['value']
 return out
base=apply(read('minion(2013-08-17).json.gz'),read('minion(2013-10-03).patch.json.gz'))
profiles=[]
for name in ['minion(2013-12-12).patch.json.gz','minion(2014-03-13).patch.json.gz']:
 base=apply(base,read(name));profiles.append(base)
keep={early+x for x in ['index.json','pc-render-comparison.json','pc-webgpu-d3d-parity.json','ios-gles-render-comparison.json']}
for profile in profiles:keep.update(prefix+x['file'] for x in profile['textures'].values())
full=api.plan();audit={n:r for n,r in full.items() if n.startswith(early)}
if not keep<=audit.keys() or len(audit)<4000:raise ValueError('Incomplete audit assets or runtime inputs')
routes={n:{k:r[k] for k in ('repository','bytes','sha256')} for n,r in audit.items() if n not in keep and n!=route_name}
data=gzip.compress(api.encoded({'schema':1,'files':routes}),compresslevel=9,mtime=0)
path=source/route_name;path.write_bytes(data)
record={'repository':'legacy','bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),'sourceVersions':['1.0.0.3664'],'scope':'original-route-index'}
remote='https://github.com/qxwd565/legacy.git';api.git('fetch','--no-tags','--filter=blob:none',remote,'main');parent=api.git('rev-parse','FETCH_HEAD').decode().strip()
def get(commit,name):
 url='https://raw.githubusercontent.com/qxwd565/legacy/'+commit+'/frame/'+urllib.parse.quote(name,safe='/')
 with urllib.request.urlopen(url,timeout=90) as response:return response.read()
catalog=json.loads(get(parent,'index.json'));catalog['files'][route_name]=record
updates={route_name:api.git('hash-object','-w','--stdin',data=data).decode().strip(),
         'index.json':api.git('hash-object','-w','--stdin',data=api.encoded(catalog)).decode().strip()}
tree=api.tree_entries(parent);tree['frame']=('040000','tree',api.overlay_tree(tree['frame'][2],updates));tree_id=api.write_tree(tree)
if tree_id==api.git('rev-parse',parent+'^{tree}').decode().strip():commit=parent
else:
 commit=api.git('commit-tree',tree_id,'-p',parent,data=b'Add lazy routes for original frame source assets\n').decode().strip()
 changed=set(api.git('diff-tree','--no-commit-id','--name-only','-r',parent,commit).decode().splitlines())
 if changed-{'frame/index.json','frame/'+route_name}:raise ValueError('Unexpected route publication changes')
 api.git('push',remote,commit+':refs/heads/main')
if get(commit,route_name)!=data:raise ValueError('Published route table differs')
index=json.loads(index_path.read_bytes());index['files'][route_name]=record;before=len(api.encoded(index))
index['files']=api.compact_index(index['files']);index['repositories']['legacy']={'commit':commit,'base':f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/'}
if not keep<=index['files'].keys():raise ValueError('A live renderer input was removed')
index_path.write_bytes(api.encoded(index));print(json.dumps({'commit':commit,'lazyRoutes':len(routes),'liveEarlyAssets':len(keep),'startupBytesBefore':before,'startupBytesAfter':len(api.encoded(index))}))
