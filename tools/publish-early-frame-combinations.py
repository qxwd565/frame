"""Publish content-addressed early frame evidence to the matching expansion APIs."""
import collections
import hashlib
import importlib.util
import json
import pathlib
import urllib.parse
import urllib.request

root=pathlib.Path(__file__).resolve().parent.parent
spec=importlib.util.spec_from_file_location('api',root/'tools/publish-frame-apis.py');api=importlib.util.module_from_spec(spec);spec.loader.exec_module(api)
source=root/'v7.14.4-webgpu-20261109/assets/unity';index_path=root/'plugin/hscard/assets/unity/frame-api-index.json'
files={name:record for name,record in api.plan().items() if name.startswith('historical-frames/early-native/')}
if not 4000<=len(files)<=20000:raise ValueError('Unexpected original evidence file count: '+str(len(files)))
names=sorted(files); expected=[]
for name in names:
    data=(source/name).read_bytes(); row=files[name]
    if len(data)!=row['bytes'] or hashlib.sha256(data).hexdigest()!=row['sha256']:raise ValueError('Source changed: '+name)
    expected.append(hashlib.sha1(('blob '+str(len(data))+'\0').encode()+data).hexdigest())
paths=''.join(json.dumps(str((source/name).resolve()),ensure_ascii=False)+'\n' for name in names)
objects=api.git('hash-object','-w','--no-filters','--stdin-paths',data=paths.encode()).decode().splitlines()
if objects!=expected:
    mismatch=next((i for i,(a,b) in enumerate(zip(objects,expected)) if a!=b),None)
    raise ValueError('Original assets changed while creating Git objects: '+repr({'received':len(objects),'expected':len(expected),'firstMismatch':names[mismatch] if mismatch is not None else None}))
oids=dict(zip(names,objects));groups=collections.defaultdict(dict)
for name,record in files.items():groups[record['repository']][name]=record
index=json.loads(index_path.read_bytes())
def get(repo,commit,name):
    url=f'https://raw.githubusercontent.com/qxwd565/{repo}/{commit}/frame/'+urllib.parse.quote(name,safe='/')
    with urllib.request.urlopen(url,timeout=90) as response:return response.read()
for repo,rows in sorted(groups.items()):
    url=f'https://github.com/qxwd565/{repo}.git';api.git('fetch','--no-tags','--filter=blob:none',url,'main');parent=api.git('rev-parse','FETCH_HEAD').decode().strip()
    catalog=json.loads(get(repo,parent,'index.json'));catalog['files'].update(rows)
    tree=api.tree_entries(parent);updates={name:oids[name] for name in rows}
    updates['index.json']=api.git('hash-object','-w','--stdin',data=api.encoded(catalog)).decode().strip()
    tree['frame']=('040000','tree',api.overlay_tree(tree['frame'][2],updates));new_tree=api.write_tree(tree)
    if new_tree==api.git('rev-parse',parent+'^{tree}').decode().strip():commit=parent
    else:
        commit=api.git('commit-tree',new_tree,'-p',parent,data=b'Add original early frame graphs and render evidence\n').decode().strip()
        changed=set(api.git('diff-tree','--no-commit-id','--name-only','-r',parent,commit).decode().splitlines())
        allowed={'frame/index.json'}|{'frame/'+name for name in rows}
        if changed-allowed:raise ValueError('Unexpected publication files: '+repr(changed-allowed))
        api.git('push',url,commit+':refs/heads/main')
    # Every path's Git object ID is checked, and one file per kind is read
    # back over the public CDN. Git's transfer checks each full blob SHA.
    listing=api.git('ls-tree','-r','-z',commit,'--','frame/historical-frames/early-native').split(b'\0');actual={}
    for line in listing:
        if line:
            header,name=line.split(b'\t',1);actual[name.decode().removeprefix('frame/')]=header.decode().split()[2]
    if any(actual.get(name)!=oids[name] for name in rows):raise ValueError('Remote tree resource identity mismatch: '+repo)
    samples={}
    for name in rows:
        parts=name.split('/');kind=parts[4] if len(parts)>4 and parts[3]=='objects' else parts[3] if len(parts)>3 else name
        samples.setdefault(kind,name)
    for name in samples.values():
        if get(repo,commit,name)!=(source/name).read_bytes():raise ValueError('Public read-back mismatch: '+name)
    index['files'].update(rows);index['files']=api.compact_index(index['files']);index['repositories'][repo]={'commit':commit,'base':f'https://raw.githubusercontent.com/qxwd565/{repo}/{commit}/frame/'}
    index_path.write_bytes(api.encoded(index))
    print(json.dumps({'repository':repo,'commit':commit,'files':len(rows),'publicSamples':len(samples)}),flush=True)
