// Uses the existing development browser profile; writes no screenshots/copies.
import assert from 'node:assert/strict';
import {spawn} from 'node:child_process';
import {setTimeout as sleep} from 'node:timers/promises';
import {fileURLToPath} from 'node:url';
const profile=fileURLToPath(new URL('../.build/preview-browser',import.meta.url));
const nativeBeta=process.argv.includes('--native-beta');
const port=19540;
const chrome=spawn('C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--remote-debugging-port='+port,'--user-data-dir='+profile,'--no-first-run','--no-default-browser-check','--enable-unsafe-webgpu','about:blank'],{windowsHide:true,stdio:'ignore'});
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:'+port+'/json')).json();break;}catch{await sleep(100);}}
 if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});
 let sequence=0;const pending=new Map(),requests=[],pageErrors=[];
 ws.onmessage=event=>{const m=JSON.parse(event.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}else if(m.method==='Network.requestWillBeSent')requests.push(m.params.request.url);else if(m.method==='Runtime.exceptionThrown')pageErrors.push(m.params.exceptionDetails);};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++sequence;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}));});
 await call('Runtime.enable');await call('Network.enable');
 await call('Network.setCacheDisabled',{cacheDisabled:true});
 async function run(source){
  await call('Page.navigate',{url:'http://127.0.0.1:19420/work/frame-apis.html?source='+source+(nativeBeta?'&native=1':'')});
  for(let i=0;i<900;i++){
   await sleep(500);const r=await call('Runtime.evaluate',{expression:'window.result',returnByValue:true}),value=r.result.value;
   if(value&&!value.running){assert.ok(!value.error,value.error);assert.deepEqual(value.errors,[]);return value.cases;}
   if(i%60===0)console.log(JSON.stringify({source,progress:value}));
  }
  throw Error('Render verification timed out: '+source);
 }
 const local=await run('local');
 if(nativeBeta){console.log(JSON.stringify({ok:true,mode:'experimental-original-beta-shaders',cases:local}));process.exitCode=0;}
 else {
 requests.length=0;
 const remote=await run('api');
 assert.deepEqual(remote,local,'Moving original resources must not change rendered pixels');
 assert.ok(requests.some(u=>u.includes('/legacy/')&&u.includes('/frame/')));
 assert.ok(requests.some(u=>u.includes('/Madness-At-The-Darkmoon-Faire/')));
 assert.ok(!requests.some(u=>u.includes('hsdeck-frame')||u.includes('/qxwd565/frame/')||u.includes('/resources/')));
 assert.deepEqual(pageErrors,[]);
 console.log(JSON.stringify({ok:true,pixelIdenticalCases:remote.length,requests:requests.length,oldCdnRequests:0,cases:remote}));
 }
}finally{ws?.close();chrome.kill();}
