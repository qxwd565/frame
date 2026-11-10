import fs from 'node:fs/promises';
import z from 'node:zlib';
import crypto from 'node:crypto';
import {spawn} from 'node:child_process';
import {fileURLToPath} from 'node:url';
import {withReflection} from './dxbc-reflection.mjs';
import path from 'node:path';
import {pathToFileURL} from 'node:url';
const {parseGlsl,validate,writeWgsl}=await import(process.env.NAGA_MODULE?pathToFileURL(process.env.NAGA_MODULE).href:'naga-wasm');
const root=pathToFileURL(path.resolve(process.argv[3]||'.build/shaders')+path.sep);await fs.mkdir(new URL('extracted/',root),{recursive:true});
const bank=JSON.parse(z.gunzipSync(await fs.readFile(process.argv[2]||new URL('inputs/current-shaders.json.gz',import.meta.url))));
const child=spawn(process.env.HLSLCC_TRANSLATOR||fileURLToPath(new URL('translate-vulkan.exe',import.meta.url)),[],{windowsHide:true});
let pending=Buffer.alloc(0),waiting,diagnostics='';
child.stdout.on('data',b=>{pending=Buffer.concat([pending,b]);if(waiting&&pending.length>=4&&pending.length>=4+pending.readUInt32LE(0)){const n=pending.readUInt32LE(0),s=pending.subarray(4,4+n).toString();pending=pending.subarray(4+n);const w=waiting;waiting=null;w.resolve(s);}});
child.stderr.on('data',b=>diagnostics+=b);
child.on('error',e=>waiting?.reject(e));child.on('exit',code=>{if(waiting)waiting.reject(Error('HLSLcc exited '+code));});
async function translate(bytes){const header=Buffer.alloc(4);header.writeUInt32LE(bytes.length);const task=new Promise((resolve,reject)=>waiting={resolve,reject});child.stdin.write(header);child.stdin.write(bytes);return task;}
function location(name,attribute){
 const m=/^(?:in_|vs_)?(POSITION|NORMAL|TANGENT|COLOR|TEXCOORD)(?:index)?(\d+)$/.exec(name);
 if(!m)throw Error('Unmapped native semantic '+name);
 const index=Number(m[2]);
 if(attribute)return {POSITION:0,NORMAL:1,TANGENT:2,COLOR:3,TEXCOORD:4}[m[1]]+index;
 return {POSITION:14,NORMAL:12,TANGENT:13,COLOR:10,TEXCOORD:0}[m[1]]+index;
}
// Only resource/interface declarations and API sampler bias are adapted here.
// Arithmetic and control flow are compiled by HLSLcc and Naga, never rewritten
// into WGSL using regular-expression substitutions.
function bind(source,stage){
 const group=stage==='vertex'?0:1,meta={stage,buffers:[],textures:[],samplers:[],attributes:[],inputs:[],outputs:[]};
 source=source.replace(/const (\w+) (\w+)\[\] = \1\[(\d+)\]/g,'const $1 $2[$3] = $1[$3]');
 source=source.replace(/layout\(set = \d+, binding = \d+, std140\) uniform ([vf])_buffer(\d+) \{\s*vec4 [vf]_cb\d+(?:\[(\d+)\])?;/g,(_,prefix,slot,count)=>{
  const binding=Number(slot);meta.buffers.push({name:prefix+'_buffer'+slot,slot:binding,binding,size:Number(count||1)*16});
  return `layout(set = ${group}, binding = ${binding}, std140) uniform ${prefix}_buffer${slot} {\n vec4 ${prefix}_cb${slot}${count?'['+count+']':''};`;
 });
 source=source.replace(/layout\(set = \d+, binding = \d+\) uniform\s+(?:(?:lowp|mediump|highp)\s+)?(samplerShadow|sampler|texture2D)\s+(sampler[vf]_s\d+|[vf]_t\d+);/g,(_,type,name)=>{
  const slot=Number(name.match(/\d+$/)[0]),binding=slot*2+(type.startsWith('sampler')?1:0);
  const item={name,slot,binding,comparison:type==='samplerShadow'};meta[type.startsWith('sampler')?'samplers':'textures'].push(item);
  return `layout(set = ${group+2}, binding = ${binding}) uniform ${type} ${name};`;
 });
 source=source.replace(/layout\(location = \d+\) (in|out)\s+(?:(?:lowp|mediump|highp)\s+)?(\w+) (\w+);/g,(_,direction,type,name)=>{
  const attribute=stage==='vertex'&&direction==='in',target=stage==='fragment'&&direction==='out';
  const loc=target?Number(name.match(/\d+$/)?.[0]||0):location(name,attribute);
  const components=Number(type.match(/[234]$/)?.[0]||1),item={name:attribute?name.slice(3):name,location:loc,components,type};
  meta[attribute?'attributes':direction==='in'?'inputs':'outputs'].push(item);
  return `layout(location = ${loc}) ${direction} ${type} ${name};`;
 });
 for(const m of source.matchAll(/sampler2DShadow\(\s*([vf]_t\d+)\s*,\s*(sampler[vf]_s\d+)\s*\)/g)){
  for(const [list,name] of [[meta.textures,m[1]],[meta.samplers,m[2]]]){const found=list.find(t=>t.name===name);if(!found)throw Error('Unbound comparison resource');found.comparison=true;}
 }
 let usedBias=false;
 if(stage==='fragment'){
  const pattern=/\b(textureGrad|texture)\s*\(/g;let result='',start=0,match;
  while((match=pattern.exec(source))){let depth=1,end=pattern.lastIndex,args=[],at=pattern.lastIndex;
   for(;end<source.length&&depth;end++){const c=source[end];if(c==='(')depth++;else if(c===')')depth--;else if(c===','&&depth===1){args.push(source.slice(at,end).trim());at=end+1;}}
   if(depth)throw Error('Unbalanced compiler texture call');args.push(source.slice(at,end-1).trim());
   const sampler=/^sampler2D\(\s*[vf]_t\d+\s*,\s*sampler[vf]_s(\d+)\s*\)$/.exec(args[0]);let replacement=source.slice(match.index,end);
   if(sampler){const index=Number(sampler[1]);if(index>=16)throw Error('Sampler bias budget');const bias=`hscard_bias.values[${index}].x`;
    if(match[1]==='texture'&&(args.length===2||args.length===3)){args[2]=args.length===2?bias:`(${args[2]})+${bias}`;usedBias=true;}
    else if(match[1]==='textureGrad'&&args.length===4){args[2]=`(${args[2]})*exp2(${bias})`;args[3]=`(${args[3]})*exp2(${bias})`;usedBias=true;}
    replacement=match[1]+'('+args.join(',')+')';
   }
   result+=source.slice(start,match.index)+replacement;start=end;pattern.lastIndex=end;
  }
  source=result+source.slice(start);
 }
 if(usedBias){source=source.replace('#version 440','#version 440\nlayout(set = 1, binding = 31, std140) uniform HScardSamplerBias { vec4 values[16]; } hscard_bias;');meta.buffers.push({name:'hscard_mipBias',slot:-999,binding:31,size:256});}
 // HLSLcc declares SSA scratch registers globally. Scope them to its sole main
 // function so WGSL uniformity analysis can follow uniform material branches.
 // No computation is moved across a branch, and registers start at zero.
 const scratch=[];
 source=source.replace(/^(float|int|uint|bool|[biu]?vec[234]) (u_xlat\w*);$/gm,(_,type,name)=>{scratch.push(`${type} ${name} = ${type}(${type==='bool'?'false':'0'});`);return '';});
 source=source.replace(/void main\(\)\s*\{/,m=>m+'\n'+scratch.join('\n'));
 for(const sampler of meta.samplers){
  sampler.textureSlots=[...new Set([...source.matchAll(/sampler2D(?:Shadow)?\(\s*[vf]_t(\d+)\s*,\s*sampler[vf]_s(\d+)\s*\)/g)].filter(m=>Number(m[2])===sampler.slot).map(m=>Number(m[1])))];
 }
 return {source,meta};
}
const programs={},failures=[],seen=new Set();let references=0;
try {for(const shader of bank.shaders)for(const sub of shader.subshaders)for(const pass of sub.passes)for(const stage of ['vertex','fragment'])for(const variant of pass[stage].variants){
 references++;const id=variant.sha256;
 if(!seen.has(id)){seen.add(id);let module,info;
  try{const glsl=await translate(withReflection(Buffer.from(variant.code,'base64'),variant.layout,stage));if(!glsl)throw Error('Empty HLSLcc output');
   const adapted=bind(glsl,stage);module=parseGlsl(adapted.source,{stage});info=validate(module);const wgsl=writeWgsl(module,info);
   programs[id]={id,...adapted.meta,wgsl,sourceSha256:id,wgslSha256:crypto.createHash('sha256').update(wgsl).digest('hex')};
  }catch(e){failures.push({id,shader:shader.name,stage,error:e.formatted||e.message});}
  finally{info?.free();module?.free();}
  if(seen.size%200===0)console.log(JSON.stringify({processed:seen.size,failed:failures.length}));
 }
 delete variant.code;
}}finally{child.stdin.end();}
await fs.writeFile(new URL('extracted/wgsl-programs.json.gz',root),z.gzipSync(JSON.stringify(programs),{level:9}));
await fs.writeFile(new URL('extracted/shader-library.json.gz',root),z.gzipSync(JSON.stringify(bank),{level:9}));
const report={schema:1,compiler:'Unity HLSLcc 3ea1fcd6 + Naga 30.0.1 (naga-wasm 30.2.0)',shaders:bank.shaders.length,programs:seen.size,compiled:Object.keys(programs).length,references,failures,diagnostics};
await fs.writeFile(new URL('extracted/compiler-report.json',root),JSON.stringify(report,null,2));console.log(JSON.stringify({...report,failures:failures.slice(0,12),diagnostics:diagnostics.slice(0,1000)}));
if(failures.length)process.exitCode=1;
