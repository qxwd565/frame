"""Recheck half-size replacements, including equivalent duplicate bundle refs."""
import contextlib
import csv
import hashlib
import importlib.util
import io
import json
import os
import sys

from PIL import Image

sys.dont_write_bytecode=True
spec=importlib.util.spec_from_file_location('frame_export','tools/export-original-pc-frame-comparison.py')
task=importlib.util.module_from_spec(spec);spec.loader.exec_module(task)
with task.TABLE.open(encoding='utf-8-sig',newline='') as stream:
    reader=csv.DictReader(stream)
    if reader.fieldnames!=task.FIELDS:raise ValueError('Unexpected comparison schema')
    rows=list(reader)
if len(rows)!=540:raise ValueError('Expected complete PC comparison')
source=task.cmp.prepared_script();worker=task.cmp.D3D(return_pixels=True);saved=sys.argv[:];n=0
try:
 for row in rows:
    if row['버전'] not in ('1.0.0.3890','1.0.0.4217') or row['직전과 비교']!='다름':continue
    build=row['버전'].rsplit('.',1)[-1];previous=row['직전 버전'].rsplit('.',1)[-1]
    sys.argv=[str(task.cmp.RENDERER),build,row['유형'],row['직업'],row['마감'],'--digest-only','--frame-pixels','--time','0','--rarity','FREE','--replace-half-from',previous]
    env={'__name__':'__batch_render__','__file__':str(task.cmp.RENDERER),'BATCH_GZ_JSON':task.cmp.gz_json,
         'BATCH_JSON':task.cmp.text_json,'BATCH_GZIP':task.cmp.raw_gzip,'BATCH_IMAGE':task.cmp.image_read,'BATCH_GPU':worker.render}
    capture=io.StringIO()
    with contextlib.redirect_stdout(capture):exec(source,env)
    result=json.loads(capture.getvalue());image=Image.frombytes('RGBA',(1024,1536),worker.last_pixels);bbox=image.getchannel('A').getbbox()
    if not bbox or bbox[0]<=0 or bbox[1]<=0 or bbox[2]>=1024 or bbox[3]>=1536:raise ValueError('Replacement frame was clipped')
    if result['replacements']:
        digest=hashlib.sha256(image.crop(bbox).tobytes()).hexdigest()
        row['직전 큰 원본 텍스처 대체 SHA256']=digest
        row['대체 후 직전과 비교']='같음' if digest==row['직전 렌더 SHA256'] else '다름'
        row['대체한 원본 텍스처']=json.dumps(result['replacements'],ensure_ascii=False,separators=(',',':'))
    else:
        row['직전 큰 원본 텍스처 대체 SHA256']='';row['대체 후 직전과 비교']='해당 없음';row['대체한 원본 텍스처']=''
    n+=1
    if n%20==0:print(json.dumps({'rechecked':n}),flush=True)
finally:
 sys.argv=saved;worker.close()
if n!=120:raise ValueError('Unexpected number of changed PC source cases: '+str(n))
temp=task.TABLE.with_suffix('.partial.csv')
with temp.open('x',encoding='utf-8-sig',newline='') as stream:
 writer=csv.DictWriter(stream,fieldnames=task.FIELDS);writer.writeheader();writer.writerows(rows)
os.replace(temp,task.TABLE)
print(json.dumps({'rechecked':n,'completed':True}))
