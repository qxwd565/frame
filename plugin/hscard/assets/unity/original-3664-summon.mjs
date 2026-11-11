// 1.0.0.3664 source curve playback. This module does not claim Unity 4's
// particle RNG or billboard simulation is reproduced; those are separate.
import {resourceFetch,resourceURL} from './resource-url.mjs?ver=hscard-c488a93de0fce637';
import {decodeNativeDxtMips} from './native-texture-history.mjs?ver=hscard-c488a93de0fce637';
import {multiply,inverse} from './native-draw-builder.mjs?ver=hscard-c488a93de0fce637';

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

function particleMesh(settings,particles,time,world,view){
 const s=settings.particleSystem,initial=s.InitialModule,gradient=s.ColorModule.gradient.maxGradient,base=color32(initial.startColor.maxColor.rgba),camera=inverse(view);
 const right=[camera[0],camera[1],camera[2]],up=[camera[4],camera[5],camera[6]],scale=Math.cbrt(Math.abs((world[0]*(world[5]*world[10]-world[6]*world[9])-world[4]*(world[1]*world[10]-world[2]*world[9])+world[8]*(world[1]*world[6]-world[2]*world[5]))||1));
 const positions=[],colors=[],uvs=[],indices=[];let count=0;
 for(const p of particles){
  if(time<0||time>=p.life)continue;
  const t=time/p.life,size=p.size*originalMinMax(s.SizeModule.curve,t,0)*scale;if(size<=0)continue;
  const center=point(world,p.position[0]+p.velocity[0]*time,p.position[1]+p.velocity[1]*time,p.position[2]+(p.speed+p.velocity[2])*time),color=gradientValue(gradient,t).map((v,i)=>v*base[i]);
  const c=Math.cos(p.rotation),q=Math.sin(p.rotation),basisX=right.map((v,i)=>v*c+up[i]*q),basisY=up.map((v,i)=>v*c-right[i]*q);
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

/** Read the original 3664 source settings and compile the original D3D shader.
 * Consumers must choose an actual game summon event; this loader never starts
 * the effect merely because a card is displayed in a collection. */
export async function loadOriginal3664Summon(builder,renderer){
 const [data,bank]=await Promise.all([sourceJson('native-3664-summon.json.gz'),sourceJson('native-3664-summon-shaders.json.gz')]);
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
   const particles=create3664Burst(data,random);
   return {async draws(time,context,parent=identity()){
    if(!Number.isFinite(time)||time<0)throw Error('Invalid summon time');
    const result=[],transient=[],sample={enabled:!!sampleOriginalCurve(curves.m_Enabled,time),alpha:sampleOriginalCurve(curves['_TintColor.a'],time)};
    if(sample.enabled){const tint=scryMaterial.values._TintColor.slice();tint[3]=sample.alpha;
     result.push(...await builder.draw({path:'3664:SummonIn/ScryLines',slot:0,mesh:scryMesh,pose:pose(data.scryChain,parent),material:{...scryMaterial,values:{...scryMaterial.values,_TintColor:tint}}},context));}
    const mesh=particleMesh(data,particles,time,pose(data.particleChain,parent),context.view);
    if(mesh.indices.length){transient.push(mesh);result.push(...await builder.draw({path:'3664:SummonIn/FX_BlueRays',slot:0,mesh,pose:identity(),material:particleMaterial},context));}
    return{draws:result,transient,complete:time>=Math.max(...particles.map(p=>p.life),1.35)};
   }};
  }};
}
