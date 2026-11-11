// Compare recorded Unity 4.1.2 particle states against the actual Unity D3D
// framebuffer. This is distinct from comparing the same generated draw twice.
import {spawn,spawnSync} from 'node:child_process';
import {setTimeout as sleep} from 'node:timers/promises';
import {fileURLToPath} from 'node:url';
const python='C:/Program Files/WindowsApps/OpenAI.CodexPrimaryRuntime.v26-1104-2876-0_26.1104.2876.0_x64__3k8sg7r9htsxt/dependencies/python/python.exe';
const profile=fileURLToPath(new URL('../.build/preview-browser',import.meta.url)),port=19540;
const chrome=spawn('C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--remote-debugging-port='+port,'--user-data-dir='+profile,'--no-first-run','--no-default-browser-check','--enable-unsafe-webgpu','about:blank'],{windowsHide:true,stdio:'ignore'});
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:'+port+'/json')).json();break;}catch{await sleep(100);}}if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});
 let seq=0;const pending=new Map();ws.onmessage=e=>{const m=JSON.parse(e.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++seq;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}));});
 const server=process.argv.find(x=>x.startsWith('--server='))?.split('=')[1]||'19420';
 await call('Page.navigate',{url:`http://127.0.0.1:${server}/work/pc-d3d-parity.html`});
 for(let i=0;i<400;i++){const r=await call('Runtime.evaluate',{expression:'window.ready===true',returnByValue:true});if(r.result.value)break;if(i===399)throw Error('Unity reference comparison page unavailable');await sleep(250);}
 const scales=process.argv.includes('--sweep-fine')?[.99,.995,.9975,.999,1,1.001,1.0025,1.005,1.01]:process.argv.includes('--sweep-size')?[1,.5,.25,.2,.16,.125,.1,.08,.0625]:[Number(process.argv.find(x=>x.startsWith('--size='))?.split('=')[1]||1)];
 const time=Number(process.argv.find(x=>x.startsWith('--time='))?.split('=')[1]||.05);if(![.05,.2,.4].includes(time))throw Error('Independent Unity reference unavailable at this time');
 const background=process.argv.find(x=>x.startsWith('--background='))?.split('=')[1]?.toUpperCase()||'000000';if(!/^[0-9A-F]{6}$/.test(background))throw Error('Invalid reference background');
 const modes=process.argv.includes('--sweep-color')?[0,1,2,3,4]:[Number(process.argv.find(x=>x.startsWith('--color='))?.split('=')[1]||0)];
 const output=[];
 for(const scale of scales)for(const mode of modes){if(!Number.isFinite(scale)||scale<=0||!Number.isInteger(mode)||mode<0||mode>4)throw Error('Invalid diagnostic particle parameters');
  const rotation=Number(process.argv.find(x=>x.startsWith('--rotation='))?.split('=')[1]||1);if(![-1,1].includes(rotation))throw Error('Invalid diagnostic rotation');
  const rgb=[0,2,4].map(i=>parseInt(background.slice(i,i+2),16)/255);
  await call('Runtime.evaluate',{expression:`window.unityParticleSizeFactor=${scale};window.unityParticleRotationSign=${rotation};window.unityParticleColorMode=${mode};window.useUnityCapturedColors=${process.argv.includes('--recorded-colors')};window.unityDiagnosticBackground=${JSON.stringify([...rgb,1])}`,returnByValue:true});
  const recorded=process.argv.includes('--recorded');
  const result=await call('Runtime.evaluate',{expression:recorded?`window.capture('2013-08-17',false,'MAGE',null,'RECORDED',${time})`:`window.capture('2013-08-17',false,'MAGE',null,'SUMMON',-1)`,awaitPromise:true,returnByValue:true});
  if(result.exceptionDetails)throw Error(JSON.stringify(result.exceptionDetails));
  const capture=result.result.value,gpu=Buffer.from(capture.webgpuPixels,'base64');
  if(capture.width!==436||capture.height!==682||gpu.length!==436*682*4)throw Error('Unexpected particle framebuffer dimensions');
 const script=String.raw`from PIL import Image,ImageDraw,ImageFont
import io,sys,json,os
root=r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교'
label=sys.argv[1];background=sys.argv[2];suffix='' if background=='000000' else ' - 배경 '+background
ref=Image.open(os.path.join(root,'3664 - 소환 입자 원본 Unity D3D - '+label+'초'+suffix+'.png')).convert('RGBA')
gpu=Image.frombytes('RGBA',(436,682),sys.stdin.buffer.read())
def compare(a,b):
 aa=a.tobytes();bb=b.tobytes();changed=0;total=0;maximum=0;orig=0;current=0;hist={};samples=[]
 for i in range(0,len(aa),4):
  ds=[abs(aa[i+j]-bb[i+j]) for j in range(4)];total+=sum(ds);maximum=max(maximum,*ds);changed+=int(any(ds));orig+=int(any(aa[i:i+3]));current+=int(any(bb[i:i+3]));
  if any(ds):
   for j in range(4):
    d=bb[i+j]-aa[i+j]
    if d: key=str(j)+':'+str(d);hist[key]=hist.get(key,0)+1
   if len(samples)<5:samples.append({'x':(i//4)%436,'y':(i//4)//436,'original':list(aa[i:i+4]),'webgpu':list(bb[i:i+4])})
 return {'changedPixels':changed,'meanAbsoluteError':total/len(aa),'maxChannelError':maximum,'referenceVisible':orig,'webgpuVisible':current,'histogram':hist,'samples':samples}
normal=compare(ref,gpu);flipped=compare(ref.transpose(Image.Transpose.FLIP_TOP_BOTTOM),gpu);flip=flipped['meanAbsoluteError']<normal['meanAbsoluteError'];best=flipped if flip else normal
if '--write' in sys.argv:
 out=Image.new('RGB',(872,714),'white');dr=ImageDraw.Draw(out);font=ImageFont.truetype(r'C:\Windows\Fonts\malgun.ttf',18);dr.text((10,4),'원본 Unity 4.1.2 D3D',font=font,fill='black');dr.text((446,4),'플러그인 WebGPU',font=font,fill='black');out.paste(ref.transpose(Image.Transpose.FLIP_TOP_BOTTOM) if flip else ref,(0,32));out.paste(gpu,(436,32));path=os.path.join(root,'3664 - 소환 입자 원본과 플러그인 비교 - '+label+'초.png');out.save(path);best['comparisonImage']=path
best['referenceVerticallyFlipped']=flip;print(json.dumps(best,ensure_ascii=False))`;
  const run=spawnSync(python,['-c',script,time.toFixed(2),background,...(process.argv.includes('--write')?['--write']:[])],{input:gpu,maxBuffer:2*1024*1024});
  if(run.status!==0)throw Error(run.stderr.toString());const report=JSON.parse(run.stdout.toString());
  output.push({time,background,sizeFactor:scale,rotationSign:rotation,colorMode:mode,...report});
 }
 console.log(JSON.stringify({scope:process.argv.includes('--recorded')?'Actual Unity 4.1.2 D3D image vs replay of its recorded framebuffer; camera orientation corrected if needed.':'Actual Unity 4.1.2 D3D 0.05 s image vs WebGPU using the same recorded particle states; camera orientation corrected if needed.',results:output}));
 if(process.argv.includes('--exact')&&output.some(report=>report.changedPixels))process.exitCode=1;
}finally{ws?.close();chrome.kill();}
