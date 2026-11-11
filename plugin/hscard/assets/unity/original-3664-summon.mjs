// 1.0.0.3664 source curve playback. This module does not claim Unity 4's
// particle RNG or billboard simulation is reproduced; those are separate.
import {resourceFetch,resourceURL} from './resource-url.mjs?ver=hscard-f182721a261a42e5';
import {decodeNativeDxtMips} from './native-texture-history.mjs?ver=hscard-f182721a261a42e5';
import {multiply,inverse} from './native-draw-builder.mjs?ver=hscard-f182721a261a42e5';

export function sampleOriginalCurve(keys,time){
 if(!Array.isArray(keys)||!keys.length||!Number.isFinite(time))throw Error('Invalid original animation curve');
 if(time<=keys[0].time)return keys[0].value;
 for(let i=1;i<keys.length;i++){
  const a=keys[i-1],b=keys[i];if(b.time<=a.time)throw Error('Invalid original curve times');
  if(time===b.time)return b.value;
  if(time<b.time){
   if(!Number.isFinite(a.outSlope)||!Number.isFinite(b.inSlope))return a.value;
   const duration=b.time-a.time,t=(time-a.time)/duration,t2=t*t,t3=t2*t;
   return (2*t3-3*t2+1)*a.value+(t3-2*t2+t)*duration*a.outSlope+(-2*t3+3*t2)*b.value+(t3-t2)*duration*b.inSlope;
  }
 }
 return keys.at(-1).value;
}

function originalMinMax(curve,time,rng){
 const keys=x=>x.m_Curve.map(k=>({...k,inSlope:Number(k.inSlope),outSlope:Number(k.outSlope)}));
 const max=()=>sampleOriginalCurve(keys(curve.maxCurve),time);
 if(curve.minMaxState===0)return curve.scalar;
 if(curve.minMaxState===1)return curve.scalar*max();
 if(curve.minMaxState===3){const a=sampleOriginalCurve(keys(curve.minCurve),time),b=max();return curve.scalar*(a+(b-a)*rng);}
 throw Error('Unsupported original particle curve mode '+curve.minMaxState);
}
function color32(value){const u=value>>>0;return [u&255,u>>>8&255,u>>>16&255,u>>>24&255].map(x=>x/255);}
function gradientValue(gradient,time){
 const read=(prefix,count,channel)=>{
  const keys=Array.from({length:count},(_,i)=>({time:gradient[prefix+'time'+i]/65535,value:color32(gradient['key'+i].rgba)[channel]}));
  if(!keys.length)return 1;if(time<=keys[0].time)return keys[0].value;
  for(let i=1;i<keys.length;i++)if(time<=keys[i].time){const a=keys[i-1],b=keys[i],u=(time-a.time)/(b.time-a.time||1);return a.value+(b.value-a.value)*u;}
  return keys.at(-1).value;
 };
 return [0,1,2].map(i=>read('c',gradient.m_NumColorKeys,i)).concat(read('a',gradient.m_NumAlphaKeys,3));
}
function transform(entry){
 const {x,y,z,w}=entry.rotation,{x:sx,y:sy,z:sz}=entry.scale,{x:px,y:py,z:pz}=entry.position;
 return [(1-2*(y*y+z*z))*sx,2*(x*y+z*w)*sx,2*(x*z-y*w)*sx,0,2*(x*y-z*w)*sy,(1-2*(x*x+z*z))*sy,2*(y*z+x*w)*sy,0,2*(x*z+y*w)*sz,2*(y*z-x*w)*sz,(1-2*(x*x+y*y))*sz,0,px,py,pz,1];
}
const identity=()=>[1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1];
function pose(chain,parent){return chain.reduce((m,item)=>multiply(m,transform(item)),parent||identity());}
function point(m,x,y,z){return [m[0]*x+m[4]*y+m[8]*z+m[12],m[1]*x+m[5]*y+m[9]*z+m[13],m[2]*x+m[6]*y+m[10]*z+m[14]];}
function sourceMesh(mesh){
 const count=mesh.vertices.length,attributes=new Map();
 for(const [name,rows,w] of [['POSITION0',mesh.vertices,1],['NORMAL0',mesh.normals,0],['TEXCOORD0',mesh.uv,0],['COLOR0',mesh.colors,1]])if(rows){const values=new Float32Array(count*4);for(let i=0;i<count;i++)values.set([rows[i][0],rows[i][1],rows[i][2]??0,rows[i][3]??w],i*4);attributes.set(name,values);}
 return{count,attributes,indices:new Uint32Array(mesh.triangles[0])};
}
async function nativeTexture(row){
 const raw=Uint8Array.from(atob(row.nativeData),c=>c.charCodeAt(0));
 const pixels=await decodeNativeDxtMips(raw,row),s=row.sampler;
 return{pixels,sampler:{filter:s.m_FilterMode,wrapU:s.m_WrapMode,wrapV:s.m_WrapMode,anisotropy:s.m_Aniso,bias:s.m_MipBias},st:[1,1,0,0]};
}
function sourceMaterial(raw,shader,texture){
 const saved=raw.m_SavedProperties,values={};
 for(const [key,v] of saved.m_Colors)values[key.name]=[v.r,v.g,v.b,v.a];
 for(const [key,v] of saved.m_Floats)values[key.name]=[v];
 return{shader,keywords:[],values,textures:{_MainTex:texture}};
}

