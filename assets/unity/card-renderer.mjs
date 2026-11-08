import {originalClasses} from './hsplus-sources.mjs?ver=hsplus-cards-10';
import {HistoricalAdapter,historicalSelection} from './historical-adapter.mjs?ver=beta-3664-1';
import {fitText,textValues} from './dynamic-layout.mjs?ver=beta-3664-1';
import {composeGlyphs} from './glyph-layout.mjs?ver=text-1';
import {multiply} from './native-draw-builder.mjs?ver=hsplus-cards-2';
import {cardSceneContext,quantityRibbonPart} from './quantity-ribbon.mjs?ver=hsplus-cards-9';
import {ArtworkAnimation} from './artwork-animation.mjs?ver=golden-api-1';
const f=Math.fround;
const textShader=(settings,name)=>settings.nativeShaders?.[name]||name;
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
  return{shader:textShader(settings,outlined?(q.material?'Hidden/TextBoldOutline_Unlit':'Hidden/TextOutline_Unlit'):(q.material?'Hidden/Text_Bold':'Hero/Text_Unlit')),keywords:[],values,textures:{_MainTex:{pixels:atlas,sampler:{filter:1,wrapU:1,wrapV:1,wrapW:1},st:[1,1,0,0]}}};
}
// Frame-affecting native metadata may be missing in older local DB records.
// Reuse the loading frame only when those inputs match the final card.
function frameStructureSignature(card){
 const tags=card.tags||{},ids=[482,483,484,1720,2196,2197,2198,2785,3457,3458,3469,4354];
 return JSON.stringify([card.kind,originalClasses(card),card.golden,card.rarity,card.frameProfile,card.renderDate,card.race,card.school,card.attack>0,card.armor>0,...ids.map(id=>Number(tags[id]||0))]);
}
function frameSignature(card){const tags=card.tags||{};return JSON.stringify([frameStructureSignature(card),card.watermark,card.set,Number(tags[183]||0),Number(tags[1107]||0)]);}
export class CardRenderer {
  constructor({sources,composer,builder,renderer,raster,nameMeshes,layouts,variantLayouts}){Object.assign(this,{sources,composer,builder,renderer,raster,nameMeshes,layouts,variantLayouts});}
  async prepare(card,basePrepared=null){
    const prior=basePrepared?.frameStructureSignature===frameStructureSignature(card)?basePrepared:null;
    if(prior?.frameSignature!==frameSignature(card))basePrepared=null;
    if(card.frameProfile && !['current','historical'].includes(card.frameProfile))throw Error('Missing original frame resources for '+card.frameProfile);
    const selection=card.frameProfile==='historical'?historicalSelection(card):null;
    const renderCard=selection?.hideSchool?{...card,school:''}:card;
    const replaceArtwork=(base,next)=>({...base,parts:base.parts.map(part=>{
      if(!part.blank)return part;
      const source=next.parts.find(p=>p.blank&&p.path===part.path&&p.slot===part.slot);
      if(!source)throw Error('The loading frame artwork does not match the card');
      return {...part,material:source.material,queue:source.queue};
    })});
    let historical=null,nativeProfile=null;
    if(selection){
      if(!this.historicalPromise)this.historicalPromise=HistoricalAdapter.create(this.sources,this.composer).catch(error=>{this.historicalPromise=null;throw error;});
      historical=await this.historicalPromise;
      if(selection.nativeProfile)nativeProfile=await historical.nativeProfile(this.builder,this.renderer,selection.nativeProfile);
    }
    const compose=card=>nativeProfile?nativeProfile.compose(card,this.composer):this.composer.compose(card);
    let frame=await compose(renderCard);
    if(basePrepared)frame=replaceArtwork(basePrepared.frame,frame);
    if(card.goldenPortrait){
      try{for(const part of frame.parts.filter(p=>p.blank)){
        const trial={...part,material:{...part.material,values:new ArtworkAnimation(part.material).sample(0)}};
        for(const draw of await this.builder.draw(trial,{...cardSceneContext(frame.fit,card.quantity),time:0})){
          this.renderer.program(draw.vertexProgram,draw.fragmentProgram);
          for(const binding of [...draw.vertexTextures,...draw.fragmentTextures])this.renderer.uploadTexture(binding.texture.pixels,binding.srgb);
        }
      }}catch(error){
        if(globalThis.HSCARD_DEBUG===true)console.debug('[HScard golden] using normal artwork',String(error?.message||error));
        for(const texture of Object.values(card.goldenPortrait.textures))this.renderer.releaseTexture(texture.pixels);
        const fallback=await compose({...renderCard,goldenPortrait:null});
        frame=basePrepared?replaceArtwork(basePrepared.frame,fallback):fallback;
      }
    }
    if(selection){
      if(selection.catalog&&!basePrepared)await historical.apply(renderCard,frame,selection.catalog,selection.raceLayout);
      if(selection.component&&!basePrepared){const component=(await historical.components()).frames.find(x=>x.id===selection.component);if(!component)throw Error('Missing historical component '+selection.component);await historical.apply(renderCard,frame,component.catalog);}
    }
    // When later metadata adds a watermark, preserve the already displayed
    // frame nodes; only the description material and artwork need updating.
    if(prior&&!basePrepared){
      const previous=new Map(prior.frame.parts.filter(p=>!p.blank&&!p.watermark).map(p=>[p.path+':'+p.slot,p]));
      frame={...frame,fit:prior.frame.fit,parts:frame.parts.map(part=>part.blank||part.watermark?part:(previous.get(part.path+':'+part.slot)||part))};
    }
    const artwork=frame.parts.find(p=>p.blank&&p.material.animation);
    const animation=artwork?new ArtworkAnimation(artwork.material):null;
    const goldenPixels=card.goldenPortrait?new Set(frame.parts.filter(p=>p.blank).flatMap(p=>Object.values(p.material.textures).map(t=>t.pixels).filter(x=>x!==card.artPixels&&x))):new Set();
    if(nativeProfile&&!card.loading)await nativeProfile.ensureFonts(this.raster);
    const roles={},configs={};for(const [role,value] of Object.entries(card.loading?{}:textValues(renderCard))){if(value===undefined||value===null||value==='')continue;const textPrefab=this.sources.card(card.kind,card.golden).text;if(!textPrefab.bindings.some(x=>x.role===role))continue;let config=nativeProfile?nativeProfile.textConfiguration(renderCard,role,this.sources):historical&&selection.edition?await historical.textConfiguration(renderCard,selection.edition,role):this.sources.textConfiguration(card.kind,card.golden,role);if(historical&&selection.textProfile)config=await historical.profileText(renderCard,selection.textProfile,role,config);if(!config)continue;const fit=fitText(value,config.settings,this.raster.metrics(config.font),role);if(fit){roles[role]=fit;configs[role]=config;}}
    const context=cardSceneContext(frame.fit,card.quantity),textDraws=[];
    for(const [role,fit] of Object.entries(roles)){
      const config=configs[role],s=config.settings,glyph=composeGlyphs(this.raster,config.font,fit,s),atlas={width:glyph.width,height:glyph.height,format:65,levels:[glyph.atlas]},toTexture=!!s.m_RenderToTexture;
      let local=context,pose=config.binding.sourcePose;
      if(toTexture){const width=Number(s.m_Width),height=Number(s.m_Height),resolution=Number(s.m_Resolution),w=Math.trunc(width>=height?resolution:resolution*width/height),h=Math.trunc(height>=width?resolution:resolution*height/width),view=identity();view[12]=3000;view[13]=-3000;pose=identity();pose[12]=-3000;pose[13]=3000;local={view,projection:ortho(-Number(s.m_Alignment)*width/2,(Number(s.m_Anchor)-2)*height/2,width,height),width:448,height:606,time:1,linear:false};const clear=color(s[s.m_Outline?'m_OutlineColor':'m_TextColor']);clear[3]=0;const textTarget=this.renderer.targets(w,h)[0];this.renderer.gl.bindFramebuffer(this.renderer.gl.FRAMEBUFFER,textTarget.fbo);this.renderer.clearBound(w,h,clear);}
      const groups=[];for(const q of glyph.quads){const key=q.material+':'+q.color.join(','),last=groups[groups.length-1];if(!last||last.key!==key)groups.push({key,quads:[q]});else last.quads.push(q);}
      const batches=[];for(const group of groups){const q=group.quads[0],part={path:'text:'+role,slot:0,mesh:quadGroup(group.quads),material:glyphMaterial(q,s,atlas),pose};batches.push(...await this.builder.draw(part,local));}
      if(toTexture){
        for(const draw of batches)await this.renderer.draw(draw);const gl=this.renderer.gl,width=Number(s.m_Width),height=Number(s.m_Height),resolution=Number(s.m_Resolution),w=Math.trunc(width>=height?resolution:resolution*width/height),h=Math.trunc(height>=width?resolution:resolution*height/width),rgba=new Uint8Array(w*h*4);gl.readPixels(0,0,w,h,gl.RGBA,gl.UNSIGNED_BYTE,rgba);
        const image={width:w,height:h,format:28,levels:[rgba]},meshInfo=this.nameMeshes.prefabs[frame.fit.kind?this.sources.card(card.kind,card.golden).name:''];if(!meshInfo)throw Error('Missing shared name geometry');
        const surfaceMesh=config.nativeMesh|| (config.componentMesh?historical.textGeometry(config.componentMesh):meshInfo.mesh?{encoded:meshInfo.mesh,sha256:meshInfo.sha256}:plane(Number(s.m_Width),Number(s.m_Height),s,this.sources.frames.palette)),rotation=[1,0,0,0,0,0,-1,0,0,1,0,0,0,0,0,1],surfacePose=(config.nativeMesh||config.componentMesh||meshInfo.mesh)?config.binding.destinationPose:multiply(config.binding.sourcePose,rotation);
        const material={shader:textShader(s,s.m_AntiAlias?'Hidden/TextAntialiasing':'Hidden/TextPlane'),keywords:[],values:{_Color:[1,1,1,1],_OffsetX:[f(Number(s.m_AntiAliasAmount)/w)],_OffsetY:[f(Number(s.m_AntiAliasAmount)/h)],_Edge:[Number(s.m_AntiAliasEdge)]},textures:{_MainTex:{pixels:image,sampler:{filter:1,wrapU:1,wrapV:1,wrapW:1},st:[1,1,0,0]}}};
        textDraws.push(...await this.builder.draw({path:'text:'+role,slot:0,mesh:surfaceMesh,material,pose:surfacePose},context));
      }else textDraws.push(...batches);
    }
    // Native quantity decoration is a frame draw, not a DOM badge.  It shares
    // the same card projection, transparent FBO and WebGL context as the class
    // banner, faction ribbon, rarity gem and text meshes.
    const quantityDraws=!card.loading&&card.quantity>=2
      ? await this.builder.draw(await quantityRibbonPart(context,card.quantity),context)
      : [];
    return{frame,context,textDraws,quantityDraws,animation,artwork,goldenPixels,frameSignature:frameSignature(card),frameStructureSignature:frameStructureSignature(card)};
  }
  async renderPrepared(prepared,{background=[1,1,1,1],transparent=false,time=1,destination=null}={}){
    const {frame,textDraws,quantityDraws}=prepared,context={...prepared.context,time};const draws=[];
    for(const part of frame.parts){const current=part===prepared.artwork&&prepared.animation?{...part,material:{...part.material,values:prepared.animation.sample(time)}}:part;draws.push(...await this.builder.draw(current,context));}draws.push(...textDraws,...quantityDraws);
    if(transparent)await this.renderer.transparent(context.width,context.height,draws,destination);else{this.renderer.clear(context.width,context.height,background);for(const draw of draws)await this.renderer.draw(draw);const gl=this.renderer.gl,status=gl.getError();if(status!==gl.NO_ERROR)throw Error('Card WebGL error '+status);}
    return{width:context.width,height:context.height,frameParts:frame.parts.length,textDraws:textDraws.length};
  }
  async render(card,background=[1,1,1,1],transparent=false){
    return this.renderPrepared(await this.prepare(card),{background,transparent});
  }
}
