"""Publish only the verified beta texture history to legacy/frame/."""
import hashlib
import importlib.util
import json
import pathlib
import urllib.parse
import urllib.request

root = pathlib.Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location('frame_apis', root / 'tools/publish-frame-apis.py')
api = importlib.util.module_from_spec(spec); spec.loader.exec_module(api)
source = root / 'v7.14.4-webgpu-20261109/assets/unity'
index_path = root / 'plugin/hscard/assets/unity/frame-api-index.json'
prefix = 'historical-frames/texture-history/'
manifest = json.loads((source / (prefix + 'index.json')).read_bytes())
if manifest['schema'] != 1 or len(manifest['textures']) != 18:
    raise ValueError('Unexpected texture history')
files = {name: row for name, row in api.plan().items() if name.startswith(prefix)}
if len(files) != 22 or any(row['repository'] != 'legacy' for row in files.values()):
    raise ValueError('Unexpected beta texture publication set')
for entries in manifest['textures'].values():
    for entry in entries:
        data = (source / 'historical-frames' / entry['file']).read_bytes()
        if hashlib.sha256(data).hexdigest() != entry['pngSha256']:
            raise ValueError('Texture history checksum')
remote = 'https://github.com/qxwd565/legacy.git'
api.git('fetch', '--no-tags', '--filter=blob:none', remote, 'main')
parent = api.git('rev-parse', 'FETCH_HEAD').decode().strip()
def get(commit, name):
    url = f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/' + urllib.parse.quote(name, safe='/')
    with urllib.request.urlopen(url, timeout=90) as response: return response.read()
catalog = json.loads(get(parent, 'index.json'))
catalog['files'].update(files)
updates = {name: api.git('hash-object', '-w', '--stdin', data=(source / name).read_bytes()).decode().strip()
           for name in files}
updates['index.json'] = api.git('hash-object', '-w', '--stdin', data=api.encoded(catalog)).decode().strip()
tree = api.tree_entries(parent)
tree['frame'] = ('040000', 'tree', api.overlay_tree(tree['frame'][2], updates))
new_tree = api.write_tree(tree)
if new_tree == api.git('rev-parse', parent + '^{tree}').decode().strip(): commit = parent
else:
    commit = api.git('commit-tree', new_tree, '-p', parent,
                     data=b'Add original beta texture history\n').decode().strip()
    changed = set(api.git('diff-tree', '--no-commit-id', '--name-only', '-r', parent, commit).decode().splitlines())
    if changed - ({'frame/index.json'} | {'frame/' + name for name in files}):
        raise ValueError('Unexpected beta texture publication change')
    api.git('push', remote, commit + ':refs/heads/main')
for name in files:
    if get(commit, name) != (source / name).read_bytes():
        raise ValueError('Public texture read-back mismatch: ' + name)
index = json.loads(index_path.read_bytes())
index['files'].update(files)
index['repositories']['legacy'] = {'commit': commit, 'base': f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/'}
index_path.write_bytes(api.encoded(index))
print(json.dumps({'repository': 'legacy', 'commit': commit, 'textures': 18, 'variants': 21}))
