"""Summarize fixed-condition PC/iOS render comparisons without overclaiming."""
import collections
import csv
import json
import pathlib

ROOT=pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교')
PC=ROOT/'베타-오리지널 PC 렌더 비교.csv'
IOS=ROOT/'베타-오리지널 iOS 렌더 비교.json'
OUT=ROOT/'베타-오리지널 프레임 비교 요약.csv'

def main():
    if OUT.exists(): raise FileExistsError(OUT)
    with PC.open(encoding='utf-8-sig',newline='') as stream: pc=list(csv.DictReader(stream))
    ios=json.loads(IOS.read_text(encoding='utf8'))
    rows=[]
    for version in dict.fromkeys(row['버전'] for row in pc):
        group=[row for row in pc if row['버전']==version]
        counts=collections.Counter(row['직전과 비교'] for row in group)
        fallback=collections.Counter(row['대체 후 직전과 비교'] for row in group)
        rows.append({'플랫폼':'PC','버전':version,'시험 수':len(group),'직전과 같음':counts['같음'],
                     '직전과 다름':counts['다름'],'첫 버전':counts['첫 버전'],
                     '직전 큰 텍스처 대체 후 같음':fallback['같음'],'직전 큰 텍스처 대체 후 다름':fallback['다름'],
                     '조건':'1920x1080, 원본 PC 메시·DXT 밉맵·D3D 셰이더, 고정 조명, 글자·카드별 황금 원화 제외. 수집품 런타임 카메라/배치 미검증.'})
    for version in ios['records']:
        results=version['results']
        rows.append({'플랫폼':'iOS','버전':version['source']['version'],'시험 수':len(results),
                     '직전과 같음':sum(x.get('pixelsEqual') is True for x in results),
                     '직전과 다름':sum(x.get('pixelsEqual') is False for x in results),
                     '첫 버전':sum(x.get('pixelsEqual') is None and x.get('status')=='rendered' for x in results),
                     '직전 큰 텍스처 대체 후 같음':'해당 없음','직전 큰 텍스처 대체 후 다름':'해당 없음',
                     '조건':'2048x1536, 원본 iOS 메시·PVRTC 밉맵·GLES 셰이더, 고정 조명, 글자·카드별 황금 원화 제외. iOS 실제 배치·모바일 GPU 미검증.'})
    with OUT.open('x',encoding='utf-8-sig',newline='') as stream:
        writer=csv.DictWriter(stream,fieldnames=list(rows[0]));writer.writeheader();writer.writerows(rows)
    print(json.dumps({'output':str(OUT),'rows':len(rows),'pcCases':len(pc),'iosCases':sum(len(x['results']) for x in ios['records'])},ensure_ascii=False))

if __name__=='__main__':main()
