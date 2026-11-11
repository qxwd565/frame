// Run original 3664 spell/weapon profiles on a real Chrome WebGPU device.
import {spawn} from 'node:child_process';
import {setTimeout as sleep} from 'node:timers/promises';
import {fileURLToPath} from 'node:url';
const profile=fileURLToPath(new URL('../.build/preview-browser',import.meta.url)),port=19540;
const chrome=spawn('C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--remote-debugging-port='+port,'--user-data-dir='+profile,'--no-first-run','--no-default-browser-check','--enable-unsafe-webgpu','about:blank'],{windowsHide:true,stdio:'ignore'});
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:'+port+'/json')).json();break;}catch{await sleep(100);}}if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});
 let id=0;const pending=new Map();ws.onmessage=e=>{const m=JSON.parse(e.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const key=++id;pending.set(key,{resolve,reject});ws.send(JSON.stringify({id:key,method,params}));});
 const fill=process.argv.includes('--frame-fill'),server=Number(process.argv.find(x=>x.startsWith('--server='))?.split('=')[1]||19420);
 await call('Runtime.enable');
 if(process.argv.includes('--summon')||process.argv.includes('--hero')){
  await call('Page.navigate',{url:'http://127.0.0.1:'+server+'/work/pc-d3d-parity.html'+(process.argv.includes('--api')?'?source=api':'')});
  for(let i=0;i<400;i++){const r=await call('Runtime.evaluate',{expression:'window.ready===true',returnByValue:true});if(r.result.value)break;if(i===399)throw Error('Summon test page unavailable');await sleep(250);}
  const hero=process.argv.includes('--hero');
  const r=await call('Runtime.evaluate',{expression:hero?'window.verifyHeroPower()':'window.verifySummon()',awaitPromise:true,returnByValue:true});
  if(r.exceptionDetails)throw Error(JSON.stringify(r.exceptionDetails));
  if(hero){if(r.result.value.version!=='1.0.0.3664'||r.result.value.parts<2)throw Error('Hero power regression: '+JSON.stringify(r.result.value));console.log(JSON.stringify({ok:true,heroPower:r.result.value}));}
  else{
  const frames=r.result.value;if(frames.length!==6||!frames[1].paths.includes('3664:SummonIn/ScryLines')||!frames[1].paths.includes('3664:SummonIn/FX_BlueRays')||frames.at(-1).paths.length||!frames.at(-1).complete||new Set(frames.map(x=>x.sha256)).size<3)throw Error('Summon playback verification failed: '+JSON.stringify(frames));
  console.log(JSON.stringify({ok:true,frames}));
  }
 }else{
 async function run(api){
  await call('Page.navigate',{url:'http://127.0.0.1:'+server+'/work/'+(fill?'native-frame-fill.html':'3664-original.html'+(api?'?source=api':''))});
  for(let i=0;i<900;i++){
   await sleep(500);const result=(await call('Runtime.evaluate',{expression:'window.result',returnByValue:true})).result.value;
   if(result&&!result.running){if(result.error||result.errors.length||result.cases.length!==(fill?36:40)||(!fill&&result.effectTextures!==8))throw Error(JSON.stringify(result));return result;}
  }
  throw Error('3664 WebGPU verification timed out');
 }
 const local=await run(process.argv.includes('--api'));
 if(process.argv.includes('--compare-api')){
  const remote=await run(true);if(JSON.stringify(local.cases)!==JSON.stringify(remote.cases))throw Error('Local and API 3664 output pixels differ');
 }
 console.log(JSON.stringify({ok:true,cases:local.cases.length,effectTextures:local.effectTextures,apiPixelsIdentical:process.argv.includes('--compare-api'),results:local.cases}));
 }
}finally{ws?.close();chrome.kill();}
