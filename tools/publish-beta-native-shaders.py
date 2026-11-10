"""Publish verified converted original beta shader programs, without textures."""
import gzip
import hashlib
import importlib.util
import json
import pathlib
import urllib.parse
import urllib.request

root = pathlib.Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location('frame_apis', root / 'tools/publish-frame-apis.py')
api = importlib.util.module_from_spec(spec)
spec.loader.exec_module(api)
index_path = root / 'plugin/hscard/assets/unity/frame-api-index.json'
name = 'historical-frames/native-beta-shaders.json.gz'
data = (root / 'v7.14.4-webgpu-20261109/assets/unity' / name).read_bytes()
bank = json.loads(gzip.decompress(data))
if bank['schema'] != 1 or len(bank['shaders']) != 15 or len(bank['programs']) != 27:
    raise ValueError('Unexpected original beta shader bank')
for identity, program in bank['programs'].items():
    if program['sourceSha256'] != identity or hashlib.sha256(program['wgsl'].encode()).hexdigest() != program['wgslSha256']:
        raise ValueError('Original beta program identity or WGSL checksum')
record = {'repository': 'legacy', 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest(),
          'sourceVersions': ['1.0.0.3664', '1.0.0.3890', '1.0.0.4944'], 'scope': 'native-shaders-without-textures'}
url = 'https://github.com/qxwd565/legacy.git'
api.git('fetch', '--no-tags', '--filter=blob:none', url, 'main')
parent = api.git('rev-parse', 'FETCH_HEAD').decode().strip()
base = f'https://raw.githubusercontent.com/qxwd565/legacy/{parent}/frame/'
with urllib.request.urlopen(base + 'index.json', timeout=60) as response:
    catalog = json.load(response)
catalog['files'][name] = record
tree = api.tree_entries(parent)
updates = {name: api.git('hash-object', '-w', '--stdin', data=data).decode().strip(),
           'index.json': api.git('hash-object', '-w', '--stdin', data=api.encoded(catalog)).decode().strip()}
tree['frame'] = ('040000', 'tree', api.overlay_tree(tree['frame'][2], updates))
new_tree = api.write_tree(tree)
if new_tree == api.git('rev-parse', parent + '^{tree}').decode().strip():
    commit = parent
else:
    commit = api.git('commit-tree', new_tree, '-p', parent,
                     data=b'Add translated original beta shaders without textures\n').decode().strip()
    changed = set(api.git('diff-tree', '--no-commit-id', '--name-only', '-r', parent, commit).decode().splitlines())
    if changed != {'frame/index.json', 'frame/' + name}:
        raise ValueError('Unexpected files in shader publication')
    api.git('push', url, commit + ':refs/heads/main')
base = f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/'
with urllib.request.urlopen(base + urllib.parse.quote(name, safe='/'), timeout=60) as response:
    if response.read() != data:
        raise ValueError('Published shader bytes differ')
index = json.loads(index_path.read_bytes())
index['files'][name] = record
index['repositories']['legacy'] = {'commit': commit, 'base': base}
index_path.write_bytes(api.encoded(index))
print(json.dumps({'repository': 'legacy', 'commit': commit, 'bytes': len(data), 'programs': len(bank['programs'])}))
