"""Render early source frames at a common source-texture-based scale.

The original camera projection is reframed before rendering; no screenshot or
texture is resized. Each is rendered on the same transparent canvas; transparent
borders are cropped without interpolation and the cropped RGBA is compared.
This is a fixed test scene, not a claim of full historical runtime fidelity.
"""
import contextlib
import csv
import hashlib
import importlib.util
import io
import json
import os
import pathlib
import sys

from PIL import Image

sys.dont_write_bytecode = True
ROOT=pathlib.Path(__file__).resolve().parent.parent
spec=importlib.util.spec_from_file_location('pc_compare',ROOT/'tools/compare-original-collection-pc.py')
cmp=importlib.util.module_from_spec(spec);spec.loader.exec_module(cmp)
OUTPUT=cmp.OUTPUT.parent
IMAGE_ROOT=OUTPUT/'PC 프레임 원본 크기'
TABLE=OUTPUT/'베타-오리지널 PC 프레임 원본 크기 비교.csv'
CHECKPOINT=TABLE.with_suffix('.partial.csv')
NAMES={'NEUTRAL':'중립','DRUID':'드루이드','HUNTER':'사냥꾼','MAGE':'마법사','PALADIN':'성기사',
       'PRIEST':'사제','ROGUE':'도적','SHAMAN':'주술사','WARLOCK':'흑마법사','WARRIOR':'전사'}
FAMILIES={'Ally':'하수인','Ability':'주문','Weapon':'무기'}
FIELDS=['버전','직전 버전','유형','직업','마감','희귀도','시각(초)','비교 캔버스','원본 크기 렌더 SHA256',
        '직전 렌더 SHA256','직전과 비교','직전 큰 원본 텍스처 대체 SHA256','대체 후 직전과 비교',
        '대체한 원본 텍스처','저장 PNG 크기','저장 PNG 경로']


