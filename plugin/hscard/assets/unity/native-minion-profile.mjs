import {resourceFetch} from './resource-url.mjs?ver=hscard-a7d0db14c9c42020';
import {selectTextureVariant,loadTextureVariant} from './native-texture-history.mjs?ver=hscard-a7d0db14c9c42020';
// Native minion fronts: an original base plus dated component changes.
const blankPixels={width:1,height:1,format:28,levels:[new Uint8Array([255,255,255,255])]};

async function json(base,descriptor){
 const name=typeof descriptor==='string'?descriptor:descriptor.file;
 const response=await resourceFetch(new URL(name,base),{credentials:'same-origin'});
 if(!response.ok)throw Error('Native minion profile HTTP '+response.status);
 const bytes=await response.arrayBuffer();
 if(typeof descriptor!=='string'){
  const hash=Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256',bytes)),b=>b.toString(16).padStart(2,'0')).join('');
  if(bytes.byteLength!==descriptor.bytes||hash!==descriptor.sha256)throw Error('Native minion profile integrity failure');
 }
 return name.endsWith('.gz')?new Response(new Blob([bytes]).stream().pipeThrough(new DecompressionStream('gzip'))).json():JSON.parse(new TextDecoder().decode(bytes));
}

export function applyComponentChanges(base,patch){
 if(patch.schema!==1||patch.baseVersion!==base.version||!Array.isArray(patch.operations))throw Error('Invalid native component update');
 const data={...base};
 for(const op of patch.operations){
  if(!Array.isArray(op.path)||!op.path.length||op.path.some(k=>typeof k!=='string'||['__proto__','constructor','prototype'].includes(k)))throw Error('Invalid native component path');
  let target=data;
  for(const key of op.path.slice(0,-1)){if(!Object.hasOwn(target,key)||target[key]===null||typeof target[key]!=='object')throw Error('Missing native base component');target[key]=Array.isArray(target[key])?target[key].slice():{...target[key]};target=target[key];}
  const key=op.path.at(-1);if(op.remove)delete target[key];else target[key]=structuredClone(op.value);
 }
 if(data.version!==patch.version)throw Error('Native component version mismatch');
 return data;
}

