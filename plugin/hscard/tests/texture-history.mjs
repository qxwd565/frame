import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import {decodeTexturePng,decodeNativeDxtMips,selectTextureVariant} from '../assets/unity/native-texture-history.mjs';
import {decodeBC} from '../assets/unity/webgpu-native.mjs';
import crypto from 'node:crypto';
import zlib from 'node:zlib';

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
for(const [version,name,format,mipmapped] of [['1.0.0.3664','Card_Inhand_Minion_Mage',12,false],['1.0.0.4217','Card_Inhand_Minion_Mage',10,true],['1.0.0.4217','Gem_Mana_D',12,true],['1.0.0.3890','Card_Inhand_Premium_Spec',10,true]]){
 const doc=JSON.parse(zlib.gunzipSync(await fs.readFile(new URL('early-native/snapshots/pc-'+version+'.json.gz',root))));
 const asset=doc.assets.find(x=>x.type===28&&x.name===name);assert.ok(asset?.nativeImage);
 const levels=[];let w=asset.width,h=asset.height,offset=0;
 while(true){const bytes=Math.max(1,Math.ceil(w/4))*Math.max(1,Math.ceil(h/4))*(format===10?8:16);levels.push({width:w,height:h,offset,bytes});offset+=bytes;if(!mipmapped||(w===1&&h===1))break;w=Math.max(1,w>>1);h=Math.max(1,h>>1);}
 const meta={...asset,unityFormat:format,mipmapped,nativeBytes:asset.nativeImage.rawBytes,levels};
 const encoded=await fs.readFile(new URL(meta.nativeImage.file,root));
 const decoded=await decodeNativeDxtMips(encoded,meta);
 assert.equal(decoded.format,meta.unityFormat===10?71:77);
 assert.equal(decoded.levels.length,meta.levels.length);
 assert.equal(crypto.createHash('sha256').update(Buffer.concat(decoded.levels)).digest('hex'),meta.nativeSha256);
 const rgba=decodeBC(decoded.levels[0],decoded.width,decoded.height,decoded.format);
 assert.equal(crypto.createHash('sha256').update(rgba).digest('hex'),meta.rgbaSha256, 'BC software decode must preserve original source pixels');
 if(!meta.mipmapped)assert.equal(decoded.levels.length,1);
 else assert.ok(decoded.levels.length>1);
 const wrong=structuredClone(meta);wrong.levels[0].offset++;
 await assert.rejects(decodeNativeDxtMips(encoded,wrong),/boundary/);
}
console.log(JSON.stringify({ok:true,textures:18,variants:count,pngPixelsVerified:true,originalDxtMipsVerified:true,softwareBcPixelsVerified:true}));
