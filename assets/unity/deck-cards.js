/*
 * A single WebGL2 context supplies every desktop card in the article.
 * DOM placeholders anchor complete WebGL card scenes (including quantity ribbons).
 * The WebGL canvas stays viewport-fixed, but follows those DOM anchors while
 * long asynchronous card renders are in progress; a separate, cheap present
 * pass recomputes exact positions whenever the renderer becomes idle.
 */
import {HSPlusSources} from './hsplus-sources.mjs?ver=hsplus-cards-10';
import {FrameComposer} from './frame-composition.mjs?ver=golden-api-1';
import {NativeDrawBuilder} from './native-draw-builder.mjs?ver=legacy-golden-history-1';
import {WebGLNativeRenderer} from './webgl-native.mjs?ver=legacy-golden-history-1';
import {CardRenderer} from './card-renderer.mjs?ver=legacy-golden-history-1';
import {createFontRasterizer} from './font-raster.mjs?ver=beta-3664-1';
import {resolveCard} from './card-data.mjs?ver=legacy-golden-history-1';
import {MultiCardSurface} from './multi-card-surface.mjs?ver=loading-1';
import {trimCardCache} from './card-render-cache.mjs?ver=cache-1';
const desktop=matchMedia('(min-width:821px)'),reduced=matchMedia('(prefers-reduced-motion:reduce)'),base=new URL('./',import.meta.url),items=new Map(),OVERSCAN=160;
let runtime,ready,frame=0,layoutFrame=0,running=false,pending=false,layoutDirty=true,observer,resizeObserver,sequence=0,epoch=0,visibilitySequence=0,paintedAnchor=null,hovered=null;
async function bytes(name){
 const url=new URL(name,base);
 // The old frame manifest shared this pathname; do not let a stale 31 MB
 // browser/CDN cache hide the new on-demand texture layout on upgrade.
 if(name==='frames-constructed.json.gz')url.searchParams.set('rev','7.12.07');
 const r=await fetch(url,{credentials:'same-origin'});
 if(!r.ok)throw Error('Card data '+r.status);
 return new Uint8Array(await r.arrayBuffer());
}
async function json(name){return new Response(new Blob([await bytes(name)]).stream().pipeThrough(new DecompressionStream('gzip'))).json();}
async function engine(){
 if(runtime)return runtime;
 let canvas;
 runtime=(async()=>{
  // Font decoding and verification can take much longer than the frame.
  // Start it in parallel, but do not block the first native frame on it.
  const fontFiles=Promise.all([bytes('freetype-bridge.wasm'),bytes('original-fonts.json.gz')]).then(value=>({value}),error=>({error}));
  const [frames,settings,portraits,fits,watermarks,library,programs,names]=await Promise.all([bytes('frames-constructed.json.gz'),bytes('text-settings.json.gz'),json('portrait-meshes.json.gz'),json('frame-fits.json.gz'),json('watermarks.json.gz'),json('shader-library.json.gz'),json('shader-programs.json.gz'),json('name-meshes.json.gz')]);
  const source=await HSPlusSources.load(frames,settings),composer=new FrameComposer(source,portraits,fits,library,watermarks),cache=new Map();
  async function resolveTexture(t){
   if(t.pixels)return t.pixels;
   const key=t.key||'embedded:'+t.embedded;
   // Cache the pending load *before* awaiting it. Multiple cards can request
   // the same frame texture concurrently, but only one fetch/decode is needed.
   if(!cache.has(key)){
    const task=(async()=>{
     if(t.key)return source.texture(t.key);
     const w=watermarks.entries[t.embedded],raw=Uint8Array.from(atob(w.data),c=>c.charCodeAt(0));
     return {width:w.width,height:w.height,format:28,levels:[raw]};
    })().catch(error=>{cache.delete(key);throw error;});
    cache.set(key,task);
   }
   return cache.get(key);
  }
  canvas=document.createElement('canvas');canvas.className='hscard-page-canvas';canvas.setAttribute('aria-hidden','true');document.body.appendChild(canvas);
  const renderer=new WebGLNativeRenderer(canvas,programs,source),builder=new NativeDrawBuilder(library,source.frames.pipelineKeywords,resolveTexture),cards=new CardRenderer({sources:source,composer,builder,renderer,raster:null,nameMeshes:names}),surface=new MultiCardSurface(renderer,cards);
  const textReady=fontFiles.then(async result=>{if(result.error)return result;try{cards.raster=await createFontRasterizer(result.value[0],result.value[1],source.text.fonts);return {};}catch(error){return {error};}});
  canvas.addEventListener('webglcontextlost',e=>{e.preventDefault();for(const item of items.values())fail(item,new Error('WebGL context lost'));});
  ready={canvas,renderer,surface,textReady};return ready;
 })().catch(error=>{canvas?.remove();runtime=null;ready=null;throw error;});return runtime;
}
function fail(item,error){item.failed=true;item.element.querySelector('.hscard-card-placeholder')?.setAttribute('aria-busy','false');item.element.classList.remove('is-native-ready');item.element.classList.add('is-native-failed');item.element.dispatchEvent(new CustomEvent('hscard-render-error',{bubbles:true,detail:{id:item.key,message:String(error?.message||error)}}));}
function resetFrame(item){item.loadingFrame=false;item.element.classList.remove('is-native-ready','is-loading-frame');item.element.querySelector('.hscard-card-placeholder')?.setAttribute('aria-busy','true');}
function schedule(){if(running){pending=true;return;}if(!frame&&desktop.matches&&!document.hidden)frame=requestAnimationFrame(tick);}
function cardClip(element){let r={x:-OVERSCAN,y:-OVERSCAN,width:innerWidth+2*OVERSCAN,height:innerHeight+2*OVERSCAN};for(let p=element.parentElement;p;p=p.parentElement){const s=getComputedStyle(p);if(!/(hidden|clip|scroll|auto)/.test(s.overflowX+' '+s.overflowY))continue;const b=p.getBoundingClientRect(),x=Math.max(r.x,b.left),y=Math.max(r.y,b.top),right=Math.min(r.x+r.width,b.right),bottom=Math.min(r.y+r.height,b.bottom);r={x,y,width:Math.max(0,right-x),height:Math.max(0,bottom-y)};}return r;}
/** Follow the real HTML position without waiting for expensive WebGL rendering. */
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
 if(!ready||[...items.values()].some(x=>x.visible&&!x.failed&&(x.dirty||x.preparedVersion!==x.version||(x.golden&&x.onScreen&&!reduced.matches))))schedule();
}
async function tick(now){
 frame=0;if(running||!desktop.matches||document.hidden)return;running=true;pending=false;const version=epoch,releaseFrames=[];
 try{
  if(ready&&layoutDirty)presentCards(ready);const visible=[...items.values()].filter(x=>x.visible&&!x.failed&&x.element.isConnected);if(!visible.length){if(ready){ready.surface.trimPreviews(null);trimCardCache(ready.surface,items);presentCards(ready);}return;}
  // Card API and artwork downloads run *in parallel* with the frame/runtime
  // download; previously API lookup waited until the whole 31 MB bundle ended.
  const pendingCards=new Map(),pendingMetadata=new Map();
  for(const item of visible)if(item.preparedVersion!==item.version||item.loadingFrame){
   const itemVersion=item.version;
   const isCurrent=()=>version===epoch&&item.version===itemVersion&&item.visible&&item.element.isConnected&&desktop.matches;
   let release;const frameReady=new Promise(resolve=>{release=resolve;});releaseFrames.push(release);
   const metadata={value:null,release};pendingMetadata.set(item,metadata);
   if(item.preparedVersion>=0)release();
   pendingCards.set(item,resolveCard(item.element,item.golden,{isCurrent,onMetadata:card=>{if(isCurrent())metadata.value=card;},waitForFrame:()=>frameReady}).then(card=>({card,itemVersion}),error=>({error,itemVersion})));
  }
  const r=await engine();if(version!==epoch||!desktop.matches)return;
  r.surface.trimPreviews(hovered?.key);
  trimCardCache(r.surface,items);
  // Build the loading frame with the same composer and historical selection as
  // the finished card. Artwork and card text are the only missing contents.
  for(const item of visible){
   if(item.preparedVersion>=0||!pendingMetadata.has(item))continue;
   const itemVersion=item.version,metadata=pendingMetadata.get(item).value;
   if(!metadata||version!==epoch||item.version!==itemVersion||!item.visible||!item.element.isConnected||!desktop.matches){pendingMetadata.get(item).release();continue;}
   try{
    await r.surface.prepare(item.key,metadata);await r.surface.update(item.key,0);
    if(version!==epoch||item.version!==itemVersion||!item.visible||!item.element.isConnected||!desktop.matches){r.surface.remove(item.key);continue;}
    item.preparedVersion=itemVersion;item.loadingFrame=true;item.element.dataset.hscardDisplayGolden=String(metadata.golden);
    const placeholder=item.element.querySelector('.hscard-card-placeholder'),prepared=r.surface.items.get(item.key)?.prepared;
    if(placeholder&&prepared)placeholder.style.aspectRatio=prepared.context.width+'/'+prepared.context.height;
    item.element.classList.remove('is-frame-unavailable');layoutDirty=true;presentCards(r);
    placeholder?.setAttribute('aria-busy','true');
   }catch(error){r.surface.remove(item.key);item.preparedVersion=-1;item.loadingFrame=false;}
   finally{pendingMetadata.get(item).release();}
  }
  for(const item of visible){if(version!==epoch||!desktop.matches)return;if(!item.visible||item.failed||!item.element.isConnected)continue;
   let newlyPrepared=false,candidateKey=null,candidateVersion=null;
   try{if(item.preparedVersion!==item.version||item.loadingFrame){
     const result=await pendingCards.get(item);if(!result||result.itemVersion!==item.version||version!==epoch||!item.visible||!item.element.isConnected||!desktop.matches)continue;
     const itemVersion=result.itemVersion;candidateVersion=itemVersion;if(result.error)throw result.error;
     const font=await r.textReady;if(font.error)throw font.error;
     if(version!==epoch||item.version!==itemVersion||!item.visible||!item.element.isConnected||!desktop.matches)continue;
     candidateKey=item.preparedVersion<0?item.key:item.key+'::pending::'+itemVersion;
     const loadingFrame=item.loadingFrame&&item.preparedVersion===itemVersion?r.surface.items.get(item.key)?.prepared:null;
     await r.surface.prepare(candidateKey,result.card,loadingFrame);
     if(version!==epoch||item.version!==itemVersion||!item.visible||!item.element.isConnected){r.surface.remove(candidateKey);candidateKey=null;continue;}
     const initialTime=result.card.golden?(reduced.matches?1:0):(reduced.matches?1:now/1000);
     await r.surface.update(candidateKey,initialTime);
     if(version!==epoch||item.version!==itemVersion||!item.visible||!item.element.isConnected){r.surface.remove(candidateKey);candidateKey=null;continue;}
     r.surface.adopt(candidateKey,item.key);candidateKey=null;
     item.preparedVersion=itemVersion;item.loadingFrame=false;item.element.dataset.hscardDisplayGolden=String(result.card.golden);newlyPrepared=true;item.animationTime=0;item.animationClock=null;item.element.classList.remove('is-frame-unavailable');
     const placeholder=item.element.querySelector('.hscard-card-placeholder'),prepared=r.surface.items.get(item.key)?.prepared;
     if(placeholder&&prepared)placeholder.style.aspectRatio=prepared.context.width+'/'+prepared.context.height;
     item.dirty=false;layoutDirty=true;
    }
    // Normal cards are static. Repainting all their original shader passes on
    // every animation frame needlessly saturates the GPU on 5-column decks.
    // Golden cards keep their animated shader timings unless reduced motion
    // is requested; newly prepared or toggled cards repaint once regardless.
    if(item.dirty||(item.golden&&item.onScreen&&!reduced.matches)){
     const clock=now/1000;
     if(item.onScreen&&!reduced.matches&&item.animationClock!=null)item.animationTime+=Math.max(0,clock-item.animationClock);
     item.animationClock=item.onScreen&&!reduced.matches?clock:null;
     await r.surface.update(item.key,item.golden?(reduced.matches?1:item.animationTime):(reduced.matches?1:now/1000));
     item.dirty=false;
    }
    if(item===hovered&&(newlyPrepared||item.previewDirty||(item.golden&&item.onScreen&&!reduced.matches))){
     await r.surface.updatePreview(item.key,item.golden?(reduced.matches?1:item.animationTime):(reduced.matches?1:now/1000));
     item.previewDirty=false;layoutDirty=true;
    }
    // Publish each newly completed card while later API/artwork loads wait.
    // All awaits for this card have completed, so the framebuffer is idle.
    if(newlyPrepared&&version===epoch&&item.preparedVersion===item.version&&desktop.matches)presentCards(r);
    // Never call surface.present() during async WebGL rendering: it would change
    // the framebuffer and scissor state while the card shader pass is awaiting
    // geometry/texture assets. The canvas transform handles scrolling until
    // the current batch finishes.
   }catch(error){
    if(candidateKey)r.surface.remove(candidateKey);
    if(version!==epoch||candidateVersion!==null&&candidateVersion!==item.version||!item.visible||!item.element.isConnected||!desktop.matches)continue;
    if(item.preparedVersion>=0&&r.surface.items.has(item.key)){item.failed=true;item.dirty=false;item.element.dispatchEvent(new CustomEvent('hscard-render-error',{bubbles:true,detail:{id:item.key,message:String(error?.message||error)}}));}
    else{r.surface.remove(item.key);fail(item,error);}
   }
  }
  if(version===epoch&&desktop.matches){trimCardCache(r.surface,items);presentCards(r);}
 }catch(error){for(const item of items.values())if(item.visible&&!item.failed)fail(item,error);}finally{
  for(const release of releaseFrames)release();
  running=false;
  if(!desktop.matches&&ready)deactivateCanvas();
  // No perpetual rAF loop when the visible deck contains only static cards.
  if(pending||[...items.values()].some(x=>x.visible&&!x.failed&&(x.dirty||x.preparedVersion!==x.version||(x.golden&&x.onScreen&&!reduced.matches))))schedule();
 }
}
let scanFrame=0;
function queueScan(){
 if(!desktop.matches||scanFrame)return;
 scanFrame=requestAnimationFrame(()=>{scanFrame=0;scan();});
}
function scan(){
 if(!desktop.matches)return;
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
  items.delete(el);if(ready)ready.surface.remove(item.key);
 }
 scheduleLayout();
}
function start(){
 if(!observer){
  observer=new IntersectionObserver(entries=>{for(const entry of entries){const item=items.get(entry.target);if(item){item.visible=entry.isIntersecting;if(item.visible){item.lastVisible=++visibilitySequence;if(item.preparedVersion<0)resetFrame(item);}}}scheduleLayout();schedule();},{rootMargin:OVERSCAN+'px'});
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
}
function deactivateCanvas(){
 paintedAnchor=null;layoutDirty=true;
 if(!ready)return;
 ready.canvas.style.transform='';
 try{ready.surface.present(1,1,[]);}catch(error){/* WebGL context can be unavailable during a breakpoint change. */}
 for(const item of items.values()){
  ready.surface.remove(item.key);item.preparedVersion=-1;resetFrame(item);
  item.element.classList.remove('is-native-ready');
 }
}
document.addEventListener('click',event=>{const button=event.target.closest?.('[data-hscard-golden-toggle]');if(!button||!desktop.matches)return;const section=button.closest('.hscard-deck-list');if(!section)return;const golden=button.getAttribute('aria-pressed')!=='true';button.setAttribute('aria-pressed',String(golden));for(const item of items.values())if(section.contains(item.element)){item.golden=golden;item.version++;item.dirty=true;item.failed=false;item.element.classList.remove('is-native-failed');if(item.preparedVersion<0){item.element.dataset.hscardDisplayGolden=String(item.golden);resetFrame(item);}}schedule();});
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
  hovered=null;
  cancelAnimationFrame(frame);cancelAnimationFrame(layoutFrame);cancelAnimationFrame(scanFrame);
  frame=0;layoutFrame=0;scanFrame=0;
  if(!running)deactivateCanvas();
 }
});
reduced.addEventListener('change',()=>{for(const item of items.values())item.dirty=true;schedule();});
if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',start,{once:true});else start();
