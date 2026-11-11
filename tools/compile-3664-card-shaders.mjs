// Convert original 3664 D3D11 shader programs required by spell/weapon frames.
import fs from 'node:fs/promises';
import z from 'node:zlib';
import crypto from 'node:crypto';
import {spawn} from 'node:child_process';
import {pathToFileURL} from 'node:url';
import {withReflection} from './dxbc-reflection.mjs';

const root='v7.14.4-webgpu-20261109/assets/unity/historical-frames/';
const snapshot=JSON.parse(z.gunzipSync(await fs.readFile(root+'early-native/snapshots/pc-1.0.0.3664.json.gz')));
const summon=process.argv.includes('--summon');
const summonSource=summon?JSON.parse(await fs.readFile(root+'early-native/pc-1.0.0.3664-summon-source.json','utf8')):null;
const wanted=summon?['Additive']:snapshot.assets.filter(x=>x.type===48).map(x=>x.name).sort();
if(wanted.length!==(summon?1:14)||new Set(wanted).size!==wanted.length)throw Error('Unexpected 3664 shader inventory');
const sha=b=>crypto.createHash('sha256').update(b).digest('hex');
const compiler=await fs.readFile('tools/compile-shaders.mjs','utf8');
const bind=Function(compiler.slice(compiler.indexOf('function location('),compiler.indexOf('const programs={},failures=[]'))+';return bind;')();
const {parseGlsl,validate,writeWgsl}=await import(pathToFileURL('E:/HSdeck/.webgpu-work/tools/naga/dist/node.js').href);
const child=spawn('E:/HSdeck/.webgpu-work/translate-vulkan.exe',[],{windowsHide:true});
let pending=Buffer.alloc(0),waiting,errors='';
child.stdout.on('data',b=>{pending=Buffer.concat([pending,b]);if(waiting&&pending.length>=4&&pending.length>=4+pending.readUInt32LE(0)){const n=pending.readUInt32LE(0),s=pending.subarray(4,4+n).toString();pending=pending.subarray(4+n);const w=waiting;waiting=null;w.resolve(s);}});
child.stderr.on('data',b=>errors+=b);child.on('error',e=>waiting?.reject(e));child.on('exit',code=>waiting?.reject(Error('Translator exited '+code)));
const translate=b=>new Promise((resolve,reject)=>{waiting={resolve,reject};const h=Buffer.alloc(4);h.writeUInt32LE(b.length);child.stdin.write(h);child.stdin.write(b);});
function layout(source){
 const buffers=[],binding=[],textures=[];let current;
 for(const line of source.split('\n')){let m;
  if(m=/^ConstBuffer "([^"]+)" (\d+)/.exec(line)){current={name:m[1],size:+m[2],vectors:[],matrices:[],structs:[]};buffers.push(current);}
  else if(m=/^(Float|Vector|Matrix) (\d+) \[([^\]]+)\](?: (\d+))?/.exec(line)){
   if(!current)throw Error('Missing native constant buffer');const p={name:m[3],m_Index:+m[2],m_ArraySize:0,m_Type:0};
   if(m[1]==='Matrix'){p.m_RowCount=4;current.matrices.push(p);}else{p.m_Dim=m[1]==='Float'?1:+(m[4]||4);current.vectors.push(p);}
  }else if(m=/^BindCB\s+"([^"]+)" (\d+)/.exec(line))binding.push({name:m[1],slot:+m[2]});
  else if(m=/^SetTexture (\d+) \[([^\]]+)\] 2D (\d+)/.exec(line))textures.push({name:m[2],slot:+m[1],sampler:+m[3],dimension:2});
 }
 return{buffers,binding,textures};
}
const val=v=>({val:v,name:'<noninit>'});
function state(head){
 const blend=/\bBlend (\w+) (\w+)/.exec(head),factors={Zero:0,One:1,DstColor:2,SrcColor:3,OneMinusDstColor:4,SrcAlpha:5,OneMinusSrcColor:6,DstAlpha:7,OneMinusDstAlpha:8,SrcAlphaSaturate:9,OneMinusSrcAlpha:10};
 const src=blend?factors[blend[1]]:1,dst=blend?factors[blend[2]]:0;if(src===undefined||dst===undefined)throw Error('Unknown native blend state');
 const cull=/\bCull (Off|Front|Back)/.exec(head),test=/\bZTest (\w+)/.exec(head),tests={Never:1,Less:2,Equal:3,LEqual:4,Greater:5,NotEqual:6,GEqual:7,Always:8};
 return{rtBlend0:{srcBlend:val(src),destBlend:val(dst),srcBlendAlpha:val(src),destBlendAlpha:val(dst),blendOp:val(0),blendOpAlpha:val(0),colMask:val(15)},zTest:val(test?tests[test[1]]:4),zWrite:val(/\bZWrite Off/.test(head)?0:1),zClip:val(1),culling:val(cull?{Off:0,Front:1,Back:2}[cull[1]]:2),offsetUnits:val(0),offsetFactor:val(0),stencilOp:{comp:val(8),pass:val(0),fail:val(0),zFail:val(0)},stencilReadMask:val(255),stencilWriteMask:val(255),stencilRef:val(0)};
}
const shaders=[],programs={};
try{
 for(const name of wanted){
  const effect=summon?summonSource.objects.find(x=>x.type==='Shader'&&x.fields.m_Name===name):null;
  const asset=summon?{sourceSha256:effect?.sourceObject?.rawSha256}:snapshot.assets.find(x=>x.type===48&&x.name===name);
  if(!asset||(summon?!effect:!asset.shaderSource))throw Error('Original shader missing: '+name);
  const bytes=summon?Buffer.from(effect.fields.m_Script):z.gunzipSync(await fs.readFile(root+asset.shaderSource.file));
  if(!summon&&sha(bytes)!==asset.shaderSource.rawSha256)throw Error('Original shader checksum: '+name);
  const source=bytes.toString(),head=source.split('Program "vp"')[0],properties=[];
  for(const m of head.matchAll(/\b(\w+)\s*\("[^"\n]*",\s*(?:Float|Range\([^)]*\))\)\s*=\s*([-+.0-9eE]+)/g))properties.push({m_Name:m[1],m_Type:2,defaults:[Number(m[2])]});
  for(const m of head.matchAll(/\b(\w+)\s*\("[^"\n]*",\s*(Color|Vector)\)\s*=\s*\(([^)]+)\)/g))properties.push({m_Name:m[1],m_Type:m[2]==='Color'?0:1,defaults:m[3].split(',').map(Number)});
  for(const m of head.matchAll(/\b(\w+)\s*\("[^"\n]*",\s*2D\)\s*=\s*"([^"]+)"/g))properties.push({m_Name:m[1],m_Type:4,m_DefTexture:{m_DefaultName:m[2]}});
  const originals=[];
  for(const m of source.matchAll(/SubProgram "d3d11 " \{([\s\S]*?)"((?:vs|ps)_4_0)\s+([a-p\s]+)"/g)){
   const chars=m[3].replace(/\s/g,'');if(chars.length%2)throw Error('Odd shader bytecode');const raw=Buffer.alloc(chars.length/2);
   for(let i=0;i<raw.length;i++)raw[i]=((chars.charCodeAt(i*2)-97)<<4)|(chars.charCodeAt(i*2+1)-97);
   if(raw.toString('ascii',0,4)!=='DXBC')throw Error('Invalid source DXBC');originals.push({stage:m[2].slice(0,2),raw,sha256:sha(raw),bindings:m[1].trim()});
  }
  const pass={index:0,lightMode:'SRPDefaultUnlit',state:state(head)};
  for(const stage of ['vertex','fragment']){
   const variants=[],seen=new Set();
   for(const p of originals.filter(x=>x.stage===(stage==='vertex'?'vs':'ps'))){
    const keywords=[...(p.bindings.match(/Keywords \{([^}]+)\}/)?.[1]||'').matchAll(/"([^"\s]+)"/g)].map(x=>x[1]);const key=keywords.slice().sort().join(',');if(seen.has(key))continue;seen.add(key);
    const metadata=layout(p.bindings),variant={keywords,sha256:p.sha256,layout:metadata};variants.push(variant);
    if(!programs[p.sha256]){const glsl=await translate(withReflection(p.raw,metadata,stage));if(!glsl)throw Error('Translation failed: '+name);const adapted=bind(glsl,stage),module=parseGlsl(adapted.source,{stage});let info;try{
     info=validate(module);let wgsl=writeWgsl(module,info);
     // This exact original vertex DXBC uses MAD for the corresponding matrix
     // and interpolator calculations. HLSLcc/Naga emits separate multiply
     // and add operations, which differ from native D3D on the weapon frame.
     // Restrict correction to this independently disassembled bytecode; do
     // not fuse operations in unrelated shaders without source evidence.
     if(stage==='vertex'&&new Set([
      '8ccb9c4435189ed73c5d5565da94f2cc6720dc2fb76dc8abb1da9bc6225f8113',
      '719a0281e659f557852778b96cd235451232a1ead20db83c8ec93200aec6cc7a',
      '739e364f90e0e08c117f579e7530cefb8123979e578a0332b610c2d066670307'
     ]).has(p.sha256)){
      let count=0;wgsl=wgsl.replace(/\(\((_e\d+(?:\.[xyzw]+)?) \* (_e\d+(?:\.[xyzw]+)?)\) \+ (_e\d+(?:\.[xyzw]+)?)\)/g,(_,a,b,c)=>{count++;return `fma(${a}, ${b}, ${c})`;});
      if(count<3)throw Error('Original vertex MAD translation changed unexpectedly');
     }
     // D3DDisassemble confirms both instructions in this exact portrait
     // pixel program are MAD, including the negated third operand.
     if(stage==='fragment'&&p.sha256==='fbd446513ec709b812b14c058f9b2e9bacc4fe54d275b50e6ca0600595e0eb86'){
      for(const [from,to] of [
       ['((_e53.xyz * _e55.xyz) + -(_e58.xyz))','fma(_e53.xyz, _e55.xyz, -_e58.xyz)'],
       ['((_e70.www * _e72.xyz) + _e75.xyz)','fma(_e70.www, _e72.xyz, _e75.xyz)']
      ]){if(wgsl.split(from).length!==2)throw Error('Original portrait MAD translation changed');wgsl=wgsl.replace(from,to);}
     }
     programs[p.sha256]={id:p.sha256,...adapted.meta,wgsl,sourceSha256:p.sha256,wgslSha256:sha(wgsl)};
    }finally{info?.free();module.free();}}
   }
   if(!variants.length)throw Error('Missing D3D11 stage: '+name+' '+stage);pass[stage]={variants};
  }
  const queue=/"Queue"="([^"]+)"/.exec(head)?.[1]||'Geometry';shaders.push({name:'Native/PC3664/'+name,sourceSha256:asset.sourceSha256,properties,subshaders:[{tags:{tags:[{Key:'Queue',Value:queue}]},passes:[pass]}]});
 }
 const bytes=z.gzipSync(JSON.stringify({schema:1,sourceVersion:'1.0.0.3664',shaders,programs}),{level:9,mtime:0});const out=root+(summon?'native-3664-summon-shaders.json.gz':'native-3664-card-shaders.json.gz');await fs.writeFile(out,bytes);console.log(JSON.stringify({out,shaders:shaders.length,programs:Object.keys(programs).length,bytes:bytes.length,sha256:sha(bytes)}));
}finally{child.stdin.end();if(errors.trim())console.error(errors.slice(0,500));}
