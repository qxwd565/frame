import {resourceURL, resourceFetch} from './resource-url.mjs?ver=hscard-f182721a261a42e5';
import {loadShaderIndex} from './wgsl-programs.mjs?ver=hscard-f182721a261a42e5';
/*
 * EXPERIMENTAL: WebGPU-only migration, not production validated.
 * A single WebGPU device supplies every desktop card in the article.
 * DOM placeholders anchor full WebGPU card scenes (including quantity ribbons).
 * The WebGPU canvas stays viewport-fixed, but follows those DOM anchors while
 * long asynchronous card renders are in progress; a separate, cheap present
 * pass recomputes exact positions whenever the renderer becomes idle.
 */
import {HSPlusSources} from './hsplus-sources.mjs?ver=hscard-f182721a261a42e5';
import {FrameComposer} from './frame-composition.mjs?ver=hscard-f182721a261a42e5';
import {NativeDrawBuilder} from './native-draw-builder.mjs?ver=hscard-f182721a261a42e5';
import {WebGPUNativeRenderer} from './webgpu-native.mjs?ver=hscard-f182721a261a42e5';
import {WebGPUCardRenderer} from './webgpu-card-renderer.mjs?ver=hscard-f182721a261a42e5';
import {createFontRasterizer} from './font-raster.mjs?ver=hscard-f182721a261a42e5';
import {resolveCard} from './card-data.mjs?ver=hscard-f182721a261a42e5';
import {startDeckHydration} from './deck-hydration.mjs?ver=hscard-f182721a261a42e5';
import {WebGPUMultiCardSurface} from './webgpu-multi-card-surface.mjs?ver=hscard-f182721a261a42e5';
import {trimCardCache} from './card-render-cache.mjs?ver=hscard-f182721a261a42e5';
const desktop=matchMedia('(min-width:821px)'),reduced=matchMedia('(prefers-reduced-motion:reduce)'),items=new Map(),OVERSCAN=160;
let runtime,ready,frame=0,layoutFrame=0,running=false,pending=false,layoutDirty=true,observer,resizeObserver,sequence=0,epoch=0,visibilitySequence=0,paintedAnchor=null,hovered=null;
let deviceRecovery=null,deviceRecoveries=0,closing=false;
const frameQueue=[];let frameLoads=0;
function releaseFrame(item){
 const job=item.request?.frameJob;if(!job)return;
 job.cancelled=true;if(job.prepared){job.cards.releasePrepared(job.prepared);job.prepared=null;}
 item.request.frameJob=null;
}
function prepareFrame(item,r,version){
 const request=item.request;if(item.preparedVersion>=0||!request?.metadata||request.frameJob)return;
 const job={cards:r.surface.cards,cancelled:false,status:'pending',prepared:null,error:null};request.frameJob=job;
 const current=()=>!job.cancelled&&!closing&&epoch===version&&item.request===request&&item.version===request.version&&item.visible&&item.element.isConnected&&desktop.matches;
 frameQueue.push(async()=>{
  try{
   if(!current())return;
   const prepared=await job.cards.prepareFrame(request.metadata,current);
   if(!current()){if(prepared)job.cards.releasePrepared(prepared);return;}
   job.prepared=prepared;job.status='ready';
  }catch(error){if(current()){job.error=error;job.status='error';}}
  finally{if(!current()&&request.frameJob===job)request.frameJob=null;if(current())schedule();}
 });
 pumpFrames();
}
function pumpFrames(){
 while(frameLoads<4&&frameQueue.length){const task=frameQueue.shift();frameLoads++;task().finally(()=>{frameLoads--;pumpFrames();});}
}
async function bytes(name,priority='high'){
 const url=resourceURL(name);
 // The old frame manifest shared this pathname; do not let a stale 31 MB
 // browser/CDN cache hide the new on-demand texture layout on upgrade.
 if(name==='frames-constructed.json.gz')url.searchParams.set('rev','7.12.07');
 const r=await resourceFetch(url,{credentials:'same-origin',priority});
 if(!r.ok)throw Error('Card resource HTTP '+r.status+': '+url.href);
 return new Uint8Array(await r.arrayBuffer());
}
async function json(name,priority){return new Response(new Blob([await bytes(name,priority)]).stream().pipeThrough(new DecompressionStream('gzip'))).json();}
async function engine(){
 if(runtime)return runtime;
 let canvas,rendererReady;
 runtime=(async()=>{
  canvas=document.createElement('canvas');canvas.className='hscard-page-canvas';canvas.setAttribute('aria-hidden','true');document.body.appendChild(canvas);
  const sourceReady=Promise.all([bytes('frames-constructed.json.gz'),bytes('text-settings.json.gz')]).then(([frames,settings])=>HSPlusSources.load(frames,settings));
  rendererReady=WebGPUNativeRenderer.create(canvas,loadShaderIndex(),sourceReady);
  const [source,portraits,fits,watermarks,library,renderer]=await Promise.all([sourceReady,json('portrait-meshes.json.gz'),json('frame-fits.json.gz'),json('watermarks.json.gz'),json('shader-library.json.gz'),rendererReady]);
  const composer=new FrameComposer(source,portraits,fits,library,watermarks),cache=new Map();
  // Decode many frame pieces concurrently, but cap downloads/decompression
  // so the first cards are not blocked by a sudden 100+ request burst.
  const textureQueue=[];let textureActive=0;
  function limitedTexture(task){return new Promise((resolve,reject)=>{
   textureQueue.push({task,resolve,reject});
   const pump=()=>{while(textureActive<8&&textureQueue.length){
    const next=textureQueue.shift();textureActive++;
    Promise.resolve().then(next.task).then(next.resolve,next.reject).finally(()=>{textureActive--;pump();});
   }};
   pump();
  });}
  async function resolveTexture(t){
   if(t.pixels)return t.pixels;
   const key=t.key||'embedded:'+t.embedded;
   // Cache the pending load *before* awaiting it. Multiple cards can request
   // the same frame texture concurrently, but only one fetch/decode is needed.
   if(!cache.has(key)){
    const task=(async()=>{
     if(t.key)return limitedTexture(()=>source.texture(t.key));
     const w=watermarks.entries[t.embedded],raw=Uint8Array.from(atob(w.data),c=>c.charCodeAt(0));
     return {width:w.width,height:w.height,format:28,levels:[raw]};
    })().catch(error=>{cache.delete(key);throw error;});
    cache.set(key,task);
   }
   return cache.get(key);
  }
  const builder=new NativeDrawBuilder(library,source.frames.pipelineKeywords,resolveTexture),cards=new WebGPUCardRenderer({sources:source,composer,builder,renderer,raster:null,nameMeshes:null}),surface=await WebGPUMultiCardSurface.create(renderer,cards);
  const result={canvas,renderer,surface,textReady:null,textResult:null,startText};
  function startText(){
   if(result.textReady)return result.textReady;
   // Only after the first real frame is visible: fonts/name geometry cannot
   // delay that frame or compete with its critical downloads at startup.
   result.textReady=Promise.all([bytes('freetype-bridge.wasm','low'),bytes('original-fonts.json.gz','low'),json('name-meshes.json.gz','low')]).then(async([wasm,fonts,names])=>{
    cards.nameMeshes=names;cards.raster=await createFontRasterizer(wasm,fonts,source.text.fonts);return{};
   }).catch(error=>({error}));
   result.textReady.then(value=>{result.textResult=value;if(ready===result&&!closing)schedule();});
   return result.textReady;
  }
  renderer.device.lost.then(info=>{
   if(closing||ready?.renderer!==renderer)return;
   if(deviceRecoveries++>=1){for(const item of items.values())fail(item,new Error('WebGPU device lost: '+info.message));return;}
   epoch++;deviceRecovery=()=>{surface.dispose();renderer.dispose();result.textReady?.then(()=>cards.raster?.dispose());canvas.remove();};
   if(!running)recoverDevice();
  });
  if(closing){surface.dispose();throw Error('Card renderer closed during startup');}
  ready=result;return ready;
 })().catch(error=>{rendererReady?.then(renderer=>{renderer.dispose();renderer.device.destroy();},()=>{});canvas?.remove();runtime=null;ready=null;throw error;});return runtime;
}
function recoverDevice(){
 if(!deviceRecovery)return;deviceRecovery();deviceRecovery=null;runtime=null;ready=null;paintedAnchor=null;layoutDirty=true;
 for(const item of items.values()){releaseFrame(item);item.version++;item.preparedVersion=-1;item.request=null;item.dirty=true;resetFrame(item);}
 schedule();
}
// Failures must not be hidden behind one indistinguishable error for every
// card. Retain WebGPU-only rendering; expose the actual failed stage to the
// browser console and DOM for support instead of substituting a still image.
const reportedErrors=new Set();
function failureKind(error){
 const message=String(error?.message||error||'Unknown HScard error');
 if(/Card source not registered|Missing or invalid dates-v1 card URL|Invalid card URL or date/i.test(message))return ['CARD_SOURCE','카드 API 주소 없음'];
 if(/Card resource HTTP|WGSL index HTTP|WGSL program HTTP/i.test(message))return ['RESOURCE_HTTP','카드 리소스 요청 실패'];
 if(/Card dates-v1 HTTP|Artwork.*HTTP|Failed to fetch|fetch failed|NetworkError|CORS/i.test(message))return ['CARD_HTTP','카드 파일 요청 실패'];
 if(/Unsupported legacy card JSON|date-keyed card records|First dated record|Invalid dated card/i.test(message))return ['CARD_SCHEMA','카드 JSON 형식 오류'];
 if(/not released/i.test(message))return ['CARD_NOT_RELEASED','출시 전 카드'];
 if(/WGSL|Shader.*compil|shader.*pipeline|createRenderPipeline|Missing source WGSL/i.test(message))return ['WEBGPU_SHADER','WebGPU 셰이더 오류'];
 if(/WebGPU|GPU device|GPU adapter|navigator\.gpu|depth-clip-control/i.test(message))return ['WEBGPU_RUNTIME','WebGPU 실행 오류'];
 if(/Artwork|ImageBitmap|artPixels|Portrait/i.test(message))return ['CARD_ART','카드 원화 오류'];
 if(/freetype|font|text.*raster|glyph/i.test(message))return ['CARD_FONT','카드 글꼴 오류'];
 return ['HSCARD_ERROR','카드 표시 오류'];
}
function fail(item,error){
 const message=String(error?.message||error),[code,label]=failureKind(error);
 item.failed=true;
 const placeholder=item.element.querySelector('.hscard-card-placeholder');
 if(placeholder){placeholder.setAttribute('aria-busy','false');placeholder.dataset.hscardErrorLabel=label;placeholder.title=message;}
 // Keep a limited in-page diagnostic log for difficult WebGPU shader failures.
 (window.__hscardRenderErrors??=[]).push({code,message,card:item.key,when:new Date().toISOString()});
 if(window.__hscardRenderErrors.length>20)window.__hscardRenderErrors.shift();
 item.element.dataset.hscardErrorCode=code;
 item.element.classList.remove('is-native-ready');item.element.classList.add('is-native-failed');
 const fingerprint=code+'|'+message;
 if(!reportedErrors.has(fingerprint)){reportedErrors.add(fingerprint);console.error('[HScard '+code+'] '+message,error);}
 item.element.dispatchEvent(new CustomEvent('hscard-render-error',{bubbles:true,detail:{id:item.key,code,message}}));
}

