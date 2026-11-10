// Render source iOS frames at a 512px-source-based common comparison scale.
// Cropping removes only transparent margins; PNG encoding preserves RGBA bytes.
import fs from 'node:fs/promises';
import {spawn} from 'node:child_process';
import {deflateSync} from 'node:zlib';
import {setTimeout as sleep} from 'node:timers/promises';

const root='v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/';
const destination='E:/hearthstone card/시기별 프레임 직업별 렌더 비교/';
const snapshots=JSON.parse(await fs.readFile(root+'index.json')).snapshots.filter(x=>
 ['14836313','563785077','588883794','608602673'].includes(x.source.archiveId));
const classes={NEUTRAL:'중립',DRUID:'드루이드',HUNTER:'사냥꾼',MAGE:'마법사',PALADIN:'성기사',
 PRIEST:'사제',ROGUE:'도적',SHAMAN:'주술사',WARLOCK:'흑마법사',WARRIOR:'전사'};
const kinds={Ally:'하수인',Ability:'주문',Weapon:'무기'};
function crc(buf){let c=0xffffffff;for(const v of buf){c^=v;for(let i=0;i<8;i++)c=(c>>>1)^((c&1)?0xedb88320:0)}return(c^0xffffffff)>>>0}
function chunk(name,data){const tag=Buffer.from(name),len=Buffer.alloc(4),sum=Buffer.alloc(4);len.writeUInt32BE(data.length);sum.writeUInt32BE(crc(Buffer.concat([tag,data])));return Buffer.concat([len,tag,data,sum])}
function png(width,height,rgba){
 if(rgba.length!==width*height*4)throw Error('Unexpected original pixel count');
 const header=Buffer.alloc(13);header.writeUInt32BE(width,0);header.writeUInt32BE(height,4);header[8]=8;header[9]=6;
 const scan=Buffer.alloc((width*4+1)*height);for(let y=0;y<height;y++)rgba.copy(scan,y*(width*4+1)+1,y*width*4,(y+1)*width*4);
 return Buffer.concat([Buffer.from([137,80,78,71,13,10,26,10]),chunk('IHDR',header),chunk('IDAT',deflateSync(scan)),chunk('IEND',Buffer.alloc(0))]);
}
const chrome=spawn('C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--remote-debugging-port=19540','--user-data-dir=E:/HSdeck/frame/.build/preview-browser','--no-first-run','--enable-unsafe-webgpu','about:blank'],{stdio:'ignore',windowsHide:true});
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:19540/json')).json();break}catch{await sleep(100)}}if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject});
 let n=0;const pending=new Map();ws.onmessage=e=>{const m=JSON.parse(e.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result)}};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++n;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}))});
 await call('Page.navigate',{url:'http://127.0.0.1:19420/work/ios-gles-reference.html?originalCollection=1&framePixels=1'});
 for(let i=0;i<200;i++){const r=await call('Runtime.evaluate',{expression:'window.ready===true',returnByValue:true});if(r.result.value)break;if(i===199)throw Error('Reference page unavailable');await sleep(250)}
 const report=[],previous=new Map();let count=0;
 for(const snapshot of snapshots){
  for(const family of Object.keys(kinds))for(const cls of Object.keys(classes))for(const golden of [false,true]){
   const result=await call('Runtime.evaluate',{expression:`window.renderOriginal(${JSON.stringify(snapshot.file)},${JSON.stringify(family)},${golden},0,${JSON.stringify(cls)},'FREE')`,awaitPromise:true,returnByValue:true});
   if(result.exceptionDetails)throw Error(JSON.stringify(result.exceptionDetails));const row=result.result.value;
   if(!row||row.width!==448||row.height!==576||row.visiblePixels<10000)throw Error('Invalid frame: '+JSON.stringify(row));
   const capture=await call('Runtime.evaluate',{expression:`(()=>{const c=document.querySelector('canvas'),g=c.getContext('webgl'),w=c.width,h=c.height,p=new Uint8Array(w*h*4);g.readPixels(0,0,w,h,g.RGBA,g.UNSIGNED_BYTE,p);let l=w,t=h,r=0,b=0;for(let y=0;y<h;y++)for(let x=0;x<w;x++)if(p[(y*w+x)*4+3]){l=Math.min(l,x);r=Math.max(r,x+1);t=Math.min(t,h-1-y);b=Math.max(b,h-y)}if(l<=0||t<=0||r>=w||b>=h)throw Error('Frame clipped');const out=new Uint8Array((r-l)*(b-t)*4);for(let y=t;y<b;y++)out.set(p.subarray(((h-1-y)*w+l)*4,((h-1-y)*w+r)*4),(y-t)*(r-l)*4);let s='';for(let i=0;i<out.length;i+=16384)s+=String.fromCharCode(...out.subarray(i,i+16384));return {width:r-l,height:b-t,rgba:btoa(s)}})()`,returnByValue:true});
   if(capture.exceptionDetails)throw Error(JSON.stringify(capture.exceptionDetails));const image=capture.result.value,bytes=Buffer.from(image.rgba,'base64');
   const folder=destination+'iOS 프레임 원본 크기/'+classes[cls]+'/'+kinds[family];await fs.mkdir(folder,{recursive:true});
   const file=folder+'/'+snapshot.source.version+' ('+snapshot.source.archiveId+') - '+(golden?'황금':'일반')+'.png';await fs.writeFile(file,png(image.width,image.height,bytes),{flag:'wx'});
   const key=family+':'+cls+':'+golden,prior=previous.get(key);report.push({...row,previous:prior?.version||null,sameAsPrevious:prior?prior.hash===row.rgbaSha256:null,pngSize:[image.width,image.height],png:file});previous.set(key,{version:row.version,hash:row.rgbaSha256});
   if(++count%20===0)console.log(JSON.stringify({completed:count,version:row.version}));
  }
  await call('Runtime.evaluate',{expression:`window.releaseOriginal(${JSON.stringify(snapshot.file)})`,returnByValue:true});
 }
 await fs.writeFile(destination+'베타-오리지널 iOS 프레임 원본 크기 비교.json',JSON.stringify({scope:'Original iOS source textures, mip levels, meshes and GLES; 512px-source-based common scale; fixed lighting, placeholder portrait, no text or card-specific golden animation; original mobile GPU and actual runtime camera remain unverified.',cases:report})+'\n',{flag:'wx'});
 console.log(JSON.stringify({completed:count,expected:snapshots.length*3*10*2}));
}finally{ws?.close();chrome.kill()}
