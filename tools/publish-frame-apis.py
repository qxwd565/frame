"""Publish existing resource bytes under expansion APIs' frame/ directories.

Dry-run by default. --publish uses Git's object database (no worktree, index,
credential output, asset copies or disk cache). Each commit preserves the
remote root tree and changes only frame/. Non-fast-forward pushes are refused.
The plugin index pins every repository to its published immutable commit.
"""
import argparse
import collections
import gzip
import hashlib
import json
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
CONFIG = json.loads((ROOT / 'tools/frame-api-layout.json').read_bytes())
SOURCE = ROOT / CONFIG['sourceDirectory']
INDEX = ROOT / 'plugin/hscard/assets/unity/frame-api-index.json'


def encoded(value):
    return (json.dumps(value, ensure_ascii=False, separators=(',', ':')) + '\n').encode()


def git(*args, data=None):
    result = subprocess.run(['git', '-C', str(ROOT), *args], input=data,
                            stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    if result.returncode:
        raise RuntimeError('git ' + ' '.join(args[:2]) + ': ' + result.stderr.decode(errors='replace'))
    return result.stdout


def version(value):
    match = re.search(r'\d+(?:\.\d+)+', value)
    if not match:
        raise ValueError('Missing version: ' + value)
    return tuple(map(int, match[0].split('.')))


def owner(value):
    result = None
    source_major = version(value)[0]
    if not any(version(row['from'])[0] == source_major for row in CONFIG['versionRepositories']):
        raise ValueError('Add this source version to frame-api-layout.json first: ' + value)
    for row in CONFIG['versionRepositories']:
        if version(row['from']) <= version(value):
            result = row['repository']
    if result is None:
        raise ValueError('Unmapped source version: ' + value)
    return result


def read(name):
    data = (SOURCE / name).read_bytes()
    return json.loads(gzip.decompress(data) if name.endswith('.gz') else data)


def plan():
    files = {p.relative_to(SOURCE).as_posix(): p for p in SOURCE.rglob('*') if p.is_file()}
    candidates = collections.defaultdict(set)

    def assign(name, source):
        if name not in files:
            raise ValueError('Missing dependency: ' + name)
        candidates[name].add(source)

    def dependencies(value, source):
        if isinstance(value, dict):
            for key, item in value.items():
                if key in ('file', 'path') and isinstance(item, str) and 'historical-frames/' + item in files:
                    assign('historical-frames/' + item, source)
                else:
                    dependencies(item, source)
        elif isinstance(value, list):
            for item in value:
                dependencies(item, source)
        elif isinstance(value, str) and 'historical-frames/' + value in files:
            assign('historical-frames/' + value, source)

    prefix = 'historical-frames/'
    manifest = read(prefix + 'manifest.json')
    for row in read(prefix + 'resource-index.json')['resources']:
        for source in row.get('sources', []):
            if source.get('sourceVersion'):
                assign(prefix + row['file'], source['sourceVersion'])
    for row in manifest['libraries']:
        assign(prefix + row['file'], row['version'])
    for name in manifest['catalogs']:
        assign(prefix + name, read(prefix + name)['version'])
    for name in files:
        if name.startswith(prefix + 'components/'):
            assign(name, name.rsplit('/', 1)[1])
        if name.startswith(prefix + 'native-snapshots/pc-'):
            match = re.fullmatch(r'pc-(\d+(?:\.\d+)+)\.json\.gz', name.rsplit('/', 1)[1])
            if not match:
                raise ValueError('Invalid native snapshot filename: ' + name)
            assign(name, match.group(1))
    for source in ['1.0.0.3664', '1.0.0.3890', '1.0.0.4944']:
        assign(prefix + 'native-beta-shaders.json.gz', source)
    early_index=prefix + 'early-native/index.json'
    if early_index in files:
        assign(early_index,'1.0.0.3664')
        for row in read(early_index)['snapshots']:
            source=row['source']['version']; name=prefix+row['file']
            assign(name,source); snapshot=read(name)
            def original(resource):
                if isinstance(resource,dict) and isinstance(resource.get('file'),str):
                    assign(prefix+resource['file'],source)
            for prefab in snapshot['prefabs']:
                for node in prefab['nodes']:
                    original(node.get('originalObject'))
                    for item in node.get('components',[]):original(item.get('originalObject'))
                    for item in node.get('renderers',[]):original(item.get('originalObject'))
            for asset in snapshot['assets']:
                for key in ('originalObject','png','nativeImage','shaderSource','fontData'):original(asset.get(key))
            for assembly in snapshot.get('managedAssemblies',[]):
                for key in ('original','metadata'):original(assembly.get(key))
        evidence=prefix+'early-native/pc-render-comparison.json'
        if evidence in files:
            for build in ['3664','3749','3890','3937','4217','4243','4458','4482','4944']:
                assign(evidence,'1.0.0.'+build)
        parity=prefix+'early-native/pc-webgpu-d3d-parity.json'
        if parity in files:
            for build in ['3664','3890','4217','4944']:assign(parity,'1.0.0.'+build)
        ios_render=prefix+'early-native/ios-gles-render-comparison.json'
        if ios_render in files:
            for row in read(early_index)['snapshots']:
                if row['source']['platform']=='iOS':assign(ios_render,row['source']['version'])
        routes=prefix+'early-native/routes.json.gz'
        if routes in files:assign(routes,'1.0.0.3664')
        mip_bindings=prefix+'early-native/minion-mip-bindings.json.gz'
        if mip_bindings in files:
            for build in ['3664','3890','4217','4944']:assign(mip_bindings,'1.0.0.'+build)
        original_comparison=prefix+'early-native/original-collection-comparison.json.gz'
        if original_comparison in files:
            for build in ['3664','3749','3890','3937','4217','4243','4458','4482','4944']:assign(original_comparison,'1.0.0.'+build)
            for source in ['1.0.0','1.0.5361','1.0.5435','1.0.5834']:assign(original_comparison,source)
    for row in read(prefix + 'native-minion-profiles.json')['profiles']:
        assign(prefix + row['file'], row['version'])
        dependencies(read(prefix + row['file']), row['version'])
    for key, rows in manifest.get('atlasSnapshots', {}).items():
        dependencies(rows, key)
    for stem, source in [('41010956', '6.2.15153'), ('41010957', '6.2.15153'),
                         ('62015154', '6.2.15153'), ('62015155', '6.2.15153'),
                         ('demonhunter-spell-19.6.74257', '19.6.74257'),
                         ('deathknight-source-audit', '25.4.165029')]:
        for name in files:
            if name in (prefix + stem + '.json', prefix + stem + '.png'):
                assign(name, source)
                if stem in ('41010956', '41010957'):
                    candidates[name] = {source}
    for name in files:
        if name.startswith('2015-11-11/'):
            for source in ['4.0.10784', '4.0.10833', '4.1.10956', '4.2.11767', '4.3.12266']:
                assign(name, source)
        if name.startswith(prefix + 'texture-history/'):
            parts = name[len(prefix + 'texture-history/'):].split('/')
            if parts == ['index.json']:
                for source in ['1.0.0.3664', '1.0.0.3890', '1.0.0.4217']:
                    assign(name, source)
            elif len(parts) == 2 and parts[1].endswith('.png'):
                assign(name, parts[0])
            else:
                raise ValueError('Invalid beta texture history path: ' + name)
    shared = {'manifest.json', 'index.json', 'resource-index.json', 'frame-history.json',
              'historical-components.json.gz', 'legacy-text-settings.json.gz',
              'native-minion-profiles.json', 'blobs.json'}
    result = {}
    unresolved = []
    for name, path in sorted(files.items()):
        sources = sorted(candidates[name], key=version)
        if sources:
            repo = owner(sources[0])
            scope = ('original-scene-index' if name == prefix + 'early-native/index.json'
                     else 'original-route-index' if name == prefix + 'early-native/routes.json.gz'
                     else 'visual-comparison-evidence' if name in (prefix + 'early-native/pc-render-comparison.json',prefix + 'early-native/pc-webgpu-d3d-parity.json',prefix + 'early-native/ios-gles-render-comparison.json',prefix + 'early-native/original-collection-comparison.json.gz')
                     else 'original-scene-snapshot' if name.startswith(prefix + 'early-native/snapshots/')
                     else 'original-texture' if name.startswith(prefix + 'early-native/objects/texture/')
                     else 'original-asset' if name.startswith(prefix + 'early-native/objects/')
                     else 'native-texture-index' if name == prefix + 'texture-history/index.json'
                     else 'native-texture' if name.startswith(prefix + 'texture-history/')
                     else 'native-texture' if name.startswith('2015-11-11/') and name.endswith('.png')
                     else 'native-texture-index' if name.startswith('2015-11-11/') and name.endswith('/index.json')
                     else 'native-snapshot-without-textures' if name.startswith(prefix + 'native-snapshots/')
                     else 'native-shaders-without-textures' if name == prefix + 'native-beta-shaders.json.gz'
                     else 'native-snapshot')
        elif not name.startswith(prefix):
            repo, scope = CONFIG['currentRepository'], 'renderer-support'
        elif name[len(prefix):] in shared:
            repo, scope = CONFIG['sharedRepository'], 'cross-expansion-catalog'
        else:
            unresolved.append(name)
            continue
        data = path.read_bytes()
        result[name] = {'repository': repo, 'bytes': len(data), 'sha256': hashlib.sha256(data).hexdigest(),
                        'sourceVersions': sources, 'scope': scope}
        if name.startswith('2015-11-11/'):
            result[name].update({'patchDateKorea': '2015-11-11', 'patchVersion': '4.0.0.10833',
                                 'textureChangeDateVerified': False})
    if unresolved:
        raise ValueError('Unassigned resources: ' + json.dumps(unresolved, ensure_ascii=False))
    return result


def compact_index(files):
    """Keep matching audit-only routes in the on-demand index, not startup."""
    path=SOURCE/'historical-frames/early-native/routes.json.gz'
    if not path.exists():return files
    routes=json.loads(gzip.decompress(path.read_bytes()))
    if routes.get('schema')!=1:raise ValueError('Invalid lazy original frame routes')
    result=dict(files)
    for name,route in routes['files'].items():
        record=result.get(name)
        if record and all(record.get(k)==route.get(k) for k in ('repository','bytes','sha256')):
            del result[name]
    return result


def tree_entries(oid):
    entries = {}
    for line in git('ls-tree', '-z', oid).split(b'\0'):
        if line:
            header, name = line.split(b'\t', 1)
            mode, kind, digest = header.decode().split()
            entries[name.decode()] = (mode, kind, digest)
    return entries


def write_tree(entries):
    data = b''.join(f'{mode} {kind} {oid}\t{name}\0'.encode()
                    for name, (mode, kind, oid) in sorted(entries.items()))
    # Unchanged blobs already exist on the target remote and are deliberately
    # omitted by blob:none fetches; never download the unrelated card artwork.
    return git('mktree', '--missing', '-z', data=data).decode().strip()


def overlay_tree(base, updates):
    entries = tree_entries(base) if base else {}
    directories = collections.defaultdict(dict)
    for name, oid in updates.items():
        if '/' in name:
            directory, rest = name.split('/', 1)
            directories[directory][rest] = oid
        else:
            if name in entries and entries[name][1] != 'blob':
                raise ValueError('Directory conflict: ' + name)
            entries[name] = ('100644', 'blob', oid)
    for directory, child in directories.items():
        previous = entries.get(directory)
        if previous and previous[1] != 'tree':
            raise ValueError('File conflict: ' + directory)
        entries[directory] = ('040000', 'tree', overlay_tree(previous[2] if previous else None, child))
    return write_tree(entries)


def publish(files):
    old = json.loads(INDEX.read_bytes()) if INDEX.exists() else {'repositories': {}}
    groups = collections.defaultdict(dict)
    for name, record in files.items():
        groups[record['repository']][name] = record
    # One Git invocation for all blobs avoids thousands of Windows processes.
    names = list(files)
    expected = []
    for name in names:
        data = (SOURCE / name).read_bytes()
        if len(data) != files[name]['bytes'] or hashlib.sha256(data).hexdigest() != files[name]['sha256']:
            raise ValueError('Source changed during publication: ' + name)
        expected.append(hashlib.sha1(('blob ' + str(len(data)) + '\0').encode() + data).hexdigest())
    paths = ''.join(json.dumps(str((SOURCE / name).resolve()), ensure_ascii=False) + '\n' for name in names)
    oids = git('hash-object', '-w', '--stdin-paths', data=paths.encode()).decode().splitlines()
    if oids != expected:
        raise ValueError('Source changed while creating Git objects')
    blobs = dict(zip(names, oids))
    commits = {}
    for repo, rows in sorted(groups.items()):
        url = 'https://github.com/' + CONFIG['owner'] + '/' + repo + '.git'
        git('fetch', '--no-tags', '--filter=blob:none', url, 'main')
        parent = git('rev-parse', 'FETCH_HEAD').decode().strip()
        root = tree_entries(parent)
        base = root.get('frame')
        if base and base[1] != 'tree':
            raise ValueError('frame is not a directory: ' + repo)
        updates = {}
        for name, record in rows.items():
            updates[name] = blobs[name]
        index = {'schema': 1, 'repository': CONFIG['owner'] + '/' + repo,
                 'path': 'frame/', 'files': rows,
                 'note': 'Source snapshots and shared dependencies; source versions are not inferred change dates.'}
        updates['index.json'] = git('hash-object', '-w', '--stdin', data=encoded(index)).decode().strip()
        subtree = overlay_tree(base[2] if base else None, updates)
        root['frame'] = ('040000', 'tree', subtree)
        tree = write_tree(root)
        if tree == git('rev-parse', parent + '^{tree}').decode().strip():
            commit = parent
        else:
            commit = git('commit-tree', tree, '-p', parent, data=(
                'Publish native frame resources in expansion API frame/\n\n'
                'Preserve original bytes and source identifiers. No card data changes.\n').encode()).decode().strip()
            changed = git('diff-tree', '--no-commit-id', '--name-only', '-r', parent, commit).decode().splitlines()
            if any(not p.startswith('frame/') for p in changed):
                raise ValueError('Publication outside frame/: ' + repo)
            git('push', url, commit + ':refs/heads/main')
        commits[repo] = {'commit': commit, 'base': 'https://raw.githubusercontent.com/' + CONFIG['owner'] + '/' + repo + '/' + commit + '/frame/'}
        print(json.dumps({'published': repo, 'files': len(rows), 'commit': commit}), flush=True)
        # A final deliverable, also records successful publications on interruption.
        old.setdefault('repositories', {}).update(commits)
        old.update({'schema': 1, 'owner': CONFIG['owner'], 'files': compact_index(files)})
        INDEX.write_bytes(encoded(old))
    INDEX.write_bytes(encoded({'schema': 1, 'owner': CONFIG['owner'], 'repositories': commits, 'files': files}))


if __name__ == '__main__':
    sys.stdout.reconfigure(encoding='utf-8')
    parser = argparse.ArgumentParser()
    parser.add_argument('--publish', action='store_true')
    args = parser.parse_args()
    result = plan()
    groups = collections.defaultdict(lambda: {'files': 0, 'bytes': 0})
    for item in result.values():
        row = groups[item['repository']]
        row['files'] += 1
        row['bytes'] += item['bytes']
    print(json.dumps({'total': len(result), 'repositories': groups}, indent=2), flush=True)
    if args.publish:
        publish(result)
