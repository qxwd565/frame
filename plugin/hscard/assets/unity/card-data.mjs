/** Native card data adapter for strict dates-v1 JSON. No legacy catalog reads. */
import {loadGoldenPortrait} from './golden-art.mjs?ver=hscard-f982cd0502be9297';
import {artUrlForSnapshot, cardSourceURL, loadCardSnapshot, normalizeForRender, validKoreanDate} from './card-snapshots.mjs?ver=hscard-f982cd0502be9297';

const artCache = new Map(), tasks = [];
let active = 0, artBytes = 0;
const races = {ALL:'모두',BEAST:'야수',DEMON:'악마',DRAGON:'용족',DRAENEI:'드레나이',ELEMENTAL:'정령',MECHANICAL:'기계',MURLOC:'멀록',NAGA:'나가',PIRATE:'해적',QUILBOAR:'가시멧돼지',TOTEM:'토템',UNDEAD:'언데드'};
const schools = {ARCANE:'비전',FEL:'지옥',FIRE:'화염',FROST:'냉기',HOLY:'신성',NATURE:'자연',SHADOW:'암흑'};
const nativeKinds = new Set(['MINION','SPELL','WEAPON','LOCATION','HERO']);
function label(value, table) {return String(value || '').split(',').map(x => table[x.trim().toUpperCase()] || x.trim()).filter(Boolean).join(',');}
function rawURL(value) {
 try {
  const url = new URL(value);
  if(url.protocol !== 'https:' && !(url.origin === location.origin && url.protocol === 'http:'))return '';
  return url.href;
 } catch {return '';}
}
function debugArt(message, details) {if(globalThis.HSCARD_DEBUG === true)console.debug('[HScard artwork]',message,details);}
function limited(fn){return new Promise((resolve,reject)=>{tasks.push({fn,resolve,reject});pump();});}
function pump(){while(active<6&&tasks.length){active++;const t=tasks.shift();Promise.resolve().then(t.fn).then(t.resolve,t.reject).finally(()=>{active--;pump();});}}
async function artPixels(url){url=rawURL(url);if(!url)return null;
 if(artCache.has(url)){const hit=artCache.get(url);artCache.delete(url);artCache.set(url,hit);return hit;}
 const promise=limited(async()=>{
  const response=await fetch(url,{mode:'cors',credentials:'omit',priority:'low'});
  if(!response.ok)throw Error('HTTP '+response.status);
  const blob=await response.blob();if(blob.size>8*1024*1024)throw Error('Artwork too large');
  const image=await createImageBitmap(blob);
  try{
   if(!image.width||!image.height||image.width>4096||image.height>4096)throw Error('Invalid artwork size');
   const canvas=document.createElement('canvas');canvas.width=image.width;canvas.height=image.height;
   const ctx=canvas.getContext('2d',{willReadFrequently:true});if(!ctx)throw Error('Artwork canvas unavailable');
   ctx.drawImage(image,0,0);const data=ctx.getImageData(0,0,image.width,image.height).data;
   const out=new Uint8Array(data.length),stride=image.width*4;
   for(let y=0;y<image.height;y++)out.set(data.subarray(y*stride,(y+1)*stride),(image.height-1-y)*stride);
   return{width:image.width,height:image.height,format:28,levels:[out]};
  }finally{image.close();}
 }).catch(error=>{debugArt('load failed',{url,reason:String(error?.message||error)});artCache.delete(url);return null;});
 artCache.set(url,promise);const pixels=await promise;
 if(pixels)artBytes+=pixels.levels[0].byteLength;
 while(artCache.size>64||artBytes>64*1024*1024){
  const oldest=artCache.keys().next().value;if(oldest===url&&artCache.size===1)break;
  const old=artCache.get(oldest);artCache.delete(oldest);
  old.then(p=>{if(p)artBytes=Math.max(0,artBytes-p.levels[0].byteLength);});
 }
 return pixels;
}

