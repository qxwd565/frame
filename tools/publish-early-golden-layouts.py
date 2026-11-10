"""Publish six verified original iOS golden-text profiles; never change textures."""
import collections
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
resource_dir = root / 'v7.14.4-webgpu-20261109/assets/unity'
package_path = pathlib.Path(r'E:\HSPlus\development\data\assets\portable-cards\historical-components.json.gz')
versions = ['1.1.6069', '2.0.7283', '2.4.8311', '2.5.8416', '3.1.10378', '4.2.11767']


def download(repo, commit, name):
    url = f'https://raw.githubusercontent.com/qxwd565/{repo}/{commit}/frame/' + urllib.parse.quote(name, safe='/')
    with urllib.request.urlopen(url, timeout=60) as response:
        return response.read()


def main():
    index = json.loads(index_path.read_bytes())
    package = json.loads(gzip.decompress(package_path.read_bytes()))
    profiles = {row['id']: row for row in package['texts']}
    groups = collections.defaultdict(list)
    for version in versions:
        identity = 'ios-' + version + '-minion'
        name = 'historical-frames/components/texts/' + identity + '.json.gz'
        record = index['files'][name]
        groups[record['repository']].append((name, identity))
    for repo, items in sorted(groups.items()):
        remote = 'https://github.com/qxwd565/' + repo + '.git'
        api.git('fetch', '--no-tags', '--filter=blob:none', remote, 'main')
        parent = api.git('rev-parse', 'FETCH_HEAD').decode().strip()
        tree = api.tree_entries(parent)
        if tree.get('frame', (None, None))[1] != 'tree':
            raise ValueError('Missing frame directory: ' + repo)
        catalog = json.loads(download(repo, parent, 'index.json'))
        updates, replacements = {}, {}
        for name, identity in items:
            existing = download(repo, parent, name)
            expected = index['files'][name]
            if len(existing) != expected['bytes'] or hashlib.sha256(existing).hexdigest() != expected['sha256']:
                raise ValueError('Existing remote resource changed: ' + name)
            old = json.loads(gzip.decompress(existing))
            profile = profiles[identity]
            normal = [row for row in profile['rows'] if row['prefab'] == 'Card_Hand_Ally']
            golden = [row for row in profile['rows'] if row['prefab'] == 'Card_Hand_Ally_Premium']
            if len(golden) != 6:
                raise ValueError('Original normal layout does not match: ' + name)
            if old['rows'] == normal + golden:
                continue
            if old['rows'] != normal:
                raise ValueError('Original normal layout does not match: ' + name)
            old['rows'] = normal + golden
            data = gzip.compress(api.encoded(old), mtime=0)
            record = dict(expected, bytes=len(data), sha256=hashlib.sha256(data).hexdigest())
            if name not in catalog['files']:
                raise ValueError('Missing repository catalog entry: ' + name)
            catalog['files'][name] = record
            updates[name] = api.git('hash-object', '-w', '--stdin', data=data).decode().strip()
            replacements[name] = (data, record)
        if not replacements:
            print(json.dumps({'repository': repo, 'unchanged': True}), flush=True)
            continue
        updates['index.json'] = api.git('hash-object', '-w', '--stdin', data=api.encoded(catalog)).decode().strip()
        tree['frame'] = ('040000', 'tree', api.overlay_tree(tree['frame'][2], updates))
        commit = api.git('commit-tree', api.write_tree(tree), '-p', parent,
                         data=b'Add original iOS golden minion text layouts\n').decode().strip()
        changed = api.git('diff-tree', '--no-commit-id', '--name-only', '-r', parent, commit).decode().splitlines()
        allowed = {'frame/index.json'} | {'frame/' + name for name in replacements}
        if set(changed) != allowed:
            raise ValueError('Unexpected changes in ' + repo + ': ' + repr(changed))
        api.git('push', remote, commit + ':refs/heads/main')
        for name, (data, record) in replacements.items():
            with urllib.request.urlopen(f'https://raw.githubusercontent.com/qxwd565/{repo}/{commit}/frame/' + urllib.parse.quote(name, safe='/'), timeout=60) as response:
                if response.read() != data:
                    raise ValueError('Remote read-back mismatch: ' + name)
            local = resource_dir / name
            local.write_bytes(data)
            index['files'][name] = record
        index['repositories'][repo] = {'commit': commit, 'base': f'https://raw.githubusercontent.com/qxwd565/{repo}/{commit}/frame/'}
        index_path.write_bytes(api.encoded(index))
        print(json.dumps({'repository': repo, 'commit': commit, 'profiles': [identity for _, identity in items]}), flush=True)


if __name__ == '__main__':
    main()
