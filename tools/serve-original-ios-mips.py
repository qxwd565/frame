"""Local, read-only and RAM-only decoder for original iOS mip levels."""
import functools
import gzip
import hashlib
import http.server
import json
import pathlib
import struct
import sys
import urllib.parse

sys.dont_write_bytecode = True
sys.path.insert(0, r'E:\hearthstone card\tools\unitypy')
from UnityPy.export.Texture2DConverter import parse_image_data

ROOT = pathlib.Path(r'E:\HSdeck\frame\v7.14.4-webgpu-20261109\assets\unity\historical-frames')
REPORTS = pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교')
metadata = json.loads((REPORTS/'베타-오리지널 원본 텍스처 밉맵.json').read_text(encoding='utf-8'))
versions = {v['source']['archiveId']:{t['key']:t for t in v['textures']} for v in metadata['versions'] if v['source']['platform']=='iOS'}
scenes = json.loads((REPORTS/'베타-오리지널 원본 카메라.json').read_text(encoding='utf-8'))
version_names = {v['source']['archiveId']:v['source']['version'] for v in metadata['versions'] if v['source']['platform']=='iOS'}


@functools.lru_cache(maxsize=12)
def decode(archive, key):
    meta = versions[archive][key]
    if meta['unityFormat'] in (32,33) and meta['levels']:
        levels=meta['levels']
    elif meta['unityFormat']==3 and not meta['mipmapped']:
        levels=[{'width':meta['width'],'height':meta['height'],'offset':0,'bytes':meta['nativeBytes']}]
    else:
        raise ValueError('No supported original PVRTC levels')
    raw = gzip.decompress((ROOT/meta['nativeImage']['file']).read_bytes())
    if hashlib.sha256(raw).hexdigest()!=meta['nativeSha256']:
        raise ValueError('Original compressed image checksum mismatch')
    result=[struct.pack('<I',len(levels))]
    for i,level in enumerate(levels):
        data=raw[level['offset']:level['offset']+level['bytes']]
        if len(data)!=level['bytes']: raise ValueError('Truncated source mip')
        image=parse_image_data(data,level['width'],level['height'],meta['unityFormat'],
                               tuple(meta['unityVersion']),meta['buildTarget'],None,False).convert('RGBA')
        pixels=image.tobytes()
        if i==0 and hashlib.sha256(pixels).hexdigest()!=meta['rgbaSha256']:
            raise ValueError('Decoded base level differs from extracted source')
        result.extend([struct.pack('<III',level['width'],level['height'],len(pixels)),pixels])
    return b''.join(result)


class Handler(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        try:
            request=urllib.parse.urlsplit(self.path);q=urllib.parse.parse_qs(request.query,strict_parsing=True)
            archive=q['archive'][0]
            if archive not in versions: raise ValueError('Unknown source archive')
            if request.path=='/mips':
                body=decode(archive,q['key'][0]);kind='application/octet-stream'
            elif request.path=='/scene':
                version=version_names[archive]
                camera=next(x for x in scenes['cameras'] if x['platform']=='iOS' and x['version']==version and x['camera']=='TheBoxCamera')
                anchors=[x for x in scenes['collectionAnchors'] if x['platform']=='iOS' and x['version']==version and x['anchor']=='8_CollectionCardStartPosition']
                if not anchors: raise ValueError('Original collection anchor missing')
                anchor=next((x for x in anchors if any(y['name']=='CollectionPageA' for y in x['transformChain'])),anchors[0])
                body=json.dumps({'camera':camera,'anchor':anchor}).encode();kind='application/json'
            else: raise ValueError('Unknown operation')
            self.send_response(200);self.send_header('Content-Type',kind);self.send_header('Content-Length',str(len(body)))
            self.send_header('Access-Control-Allow-Origin','http://127.0.0.1:19420');self.end_headers();self.wfile.write(body)
        except Exception as error:
            body=str(error).encode('utf-8');self.send_response(400);self.send_header('Content-Length',str(len(body)))
            self.send_header('Access-Control-Allow-Origin','http://127.0.0.1:19420');self.end_headers();self.wfile.write(body)
    def log_message(self, *_): pass


if __name__=='__main__':
    server=http.server.ThreadingHTTPServer(('127.0.0.1',19421),Handler)
    print('Original iOS mip decoder: 127.0.0.1:19421',flush=True)
    try: server.serve_forever()
    except KeyboardInterrupt: pass
    finally: server.server_close()
