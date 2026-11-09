// Requires tests/serve.mjs on localhost:19420 and a WebGPU-capable Chrome.
// Only generated previews are replaced; no extracted mesh/texture is modified.
import fs from 'node:fs/promises';
import path from 'node:path';
import crypto from 'node:crypto';
import {spawn} from 'node:child_process';
import {setTimeout as sleep} from 'node:timers/promises';
import {fileURLToPath} from 'node:url';
const root=fileURLToPath(new URL('../',import.meta.url));
const output=path.join(root,'v7.14.4-webgpu-20261109/assets/unity/frame-previews');
const index=path.join(root,'plugin/hscard/assets/unity/frame-previews/index.json');
const stage=path.join(root,'.build/frame-previews');
const port=19540;
await fs.mkdir(stage,{recursive:true});
const chrome=spawn(process.env.CHROME_PATH||'C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--enable-unsafe-webgpu','--no-first-run','--no-default-browser-check','--remote-debugging-port='+port,'--user-data-dir='+path.join(root,'.build/preview-browser'),'about:blank'],{windowsHide:true,stdio:'ignore'});
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:'+port+'/json')).json();break;}catch{await sleep(100);}}
 if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});
 let sequence=0;const pending=new Map();ws.onmessage=e=>{const m=JSON.parse(e.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++sequence;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}));});
 async function evaluate(expression){const result=await call('Runtime.evaluate',{expression,returnByValue:true,awaitPromise:true});if(result.exceptionDetails)throw Error(result.exceptionDetails.exception?.description||JSON.stringify(result.exceptionDetails));return result.result.value;}
 await call('Page.navigate',{url:'http://127.0.0.1:19420/work/build-frame-previews.html'});
 let ready;for(let i=0;i<600;i++){await sleep(200);ready=await evaluate('window.result');if(ready&&!ready.running)break;}
 if(!ready||ready.running||ready.error)throw Error(ready?.error||'Preview initialization timed out');
 console.log(JSON.stringify(ready));
 const manifest=await evaluate('window.previewManifest'),files=new Set(),unavailable=[];
 for(let i=0;i<ready.jobs;i++){
  const result=await evaluate('window.renderPreview('+i+')');
  if(result.unavailable){for(const ref of result.refs){const row=manifest.entries[ref.key];row.history[ref.index].file=row.current;delete row.history[ref.index].signature;}unavailable.push(result.card);continue;}
  const bytes=Buffer.from(result.data,'base64');
  const file=crypto.createHash('sha256').update(bytes).digest('hex').slice(0,24)+'.webp';
  if(!files.has(file)){await fs.writeFile(path.join(stage,file),bytes);files.add(file);}
  for(const ref of result.refs){const row=manifest.entries[ref.key];if(ref.current)row.current=file;else{row.history[ref.index].file=file;delete row.history[ref.index].signature;}}
  if(i%100===0)console.log(JSON.stringify({completed:i+1,total:ready.jobs,images:files.size}));
 }
 for(const row of Object.values(manifest.entries))if(!files.has(row.current)||row.history.some(x=>!files.has(x.file)))throw Error('Incomplete preview manifest');
 // Content-addressed CDN images are immutable. Retain old hashes for cached HTML.
 await fs.mkdir(output,{recursive:true});
 for(const file of files)await fs.copyFile(path.join(stage,file),path.join(output,file));
 await fs.mkdir(path.dirname(index),{recursive:true});
 await fs.writeFile(index,JSON.stringify(manifest));
 console.log(JSON.stringify({ok:true,images:files.size,entries:Object.keys(manifest.entries).length,unavailableHistoricalCombinations:unavailable.length,bytes:(await Promise.all([...files].map(f=>fs.stat(path.join(output,f))))).reduce((n,s)=>n+s.size,0)}));
}finally{ws?.close();chrome.kill();}
