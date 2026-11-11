"""Prepare a 3664 plugin commit and ZIP without changing the dirty checkout.

The commit is based on the verified remote development branch. It includes only
this task and the necessary generated cache revisions. It does not push.
"""
import hashlib
import importlib.util
import io
import json
import pathlib
import re
import subprocess
import zipfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
spec = importlib.util.spec_from_file_location('api', ROOT / 'tools/publish-frame-apis.py')
api = importlib.util.module_from_spec(spec)
spec.loader.exec_module(api)
PARENT = '20f387696d59028995bb32dd6a69e92676b66b8b'
TASK = [
    'plugin/hscard/assets/unity/frame-api-index.json',
    'plugin/hscard/assets/unity/historical-adapter.mjs',
    'plugin/hscard/assets/unity/native-minion-profile.mjs',
    'plugin/hscard/assets/unity/native-3664-card-profile.mjs',
    'plugin/hscard/assets/unity/webgpu-card-renderer.mjs',
    'plugin/hscard/docs/HISTORICAL-FRAMES.md',
    'plugin/hscard/tests/pc-d3d-parity.html',
    'plugin/hscard/tests/3664-original.html',
    'tools/compile-3664-card-shaders.mjs',
    'tools/export-3664-effect-textures.py',
    'tools/generate-3664-card-profile.py',
    'tools/publish-3664-card-profile.py',
    'tools/publish-frame-apis.py',
    'tools/verify-3664-cards.mjs',
    'tools/verify-pc-d3d-parity.mjs',
    'tools/prepare-3664-plugin-release.py',
    'VALIDATION.md',
]
revision = re.compile(r'\?ver=hscard-[A-Za-z0-9.-]+')

def canonical(data):
    return revision.sub('?ver=hscard-build', data.decode('utf-8').replace('\r\n', '\n'))

def git(*args, data=None):
    return api.git(*args, data=data)

def files(commit, prefix):
    output = git('ls-tree', '-r', '-z', commit, '--', prefix)
    return [entry.split(b'\t', 1)[1].decode('utf-8') for entry in output.split(b'\0') if entry]

def source(path):
    return git('show', PARENT + ':' + path)

branch = git('ls-remote', 'origin', 'refs/heads/webgpu-native-resources-20261109').decode().split()[0]
if branch != PARENT:
    raise ValueError('Development branch changed since verification; repeat the overlay check')
payloads = {name: (ROOT / name).read_bytes() for name in TASK}

# These files already contained other local edits when this task started.
# The current branch's corresponding changes must remain identical to the
# remote baseline, except for our one additional native profile argument.
renderer = 'plugin/hscard/assets/unity/webgpu-card-renderer.mjs'
before = canonical(source(renderer))
after = before.replace('historical.nativeProfile(this.builder,this.renderer,selection.nativeProfile)',
                       'historical.nativeProfile(this.builder,this.renderer,selection.nativeProfile,selection.nativeKind)')
if after == before or after != canonical(payloads[renderer]):
    raise ValueError('Renderer has unrelated local edits; refusing to include them')

index_path = 'plugin/hscard/assets/unity/frame-api-index.json'
old, new = json.loads(source(index_path)), json.loads(payloads[index_path])
if old['owner'] != new['owner'] or old['repositories'].keys() != new['repositories'].keys():
    raise ValueError('Unexpected API index change')
if any(new['files'].get(k) != v for k, v in old['files'].items()):
    raise ValueError('Existing API routes changed')
if any(old['repositories'][k] != new['repositories'][k] for k in old['repositories'] if k != 'legacy'):
    raise ValueError('Unrelated API repository changed')
if new['repositories']['legacy']['commit'] != 'd7533a4da1909f4b50b89b71b300d6df110eeb68':
    raise ValueError('Unexpected verified legacy API commit')

# Generate exactly the same cache revision as prepare-plugin-assets.mjs, but
# using remote-base bytes and this task's overlay entirely in memory.
asset_prefix = 'plugin/hscard/assets/unity/'
asset_paths = set(files(PARENT, asset_prefix)) | {x for x in payloads if x.startswith(asset_prefix)}
asset_paths = sorted(p for p in asset_paths if '/' not in p[len(asset_prefix):] and
                     (p.endswith(('.mjs', '.js', '.css')) or p.endswith('/frame-api-index.json')))