function resetFrame(item){
 item.loadingFrame=false;item.failed=false;
 item.element.classList.remove('is-native-ready','is-loading-frame','is-native-failed');
 delete item.element.dataset.hscardErrorCode;
 const placeholder=item.element.querySelector('.hscard-card-placeholder');
 if(placeholder){placeholder.setAttribute('aria-busy','true');delete placeholder.dataset.hscardErrorLabel;placeholder.removeAttribute('title');}
}
function schedule(){if(running){pending=true;return;}if(!frame&&desktop.matches&&!document.hidden)frame=requestAnimationFrame(tick);}
// Network/decoder work is independent of GPU work. Never await the slowest
// card's API or portrait inside the render loop, even on the first frame.
function requestCard(item){
 if(item.element.classList.contains('is-frame-unavailable'))return null;
 if(item.request?.version===item.version)return item.request;
 releaseFrame(item);
 const version=item.version;
 const request={version,status:'pending',metadata:null,card:null,error:null};item.request=request;
 const isCurrent=()=>item.version===version&&item.element.isConnected&&desktop.matches;
 Promise.resolve().then(()=>resolveCard(item.element,item.golden,{isCurrent,onMetadata:card=>{
  if(item.request===request&&isCurrent()){request.metadata=card;schedule();}
 }})).then(card=>{
  if(item.request!==request||!isCurrent())return;
  request.card=card;request.status='ready';schedule();
 },error=>{
  if(item.request!==request||!isCurrent())return;
  request.error=error;request.status='error';schedule();
 });
 return request;
}
function needsFrame(item){
 if(!item.visible||item.failed||!item.element.isConnected||item.element.classList.contains('is-frame-unavailable'))return false;
 const stale=item.preparedVersion!==item.version||item.loadingFrame;
 if(stale){
  const request=item.request;
  if(request?.version!==item.version)return false;
  if(item.preparedVersion<0)return !!request.metadata&&(!request.frameJob||request.frameJob.status!=='pending')||!!request.error&&!request.metadata;
  if(request.error||request.status==='ready'&&ready?.textResult)return true;
  return item.preparedVersion>=0&&!!((item.animated||item.summoning)&&item.onScreen&&!reduced.matches);
 }
 return !!item.dirty||!!((item.animated||item.summoning)&&item.onScreen&&!reduced.matches);
}
function cardClip(element){let r={x:-OVERSCAN,y:-OVERSCAN,width:innerWidth+2*OVERSCAN,height:innerHeight+2*OVERSCAN};for(let p=element.parentElement;p;p=p.parentElement){const s=getComputedStyle(p);if(!/(hidden|clip|scroll|auto)/.test(s.overflowX+' '+s.overflowY))continue;const b=p.getBoundingClientRect(),x=Math.max(r.x,b.left),y=Math.max(r.y,b.top),right=Math.min(r.x+r.width,b.right),bottom=Math.min(r.y+r.height,b.bottom);r={x,y,width:Math.max(0,right-x),height:Math.max(0,bottom-y)};}return r;}
/** Follow the real HTML position without waiting for expensive WebGPU rendering. */
function followAnchor(){
 if(!ready)return;
 if(!paintedAnchor||!paintedAnchor.element.isConnected){ready.canvas.style.transform='';return;}
 const box=paintedAnchor.element.getBoundingClientRect();
 const dx=box.left-paintedAnchor.left,dy=box.top-paintedAnchor.top;
 ready.canvas.style.transform=Number.isFinite(dx)&&Number.isFinite(dy)&&(dx||dy)?`translate3d(${dx}px, ${dy}px, 0)`:'';
}
/** Project existing textures independently of async texture/frame regeneration. */
function presentCards(r){
 if(!desktop.matches||document.hidden)return;
 const scale=devicePixelRatio||1,places=[],shown=[];let anchor=null;
 for(const item of items.values()){
  if(!item.element.isConnected||item.preparedVersion<0||!r.surface.items.has(item.key))continue;
  const element=item.element.querySelector('.hscard-card-placeholder'),box=element?.getBoundingClientRect();
  if(!box||box.width<=0||box.height<=0||box.right< -OVERSCAN||box.bottom< -OVERSCAN||box.left>innerWidth+OVERSCAN||box.top>innerHeight+OVERSCAN)continue;
  const clip=cardClip(item.element);if(!clip.width||!clip.height)continue;
  places.push({key:item.key,x:(box.left+OVERSCAN)*scale,y:(box.top+OVERSCAN)*scale,width:box.width*scale,height:box.height*scale,clip:{x:(clip.x+OVERSCAN)*scale,y:(clip.y+OVERSCAN)*scale,width:clip.width*scale,height:clip.height*scale}});
  shown.push(item);
  if(!anchor)anchor={element,left:box.left,top:box.top};
 }
 let overlay=null;
 if(hovered&&shown.includes(hovered)){
  const box=hovered.element.getBoundingClientRect(),w=Math.min(240,innerWidth-16,(innerHeight-16)*436/682),h=w*682/436;
  if(w>0){const right=box.right+8,left=box.left-w-8,x=right+w<=innerWidth-8?right:left>=8?left:Math.max(8,Math.min(innerWidth-w-8,right)),y=Math.max(8,Math.min(innerHeight-h-8,box.top+(box.height-h)/2));overlay={key:hovered.key,x:(x+OVERSCAN)*scale,y:(y+OVERSCAN)*scale,width:w*scale,height:h*scale};}
 }
 r.surface.present(Math.max(1,Math.round((innerWidth+2*OVERSCAN)*scale)),Math.max(1,Math.round((innerHeight+2*OVERSCAN)*scale)),places,overlay);
 for(const item of shown){item.element.classList.add('is-native-ready');item.element.classList.toggle('is-loading-frame',!!item.loadingFrame);item.element.querySelector('.hscard-card-placeholder')?.setAttribute('aria-busy',item.loadingFrame?'true':'false');}
 paintedAnchor=anchor;layoutDirty=false;r.canvas.style.transform='';
}
/** Scroll/resize/layout updates cannot be blocked behind async card rendering. */
function scheduleLayout(){
 for(const item of items.values()){const b=item.element.getBoundingClientRect();const onScreen=b.bottom>0&&b.top<innerHeight&&b.right>0&&b.left<innerWidth;if(onScreen!==item.onScreen)item.animationClock=null;item.onScreen=onScreen;}
 layoutDirty=true;followAnchor();
 if(!desktop.matches||document.hidden)return;
 if(ready&&!running&&!layoutFrame){layoutFrame=requestAnimationFrame(()=>{layoutFrame=0;if(running||!layoutDirty||!desktop.matches||document.hidden)return;try{presentCards(ready);}catch(error){for(const item of items.values())if(item.visible&&!item.failed)fail(item,error);}});}
 // Ordinary scroll changes only the projection of prepared card textures.
 // Scheduling another frame shader pass would be wasted GPU work.
 if(!ready||[...items.values()].some(needsFrame))schedule();
}
async function tick(){
 frame=0;if(running||!desktop.matches||document.hidden)return;running=true;pending=false;const version=epoch;
 try{
  if(ready&&layoutDirty)presentCards(ready);const visible=[...items.values()].filter(x=>x.visible&&!x.failed&&x.element.isConnected&&!x.element.classList.contains('is-frame-unavailable'));
  // First complete cards actually inside the viewport. IntersectionObserver's
  // overscan must not make an offscreen card block the first visible row.
  const outsideDistance=item=>{const b=item.element.getBoundingClientRect();return b.bottom<0?-b.bottom:b.top>innerHeight?b.top-innerHeight:0;};
  visible.sort((a,b)=>outsideDistance(a)-outsideDistance(b));
  if(!visible.length){if(ready){ready.surface.trimPreviews(null);trimCardCache(ready.surface,items);presentCards(ready);}return;}
  // Start the visible card requests in viewport order, and keep their
  // results across rAF ticks. A slow A cannot block ready B/C or golden FPS.
  for(const item of visible)if(item.preparedVersion!==item.version||item.loadingFrame)requestCard(item);
  const r=await engine();if(version!==epoch||!desktop.matches)return;
  r.surface.trimPreviews(hovered?.key);
  trimCardCache(r.surface,items);
  for(const item of visible)prepareFrame(item,r,version);
  // Publish every available visible frame before doing any text rasterization
  // or portrait fill. A fully ready first card must not hold up the next frame.
  for(const phase of ['frame','content'])for(const item of visible){if(version!==epoch||!desktop.matches)return;if(!item.visible||item.failed||!item.element.isConnected)continue;
   if(phase==='frame'&&item.preparedVersion>=0||phase==='content'&&item.preparedVersion<0)continue;
   let newlyPrepared=false,candidateKey=null,candidateVersion=null;
   try{if(item.preparedVersion!==item.version||item.loadingFrame){
     const result=item.request;
     if(!result||result.version!==item.version)continue;
     const itemVersion=result.version;candidateVersion=itemVersion;
     const isCurrent=()=>version===epoch&&item.version===itemVersion&&item.visible&&item.element.isConnected&&desktop.matches;
     if(!isCurrent())continue;
     // Display the actual frame without waiting for artwork or FreeType.
     // An already completed normal/golden card stays visible during a toggle.
     if(item.preparedVersion<0&&result.metadata){
      const job=result.frameJob;
      if(!job||job.status==='pending')continue;
      if(job.error)throw job.error;
      if(!job.prepared)continue;
      candidateKey=item.key;
      const prepared=job.prepared;job.prepared=null;result.frameJob=null;
      r.surface.attach(candidateKey,prepared);
      await r.surface.update(candidateKey,reduced.matches?1:0);
      if(!isCurrent()){r.surface.remove(candidateKey);candidateKey=null;continue;}
      candidateKey=null;item.preparedVersion=itemVersion;item.loadingFrame=true;
      item.animationTime=0;item.animationClock=null;item.dirty=false;newlyPrepared=true;
      item.element.dataset.hscardDisplayGolden=String(result.metadata.golden);
      item.animated=!!r.surface.items.get(item.key)?.prepared.animated;
      presentCards(r);
      r.startText();
     }
     if(result.error)throw result.error;
     if(phase==='frame')continue;
     if(result.status==='ready'&&r.textResult){
      if(r.textResult.error)throw r.textResult.error;
      if(item.loadingFrame&&item.preparedVersion===itemVersion){
       if(!await r.surface.fill(item.key,result.card,{time:reduced.matches?1:item.animationTime,isCurrent}))continue;
      }else{
       candidateKey=item.key+'::pending::'+itemVersion;
       await r.surface.prepare(candidateKey,result.card);
       if(!isCurrent()){r.surface.remove(candidateKey);candidateKey=null;continue;}
       await r.surface.update(candidateKey,reduced.matches?1:0);
       if(!isCurrent()){r.surface.remove(candidateKey);candidateKey=null;continue;}
       r.surface.adopt(candidateKey,item.key);candidateKey=null;
       item.animationTime=0;item.animationClock=null;
      }
      item.preparedVersion=itemVersion;item.loadingFrame=false;item.element.dataset.hscardDisplayGolden=String(result.card.golden);newlyPrepared=true;
      item.animated=!!r.surface.items.get(item.key)?.prepared.animated;
      item.dirty=false;layoutDirty=true;
     }
     if(item.preparedVersion<0)continue;
    }
    // Replay original time-dependent effects on both normal and golden cards.
    // Static programs and offscreen cards do not keep an animation loop alive.
    if(item.dirty||((item.animated||item.summoning)&&item.onScreen&&!reduced.matches)){
     // rAF's timestamp predates async artwork/font/pipeline preparation.
     // Sample after those awaits so loading time cannot become a speed jump.
     const clock=performance.now()/1000;
     if(item.onScreen&&!reduced.matches&&item.animationClock!=null)item.animationTime+=Math.max(0,clock-item.animationClock);
     item.animationClock=item.onScreen&&!reduced.matches?clock:null;
     await r.surface.update(item.key,reduced.matches?1:item.animationTime);
     item.summoning=r.surface.hasActiveSummon(item.key);
     item.dirty=false;
    }
    if(item===hovered&&(newlyPrepared||item.previewDirty||(item.animated&&item.onScreen&&!reduced.matches))){
     await r.surface.updatePreview(item.key,reduced.matches?1:item.animationTime);
     item.previewDirty=false;layoutDirty=true;
    }
    // Publish each newly completed card while later API/artwork loads wait.
    // All awaits for this card have completed, so the framebuffer is idle.
    if(newlyPrepared&&version===epoch&&item.preparedVersion===item.version&&desktop.matches)presentCards(r);
    // Never call surface.present() during async WebGPU rendering: it would change
    // the framebuffer and scissor state while the card shader pass is awaiting
    // geometry/texture assets. The canvas transform handles scrolling until
    // the current batch finishes.
   }catch(error){
    if(candidateKey)r.surface.remove(candidateKey);
    if(version!==epoch||candidateVersion!==null&&candidateVersion!==item.version||!item.visible||!item.element.isConnected||!desktop.matches)continue;
    if(item.preparedVersion>=0&&r.surface.items.has(item.key)){item.failed=true;item.dirty=false;item.loadingFrame=false;const box=item.element.querySelector('.hscard-card-placeholder');if(box){box.setAttribute('aria-busy','false');box.title=String(error?.message||error);}item.element.dispatchEvent(new CustomEvent('hscard-render-error',{bubbles:true,detail:{id:item.key,message:String(error?.message||error)}}));}
    else{r.surface.remove(item.key);fail(item,error);}
   }
  }
  if(version===epoch&&desktop.matches){trimCardCache(r.surface,items);presentCards(r);}
 }catch(error){if(version===epoch)for(const item of items.values())if(item.visible&&!item.failed)fail(item,error);}finally{
  running=false;
  if(deviceRecovery)recoverDevice();
  if(!desktop.matches&&ready)deactivateCanvas();
  // No perpetual rAF loop when the visible deck contains only static cards.
  // Pending fetches schedule their own follow-up when they finish. No busy
  // rAF polling loop during a network stall.
  if(pending||[...items.values()].some(needsFrame))schedule();
 }
}
let scanFrame=0;
function queueScan(){
 if(!desktop.matches||scanFrame)return;
 scanFrame=requestAnimationFrame(()=>{scanFrame=0;scan();});
}
function scan(){
 if(!desktop.matches)return;
 // Cached pre-upgrade HTML can still reference deleted preview files (404).
 // New PHP emits no image; remove stale nodes instead of retrying those URLs.
 for(const image of document.querySelectorAll('.hscard-frame-preview'))image.remove();
 for(const button of document.querySelectorAll('[data-hscard-golden-toggle]'))button.hidden=false;
 for(const element of document.querySelectorAll('[data-hscard-card]')){
  if(items.has(element))continue;
  const item={element,key:'card-'+(++sequence),version:0,preparedVersion:-1,golden:element.closest('.hscard-deck-list')?.querySelector('[data-hscard-golden-toggle]')?.getAttribute('aria-pressed')==='true',dirty:true,visible:false,failed:false};
  items.set(element,item);element.dataset.hscardDisplayGolden=String(item.golden);resetFrame(item);observer.observe(element);
  const box=element.querySelector('.hscard-card-placeholder');if(box)resizeObserver.observe(box);
 }
 for(const [el,item] of items)if(!el.isConnected){
  observer.unobserve(el);
  const box=el.querySelector('.hscard-card-placeholder');if(box)resizeObserver.unobserve(box);
  releaseFrame(item);items.delete(el);if(ready)ready.surface.remove(item.key);
 }
 scheduleLayout();
}
let hydrated = false;
function start(){
 if(!hydrated){hydrated = true;startDeckHydration();}
 if(!observer){
  observer=new IntersectionObserver(entries=>{
   for(const entry of entries){
    const item=items.get(entry.target);if(!item)continue;
    item.visible=entry.isIntersecting;
    if(item.visible){item.lastVisible=++visibilitySequence;if(item.preparedVersion<0)resetFrame(item);}else releaseFrame(item);
   }
   scheduleLayout();schedule();
  },{rootMargin:OVERSCAN+'px'});
  resizeObserver=new ResizeObserver(scheduleLayout);
  new MutationObserver(records=>{
   // Ignore unrelated WordPress DOM mutations; only card insertions/removals
   // need a fresh full-document query and observer registration.
   const containsCard=node=>node.nodeType===1&&(node.matches?.('[data-hscard-card]')||node.querySelector?.('[data-hscard-card]'));
   if(records.some(r=>[...r.addedNodes,...r.removedNodes].some(containsCard)))queueScan();
  }).observe(document.body,{childList:true,subtree:true});
  if(document.fonts)document.fonts.ready.then(scheduleLayout).catch(()=>{});
 }
 scan();
 // Begin fetching the renderer's common resources without waiting for the
 // IntersectionObserver callback/rAF. Native canvas still stays the renderer.
 if(desktop.matches&&items.size&&!document.hidden)engine().catch(()=>{/* tick reports renderer failure */});
}
function deactivateCanvas(){
 paintedAnchor=null;layoutDirty=true;
 if(!ready)return;
 ready.canvas.style.transform='';
 try{ready.surface.present(1,1,[]);}catch(error){/* WebGPU device can be unavailable during a breakpoint change. */}
 for(const item of items.values()){
  ready.surface.remove(item.key);item.preparedVersion=-1;resetFrame(item);
  item.element.classList.remove('is-native-ready');
 }
}
document.addEventListener('click',event=>{const button=event.target.closest?.('[data-hscard-golden-toggle]');if(!button||!desktop.matches)return;const section=button.closest('.hscard-deck-list');if(!section)return;const golden=button.getAttribute('aria-pressed')!=='true';button.setAttribute('aria-pressed',String(golden));for(const item of items.values())if(section.contains(item.element)){item.golden=golden;item.version++;item.dirty=true;item.failed=false;item.element.classList.remove('is-native-failed');if(item.preparedVersion<0){item.element.dataset.hscardDisplayGolden=String(item.golden);resetFrame(item);}}schedule();});
// A real summon source may dispatch this event on a rendered card. Merely
// opening a collection card never starts a game action or particle burst.
document.addEventListener('hscard-summon',event=>{
 const element=event.target.closest?.('[data-hscard-card]'),item=items.get(element);
 if(!item||!ready||item.preparedVersion!==item.version||!item.onScreen||reduced.matches)return;
 const version=item.version;
 ready.surface.startOriginal3664Summon(item.key,undefined,()=>item.version===version&&item.element.isConnected).then(started=>{
  if(started&&item.version===version&&item.element.isConnected){item.summoning=true;item.dirty=true;schedule();}
 }).catch(error=>item.element.dispatchEvent(new CustomEvent('hscard-summon-error',{bubbles:true,detail:{message:String(error?.message||error)}})));
});
document.addEventListener('pointermove',event=>{
 if(event.pointerType!=='mouse'||!desktop.matches)return;
 const target=event.target.closest?.('[data-hscard-card]')||event.target.closest?.('.hscard-deck-card')?.querySelector('[data-hscard-card]');
 const next=items.get(target)||null;if(next!==hovered){hovered=next;if(next)next.previewDirty=true;schedule();scheduleLayout();}
},{passive:true});
document.addEventListener('pointerout',event=>{if(!event.relatedTarget&&hovered){hovered=null;schedule();scheduleLayout();}});
window.addEventListener('scroll',()=>{if(hovered){hovered=null;schedule();}scheduleLayout();},{passive:true});
document.addEventListener('scroll',()=>{if(hovered){hovered=null;schedule();}scheduleLayout();},{capture:true,passive:true});
window.addEventListener('resize',scheduleLayout,{passive:true});
window.visualViewport?.addEventListener('resize',scheduleLayout,{passive:true});
window.visualViewport?.addEventListener('scroll',scheduleLayout,{passive:true});
window.addEventListener('load',scheduleLayout,{once:true});
document.addEventListener('visibilitychange',()=>{for(const item of items.values())item.animationClock=null;if(!document.hidden)scheduleLayout();});
desktop.addEventListener('change',()=>{
 epoch++;
 if(desktop.matches)start();
 else{
  for(const item of items.values())releaseFrame(item);
  hovered=null;
  cancelAnimationFrame(frame);cancelAnimationFrame(layoutFrame);cancelAnimationFrame(scanFrame);
  frame=0;layoutFrame=0;scanFrame=0;
  if(!running)deactivateCanvas();
 }
});
reduced.addEventListener('change',()=>{for(const item of items.values())item.dirty=true;schedule();});
// Date changes invalidate prepared GPU cards, not the shared raw JSON cache.
document.addEventListener('hscard-snapshot-ready',()=>{schedule();scheduleLayout();});
document.addEventListener('hscard-date-change',event=>{
 const deck=event.detail?.deck;if(!deck)return;
 for(const item of items.values())if(deck.contains(item.element)){
  releaseFrame(item);item.version++;item.preparedVersion=-1;item.dirty=true;item.failed=false;item.request=null;
  ready?.surface.remove(item.key);resetFrame(item);
 }
 schedule();scheduleLayout();
});
if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',start,{once:true});else start();
window.addEventListener('pagehide',event=>{if(event.persisted)return;closing=true;epoch++;for(const item of items.values())releaseFrame(item);if(ready){const r=ready;r.surface.dispose();r.renderer.dispose();r.renderer.device.destroy();r.textReady?.then(()=>r.surface.cards.raster?.dispose());}});
