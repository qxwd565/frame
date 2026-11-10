// Compile the actual 2013 D3D11 shader programs, preserving bytecode identity.
import fs from 'node:fs/promises';
import z from 'node:zlib';
import crypto from 'node:crypto';
import {spawn} from 'node:child_process';
import {pathToFileURL} from 'node:url';
import {withReflection} from './dxbc-reflection.mjs';

const dir='E:/HSdeck/.golden-api-work/checks/beta-';
const out='v7.14.4-webgpu-20261109/assets/unity/historical-frames/native-beta-shaders.json.gz';
const manifest=JSON.parse(await fs.readFile('v7.14.4-webgpu-20261109/assets/unity/historical-frames/native-minion-profiles.json'));
const {parseGlsl,validate,writeWgsl}=await import(pathToFileURL('E:/HSdeck/.webgpu-work/tools/naga/dist/node.js').href);
const compiler=await fs.readFile('tools/compile-shaders.mjs','utf8');
const bind=Function(compiler.slice(compiler.indexOf('function location('),compiler.indexOf('const programs={},failures=[]'))+';return bind;')();
const stable=o=>o===null||typeof o!=='object'?JSON.stringify(o):Array.isArray(o)?'['+o.map(stable).join(',')+']':'{'+Object.keys(o).sort().map(k=>JSON.stringify(k)+':'+stable(o[k])).join(',')+'}';
const digest=b=>crypto.createHash('sha256').update(b).digest('hex');
const child=spawn('E:/HSdeck/.webgpu-work/translate-vulkan.exe',[],{windowsHide:true});
let pending=Buffer.alloc(0),waiting,error='';
child.stdout.on('data',b=>{pending=Buffer.concat([pending,b]);if(waiting&&pending.length>=4&&pending.length>=4+pending.readUInt32LE(0)){const n=pending.readUInt32LE(0),s=pending.subarray(4,4+n).toString();pending=pending.subarray(4+n);const w=waiting;waiting=null;w.resolve(s);}});
child.stderr.on('data',b=>error+=b);child.on('error',e=>waiting?.reject(e));child.on('exit',code=>waiting?.reject(Error('Translator exited '+code)));
const translate=b=>new Promise((resolve,reject)=>{waiting={resolve,reject};const h=Buffer.alloc(4);h.writeUInt32LE(b.length);child.stdin.write(h);child.stdin.write(b);});
const shaders={},programs={};
try{
 for(const version of ['3664','3890']){
  const lib=JSON.parse(z.gunzipSync(await fs.readFile(dir+version+'-shaders.json.gz')));
  const inputs=JSON.parse(await fs.readFile(dir+version+'-shader-input.json'));
  const bytecodes=new Map(inputs.flatMap(s=>s.d3d11Programs.map(p=>[p.sha256,p])));
  for(const shader of lib.shaders){
   const {name,sourceSha256,...body}=shader;
   const alias='Native/'+name.split('/').slice(1).join('/')+'_'+digest(stable(body)).slice(0,16);
   if(!manifest.shaderBindings[alias])throw Error('Original profile shader not found: '+alias);
   shaders[alias]={name:alias,...body};
   for(const sub of shader.subshaders)for(const pass of sub.passes)for(const stage of ['vertex','fragment'])for(const variant of pass[stage].variants){
    if(programs[variant.sha256])continue;
    const original=bytecodes.get(variant.sha256);if(!original)throw Error('Missing original DXBC');
    const bytecode=Buffer.from(original.bytecode,'base64');if(digest(bytecode)!==variant.sha256)throw Error('Original bytecode checksum');
    const glsl=await translate(withReflection(bytecode,variant.layout,stage));if(!glsl)throw Error('Original DXBC translation failed: '+name);
    const adapted=bind(glsl,stage),module=parseGlsl(adapted.source,{stage});let info;
    try{info=validate(module);const wgsl=writeWgsl(module,info);programs[variant.sha256]={id:variant.sha256,...adapted.meta,wgsl,sourceSha256:variant.sha256,wgslSha256:digest(wgsl)};}finally{info?.free();module.free();}
   }
  }
 }
}finally{child.stdin.end();}
if(error.trim())console.error(error.slice(0,500));
const data=z.gzipSync(JSON.stringify({schema:1,shaders:Object.values(shaders),programs}),{level:9,mtime:0});
await fs.writeFile(out,data);
console.log(JSON.stringify({file:out,shaders:Object.keys(shaders).length,programs:Object.keys(programs).length,bytes:data.length,sha256:digest(data)}));
// Preserve the later verified 4944 shader when rebuilding the beta bank.
const later=spawn(process.execPath,['tools/compile-pc-4944-shader.mjs'],{windowsHide:true,stdio:'inherit'});
const status=await new Promise((resolve,reject)=>{later.on('error',reject);later.on('close',resolve);});
if(status!==0)throw Error('4944 shader compilation failed: '+status);
