import {spawn} from 'node:child_process';
import {setTimeout as sleep} from 'node:timers/promises';
import fs from 'node:fs/promises';
import {fileURLToPath} from 'node:url';
const work=fileURLToPath(new URL('../../../.build/',import.meta.url)).replaceAll('\\','/');
const chrome=spawn(process.env.CHROME_PATH||'C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--window-size=1280,1000','--remote-debugging-port=19555','--user-data-dir='+work+'card-posts-chrome','--no-first-run','--no-default-browser-check','--enable-unsafe-webgpu','about:blank'],{windowsHide:true,stdio:'ignore'});
let ws;const errors=[],cardRequests=[];const inline=process.env.HSCARD_TEST_INLINE==='1';
try{
 let tabs;for(let n=0;n<100;n++){try{tabs=await(await fetch('http://127.0.0.1:19555/json')).json();break;}catch{await sleep(100);}}
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});
 let seq=0;const pending=new Map();ws.onmessage=e=>{const m=JSON.parse(e.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}if(m.method==='Runtime.exceptionThrown')errors.push(m.params.exceptionDetails);if(m.method==='Network.requestWillBeSent'&&/\/legacy\/main\/data\//.test(m.params.request.url))cardRequests.push(m.params.request.url);};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++seq;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}));});
 const evaluate=async expression=>(await call('Runtime.evaluate',{expression,returnByValue:true,awaitPromise:true})).result.value;
 const wait=async(expression,timeout=120000)=>{for(let start=Date.now();Date.now()-start<timeout;){const r=await evaluate(expression);if(r)return r;await sleep(500);}throw Error('Timed out: '+expression+' '+JSON.stringify(await evaluate('({url:location.href,ready:[...document.querySelectorAll("[data-hscard-card]")].map(x=>({class:x.className,ready:x.dataset.hscardReady})),errors:[...document.querySelectorAll("[data-hscard-error-label]")].map(x=>x.dataset.hscardErrorLabel)})')));};
 await call('Runtime.enable');await call('Page.enable');
 if(inline){await call('Network.enable');await call('Network.setBlockedURLs',{urls:['*raw.githubusercontent.com/qxwd565/legacy/main/data/*']});}
 await call('Page.navigate',{url:'http://127.0.0.1:19460/card-link-check/'});
 await wait('document.querySelectorAll(".hscard-card-link").length===2');
 await wait('document.querySelectorAll(".hscard-card-surface.is-native-ready").length===3');
 const grid=await evaluate('(()=>{const a=document.querySelector(".hscard-card-link");a.scrollIntoView({block:"center"});const r=a.getBoundingClientRect(),p=a.closest(".hscard-deck-card").querySelector(".hscard-card-placeholder").getBoundingClientRect();return {url:a.href,x:r.left+r.width/2,y:r.top+r.height/2,width:r.width,anchorWidth:p.width};})()');
 if(Math.abs(grid.width-grid.anchorWidth)>1)throw Error('Link overlay shifted frame geometry');
 await call('Input.dispatchMouseEvent',{type:'mouseMoved',x:grid.x,y:grid.y});await sleep(400);
 await call('Input.dispatchMouseEvent',{type:'mousePressed',x:grid.x,y:grid.y,button:'left',clickCount:1});
 await call('Input.dispatchMouseEvent',{type:'mouseReleased',x:grid.x,y:grid.y,button:'left',clickCount:1});
 await wait('location.href==='+JSON.stringify(grid.url)+'&&!!document.querySelector(".hscard-single-card")');
 await wait('document.querySelectorAll(".hscard-card-surface.is-native-ready").length===1');
 const detail=await evaluate('({url:location.href,cards:document.querySelectorAll("[data-hscard-card]").length,links:document.querySelectorAll(".hscard-card-link").length,copy:document.querySelectorAll("[data-hscard-save-code]").length,tileHidden:getComputedStyle(document.querySelector(".hscard-deck-tile")).display==="none",golden:!!document.querySelector("[data-hscard-golden-toggle]"),horizontalOverflow:document.documentElement.scrollWidth>innerWidth})');
 if(detail.links||detail.copy||detail.horizontalOverflow||!detail.tileHidden)throw Error(JSON.stringify(detail));
 const shot=await call('Page.captureScreenshot',{format:'png'});await fs.writeFile(work+'card-post-detail.png',Buffer.from(shot.data,'base64'));
 await call('Emulation.setDeviceMetricsOverride',{width:390,height:844,deviceScaleFactor:1,mobile:true});
 await call('Page.navigate',{url:'http://127.0.0.1:19460/card-link-check/'});
 await wait('document.querySelectorAll(".hscard-card-link").length===2');
 const mobile=await evaluate('(()=>{const a=document.querySelector(".hscard-card-link");a.scrollIntoView({block:"center"});const r=a.getBoundingClientRect();return {url:a.href,x:r.left+r.width/2,y:r.top+r.height/2,width:r.width,height:r.height};})()');
 if(mobile.width<=0||mobile.height<=0)throw Error('Mobile link has no hit target');
 await call('Input.dispatchTouchEvent',{type:'touchStart',touchPoints:[{x:mobile.x,y:mobile.y}]});await call('Input.dispatchTouchEvent',{type:'touchEnd',touchPoints:[]});
 await wait('location.href==='+JSON.stringify(mobile.url)+'&&!!document.querySelector(".hscard-single-card")');
 if(errors.length)throw Error(JSON.stringify(errors));
 if(inline&&cardRequests.length)throw Error('HTML cache missed card requests: '+JSON.stringify(cardRequests));
 console.log(JSON.stringify({ok:true,desktopClick:true,mobileTap:true,parentsOnly:true,frameAnchorUnchanged:true,detail,exceptions:errors.length,initialCardApiRequests:inline?cardRequests.length:null}));
}finally{ws?.close();chrome.kill();}
