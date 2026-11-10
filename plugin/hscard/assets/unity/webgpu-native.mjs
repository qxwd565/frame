/*
 * HScard native source WebGPU backend — preview implementation.
 * Material programs are compiled from current-game DXBC with HLSLcc and Naga.
 * WebGPU-only: no WebGL context creation or silent fallback.
 */
import {decodeMesh} from './hsplus-sources.mjs?ver=hscard-a573f18746776bc1';
const ALIGN=256;
const round=(v,a)=>Math.ceil(v/a)*a;
const rgba=(r,g,b,a)=>[r,g,b,a];
function decodeBase64(s){const binary=atob(s),out=new Uint8Array(binary.length);for(let i=0;i<out.length;i++)out[i]=binary.charCodeAt(i);return out;}
async function inflate64(value){return new Response(new Blob([decodeBase64(value)]).stream().pipeThrough(new DecompressionStream('gzip'))).arrayBuffer();}
function c565(n){return [(n>>11&31)*255/31|0,(n>>5&63)*255/63|0,(n&31)*255/31|0];}
/** Decode original DXT1/DXT5 textures when the WebGPU adapter lacks BC. */
export function decodeBC(bytes,width,height,format){
 const bc1=[71,72].includes(format);if(!bc1&&![77,78].includes(format))throw Error('Not BC1/BC3');
 const out=new Uint8Array(width*height*4),blockBytes=bc1?8:16;
 for(let by=0;by<Math.ceil(height/4);by++)for(let bx=0;bx<Math.ceil(width/4);bx++){
  const base=(by*Math.ceil(width/4)+bx)*blockBytes;if(base+blockBytes>bytes.length)throw Error('Truncated BC texture');
  const c=base+(bc1?0:8),a0=bytes[base],a1=bytes[base+1],alpha=new Uint8Array(8);
  if(!bc1){alpha[0]=a0;alpha[1]=a1;if(a0>a1){for(let i=1;i<=6;i++)alpha[i+1]=((7-i)*a0+i*a1)/7|0;}else{for(let i=1;i<=4;i++)alpha[i+1]=((5-i)*a0+i*a1)/5|0;alpha[6]=0;alpha[7]=255;}}
  const v0=bytes[c]|bytes[c+1]<<8,v1=bytes[c+2]|bytes[c+3]<<8,col0=c565(v0),col1=c565(v1);
  const colors=[rgba(...col0,255),rgba(...col1,255)];
  if(v0>v1||!bc1){colors.push(rgba(...col0.map((n,i)=>(2*n+col1[i])/3|0),255),rgba(...col0.map((n,i)=>(n+2*col1[i])/3|0),255));}
  else{colors.push(rgba(...col0.map((n,i)=>(n+col1[i])/2|0),255),rgba(0,0,0,0));}
  for(let y=0;y<4;y++)for(let x=0;x<4;x++){
   const px=bx*4+x,py=by*4+y;if(px>=width||py>=height)continue;
   const bit=2*(y*4+x),index=(bytes[c+4+(bit>>3)]>>(bit&7))&3,copy=colors[index].slice();
   if(!bc1){const aBit=3*(y*4+x),aIndex=Number((BigInt(bytes[base+2])|BigInt(bytes[base+3])<<8n|BigInt(bytes[base+4])<<16n|BigInt(bytes[base+5])<<24n|BigInt(bytes[base+6])<<32n|BigInt(bytes[base+7])<<40n)>>BigInt(aBit)&7n);copy[3]=alpha[aIndex];}
   out.set(copy,(py*width+px)*4);
  }
 }
 return out;
}
export function webgpuRenderState(s){
 const blend=['zero','one','dst','src','one-minus-dst','src-alpha','one-minus-src','dst-alpha','one-minus-dst-alpha','src-alpha-saturated','one-minus-src-alpha'];
 const operation=['add','subtract','reverse-subtract','min','max'];
 const compare=['always','never','less','equal','less-equal','greater','not-equal','greater-equal','always'];
 const stencil=['keep','zero','replace','increment-clamp','decrement-clamp','invert','increment-wrap','decrement-wrap'];
 const alpha=x=>({2:7,3:5,4:8,6:10,9:1})[x]??x;
 function factor(x){const result=blend[x];if(!result)throw Error('Unknown original blend factor '+x);return result;}
 function op(x){const result=operation[x];if(!result)throw Error('Unknown original blend operation '+x);return result;}
 let mask=0;if(s.colorMask&8)mask|=1;if(s.colorMask&4)mask|=2;if(s.colorMask&2)mask|=4;if(s.colorMask&1)mask|=8;
 const blending=!(s.source===1&&s.destination===0&&s.sourceAlpha===1&&s.destinationAlpha===0);
 const stencilActive=s.stencilCompare!==0&&(s.stencilCompare!==8||s.stencilPass!==0||s.stencilFail!==0||s.stencilDepthFail!==0);
 return {color:{writeMask:mask,...(blending?{blend:{color:{srcFactor:factor(s.source),dstFactor:factor(s.destination),operation:op(s.blendOperation)},alpha:{srcFactor:factor(alpha(s.sourceAlpha)),dstFactor:factor(alpha(s.destinationAlpha)),operation:op(s.alphaOperation)}}}:{})},
  primitive:{topology:'triangle-list',frontFace:'cw',cullMode:s.cull===0?'none':s.cull===1?'front':'back'},
  depthStencil:{format:'depth24plus-stencil8',depthWriteEnabled:!!s.depthWrite,depthCompare:s.depthTest===0?'always':compare[s.depthTest],
   stencilFront:{compare:stencilActive?compare[s.stencilCompare]:'always',failOp:stencil[s.stencilFail],depthFailOp:stencil[s.stencilDepthFail],passOp:stencil[s.stencilPass]},
   stencilBack:{compare:stencilActive?compare[s.stencilCompare]:'always',failOp:stencil[s.stencilFail],depthFailOp:stencil[s.stencilDepthFail],passOp:stencil[s.stencilPass]},
   stencilReadMask:s.stencilRead,stencilWriteMask:stencilActive?s.stencilWrite:0,depthBias:s.depthBias|0,depthBiasSlopeScale:s.slopeBias||0},
  stencilReference:s.stencilReference,
  depthClipDisabled:!s.depthClip};
}
function textureDescriptor(pixels,srgb,comparison,bc){
 const fmt=pixels.format,compressed=[71,72,77,78,98,99].includes(fmt);
 if(comparison){if(fmt!==28||srgb)throw Error('Depth comparison requires RGBA8 original');return {format:'depth32float',convert:'depth',block:4};}
 // Compressed base-level textures with dimensions not divisible by 4 require
 // texture-compression-unaligned (not available on every WebGPU device).
 // Decode these uncommon assets to uncompressed RGBA instead of silently
 // skipping their last partial blocks or failing texture creation.
 if(compressed&&bc&&pixels.width%4===0&&pixels.height%4===0){const stem=[71,72].includes(fmt)?'bc1-rgba-unorm':[98,99].includes(fmt)?'bc7-rgba-unorm':'bc3-rgba-unorm';return {format:stem+(srgb?'-srgb':''),block:[71,72].includes(fmt)?8:16};}
 if([98,99].includes(fmt))throw Error('Original BC7 texture requires WebGPU texture-compression-bc');
 if(![28,29,65,71,72,77,78,85].includes(fmt))throw Error('Unsupported Unity texture format: '+fmt);
 return {format:srgb?'rgba8unorm-srgb':'rgba8unorm',convert:compressed?'bc':fmt===65?'alpha':fmt===85?'rgb565':null,block:4};
}
function paddedRows(raw,width,height,bytesPerRow){
 const size=round(bytesPerRow,256),out=new Uint8Array(size*height);
 for(let y=0;y<height;y++)out.set(raw.subarray(y*bytesPerRow,(y+1)*bytesPerRow),size*y);
 return {data:out,bytesPerRow:size};
}
class UploadArena {
 constructor(device,bytes=8*1024*1024){this.device=device;this.capacity=bytes;this.data=new Uint8Array(bytes);this.buffer=device.createBuffer({size:bytes,usage:GPUBufferUsage.UNIFORM|GPUBufferUsage.COPY_DST});this.offset=0;}
 reset(){this.offset=0;}
 alloc(raw,min){const padded=round(Math.max(raw.byteLength,min||0,16),16),slot=round(this.offset,ALIGN);
  if(slot+padded>this.capacity)throw Error('Uniform arena capacity exceeded. Increase budget or split render batches.');
  this.data.set(raw,slot);
  this.data.fill(0,slot+raw.byteLength,slot+padded);
  this.offset=slot+round(padded,ALIGN);return {buffer:this.buffer,offset:slot,size:padded};
 }
 // Upload the packed bytes once per submitted scene, preserving every native
 // slot and value without hundreds of small queue writes per animation frame.
 flush(){if(this.offset)this.device.queue.writeBuffer(this.buffer,0,this.data,0,this.offset);}
 destroy(){this.buffer.destroy();}
}
export class WebGPUNativeRenderer {
 static async create(canvas,programs,sources){
  if(!navigator.gpu)throw Error('WebGPU is unavailable: secure HTTPS origin and compatible browser are required');
  // Device startup is independent of the source manifests. Accept their
  // promises so downloading/decompression does not serialize GPU discovery.
  const gpu=(async()=>{
   const adapter=await navigator.gpu.requestAdapter({powerPreference:'high-performance'});if(!adapter)throw Error('WebGPU adapter unavailable');
   const bc=adapter.features.has('texture-compression-bc'),depthClipControl=adapter.features.has('depth-clip-control');
   const device=await adapter.requestDevice({requiredFeatures:[...(bc?['texture-compression-bc']:[]),...(depthClipControl?['depth-clip-control']:[])]});
   return{device,bc,depthClipControl};
  })();
  try{
  const [hardware,shaderPrograms,sourceData]=await Promise.all([gpu,programs,sources]);
  const {device,bc,depthClipControl}=hardware;
  const context=canvas.getContext('webgpu');if(!context)throw Error('WebGPU context unavailable');
  const screenFormat=navigator.gpu.getPreferredCanvasFormat();context.configure({device,format:screenFormat,alphaMode:'premultiplied'});
  // Log uncaptured WebGPU validation failures instead of displaying the same
  // generic placeholder for every card without a useful browser error.
  device.addEventListener?.('uncapturederror',event=>console.error('[HScard WebGPU validation]',event.error?.message||event.error));
  return new WebGPUNativeRenderer(canvas,device,context,screenFormat,shaderPrograms,sourceData,bc,depthClipControl);
  }catch(error){gpu.then(({device})=>device.destroy(),()=>{});throw error;}
 }
 constructor(canvas,device,context,screenFormat,programs,sources,bc,depthClipControl){
  this.canvas=canvas;this.device=device;this.context=context;this.screenFormat=screenFormat;this.programs=programs;this.sources=sources;this.bc=bc;this.depthClipControl=depthClipControl;
  this.modules=new Map();this.pipelines=new Map();this.meshes=new Map();this.meshPackages=new Map();this.gpuMeshes=new WeakMap();this.textureTable=new WeakMap();this.textureList=new Set();this.samplers=new Map();this.arena=new UploadArena(device);
  this.targets=new Map();this.meshResources=new Set();this.textureEntries=new Map();this.textureBytes=0;
  // Reuse alpha scratch targets for animated cards; do not allocate and destroy
  // a black/white framebuffer pair on every animation frame.
  this.alphaScratch=new Map();
  this.lost=device.lost.then(info=>{this.lostReason=info.message;});
 }
 async geometry(ref){if(ref.attributes&&ref.indices)return ref;const key=ref.sha256||ref.key+':'+ref.slot;if(this.meshes.has(key))return this.meshes.get(key);
  const task=(async()=>{if(ref.encoded)return decodeMesh(ref.gzip?await inflate64(ref.encoded):decodeBase64(ref.encoded).buffer);
   if(!this.meshPackages.has(ref.key))this.meshPackages.set(ref.key,this.sources.meshes(ref.key));const values=await this.meshPackages.get(ref.key);return values[Math.min(ref.slot,values.length-1)];})();
  this.meshes.set(key,task);try{const mesh=await task;this.meshes.set(key,mesh);return mesh;}catch(e){this.meshes.delete(key);throw e;}
 }
 getMesh(mesh){let entry=this.gpuMeshes.get(mesh);if(entry)return entry;
  const index=this.device.createBuffer({size:round(mesh.indices.byteLength,4),usage:GPUBufferUsage.INDEX|GPUBufferUsage.COPY_DST});this.device.queue.writeBuffer(index,0,mesh.indices);
  entry={index,vertexCount:mesh.indices.length,attributes:new Map()};this.gpuMeshes.set(mesh,entry);this.meshResources.add(entry);return entry;
 }
 vertexBuffer(mesh,attribute){const entry=this.getMesh(mesh);let buffer=entry.attributes.get(attribute.name);if(buffer)return buffer;
  const data=mesh.attributes.get(attribute.name);let count=0;if(!data){for(const index of mesh.indices)if(index>=count)count=index+1;}
  let raw=data;if(!raw){raw=new Float32Array(count*4);const defaultValue=attribute.name.startsWith('COLOR')?1:0;for(let i=0;i<count;i++){for(let c=0;c<4;c++)raw[i*4+c]=defaultValue||(c===3&&attribute.name.startsWith('POSITION')?1:0);}}
  buffer=this.device.createBuffer({size:round(raw.byteLength,4),usage:GPUBufferUsage.VERTEX|GPUBufferUsage.COPY_DST});this.device.queue.writeBuffer(buffer,0,raw);entry.attributes.set(attribute.name,buffer);return buffer;
 }
 uploadTexture(pixels,srgb=false,comparison=false){
  if(pixels.gpuTexture){if(srgb||comparison)throw Error('Incompatible render-to-texture sampling');return pixels.gpuTexture;}
  let versions=this.textureTable.get(pixels);if(!versions){versions=new Map();this.textureTable.set(pixels,versions);}const key=String(!!srgb)+':'+String(!!comparison);if(versions.has(key)){const gpu=versions.get(key),entry=this.textureEntries.get(gpu);if(entry){this.textureEntries.delete(gpu);this.textureEntries.set(gpu,entry);}return gpu;}
  const info=textureDescriptor(pixels,srgb,comparison,this.bc);
  if(comparison){const gpu=this.uploadDepth(pixels);this.rememberTexture(gpu,pixels,versions,key);return gpu;}
  const gpu=this.device.createTexture({size:[pixels.width,pixels.height,1],mipLevelCount:pixels.levels.length,format:info.format,usage:GPUTextureUsage.TEXTURE_BINDING|GPUTextureUsage.COPY_DST});
  try {for(let mip=0;mip<pixels.levels.length;mip++){
   const width=Math.max(1,pixels.width>>mip),height=Math.max(1,pixels.height>>mip),raw=pixels.levels[mip];if(!raw)throw Error('Missing raw texture mip '+mip);
   let bytes,cols=width,rows=height,rowBytes=4*width;
   if(info.convert==='depth'){bytes=new Float32Array(width*height);for(let i=0;i<bytes.length;i++)bytes[i]=raw[i*4]/255;bytes=new Uint8Array(bytes.buffer);}
   else if(info.convert==='alpha'){bytes=new Uint8Array(width*height*4);for(let i=0;i<raw.length;i++)bytes[i*4+3]=raw[i];}
   else if(info.convert==='rgb565'){bytes=new Uint8Array(width*height*4);for(let i=0;i<width*height;i++)bytes.set([...c565(raw[i*2]|raw[i*2+1]<<8),255],i*4);}
   else if(info.convert==='bc'){bytes=decodeBC(raw,width,height,pixels.format);}
   else if([71,72,77,78,98,99].includes(pixels.format)&&this.bc){bytes=raw;cols=Math.ceil(width/4);rows=Math.ceil(height/4);rowBytes=info.block*cols;}
   else{bytes=raw;}
   const pad=paddedRows(bytes,cols,rows,rowBytes);
   const blockCompressed=!info.convert&&[71,72,77,78,98,99].includes(pixels.format);
   this.device.queue.writeTexture({texture:gpu,mipLevel:mip},pad.data,{bytesPerRow:pad.bytesPerRow,rowsPerImage:rows},{width:blockCompressed?cols*4:width,height:blockCompressed?rows*4:height,depthOrArrayLayers:1});
  }this.rememberTexture(gpu,pixels,versions,key);return gpu;}
  catch(e){gpu.destroy();throw e;}
 }
 uploadDepth(pixels){
  const device=this.device,gpu=device.createTexture({size:[pixels.width,pixels.height],mipLevelCount:pixels.levels.length,format:'depth32float',usage:GPUTextureUsage.TEXTURE_BINDING|GPUTextureUsage.RENDER_ATTACHMENT});
  if(!this.depthUploadPipeline){
   const module=device.createShaderModule({code:`@group(0) @binding(0) var<storage,read> depths:array<f32>;
@vertex fn vs(@builtin(vertex_index) i:u32)->@builtin(position) vec4f {let p=vec2f(f32((i<<1u)&2u),f32(i&2u));return vec4f(p*2-vec2f(1),0,1);}
@fragment fn fs(@builtin(position) p:vec4f)->@builtin(frag_depth) f32 {return depths[1u+u32(p.y)*u32(depths[0])+u32(p.x)];}`});
   this.depthUploadPipeline=device.createRenderPipeline({layout:'auto',vertex:{module,entryPoint:'vs'},fragment:{module,entryPoint:'fs',targets:[]},depthStencil:{format:'depth32float',depthCompare:'always',depthWriteEnabled:true}});
  }
  const encoder=device.createCommandEncoder(),buffers=[];
  for(let mip=0;mip<pixels.levels.length;mip++){
   const width=Math.max(1,pixels.width>>mip),height=Math.max(1,pixels.height>>mip),values=new Float32Array(1+width*height);values[0]=width;
   for(let i=0;i<width*height;i++)values[i+1]=pixels.levels[mip][i*4]/255;
   const buffer=device.createBuffer({size:values.byteLength,usage:GPUBufferUsage.STORAGE|GPUBufferUsage.COPY_DST});buffers.push(buffer);device.queue.writeBuffer(buffer,0,values);
   const group=device.createBindGroup({layout:this.depthUploadPipeline.getBindGroupLayout(0),entries:[{binding:0,resource:{buffer}}]});
   const pass=encoder.beginRenderPass({colorAttachments:[],depthStencilAttachment:{view:gpu.createView({baseMipLevel:mip,mipLevelCount:1}),depthLoadOp:'clear',depthStoreOp:'store',depthClearValue:1}});
   pass.setPipeline(this.depthUploadPipeline);pass.setBindGroup(0,group);pass.draw(3);pass.end();
  }
  device.queue.submit([encoder.finish()]);for(const buffer of buffers)buffer.destroy();return gpu;
 }
 rememberTexture(gpu,pixels,versions,key){
  // Account for the format actually uploaded. Charging native BC textures as
  // RGBA evicts a visible deck's shared frames on every animation tick, even
  // while their real mip payloads fit comfortably inside the same budget.
  const compressed=gpu.format.startsWith('bc'),blockBytes=gpu.format.startsWith('bc1-')?8:16;
  let bytes=0;for(let mip=0;mip<gpu.mipLevelCount;mip++){
   const width=Math.max(1,gpu.width>>mip),height=Math.max(1,gpu.height>>mip);
   bytes+=compressed?Math.ceil(width/4)*Math.ceil(height/4)*blockBytes:width*height*4;
  }
  versions.set(key,gpu);this.textureList.add(gpu);this.textureEntries.set(gpu,{versions,key,bytes});this.textureBytes+=bytes;
 }
 dropTexture(gpu){const entry=this.textureEntries.get(gpu);if(entry){entry.versions.delete(entry.key);this.textureBytes-=entry.bytes;this.textureEntries.delete(gpu);}this.textureList.delete(gpu);gpu.destroy();}
 trimTextures(){for(const gpu of this.textureEntries.keys()){if(this.textureBytes<=128*1024*1024&&this.textureEntries.size<=256)break;this.dropTexture(gpu);}}
 releaseTexture(pixels){const variants=this.textureTable.get(pixels);if(!variants)return;for(const gpu of [...variants.values()])this.dropTexture(gpu);this.textureTable.delete(pixels);}
 sampler(settings={},mips=1,compare=false){const key=JSON.stringify([settings,mips,compare]);if(this.samplers.has(key))return this.samplers.get(key);
  const wraps=['repeat','clamp-to-edge','mirror-repeat','mirror-repeat'],filter=Number(settings.filter??1),texFilter=filter===0?'nearest':'linear';
  const requested=Number(settings.anisotropy??1),mode=this.sources.frames?.pipelineAnisotropy;
  const anisotropy=filter===0?1:Math.min(16,Math.max(1,mode===0?1:mode===2&&requested>0?Math.max(9,requested):requested));
  const value=this.device.createSampler({addressModeU:wraps[settings.wrapU??1],addressModeV:wraps[settings.wrapV??1],addressModeW:wraps[settings.wrapW??1],magFilter:texFilter,minFilter:texFilter,mipmapFilter:anisotropy>1||mips>1&&filter===2?'linear':'nearest',lodMinClamp:0,lodMaxClamp:Math.max(0,mips-1),maxAnisotropy:anisotropy,...(compare?{compare:'less-equal'}:{})});
  this.samplers.set(key,value);return value;
 }
 module(id){if(this.modules.has(id))return this.modules.get(id);
  const task=(async()=>{const spec=this.extraPrograms?.get(id)||(typeof this.programs==='function'?await this.programs(id):this.programs[id]);if(!spec)throw Error('Missing source WGSL shader '+id);
   const module=this.device.createShaderModule({label:`HS ${spec.stage} ${id}`,code:spec.wgsl});
   const messages=(await module.getCompilationInfo()).messages.filter(m=>m.type==='error');
   if(messages.length)throw Error(`WGSL compile failed ${id}: `+messages.map(m=>`${m.lineNum}:${m.linePos} ${m.message}`).join('; '));
   return {spec,module};
  })().catch(error=>{this.modules.delete(id);throw error;});
  this.modules.set(id,task);return task;
 }
 async pipeline(draw,targetFormat='rgba8unorm'){
  const key=draw.vertexProgram+'|'+draw.fragmentProgram+'|'+targetFormat+'|'+JSON.stringify(draw.state);
  if(this.pipelines.has(key))return this.pipelines.get(key);
  const p=this._createPipeline(draw,targetFormat);this.pipelines.set(key,p);
  try{return await p;}catch(error){this.pipelines.delete(key);throw error;}
 }
 async _createPipeline(draw,targetFormat){
  const [v,f]=await Promise.all([this.module(draw.vertexProgram),this.module(draw.fragmentProgram)]),device=this.device;
  if(v.spec.stage!=='vertex'||f.spec.stage!=='fragment')throw Error('Shader stage mismatch');
  const states=webgpuRenderState(draw.state);
  if(states.depthClipDisabled&&!this.depthClipControl)throw Error('Original zClip=Off requires unsupported WebGPU depth-clip-control feature');
  const makeGroup=(spec,shaderVisibility,kind)=>device.createBindGroupLayout({entries:kind==='buffer'?spec.buffers.map(b=>({binding:b.binding,visibility:shaderVisibility,buffer:{type:'uniform',minBindingSize:b.size}})):[
    ...spec.textures.map(t=>({binding:t.binding,visibility:shaderVisibility,texture:{sampleType:t.comparison?'depth':'float'}})),
    ...spec.samplers.map(s=>({binding:s.binding,visibility:shaderVisibility,sampler:{type:s.comparison?'comparison':'filtering'}}))]});
  const layouts=[makeGroup(v.spec,GPUShaderStage.VERTEX,'buffer'),makeGroup(f.spec,GPUShaderStage.FRAGMENT,'buffer'),makeGroup(v.spec,GPUShaderStage.VERTEX,'texture'),makeGroup(f.spec,GPUShaderStage.FRAGMENT,'texture')];
  const layout=device.createPipelineLayout({bindGroupLayouts:layouts});
  const vertexBuffers=v.spec.attributes.map(a=>({arrayStride:16,attributes:[{shaderLocation:a.location,offset:0,format:a.components===1?'float32':`float32x${a.components}`}]}));
  const pending=device.createRenderPipelineAsync({label:`HS ${draw.shader} ${draw.pass}`,
   layout,vertex:{module:v.module,entryPoint:'main',buffers:vertexBuffers},
   fragment:{module:f.module,entryPoint:'main',targets:[{format:targetFormat,...states.color}]},
   primitive:{...states.primitive,...(states.depthClipDisabled?{unclippedDepth:true}:{})},depthStencil:states.depthStencil,multisample:{count:1}});
  // Flush the device while preparing the first scene. Otherwise some Dawn
  // backends leave asynchronous pipeline callbacks waiting for a submission
  // that the first scene itself is waiting on. No draw or resource changes.
  device.queue.submit([]);
  const pipeline=await pending;
  return {pipeline,layouts,v:v.spec,f:f.spec,stencilReference:states.stencilReference};
 }
 _bindGroup(pipelineSpec,stage,draw){const spec=stage==='vertex'?pipelineSpec.v:pipelineSpec.f,layouts=pipelineSpec.layouts;
  const index=stage==='vertex'?0:1,resources=draw[stage+'Buffers'];let bufferGroup=null,textureGroup=null;
  if(spec.buffers.length){const entries=spec.buffers.map(b=>{
   let raw;
   if(stage==='fragment'&&b.name==='hscard_mipBias'&&b.slot===-999){
    const values=new Float32Array(64);
    for(const t of draw.fragmentTextures||[]){if(t.sampler>=0&&t.sampler<16)values[t.sampler*4]=Number(t.texture.sampler?.bias||0);}
    raw=new Uint8Array(values.buffer);
   }else{
    const item=resources.find(x=>x.slot===b.slot);
    if(!item)throw Error(`Missing ${stage} UBO ${b.slot}`);
    raw=item.data;
   }
   return {binding:b.binding,resource:this.arena.alloc(raw,b.size)};
  });bufferGroup=this.device.createBindGroup({layout:layouts[index],entries});}
  if(spec.textures.length||spec.samplers.length){const entries=[],list=draw[stage+'Textures'];for(const t of spec.textures){const item=list.find(x=>x.slot===t.slot);
    if(!item)throw Error(`Missing ${stage} texture ${t.name}`);
    const texture=this.uploadTexture(item.texture.pixels,item.srgb,t.comparison);
    entries.push({binding:t.binding,resource:texture.createView()});
   }
   for(const s of spec.samplers){const item=list.find(x=>x.sampler===s.slot)||list.find(x=>s.textureSlots?.includes(x.slot));if(!item)throw Error(`Missing ${stage} sampler ${s.slot} in ${draw.shader}`);
    entries.push({binding:s.binding,resource:this.sampler(item.texture.sampler,item.texture.pixels.levels.length,s.comparison)});
   }
   textureGroup=this.device.createBindGroup({layout:layouts[index+2],entries});}
  return {bufferGroup,textureGroup};
 }
 _target(width,height,texture=null){const t=texture??this.device.createTexture({size:[width,height],format:'rgba8unorm',usage:GPUTextureUsage.RENDER_ATTACHMENT|GPUTextureUsage.TEXTURE_BINDING|GPUTextureUsage.COPY_SRC});
    const depth=this.device.createTexture({size:[width,height],format:'depth24plus-stencil8',usage:GPUTextureUsage.RENDER_ATTACHMENT}),target={width,height,texture:t,depth,view:t.createView(),depthView:depth.createView()};this.targets.set(target,target);return target;
 }
 createTarget(width,height){return this._target(width,height);}
 createTextTarget(width,height){return this._target(width,height);}
 releaseTextTarget(t){t?.texture.destroy();t?.depth.destroy();this.targets.delete(t);}
 releaseTarget(t){this.releaseTextTarget(t);}
 async _draws(draws){const meshes=await Promise.all(draws.map(x=>this.geometry(x.mesh)));
  const desc=await Promise.all(draws.map(d=>this.pipeline(d)));
  // No texture downloads or pipeline compilations inside a live render pass.
  return draws.map((draw,i)=>({draw,mesh:meshes[i],gpu:this.getMesh(meshes[i]),spec:desc[i],vertex:this._bindGroup(desc[i],'vertex',draw),fragment:this._bindGroup(desc[i],'fragment',draw)}));
 }
 /** Emit a native pass without submitting. The same prepared draw commands can
  * be reused for the black/white transparency reconstruction passes. */
 _encodeScene(encoder,target,prepared,clear){
  const pass=encoder.beginRenderPass({colorAttachments:[{view:target.view,loadOp:'clear',storeOp:'store',clearValue:rgba(...clear)}],
   depthStencilAttachment:{view:target.depthView,depthLoadOp:'clear',depthStoreOp:'store',depthClearValue:1,stencilLoadOp:'clear',stencilStoreOp:'store',stencilClearValue:0}});
  for(const item of prepared){const {mesh,gpu,spec,vertex,fragment}=item;
   pass.setPipeline(spec.pipeline);pass.setStencilReference(spec.stencilReference||0);
   for(const [i,group] of [vertex.bufferGroup,fragment.bufferGroup,vertex.textureGroup,fragment.textureGroup].entries())if(group)pass.setBindGroup(i,group);
   for(const [i,attr] of spec.v.attributes.entries())pass.setVertexBuffer(i,this.vertexBuffer(mesh,attr));
   pass.setIndexBuffer(gpu.index,'uint32');pass.drawIndexed(mesh.indices.length);
  }
  pass.end();
 }
 async renderTo(target,draws,clear=[0,0,0,0]){
  if(this.lostReason)throw Error('WebGPU device lost: '+this.lostReason);
  this.arena.reset();const prepared=await this._draws(draws),encoder=this.device.createCommandEncoder();
  this._encodeScene(encoder,target,prepared,clear);
  this.arena.flush();
  this.device.queue.submit([encoder.finish()]);this.trimTextures();return target;
 }
 _alphaTargets(width,height){
  const key=width+'x'+height;
  let scratch=this.alphaScratch.get(key);
  if(scratch){this.alphaScratch.delete(key);this.alphaScratch.set(key,scratch);return scratch;}
  scratch={black:this.createTarget(width,height),white:this.createTarget(width,height)};
  this.alphaScratch.set(key,scratch);
  // Only retain two sizes. GPU queue preserves command ordering, so reuse
  // of a scratch attachment on the next submitted render is safe.
  while(this.alphaScratch.size>2){const oldKey=this.alphaScratch.keys().next().value,old=this.alphaScratch.get(oldKey);
   this.alphaScratch.delete(oldKey);this.releaseTarget(old.black);this.releaseTarget(old.white);}
  return scratch;
 }
 async _alphaPipeline(){
  if(this.compositor)return this.compositor;
  const shader=`@group(0) @binding(0) var blackImage:texture_2d<f32>; @group(0) @binding(1) var whiteImage:texture_2d<f32>;
struct V { @builtin(position) pos:vec4f }; @vertex fn vs_main(@builtin(vertex_index) id:u32)->V { let p=vec2f(f32((id<<1u)&2u),f32(id&2u));return V(vec4f(p*2.0-vec2f(1),0,1)); }
@fragment fn fs_main(@builtin(position) position:vec4f)->@location(0) vec4f {let pix=vec2i(position.xy);let b=textureLoad(blackImage,pix,0).rgb;let w=textureLoad(whiteImage,pix,0).rgb;let a=max(max(b.r,max(b.g,b.b)),round(clamp(255.0-dot(w-b,vec3f(85)),0,255))/255);return vec4f(select(vec3f(0),b/max(a,1e-10),a>0),a);}`;
  const module=this.device.createShaderModule({code:shader});
  this.compositor=this.device.createRenderPipelineAsync({layout:'auto',vertex:{module,entryPoint:'vs_main'},fragment:{module,entryPoint:'fs_main',targets:[{format:'rgba8unorm'}]},primitive:{topology:'triangle-list'}}).catch(e=>{this.compositor=null;throw e;});
  return this.compositor;
 }
 async transparent(width,height,draws,destination,isCurrent=()=>true){
  if(!destination)throw Error('WebGPU native transparent pass requires an explicit render target');
  if(this.lostReason)throw Error('WebGPU device lost: '+this.lostReason);
  // Resolve textures, geometry, uniforms and pipelines once; encode the entire
  // two-pass scene and alpha composite into ONE GPU command buffer/submission.
  // This is particularly important for 30 continuously animated golden cards.
  const alphaPipeline=await this._alphaPipeline();
  this.arena.reset();const prepared=await this._draws(draws);
  if(!isCurrent())return false;
  const {black,white}=this._alphaTargets(width,height);
  const encoder=this.device.createCommandEncoder();
  this._encodeScene(encoder,black,prepared,[0,0,0,0]);
  this._encodeScene(encoder,white,prepared,[1,1,1,1]);
  const bindGroup=this.device.createBindGroup({layout:alphaPipeline.getBindGroupLayout(0),entries:[{binding:0,resource:black.view},{binding:1,resource:white.view}]});
  const pass=encoder.beginRenderPass({colorAttachments:[{view:destination.view,loadOp:'clear',storeOp:'store',clearValue:{r:0,g:0,b:0,a:0}}]});
  pass.setPipeline(alphaPipeline);pass.setBindGroup(0,bindGroup);pass.draw(3);pass.end();
  this.arena.flush();
  this.device.queue.submit([encoder.finish()]);this.trimTextures();return true;
 }
 releaseMesh(mesh){const entry=this.gpuMeshes.get(mesh);if(!entry)return;entry.index.destroy();for(const buffer of entry.attributes.values())buffer.destroy();this.meshResources.delete(entry);this.gpuMeshes.delete(mesh);}
 dispose(){for(const texture of [...this.textureList])this.dropTexture(texture);for(const item of this.targets.values())this.releaseTarget(item);this.targets.clear();
  for(const mesh of this.meshResources){mesh.index.destroy();for(const buffer of mesh.attributes.values())buffer.destroy();}this.meshResources.clear();
  for(const scratch of this.alphaScratch.values()){this.releaseTarget(scratch.black);this.releaseTarget(scratch.white);}
  this.alphaScratch.clear();this.arena.destroy();}
}
