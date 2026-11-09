import fs from 'node:fs/promises';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import {spawn} from 'node:child_process';
const root=path.resolve(fileURLToPath(new URL('../',import.meta.url)));
const source=process.env.HLSLCC_ROOT,zig=process.env.ZIG_EXE;
if(!source||!zig)throw Error('Set HLSLCC_ROOT to Unity HLSLcc 3ea1fcd6bd0ac445bc078de0bf32f0950188577b and ZIG_EXE to Zig 0.14.1');
const cache=path.join(root,'.build/compiler');await fs.mkdir(cache,{recursive:true});
const cpp=(await fs.readdir(path.join(source,'src'))).filter(f=>f.endsWith('.cpp')).map(f=>path.join(source,'src',f));
const c=(await fs.readdir(path.join(source,'src/cbstring'))).filter(f=>f.endsWith('.c')).map(f=>path.join(source,'src/cbstring',f));
const includes=['','include','src','src/internal_includes','src/cbstring'].map(p=>'-I'+path.join(source,p));
async function run(args){const child=spawn(zig,args,{cwd:root,windowsHide:true,stdio:'inherit',env:{...process.env,TEMP:cache,TMP:cache,ZIG_GLOBAL_CACHE_DIR:path.join(cache,'global'),ZIG_LOCAL_CACHE_DIR:path.join(cache,'local')}});const code=await new Promise((resolve,reject)=>{child.on('error',reject);child.on('close',resolve);});if(code)throw Error('Compiler exited '+code);}
const objects=[];for(let i=0;i<c.length;i++){const out=path.join(cache,'bstring-'+i+'.o');await run(['cc','-O2',...includes,'-c',c[i],'-o',out]);objects.push(out);}
await run(['c++','-std=c++11','-O2','-DNDEBUG','-Wno-deprecated-declarations',...includes,path.join(root,'tools/translate-vulkan.cpp'),...cpp,...objects,'-o',path.join(root,'tools/translate-vulkan.exe')]);
