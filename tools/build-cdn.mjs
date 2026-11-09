import fs from 'node:fs/promises';
import path from 'node:path';
import {fileURLToPath} from 'node:url';
import crypto from 'node:crypto';
const root=path.resolve(fileURLToPath(new URL('../',import.meta.url)));
const version='v7.14.4-webgpu-20261109';
const destination=path.join(root,'dist');
await fs.mkdir(destination,{recursive:true});
// Compatibility mirror for already-installed plugins. The source of truth is
// each expansion API's frame/ tree, pinned by the shipped plugin index.
const index=JSON.parse(await fs.readFile(path.join(root,'plugin/hscard/assets/unity/frame-api-index.json'),'utf8'));
const entries=Object.entries(index.files);let next=0,completed=0;
await Promise.all(Array.from({length:6},async()=>{
 while(next<entries.length){
  const [name,record]=entries[next++],repo=index.repositories[record.repository];
  if(!repo||name.includes('..')||name.startsWith('/')||name.includes('\\'))throw Error('Invalid resource manifest');
  const response=await fetch(new URL(name.split('/').map(encodeURIComponent).join('/'),repo.base));
  if(!response.ok)throw Error('Frame API HTTP '+response.status+': '+name);
  const bytes=Buffer.from(await response.arrayBuffer());
  if(bytes.length!==record.bytes||crypto.createHash('sha256').update(bytes).digest('hex')!==record.sha256)throw Error('Frame API checksum: '+name);
  const file=path.join(destination,version,'assets/unity',name);
  await fs.mkdir(path.dirname(file),{recursive:true});await fs.writeFile(file,bytes);completed++;
 }
}));
await fs.writeFile(path.join(destination,'_headers'),`/${version}/*\n  Access-Control-Allow-Origin: *\n  Cache-Control: public, max-age=31536000, immutable\n  X-Content-Type-Options: nosniff\n`);
console.log(`Compatibility mirror: ${completed} verified API resources in dist/${version}`);