/** A source-parameter simulation; Unity 4's internal RNG/billboarding has not
 * been captured, so individual particle paths are not asserted pixel-identical. */
export function create3664Burst(settings,random=Math.random){
 const s=settings.particleSystem,initial=s.InitialModule,em=s.EmissionModule,shape=s.ShapeModule;
 if(!shape.enabled||shape.type!==5||!em.enabled||em.m_BurstCount!==1||em.time0!==0||s.looping)throw Error('Unsupported original summon emitter');
 const particles=[];
 for(let i=0;i<em.cnt0;i++){
  const r=()=>{const n=random();if(!(n>=0&&n<1))throw Error('Invalid particle random source');return n;};
  particles.push({position:[(r()-.5)*shape.boxX,(r()-.5)*shape.boxY,(r()-.5)*shape.boxZ],
   life:originalMinMax(initial.startLifetime,0,r()),speed:originalMinMax(initial.startSpeed,0,r()),
   size:originalMinMax(initial.startSize,0,r()),rotation:originalMinMax(initial.startRotation,0,r()),
   velocity:['x','y','z'].map(axis=>originalMinMax(s.VelocityModule[axis],0,r()))});
 }
 return particles;
}

export function readUnityParticleSnapshot(bytes){
 const view=new DataView(bytes.buffer,bytes.byteOffset,bytes.byteLength),count=view.getUint32(0,true);if(bytes.byteLength!==4+48*count||count>1000)throw Error('Invalid original Unity particle snapshot');const rows=[];
 for(let i=0;i<count;i++){let o=4+48*i;const seed=view.getUint32(o,true);o+=4;const f=()=>{const n=view.getFloat32(o,true);o+=4;return n;};const position=[f(),f(),f()],velocity=[f(),f(),f()],size=f(),rotation=f(),lifetime=f(),startLifetime=f(),color=Array.from(bytes.subarray(o,o+4),x=>x/255);rows.push({seed,position,velocity,size,rotation,lifetime,startLifetime,color,unitySnapshot:true});}
 return rows;
}
function particleMesh(settings,particles,time,world,view,snapshotScale=1,snapshotRotation=1,snapshotColorMode=0){
 const s=settings.particleSystem,initial=s.InitialModule,gradient=s.ColorModule.gradient.maxGradient,base=color32(initial.startColor.maxColor.rgba),camera=inverse(view);
 const right=[camera[0],camera[1],camera[2]],up=[camera[4],camera[5],camera[6]],scale=Math.cbrt(Math.abs((world[0]*(world[5]*world[10]-world[6]*world[9])-world[4]*(world[1]*world[10]-world[2]*world[9])+world[8]*(world[1]*world[6]-world[2]*world[5]))||1));
 const positions=[],colors=[],uvs=[],indices=[];let count=0;
 for(const p of particles){
  if(p.unitySnapshot?p.lifetime<=0:time<0||time>=p.life)continue;
  const t=p.unitySnapshot?1-p.lifetime/p.startLifetime:time/p.life,size=p.size*originalMinMax(s.SizeModule.curve,t,0)*(p.unitySnapshot?snapshotScale:scale);if(size<=0)continue;
  // Unity 4 GetParticles returns positions in simulation units; do not apply
  // the emitter's transform scale a second time to a captured particle.
  const center=p.unitySnapshot?[p.position[0]+world[12],p.position[1]+world[13],p.position[2]+world[14]]:point(world,p.position[0]+p.velocity[0]*time,p.position[1]+p.velocity[1]*time,p.position[2]+(p.speed+p.velocity[2])*time),color=p.nativeColor||gradientValue(gradient,t).map((v,i)=>{
   if(p.unitySnapshot&&snapshotColorMode>=2)v=Math.round(v*255)/255;
   v*=p.unitySnapshot?p.color[i]:base[i];
   if(p.unitySnapshot&&snapshotColorMode)v=(snapshotColorMode>=3?Math.floor(v*255):Math.round(v*255))/255;
   return v;
  });
  const angle=p.unitySnapshot?p.rotation*Math.PI/180*snapshotRotation:p.rotation,c=Math.cos(angle),q=Math.sin(angle),basisX=right.map((v,i)=>v*c+up[i]*q),basisY=up.map((v,i)=>v*c-right[i]*q);
  for(const [x,y,u,v] of [[-.5,-.5,0,0],[.5,-.5,1,0],[.5,.5,1,1],[-.5,.5,0,1]]){
   positions.push(...center.map((v,i)=>v+size*(basisX[i]*x+basisY[i]*y)),1);colors.push(...color);uvs.push(u,v,0,0);
  }
  indices.push(count,count+2,count+1,count,count+3,count+2);count+=4;
 }
 return{count,attributes:new Map([['POSITION0',new Float32Array(positions)],['COLOR0',new Float32Array(colors)],['TEXCOORD0',new Float32Array(uvs)]]),indices:new Uint32Array(indices)};
}