def main():
    old_outputs={}
    if TABLE.exists():
      with TABLE.open(encoding='utf-8-sig',newline='') as source_stream:
       reader=csv.DictReader(source_stream)
       if reader.fieldnames!=FIELDS:raise ValueError('Cannot replace a different comparison table')
       old_outputs={row['저장 PNG 경로']:row['원본 크기 렌더 SHA256'] for row in reader}
    completed={}
    if CHECKPOINT.exists():
      with CHECKPOINT.open(encoding='utf-8-sig',newline='') as source_stream:
       reader=csv.DictReader(source_stream)
       if reader.fieldnames!=FIELDS:raise ValueError('Unexpected checkpoint schema')
       for row in reader:
        key=(row['버전'],row['유형'],row['직업'],row['마감'])
        if key in completed:raise ValueError('Duplicate checkpoint entry')
        completed[key]=row
        old_outputs[row['저장 PNG 경로']]=row['원본 크기 렌더 SHA256']
    source=cmp.prepared_script();worker=cmp.D3D(return_pixels=True);saved=sys.argv[:];previous={};count=0
    stream=CHECKPOINT.open('a' if CHECKPOINT.exists() else 'x',encoding='utf-8-sig',newline='')
    writer=csv.DictWriter(stream,fieldnames=FIELDS)
    if not completed:writer.writeheader();stream.flush()
    try:
       for build in cmp.BUILDS:
        for family in FAMILIES:
         for cls in cmp.CLASSES:
          for finish in ['normal','golden']:
           key=(family,cls,finish);old=previous.get(key)
           completed_key=('1.0.0.'+build,family,cls,finish)
           if completed_key in completed:
            row=completed[completed_key];dest=OUTPUT/row['저장 PNG 경로']
            with Image.open(dest) as saved_image:
             if saved_image.mode!='RGBA' or hashlib.sha256(saved_image.tobytes()).hexdigest()!=row['원본 크기 렌더 SHA256']:
              raise ValueError('Checkpoint PNG changed: '+str(dest))
            previous[key]={'build':build,'hash':row['원본 크기 렌더 SHA256']};count+=1;continue
           def render(replacement=None):
            sys.argv=[str(cmp.RENDERER),build,family,cls,finish,'--digest-only','--frame-pixels','--time','0','--rarity','FREE']
            if replacement:sys.argv+=['--replace-half-from',replacement]
            env={'__name__':'__batch_render__','__file__':str(cmp.RENDERER),'BATCH_GZ_JSON':cmp.gz_json,
                 'BATCH_JSON':cmp.text_json,'BATCH_GZIP':cmp.raw_gzip,'BATCH_IMAGE':cmp.image_read,'BATCH_GPU':worker.render}
            capture=io.StringIO()
            with contextlib.redirect_stdout(capture):exec(source,env)
            result=json.loads(capture.getvalue());pixels=worker.last_pixels
            if result['size']!=[1024,1536] or len(pixels)!=1024*1536*4: raise ValueError('Unexpected render dimensions')
            return result,Image.frombytes('RGBA',(1024,1536),pixels)
           filename='1.0.0.'+build+(' - 황금.png' if finish=='golden' else ' - 일반.png')
           dest=IMAGE_ROOT/NAMES[cls]/FAMILIES[family]/filename
           result,image=render();bbox=image.getchannel('A').getbbox()
           if not bbox or bbox[0]<=0 or bbox[1]<=0 or bbox[2]>=1024 or bbox[3]>=1536:
            raise ValueError('Frame is empty or clipped: '+str((build,key,bbox)))
           trimmed=image.crop(bbox)
           digest=hashlib.sha256(trimmed.tobytes()).hexdigest()
           if dest.exists():
            relative=str(dest.relative_to(OUTPUT))
            if relative not in old_outputs:raise FileExistsError('Output not made by the previous comparison: '+str(dest))
            with Image.open(dest) as existing:
             if existing.mode!='RGBA' or hashlib.sha256(existing.tobytes()).hexdigest()!=old_outputs[relative]:raise ValueError('Previously generated PNG was modified: '+str(dest))
           dest.parent.mkdir(parents=True,exist_ok=True);trimmed.save(dest)
           with Image.open(dest) as check:
            if check.mode!='RGBA' or check.tobytes()!=trimmed.tobytes(): raise ValueError('Saved PNG pixels differ')
           replacement=None;replacement_digest=None
           if old and digest!=old['hash'] and build in ('3890','4217'):
            replacement,alternate=render(old['build'])
            if replacement['replacements']:
             alternate=alternate.crop(alternate.getchannel('A').getbbox());replacement_digest=hashlib.sha256(alternate.tobytes()).hexdigest()
           row={'버전':'1.0.0.'+build,'직전 버전':'1.0.0.'+old['build'] if old else '',
                '유형':family,'직업':cls,'마감':finish,'희귀도':'FREE','시각(초)':0,'비교 캔버스':'1024x1536',
                '원본 크기 렌더 SHA256':digest,'직전 렌더 SHA256':old['hash'] if old else '',
                '직전과 비교':('같음' if digest==old['hash'] else '다름') if old else '첫 버전',
                '직전 큰 원본 텍스처 대체 SHA256':replacement_digest or '',
                '대체 후 직전과 비교':('같음' if replacement_digest==old['hash'] else '다름') if replacement_digest else '해당 없음',
                '대체한 원본 텍스처':json.dumps(replacement['replacements'],ensure_ascii=False,separators=(',',':')) if replacement else '',
                '저장 PNG 크기':str(trimmed.width)+'x'+str(trimmed.height),'저장 PNG 경로':str(dest.relative_to(OUTPUT))}
           writer.writerow(row);stream.flush();previous[key]={'build':build,'hash':digest};count+=1
           if count%20==0:print(json.dumps({'완료':count,'버전':build},ensure_ascii=False),flush=True)
    finally:sys.argv=saved;worker.close();stream.close()
    os.replace(CHECKPOINT,TABLE)
    print(json.dumps({'완료':count,'예상':len(cmp.BUILDS)*len(FAMILIES)*len(cmp.CLASSES)*2},ensure_ascii=False))


if __name__=='__main__':main()
