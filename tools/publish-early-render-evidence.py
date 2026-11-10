"""Publish updated original-frame and visual-comparison indexes only."""
import importlib.util, json, pathlib, urllib.parse, urllib.request
root=pathlib.Path(__file__).resolve().parent.parent
spec=importlib.util.spec_from_file_location('api',root/'tools/publish-frame-apis.py');api=importlib.util.module_from_spec(spec);spec.loader.exec_module(api)
source=root/'v7.14.4-webgpu-20261109/assets/unity';index_path=root/'plugin/hscard/assets/unity/frame-api-index.json'
prefix='historical-frames/early-native/'
names={prefix+x for x in ['index.json','pc-webgpu-d3d-parity.json','ios-gles-render-comparison.json']}
plan=api.plan();rows={n:plan[n] for n in names}
if any(row['repository']!='legacy' for row in rows.values()):raise ValueError('Unexpected evidence destination')
remote='https://github.com/qxwd565/legacy.git';api.git('fetch','--no-tags','--filter=blob:none',remote,'main');parent=api.git('rev-parse','FETCH_HEAD').decode().strip()
def get(commit,name):
 url='https://raw.githubusercontent.com/qxwd565/legacy/'+commit+'/frame/'+urllib.parse.quote(name,safe='/')
 with urllib.request.urlopen(url,timeout=90) as response:return response.read()
catalog=json.loads(get(parent,'index.json'));catalog['files'].update(rows);updates={name:api.git('hash-object','-w','--stdin',data=(source/name).read_bytes()).decode().strip() for name in names}
updates['index.json']=api.git('hash-object','-w','--stdin',data=api.encoded(catalog)).decode().strip()
tree=api.tree_entries(parent);tree['frame']=('040000','tree',api.overlay_tree(tree['frame'][2],updates));tree_id=api.write_tree(tree)
if tree_id==api.git('rev-parse',parent+'^{tree}').decode().strip():commit=parent
else:
 commit=api.git('commit-tree',tree_id,'-p',parent,data=b'Add original GLES and D3D frame comparisons\n').decode().strip()
 changed=set(api.git('diff-tree','--no-commit-id','--name-only','-r',parent,commit).decode().splitlines())
 if changed-({'frame/index.json'}|{'frame/'+n for n in names}):raise ValueError('Unexpected evidence publication files')
 api.git('push',remote,commit+':refs/heads/main')
for name in names:
 if get(commit,name)!=(source/name).read_bytes():raise ValueError('Published evidence changed: '+name)
index=json.loads(index_path.read_bytes());index['files'].update(rows);index['repositories']['legacy']={'commit':commit,'base':f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/'}
index_path.write_bytes(api.encoded(index));print(json.dumps({'commit':commit,'reports':len(names)}))
