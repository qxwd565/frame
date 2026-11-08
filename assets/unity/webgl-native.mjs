// WebGL execution of the translated HS Plus source shaders. Card composition,
// assets and text layout are supplied separately by the HS Plus adapters.
import {decodeMesh} from './hsplus-sources.mjs?ver=hsplus-cards-9';

async function inflate64(value){const binary=atob(value),bytes=new Uint8Array(binary.length);for(let i=0;i<binary.length;i++)bytes[i]=binary.charCodeAt(i);return new Response(new Blob([bytes]).stream().pipeThrough(new DecompressionStream('gzip'))).arrayBuffer();}
function bytes64(value){const binary=atob(value),bytes=new Uint8Array(binary.length);for(let i=0;i<binary.length;i++)bytes[i]=binary.charCodeAt(i);return bytes.buffer;}
function fragmentSource(source){
  // D3D sampler mip bias is a shader argument in WebGL. Preserve that source
  // value and the opposite framebuffer derivative direction.
  const pattern=/\b(textureGrad|texture|dFdy)\s*\(/g;let out='',start=0,match;
  while((match=pattern.exec(source))){let depth=1,end=pattern.lastIndex,args=[],at=pattern.lastIndex;
    for(;end<source.length&&depth;end++){const ch=source[end];if(ch==='(')depth++;else if(ch===')')depth--;else if(ch===','&&depth===1){args.push(source.slice(at,end).trim());at=end+1;}}
    if(depth)throw Error('Invalid translated fragment shader');args.push(source.slice(at,end-1).trim());const fn=match[1],original=source.slice(match.index,end);let replacement=original;
    if(fn==='dFdy')replacement='(-'+original+')';
    else{const binding=/^(?:hlslcc_zcmp)?f_t\d+TEX_with_SMPf_s(\d+)$/.exec(args[0]);if(binding&&Number(binding[1])<16){const bias='hs_mipBias['+binding[1]+']';if(fn==='texture'&&(args.length===2||args.length===3)){if(args.length===2)args.push(bias);else args[2]='('+args[2]+')+'+bias;replacement='texture('+args.join(',')+')';}else if(fn==='textureGrad'&&args.length===4){args[2]='('+args[2]+')*exp2('+bias+')';args[3]='('+args[3]+')*exp2('+bias+')';replacement='textureGrad('+args.join(',')+')';}}}
    out+=source.slice(start,match.index)+replacement;start=end;pattern.lastIndex=end;
  }
  return(out+source.slice(start)).replace('#version 300 es','#version 300 es\nuniform highp float hs_mipBias[16];');
}

export class WebGLNativeRenderer {
  constructor(canvas,programs,sources){
    this.canvas=canvas;this.gl=canvas.getContext('webgl2',{alpha:true,antialias:false,premultipliedAlpha:false,depth:true,stencil:true,preserveDrawingBuffer:true});if(!this.gl)throw Error('WebGL 2 is unavailable');
    this.programs=programs;this.sources=sources;this.compiled=new Map();this.meshes=new Map();this.textures=new WeakMap();this.textureOrder=new Map();this.textureBytes=0;this.samplers=new Map();this.vaos=new Map();this.vaoOrder=new Map();this.vaoBytes=0;
    this.s3tc=this.gl.getExtension('WEBGL_compressed_texture_s3tc');this.s3tcSrgb=this.gl.getExtension('WEBGL_compressed_texture_s3tc_srgb');this.anisotropy=this.gl.getExtension('EXT_texture_filter_anisotropic');
  }
  program(vertex,fragment){
    const id=vertex+':'+fragment;if(this.compiled.has(id)){const value=this.compiled.get(id);this.compiled.delete(id);this.compiled.set(id,value);return value;}const gl=this.gl,v=this.programs[vertex],f=this.programs[fragment];if(!v||!f)throw Error('Original shader program missing');
    const compile=(type,source)=>{const shader=gl.createShader(type);gl.shaderSource(shader,source);gl.compileShader(shader);if(!gl.getShaderParameter(shader,gl.COMPILE_STATUS)){const message=gl.getShaderInfoLog(shader);gl.deleteShader(shader);throw Error('Shader compile: '+message);}return shader;};
    const vs=compile(gl.VERTEX_SHADER,v.source.replace('void main()', 'void hs_original_main()')+'\nvoid main(){hs_original_main();gl_Position.z=2.0*gl_Position.z-gl_Position.w;}\n'),fs=compile(gl.FRAGMENT_SHADER,fragmentSource(f.source)),p=gl.createProgram();gl.attachShader(p,vs);gl.attachShader(p,fs);gl.linkProgram(p);gl.deleteShader(vs);gl.deleteShader(fs);if(!gl.getProgramParameter(p,gl.LINK_STATUS))throw Error('Shader link: '+gl.getProgramInfoLog(p));
    const blocks=[];for(let i=0;i<gl.getProgramParameter(p,gl.ACTIVE_UNIFORM_BLOCKS);i++){const name=gl.getActiveUniformBlockName(p,i),m=/^([vf])_buffer(\d+)$/.exec(name);if(!m)throw Error('Unexpected original uniform block '+name);gl.uniformBlockBinding(p,i,i);blocks.push({stage:m[1]==='v'?'vertex':'fragment',slot:Number(m[2]),index:i,size:gl.getActiveUniformBlockParameter(p,i,gl.UNIFORM_BLOCK_DATA_SIZE),buffer:gl.createBuffer()});}
    const attrs=[];for(let i=0;i<gl.getProgramParameter(p,gl.ACTIVE_ATTRIBUTES);i++){const a=gl.getActiveAttrib(p,i);if(!a.name.startsWith('in_'))throw Error('Unexpected vertex attribute '+a.name);attrs.push({name:a.name.slice(3),location:gl.getAttribLocation(p,a.name)});}
    const uniforms=[];for(let i=0;i<gl.getProgramParameter(p,gl.ACTIVE_UNIFORMS);i++){const u=gl.getActiveUniform(p,i);if(![gl.SAMPLER_2D,gl.SAMPLER_2D_SHADOW,gl.INT_SAMPLER_2D,gl.UNSIGNED_INT_SAMPLER_2D].includes(u.type))continue;const m=/^(?:hlslcc_zcmp)?([vf])_t(\d+)(?:TEX_with_SMP[vf]_s(\d+))?$/.exec(u.name);if(!m)throw Error('Unexpected original texture binding '+u.name);uniforms.push({stage:m[1]==='v'?'vertex':'fragment',slot:Number(m[2]),sampler:m[3]===undefined?-1:Number(m[3]),location:gl.getUniformLocation(p,u.name),type:u.type});}
    const result={program:p,blocks,attrs,uniforms,bias:gl.getUniformLocation(p,'hs_mipBias[0]')};
    while(this.compiled.size>=128){const oldest=this.compiled.keys().next().value,entry=this.compiled.get(oldest);this.compiled.delete(oldest);for(const vao of [...this.vaoOrder.keys()])if(vao.program===entry)this.releaseVao(vao);for(const block of entry.blocks)gl.deleteBuffer(block.buffer);gl.deleteProgram(entry.program);}
    this.compiled.set(id,result);return result;
  }
  async geometry(ref){
    if(ref.attributes&&ref.indices)return ref;const key=ref.sha256||ref.key+':'+ref.slot;if(this.meshes.has(key))return this.meshes.get(key);
    let mesh;if(ref.encoded)mesh=decodeMesh(ref.gzip?await inflate64(ref.encoded):bytes64(ref.encoded));else{const values=await this.sources.meshes(ref.key);mesh=values[Math.min(ref.slot,values.length-1)];}this.meshes.set(key,mesh);return mesh;
  }
  releaseTexture(pixels){
    const variants=this.textures.get(pixels);if(!variants)return;
    for(const entry of variants.values()){this.textureOrder.delete(entry);this.textureBytes-=entry.bytes;this.gl.deleteTexture(entry.texture);}
    variants.clear();this.textures.delete(pixels);
  }
  uploadTexture(pixels,srgb,comparison=false){
    const gl=this.gl;let variants=this.textures.get(pixels);if(!variants){variants=new Map();this.textures.set(pixels,variants);}const cacheKey=String(!!srgb)+':'+String(comparison);if(variants.has(cacheKey)){const entry=variants.get(cacheKey);this.textureOrder.delete(entry);this.textureOrder.set(entry,entry);return entry.texture;}
    const texture=gl.createTexture();try{gl.bindTexture(gl.TEXTURE_2D,texture);gl.pixelStorei(gl.UNPACK_ALIGNMENT,1);
    for(let i=0;i<pixels.levels.length;i++){const w=Math.max(1,pixels.width>>i),h=Math.max(1,pixels.height>>i),raw=pixels.levels[i];
      if(comparison){if(pixels.format!==28||srgb)throw Error('Unsupported original shadow texture');const depth=new Float32Array(w*h);for(let n=0;n<depth.length;n++)depth[n]=raw[n*4]/255;gl.texImage2D(gl.TEXTURE_2D,i,gl.DEPTH_COMPONENT32F,w,h,0,gl.DEPTH_COMPONENT,gl.FLOAT,depth);}
      else if(pixels.format===28||pixels.format===29)gl.texImage2D(gl.TEXTURE_2D,i,srgb?gl.SRGB8_ALPHA8:gl.RGBA8,w,h,0,gl.RGBA,gl.UNSIGNED_BYTE,raw);
      else if(pixels.format===65){const rgba=new Uint8Array(w*h*4);for(let n=0;n<raw.length;n++)rgba[n*4+3]=raw[n];gl.texImage2D(gl.TEXTURE_2D,i,gl.RGBA8,w,h,0,gl.RGBA,gl.UNSIGNED_BYTE,rgba);}
      else if([71,72,77,78].includes(pixels.format)){const ext=srgb?this.s3tcSrgb:this.s3tc;if(!ext)throw Error('Original compressed texture format is not supported');const dxt1=[71,72].includes(pixels.format),format=srgb?(dxt1?ext.COMPRESSED_SRGB_ALPHA_S3TC_DXT1_EXT:ext.COMPRESSED_SRGB_ALPHA_S3TC_DXT5_EXT):(dxt1?ext.COMPRESSED_RGBA_S3TC_DXT1_EXT:ext.COMPRESSED_RGBA_S3TC_DXT5_EXT);gl.compressedTexImage2D(gl.TEXTURE_2D,i,format,w,h,0,raw);}
      else throw Error('Unsupported source texture format '+pixels.format);
    }
    gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_BASE_LEVEL,0);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MAX_LEVEL,pixels.levels.length-1);
    const bytes=pixels.levels.reduce((n,x)=>n+x.length*(pixels.format===65?4:1),0),entry={texture,variants,cacheKey,bytes};
    while(this.textureOrder.size&&(this.textureOrder.size>=256||this.textureBytes+bytes>128*1024*1024)){const old=this.textureOrder.keys().next().value;this.textureOrder.delete(old);old.variants.delete(old.cacheKey);this.textureBytes-=old.bytes;gl.deleteTexture(old.texture);}
    variants.set(cacheKey,entry);this.textureOrder.set(entry,entry);this.textureBytes+=bytes;return texture;}catch(error){gl.deleteTexture(texture);throw error;}
  }
  sampler(settings,levels,comparison=false){
    const gl=this.gl,s=settings||{},key=JSON.stringify([s,levels,comparison]);if(this.samplers.has(key))return this.samplers.get(key);const value=gl.createSampler(),wrap=[gl.REPEAT,gl.CLAMP_TO_EDGE,gl.MIRRORED_REPEAT,gl.MIRRORED_REPEAT],filter=Number(s.filter??1);
    gl.samplerParameteri(value,gl.TEXTURE_WRAP_S,wrap[s.wrapU??1]);gl.samplerParameteri(value,gl.TEXTURE_WRAP_T,wrap[s.wrapV??1]);gl.samplerParameteri(value,gl.TEXTURE_MAG_FILTER,filter===0?gl.NEAREST:gl.LINEAR);
    const requested=Number(s.anisotropy??1),aniso=this.sources.frames.pipelineAnisotropy===0?0:this.sources.frames.pipelineAnisotropy===2&&requested>0?Math.max(9,requested):requested;
    gl.samplerParameteri(value,gl.TEXTURE_MIN_FILTER,levels===1?(filter===0?gl.NEAREST:gl.LINEAR):filter!==0&&aniso>1?gl.LINEAR_MIPMAP_LINEAR:[gl.NEAREST_MIPMAP_NEAREST,gl.LINEAR_MIPMAP_NEAREST,gl.LINEAR_MIPMAP_LINEAR][filter]);
    if(comparison){gl.samplerParameteri(value,gl.TEXTURE_COMPARE_MODE,gl.COMPARE_REF_TO_TEXTURE);gl.samplerParameteri(value,gl.TEXTURE_COMPARE_FUNC,gl.LEQUAL);}
    if(this.anisotropy)gl.samplerParameterf(value,this.anisotropy.TEXTURE_MAX_ANISOTROPY_EXT,filter===0?1:Math.max(1,Math.min(aniso||1,gl.getParameter(this.anisotropy.MAX_TEXTURE_MAX_ANISOTROPY_EXT))));this.samplers.set(key,value);return value;
  }
  applyState(s){
    const gl=this.gl,blend=[gl.ZERO,gl.ONE,gl.DST_COLOR,gl.SRC_COLOR,gl.ONE_MINUS_DST_COLOR,gl.SRC_ALPHA,gl.ONE_MINUS_SRC_COLOR,gl.DST_ALPHA,gl.ONE_MINUS_DST_ALPHA,gl.SRC_ALPHA_SATURATE,gl.ONE_MINUS_SRC_ALPHA],ops=[gl.FUNC_ADD,gl.FUNC_SUBTRACT,gl.FUNC_REVERSE_SUBTRACT,gl.MIN,gl.MAX],compare=[gl.ALWAYS,gl.NEVER,gl.LESS,gl.EQUAL,gl.LEQUAL,gl.GREATER,gl.NOTEQUAL,gl.GEQUAL,gl.ALWAYS],stencil=[gl.KEEP,gl.ZERO,gl.REPLACE,gl.INCR,gl.DECR,gl.INVERT,gl.INCR_WRAP,gl.DECR_WRAP];
    const alpha=x=>({2:7,3:5,4:8,6:10,9:1})[x]??x;
    if(s.source===1&&s.destination===0&&s.sourceAlpha===1&&s.destinationAlpha===0)gl.disable(gl.BLEND);else gl.enable(gl.BLEND);
    gl.blendFuncSeparate(blend[s.source],blend[s.destination],blend[alpha(s.sourceAlpha)],blend[alpha(s.destinationAlpha)]);gl.blendEquationSeparate(ops[s.blendOperation],ops[s.alphaOperation]);
    gl.colorMask(!!(s.colorMask&8),!!(s.colorMask&4),!!(s.colorMask&2),!!(s.colorMask&1));if(s.depthTest===0)gl.disable(gl.DEPTH_TEST);else{gl.enable(gl.DEPTH_TEST);gl.depthFunc(compare[s.depthTest]);}gl.depthMask(!!s.depthWrite);
    if(s.cull===0)gl.disable(gl.CULL_FACE);else{gl.enable(gl.CULL_FACE);gl.cullFace(s.cull===1?gl.FRONT:gl.BACK);gl.frontFace(gl.CW);}
    const active=s.stencilCompare!==0&&(s.stencilCompare!==8||s.stencilPass!==0||s.stencilFail!==0||s.stencilDepthFail!==0);if(active){gl.enable(gl.STENCIL_TEST);gl.stencilFunc(compare[s.stencilCompare],s.stencilReference,s.stencilRead);gl.stencilMask(s.stencilWrite);gl.stencilOp(stencil[s.stencilFail],stencil[s.stencilDepthFail],stencil[s.stencilPass]);}else gl.disable(gl.STENCIL_TEST);
    if(s.depthBias||s.slopeBias){gl.enable(gl.POLYGON_OFFSET_FILL);gl.polygonOffset(s.slopeBias,s.depthBias);}else gl.disable(gl.POLYGON_OFFSET_FILL);
  }
  releaseVao(entry){const gl=this.gl;this.vaoOrder.delete(entry);this.vaoBytes-=entry.bytes;const list=this.vaos.get(entry.mesh);list?.delete(entry.program);if(list&&!list.size)this.vaos.delete(entry.mesh);gl.deleteVertexArray(entry.vao);for(const b of entry.buffers)gl.deleteBuffer(b);}
  vao(mesh,program){
    const gl=this.gl;let entries=this.vaos.get(mesh);if(entries?.has(program)){const hit=entries.get(program);this.vaoOrder.delete(hit);this.vaoOrder.set(hit,hit);return hit;}
    const vao=gl.createVertexArray(),buffers=[],missing=[];gl.bindVertexArray(vao);let bytes=mesh.indices.byteLength;
    for(const attr of program.attrs){const data=mesh.attributes.get(attr.name);if(data){const b=gl.createBuffer();buffers.push(b);bytes+=data.byteLength;gl.bindBuffer(gl.ARRAY_BUFFER,b);gl.bufferData(gl.ARRAY_BUFFER,data,gl.STATIC_DRAW);gl.enableVertexAttribArray(attr.location);gl.vertexAttribPointer(attr.location,4,gl.FLOAT,false,0,0);}else{gl.disableVertexAttribArray(attr.location);missing.push(attr);}}
    const index=gl.createBuffer();buffers.push(index);gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER,index);gl.bufferData(gl.ELEMENT_ARRAY_BUFFER,mesh.indices,gl.STATIC_DRAW);
    while(this.vaoOrder.size&&(this.vaoOrder.size>=1024||this.vaoBytes+bytes>64*1024*1024))this.releaseVao(this.vaoOrder.keys().next().value);
    entries=this.vaos.get(mesh);if(!entries){entries=new Map();this.vaos.set(mesh,entries);}const entry={mesh,program,vao,buffers,missing,bytes};entries.set(program,entry);this.vaoOrder.set(entry,entry);this.vaoBytes+=bytes;return entry;
  }
  async draw(draw){
    const gl=this.gl,p=this.program(draw.vertexProgram,draw.fragmentProgram),mesh=await this.geometry(draw.mesh);gl.useProgram(p.program);this.applyState(draw.state);
    const vao=this.vao(mesh,p);gl.bindVertexArray(vao.vao);for(const attr of vao.missing)gl.vertexAttrib4f(attr.location,...(attr.name.startsWith('COLOR')?[1,1,1,1]:[0,0,0,attr.name.startsWith('POSITION')?1:0]));
    for(const block of p.blocks){const entry=draw[block.stage+'Buffers'].find(x=>x.slot===block.slot);if(!entry)throw Error('Missing original constant buffer');gl.bindBuffer(gl.UNIFORM_BUFFER,block.buffer);const bytes=entry.data.length>=block.size?entry.data:new Uint8Array(block.size);if(bytes!==entry.data)bytes.set(entry.data);gl.bufferData(gl.UNIFORM_BUFFER,bytes,gl.DYNAMIC_DRAW);gl.bindBufferBase(gl.UNIFORM_BUFFER,block.index,block.buffer);}
    if(p.bias){const values=new Float32Array(16);for(const t of draw.fragmentTextures)if(t.sampler>=0&&t.sampler<values.length)values[t.sampler]=Number(t.texture.sampler?.bias||0);gl.uniform1fv(p.bias,values);}
    for(let unit=0;unit<p.uniforms.length;unit++){const u=p.uniforms[unit],bindings=draw[u.stage+'Textures'],binding=bindings.find(x=>x.slot===u.slot&&(u.sampler<0||x.sampler===u.sampler))||bindings.find(x=>x.slot===u.slot);if(!binding)throw Error('Missing original texture slot '+u.slot);const pixels=binding.texture.pixels,comparison=u.type===gl.SAMPLER_2D_SHADOW;gl.activeTexture(gl.TEXTURE0+unit);gl.bindTexture(gl.TEXTURE_2D,this.uploadTexture(pixels,binding.srgb,comparison));gl.bindSampler(unit,this.sampler(binding.texture.sampler,pixels.levels.length,comparison));gl.uniform1i(u.location,unit);}
    // Check errors at the end of the card pass instead of synchronizing the
    // browser with the GPU after every individual draw.
    gl.drawElements(gl.TRIANGLES,mesh.indices.length,gl.UNSIGNED_INT,0);gl.bindVertexArray(null);
  }
  clear(width,height,color=[1,1,1,1]){const gl=this.gl;gl.bindFramebuffer(gl.FRAMEBUFFER,null);this.canvas.width=width;this.canvas.height=height;this.clearBound(width,height,color);}
  clearBound(width,height,color){const gl=this.gl;gl.viewport(0,0,width,height);gl.colorMask(true,true,true,true);gl.depthMask(true);gl.stencilMask(255);gl.clearColor(...color);gl.clearDepth(1);gl.clearStencil(0);gl.clear(gl.COLOR_BUFFER_BIT|gl.DEPTH_BUFFER_BIT|gl.STENCIL_BUFFER_BIT);}
  targets(width,height){
    const gl=this.gl,key=width+'x'+height;this.targetPool??=new Map();
    if(this.targetPool.has(key)){const hit=this.targetPool.get(key);this.targetPool.delete(key);this.targetPool.set(key,hit);return hit;}
    const result=[];for(let i=0;i<2;i++){const texture=gl.createTexture();gl.bindTexture(gl.TEXTURE_2D,texture);gl.texImage2D(gl.TEXTURE_2D,0,gl.RGBA8,width,height,0,gl.RGBA,gl.UNSIGNED_BYTE,null);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MIN_FILTER,gl.NEAREST);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MAG_FILTER,gl.NEAREST);const depth=gl.createRenderbuffer();gl.bindRenderbuffer(gl.RENDERBUFFER,depth);gl.renderbufferStorage(gl.RENDERBUFFER,gl.DEPTH24_STENCIL8,width,height);const fbo=gl.createFramebuffer();gl.bindFramebuffer(gl.FRAMEBUFFER,fbo);gl.framebufferTexture2D(gl.FRAMEBUFFER,gl.COLOR_ATTACHMENT0,gl.TEXTURE_2D,texture,0);gl.framebufferRenderbuffer(gl.FRAMEBUFFER,gl.DEPTH_STENCIL_ATTACHMENT,gl.RENDERBUFFER,depth);if(gl.checkFramebufferStatus(gl.FRAMEBUFFER)!==gl.FRAMEBUFFER_COMPLETE)throw Error('Card render target unavailable');result.push({texture,depth,fbo});}
    while(this.targetPool.size>=6){const oldest=this.targetPool.keys().next().value;for(const t of this.targetPool.get(oldest)){gl.deleteFramebuffer(t.fbo);gl.deleteTexture(t.texture);gl.deleteRenderbuffer(t.depth);}this.targetPool.delete(oldest);}
    this.targetPool.set(key,result);return result;
  }
  compositor(){
    if(this.composite)return this.composite;const gl=this.gl,compile=(type,source)=>{const s=gl.createShader(type);gl.shaderSource(s,source);gl.compileShader(s);if(!gl.getShaderParameter(s,gl.COMPILE_STATUS))throw Error('Alpha reconstruction shader: '+gl.getShaderInfoLog(s));return s;};
    const vertex=compile(gl.VERTEX_SHADER,'#version 300 es\nvoid main(){vec2 p=vec2(float((gl_VertexID<<1)&2),float(gl_VertexID&2));gl_Position=vec4(p*2.-1.,0.,1.); }'),fragment=compile(gl.FRAGMENT_SHADER,'#version 300 es\nprecision highp float;uniform highp sampler2D blackImage;uniform highp sampler2D whiteImage;out vec4 color;void main(){ivec2 p=ivec2(gl_FragCoord.xy);vec3 b=texelFetch(blackImage,p,0).rgb,w=texelFetch(whiteImage,p,0).rgb;float a=max(max(b.r,max(b.g,b.b)),roundEven(clamp(255.0-dot(w-b,vec3(85.0)),0.0,255.0))/255.0);color=vec4(a>0.0?b/a:vec3(0.0),a);}');
    const p=gl.createProgram();gl.attachShader(p,vertex);gl.attachShader(p,fragment);gl.linkProgram(p);gl.deleteShader(vertex);gl.deleteShader(fragment);if(!gl.getProgramParameter(p,gl.LINK_STATUS))throw Error('Alpha reconstruction link failed');this.composite={program:p,black:gl.getUniformLocation(p,'blackImage'),white:gl.getUniformLocation(p,'whiteImage'),vao:gl.createVertexArray()};return this.composite;
  }
  async transparent(width,height,draws,destination=null){
    const gl=this.gl;if(!destination){this.canvas.width=width;this.canvas.height=height;}const targets=this.targets(width,height);
    for(let pass=0;pass<2;pass++){gl.bindFramebuffer(gl.FRAMEBUFFER,targets[pass].fbo);this.clearBound(width,height,pass?[1,1,1,1]:[0,0,0,0]);for(const draw of draws)await this.draw(draw);}
    gl.bindFramebuffer(gl.FRAMEBUFFER,destination?.fbo??null);gl.viewport(0,0,width,height);gl.disable(gl.BLEND);gl.disable(gl.DEPTH_TEST);gl.disable(gl.STENCIL_TEST);gl.disable(gl.CULL_FACE);gl.colorMask(true,true,true,true);
    const p=this.compositor();gl.useProgram(p.program);gl.bindVertexArray(p.vao);for(let unit=0;unit<2;unit++){gl.activeTexture(gl.TEXTURE0+unit);gl.bindTexture(gl.TEXTURE_2D,targets[unit].texture);gl.bindSampler(unit,null);gl.uniform1i(unit?p.white:p.black,unit);}gl.drawArrays(gl.TRIANGLES,0,3);gl.bindVertexArray(null);const status=gl.getError();if(status!==gl.NO_ERROR)throw Error('Card transparency WebGL error '+status);
  }
}
