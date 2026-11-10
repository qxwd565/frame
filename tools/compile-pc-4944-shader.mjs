// Translate the actual 4944 DXBC vertex program into WGSL, using the unchanged
// original buffer layout and the existing 3890 fragment program.
import fs from 'node:fs/promises';
import z from 'node:zlib';
import crypto from 'node:crypto';
import {spawn} from 'node:child_process';
import {pathToFileURL} from 'node:url';
import {withReflection} from './dxbc-reflection.mjs';
const root='v7.14.4-webgpu-20261109/assets/unity/historical-frames/';
const out=root+'native-beta-shaders.json.gz', manifestPath=root+'native-minion-profiles.json';
const file=v=>`E:/hearthstone card/하수인 원본 렌더/원본 추출/PC 1.0.0.${v}.json.gz`;
const [before,after,bank,manifest]=await Promise.all([file('4217'),file('4944'),out,manifestPath].map(async(p,i)=>i<3?JSON.parse(z.gunzipSync(await fs.readFile(p))):JSON.parse(await fs.readFile(p))));
const find=doc=>doc.assets.find(a=>a.type===48&&a.name==='DiffuseAlphaMaskScroller');
const old=find(before),fresh=find(after);if(!old||!fresh)throw Error('Original shader missing');
const programs=x=>Object.fromEntries(x.d3d11Programs.map(p=>[p.stage,p]));
const a=programs(old),b=programs(fresh);
if(a.ps.sha256!==b.ps.sha256||a.vs.sha256===b.vs.sha256)throw Error('Unexpected original shader program difference');
const clean=s=>s.replace(/^Bind "color" Color\r?\n/m,'');
if(clean(a.vs.nativeBindings)!==clean(b.vs.nativeBindings))throw Error('4944 original uniform layout differs');
const head=x=>Buffer.from(x.nativeShader,'base64').toString().split('Program "vp"')[0].replace(/^[\t ]*Bind "color", Color[\t ]*\r?\n/m,'');
if(head(old)!==head(fresh))throw Error('4944 shader defaults or render state differ');
const original=bank.shaders.find(x=>x.name==='Native/DiffuseAlphaMaskScroller_2aab06da7d131836');
if(!original)throw Error('3890 native shader unavailable');
const shader=structuredClone(original);shader.name='Native/DiffuseAlphaMaskScroller_PC4944';
const variant=shader.subshaders[0].passes[0].vertex.variants[0];
if(variant.sha256!==a.vs.sha256)throw Error('Shader library does not match original 4217');
variant.sha256=b.vs.sha256;
const input=Buffer.from(b.vs.bytecode,'base64'),sha=x=>crypto.createHash('sha256').update(x).digest('hex');
if(sha(input)!==b.vs.sha256)throw Error('Original 4944 bytecode checksum');
const compiler=await fs.readFile('tools/compile-shaders.mjs','utf8');
const bind=Function(compiler.slice(compiler.indexOf('function location('),compiler.indexOf('const programs={},failures=[]'))+';return bind;')();
const {parseGlsl,validate,writeWgsl}=await import(pathToFileURL('E:/HSdeck/.webgpu-work/tools/naga/dist/node.js').href);
const child=spawn('E:/HSdeck/.webgpu-work/translate-vulkan.exe',[],{windowsHide:true});let pending=Buffer.alloc(0),waiting,errors='';
child.stdout.on('data',bytes=>{pending=Buffer.concat([pending,bytes]);if(waiting&&pending.length>=4&&pending.length>=4+pending.readUInt32LE(0)){const n=pending.readUInt32LE(0),value=pending.subarray(4,4+n).toString();pending=pending.subarray(4+n);const done=waiting;waiting=null;done.resolve(value);}});
child.stderr.on('data',b=>errors+=b);child.on('error',e=>waiting?.reject(e));child.on('exit',code=>waiting?.reject(Error('Translator exited '+code)));
try{
 const glsl=await new Promise((resolve,reject)=>{waiting={resolve,reject};const data=withReflection(input,variant.layout,'vertex'),size=Buffer.alloc(4);size.writeUInt32LE(data.length);child.stdin.write(size);child.stdin.write(data);});
 if(!glsl)throw Error('Original shader translation failed');
 const adapted=bind(glsl,'vertex'),module=parseGlsl(adapted.source,{stage:'vertex'});let info;
 try{info=validate(module);const wgsl=writeWgsl(module,info);bank.programs[b.vs.sha256]={id:b.vs.sha256,...adapted.meta,wgsl,sourceSha256:b.vs.sha256,wgslSha256:sha(wgsl)};}finally{info?.free();module.free();}
 if(!bank.shaders.some(x=>x.name===shader.name))bank.shaders.push(shader);
 else if(JSON.stringify(bank.shaders.find(x=>x.name===shader.name))!==JSON.stringify(shader))throw Error('Conflicting 4944 shader');
 manifest.shaderBindings[shader.name]={shader:'Hero/Diffuse/DiffuseAlphaMaskScroller',queue:2000};
 await fs.writeFile(out,z.gzipSync(JSON.stringify(bank),{level:9,mtime:0}));
 await fs.writeFile(manifestPath,JSON.stringify(manifest)+'\n');
 console.log(JSON.stringify({shader:shader.name,vertex:b.vs.sha256,fragment:b.ps.sha256,shaders:bank.shaders.length,programs:Object.keys(bank.programs).length}));
}finally{child.stdin.end();if(errors.trim())console.error(errors.slice(0,500));}
