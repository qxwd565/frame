import {decodeTexture} from './hsplus-sources.mjs?ver=hscard-154ea4bb60362c5b';
import {validateAnimation} from './artwork-animation.mjs?ver=hscard-154ea4bb60362c5b';

// Documents are relative to the owning set root, not golden/cards/.
const indexes=new Map(),materials=new Map(),textures=new Map(),historicalBanks=new Map(),queue=[];
let active=0;
const debug=(reason,details)=>{if(globalThis.HSCARD_DEBUG===true)console.debug('[HScard golden]',reason,details);};
function limited(fn){return new Promise((resolve,reject)=>{queue.push({fn,resolve,reject});pump();});}
function pump(){while(active<4&&queue.length){const t=queue.shift();active++;Promise.resolve().then(t.fn).then(t.resolve,t.reject).finally(()=>{active--;pump();});}}
function trim(cache,count,budget){let bytes=0;for(const e of cache.values())bytes+=e.bytes||0;for(const [key,e] of cache){if(cache.size<=count&&bytes<=budget)break;if(!e.done)continue;cache.delete(key);bytes-=e.bytes||0;}}
function cached(cache,key,load,count,budget){
 const old=cache.get(key);if(old&&(!old.failed||Date.now()-old.finished<30000)){cache.delete(key);cache.set(key,old);return old.promise;}
 const entry={done:false,bytes:0};cache.set(key,entry);
 entry.promise=Promise.resolve().then(load).then(({value,bytes})=>{entry.done=true;entry.bytes=bytes;trim(cache,count,budget);return value;},error=>{entry.done=true;entry.failed=true;entry.finished=Date.now();trim(cache,count,budget);throw error;});
 return entry.promise;
}
async function download(url,limit){return limited(async()=>{
 const controller=new AbortController(),timer=setTimeout(()=>controller.abort(),15000);
 try{const r=await fetch(url,{mode:'cors',credentials:'omit',signal:controller.signal});if(!r.ok)throw Error('HTTP '+r.status);
  if(Number(r.headers.get('content-length'))>limit)throw Error('Golden resource exceeds budget');
  const bytes=await r.arrayBuffer();if(bytes.byteLength>limit)throw Error('Golden resource exceeds budget');return bytes;
 }finally{clearTimeout(timer);}
});}
async function document(url){const bytes=await download(url,4*1024*1024);return{value:JSON.parse(new TextDecoder('utf-8',{fatal:true}).decode(bytes)),bytes:bytes.byteLength};}
async function digest(bytes){return Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256',bytes)),x=>x.toString(16).padStart(2,'0')).join('');}
function sameSetPath(root,path,pattern){if(typeof path!=='string'||!pattern.test(path))throw Error('Invalid golden resource path');const url=new URL(path,root);if(!url.href.startsWith(root.href))throw Error('Golden resource outside set');return url.href;}
const finiteArray=(v,length)=>Array.isArray(v)&&(!length||v.length===length)&&v.length>0&&v.length<=4&&v.every(Number.isFinite);
function materialData(data,id,dbfId,root){
 if(data?.schema!==1||data.id!==id||data.dbfId!==dbfId)throw Error('Golden material identity mismatch');
 const m=data.material;if(!m||typeof m.shader!=='string'||!Array.isArray(m.keywords)||m.keywords.some(x=>typeof x!=='string')||!m.values||!m.textures)throw Error('Invalid golden material');
 for(const v of Object.values(m.values))if(!finiteArray(v))throw Error('Invalid golden material value');
 const entries=Object.entries(m.textures);if(!entries.length||entries.length>32||!m.textures._MainTex)throw Error('Missing golden portrait texture');
 for(const [,t] of entries){sameSetPath(root,t.pixels,/^golden\/textures\/[a-f0-9]{64}\.bin$/);if(!finiteArray(t.st,4)||!t.sampler||![0,1,2].includes(t.sampler.filter)||['wrapU','wrapV','wrapW'].some(k=>![0,1,2,3].includes(t.sampler[k])))throw Error('Invalid golden texture binding');}
 validateAnimation(m.animation,data.noisePermutation);
 return data;
}
async function pixels(root,path){
 const url=sameSetPath(root,path,/^golden\/textures\/[a-f0-9]{64}\.bin$/),hash=path.split('/').pop().slice(0,-4);
 return cached(textures,hash,async()=>{const bytes=await download(url,32*1024*1024);
  const actual=Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256',bytes)),x=>x.toString(16).padStart(2,'0')).join('');if(actual!==hash)throw Error('Golden texture checksum mismatch');
  const image=decodeTexture(bytes);if(image.width>4096||image.height>4096||![28,29,65,71,72,77,78].includes(image.format))throw Error('Unsupported golden texture');
  for(let i=0;i<image.levels.length;i++){const w=Math.max(1,image.width>>i),h=Math.max(1,image.height>>i),compressed=[71,72,77,78].includes(image.format),size=compressed?Math.ceil(w/4)*Math.ceil(h/4)*([71,72].includes(image.format)?8:16):w*h*(image.format===65?1:4);if(image.levels[i].byteLength!==size)throw Error('Invalid golden mip size');}
  return{value:image,bytes:image.levels.reduce((n,b)=>n+b.byteLength,0)};
 },128,96*1024*1024);
}
async function historicalPrograms(root,index,data){
 const native=data.native,shader=native?.shader,programs=native?.programs;
 if(index.set!=='legacy'||shader?.name!==data.material.shader||!/^Native\/LegacyBeta\/[0-9]+\/[a-f0-9]{16}$/.test(shader.name)||!programs||Object.keys(programs).length!==2)throw Error('Invalid historical golden shader');
 const descriptor=index.webgpuBank;if(descriptor?.path!=='golden/historical-webgpu.json'||!/^[a-f0-9]{64}$/.test(descriptor.sha256))throw Error('Historical WebGPU bank unavailable');
 const url=new URL(sameSetPath(root,descriptor.path,/^golden\/historical-webgpu\.json$/));url.searchParams.set('sha256',descriptor.sha256);const bankURL=url.href;
 const bank=await cached(historicalBanks,bankURL,async()=>{const bytes=await download(bankURL,4*1024*1024);if(await digest(bytes)!==descriptor.sha256)throw Error('Historical WebGPU bank checksum mismatch');const value=JSON.parse(new TextDecoder('utf-8',{fatal:true}).decode(bytes));if(value?.schema!==1||!value.programs||typeof value.programs!=='object')throw Error('Invalid historical WebGPU bank');return{value,bytes:bytes.byteLength};},8,16*1024*1024);
 const resolved={};for(const [id,p] of Object.entries(programs)){
  if(!/^[a-f0-9]{64}$/.test(id)||!['vertex','fragment'].includes(p?.stage)||typeof p.source!=='string'||p.source.length>262144||await digest(new TextEncoder().encode(p.source))!==id)throw Error('Historical shader checksum mismatch');
  const spec=bank.programs[id];if(spec?.sourceSha256!==id||spec.stage!==p.stage||typeof spec.wgsl!=='string'||spec.wgsl.length>262144||!/^[a-f0-9]{64}$/.test(spec.wgslSha256)||await digest(new TextEncoder().encode(spec.wgsl))!==spec.wgslSha256)throw Error('Historical WebGPU shader checksum mismatch');
  if(['buffers','textures','samplers','attributes'].some(k=>!Array.isArray(spec[k])||spec[k].length>64))throw Error('Invalid historical WebGPU bindings');resolved[id]=spec;
 }
 return{shader,programs:resolved};
}
/** Only a matching card in its imported source may supply a golden portrait. */
export async function loadGoldenPortrait(remote,id,dbfId,isCurrent=()=>true,date=null){
 if(!remote?.sourceURL||remote.id!==id||remote.dbfId!==dbfId||!isCurrent())return null;
 let historical=false;
 try{
  const root=new URL('./',remote.sourceURL);if(root.protocol!=='https:'&&!(root.protocol==='http:'&&root.origin===globalThis.location?.origin))return null;
  const indexURL=new URL('golden/index.json',root).href,index=await cached(indexes,indexURL,()=>document(indexURL),48,8*1024*1024);
  if(!isCurrent())return null;if(index.schema!==1||!index.cards||typeof index.cards!=='object')throw Error('Invalid golden index');
  const entry=index.cards[id];if(!entry)return null;if(entry.dbfId!==dbfId)throw Error('Golden index identity mismatch');
  let path=entry.material;if(index.set==='legacy'&&typeof date==='string'&&/^\d{4}-\d{2}-\d{2}$/.test(date)){const history=Array.isArray(entry.history)?entry.history:[],matches=history.filter(x=>typeof x.from==='string'&&typeof x.until==='string'&&x.from<=date&&date<x.until);if(matches.length>1)throw Error('Overlapping golden history');if(matches.length){path=matches[0].material;historical=true;}else if(date<'2014-03-12'||history.some(x=>typeof x.until==='string'&&date<x.until)){historical=true;throw Error('Historical golden portrait unavailable at '+date);}}
  const materialURL=sameSetPath(root,path,/^golden\/(?:cards\/[A-Za-z0-9_]+|history\/cards\/[A-Za-z0-9_]+-[0-9]+)\.json$/);
  const raw=await cached(materials,materialURL,()=>document(materialURL),64,16*1024*1024);if(!isCurrent())return null;
  const data=materialData(raw,id,dbfId,root),[bindings,native]=await Promise.all([Promise.all(Object.entries(data.material.textures).map(async([name,t])=>[name,{pixels:await pixels(root,t.pixels),sampler:{...t.sampler},st:[...t.st]}])),historical?historicalPrograms(root,index,data):Promise.resolve(null)]);
  if(!isCurrent())return null;
  return{...data.material,historicalShader:native?.shader,historicalPrograms:native?.programs,legacyGolden:index.set==='legacy',values:Object.fromEntries(Object.entries(data.material.values).map(([k,v])=>[k,[...v]])),textures:Object.fromEntries(bindings),noisePermutation:data.noisePermutation};
 }catch(error){if(historical)throw error;debug('using normal artwork',{id,dbfId,reason:String(error?.message||error)});return null;}
}