/** The ONLY date reconstruction step used by cards and deck tiles. */
export async function readDatedCard(element) {
 let identity;
 try{identity=JSON.parse(element.dataset.hscardCard||'{}');}catch{throw Error('Invalid card identity');}
 if(identity.specVersion!==2||identity.snapshotMode!=='dates-v1')throw Error('Unsupported card data format: dates-v1 required');
 if(typeof identity.id!=='string'||!/^[A-Za-z0-9_]{1,96}$/.test(identity.id))throw Error('Missing card ID');
 const deck=element.closest?.('.hscard-deck-list');
 const date=deck?.dataset?.hscardDate || identity.date;
 if(!validKoreanDate(date))throw Error('Invalid card reference date');
 const url=cardSourceURL(element,identity.id);
 if(!url)throw Error('Card source not registered for '+identity.id);
 const snapshot=await loadCardSnapshot(url,date);
 if(!snapshot)return null;
 const card=normalizeForRender(snapshot,identity);
 if(card.metadata.id&&card.metadata.id!==identity.id)throw Error('Card ID does not match the dated JSON');
 if(card.metadata.dbfId!==undefined&&Number(card.metadata.dbfId)!==Number(identity.dbfId))throw Error('DBF ID does not match the dated JSON');
 // Preserve Zilliax module cost aggregation using dated child costs, never
 // the import index's latest mana. Both children use this exact reducer/cache.
 if(deck&&identity.id&&identity.dbfId){
  let map={};try{map=JSON.parse(deck.dataset.hscardSideboardOwners||'{}');}catch{}
  const childIds=Object.keys(map).filter(child=>Number(map[child])===Number(identity.dbfId));
  if(childIds.length===2&&card.type==='MINION'){
   const modules=await Promise.all(childIds.map(child=>{
    const childFigure=[...deck.querySelectorAll('[data-hscard-card]')].find(el=>{
     try{return Number(JSON.parse(el.dataset.hscardCard||'{}').dbfId)===Number(child);}catch{return false;}
    });
    return childFigure?readDatedCard(childFigure):Promise.resolve(null);
   }));
   if(modules.every(x=>x&&typeof x.card.cost==='number'))card.cost=modules.reduce((sum,x)=>sum+x.card.cost,0);
  }
 }
 return {identity,card,date,url,frameProfile:deck?.dataset?.hscardFrameProfile||identity.frameProfile};
}

