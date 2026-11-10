import {resourceURL, resourceFetch} from './resource-url.mjs?ver=hscard-0860fc570044ac2a';

// Shared, lazy WGSL loads. No shader translator or GLSL reaches the browser.
export async function loadShaderIndex(){
 const response=await resourceFetch(resourceURL('webgpu/program-index.json.gz'));
 if(!response.ok)throw Error('WGSL index HTTP '+response.status);
 const index=await new Response(response.body.pipeThrough(new DecompressionStream('gzip'))).json();
 if(index.schema!==1||!index.programs)throw Error('Invalid WGSL index');
 const pending=new Map();
 return async id=>{
  if(!pending.has(id))pending.set(id,(async()=>{
   const meta=index.programs[id];
   if(!/^[a-f0-9]{64}$/.test(id)||meta?.file!=='programs/'+id+'.wgsl')throw Error('Missing source WGSL shader '+id);
   const response=await resourceFetch(resourceURL('webgpu/'+meta.file));
   if(!response.ok)throw Error('WGSL program HTTP '+response.status);
   const bytes=await response.arrayBuffer();
   const hash=Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256',bytes)),b=>b.toString(16).padStart(2,'0')).join('');
   if(hash!==meta.wgslSha256)throw Error('WGSL checksum mismatch '+id);
   return {...meta,wgsl:new TextDecoder('utf-8',{fatal:true}).decode(bytes)};
  })().catch(error=>{pending.delete(id);throw error;}));
  return pending.get(id);
 };
}
