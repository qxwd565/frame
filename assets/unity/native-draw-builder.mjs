// Browser-side equivalent of HS Plus LocalDrawBuilder's shader selection and
// constant packing. Source programs remain the translated original shaders.
const f=Math.fround;
export function multiply(a,b){const out=new Float32Array(16);for(let col=0;col<4;col++)for(let row=0;row<4;row++){let v=0;for(let k=0;k<4;k++)v=f(v+f(a[k*4+row]*b[col*4+k]));out[col*4+row]=v;}return out;}
export function inverse(input){const a=Array.from({length:4},(_,r)=>Array.from({length:8},(_,c)=>c<4?input[c*4+r]:(c-4===r?1:0)));for(let c=0;c<4;c++){let pivot=c;for(let r=c+1;r<4;r++)if(Math.abs(a[r][c])>Math.abs(a[pivot][c]))pivot=r;if(Math.abs(a[pivot][c])<1e-12)throw Error('Singular original transform');[a[c],a[pivot]]=[a[pivot],a[c]];const scale=a[c][c];for(let k=0;k<8;k++)a[c][k]/=scale;for(let r=0;r<4;r++)if(r!==c){const v=a[r][c];for(let k=0;k<8;k++)a[r][k]-=v*a[c][k];}}const out=new Float32Array(16);for(let r=0;r<4;r++)for(let c=0;c<4;c++)out[c*4+r]=a[r][c+4];return out;}
function select(stage,keywords){const relevant=new Set(stage.variants.flatMap(v=>v.keywords||[])),active=new Set(keywords.filter(x=>relevant.has(x))),matches=stage.variants.filter(v=>(v.keywords||[]).length===active.size&&(v.keywords||[]).every(x=>active.has(x)));if(matches.length!==1)throw Error('Missing or ambiguous original shader variant');return matches[0];}
const zeroMatrix=new Float32Array(16);
function matrices(view,projection,world){let vp;const combined=()=>vp??=(multiply(projection,view));return{unity_ObjectToWorld:world,_Object2World:world,get _World2Object(){return inverse(world);},get glstate_matrix_mvp(){return multiply(combined(),world);},get unity_WorldToObject(){return inverse(world);},get unity_MatrixVP(){return combined();},unity_MatrixV:view,get unity_MatrixInvV(){return inverse(view);},unity_MatrixP:projection,glstate_matrix_projection:projection,get unity_MatrixInvP(){return inverse(projection);},get unity_MatrixInvVP(){return inverse(combined());}};}
function value(name,material,properties,ctx){
  if(name.endsWith('_ST')&&material.textures[name.slice(0,-3)])return material.textures[name.slice(0,-3)].st;
  if(name.endsWith('_TexelSize')&&material.textures[name.slice(0,-10)]){const t=material.textures[name.slice(0,-10)].pixels;return[f(1/t.width),f(1/t.height),t.width,t.height];}
  if(name==='_ShaderTime'&&!Object.hasOwn(material.values,name)&&!properties.has(name))return[f(ctx.time/20)];
  if(name==='_Time')return[f(ctx.time/20),f(ctx.time),f(ctx.time*2),f(ctx.time*3)];
  if(name==='_SinTime')return[8,4,2,1].map(x=>f(Math.sin(f(ctx.time/x))));
  if(name==='_CosTime')return[8,4,2,1].map(x=>f(Math.cos(f(ctx.time/x))));
  if(name==='_ScreenParams')return[ctx.width,ctx.height,f(1+f(1/ctx.width)),f(1+f(1/ctx.height))];
  if(name==='unity_WorldTransformParams')return[0,0,0,1];if(name==='_GlobalMipBias')return[0,1];
  if(material.shader.startsWith('Native/')){
    if(name==='unity_Scale')return[1,1,1,1];
    if(name==='_WorldSpaceCameraPos')return Array.from(inverse(ctx.view)).slice(12,15);
    if(name==='_LightColor0'||name==='glstate_lightmodel_ambient')return[1,1,1,1];
  }
  if(name==='_MainLightColor'||['unity_SHAr','unity_SHAg','unity_SHAb'].includes(name))return name==='_MainLightColor'?[1,1,1,1]:[0,0,0,1];
  const property=properties.get(name);let result=material.values[name]||property?.defaults||[0,0,0,0];
  if(ctx.linear&&property?.m_Type===0)result=result.map((n,i)=>i>=3?n:n<=.04045?f(n/12.92):f(Math.pow((n+.055)/1.055,2.4)));
  return result;
}
function buffers(layout,material,properties,ctx,matrix){
  const definitions=new Map(layout.buffers.map(x=>[x.name,x]));return layout.binding.map(binding=>{
    const def=definitions.get(binding.name);if(!def||def.structs?.length)throw Error('Unsupported original uniform layout');
    const bytes=new Uint8Array(Math.ceil(def.size/16)*16),view=new DataView(bytes.buffer);
    for(const p of def.vectors){const data=value(p.name,material,properties,ctx),arrays=Math.max(1,p.m_ArraySize);for(let i=0;i<arrays;i++){const count=Math.min(p.m_Dim,Math.max(0,data.length-i*4));for(let c=0;c<count;c++){const at=p.m_Index+i*16+c*4;if(p.m_Type===0)view.setFloat32(at,data[i*4+c],true);else view.setInt32(at,Math.trunc(data[i*4+c]),true);}}}
    for(const p of def.matrices){const data=matrix[p.name]||zeroMatrix;for(let c=0;c<4;c++)for(let r=0;r<p.m_RowCount;r++)view.setFloat32(p.m_Index+c*16+r*4,data[c*4+r],true);}
    return{slot:binding.slot,data:bytes};
  });
}
function state(s,material,properties,ctx){const v=x=>x?.name&&x.name!=='<noninit>'&&(Object.hasOwn(material.values,x.name)||properties.has(x.name))?value(x.name,material,properties,ctx)[0]:x?.val;
 return{source:v(s.rtBlend0.srcBlend),destination:v(s.rtBlend0.destBlend),sourceAlpha:v(s.rtBlend0.srcBlendAlpha),destinationAlpha:v(s.rtBlend0.destBlendAlpha),blendOperation:v(s.rtBlend0.blendOp),alphaOperation:v(s.rtBlend0.blendOpAlpha),colorMask:v(s.rtBlend0.colMask),depthTest:v(s.zTest),depthWrite:v(s.zWrite)!==0,depthClip:v(s.zClip)!==0,cull:v(s.culling),depthBias:v(s.offsetUnits),slopeBias:v(s.offsetFactor),stencilCompare:v(s.stencilOp.comp),stencilPass:v(s.stencilOp.pass),stencilFail:v(s.stencilOp.fail),stencilDepthFail:v(s.stencilOp.zFail),stencilRead:v(s.stencilReadMask),stencilWrite:v(s.stencilWriteMask),stencilReference:v(s.stencilRef)};}
