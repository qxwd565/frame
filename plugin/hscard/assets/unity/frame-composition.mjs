import {originalClasses} from './hsplus-sources.mjs?ver=hscard-842a4736645303d0';

const classNames=['NEUTRAL','DEATHKNIGHT','DEMONHUNTER','DRUID','HUNTER','MAGE','PALADIN','PRIEST','ROGUE','SHAMAN','WARLOCK','WARRIOR'];
function reference(frame,key){const target=frame.actor?.[key]?.ref;if(!target)return null;const node=frame.nodes.find(n=>(n.componentSources||[]).includes(target));return node?.source||target;}
function findNode(prefab,ref){const key=ref?.ref;if(!key)throw Error('Missing original node reference');const found=prefab.nodes.filter(n=>n.source===key||(n.componentSources||[]).includes(key));if(found.length!==1)throw Error('Ambiguous original node reference');return found[0];}
function multiply(a,b){const f=Math.fround,out=new Array(16);for(let col=0;col<4;col++)for(let row=0;row<4;row++){let value=0;for(let k=0;k<4;k++)value=f(value+f(a[k*4+row]*b[col*4+k]));out[col*4+row]=value;}return out;}

export class FrameComposer {
  constructor(sources,portraitMeshes,fits,shaderLibrary,watermarks){this.sources=sources;this.portraits=portraitMeshes.variants;this.fits=fits.variants;this.shaders=new Map(shaderLibrary.shaders.map(s=>[s.name,s]));this.watermarks=watermarks.entries;}
  registerHistoricalShader(shader){if(!shader)return;const existing=this.shaders.get(shader.name);if(existing&&existing!==shader&&JSON.stringify(existing)!==JSON.stringify(shader))throw Error('Historical shader collision');if(!existing)this.shaders.set(shader.name,shader);}
  texture(key){const asset=this.sources.asset(key);if(asset.type!==28||!(asset.textureData||asset.textureFile))throw Error('Missing shared frame texture');return{key,sampler:asset.sampler,st:[1,1,0,0]};}
  watermark(name){
    if(!name||name==='NONE')return null;if(name==='HallOfFameIcon_Current')name='HallOfFameIcon';
    if(name!=='Set1_Icon'){
      const key=this.sources.frames.watermarks?.[name];if(key)return this.texture(key);
      const matching=this.sources.frames.assets.filter(a=>a.type===28&&a.name.toLowerCase()===name.toLowerCase());if(matching.length>1)throw Error('Ambiguous original watermark');if(matching.length)return this.texture(matching[0].key);
    }
    const item=this.watermarks[name];if(!item)return null;
    return{embedded:name,sampler:{filter:2,wrapU:1,wrapV:1,wrapW:1,anisotropy:1,bias:-.5},st:[1,1,0,0]};
  }
  queue(key,shaderName){
    const asset=key?this.sources.asset(key):null,custom=Number(asset?.properties?.m_CustomRenderQueue??-1);if(custom>=0)return custom;
    const shader=this.shaders.get(shaderName);if(!shader)throw Error('Missing original shader '+shaderName);
    const tag=shader.subshaders[0].tags?.tags?.find(t=>t.Key.toLowerCase()==='queue')?.Value||'Geometry',m=/^(Background|Geometry|AlphaTest|Transparent|Overlay)([+-]\d+)?$/.exec(tag);
    if(!m)throw Error('Unsupported original render queue '+tag);return{Background:1000,Geometry:2000,AlphaTest:2450,Transparent:3000,Overlay:4000}[m[1]]+Number(m[2]||0);
  }
  compose(card){
    const {frame}=this.sources.card(card.kind,card.golden), selected=this.sources.baseFrameNodes(card), classes=originalClasses(card), dual=classes.length===2,primary=classes.length>2?'NEUTRAL':classes[0];
    const index=classNames.indexOf(primary);if(index<0)throw Error('Unsupported original class');
    const kind={MINION:'minion',SPELL:'spell',WEAPON:'weapon',HERO:'hero',LOCATION:'location'}[card.kind];
    const classKey=this.sources.frames.colors[kind+'CardTextures']?.[index+(dual?11:0)];if(!classKey)throw Error('Missing original class texture');
    const color=this.texture(classKey),secondIndex=classNames.indexOf(classes[1]),second=dual?this.texture(this.sources.frames.colors[kind+'CardTextures']?.[secondIndex+11]):null;
    const cardMesh=reference(frame,'m_cardMesh'),description=reference(frame,'m_descriptionMesh'),gem=reference(frame,'m_rarityGemMesh'),noGem=reference(frame,'m_rarityNoGemMesh');
    const shared=this.portraits[card.kind+':'+(card.golden?'golden':'normal')];if(!shared)throw Error('Missing original portrait frame');
    const fit=this.fits[[card.kind,card.golden?'golden':'normal',card.rarity==='LEGENDARY'?'legendary':'ordinary'].join(':')];if(!fit)throw Error('Missing original card projection');
    const tags=card.tags||{},factionTags=[482,484,483,3457,3458,3469],faction=factionTags.findIndex(x=>Number(tags[x]||0))+1,overrides=new Map();
    const root=frame.nodes.flatMap(n=>n.components||[]).find(c=>Object.hasOwn(c,'m_runeSlotVisuals'));
    if(root){const runes=[];for(let type=1;type<=3;type++)for(let n=0;n<Number(tags[2195+type]||0);n++)runes.push(type);
      const chosen=root.m_runeSlotVisuals.Array[runes.length-1];if(chosen){const owner=findNode(frame,chosen),layout=(owner.components||[]).find(c=>c.m_GameObject?.ref===owner.source&&Object.hasOwn(c,'m_deckRuneSlots'));if(!layout)throw Error('Missing original rune layout');
        let at=0;for(const ref of layout.m_deckRuneSlots.Array){const slot=(findNode(frame,ref).components||[]).find(c=>Object.hasOwn(c,'m_runeAssetTable'));if(!slot)throw Error('Missing original rune slot');const type=runes[at++]||0;const material=type?slot.m_runeAssetTable.Array.find(x=>Number(x.m_assetRuneType)===type)?.m_runeMaterial:slot.m_runeMaterialEmpty;if(!material?.ref)throw Error('Missing original rune material');overrides.set(findNode(frame,slot.m_runeRenderer).source,material.ref);}
      }
    }
    const parts=[];
    for(const item of selected){
      let node=frame.nodes.find(n=>n.path===item.path),container=null,prefab=frame;
      if(!node){container=frame.nodes.find(n=>n.nestedPrefab&&item.path.startsWith(n.path+'/'));if(!container)throw Error('Missing original frame node');prefab=this.sources.framePrefabs.get(container.nestedPrefab);node=prefab.nodes.find(n=>container.path+'/'+n.path===item.path);if(!node)throw Error('Missing original attachment node');}
      let materialKey=overrides.get(node.source)||node.materials[item.slot];
      if(container?.nestedPrefab==='Faction_Banner'&&faction){const component=prefab.nodes.flatMap(n=>n.components||[]).find(c=>Object.hasOwn(c,'m_factionIconRef'));if(!component)throw Error('Missing faction bindings');if(findNode(prefab,component.m_factionIconRef).source===node.source)materialKey=this.sources.frames.colors.factionIconMaterials[faction];if(findNode(prefab,component.m_factionBannerRef).source===node.source)materialKey=this.sources.frames.colors.factionBannerMaterials[faction];}
      const portrait=node.path.endsWith('/PortraitFrame_mesh')?shared.parts.find(p=>p.slot===item.slot):null;
      let material;
      const goldenArtwork=portrait?.element==='artwork'&&card.golden&&card.goldenPortrait;
      if(goldenArtwork){
        material={...goldenArtwork,values:{...goldenArtwork.values},textures:{...goldenArtwork.textures}};
      }else if(portrait?.element==='artwork'){
        // Use the same original portrait mesh/material with a neutral blank
        // texture. It masks underlying atlas fragments without retaining art.
        if(!portrait.material)throw Error('Missing original blank portrait material');
        material={shader:portrait.material.shader,keywords:portrait.material.keywords,values:structuredClone(portrait.material.values),textures:{}};
        for(const [key,t] of Object.entries(portrait.material.textures)){
          material.textures[key]=t.blank?{pixels:card.artPixels||{width:1,height:1,format:28,levels:[new Uint8Array([255,255,255,255])]},sampler:t.sampler,st:[...t.st]}:{key:t.key,sampler:t.sampler,st:[...t.st]};
        }
        if(!material.textures._MainTex)throw Error('Missing original portrait texture binding');
      }else material=this.sources.material(materialKey);
      if(!goldenArtwork)material.values._LightingBlend=[0];
      if(!card.golden&&(node.source===cardMesh&&item.slot===Number(frame.actor.m_cardFrontMatIdx)||card.kind==='LOCATION'&&node.source===noGem||portrait&&item.slot===Number(frame.actor.m_portraitFrameMatIdx)&&(card.kind==='SPELL'||card.kind==='WEAPON'&&card.cardClass==='DEATHKNIGHT'))){material.textures._MainTex=structuredClone(color);material.values._EnableDualClass=[dual?1:0];if(dual)material.textures._SecondTex=structuredClone(second);}
      if(card.golden&&node.source===cardMesh&&item.slot===Number(frame.actor.m_premiumRibbon)){
        const prefix=!dual&&card.kind==='LOCATION'?'CLASS_COLOR_LOCATION_':'CLASS_COLOR_';material.values._Color=this.sources.frames.palette[prefix+(primary==='NEUTRAL'?'GENERIC':primary)];material.values._EnableDualClass=[dual?1:0];if(dual)material.values._SecondColor=this.sources.frames.palette['CLASS_COLOR_'+(classes[1]==='NEUTRAL'?'GENERIC':classes[1])];
      }
      if(node.source===gem){const rarity=['RARE','EPIC','LEGENDARY'].includes(card.rarity)?card.rarity:'COMMON',offset=this.sources.frames.palette['GEM_TEXTURE_OFFSET_'+rarity];if(!material.textures._MainTex||!offset)throw Error('Missing original rarity gem');material.textures._MainTex.st[2]=offset[0];material.textures._MainTex.st[3]=offset[1];material.values._tint=this.sources.frames.palette['GEM_COLOR_'+rarity];}
      if(node.source===description){
        const set=card.watermark||(card.set==='CORE'?this.sources.frames.coreWatermark:Number(tags[183]||0)>0?String(tags[183]):card.set),mark=this.watermark(set);
        if(mark){mark.st=material.textures._SecondTex?[...material.textures._SecondTex.st]:[1,1,0,0];mark.st[3]=this.sources.frames.palette[(card.kind==='WEAPON'||card.kind==='LOCATION'||card.race||card.school)?'descriptionMesh_WithRace_TextureOffset':'descriptionMesh_WithoutRace_TextureOffset'][0];material.textures._SecondTex=mark;}
        if(material.values._SecondTint){material.values._SecondTint=[...material.values._SecondTint];material.values._SecondTint[3]=!mark||Number(tags[1107]||0)?0:this.sources.frames.palette.WATERMARK_ALPHA_VALUE[0];}
      }
      let meshKey=node.mesh;
      if(node.source===description&&card.kind==='SPELL')meshKey=reference(frame,card.school?'m_spellDescriptionMeshSchool':'m_spellDescriptionMeshNeutral')||meshKey;
      const mesh=portrait?{encoded:portrait.mesh,sha256:portrait.sha256}:node.particleFrame?{encoded:node.particleFrame.meshData,gzip:true}:{key:meshKey,slot:item.slot};
      const pose=portrait?portrait.pose:node.particleFrame?node.particleFrame.pose:container?multiply(container.pose,node.pose):node.pose;
      if(!pose||pose.length!==16)throw Error('Missing original frame pose');
      parts.push({path:item.path,slot:item.slot,mesh,material,pose,queue:this.queue(goldenArtwork?null:materialKey,material.shader),watermark:node.source===description,blank:portrait?.element==='artwork'});
    }
    parts.sort((a,b)=>a.queue-b.queue||(a.queue<2500?b.pose[13]-a.pose[13]:a.pose[13]-b.pose[13]));
    return {fit,parts};
  }
}
