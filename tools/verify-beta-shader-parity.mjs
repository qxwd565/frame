// Compare identical original beta draw commands on the existing WebGL and WebGPU backends.
// Requires tests/serve.mjs and the original reference files at HSCARD_OLD_RENDERER_REFERENCE.
import assert from 'node:assert/strict';
import {spawn} from 'node:child_process';
import {setTimeout as sleep} from 'node:timers/promises';
import {fileURLToPath} from 'node:url';
const profile=fileURLToPath(new URL('../.build/preview-browser',import.meta.url)),port=19540;
const chrome=spawn('C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--remote-debugging-port='+port,'--user-data-dir='+profile,'--no-first-run','--no-default-browser-check','--enable-unsafe-webgpu','about:blank'],{windowsHide:true,stdio:'ignore'});
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:'+port+'/json')).json();break;}catch{await sleep(100);}}
 if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});
 let sequence=0;const pending=new Map();ws.onmessage=event=>{const m=JSON.parse(event.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++sequence;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}));});
 await call('Page.navigate',{url:'http://127.0.0.1:19420/work/beta-shader-parity.html'});
 for(let i=0;i<600;i++){
  await sleep(500);const r=await call('Runtime.evaluate',{expression:'window.result',returnByValue:true}),value=r.result.value;
  if(value&&!value.running){
   assert.ok(!value.error,value.error);assert.deepEqual(value.errors,[]);assert.equal(value.results.length,4);
   for(const row of value.results){assert.ok(!row.error,row.error);assert.equal(row.changed,0);assert.ok(row.meanAbsoluteError<0.001);assert.ok(row.visible>100000);}
   console.log(JSON.stringify({ok:true,comparison:'identical original shader draw commands',cases:value.results}));break;
  }
  if(i===599)throw Error('Beta shader comparison timed out');
 }
}finally{ws?.close();chrome.kill();}