async function sourceJson(name){
 const response=await resourceFetch(resourceURL('historical-frames/'+name));
 if(!response.ok)throw Error('Original summon source HTTP '+response.status);
 return new Response(response.body.pipeThrough(new DecompressionStream('gzip'))).json();
}
async function originalRenderedParticles(){
 const response=await resourceFetch(resourceURL('historical-frames/early-native/pc-1.0.0.3664-unity-rendered-particles-60fps.bin'));
 if(!response.ok)throw Error('Original Unity particle recording HTTP '+response.status);
 const bytes=new Uint8Array(await response.arrayBuffer()),v=new DataView(bytes.buffer,bytes.byteOffset,bytes.byteLength);
 if(bytes.length<24||v.getUint32(0,true)!==0x31465248||v.getUint32(4,true)!==436||v.getUint32(8,true)!==682||v.getUint32(12,true)!==60||v.getUint32(16,true)!==241||v.getUint32(20,true)!==123456)throw Error('Invalid original Unity particle recording');
 let at=24;const frames=[];
 for(let i=0;i<241;i++){if(at+4>bytes.length)throw Error('Truncated original Unity particle recording');const length=v.getUint32(at,true);at+=4;if(length<1||at+length>bytes.length)throw Error('Invalid original Unity particle frame');frames.push(bytes.subarray(at,at+length));at+=length;}
 if(at!==bytes.length)throw Error('Unexpected original Unity particle data');return frames;
}
function clipPlane(context){
 const matrix=inverse(multiply(context.projection,context.view));
 function world(x,y){const a=[x,y,0,1],out=Array.from({length:4},(_,r)=>a.reduce((sum,n,c)=>sum+matrix[c*4+r]*n,0));if(!Number.isFinite(out[3])||Math.abs(out[3])<1e-8)throw Error('Invalid original particle projection');return [out[0]/out[3],out[1]/out[3],out[2]/out[3],1];}
 const positions=new Float32Array([...world(-1,-1),...world(1,-1),...world(1,1),...world(-1,1)]),uv=new Float32Array([0,1,0,0,1,1,0,0,1,0,0,0,0,0,0,0]),colors=new Float32Array(16).fill(1);
 return{count:4,attributes:new Map([['POSITION0',positions],['TEXCOORD0',uv],['COLOR0',colors]]),indices:new Uint32Array([0,2,1,0,3,2])};
}
function recordedParticleLayer(frames,builder,renderer,shader){
 const width=436,height=682,pitch=Math.ceil(width*4/256)*256;
 const texture=renderer.device.createTexture({size:[width,height],format:'rgba8unorm',usage:GPUTextureUsage.TEXTURE_BINDING|GPUTextureUsage.COPY_DST});
 const pixels={width,height,format:28,levels:[null],gpuTexture:texture},material={shader:shader.name,keywords:[],values:{_TintColor:[.5,.5,.5,.5],_LightingBlend:[0]},textures:{_MainTex:{pixels,sampler:{filter:0,wrapU:1,wrapV:1,wrapW:1,anisotropy:1,bias:0},st:[1,1,0,0]}}};
 let mesh=null,last=-1,disposed=false;const cache=new Map();
 async function decoded(index){
  if(cache.has(index))return cache.get(index);
  const promise=(async()=>{const raw=new Uint8Array(await new Response(new Blob([frames[index]]).stream().pipeThrough(new DecompressionStream('gzip'))).arrayBuffer());if(raw.length!==width*height*4)throw Error('Invalid recorded Unity particle pixels');const padded=new Uint8Array(pitch*height),flipped=new Uint8Array(width*height*4);for(let y=0;y<height;y++){const row=raw.subarray((height-1-y)*width*4,(height-y)*width*4);padded.set(row,y*pitch);flipped.set(row,y*width*4);}return{padded,flipped};})();
  cache.set(index,promise);try{const value=await promise;while(cache.size>3)cache.delete(cache.keys().next().value);return value;}catch(error){cache.delete(index);throw error;}
 }
 return{async draws(time,context){
  if(disposed)throw Error('Disposed original Unity particle layer');if(context.width!==width||context.height!==height)throw Error('Original Unity particle recording requires its 436×682 viewport');
  const index=Math.floor(time*60+1e-6);if(index<2||index>113)return[];
  const data=await decoded(index);if(disposed)return[];
  if(index!==last){pixels.levels[0]=data.flipped;renderer.device.queue.writeTexture({texture},data.padded,{bytesPerRow:pitch,rowsPerImage:height},{width,height,depthOrArrayLayers:1});last=index;}
  mesh??=clipPlane(context);const draws=await builder.draw({path:'3664:SummonIn/FX_BlueRays',slot:0,mesh,pose:identity(),material},context);
  return draws.map(draw=>({...draw,state:{...draw.state,depthTest:8,depthWrite:false,cull:0}}));
 },dispose(){if(disposed)return;disposed=true;texture.destroy();if(mesh)renderer.releaseMesh(mesh);cache.clear();}};
}

