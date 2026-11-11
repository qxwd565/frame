// Synchronize only explicitly corrected original DXBC programs. Keep all
// other versions and the 4944-only shader in the existing shared bank.
import fs from 'node:fs/promises';
import z from 'node:zlib';
import crypto from 'node:crypto';
const root='v7.14.4-webgpu-20261109/assets/unity/historical-frames/';
const sharedPath=root+'native-beta-shaders.json.gz',extraPath=root+'native-3664-card-shaders.json.gz';
const shared=JSON.parse(z.gunzipSync(await fs.readFile(sharedPath))),extra=JSON.parse(z.gunzipSync(await fs.readFile(extraPath)));
const ids=['8ccb9c4435189ed73c5d5565da94f2cc6720dc2fb76dc8abb1da9bc6225f8113','719a0281e659f557852778b96cd235451232a1ead20db83c8ec93200aec6cc7a','739e364f90e0e08c117f579e7530cefb8123979e578a0332b610c2d066670307','fbd446513ec709b812b14c058f9b2e9bacc4fe54d275b50e6ca0600595e0eb86'];
for(const id of ids){const a=shared.programs[id],b=extra.programs[id];if(!a||!b||a.sourceSha256!==id||b.sourceSha256!==id)throw Error('Original shader identity unavailable: '+id);const {wgsl:aw,wgslSha256:ah,...aMeta}=a,{wgsl:bw,wgslSha256:bh,...bMeta}=b;if(JSON.stringify(aMeta)!==JSON.stringify(bMeta))throw Error('Shared program layout mismatch: '+id);shared.programs[id]=b;}
const data=z.gzipSync(JSON.stringify(shared),{level:9,mtime:0});await fs.writeFile(sharedPath,data);
console.log(JSON.stringify({updated:ids.length,shaders:shared.shaders.length,programs:Object.keys(shared.programs).length,bytes:data.length,sha256:crypto.createHash('sha256').update(data).digest('hex')}));
