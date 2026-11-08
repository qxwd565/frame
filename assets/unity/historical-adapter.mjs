import {HistoricalFrames,readTexturePlanes} from './historical-frames.mjs?ver=beta-3664-1';
import {NativeMinionProfile} from './native-minion-profile.mjs?ver=beta-3664-1';
import {multiply,inverse} from './native-draw-builder.mjs?ver=hsplus-cards-2';
import {originalClasses} from './hsplus-sources.mjs?ver=hsplus-cards-10';
const f=Math.fround,identity=()=>[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
function trs(t){const [x,y,z,w]=t.rotation,[sx,sy,sz]=t.scale,[px,py,pz]=t.position;return [f((1-2*(y*y+z*z))*sx),f(2*(x*y+z*w)*sx),f(2*(x*z-y*w)*sx),0,f(2*(x*y-z*w)*sy),f((1-2*(x*x+z*z))*sy),f(2*(y*z+x*w)*sy),0,f(2*(x*z+y*w)*sz),f(2*(y*z-x*w)*sz),f((1-2*(x*x+y*y))*sz),0,px,py,pz,1];}
function oldPose(n){if(!n.chain)return trs(n);return n.chain.reduce((m,t)=>multiply(m,trs(t)),identity());}
function prefabPose(prefab,owner){let pose=identity(),root=false;const chain=prefab.nodes.filter(n=>owner.path===n.path||owner.path.startsWith(n.path+'/')).sort((a,b)=>a.path.length-b.path.length).slice(1);for(const n of chain){if(!root&&n.path.split('/').at(-1).toLowerCase().includes('rootobject')){root=true;continue;}const vec=(o,names)=>names.map(k=>Number(o[k]));pose=multiply(pose,trs({position:vec(n.position,['x','y','z']),rotation:vec(n.rotation,['x','y','z','w']),scale:vec(n.scale,['x','y','z'])}));}return pose;}
export function historicalSelection(card){
 const date=String(card.renderDate||'');if(!/^\d{4}-\d{2}-\d{2}$/.test(date))return null;
 const parsed=new Date(date+'T00:00:00Z');if(!Number.isFinite(parsed.valueOf())||parsed.toISOString().slice(0,10)!==date)return null;
 const classes=originalClasses(card),one=classes.length===1,cls=classes[0],isDK=one&&cls==='DEATHKNIGHT',singleRace=!!card.race&&!card.race.includes(',');let catalog=null,edition=null,component=null,textProfile=null,raceLayout=false;
 if(card.kind==='MINION'&&one&&['NEUTRAL','DRUID','HUNTER','MAGE','PALADIN','PRIEST','ROGUE','SHAMAN','WARLOCK','WARRIOR'].includes(cls)&&date>='2013-08-17'&&date<'2016-04-25')return{nativeProfile:date<'2013-10-03'?'1.0.0.3664':'1.0.0.3890'};
 if(isDK&&['MINION','WEAPON'].includes(card.kind)&&date>='2022-12-07'&&date<'2023-03-15'){catalog=date<'2023-02-15'?'deathknight-25.2.json':'deathknight-25.4.json';}
 else if(card.kind==='SPELL'&&date<'2021-03-26'){
  catalog=one&&cls==='HUNTER'&&date>='2020-07-31'?'hunter-outland.json':'darkmoon.json';edition='Darkmoon';
  if(card.golden&&date<'2017-04-05'){component='2.5.8474-spell';catalog='2019.json';edition='2019';}
 }else if(['WEAPON','HERO'].includes(card.kind)&&date<'2020-07-31'){catalog='2019.json';edition='2019';}
 else if(card.kind==='MINION'&&singleRace&&date<'2021-03-26'){if(date>='2016-10-21'&&date<'2017-04-05'){catalog='layout.json';edition='Race';raceLayout=true;}else{catalog='darkmoon.json';edition='Darkmoon';}}
 if(card.kind==='LOCATION'&&card.golden&&date>='2023-01-18'&&date<'2023-02-15')component='25.2.162867-location';
 if(['MINION','WEAPON'].includes(card.kind)&&date>='2016-04-25'&&date<'2016-07-13')textProfile='5.0.12574';
 if(card.kind==='MINION'&&singleRace&&date>='2020-09-30'&&date<'2020-10-23')textProfile='18.4.60352';
 if(card.kind==='MINION'&&!card.golden&&String(card.race||'').includes(',')){if(date>='2022-12-07'&&date<'2023-06-01')textProfile='25.2.162867';else if(date>='2023-06-01'&&date<'2023-06-28')textProfile='26.4.175913';}
 return catalog||component||textProfile?{catalog,edition,component,textProfile,raceLayout,hideSchool:card.kind==='SPELL'&&date<'2021-03-26'}:null;
}

function rel(path){const i=path.indexOf('RootObject');return (i<0?path:path.slice(i)).replace('RootObject/NonQuestObjects/','RootObject/');}
function geometry(source,slot){const attributes=new Map(),count=source.vertices.length;for(const [name,rows,defaultW] of [['POSITION0',source.vertices,1],['NORMAL0',source.normals,0],['TEXCOORD0',source.uv,0],['TEXCOORD1',source.uv2,0],['TANGENT0',source.tangents,0],['COLOR0',source.colors,1]])if(rows){if(rows.length!==count)throw Error('Historical mesh attribute count');const out=new Float32Array(count*4);for(let i=0;i<count;i++){const a=rows[i];out.set([a[0],a[1],a[2]??0,a[3]??defaultW],i*4);}attributes.set(name,out);}return {count,attributes,indices:new Uint32Array(source.triangles[Math.min(slot,source.triangles.length-1)])};}
function cloneMaterial(m){return {...m,values:{...m.values},textures:{...m.textures},keywords:[...(m.keywords||[])]};}
export class HistoricalAdapter {
 constructor(sources,composer,history){Object.assign(this,{sources,composer,history});this.textures=new Map();this.meshes=new WeakMap();this.textureBytes=0;this.textureLimit=96*1024*1024;}
 static async create(sources,composer){return new HistoricalAdapter(sources,composer,await HistoricalFrames.load());}
 async nativeProfile(builder,renderer,version){this.nativeProfiles??=new Map();if(!this.nativeProfiles.has(version))this.nativeProfiles.set(version,NativeMinionProfile.load(this,builder,renderer,version).catch(error=>{this.nativeProfiles.delete(version);throw error;}));return this.nativeProfiles.get(version);}
 async components(){if(!this.componentsPromise)this.componentsPromise=(async()=>{const r=await fetch(new URL('historical-components.json.gz',this.history.base));if(!r.ok)throw Error('Historical components HTTP '+r.status);return JSON.parse(await new Response(r.body.pipeThrough(new DecompressionStream('gzip'))).text());})();return this.componentsPromise;}
 async textPackage(){if(!this.textPackagePromise)this.textPackagePromise=(async()=>{const url=new URL('legacy-text-settings.json.gz',this.history.base),response=await fetch(url);if(!response.ok)throw Error('Historical text HTTP '+response.status);return JSON.parse(await new Response(response.body.pipeThrough(new DecompressionStream('gzip'))).text());})();return this.textPackagePromise;}
 async textConfiguration(card,edition,role){
  const current=this.sources.textConfiguration(card.kind,card.golden,role);if(role==='m_costTextMesh'||edition==='Race'&&role!=='m_raceTextMesh')return current;
  const data=await this.textPackage(),old=data.editions.find(e=>e.edition===edition), family={SPELL:'Ability',MINION:'Ally',WEAPON:'Weapon',HERO:'Hero'}[card.kind];if(!old||!family)return current;
  const prefab=old.prefabs.find(p=>p.name==='Card_Hand_'+family+(card.golden?'_Premium':''));if(!prefab)return current;
  const actor=prefab.nodes[0].components.find(c=>Object.hasOwn(c.settings,'m_nameTextMesh')),ref=actor?.settings[role]?.ref;if(!ref)return current;
  const owner=prefab.nodes.find(n=>n.components.some(c=>c.source===ref));if(!owner)return current;
  const settings={...owner.components.find(c=>c.source===ref).settings},base=old.fonts.find(f=>f.source===settings.m_Font?.ref);if(!base)return current;
  const localeDef=this.sources.text.definitions.find(d=>d.settings.m_Name===base.name),localeFont=localeDef&&this.sources.text.fonts.find(f=>f.cab+':'+f.pathId===localeDef.font),font=localeFont?.name||base.name;
  const definition=old.definitions.find(d=>d.name===base.name&&old.fonts.find(f=>f.source===d.settings.m_Font?.ref)?.name===font) || localeDef;
  if(definition)for(const [key,value] of Object.entries(definition.settings))if(key.endsWith('Modifier')||key==='m_SingleLineAdjustment')settings[key]=value;
  const layout=data.layouts.find(l=>l.edition===edition&&l.kind===card.kind&&!!l.premium===!!card.golden),path=owner.path.slice(prefab.name.length+1),node=layout?.nodes.find(n=>n.path===path);
  if(!node)return current;const specialRace=edition==='Darkmoon'&&role==='m_raceTextMesh';if(!specialRace)for(const [key,value] of Object.entries(node.text))settings['m_'+key]=value;
  const ownerPose=specialRace?prefabPose(prefab,owner):node.chain.reduce((m,t)=>multiply(m,trs(t)),identity()),offset=identity(),locales=settings.m_LocalizedSettings?.m_LocaleAdjustments||[], localized=(Array.isArray(locales)?locales:locales.Array||[]).find(x=>Number(x.m_Locale)===4);
  if(localized){const p=localized.m_PositionOffset;offset[12]=p.x;offset[13]=p.y;offset[14]=p.z;}
  if(Array.isArray(locales))settings.m_LocalizedSettings={...settings.m_LocalizedSettings,m_LocaleAdjustments:{Array:locales}};
  const dest=owner.components.find(c=>c.source===ref).settings.m_RenderOnObject?.ref,target=dest&&prefab.nodes.find(n=>n.source===dest),targetMesh=target&&old.meshes.find(m=>m.key===target.mesh),destinationPose=target?prefabPose(prefab,target):current.binding.destinationPose;const sourcePose=multiply(ownerPose,offset);if(edition==='Race'&&role==='m_raceTextMesh'){const native=this.sources.card(card.kind,card.golden).frame.nodes.find(n=>n.path.endsWith('/RootObject/RacePlate_mesh'));if(!native?.pose)throw Error('Missing current race plate');const parent=node.chain.slice(0,-1).reduce((m,t)=>multiply(m,trs(t)),identity());sourcePose[13]+=native.pose[13]-parent[13];}return{binding:{...current.binding,sourcePose,destinationPose},settings,font,componentMesh:targetMesh||null};
 }
 async profileText(card,profile,role,current){if(!profile)return current;const data=await this.components(),p=data.texts.find(x=>x.id===profile),prefab=this.sources.card(card.kind,card.golden).name,row=p?.rows.find(x=>x.prefab===prefab&&x.role===role);if(!row)return current;const settings={...current.settings,...row.settings},locales=settings.m_LocalizedSettings?.m_LocaleAdjustments;if(Array.isArray(locales))settings.m_LocalizedSettings={...settings.m_LocalizedSettings,m_LocaleAdjustments:{Array:locales}};return{...current,settings,binding:{...current.binding,ownerPose:row.ownerPose,sourcePose:row.sourcePose,destinationPose:row.destinationPose||current.binding.destinationPose},componentMesh:row.mesh};}
 textGeometry(source){let slots=this.meshes.get(source);if(!slots){slots=new Map();this.meshes.set(source,slots);}if(!slots.has('text')){const p=new Float32Array(source.count*4),uv=new Float32Array(source.count*4);for(let i=0;i<source.count;i++){p.set([source.vertices[i*3],source.vertices[i*3+1],source.vertices[i*3+2],1],i*4);uv.set([source.uv[i*2],source.uv[i*2+1],0,0],i*4);}slots.set('text',{count:source.count,attributes:new Map([['POSITION0',p],['TEXCOORD0',uv]]),indices:new Uint32Array(source.indices)});}return slots.get('text');}
 meshGeometry(source,slot){let slots=this.meshes.get(source);if(!slots){slots=new Map();this.meshes.set(source,slots);}if(!slots.has(slot))slots.set(slot,geometry(source,slot));return slots.get(slot);}
 async texture(catalog,id,race=false){const key=(catalog.edition||catalog.version)+':'+id;let entry=this.textures.get(key);if(entry){this.textures.delete(key);this.textures.set(key,entry);return entry.promise;}entry={size:0,promise:null};entry.promise=(async()=>{const tx=race?await (await fetch(new URL(id+'.json',this.history.base))).json():catalog.textures.find(x=>x.id===id);if(!tx)throw Error('Historical texture id '+id);let pixels;if(tx.encoding==='webp-rgba32-planes')pixels=await readTexturePlanes(this.history.base,tx);else if(tx.encoding==='gzip-rgba32-inline'||tx.encoding==='gzip-bgra32'){const packed=Uint8Array.from(atob(tx.data),c=>c.charCodeAt(0)),raw=new Uint8Array(await new Response(new Blob([packed]).stream().pipeThrough(new DecompressionStream('gzip'))).arrayBuffer());if(raw.length!==tx.width*tx.height*4)throw Error('Historical component texture length');const digest=Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256',raw)),b=>b.toString(16).padStart(2,'0')).join('');if(digest!==(tx.rgbaSha256||tx.sha256))throw Error('Historical component texture checksum');if(tx.encoding==='gzip-bgra32')for(let i=0;i<raw.length;i+=4){const v=raw[i];raw[i]=raw[i+2];raw[i+2]=v;}pixels={width:tx.width,height:tx.height,format:28,levels:[raw]};}else pixels=await this.history.texture(catalog,id);return{pixels,sampler:{filter:tx.filterMode,wrapU:tx.wrapMode,wrapV:tx.wrapMode,anisotropy:tx.aniso,bias:tx.mipBias},st:[1,1,0,0]};})().then(value=>{if(this.textures.get(key)===entry){entry.size=value.pixels.levels[0].byteLength;this.textureBytes+=entry.size;for(const [oldKey,old] of this.textures){if(this.textureBytes<=this.textureLimit)break;if(oldKey!==key&&old.size){this.textures.delete(oldKey);this.textureBytes-=old.size;}}}return value;}).catch(error=>{if(this.textures.get(key)===entry)this.textures.delete(key);throw error;});this.textures.set(key,entry);return entry.promise;}
 async material(card,catalog,slot,native,race=false){
  if(slot.preserve==='material'||card.golden&&slot.preserve==='portrait')return native;
  const dynamic=!!slot.preserve||slot.preserveClassColors||slot.shader==='Custom/Card/UnlitTextureTint';let m=dynamic?cloneMaterial(native):{shader:slot.shader,keywords:[],values:{},textures:{}};
  m.shader=({'Hero/Unlit_TransparentColor':'Hero/Unlit/Unlit_TransparentColor','Hero/Multiply':'Hero/Multiply/Multiply'})[m.shader]||m.shader;
  if(!this.composer.shaders.has(m.shader)){if(native?.shader?.replaceAll('/','')===m.shader.replaceAll('/',''))m.shader=native.shader;else throw Error('Historical shader unavailable '+m.shader);}
  const classKey=originalClasses(card).slice().sort().join('+');let id=slot.texture;
  if(slot.classTextures){id=slot.classTextures[classKey];if(id==null&&card.kind==='WEAPON')id=slot.classTextures.NEUTRAL;if(id==null)throw Error('Historical class unavailable '+classKey);}
  const original=m.textures._MainTex,mark=m.textures._SecondTex,tint=m.values._tint;m.textures._MainTex=await this.texture(catalog,id,race);
  for(const property of slot.properties||[]){if(property.name==='_MainTex'&&slot.classTextures||slot.preserve==='portrait'&&property.name==='_MainTex'||slot.preserve==='watermark'&&property.name==='_SecondTex')continue;const tx=await this.texture(catalog,property.texture,race);m.textures[property.name]={...tx,st:[...property.scale,...property.offset]};}
  for(const [key,value] of Object.entries(slot.floats||{}))if(!(slot.preserveClassColors&&key==='_EnableDualClass'))m.values[key]=[value];
  for(const [key,value] of Object.entries(slot.colors||{}))if(!(slot.preserveClassColors&&['_Color','_FirstColor','_SecondColor'].includes(key))&&!(slot.preserve==='watermark'&&key==='_SecondTint'))m.values[key]=value;
  if(slot.classColors){const tint=slot.classColors[classKey]||(card.kind==='WEAPON'&&originalClasses(card).length===1?this.sources.frames.palette['CLASS_COLOR_'+(classKey==='NEUTRAL'?'GENERIC':classKey)]:null);if(!tint)throw Error('Historical class tint unavailable '+classKey);for(const k of ['_Color','_FirstColor','_SecondColor'])m.values[k]=tint;m.values._EnableDualClass=[0];}
  if(slot.preserve==='portrait'&&original)m.textures._MainTex=original;
  if(slot.preserve==='watermark'&&mark){const st=mark.st.slice();if(card.kind==='SPELL')st[3]=this.sources.frames.palette.descriptionMesh_WithoutRace_TextureOffset[0];m.textures._SecondTex={...mark,st};}
  if(slot.preserve==='rarity'&&original){m.textures._MainTex={...m.textures._MainTex,st:original.st};if(tint)m.values._tint=tint;}
  return m;
 }
 async apply(card,frame,catalogName,race=false){
  const catalog=typeof catalogName==='string'?await this.history.catalog(catalogName):catalogName,pack=catalog.packages.find(p=>p.kind===card.kind&&!!p.premium===!!card.golden);if(!pack)throw Error('Historical frame package unavailable');
  const prefab=this.sources.card(card.kind,card.golden).frame,originalPoses=new Map(prefab.nodes.map(n=>[rel(n.path),n.pose])),parts=frame.parts;
  for(const node of [...pack.nodes].sort((a,b)=>a.path.split('/').length-b.path.split('/').length)){
   if(node.legendary&&card.rarity!=='LEGENDARY'||race&&!node.mesh&&!node.meshKey||node.path.endsWith('UberText')||node.path.endsWith('CurvedText'))continue;
   const path=node.targetPath||node.path;
   const affected=parts.filter(p=>rel(p.path)===path||rel(p.path)===node.path);
   if(!affected.length){
    const empty=prefab.nodes.find(n=>rel(n.path)===path&&!n.mesh);
    if(empty&&node.meshKey&&node.slots?.length&&node.slots.every(s=>s.preserve==='trim')){
     const mesh=await this.history.mesh(catalog.edition||'2019',node.meshKey);
     for(const slot of node.slots){const native={shader:slot.shader,keywords:[],values:{},textures:{}};parts.push({path:empty.path,slot:slot.slot,mesh:this.meshGeometry(mesh,slot.slot),pose:Array.from(oldPose(node)),material:await this.material(card,catalog,slot,native),queue:slot.queue>=0?slot.queue:2000});}
    }
    continue;
   }
   const before=originalPoses.get(path)||originalPoses.get(node.path)||affected[0].pose;if(!before)throw Error('Historical node missing '+path);
   if(node.hideRendererOnly){for(const part of affected)parts.splice(parts.indexOf(part),1);continue;}
   let pose=Array.from(oldPose(node));if(race||node.preserveDepth)pose[13]=before[13];if(node.positionOnly){pose=Array.from(before);pose[12]=node.position[0];pose[14]=node.position[2];}
   let mesh=node.mesh;if(!mesh&&node.meshKey)mesh=await this.history.mesh(catalog.edition||'2019',node.meshKey);
   const delta=multiply(pose,inverse(affected[0].pose));for(const part of parts)if(rel(part.path)===path||rel(part.path).startsWith(path+'/'))part.pose=Array.from(multiply(delta,part.pose));
   for(const part of affected){part.pose=pose;if(mesh)part.mesh=this.meshGeometry(mesh,part.slot);const slot=(node.slots||[]).find(x=>x.slot===part.slot);if(slot){part.material=await this.material(card,catalog,slot,part.material,race);if(slot.queue>=0)part.queue=slot.queue;}}
  }
  if(race){const mana=pack.nodes.find(n=>n.positionOnly&&n.path.endsWith('/Gem_Mana'));for(const part of parts.filter(p=>rel(p.path)===mana?.path)){part.pose=part.pose.slice();part.pose[12]=mana.position[0];part.pose[14]=mana.position[2];}const gem=pack.nodes.find(n=>n.positionOnly&&n.path.endsWith('/RarityGem')),live=parts.find(p=>rel(p.path)===gem?.path);if(live){const dx=gem.position[0]-live.pose[12],dz=gem.position[2]-live.pose[14],owner=gem.path.slice(0,gem.path.lastIndexOf('/'));for(const p of parts.filter(p=>rel(p.path)===owner||rel(p.path).startsWith(owner+'/'))){p.pose=p.pose.slice();p.pose[12]+=dx;p.pose[14]+=dz;}}}
  parts.sort((a,b)=>a.queue-b.queue||(a.queue<2500?b.pose[13]-a.pose[13]:a.pose[13]-b.pose[13]));return frame;
 }
}
