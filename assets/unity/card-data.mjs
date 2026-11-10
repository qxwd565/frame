import {loadGoldenPortrait} from './golden-art.mjs?ver=legacy-golden-alpha-1';
const sourceCache=new Map(),artCache=new Map(),deckUrlsCache=new WeakMap(),tasks=[];let active=0,artBytes=0;
const races={ALL:'모두',BEAST:'야수',DEMON:'악마',DRAGON:'용족',DRAENEI:'드레나이',ELEMENTAL:'정령',MECHANICAL:'기계',MURLOC:'멀록',NAGA:'나가',PIRATE:'해적',QUILBOAR:'가시멧돼지',TOTEM:'토템',UNDEAD:'언데드'};
const schools={ARCANE:'비전',FEL:'지옥',FIRE:'화염',FROST:'냉기',HOLY:'신성',NATURE:'자연',SHADOW:'암흑'};
const kinds=new Set(['MINION','SPELL','WEAPON','LOCATION','HERO']);
function label(value,table){return String(value||'').split(',').map(x=>table[x.trim().toUpperCase()]||x.trim()).filter(Boolean).join(',');}
function comparableText(value){return String(value??'').normalize('NFC').replace(/\[x\]/gi,'').replace(/<br\s*\/?>/gi,'\n').replace(/<[^>]*>/g,'').replace(/[#$][ad]?(?=\d)/gi,'').replace(/\s+/gu,'');}
export function resolvedText(stored,remote){const text=String(stored.text??'');return stored.lockedText===false&&typeof remote?.text==='string'&&(text===''||comparableText(text)===comparableText(remote.text))?remote.text:text;}
function rawURL(value){try{let u=new URL(value);if(u.protocol!=='https:'&&!(u.origin===location.origin&&u.protocol==='http:'))return '';const match=u.hostname==='github.com'&&/^\/([^/]+)\/([^/]+)\/blob\/([^/]+)\/(.+)$/.exec(u.pathname);if(match)u=new URL('https://raw.githubusercontent.com/'+match.slice(1).join('/'));if(u.hostname==='raw.githubusercontent.com')u.pathname=u.pathname.replace(/^\/qxwd565\/Hearthstone-legacy-API\//i,'/qxwd565/legacy/');return u.href;}catch{return '';}}
function debugArt(message,details){if(globalThis.HSCARD_DEBUG===true)console.debug('[HScard artwork]',message,details);}
async function catalog(url){url=rawURL(url);if(!url)return null;if(!sourceCache.has(url))sourceCache.set(url,(async()=>{
 const fast=/^https:\/\/raw\.githubusercontent\.com\/[^/]+\/[^/]+\/[^/]+\/cards\.json(?:\?.*)?$/i.test(url)?url.replace(/\/cards\.json(?=\?|$)/,'/render.json'):url;
 const request=path=>fetch(path,{mode:'cors',credentials:'omit'});
 let r=await request(fast);if(!r.ok&&fast!==url)r=await request(url);
 if(!r.ok)throw Error('Card API '+r.status);
 const data=await r.json();if(data.schema!==1||!Array.isArray(data.cards)||data.cards.length>5000)throw Error('Invalid card API');
 const result=new Map();for(const c of data.cards)if(Number.isSafeInteger(c.dbfId)&&typeof c.id==='string')result.set(c.dbfId,{...c,sourceURL:rawURL(data.artBaseUrl)||(data.hscardLocal===true?'':url),sourceSet:data.set});return result;
})().catch(()=>null));return sourceCache.get(url);}
function limited(fn){return new Promise((resolve,reject)=>{tasks.push({fn,resolve,reject});pump();});}
function pump(){while(active<6&&tasks.length){active++;const t=tasks.shift();Promise.resolve().then(t.fn).then(t.resolve,t.reject).finally(()=>{active--;pump();});}}
async function artPixels(url){url=rawURL(url);if(!url)return null;if(artCache.has(url)){const hit=artCache.get(url);artCache.delete(url);artCache.set(url,hit);return hit;}
 const promise=limited(async()=>{const response=await fetch(url,{mode:'cors',credentials:'omit'});if(!response.ok)throw Error('HTTP '+response.status);const blob=await response.blob();if(blob.size>8*1024*1024)throw Error('Artwork too large');const image=await createImageBitmap(blob);try{if(!image.width||!image.height||image.width>4096||image.height>4096)throw Error('Invalid artwork size');const canvas=document.createElement('canvas');canvas.width=image.width;canvas.height=image.height;const ctx=canvas.getContext('2d',{willReadFrequently:true});if(!ctx)throw Error('Artwork canvas unavailable');ctx.drawImage(image,0,0);const data=ctx.getImageData(0,0,image.width,image.height).data,out=new Uint8Array(data.length),stride=image.width*4;for(let y=0;y<image.height;y++)out.set(data.subarray(y*stride,(y+1)*stride),(image.height-1-y)*stride);return{width:image.width,height:image.height,format:28,levels:[out]};}finally{image.close();}}).catch(error=>{debugArt('load failed',{url,reason:String(error?.message||error)});artCache.delete(url);return null;});
 artCache.set(url,promise);const pixels=await promise;if(pixels)artBytes+=pixels.levels[0].byteLength;while(artCache.size>64||artBytes>64*1024*1024){const oldest=artCache.keys().next().value;if(oldest===url&&artCache.size===1)break;const old=artCache.get(oldest);artCache.delete(oldest);old.then(p=>{if(p)artBytes=Math.max(0,artBytes-p.levels[0].byteLength);});}return pixels;}
/** Parse API source links once per deck section (not once per card attribute). */
function urlsFor(element,stored){
 const section=element.closest?.('[data-hscard-api-urls]');
 if(!section)return [];
 if(deckUrlsCache.has(section))return deckUrlsCache.get(section);
 let result=[];try{const raw=JSON.parse(section.dataset.hscardApiUrls||'[]');if(Array.isArray(raw))result=raw.filter(x=>typeof x==='string');}catch{}
 deckUrlsCache.set(section,result);return result;
}

/**
 * One date-qualified render specification is the source of truth.
 * Current API catalogs provide only native visual assets and tags.
 */
export async function resolveCard(element,golden,{isCurrent=()=>true,onMetadata=()=>{},waitForFrame=()=>Promise.resolve()}={}){
 const d=element.dataset,stored=JSON.parse(d.hscardCard||'{}');
 if(stored.specVersion!==1)throw Error('Unsupported card render specification');
 const deck=element.closest?.('.hscard-deck-list');
 if(deck?.dataset?.hscardDate&&deck.dataset.hscardDate!==stored.date)throw Error('Mismatched deck/card date');
 if(deck?.dataset?.hscardFrameProfile&&deck.dataset.hscardFrameProfile!==stored.frameProfile)throw Error('Mismatched deck/card frame');
 if(!['current','historical'].includes(stored.frameProfile))throw Error('Uninstalled historical frame profile '+stored.frameProfile);
 const kind=String(stored.type||'').toUpperCase();if(!kinds.has(kind))throw Error('Card type unavailable');
 const buildBase=remote=>{
  const tags={};for(const tag of remote?.nativeTags||[]){if(Number.isSafeInteger(tag?.id)&&Number.isFinite(tag?.value))tags[tag.id]=tag.value;}
  // A date-specific native tag wins over its current API counterpart.
  if(Array.isArray(stored.nativeTags))for(const tag of stored.nativeTags){if(Number.isSafeInteger(tag?.id)&&Number.isFinite(tag?.value))tags[tag.id]=tag.value;}
  const cardClass=String(stored.cardClass||remote?.cardClass||'NEUTRAL').replace(/[^A-Za-z]/g,'').toUpperCase();
  const rarity=String(stored.rarity||'FREE').toUpperCase();
  const mechanics=Array.isArray(stored.mechanics)?stored.mechanics:remote?.mechanics;
  for(const mechanic of mechanics||[]){if(mechanic==='TRADEABLE')tags[1720]=1;if(mechanic==='FORGE')tags[2785]=1;if(mechanic==='PREPARE')tags[4354]=1;}
  const cost=Number(stored.cost??0),attack=Number(stored.attack??0),health=Number(stored.health??0),durability=Number(stored.durability??0),armor=Number(stored.armor??0);
  tags[48]=cost;tags[47]=attack;tags[45]=health;tags[187]=durability;tags[292]=armor;
  return {id:stored.id||'',dbfId:Number(stored.dbfId),kind,cardClass,golden,rarity,frameProfile:stored.frameProfile,renderDate:stored.date,
   quantity:Number.isSafeInteger(Number(stored.quantity))&&Number(stored.quantity)>=2?Number(stored.quantity):1,
   cost,attack,health,durability,armor,race:label(stored.race,races),school:label(stored.school,schools),
   watermark:String(stored.watermark??remote?.watermark??''),set:String(remote?.set||(remote?.sourceSet==='Classic'?'EXPERT1':remote?.sourceSet||'')),tags};
 };
 const loading=base=>({...base,loading:true,name:'불러오는 중...',text:'',goldenPortrait:null,artPixels:{width:1,height:1,format:28,levels:[new Uint8Array([128,128,128,255])]}});
 // The stored deck record already identifies type, class and rarity. Do not
 // hold its frame behind a remote catalog or artwork request.
 const localClass=typeof stored.cardClass==='string'&&stored.cardClass.replace(/[^A-Za-z]/g,'')!=='';
 if(localClass&&isCurrent()){
  onMetadata(loading(buildBase(null)));
  // Start the card-data request only after this card's native frame is shown.
  await waitForFrame();
  if(!isCurrent())throw Error('Card request superseded');
 }
 const catalogs=await Promise.all(urlsFor(element,stored).map(catalog));
 let remote=null;
 for(const map of catalogs){const c=map?.get(Number(stored.dbfId));if(c&&(!stored.id||stored.id===c.id)){remote=c;break;}}
 if(!isCurrent())throw Error('Card request superseded');
 const base=buildBase(remote);
 // Legacy DB rows can lack a class; wait for their ID-matched API record
 // instead of flashing an incorrectly coloured neutral frame.
 if(!localClass)onMetadata(loading(base));
 const candidates=[];const add=url=>{url=rawURL(url);if(url&&!candidates.includes(url))candidates.push(url);};
 add(stored.art);
 // Historical/hand-selected art is authoritative: don't silently replace it
 // with a different current portrait when its URL fails.
 if(!stored.lockedArt&&remote?.sourceURL&&/^[A-Za-z0-9_]{1,96}$/.test(remote.id)){
  if(remote.art&&new RegExp('^art/'+remote.id+'\\.(?:png|jpg|webp)$','i').test(remote.art))add(new URL(remote.art,remote.sourceURL).href);
  for(const ext of ['png','jpg','webp'])add(new URL('art/'+remote.id+'.'+ext,remote.sourceURL).href);
 }
 let pixels=null;for(const url of candidates){pixels=await artPixels(url);if(pixels)break;}
 if(!pixels){debugArt('no usable artwork',{id:stored.id,dbfId:stored.dbfId,attempted:candidates.length,locked:!!stored.lockedArt});throw Error('Artwork unavailable for '+String(stored.id||stored.dbfId));}
 if(!isCurrent())throw Error('Card request superseded');
 const goldenPortrait=golden&&!stored.lockedArt?await loadGoldenPortrait(remote,stored.id||remote?.id,Number(stored.dbfId),isCurrent):null;
 return {...base,goldenPortrait,name:String(stored.name||''),text:resolvedText(stored,remote),artPixels:pixels};
}
