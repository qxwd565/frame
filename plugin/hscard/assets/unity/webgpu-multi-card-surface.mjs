/* WebGPU-only companion for HSdeck's shared canvas and card-target cache.
 * Experimental: requires source WGSL shaders to validate and match pixels.
 */
export class WebGPUMultiCardSurface {
 static async create(renderer,cards){const self=new WebGPUMultiCardSurface(renderer,cards);await self.initialize();return self;}
 constructor(renderer,cards){this.renderer=renderer;this.cards=cards;this.items=new Map();this.goldenRefs=new Map();this.presentationEntries=new Map();}
 async initialize(){
  const device=this.renderer.device;
  const code=`struct V { @builtin(position) p:vec4f, @location(0) uv:vec2f };
struct Placement { rect:vec4f, surface:vec2f };
@group(0) @binding(2) var<uniform> place:Placement;
@vertex fn vs(@builtin(vertex_index) id:u32)->V {
 let p=vec2f(f32((id<<1u)&2u),f32(id&2u));
 let point=place.rect.xy+p*place.rect.zw;
 let clip=vec2f(2.0*point.x/place.surface.x-1.0,1.0-2.0*point.y/place.surface.y);
 return V(vec4f(clip,0,1),p);
}
@group(0) @binding(0) var card:texture_2d<f32>;
@group(0) @binding(1) var texSampler:sampler;
@fragment fn fs(input:V)->@location(0) vec4f {
 let sample=textureSample(card,texSampler,input.uv);
 // GPU canvas is configured for premultiplied-alpha composition.
 return vec4f(sample.rgb*sample.a,sample.a);
}`;
  const module=device.createShaderModule({code});
  const errors=(await module.getCompilationInfo()).messages.filter(x=>x.type==='error');if(errors.length)throw Error('WebGPU presentation shader: '+errors.map(x=>x.message).join('; '));
  this.pipeline=await device.createRenderPipelineAsync({layout:'auto',vertex:{module,entryPoint:'vs'},fragment:{module,entryPoint:'fs',targets:[{format:this.renderer.screenFormat,blend:{color:{operation:'add',srcFactor:'one',dstFactor:'one-minus-src-alpha'},alpha:{operation:'add',srcFactor:'one',dstFactor:'one-minus-src-alpha'}}}]},primitive:{topology:'triangle-list'}});
  this.presentationSampler=device.createSampler({minFilter:'linear',magFilter:'linear',addressModeU:'clamp-to-edge',addressModeV:'clamp-to-edge'});
 }
 createTarget(width,height){return this.renderer.createTarget(width,height);}
 _releasePresentation(key){const entry=this.presentationEntries.get(key);if(entry){entry.ubo.destroy();this.presentationEntries.delete(key);}}
 _presentationEntry(key,target){
  let entry=this.presentationEntries.get(key);
  if(entry?.target===target)return entry;
  if(entry)this._releasePresentation(key);
  const ubo=this.renderer.device.createBuffer({size:32,usage:GPUBufferUsage.UNIFORM|GPUBufferUsage.COPY_DST});
  const group=this.renderer.device.createBindGroup({layout:this.pipeline.getBindGroupLayout(0),entries:[
   {binding:0,resource:target.view},{binding:1,resource:this.presentationSampler},{binding:2,resource:{buffer:ubo}}]});
  entry={ubo,group,target};this.presentationEntries.set(key,entry);return entry;
 }
 remove(key){this._releasePresentation('card:'+key);this._releasePresentation('preview:'+key);const item=this.items.get(key);if(!item)return;for(const target of [item.target,item.previewTarget])this.renderer.releaseTarget(target);
  this.items.delete(key);this.cards.releasePrepared(item.prepared);
  for(const pixels of item.prepared.goldenPixels||[]){const count=(this.goldenRefs.get(pixels)||1)-1;if(count)this.goldenRefs.set(pixels,count);else{this.goldenRefs.delete(pixels);this.renderer.releaseTexture(pixels);}}
 }
 async prepare(key,card,basePrepared=null){this.remove(key);const prepared=await this.cards.prepare(card,basePrepared);
  let target;try{target=this.createTarget(prepared.context.width,prepared.context.height);}catch(e){this.cards.releasePrepared(prepared);throw e;}
  this.items.set(key,{prepared,target});for(const pixels of prepared.goldenPixels||[])this.goldenRefs.set(pixels,(this.goldenRefs.get(pixels)||0)+1);
 }
 adopt(from,to){if(from===to)return;const item=this.items.get(from);if(!item)throw Error('Missing prepared WebGPU card');this.remove(to);this.items.delete(from);this.items.set(to,item);}
 async update(key,time){const item=this.items.get(key);if(!item)throw Error('Unknown card '+key);await this.cards.renderPrepared(item.prepared,{transparent:true,time,destination:item.target});}
 async updatePreview(key,time){const item=this.items.get(key);if(!item)throw Error('Unknown card '+key);if(!item.previewTarget)item.previewTarget=this.createTarget(item.target.width,item.target.height);
  await this.cards.renderPrepared({...item.prepared,quantityDraws:[]},{transparent:true,time,destination:item.previewTarget});}
 trimPreviews(keep){for(const [key,item] of this.items)if(key!==keep&&item.previewTarget){this.renderer.releaseTarget(item.previewTarget);item.previewTarget=null;this._releasePresentation('preview:'+key);}}
 present(width,height,placements,overlay=null){
  for(let i=0;i<placements.length;i++)for(let j=i+1;j<placements.length;j++){const a=placements[i],b=placements[j];if(a.x<b.x+b.width&&b.x<a.x+a.width&&a.y<b.y+b.height&&b.y<a.y+a.height)throw Error('Overlapping card viewports need stacking integration');}
  const {canvas,device,context}=this.renderer;if(canvas.width!==width||canvas.height!==height){canvas.width=width;canvas.height=height;}
  const encoder=device.createCommandEncoder(),pass=encoder.beginRenderPass({colorAttachments:[{view:context.getCurrentTexture().createView(),loadOp:'clear',storeOp:'store',clearValue:{r:0,g:0,b:0,a:0}}]});
  pass.setPipeline(this.pipeline);
  const draw=(rect,preview=false)=>{const item=this.items.get(rect.key),target=preview?item?.previewTarget:item?.target;if(!target)return;
   const x=Math.round(rect.x),y=Math.round(rect.y),w=Math.round(rect.width),h=Math.round(rect.height);if(w<=0||h<=0)return;
   const clip=rect.clip??{x:0,y:0,width,height},left=Math.max(0,x,Math.round(clip.x)),top=Math.max(0,y,Math.round(clip.y)),right=Math.min(width,x+w,Math.round(clip.x+clip.width)),bottom=Math.min(height,y+h,Math.round(clip.y+clip.height));if(right<=left||bottom<=top)return;
   pass.setScissorRect(left,top,right-left,bottom-top);
   // Use full-screen viewport plus a per-card rectangle UBO, because WebGPU
   // rejects negative/out-of-bounds viewports used by the old WebGL presenter.
   const raw=new Float32Array([x,y,w,h,width,height,0,0]);
   const entry=this._presentationEntry((preview?'preview:':'card:')+rect.key,target);
   device.queue.writeBuffer(entry.ubo,0,raw);
   pass.setBindGroup(0,entry.group);pass.draw(3);
  };
  for(const rect of placements)draw(rect);if(overlay)draw(overlay,true);
  pass.end();device.queue.submit([encoder.finish()]);
 }

 dispose(){for(const key of [...this.items.keys()])this.remove(key);for(const key of [...this.presentationEntries.keys()])this._releasePresentation(key);}
}
