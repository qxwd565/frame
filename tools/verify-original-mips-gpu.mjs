import fs from 'node:fs/promises';
import {spawn} from 'node:child_process';
import {setTimeout as sleep} from 'node:timers/promises';
import {fileURLToPath} from 'node:url';
const report=JSON.parse(await fs.readFile('E:/hearthstone card/시기별 프레임 직업별 렌더 비교/베타-오리지널 원본 텍스처 밉맵.json','utf8'));
const profile=fileURLToPath(new URL('../.build/preview-browser',import.meta.url)),port=19540;
const chrome=spawn('C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--remote-debugging-port='+port,'--user-data-dir='+profile,'--no-first-run','--no-default-browser-check','--enable-unsafe-webgpu','about:blank'],{windowsHide:true,stdio:'ignore'});
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:'+port+'/json')).json();break;}catch{await sleep(100);}}if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});let seq=0;const pending=new Map();
 ws.onmessage=e=>{const m=JSON.parse(e.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++seq;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}));});
 await call('Page.navigate',{url:'http://127.0.0.1:19420/work/original-mips-gpu.html'});
 for(let i=0;i<100;i++){if((await call('Runtime.evaluate',{expression:'window.ready===true',returnByValue:true})).result.value)break;if(i===99)throw Error('Mip GPU test page unavailable');await sleep(100);}
 const output=[];
 for(const version of ['1.0.0.3664','1.0.0.4217']){
  const source=report.versions.find(x=>x.source.platform==='Windows'&&x.source.version===version),meta=source?.textures.find(x=>x.name==='Card_Inhand_Minion_Mage');if(!meta)throw Error('Original source texture unavailable');
  const result=await call('Runtime.evaluate',{expression:`window.verifyOriginalMips(${JSON.stringify(meta)})`,awaitPromise:true,returnByValue:true});
  if(result.exceptionDetails)throw Error(result.exceptionDetails.exception?.description||result.exceptionDetails.text);output.push({version,...result.result.value});
 }
 console.log(JSON.stringify({results:output}));
}finally{ws?.close();chrome.kill();}
