"""Read every published resource back, in RAM, and compare its original bytes."""
import concurrent.futures
import hashlib
import json
import pathlib
import time
import urllib.parse
import urllib.request

root = pathlib.Path(__file__).resolve().parent.parent
index = json.loads((root / 'plugin/hscard/assets/unity/frame-api-index.json').read_bytes())
source = root / 'v7.14.4-webgpu-20261109/assets/unity'


def verify(item):
    name, record = item
    url = index['repositories'][record['repository']]['base'] + urllib.parse.quote(name, safe='/')
    original = (source / name).read_bytes()
    for attempt in range(3):
        try:
            with urllib.request.urlopen(url, timeout=40) as response:
                data = response.read()
            if data != original or len(data) != record['bytes'] or hashlib.sha256(data).hexdigest() != record['sha256']:
                raise ValueError('Original byte mismatch: ' + name)
            return len(data)
        except Exception:
            if attempt == 2:
                raise
            time.sleep(attempt + 1)


if __name__ == '__main__':
    count = size = 0
    started = time.monotonic()
    with concurrent.futures.ThreadPoolExecutor(max_workers=6) as pool:
        jobs = [pool.submit(verify, item) for item in index['files'].items()]
        for job in concurrent.futures.as_completed(jobs):
            size += job.result()
            count += 1
            if count % 250 == 0:
                print(json.dumps({'verified': count, 'total': len(jobs)}), flush=True)
    print(json.dumps({'ok': True, 'verifiedFiles': count, 'verifiedBytes': size,
                      'repositories': len(index['repositories']), 'seconds': round(time.monotonic() - started, 1)}), flush=True)