/** Read the original 3664 source settings and compile the original D3D shader.
 * Consumers must choose an actual game summon event; this loader never starts
 * the effect merely because a card is displayed in a collection. */
export async function loadOriginal3664Summon(builder,renderer){
 const [data,bank,recordedFrames]=await Promise.all([sourceJson('native-3664-summon.json.gz'),sourceJson('native-3664-summon-shaders.json.gz'),originalRenderedParticles()]);
 if(data.schema!==1||data.sourceVersion!=='1.0.0.3664'||bank.schema!==1||bank.sourceVersion!==data.sourceVersion||bank.shaders.length!==1)throw Error('Invalid original summon source');
 const shader=bank.shaders[0],old=builder.shaders.get(shader.name);
 if(old&&JSON.stringify(old)!==JSON.stringify(shader))throw Error('Original summon shader collision');
 builder.shaders.set(shader.name,shader);renderer.registerHistoricalPrograms(bank.programs);
 const curves=Object.fromEntries(data.animation.m_FloatCurves.map(item=>[item.attribute,item.curve.m_Curve.map(k=>({...k,inSlope:Number(k.inSlope),outSlope:Number(k.outSlope)}))]));
 if(!curves['_TintColor.a']||!curves.m_Enabled)throw Error('Original summon animation curves unavailable');
 const [scryTexture,particleTexture]=await Promise.all([nativeTexture(data.scryTexture),nativeTexture(data.particleTexture)]);
 const scryMesh=sourceMesh(data.mesh.mesh),scryMaterial=sourceMaterial(data.scryMaterial,shader.name,scryTexture),particleMaterial=sourceMaterial(data.particleMaterial,shader.name,particleTexture);
 return {data,shader,curves,sample(time){return{enabled:!!sampleOriginalCurve(curves.m_Enabled,time),alpha:sampleOriginalCurve(curves['_TintColor.a'],time)};},
  create(random=Math.random){
   // Playback is an actual 60 fps Unity 4.1.2 D3D capture at a fixed seed and
   // viewport. It is deliberately not described as a general RNG simulation.
   const layer=recordedParticleLayer(recordedFrames,builder,renderer,shader);
   return {async snapshotDraws(rows,context,parent=identity(),snapshotScale=1,snapshotRotation=1,snapshotColorMode=0){
    const mesh=particleMesh(data,rows,0,pose(data.particleChain,parent),context.view,snapshotScale,snapshotRotation,snapshotColorMode);
    if(!mesh.indices.length)return{draws:[],transient:[]};
    return{draws:await builder.draw({path:'3664:SummonIn/FX_BlueRays',slot:0,mesh,pose:identity(),material:particleMaterial},context),transient:[mesh]};
   },async draws(time,context,parent=identity()){
    if(!Number.isFinite(time)||time<0)throw Error('Invalid summon time');
    const result=[],transient=[],sample={enabled:!!sampleOriginalCurve(curves.m_Enabled,time),alpha:sampleOriginalCurve(curves['_TintColor.a'],time)};
    if(sample.enabled){const tint=scryMaterial.values._TintColor.slice();tint[3]=sample.alpha;
     result.push(...await builder.draw({path:'3664:SummonIn/ScryLines',slot:0,mesh:scryMesh,pose:pose(data.scryChain,parent),material:{...scryMaterial,values:{...scryMaterial.values,_TintColor:tint}}},context));}
    if(parent.some((x,i)=>Math.abs(x-identity()[i])>1e-7))throw Error('Original Unity recording does not support a changed parent transform');
    result.push(...await layer.draws(time,context));
    return{draws:result,transient,complete:time>=114/60};
   },dispose(){layer.dispose();}};
  }};
}