export class NativeDrawBuilder {
  constructor(library,globalKeywords=[],resolveTexture){this.shaders=new Map(library.shaders.map(s=>[s.name,s]));this.globalKeywords=globalKeywords;this.resolveTexture=resolveTexture;this.defaults=new Map();}
  async draw(part,ctx){
    const shader=part.material.historicalShader||this.shaders.get(part.material.shader);if(shader&&shader.name!==part.material.shader)throw Error('Historical shader identity mismatch');if(!shader)throw Error('Original shader missing: '+part.material.shader);
    const sub=shader.subshaders.findIndex(x=>x.passes.every(p=>p.vertex.variants.length&&p.fragment.variants.length));if(sub<0)throw Error('Original shader program absent');
    const keywords=[...new Set([...(part.material.keywords||[]),...this.globalKeywords])],properties=new Map(shader.properties.map(p=>[p.m_Name,p])),textures={};
    for(const [name,texture] of Object.entries(part.material.textures))textures[name]={...texture,pixels:await this.resolveTexture(texture)};
    const material={...part.material,textures},matrix=matrices(ctx.view,ctx.projection,part.pose),used=new Set(),output=[];
    for(const pass of shader.subshaders[sub].passes){const mode=(pass.lightMode||'').toLowerCase();if(!['srpdefaultunlit','universalforward','lightweightforward'].includes(mode)||used.has(mode))continue;used.add(mode);
      const vertex=select(pass.vertex,keywords),fragment=select(pass.fragment,keywords);
      const bindings=layout=>layout.textures.map(t=>{let texture=material.textures[t.name];if(!texture){const name=properties.get(t.name)?.m_DefTexture?.m_DefaultName,v=name==='black'?0:name==='gray'?128:255,alpha=material.legacyGolden&&name==='black'?0:255,key=v+':'+alpha;if(!this.defaults.has(key))this.defaults.set(key,{pixels:{width:1,height:1,format:28,levels:[new Uint8Array([v,v,v,alpha])]},sampler:{filter:1,wrapU:1,wrapV:1,wrapW:1},st:[1,1,0,0]});texture=this.defaults.get(key);}return{slot:t.slot,sampler:t.sampler,texture,srgb:[29,72,78,99].includes(texture.pixels.format)};});
      output.push({historicalPrograms:material.historicalPrograms,path:part.path,slot:part.slot,mesh:part.mesh,shader:shader.name,subshader:sub,pass:pass.index,keywords,vertexProgram:vertex.sha256,fragmentProgram:fragment.sha256,vertexBuffers:buffers(vertex.layout,material,properties,ctx,matrix),fragmentBuffers:buffers(fragment.layout,material,properties,ctx,matrix),vertexTextures:bindings(vertex.layout),fragmentTextures:bindings(fragment.layout),state:state(pass.state,material,properties,ctx)});
    }
    return output;
  }
}
