import {originalClasses} from './hsplus-sources.mjs?ver=hscard-13b870ed5737dccf';
import {HistoricalAdapter,historicalSelection} from './historical-adapter.mjs?ver=hscard-13b870ed5737dccf';
import {fitText,textValues} from './dynamic-layout.mjs?ver=hscard-13b870ed5737dccf';
import {composeGlyphs} from './glyph-layout.mjs?ver=hscard-13b870ed5737dccf';
import {multiply} from './native-draw-builder.mjs?ver=hscard-13b870ed5737dccf';
import {cardSceneContext,quantityRibbonPart} from './quantity-ribbon.mjs?ver=hscard-13b870ed5737dccf';
import {ArtworkAnimation} from './artwork-animation.mjs?ver=hscard-13b870ed5737dccf';
const f=Math.fround;
const identity=()=>[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
function color(value){return [Number(value.r),Number(value.g),Number(value.b),Number(value.a)];}
function quadGroup(quads){const p=new Float32Array(quads.length*16),c=new Float32Array(quads.length*16).fill(1),uv=new Float32Array(quads.length*16),indices=new Uint32Array(quads.length*6);for(let i=0;i<quads.length;i++){const [l,b,r,t]=quads[i].position,[u0,v0,u1,v1]=quads[i].uv;p.set([l,b,0,1,r,b,0,1,r,t,0,1,l,t,0,1],i*16);uv.set([u0,v0,0,0,u1,v0,0,0,u1,v1,0,0,u0,v1,0,0],i*16);indices.set([i*4,i*4+2,i*4+1,i*4,i*4+3,i*4+2],i*6);}return{attributes:new Map([['POSITION0',p],['COLOR0',c],['TEXCOORD0',uv]]),indices};}
function plane(width,height,settings,palette){
  const positions=new Float32Array([-width/2,0,-height/2,1,width/2,0,-height/2,1,-width/2,0,height/2,1,width/2,0,height/2,1]),uvs=palette.TEXT_PLANE_UVS,uv=new Float32Array(16),normal=new Float32Array(16);
  for(let i=0;i<4;i++){uv[i*4]=uvs[i*2];uv[i*4+1]=uvs[i*2+1];normal[i*4+1]=1;}
  const attributes=new Map([['POSITION0',positions],['TEXCOORD0',uv],['NORMAL0',normal]]),upper=color(settings.m_GradientUpperColor),lower=color(settings.m_GradientLowerColor);
  if([...upper,...lower].some(x=>x!==0))attributes.set('COLOR0',new Float32Array([...upper,...upper,...lower,...lower]));
  return{attributes,indices:new Uint32Array(palette.TEXT_PLANE_TRIANGLES)};
}
function ortho(left,bottom,width,height){return[f(2/width),0,0,0,0,f(2/height),0,0,0,0,1,0,f(-1-f(f(2*left)/width)),f(-1-f(f(2*bottom)/height)),.5,1];}
function glyphMaterial(q,settings,atlas){
  const n=(key,fallback=1)=>Number(settings[key]??fallback),localized=settings.m_LocalizedSettings?.m_LocaleAdjustments?.Array?.find(x=>Number(x.m_Locale)===4),localeOutline=Number(localized?.m_OutlineModifier??1),outline=f(f(n('m_OutlineSize')*n('m_OutlineModifier'))*localeOutline),bold=n('m_BoldSize'),outlined=!!settings.m_Outline;
  const values={_Color:q.color,_LightingBlend:[n('m_AmbientLightBlend',0)],_OutlineColor:color(settings.m_OutlineColor)};
  for(const [name,value] of [['_BoldOffset',bold],['_OutlineOffset',outlined?f(outline+(q.material?f(bold*.75):0)):outline],['_TexelSize',1]]){values[name+'X']=[f(value/atlas.width)];values[name+'Y']=[f(value/atlas.height)];}
  return{shader:outlined?(q.material?'Hidden/TextBoldOutline_Unlit':'Hidden/TextOutline_Unlit'):(q.material?'Hidden/Text_Bold':'Hero/Text_Unlit'),keywords:[],values,textures:{_MainTex:{pixels:atlas,sampler:{filter:1,wrapU:1,wrapV:1,wrapW:1},st:[1,1,0,0]}}};
}
// Loading and completed content come from one resolved dated specification.
// A changed frame signature requires a new user selection, never a content fill.
function frameStructureSignature(card){
 const tags=card.tags||{},ids=[482,483,484,1720,2196,2197,2198,2785,3457,3458,3469,4354];
 return JSON.stringify([card.kind,originalClasses(card),card.golden,card.rarity,card.frameProfile,card.textProfile||'',card.renderDate,card.race,card.school,card.attack>0,card.armor>0,...ids.map(id=>Number(tags[id]||0))]);
}
function frameSignature(card){const tags=card.tags||{};return JSON.stringify([frameStructureSignature(card),card.watermark,card.set,Number(tags[183]||0),Number(tags[1107]||0)]);}
export class WebGPUCardRenderer {
  constructor({sources,composer,builder,renderer,raster,nameMeshes,layouts,variantLayouts}){Object.assign(this,{sources,composer,builder,renderer,raster,nameMeshes,layouts,variantLayouts});}
  async prepare(card,basePrepared=null){
    const textTargets=[],transientMeshes=[],transientTextures=[];
    try{
    if(basePrepared && basePrepared.frameSignature!==frameSignature(card))throw Error('Cannot fill a different native frame');
    if(card.frameProfile && !['current','historical'].includes(card.frameProfile))throw Error('Missing original frame resources for '+card.frameProfile);
    const selection=card.frameProfile==='historical'?historicalSelection(card):null;
    const textProfile=card.textProfile||selection?.textProfile||null;
    if(card.textProfile && (card.kind!=='MINION'||!/^ios-[0-9.]+-minion$/.test(card.textProfile)))throw Error('Unsupported explicit native text profile');
    const renderCard=selection?.hideSchool?{...card,school:''}:card;
    this.composer.registerHistoricalShader(card.goldenPortrait?.historicalShader);
    this.renderer.registerHistoricalPrograms(card.goldenPortrait?.historicalPrograms);
    const fillArtwork=base=>({...base,parts:base.parts.map(part=>{
      if(!part.blank)return part;
      const portrait=card.golden&&card.goldenPortrait;
      const material=portrait?{...portrait,values:{...portrait.values},textures:{...portrait.textures}}:
        {...part.material,textures:Object.fromEntries(Object.entries(part.material.textures).map(([name,texture])=>
          [name,texture.pixels===basePrepared.portraitPixels?{...texture,pixels:card.artPixels}:texture]))};
      return {...part,material,queue:portrait&&!nativeProfile?this.composer.queue(null,material.shader):part.queue};
    })});
    let historical=null,nativeProfile=null;
    if(selection||textProfile){
      if(!this.historicalPromise)this.historicalPromise=HistoricalAdapter.create(this.sources,this.composer).catch(error=>{this.historicalPromise=null;throw error;});
      historical=await this.historicalPromise;
      if(selection?.nativeProfile)nativeProfile=await historical.nativeProfile(this.builder,this.renderer,selection.nativeProfile,selection.nativeKind);
    }
    // A fill never composes a second frame. Geometry, UVs, class texture,
    // rarity and historical parts remain those already on screen.
    let frame=basePrepared?fillArtwork(basePrepared.frame):nativeProfile?await nativeProfile.compose(renderCard,this.composer):this.composer.compose(renderCard);
    if(nativeProfile)frame.sourceEvidence=selection.evidence;
    if(card.goldenPortrait){
      try{for(const part of frame.parts.filter(p=>p.blank)){
        const trial={...part,material:{...part.material,values:new ArtworkAnimation(part.material).sample(0)}};
        for(const draw of await this.builder.draw(trial,{...cardSceneContext(frame.fit,card.quantity),time:0})){
          await this.renderer.pipeline(draw);
          for(const binding of [...draw.vertexTextures,...draw.fragmentTextures])this.renderer.uploadTexture(binding.texture.pixels,binding.srgb);
        }
      }}catch(error){
        // Golden animation fidelity is mandatory; never silently downgrade to a still portrait.
        throw new Error('Required golden WebGPU shader failed: '+String(error?.message||error),{cause:error});
      }
    }
    if(selection){
      if(selection?.catalog&&!basePrepared)await historical.apply(renderCard,frame,selection.catalog,selection.raceLayout);
      if(selection?.component&&!basePrepared){const component=await historical.component('frames',selection.component);if(!component)throw Error('Missing historical component '+selection.component);await historical.apply(renderCard,frame,component.catalog);}
    }
    const artwork=frame.parts.find(p=>p.blank&&p.material.animation);
    const animation=artwork?new ArtworkAnimation(artwork.material):null;
    const goldenPixels=card.goldenPortrait?new Set(frame.parts.filter(p=>p.blank).flatMap(p=>Object.values(p.material.textures).map(t=>t.pixels).filter(x=>x!==card.artPixels&&x))):new Set();
    if(nativeProfile&&!card.loading)await nativeProfile.ensureFonts(this.raster);
    const roles={},configs={};for(const [role,value] of Object.entries(card.loading?{}:textValues(renderCard))){if(value===undefined||value===null||value==='')continue;const textPrefab=this.sources.card(card.kind,card.golden).text;if(!textPrefab.bindings.some(x=>x.role===role))continue;let config=nativeProfile?nativeProfile.textConfiguration(renderCard,role,this.sources):historical&&selection?.edition?await historical.textConfiguration(renderCard,selection.edition,role):this.sources.textConfiguration(card.kind,card.golden,role);if(historical&&textProfile)config=await historical.profileText(renderCard,textProfile,role,config,!!card.textProfile);if(!config)continue;const fit=fitText(value,config.settings,this.raster.metrics(config.font),role);if(fit){roles[role]=fit;configs[role]=config;}}
    const context=cardSceneContext(frame.fit,card.quantity),textDraws=[];
    for(const [role,fit] of Object.entries(roles)){
      const config=configs[role],s=config.settings,glyph=composeGlyphs(this.raster,config.font,fit,s),atlas={width:glyph.width,height:glyph.height,format:65,levels:[glyph.atlas]},toTexture=!!s.m_RenderToTexture;
      transientTextures.push(atlas);
      let local=context,pose=config.binding.sourcePose;
      if(toTexture){const width=Number(s.m_Width),height=Number(s.m_Height),resolution=Number(s.m_Resolution),w=Math.trunc(width>=height?resolution:resolution*width/height),h=Math.trunc(height>=width?resolution:resolution*height/width),view=identity();view[12]=3000;view[13]=-3000;pose=identity();pose[12]=-3000;pose[13]=3000;local={view,projection:ortho(-Number(s.m_Alignment)*width/2,(Number(s.m_Anchor)-2)*height/2,width,height),width:448,height:606,time:1,linear:false};const clear=color(s[s.m_Outline?'m_OutlineColor':'m_TextColor']);clear[3]=0;const textTarget=this.renderer.createTextTarget(w,h);textTargets.push(textTarget);}
      // Native name meshes sample the bottom row first. WebGPU render targets
      // start at the top; flip this offscreen projection once, without a GPU
      // readback or any changes to the authored name mesh or texture UVs.
      if(toTexture){local.projection[5]=-local.projection[5];local.projection[13]=-local.projection[13];}
      const groups=[];for(const q of glyph.quads){const key=q.material+':'+q.color.join(','),last=groups[groups.length-1];if(!last||last.key!==key)groups.push({key,quads:[q]});else last.quads.push(q);}
      const batches=[];for(const group of groups){const q=group.quads[0],part={path:'text:'+role,slot:0,mesh:quadGroup(group.quads),material:glyphMaterial(q,s,atlas),pose};if(nativeProfile)part.material.shader=nativeProfile.data.textShaders[part.material.shader]||part.material.shader;transientMeshes.push(part.mesh);batches.push(...await this.builder.draw(part,local));}
      if(toTexture){
        for(const draw of batches)if(draw.state.cull)draw.state={...draw.state,cull:draw.state.cull===1?2:1};
        await this.renderer.renderTo(textTargets[textTargets.length-1],batches,color(s[s.m_Outline?'m_OutlineColor':'m_TextColor']).map((v,i)=>i===3?0:v));const width=Number(s.m_Width),height=Number(s.m_Height),resolution=Number(s.m_Resolution),w=Math.trunc(width>=height?resolution:resolution*width/height),h=Math.trunc(height>=width?resolution:resolution*height/width);
        // The framebuffer color texture has exactly the same RGBA8 rows as
        // readPixels + re-upload, but without a GPU->CPU synchronization.
        const textTarget=textTargets[textTargets.length-1];
        const image={width:w,height:h,format:28,levels:[null],gpuTexture:textTarget.texture},meshInfo=this.nameMeshes.prefabs[frame.fit.kind?this.sources.card(card.kind,card.golden).name:''];if(!meshInfo)throw Error('Missing shared name geometry');
        const surfaceMesh=config.nativeMesh|| (config.componentMesh?historical.textGeometry(config.componentMesh):meshInfo.mesh?{encoded:meshInfo.mesh,sha256:meshInfo.sha256}:plane(Number(s.m_Width),Number(s.m_Height),s,this.sources.frames.palette)),rotation=[1,0,0,0,0,0,-1,0,0,1,0,0,0,0,0,1],surfacePose=(config.nativeMesh||config.componentMesh||meshInfo.mesh)?config.binding.destinationPose:multiply(config.binding.sourcePose,rotation);
        const material={shader:s.m_AntiAlias?'Hidden/TextAntialiasing':'Hidden/TextPlane',keywords:[],values:{_Color:[1,1,1,1],_OffsetX:[f(Number(s.m_AntiAliasAmount)/w)],_OffsetY:[f(Number(s.m_AntiAliasAmount)/h)],_Edge:[Number(s.m_AntiAliasEdge)]},textures:{_MainTex:{pixels:image,sampler:{filter:1,wrapU:1,wrapV:1,wrapW:1},st:[1,1,0,0]}}};
        if(nativeProfile)material.shader=nativeProfile.data.textShaders[material.shader]||material.shader;
        textDraws.push(...await this.builder.draw({path:'text:'+role,slot:0,mesh:surfaceMesh,material,pose:surfacePose},context));
      }else textDraws.push(...batches);
    }
    // Native quantity decoration is a GPU draw in the shared WebGPU device as the class
    // banner, faction ribbon, rarity gem and text meshes.
    const quantityDraws=card.quantity>=2
      ? await this.builder.draw(await quantityRibbonPart(context,card.quantity),context)
      : [];
    for(const draw of quantityDraws)if(draw.mesh.attributes)transientMeshes.push(draw.mesh);
    return{frame,context,textDraws,quantityDraws,animation,artwork,goldenPixels,textTargets,transientMeshes,transientTextures,portraitPixels:card.artPixels,frameSignature:frameSignature(card)};
    }catch(error){this.releasePrepared({textTargets,transientMeshes,transientTextures});throw error;}
  }
  releasePrepared(prepared){for(const target of prepared?.textTargets||[])this.renderer.releaseTextTarget(target);for(const mesh of prepared?.transientMeshes||[])this.renderer.releaseMesh(mesh);for(const texture of prepared?.transientTextures||[])this.renderer.releaseTexture(texture);}
  async prepareFrame(card,isCurrent=()=>true){
    if(!card.loading)throw Error('Frame preparation requires empty content');
    const prepared=await this.prepare(card);let retained=false;
    try{
      if(!isCurrent())return null;
      // Download/decode/compile independent frames concurrently. No uniforms,
      // textures or draw commands are submitted to a card target here.
      const groups=await Promise.all(prepared.frame.parts.map(part=>this.builder.draw(part,{...prepared.context,time:0})));
      if(!isCurrent())return null;
      const draws=[...groups.flat(),...prepared.quantityDraws];
      await Promise.all(draws.flatMap(draw=>[this.renderer.geometry(draw.mesh),this.renderer.pipeline(draw)]));
      if(!isCurrent())return null;
      retained=true;return prepared;
    }finally{if(!retained)this.releasePrepared(prepared);}
  }
  async renderPrepared(prepared,{background=[1,1,1,1],transparent=false,time=1,destination=null,isCurrent=()=>true}={}){
    const {frame,textDraws,quantityDraws}=prepared,context={...prepared.context,time};
    // Assembling draw commands does not submit GPU commands. Fetch/decode each
    // independent native frame component concurrently, then draw in the exact
    // same original part/pass order to preserve shader blending and animation.
    const groups=await Promise.all(frame.parts.map(part=>{
      const current=part===prepared.artwork&&prepared.animation?{...part,material:{...part.material,values:prepared.animation.sample(time)}}:part;
      return this.builder.draw(current,context);
    }));
    const draws=groups.flat();draws.push(...textDraws,...quantityDraws);
    // Native mana/stat effects animate on normal frames too. Classify the
    // selected shader programs, rather than assuming only golden cards move.
    prepared.animated=!!prepared.animation||draws.some(draw=>draw.animated);
    if(!isCurrent())return false;
    if(transparent){if(await this.renderer.transparent(context.width,context.height,draws,destination,isCurrent)===false)return false;}else {if(!destination)throw Error('WebGPU opaque native pass requires a target');await this.renderer.renderTo(destination,draws,background);}
    return{width:context.width,height:context.height,frameParts:frame.parts.length,textDraws:textDraws.length};
  }
  async render(card,background=[1,1,1,1],transparent=false){
    const prepared=await this.prepare(card);
    try{return await this.renderPrepared(prepared,{background,transparent});}
    finally{this.releasePrepared(prepared);}
  }
}
