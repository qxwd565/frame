// Execute each iOS client's own GLES frame shaders in the browser. The fixed
// comparison omits text/individual golden art and holds camera and mip policy
// constant; source-side limitations are reported, not filled from neighbors.
import fs from 'node:fs/promises';
import {spawn} from 'node:child_process';
import {setTimeout as sleep} from 'node:timers/promises';
import {fileURLToPath} from 'node:url';
const root='v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/';
const index=JSON.parse(await fs.readFile(root+'index.json'));
let snapshots=index.snapshots.filter(x=>x.source.platform==='iOS');
if(process.argv.includes('--smoke'))snapshots=snapshots.filter(x=>['14836313','812371056','812995749','813968750'].includes(x.source.archiveId));
const profile=fileURLToPath(new URL('../.build/preview-browser',import.meta.url)),port=19540;
const chrome=spawn('C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--remote-debugging-port='+port,'--user-data-dir='+profile,'--no-first-run','--no-default-browser-check','--enable-unsafe-webgpu','about:blank'],{windowsHide:true,stdio:'ignore'});
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:'+port+'/json')).json();break;}catch{await sleep(100);}}if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});let sequence=0;const pending=new Map(),errors=[];
 ws.onmessage=e=>{const m=JSON.parse(e.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}else if(m.method==='Runtime.exceptionThrown')errors.push(m.params.exceptionDetails.exception?.description||m.params.exceptionDetails.text);};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++sequence;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}));});
 await call('Runtime.enable');await call('Page.navigate',{url:'http://127.0.0.1:19420/work/ios-gles-reference.html'});
 for(let i=0;i<400;i++){const r=await call('Runtime.evaluate',{expression:'window.ready===true',returnByValue:true});if(r.result.value)break;if(errors.length)throw Error(errors.join('\n'));if(i===399)throw Error('GLES reference page unavailable');await sleep(250);}
 const records=[],previous=new Map();
 for(const snapshot of snapshots){
  const item={source:snapshot.source,coverage:snapshot.coverage,results:[]};
  const classes=process.argv.includes('--all-classes')?['NEUTRAL','DRUID','HUNTER','MAGE','PALADIN','PRIEST','ROGUE','SHAMAN','WARLOCK','WARRIOR']:['NEUTRAL'];
  const rarities=process.argv.includes('--all-classes')?['FREE','LEGENDARY']:['FREE'];
  for(const family of ['Ally','Ability','Weapon'])for(const golden of [false,true])for(const time of [0,1.25])for(const cardClass of classes)for(const rarity of rarities){
   const key=family+':'+golden+':'+time+':'+cardClass+':'+rarity,prior=previous.get(key);
   try{
    const response=await call('Runtime.evaluate',{expression:`window.renderOriginal(${JSON.stringify(snapshot.file)},${JSON.stringify(family)},${golden},${time},${JSON.stringify(cardClass)},${JSON.stringify(rarity)})`,awaitPromise:true,returnByValue:true});
    if(response.exceptionDetails)throw Error(response.exceptionDetails.exception?.description||response.exceptionDetails.text);
    const result=response.result.value;if(!result||result.visiblePixels<10000)throw Error('Reference frame empty');
    result.status='rendered';result.comparedTo=prior?.source||null;result.pixelsEqual=prior?prior.rgbaSha256===result.rgbaSha256:null;
    previous.set(key,{source:snapshot.source,rgbaSha256:result.rgbaSha256});item.results.push(result);
   }catch(error){item.results.push({family,golden,time,cardClass,rarity,status:'unverified',reason:String(error.message||error)});}
  }
  await call('Runtime.evaluate',{expression:`window.releaseOriginal(${JSON.stringify(snapshot.file)})`,returnByValue:true});
  records.push(item);console.log(JSON.stringify({version:snapshot.source.version,archiveId:snapshot.source.archiveId,rendered:item.results.filter(x=>x.status==='rendered').length,errors:[...new Set(item.results.filter(x=>x.status!=='rendered').map(x=>x.reason.split('\n')[0]))]}));
 }
 const report={schema:1,scope:'Original iOS GLES shader code executed in desktop WebGL with fixed test class tint, camera and base-level texture sampling at two animation times. Text, original mip levels, mobile GPU precision, MonoBehaviour-driven behavior and card-specific golden art are excluded. Some source snapshots have unresolved component fields.',records};
 if(process.argv.includes('--verify')){
  const prior=JSON.parse(await fs.readFile(root+'ios-gles-render-comparison.json'));
  const hashes=rows=>rows.map(r=>({source:r.source,results:r.results.map(x=>({family:x.family,golden:x.golden,time:x.time,cardClass:x.cardClass,rarity:x.rarity,status:x.status,rgbaSha256:x.rgbaSha256}))}));
  if(JSON.stringify(hashes(prior.records))!==JSON.stringify(hashes(records)))throw Error('Original GLES frame output changed between identical runs');
 }
 if(!process.argv.includes('--no-write'))await fs.writeFile(root+'ios-gles-render-comparison.json',JSON.stringify(report)+'\n');
 console.log(JSON.stringify({completed:true,versions:records.length,rendered:records.flatMap(x=>x.results).filter(x=>x.status==='rendered').length}));
}finally{ws?.close();chrome.kill();}
