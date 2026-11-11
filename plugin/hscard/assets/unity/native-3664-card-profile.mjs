import {resourceFetch} from './resource-url.mjs?ver=hscard-a7d0db14c9c42020';
import {NativeMinionProfile} from './native-minion-profile.mjs?ver=hscard-a7d0db14c9c42020';

async function loadJson(base,name){
 const response=await resourceFetch(new URL(name,base));
 if(!response.ok)throw Error('Original 3664 card resource HTTP '+response.status);
 return new Response(response.body.pipeThrough(new DecompressionStream('gzip'))).json();
}

/** 3664 PC spell and weapon graphs. All texture bindings use source DXT data. */
export class Native3664CardProfile extends NativeMinionProfile {
 static async load(adapter,builder,renderer){
  const base=adapter.history.base;
  if(!adapter.native3664ShaderBank)adapter.native3664ShaderBank=loadJson(base,'native-3664-card-shaders.json.gz').catch(error=>{adapter.native3664ShaderBank=null;throw error;});
  const [data,common,extra]=await Promise.all([
   loadJson(base,'card-3664-spell-weapon.json.gz'),
   loadJson(base,'native-beta-shaders.json.gz'),
   adapter.native3664ShaderBank
  ]);
  if(data.schema!==1||data.version!=='1.0.0.3664'||data.packages.length!==4||common.schema!==1||extra.schema!==1||extra.shaders.length!==14)throw Error('Invalid original 3664 card profile');
  const shaders=[...common.shaders,...extra.shaders],byName=new Map(shaders.map(shader=>[shader.name,shader]));
  renderer.extraPrograms??=new Map();
  for(const shader of shaders)builder.shaders.set(shader.name,shader);
  for(const bank of [common,extra])for(const [id,program] of Object.entries(bank.programs))renderer.extraPrograms.set(id,program);
  const queues={Background:1000,Geometry:2000,AlphaTest:2450,Transparent:3000,Overlay:4000},materials={};
  for(const [key,material] of Object.entries(data.materials)){
   const shader=byName.get(material.shader),queue=shader?.subshaders?.[0]?.tags?.tags?.find(x=>x.Key==='Queue')?.Value;
   if(!(queue in queues))throw Error('Original shader queue unavailable: '+material.shader);
   materials[key]={...material,queue:material.queue>=0?material.queue:queues[queue]};
  }
  return new Native3664CardProfile(adapter,{...data,materials},{shaders});
 }
 package(card){
  const value=this.data.packages.find(p=>p.kind===card.kind&&p.golden===!!card.golden);
  if(!value)throw Error('Original 3664 card package unavailable: '+card.kind);
  return value;
 }
 async compose(card,composer){
  const p=this.package(card),d=p.dynamic,cls=card.cardClass||'NEUTRAL',classTexture=this.data.classes[card.kind]?.[cls];
  if(!classTexture)throw Error('Original 3664 class texture unavailable: '+card.kind+' '+cls);
  const rarity=card.rarity||'FREE',hasGem=['COMMON','RARE','EPIC','LEGENDARY'].includes(rarity),pending=[];
  for(const node of p.nodes){
   if(!hasGem&&[d.m_rarityGemMesh,d.m_rarityFrameMesh].some(path=>path&&(node.path===path||node.path.startsWith(path+'/'))))continue;
   for(const slot of node.slots)pending.push((async()=>{
    const original=this.data.materials[slot.material],blank=node.path===d.m_portraitMesh&&slot.slot===p.actor.m_portraitMatIdx,watermark=node.path===d.m_descriptionMesh;
    let material={shader:original.shader,keywords:[...original.keywords],values:structuredClone(original.values),textures:{}};
    const classFront=!card.golden&&/^Card_Inhand_(?:Ability_|Weapon_)?Warlock(?:_transparent)?$/i.test(original.name);
    material.textures=Object.fromEntries(await Promise.all(Object.entries(original.textures).map(async([name,tx])=>[
     name,blank&&name==='_MainTex'?{pixels:card.artPixels||{width:1,height:1,format:28,levels:[new Uint8Array([255,255,255,255])]},sampler:{filter:1,wrapU:1,wrapV:1},st:tx.st.slice()}:
      {...await this.texture(classFront&&name==='_MainTex'?classTexture:tx.key,card,original,name),st:tx.st.slice()}
    ])));
    if(blank&&card.golden&&card.goldenPortrait)material={...card.goldenPortrait,values:{...card.goldenPortrait.values},textures:{...card.goldenPortrait.textures}};
    if(card.golden&&node.path===d.m_cardMesh&&slot.slot===p.actor.m_premiumRibbon)material.values._Color=this.data.palette['CLASS_COLOR_'+(cls==='NEUTRAL'?'GENERIC':cls)];
    if(node.path===d.m_rarityGemMesh){
     const offset=this.data.palette['GEM_TEXTURE_OFFSET_'+rarity];
     if(offset&&material.textures._MainTex)material.textures._MainTex.st.splice(2,2,...offset);
     if(this.data.palette['GEM_COLOR_'+rarity])material.values._tint=this.data.palette['GEM_COLOR_'+rarity];
    }
    if(watermark&&material.textures._SecondTex){
     const name=card.watermark||card.set,mark=name&&name!=='NONE'?composer.watermark(name):null,classic=['EXPERT1','LEGACY','Set1_Icon'].includes(name),enabled=classic||!!mark;
     if(mark&&!classic)material.textures._SecondTex={...mark,st:material.textures._SecondTex.st.slice()};
     material.textures._SecondTex.st.splice(2,2,-.04,card.race?0:.07);
     if(material.values._SecondTint)material.values._SecondTint[3]=enabled?.7734375:0;
    }
    if(!Number.isFinite(original.queue)||original.queue<0)throw Error('Native frame queue unavailable '+original.shader);
    return{path:node.path,slot:slot.slot,mesh:this.adapter.meshGeometry(this.data.meshes[node.mesh],slot.slot),pose:node.pose,material,queue:original.queue,blank,watermark};
   })());
  }
  const parts=await Promise.all(pending);
  parts.sort((a,b)=>a.queue-b.queue||(a.queue<2500?b.pose[13]-a.pose[13]:a.pose[13]-b.pose[13]));
  const fit=composer.fits[card.kind+':'+(card.golden?'golden':'normal')+':'+(rarity==='LEGENDARY'?'legendary':'ordinary')];
  if(!fit)throw Error('Original card frame fit unavailable: '+card.kind);
  return{fit,parts,nativeVersion:this.data.version};
 }
}
