"""Compare extracted original frame graphs without inventing patch dates."""
import collections
import gzip
import hashlib
import json
import pathlib
import re

ROOT = pathlib.Path(__file__).resolve().parent.parent
SOURCE = ROOT / 'v7.14.4-webgpu-20261109/assets/unity/historical-frames'
DIRECTORY = SOURCE / 'early-native'

def encoded(value): return json.dumps(value, ensure_ascii=False, sort_keys=True, separators=(',', ':')).encode()
def digest(value): return hashlib.sha256(encoded(value)).hexdigest()
def version(value): return tuple(int(v) for v in value.split('.'))
def read(path): return json.loads(gzip.decompress(path.read_bytes()))
def add(group, name, value): group.setdefault(name, []).append(value)

def analyze(doc):
    assets = {a['key']: a for a in doc['assets']}
    nodes = {}; component_paths = {}
    for prefab in doc['prefabs']:
        for node in prefab['nodes']:
            nodes[node['source']] = node['path']
            for i, c in enumerate(node['components']): component_paths[c['source']] = node['path'] + '#' + str(i)
            for i, c in enumerate(node.get('renderers',[])): component_paths[c['source']] = node['path'] + '#renderer' + str(i)
    missing = set()
    def name(ref):
        if ref is None: return None
        if ref in assets:
            a=assets[ref]; return {'type': a['type'], 'name': a['name']}
        if ref in nodes: return {'node': nodes[ref]}
        if ref in component_paths: return {'component': component_paths[ref]}
        missing.add(ref); return {'unresolvedRef': ref}
    def normalize(value):
        if isinstance(value, dict):
            if set(value) == {'ref'}: return {'ref': name(value['ref'])}
            return {k: normalize(v) for k,v in value.items()}
        if isinstance(value, list): return [normalize(v) for v in value]
        return value
    groups = {x:{} for x in ['meshes', 'materials', 'shaders', 'textures', 'fonts', 'managedAssemblies', 'prefabs']}
    for a in doc['assets']:
        n=a['name']; t=a['type']
        if t==43 and 'mesh' in a: add(groups['meshes'],n,{'geometrySha256':digest(a['mesh'])})
        elif t==21: add(groups['materials'],n,{'settingsSha256':digest(normalize(a['properties']))})
        elif t==28 and 'rgbaSha256' in a: add(groups['textures'],n,{'rgbaSha256':a['rgbaSha256'], 'width':a['width'],
            'height':a['height'], 'samplerSha256':digest(a['sampler'])})
        elif t==48:
            shader=a.get('shaderSource'); programs=[]
            if shader:
                raw=gzip.decompress((SOURCE / shader['file']).read_bytes())
                if hashlib.sha256(raw).hexdigest()!=shader['rawSha256']: raise ValueError('Shader source changed')
                text=raw.decode('utf-8',errors='replace')
                for match in re.finditer(r'"(!!GLES.*?)(?<!\\)"',text,re.S):
                    programs.append(hashlib.sha256(match.group(1).encode()).hexdigest())
                for match in re.finditer(r'"((?:vs|ps)_4_0)\s+([a-p\s]+)"',text,re.S):
                    code=re.sub(r'\s','',match.group(2)); programs.append(hashlib.sha256((match.group(1)+':'+code).encode()).hexdigest())
            add(groups['shaders'],n,{'sourceSha256': shader['rawSha256'] if shader else None,
                'programSha256': sorted(set(programs)), 'programsFound':len(programs)})
        elif t==128:
            add(groups['fonts'],n,{'fontSha256':(a.get('fontData') or {}).get('rawSha256'),
                                  'metadataSha256':digest(a.get('fontMetadata',{}))})
    for assembly in doc.get('managedAssemblies',[]):
        add(groups['managedAssemblies'],assembly['name'],{'kind':assembly.get('kind','managed'),
            'sha256':(assembly.get('original') or {}).get('rawSha256'),
            'metadataSha256':(assembly.get('metadata') or {}).get('rawSha256'),
            'nativeExecutable':assembly.get('nativeExecutable')})
    for prefab in doc['prefabs']:
        rows=[]
        for n in prefab['nodes']:
            rows.append({'path':n['path'], 'position':n.get('position'), 'rotation':n.get('rotation'), 'scale':n.get('scale'),
                'gameObject':n.get('gameObject'), 'renderers':[normalize(x.get('settings')) for x in n.get('renderers',[])],
                'mesh':name(n.get('mesh')), 'materials':[name(ref) for ref in n.get('materials',[])],
                'components':[{'settings':normalize(c.get('settings')), 'unresolved':bool(c.get('unresolved')),
                               'class':c.get('typeTreeFromOriginalManagedAssembly')} for c in n['components']]})
        add(groups['prefabs'],prefab['name'],{'graphSha256':digest(rows), 'nodes':len(rows)})
    for group in groups.values():
        for n, items in group.items(): group[n]=sorted(items,key=lambda x:encoded(x))
    return groups, sorted(missing)

