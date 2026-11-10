// Execute each iOS client's own GLES frame shaders in the browser. The fixed
// comparison omits text/individual golden art and holds camera and mip policy
// constant; source-side limitations are reported, not filled from neighbors.
import fs from 'node:fs/promises';
import {spawn} from 'node:child_process';
import {setTimeout as sleep} from 'node:timers/promises';
import {fileURLToPath} from 'node:url';
const root='v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/';
const index=JSON.parse(await fs.readFile(root+'index.json'));
const originalCollection=process.argv.includes('--original-collection');
let snapshots=index.snapshots.filter(x=>x.source.platform==='iOS');
if(originalCollection)snapshots=snapshots.filter(x=>['14836313','563785077','588883794','608602673'].includes(x.source.archiveId));
if(process.argv.includes('--smoke'))snapshots=snapshots.filter(x=>(originalCollection?['14836313','608602673']:['14836313','812371056','812995749','813968750']).includes(x.source.archiveId));
const profile=fileURLToPath(new URL('../.build/preview-browser',import.meta.url)),port=19540;
const chrome=spawn('C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--remote-debugging-port='+port,'--user-data-dir='+profile,'--no-first-run','--no-default-browser-check','--enable-unsafe-webgpu','about:blank'],{windowsHide:true,stdio:'ignore'});
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:'+port+'/json')).json();break;}catch{await sleep(100);}}if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});let sequence=0;const pending=new Map(),errors=[];
 ws.onmessage=e=>{const m=JSON.parse(e.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}else if(m.method==='Runtime.exceptionThrown')errors.push(m.params.exceptionDetails.exception?.description||m.params.exceptionDetails.text);};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++sequence;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}));});
 await call('Runtime.enable');await call('Page.navigate',{url:'http://127.0.0.1:19420/work/ios-gles-reference.html'+(originalCollection?'?originalCollection=1':'')});
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
    const result=response.result.value;if(!result||result.visiblePixels<(originalCollection?3000:100000))throw Error('Reference frame missing its main body');
    if(originalCollection&&process.argv.includes('--output-images')&&time===0&&rarity==='FREE'){
     const shot=await call('Runtime.evaluate',{expression:`(()=>{const c=document.querySelector('canvas'),g=c.getContext('webgl'),w=c.width,h=c.height,p=new Uint8Array(w*h*4);g.readPixels(0,0,w,h,g.RGBA,g.UNSIGNED_BYTE,p);const o=document.createElement('canvas');o.width=w;o.height=h;const x=o.getContext('2d'),d=x.createImageData(w,h);for(let y=0;y<h;y++)d.data.set(p.subarray((h-1-y)*w*4,(h-y)*w*4),y*w*4);x.putImageData(d,0,0);return o.toDataURL('image/png').split(',')[1]})()`,returnByValue:true});
     if(!shot.result.value)throw Error('Original collection PNG capture failed');
     const names={NEUTRAL:'중립',DRUID:'드루이드',HUNTER:'사냥꾼',MAGE:'마법사',PALADIN:'성기사',PRIEST:'사제',ROGUE:'도적',SHAMAN:'주술사',WARLOCK:'흑마법사',WARRIOR:'전사'},kinds={Ally:'하수인',Ability:'주문',Weapon:'무기'};
     const folder='E:/hearthstone card/시기별 프레임 직업별 렌더 비교/iOS 원본 수집품/'+names[cardClass]+'/'+kinds[family];await fs.mkdir(folder,{recursive:true});
     await fs.writeFile(folder+'/'+snapshot.source.version+' ('+snapshot.source.archiveId+') - '+(golden?'황금':'일반')+'.png',Buffer.from(shot.result.value,'base64'),{flag:'wx'});
    }
    result.status='rendered';result.comparedTo=prior?.source||null;result.pixelsEqual=prior?prior.rgbaSha256===result.rgbaSha256:null;
    previous.set(key,{source:snapshot.source,rgbaSha256:result.rgbaSha256});item.results.push(result);
   }catch(error){item.results.push({family,golden,time,cardClass,rarity,status:'unverified',reason:String(error.message||error)});}
  }
  await call('Runtime.evaluate',{expression:`window.releaseOriginal(${JSON.stringify(snapshot.file)})`,returnByValue:true});
  records.push(item);console.log(JSON.stringify({version:snapshot.source.version,archiveId:snapshot.source.archiveId,rendered:item.results.filter(x=>x.status==='rendered').length,errors:[...new Set(item.results.filter(x=>x.status!=='rendered').map(x=>x.reason.split('\n')[0]))]}));
 }
 const report={schema:1,scope:originalCollection?'Original iOS meshes, GLES shaders and decoded original PVRTC mip levels, sampled with the original texture LOD bias. Source collection camera and anchors, 2048x1536 comparison surface; PC-derived page-position and scale remain unverified on iOS. Fixed test lighting and class tint; text, original mobile GPU precision, dynamic behavior and card-specific golden art excluded.':'Original iOS GLES shader code executed in desktop WebGL with fixed test class tint, camera and base-level texture sampling at two animation times. Text, original mip levels, mobile GPU precision, MonoBehaviour-driven behavior and card-specific golden art are excluded. Some source snapshots have unresolved component fields.',records};
 const reportPath=originalCollection?'E:/hearthstone card/시기별 프레임 직업별 렌더 비교/베타-오리지널 iOS 렌더 비교.json':root+'ios-gles-render-comparison.json';
 if(process.argv.includes('--verify')){
  const prior=JSON.parse(await fs.readFile(reportPath));
  const hashes=rows=>rows.map(r=>({source:r.source,results:r.results.map(x=>({family:x.family,golden:x.golden,time:x.time,cardClass:x.cardClass,rarity:x.rarity,status:x.status,rgbaSha256:x.rgbaSha256}))}));
  if(JSON.stringify(hashes(prior.records))!==JSON.stringify(hashes(records)))throw Error('Original GLES frame output changed between identical runs');
 }
 if(!process.argv.includes('--no-write'))await fs.writeFile(reportPath,JSON.stringify(report)+'\n',{flag:originalCollection?'wx':'w'});
 console.log(JSON.stringify({completed:true,versions:records.length,rendered:records.flatMap(x=>x.results).filter(x=>x.status==='rendered').length}));
}finally{ws?.close();chrome.kill();}
