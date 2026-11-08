// Prototype: one WebGL surface, cached card pixels, and per-card viewports.
// The caller supplies visible, non-overlapping CSS rectangles and decides when
// each card must be rerendered; no assumptions about animation are made here.
export class MultiCardSurface {
  constructor(renderer, cards){this.renderer=renderer;this.cards=cards;this.items=new Map();this.goldenRefs=new Map();}
  createTarget(width,height){
    const gl=this.renderer.gl,texture=gl.createTexture(),fbo=gl.createFramebuffer();
    gl.bindTexture(gl.TEXTURE_2D,texture);gl.texImage2D(gl.TEXTURE_2D,0,gl.RGBA8,width,height,0,gl.RGBA,gl.UNSIGNED_BYTE,null);
    gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MIN_FILTER,gl.LINEAR);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_MAG_FILTER,gl.LINEAR);
    gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_WRAP_S,gl.CLAMP_TO_EDGE);gl.texParameteri(gl.TEXTURE_2D,gl.TEXTURE_WRAP_T,gl.CLAMP_TO_EDGE);
    gl.bindFramebuffer(gl.FRAMEBUFFER,fbo);gl.framebufferTexture2D(gl.FRAMEBUFFER,gl.COLOR_ATTACHMENT0,gl.TEXTURE_2D,texture,0);
    if(gl.checkFramebufferStatus(gl.FRAMEBUFFER)!==gl.FRAMEBUFFER_COMPLETE){gl.deleteFramebuffer(fbo);gl.deleteTexture(texture);throw Error('Card cache target unavailable');}
    return {texture,fbo,width,height};
  }
  remove(key){const item=this.items.get(key);if(!item)return;for(const target of [item.target,item.previewTarget])if(target){this.renderer.gl.deleteTexture(target.texture);this.renderer.gl.deleteFramebuffer(target.fbo);}this.items.delete(key);for(const pixels of item.prepared.goldenPixels||[]){const count=(this.goldenRefs.get(pixels)||1)-1;if(count)this.goldenRefs.set(pixels,count);else{this.goldenRefs.delete(pixels);this.renderer.releaseTexture(pixels);}}}
  async prepare(key,card,basePrepared=null){this.remove(key);const prepared=await this.cards.prepare(card,basePrepared),target=this.createTarget(prepared.context.width,prepared.context.height);this.items.set(key,{prepared,target});for(const pixels of prepared.goldenPixels||[])this.goldenRefs.set(pixels,(this.goldenRefs.get(pixels)||0)+1);}
  adopt(from,to){if(from===to)return;const item=this.items.get(from);if(!item)throw Error('Missing prepared card');this.remove(to);this.items.delete(from);this.items.set(to,item);}
  async update(key,time){const item=this.items.get(key);if(!item)throw Error('Unknown card '+key);await this.cards.renderPrepared(item.prepared,{transparent:true,time,destination:item.target});}
  async updatePreview(key,time){const item=this.items.get(key);if(!item)throw Error('Unknown card '+key);if(!item.previewTarget)item.previewTarget=this.createTarget(item.target.width,item.target.height);await this.cards.renderPrepared({...item.prepared,quantityDraws:[]},{transparent:true,time,destination:item.previewTarget});}
  trimPreviews(keep){for(const [key,item] of this.items)if(key!==keep&&item.previewTarget){this.renderer.gl.deleteTexture(item.previewTarget.texture);this.renderer.gl.deleteFramebuffer(item.previewTarget.fbo);item.previewTarget=null;}}
  program(){
    if(this.presentation)return this.presentation;const gl=this.renderer.gl;
    const compile=(type,source)=>{const s=gl.createShader(type);gl.shaderSource(s,source);gl.compileShader(s);if(!gl.getShaderParameter(s,gl.COMPILE_STATUS))throw Error(gl.getShaderInfoLog(s));return s;};
    const vs=compile(gl.VERTEX_SHADER,'#version 300 es\nout vec2 uv;void main(){vec2 p=vec2(float((gl_VertexID<<1)&2),float(gl_VertexID&2));uv=p;gl_Position=vec4(p*2.-1.,0.,1.);}'),fs=compile(gl.FRAGMENT_SHADER,'#version 300 es\nprecision highp float;in vec2 uv;uniform sampler2D image;out vec4 color;void main(){color=texture(image,uv);}');
    const program=gl.createProgram();gl.attachShader(program,vs);gl.attachShader(program,fs);gl.linkProgram(program);gl.deleteShader(vs);gl.deleteShader(fs);if(!gl.getProgramParameter(program,gl.LINK_STATUS))throw Error(gl.getProgramInfoLog(program));
    return this.presentation={program,vao:gl.createVertexArray(),image:gl.getUniformLocation(program,'image')};
  }
  present(width,height,placements,overlay=null){
    // Overlapping cards require explicit CSS stacking semantics, still to be
    // integrated with the site. Refuse rather than silently blend incorrectly.
    for(let i=0;i<placements.length;i++)for(let j=i+1;j<placements.length;j++){const a=placements[i],b=placements[j];if(a.x<b.x+b.width&&b.x<a.x+a.width&&a.y<b.y+b.height&&b.y<a.y+a.height)throw Error('Overlapping card viewports need stacking integration');}
    const gl=this.renderer.gl,canvas=this.renderer.canvas;if(canvas.width!==width)canvas.width=width;if(canvas.height!==height)canvas.height=height;
    gl.bindFramebuffer(gl.FRAMEBUFFER,null);gl.disable(gl.SCISSOR_TEST);gl.viewport(0,0,width,height);gl.colorMask(true,true,true,true);gl.clearColor(0,0,0,0);gl.clear(gl.COLOR_BUFFER_BIT);gl.disable(gl.BLEND);gl.disable(gl.DEPTH_TEST);gl.disable(gl.STENCIL_TEST);gl.disable(gl.CULL_FACE);
    const p=this.program();gl.useProgram(p.program);gl.bindVertexArray(p.vao);gl.activeTexture(gl.TEXTURE0);gl.bindSampler(0,null);gl.uniform1i(p.image,0);gl.enable(gl.SCISSOR_TEST);
    for(const rect of placements){const item=this.items.get(rect.key);if(!item)continue;const x=Math.round(rect.x),w=Math.round(rect.width),h=Math.round(rect.height),y=height-Math.round(rect.y)-h;if(w<=0||h<=0)continue;
      const c=rect.clip??{x:0,y:0,width,height},left=Math.max(0,x,Math.round(c.x)),right=Math.min(width,x+w,Math.round(c.x+c.width)),bottom=Math.max(0,y,height-Math.round(c.y+c.height)),top=Math.min(height,y+h,height-Math.round(c.y));if(right<=left||top<=bottom)continue;
      gl.viewport(x,y,w,h);gl.scissor(left,bottom,right-left,top-bottom);gl.bindTexture(gl.TEXTURE_2D,item.target.texture);gl.drawArrays(gl.TRIANGLES,0,3);
    }
    // The hover preview is deliberately drawn last, over the grid. It reuses
    // the prepared texture, including native golden animation and transparency.
    if(overlay){const item=this.items.get(overlay.key);if(item?.previewTarget){const x=Math.round(overlay.x),w=Math.round(overlay.width),h=Math.round(overlay.height),y=height-Math.round(overlay.y)-h;
      gl.viewport(x,y,w,h);gl.scissor(Math.max(0,x),Math.max(0,y),Math.min(width,x+w)-Math.max(0,x),Math.min(height,y+h)-Math.max(0,y));
      gl.enable(gl.BLEND);gl.blendFuncSeparate(gl.SRC_ALPHA,gl.ONE_MINUS_SRC_ALPHA,gl.ONE,gl.ONE_MINUS_SRC_ALPHA);
      gl.bindTexture(gl.TEXTURE_2D,item.previewTarget.texture);gl.drawArrays(gl.TRIANGLES,0,3);gl.disable(gl.BLEND);
    }}
    gl.disable(gl.SCISSOR_TEST);gl.bindVertexArray(null);const error=gl.getError();if(error!==gl.NO_ERROR)throw Error('Card surface WebGL error '+error);
  }
  dispose(){for(const key of [...this.items.keys()])this.remove(key);if(this.presentation){this.renderer.gl.deleteVertexArray(this.presentation.vao);this.renderer.gl.deleteProgram(this.presentation.program);this.presentation=null;}}
}