def difference(before, after):
    result={}
    for group in before:
        rows=[]
        for name in sorted(set(before[group])|set(after[group])):
            old=before[group].get(name); new=after[group].get(name)
            if old==new: continue
            kind='added' if old is None else 'removed' if new is None else 'changed'
            if group=='textures' and old and new and len(old)==len(new)==1 and (old[0]['width'],old[0]['height']) != (new[0]['width'],new[0]['height']):
                kind='resolution_and_content_unresolved'
            elif group=='textures' and old and new and len(old)==len(new)==1 and old[0]['rgbaSha256']==new[0]['rgbaSha256']:
                kind='sampler_only'
            elif group=='shaders' and old and new and len(old)==len(new)==1:
                if old[0]['programsFound'] and new[0]['programsFound']:
                    kind='source_only_same_programs' if old[0]['programSha256']==new[0]['programSha256'] else 'programs_changed'
                else: kind='source_changed_program_unverified'
            elif group=='managedAssemblies' and old and new:
                kind='binary_changed_visual_effect_unverified'
            rows.append({'name':name,'kind':kind,'before':old,'after':new})
        if rows: result[group]=rows
    return result

def main():
    paths=list((DIRECTORY / 'snapshots').glob('*.json.gz')); docs=[(p,read(p)) for p in paths]
    docs.sort(key=lambda x:(x[1]['source']['platform'],version(x[1]['source']['version']),x[1]['source'].get('archiveId','')))
    render_path=DIRECTORY/'pc-render-comparison.json'
    renders=json.loads(render_path.read_bytes()) if render_path.exists() else None
    render_by_version={x['version']:x for x in renders['records']} if renders else {}
    ios_path=DIRECTORY/'ios-gles-render-comparison.json'
    ios_renders=json.loads(ios_path.read_bytes()) if ios_path.exists() else None
    ios_by_id={}
    if ios_renders:
        for row in ios_renders['records']:
            results=row['results']; changed=collections.Counter(x['family'] for x in results if x.get('pixelsEqual') is False)
            ios_by_id[row['source']['archiveId']]={'report':'early-native/ios-gles-render-comparison.json',
                'renderedCases':sum(x['status']=='rendered' for x in results), 'unverifiedCases':sum(x['status']!='rendered' for x in results),
                'changedCases':sum(changed.values()),'changedByFamily':dict(changed),
                'scope':'Fixed test inputs; see full report for time, class, rarity and fidelity limitations.'}
    results=[]; previous={}
    for path, doc in docs:
        source=doc['source']; groups, unresolved=analyze(doc); platform=source['platform']; old=previous.get(platform)
        report={'source':source, 'file':'early-native/snapshots/'+path.name, 'snapshotSha256':hashlib.sha256(path.read_bytes()).hexdigest(),
            'bytes':path.stat().st_size, 'coverage':doc['coverage'], 'unresolvedReferences':len(unresolved), 'unresolvedReferenceExamples':unresolved[:20],
            'comparisonTo':old['source'] if old else None, 'changes':difference(old['groups'],groups) if old else {},
            'firstObservation': old is None}
        report['comparisonCoverage']='partial_unresolved_component_fields' if doc['coverage']['unresolvedMonoBehaviours'] or (old and old['unresolved']) else 'extracted_fields_only'
        report['visualEvidence']=render_by_version.get(source['version']) if platform=='Windows' else ios_by_id.get(source.get('archiveId'))
        results.append(report); previous[platform]={'source':source,'groups':groups,'unresolved':doc['coverage']['unresolvedMonoBehaviours']}
    index={'schema':1,'scope':'Original PC and iOS hand-frame graphs: minion, spell, weapon; normal and golden.',
        'dates':'Build observations are not verified Korean patch application dates.',
        'comparison':'Mesh geometry, material fields and references, individual GPU shader program code, texture pixels/sampling, and prefab graph. A change in dimensions is flagged for review rather than assumed to be an artwork change. Source changes are not automatically visual changes.',
        'visualComparisonFile':'early-native/pc-render-comparison.json' if renders else None,
        'nativeRendererParityFile':'early-native/pc-webgpu-d3d-parity.json' if (DIRECTORY/'pc-webgpu-d3d-parity.json').exists() else None,
        'iosGlesComparisonFile':'early-native/ios-gles-render-comparison.json' if ios_renders else None,
        'snapshots':results}
    (DIRECTORY/'index.json').write_bytes(encoded(index)+b'\n')
    print(json.dumps({'snapshots':len(results),'withFailures':sum(bool(r['coverage']['failures']) for r in results),
        'withUnresolvedMonoBehaviours':sum(bool(r['coverage']['unresolvedMonoBehaviours']) for r in results),
        'withUnresolvedReferences':sum(bool(r['unresolvedReferences']) for r in results),
        'changes':sum(sum(len(v) for v in r['changes'].values()) for r in results)},ensure_ascii=False))

if __name__=='__main__': main()
