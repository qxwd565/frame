import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import {decodeTexturePng,selectTextureVariant} from '../assets/unity/native-texture-history.mjs';

const root=new URL('../../../v7.14.4-webgpu-20261109/assets/unity/historical-frames/',import.meta.url);
const history=JSON.parse(await fs.readFile(new URL('texture-history/index.json',root)));
assert.equal(Object.keys(history.textures).length,18);
let count=0;
for(const rows of Object.values(history.textures))for(const row of rows){
 const bytes=await fs.readFile(new URL(row.file,root));
 const decoded=await decodeTexturePng(bytes,row);
 assert.equal(decoded.levels[0].length,row.width*row.height*4);
 count++;
}
assert.equal(count,21);
assert.equal(selectTextureVariant(history,'clouds7','2013-08-17').version,'1.0.0.3664');
assert.equal(selectTextureVariant(history,'clouds7','2013-10-03').version,'1.0.0.3890');
assert.equal(selectTextureVariant(history,'clouds7','2013-12-12').version,'1.0.0.4217');
assert.equal(selectTextureVariant(history,'motes01','2013-12-11').version,'1.0.0.3664');
assert.equal(selectTextureVariant(history,'motes01','2013-12-12').version,'1.0.0.4217');
assert.equal(selectTextureVariant(history,'FlowMapTunnel','2013-08-17'),null);
assert.equal(selectTextureVariant(history,'FlowMapTunnel','2013-10-03').version,'1.0.0.3890');
const row=history.textures.clouds7[0], corrupt=Buffer.from(await fs.readFile(new URL(row.file,root)));
corrupt[corrupt.length-1]^=1;
await assert.rejects(decodeTexturePng(corrupt,row),/checksum/);
console.log(JSON.stringify({ok:true,textures:18,variants:count,pngPixelsVerified:true}));