export class NativeMinionProfile {
 static async load(adapter,builder,renderer,version){
  const base=adapter.history.base;
  if(!adapter.nativeArchive)adapter.nativeArchive=json(base,'native-minion-profiles.json?rev=beta-3664-1').catch(error=>{adapter.nativeArchive=null;throw error;});
  const manifest=await adapter.nativeArchive;
  if(manifest.schema!==1)throw Error('Invalid native minion manifest');
  adapter.nativeData??=new Map();
  const load=(id,parents=[])=>{
   if(parents.includes(id))throw Error('Cyclic native component update');
   if(!adapter.nativeData.has(id))adapter.nativeData.set(id,(async()=>{
    const entry=manifest.profiles.find(p=>p.version===id);if(!entry)throw Error('Native minion version unavailable');
    const document=await json(base,entry);
    return entry.baseVersion?applyComponentChanges(await load(entry.baseVersion,[...parents,id]),document):document;
   })().catch(error=>{adapter.nativeData.delete(id);throw error;}));
   return adapter.nativeData.get(id);
  };
  const data=await load(version);
  if(data.schema!==1||data.version!==version||data.packages.length!==2)throw Error('Invalid native minion profile');
  {
   if(!adapter.betaShaderBank)adapter.betaShaderBank=json(base,'native-beta-shaders.json.gz').catch(error=>{adapter.betaShaderBank=null;throw error;});
   const bank=await adapter.betaShaderBank;
   if(bank.schema!==1||!Array.isArray(bank.shaders)||!bank.programs)throw Error('Invalid beta shader bank');
   renderer.extraPrograms??=new Map();
   if(version==='1.0.0.3664'){
    if(!adapter.native3664ShaderBank)adapter.native3664ShaderBank=json(base,'native-3664-card-shaders.json.gz').catch(error=>{adapter.native3664ShaderBank=null;throw error;});
    const extra=await adapter.native3664ShaderBank;
    if(extra.schema!==1||extra.sourceVersion!==version||extra.shaders.length!==14)throw Error('Invalid original 3664 shader bank');
    for(const shader of extra.shaders)builder.shaders.set(shader.name,shader);
    for(const [id,program] of Object.entries(extra.programs))renderer.extraPrograms.set(id,program);
   }
   const byName=new Map(bank.shaders.map(shader=>[shader.name,shader]));
   for(const shader of bank.shaders)builder.shaders.set(shader.name,shader);
   for(const [id,program] of Object.entries(bank.programs))renderer.extraPrograms.set(id,program);
   const materials={};
   for(const [key,material] of Object.entries(data.materials)){
    const shader=byName.get(material.shader),queue=shader?.subshaders?.[0]?.tags?.tags?.find(x=>x.Key==='Queue')?.Value;
    const queues={Background:1000,Geometry:2000,AlphaTest:2450,Transparent:3000,Overlay:4000};
    if(!(queue in queues))throw Error('Original shader queue unavailable: '+material.shader);
    materials[key]={...material,queue:material.queue>=0?material.queue:queues[queue]};
   }
   return new NativeMinionProfile(adapter,{...data,materials},{shaders:bank.shaders});
  }
 }
 constructor(adapter,data,library){
  Object.assign(this,{adapter,data,library});this.fontLoads=new WeakMap();
  this.catalog={edition:data.version,textures:Object.entries(data.textures).map(([id,tx])=>({id,...tx,encoding:tx.encoding||'webp-rgba32-planes',filterMode:tx.sampler.m_FilterMode,wrapMode:tx.sampler.m_WrapMode,aniso:tx.sampler.m_Aniso,mipBias:tx.sampler.m_MipBias}))};
 }
 package(card){return this.data.packages.find(p=>p.golden===!!card.golden);}
 async texture(key,card,material,property){
  const date=String(card.renderDate||'');
  // The 4217 cloud texture is safe with these two 3890 materials: both source
  // material hashes and the executable D3D11 shader programs were compared.
  // Later client combinations are not inferred from this beta evidence.
  if(key==='clouds7'&&property==='_ReflTex'&&date>='2013-12-12'&&date<='2014-03-13'){
   const adapter=this.adapter;
   if(!adapter.textureHistory)adapter.textureHistory=json(adapter.history.base,'texture-history/index.json').catch(error=>{adapter.textureHistory=null;throw error;});
   const history=await adapter.textureHistory, proof=history.clouds7Compatibility;
   if(!proof?.materials?.some(row=>row.material===material.name)||!proof.d3d11Programs?.length)throw Error('Unverified native texture combination');
   const row=selectTextureVariant(history,key,date);
   if(row?.version==='1.0.0.4217'){
    adapter.textureHistoryEntries??=new Map();
    if(!adapter.textureHistoryEntries.has(row.file))adapter.textureHistoryEntries.set(row.file,loadTextureVariant(adapter.history.base,row).catch(error=>{adapter.textureHistoryEntries.delete(row.file);throw error;}));
    return adapter.textureHistoryEntries.get(row.file);
   }
  }
  return this.adapter.texture(this.catalog,key);
 }
 async ensureFonts(raster){
  if(!this.fontLoads.has(raster))this.fontLoads.set(raster,json(this.adapter.history.base,this.data.fonts).then(archive=>raster.register(archive,this.data.fontSettings)).catch(error=>{this.fontLoads.delete(raster);throw error;}));
  return this.fontLoads.get(raster);
 }
 textConfiguration(card,role,sources){
  const row=this.data.texts[this.package(card).name][role];if(!row)return null;
  const current=row.useCurrentFont?sources.textConfiguration(card.kind,card.golden,role):null;
  // Font-definition modifiers belong to the selected Korean font, while the
  // native text object's position, box, size and line spacing stay unchanged.
  const modifiers=current?Object.fromEntries(Object.entries(current.settings).filter(([key])=>key.endsWith('Modifier')||key==='m_SingleLineAdjustment')):{};
  return{...row,font:current?.font||row.font,settings:{...row.settings,...modifiers,nativeLayout:true},nativeMesh:row.mesh?this.adapter.meshGeometry(this.data.meshes[row.mesh],0):null};
 }
 async compose(card,composer){
  const p=this.package(card),d=p.dynamic,cls=card.cardClass||'NEUTRAL',classTexture=this.data.classes[cls];
  if(!classTexture)throw Error('Native minion class unavailable');
  const pending=[],rarity=card.rarity||'FREE',hasGem=['COMMON','RARE','EPIC','LEGENDARY'].includes(rarity);
  for(const node of p.nodes){
   if(node.legendary&&rarity!=='LEGENDARY'||node.path===d.m_racePlateObject&&!card.race)continue;
   if(!hasGem&&(node.path===d.m_rarityGemMesh||node.path===d.m_rarityFrameMesh))continue;
   for(const slot of node.slots)pending.push((async()=>{
    const original=this.data.materials[slot.material],blank=node.path===d.m_portraitMesh&&slot.slot===p.actor.m_portraitMatIdx,watermark=node.path===d.m_descriptionMesh;
    let material={shader:original.shader,keywords:[...original.keywords],values:structuredClone(original.values),textures:{}};
    const classFront=!card.golden&&node.path===d.m_cardMesh&&slot.slot===p.actor.m_cardFrontMatIdx;
    // Parts are independent. Start their shared texture requests together,
    // then retain the authored part/property order regardless of completion.
    material.textures=Object.fromEntries(await Promise.all(Object.entries(original.textures).map(async([name,tx])=>[
     name,blank&&name==='_MainTex'?{pixels:card.artPixels||blankPixels,sampler:{filter:1,wrapU:1,wrapV:1},st:tx.st.slice()}:
      {...await this.texture(classFront&&name==='_MainTex'?classTexture:tx.key,card,original,name),st:tx.st.slice()}
    ])));
    if(blank&&card.golden&&card.goldenPortrait)material={...card.goldenPortrait,values:{...card.goldenPortrait.values},textures:{...card.goldenPortrait.textures}};
    if(card.golden&&node.path===d.m_cardMesh&&slot.slot===p.actor.m_premiumRibbon)material.values._Color=this.data.palette['CLASS_COLOR_'+(cls==='NEUTRAL'?'GENERIC':cls)];
    if(node.path===d.m_rarityGemMesh){
     const offset=this.data.palette['GEM_TEXTURE_OFFSET_'+rarity];
     material.textures._MainTex.st.splice(2,2,...offset);material.values._tint=this.data.palette['GEM_COLOR_'+rarity];
    }
    if(watermark){
     const name=card.watermark||card.set,mark=name&&name!=='NONE'?composer.watermark(name):null;
     const classic=['EXPERT1','LEGACY','Set1_Icon'].includes(name),enabled=classic||!!mark;
     if(mark&&!classic)material.textures._SecondTex={...mark,st:material.textures._SecondTex.st.slice()};
     if(material.textures._SecondTex)material.textures._SecondTex.st.splice(2,2,-.04,card.race?0:.07);
     if(material.values._SecondTint)material.values._SecondTint[3]=enabled?.7734375:0;
    }
    const queue=original.queue;
    if(!Number.isFinite(queue)||queue<0)throw Error('Native frame queue unavailable '+original.shader);
    return{path:node.path,slot:slot.slot,mesh:this.adapter.meshGeometry(this.data.meshes[node.mesh],slot.slot),pose:node.pose,material,queue,blank,watermark};
   })());
  }
  const parts=await Promise.all(pending);
  parts.sort((a,b)=>a.queue-b.queue||(a.queue<2500?b.pose[13]-a.pose[13]:a.pose[13]-b.pose[13]));
  const fit=composer.fits['MINION:'+(card.golden?'golden':'normal')+':'+(rarity==='LEGENDARY'?'legendary':'ordinary')];
  return{fit,parts,nativeVersion:this.data.version};
 }
}