/** Full original mesh/texture/shader path is unchanged; only input data differs. */
export async function resolveCard(element,golden,{isCurrent=()=>true,onMetadata=()=>{},waitForFrame=()=>Promise.resolve()}={}){
 const dated=await readDatedCard(element);
 if(!isCurrent())throw Error('Card request superseded');
 if(!dated){const error=new Error('Card not released at the requested date');error.code='HSCARD_NOT_RELEASED';throw error;}
 const {identity,card,date,url,frameProfile}=dated;
 if(!['current','historical'].includes(frameProfile))throw Error('Uninstalled historical frame profile '+frameProfile);
 const kind=card.type;
 if(!nativeKinds.has(kind))throw Error('3D card frame unavailable for '+kind);
 const tags={};
 for(const tag of card.nativeTags){if(Number.isSafeInteger(tag.id)&&Number.isFinite(tag.value))tags[tag.id]=tag.value;}
 // Explicit classes/runes can be present even without Unity's native tags.
 // Native historical tags win when already included in the dated state.
 if(!Object.hasOwn(tags,476)&&card.classes.length>1){
  const bits={DEATHKNIGHT:0,DRUID:1,HUNTER:2,MAGE:3,PALADIN:4,PRIEST:5,ROGUE:6,SHAMAN:7,WARLOCK:8,WARRIOR:9,DEMONHUNTER:13};
  let mask=0;for(const name of card.classes){const bit=bits[name.toUpperCase()];if(bit!==undefined)mask|=(1<<bit);}
  if(mask)tags[476]=mask;
 }
 if(![2196,2197,2198].some(t=>Object.hasOwn(tags,t))){
  const counts={BLOOD:0,FROST:0,UNHOLY:0};
  if(Array.isArray(card.runes))for(const name of card.runes){const k=String(name).toUpperCase();if(Object.hasOwn(counts,k))counts[k]++;}
  else if(card.runes&&typeof card.runes==='object')for(const [k,n] of Object.entries(card.runes)){if(Object.hasOwn(counts,k.toUpperCase())&&Number.isInteger(n)&&n>=0&&n<=3)counts[k.toUpperCase()]=n;}
  if(Object.values(counts).some(x=>x)){tags[2196]=counts.BLOOD;tags[2197]=counts.FROST;tags[2198]=counts.UNHOLY;}
 }
 for(const mechanic of card.mechanics){
  if(mechanic==='TRADEABLE')tags[1720]=1;
  if(mechanic==='FORGE')tags[2785]=1;
  if(mechanic==='PREPARE')tags[4354]=1;
 }
 if(card.cost!==undefined)tags[48]=card.cost;
 // Strip obsolete class-stat tags when a card changes type historically.
 for(const tag of [45,47,187,292]){
  if(tag===45&&kind==='MINION')continue;
  if(tag===47&&(kind==='MINION'||kind==='WEAPON'))continue;
  if(tag===187&&(kind==='WEAPON'||kind==='LOCATION'))continue;
  if(tag===292&&kind==='HERO')continue;
  delete tags[tag];
 }
 if(kind==='MINION'){
  if(card.attack!==undefined)tags[47]=card.attack;
  if(card.health!==undefined)tags[45]=card.health;
 }else if(kind==='WEAPON'){
  if(card.attack!==undefined)tags[47]=card.attack;
  if(card.durability!==undefined)tags[187]=card.durability;
 }else if(kind==='LOCATION'){
  if(card.durability!==undefined)tags[187]=card.durability;
 }else if(kind==='HERO'){
  if(card.armor!==undefined)tags[292]=card.armor;
 }
 const base={id:identity.id,dbfId:Number(identity.dbfId),kind,
  cardClass:card.cardClass.replace(/[^A-Za-z]/g,'').toUpperCase()||'NEUTRAL',
  golden,rarity:card.rarity,frameProfile,textProfile:identity.textProfile||'',renderDate:date,
  quantity:Number.isSafeInteger(Number(identity.quantity))&&Number(identity.quantity)>=2?Number(identity.quantity):1,
  cost:card.cost??0,attack:card.attack??0,health:card.health??0,
  durability:card.durability??0,armor:card.armor??0,
  race:label(card.races.join(','),races),school:label(card.school,schools),
  watermark:card.watermark,set:card.set||identity.set||'',tags};
 const loading={...base,loading:true,name:'불러오는 중...',text:'',goldenPortrait:null,artPixels:{width:1,height:1,format:28,levels:[new Uint8Array([128,128,128,255])]}};
 if(isCurrent())onMetadata(loading);
 // Begin artwork before waiting for the first frame. No remote catalog scan.
 const artHasExplicitField=Object.hasOwn(card.raw,'art');
 const explicitArt=artHasExplicitField ? artUrlForSnapshot(card.art,url) : '';
 // Managed local JSON uses a REST URL, so its relative art path can reuse
 // an exact matching imported art file in the same source repository.
 const localArtFallback=artHasExplicitField && /^art\/[A-Za-z0-9_]+\.(?:png|jpg|webp)$/i.test(card.art||'') &&
  rawURL(identity.art).endsWith('/'+card.art) ? rawURL(identity.art) : '';
 const imageURL=identity.lockedArt ? rawURL(identity.art) :
  (artHasExplicitField ? (explicitArt||localArtFallback) : rawURL(identity.art));
 const artTask=imageURL?artPixels(imageURL):Promise.resolve(null);
 const origin=(()=>{
  try{
   const data=new URL(url);if(/\/data\/[A-Za-z0-9_]+\.json$/.test(data.pathname))return new URL('../cards.json',data).href;
   const art=rawURL(identity.art);if(art&&/\/art\/[A-Za-z0-9_]+\.(?:png|jpg|webp)$/.test(new URL(art).pathname))return new URL('../cards.json',art).href;
  }catch{}return '';
 })();
 const goldenTask=golden&&!identity.lockedArt&&origin ?
  loadGoldenPortrait({id:identity.id,dbfId:Number(identity.dbfId),sourceURL:origin},identity.id,Number(identity.dbfId),isCurrent):Promise.resolve(null);
 await waitForFrame();
 if(!isCurrent())throw Error('Card request superseded');
 let pixels=await artTask;
 if(!pixels&&!identity.lockedArt&&!artHasExplicitField&&origin){
  // A file with no 'art' field may use its canonical original art/<id> file.
  for(const ext of ['png','jpg','webp']){
   pixels=await artPixels(new URL('art/'+identity.id+'.'+ext,origin).href);
   if(pixels)break;
  }
 }
 if(!pixels){debugArt('no usable artwork',{id:identity.id,source:url});throw Error('Artwork unavailable for '+identity.id);}
 if(!isCurrent())throw Error('Card request superseded');
 return {...base,goldenPortrait:await goldenTask,name:card.name,text:card.text,artPixels:pixels};
}
