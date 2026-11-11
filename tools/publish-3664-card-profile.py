"""Publish only verified 3664 card resources, preserving the current API tree.

Dry-run by default. --publish writes Git objects and fast-forwards legacy/main.
"""
import argparse
import gzip
import hashlib
import importlib.util
import json
import pathlib
import urllib.parse
import urllib.request

ROOT = pathlib.Path(__file__).resolve().parent.parent
SOURCE = ROOT / 'v7.14.4-webgpu-20261109/assets/unity'
INDEX = ROOT / 'plugin/hscard/assets/unity/frame-api-index.json'
PREFIX = 'historical-frames/'
spec = importlib.util.spec_from_file_location('api', ROOT / 'tools/publish-frame-apis.py')
api = importlib.util.module_from_spec(spec)
spec.loader.exec_module(api)

def digest(data):
    return hashlib.sha256(data).hexdigest()

def plan():
    effects = json.loads((SOURCE / (PREFIX + 'early-native/pc-1.0.0.3664-effects.json')).read_bytes())
    profile = json.loads(gzip.decompress((SOURCE / (PREFIX + 'card-3664-spell-weapon.json.gz')).read_bytes()))
    shaders = json.loads(gzip.decompress((SOURCE / (PREFIX + 'native-3664-card-shaders.json.gz')).read_bytes()))
    parity = json.loads((SOURCE / (PREFIX + 'early-native/pc-3664-spell-weapon-parity.json')).read_bytes())
    if effects['sourceVersion'] != '1.0.0.3664' or len(effects['textures']) != 8:
        raise ValueError('Unexpected original effect manifest')
    if profile['version'] != '1.0.0.3664' or len(profile['packages']) != 4:
        raise ValueError('Unexpected original card profile')
    if shaders['sourceVersion'] != '1.0.0.3664' or len(shaders['shaders']) != 14:
        raise ValueError('Unexpected original shader bank')
    if len(parity['cases']) != 40:
        raise ValueError('Incomplete original D3D comparison')
    names = {PREFIX + 'card-3664-spell-weapon.json.gz', PREFIX + 'native-3664-card-shaders.json.gz',
             PREFIX + 'early-native/pc-1.0.0.3664-effects.json', PREFIX + 'early-native/pc-3664-spell-weapon-parity.json'}
    for row in [*effects['textures'], effects['sampleArt']]:
        for field in ('png', 'nativeImage', 'originalObject'):
            item = row[field]
            name = PREFIX + item['file']
            content = (SOURCE / name).read_bytes()
            if len(content) != item['bytes'] or digest(content) != item['sha256']:
                raise ValueError('Original effect resource differs: ' + name)
            names.add(name)
    index = json.loads(INDEX.read_bytes())
    route = json.loads(gzip.decompress((SOURCE / (PREFIX + 'early-native/routes.json.gz')).read_bytes()))['files']
    for texture in profile['textures'].values():
        name = PREFIX + texture['file']
        row = index['files'].get(name) or route.get(name)
        if not row:
            raise ValueError('Original texture route missing: ' + name)
        data = (SOURCE / name).read_bytes()
        if len(data) != row['bytes'] or digest(data) != row['sha256']:
            raise ValueError('Original texture route differs: ' + name)
    result = {}
    for name in sorted(names):
        data = (SOURCE / name).read_bytes()
        result[name] = {'repository': 'legacy', 'bytes': len(data), 'sha256': digest(data),
                        'sourceVersions': ['1.0.0.3664'], 'scope': 'original-3664-card-resource'}
    return result

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--publish', action='store_true')
    args = parser.parse_args()
    records = plan()
    print(json.dumps({'files': len(records), 'bytes': sum(x['bytes'] for x in records.values()), 'publish': args.publish}), flush=True)
    if not args.publish:
        return
    url = 'https://github.com/qxwd565/legacy.git'
    api.git('fetch', '--no-tags', '--filter=blob:none', url, 'main')
    parent = api.git('rev-parse', 'FETCH_HEAD').decode().strip()
    index = json.loads(INDEX.read_bytes())
    pinned = index['repositories']['legacy']['commit']
    api.git('merge-base', '--is-ancestor', pinned, parent)
    catalog = json.loads(api.git('show', parent + ':frame/index.json'))
    if catalog.get('repository') != 'qxwd565/legacy' or catalog.get('path') != 'frame/':
        raise ValueError('Unexpected remote frame catalog')
    catalog['files'].update(records)
    updates = {name: api.git('hash-object', '-w', '--stdin', data=(SOURCE / name).read_bytes()).decode().strip() for name in records}
    updates['index.json'] = api.git('hash-object', '-w', '--stdin', data=api.encoded(catalog)).decode().strip()
    root = api.tree_entries(parent)
    if root.get('frame', (None, None))[1] != 'tree':
        raise ValueError('Remote frame directory missing')
    root['frame'] = ('040000', 'tree', api.overlay_tree(root['frame'][2], updates))
    tree = api.write_tree(root)
    if tree == api.git('rev-parse', parent + '^{tree}').decode().strip():
        commit = parent
    else:
        commit = api.git('commit-tree', tree, '-p', parent, data=b'Add original 3664 spell and weapon frame resources\n').decode().strip()
        changed = set(api.git('diff-tree', '--no-commit-id', '--name-only', '-r', parent, commit).decode().splitlines())
        allowed = {'frame/index.json'} | {'frame/' + name for name in records}
        if changed - allowed:
            raise ValueError('Unexpected publication changes: ' + repr(changed - allowed))
        api.git('push', url, commit + ':refs/heads/main')
    for name, row in records.items():
        address = f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/' + urllib.parse.quote(name, safe='/')
        with urllib.request.urlopen(address, timeout=90) as response:
            content = response.read()
        if len(content) != row['bytes'] or digest(content) != row['sha256']:
            raise ValueError('Published resource differs: ' + name)
    index['files'].update(records)
    index['repositories']['legacy'] = {'commit': commit, 'base': f'https://raw.githubusercontent.com/qxwd565/legacy/{commit}/frame/'}
    INDEX.write_bytes(api.encoded(index))
    print(json.dumps({'commit': commit, 'verifiedFiles': len(records), 'repository': 'qxwd565/legacy'}), flush=True)

if __name__ == '__main__':
    main()