asset_bytes = {p: payloads[p] if p in payloads else source(p) for p in asset_paths}
h = hashlib.sha256()
for path in sorted(asset_paths, key=lambda p: p[len(asset_prefix):]):
    name = path[len(asset_prefix):]
    h.update((name + '\0' + canonical(asset_bytes[path]) + '\0').encode('utf-8'))
stamp = 'hscard-' + h.hexdigest()[:16]
for path, data in asset_bytes.items():
    if path.endswith(('.mjs', '.js', '.css')):
        updated = revision.sub('?ver=' + stamp, data.decode('utf-8')).encode('utf-8')
        if updated != data or path in payloads:
            payloads[path] = updated

test_prefix = 'plugin/hscard/tests/'
test_paths = set(files(PARENT, test_prefix)) | {x for x in payloads if x.startswith(test_prefix)}
for path in sorted(p for p in test_paths if p.endswith('.html') and '/' not in p[len(test_prefix):]):
    data = payloads[path] if path in payloads else source(path)
    updated = revision.sub('?ver=' + stamp, data.decode('utf-8')).encode('utf-8')
    if updated != data or path in payloads:
        payloads[path] = updated

updates = {name: git('hash-object', '-w', '--stdin', data=data).decode().strip() for name, data in payloads.items()}
tree = api.overlay_tree(git('rev-parse', PARENT + '^{tree}').decode().strip(), updates)
commit = git('commit-tree', tree, '-p', PARENT, data=b'Add original 3664 spell and weapon frames\n').decode().strip()

# Make the installable artifact directly from the prepared commit; no checkout,
# plugin source copy, or modification of the user's existing ZIP is needed.
tree_paths = files(commit, 'plugin/hscard/')
selected = [p for p in tree_paths if p.startswith(('plugin/hscard/admin/', 'plugin/hscard/includes/', 'plugin/hscard/assets/'))
            or p in {'plugin/hscard/hscard.php', 'plugin/hscard/uninstall.php', 'plugin/hscard/readme.txt', 'plugin/hscard/license.txt'}]
output = io.BytesIO()
with zipfile.ZipFile(output, 'w', compression=zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
    for path in sorted(selected):
        archive.writestr('hscard/' + path[len('plugin/hscard/'):], git('show', commit + ':' + path))
raw = output.getvalue()
with zipfile.ZipFile(io.BytesIO(raw)) as archive:
    if archive.testzip() is not None or 'hscard/hscard.php' not in archive.namelist():
        raise ValueError('Prepared plugin ZIP is invalid')
    modules = {pathlib.PurePosixPath(p).name: archive.read(p).decode('utf-8') for p in archive.namelist()
               if p.startswith('hscard/assets/unity/') and '/' not in p[len('hscard/assets/unity/'):] and
               (p.endswith(('.mjs', '.js', '.css')) or p.endswith('/frame-api-index.json'))}
    verified = hashlib.sha256()
    for name in sorted(modules):
        verified.update((name + '\0' + canonical(modules[name].encode()) + '\0').encode())
    if 'hscard-' + verified.hexdigest()[:16] != stamp:
        raise ValueError('ZIP asset revision does not match its module graph')
    for name, content in modules.items():
        if not name.endswith(('.mjs', '.js')):
            continue
        for target, query in re.findall(r"['\"]\./([^'\"?]+\.(?:m?js|json))(\?[^'\"]*)?['\"]", content):
            if target not in modules or query != '?ver=' + stamp:
                raise ValueError('ZIP module reference is not stamped: ' + name + ' -> ' + target)
destination = pathlib.Path(r'E:\HSdeck\hscard-3664-original-frames-20261111.zip')
if destination.exists():
    if destination.read_bytes() != raw:
        raise FileExistsError('Different ZIP already exists: ' + str(destination))
else:
    with destination.open('xb') as output_file:
        output_file.write(raw)
print(json.dumps({'parent': PARENT, 'commit': commit, 'revision': stamp, 'filesChanged': len(payloads),
                  'zip': str(destination), 'zipBytes': len(raw), 'zipSha256': hashlib.sha256(raw).hexdigest(),
                  'zipEntries': len(selected)}, ensure_ascii=False))
