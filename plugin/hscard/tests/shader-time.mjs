import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import {gunzipSync} from 'node:zlib';
import {HSPlusSources} from '../assets/unity/hsplus-sources.mjs';
import {FrameComposer} from '../assets/unity/frame-composition.mjs';
import {NativeDrawBuilder} from '../assets/unity/native-draw-builder.mjs';
import {cardSceneContext} from '../assets/unity/quantity-ribbon.mjs';

const root=new URL('../../../v7.14.4-webgpu-20261109/assets/unity/',import.meta.url);
const bytes=name=>fs.readFile(new URL(name,root)),json=async name=>JSON.parse(gunzipSync(await bytes(name)));
const [frames,settings,portraits,fits,watermarks,library]=await Promise.all([bytes('frames-constructed.json.gz'),bytes('text-settings.json.gz'),json('portrait-meshes.json.gz'),json('frame-fits.json.gz'),json('watermarks.json.gz'),json('shader-library.json.gz')]);
const sources=await HSPlusSources.load(frames,settings),composer=new FrameComposer(sources,portraits,fits,library,watermarks);
// No GPU/image decoding is required to audit native uniform packing.
const pixel={width:1,height:1,format:28,levels:[new Uint8Array([255,255,255,255])]},builder=new NativeDrawBuilder(library,sources.frames.pipelineKeywords,async()=>pixel);
function read(draw,shader,name){for(const stage of ['vertex','fragment']){
 const variant=shader.subshaders[draw.subshader].passes.find(p=>p.index===draw.pass)[stage].variants.find(v=>v.sha256===draw[stage+'Program']);
 for(const buffer of variant.layout.buffers){const field=buffer.vectors.find(v=>v.name===name);if(!field)continue;const slot=variant.layout.binding.find(b=>b.name===buffer.name).slot,data=draw[stage+'Buffers'].find(b=>b.slot===slot).data,view=new DataView(data.buffer,data.byteOffset,data.byteLength);return Array.from({length:field.m_Dim},(_,i)=>view.getFloat32(field.m_Index+i*4,true));}
}throw Error('Uniform missing: '+name);}
const results=[];
for(const golden of [false,true]){
 const frame=composer.compose({kind:'MINION',cardClass:'NEUTRAL',golden,rarity:'RARE',race:'',school:'',cost:3,attack:2,health:2,armor:0,tags:{},artPixels:pixel,set:'EXPERT1'});
 for(const part of frame.parts.filter(p=>/Gem_(Mana|Attack|Health)$/.test(p.path))){
  const shader=library.shaders.find(s=>s.name===part.material.shader),speeds=Object.fromEntries(['_XSpeed','_YSpeed'].map(name=>[name,part.material.values[name]||shader.properties.find(p=>p.m_Name===name)?.defaults]));
  for(const time of [0,1,10,60]){
   const [draw]=await builder.draw(part,{...cardSceneContext(frame.fit,1),time});
   assert.deepEqual(read(draw,shader,'_Time'),[time/20,time,time*2,time*3].map(Math.fround));
   for(const [name,value] of Object.entries(speeds))assert.deepEqual(read(draw,shader,name),[Math.fround(value[0])]);
  }
  results.push({golden,part:part.path.split('/').at(-1),speeds});
 }
}
assert.equal(results.length,6);
console.log(JSON.stringify({ok:true,seconds:[0,1,10,60],results}));
