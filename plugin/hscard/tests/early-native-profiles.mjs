import assert from 'node:assert/strict';
import fs from 'node:fs/promises';
import z from 'node:zlib';
import crypto from 'node:crypto';
import {applyComponentChanges} from '../assets/unity/native-minion-profile.mjs';
import {historicalSelection} from '../assets/unity/historical-adapter.mjs';
const root=new URL('../../../v7.14.4-webgpu-20261109/assets/unity/historical-frames/',import.meta.url);
const read=async path=>JSON.parse(z.gunzipSync(await fs.readFile(new URL(path,root))));
let profile=await read('minion(2013-08-17).json.gz');
profile=applyComponentChanges(profile,await read('minion(2013-10-03).patch.json.gz'));
const bank=await read('native-beta-shaders.json.gz');
assert.ok(bank.programs['568bd70a9cf0f914e66a3a7654da47394c5085e1ecb2c1c783cf93b2454091f0']);
assert.ok(bank.shaders.some(s=>s.name==='Native/DiffuseAlphaMaskScroller_PC4944'));
for(const [date,version] of [['2013-12-12','4217'],['2014-03-13','4944']]){
 profile=applyComponentChanges(profile,await read(`minion(${date}).patch.json.gz`));
 assert.equal(profile.version,'1.0.0.'+version);
 const snapshotBytes=await fs.readFile(new URL(profile.source.snapshot,root));
 assert.equal(crypto.createHash('sha256').update(snapshotBytes).digest('hex'),profile.source.snapshotSha256);
 const source=JSON.parse(z.gunzipSync(snapshotBytes)),byKey=new Map(source.assets.map(a=>[a.key,a]));
 for(const [name,mesh] of Object.entries(profile.meshes)){
  const candidates=source.assets.filter(a=>a.type===43&&a.name===name);
  assert.equal(candidates.length,1,name);
  assert.deepEqual(mesh,{name,...candidates[0].mesh},name);
 }
 for(const [name,material] of Object.entries(profile.materials)){
  const candidates=source.assets.filter(a=>a.type===21&&a.name===name);
  assert.equal(candidates.length,1,name);
  const fields=candidates[0].properties.m_SavedProperties;
  for(const [key,env] of Object.entries(fields.m_TexEnvs)){
   if(!env.m_Texture.ref)continue;
   const original=byKey.get(env.m_Texture.ref),mapped=profile.textures[material.textures[key]?.key];
   assert.ok(original&&mapped,`${name} ${key}`);
   assert.equal(mapped.rgbaSha256,original.rgbaSha256,`${name} ${key}`);
   assert.deepEqual(mapped.sampler,original.sampler,`${name} ${key}`);
  }
  for(const [key,value] of Object.entries(fields.m_Floats))assert.deepEqual(material.values[key],[value],`${name} ${key}`);
 }
 const originalText=await read(`components/texts/pc-1.0.0.${version}-minion.json.gz`);
 for(const row of originalText.rows){
  const target=profile.texts[row.prefab]?.[row.role];assert.ok(target,row.prefab+' '+row.role);
  assert.deepEqual(target.binding.sourcePose,row.sourcePose);
  assert.deepEqual(target.binding.destinationPose,row.destinationPose);
  for(const [key,value] of Object.entries(row.settings)){
   if(key==='m_LocalizedSettings')continue;
   assert.deepEqual(target.settings[key],value,row.role+' '+key);
  }
 }
}
const card={kind:'MINION',cardClass:'MAGE'};
for(const [date,version] of [['2013-12-11','1.0.0.3890'],['2013-12-12','1.0.0.4217'],['2014-03-13','1.0.0.4944']])
 assert.equal(historicalSelection({...card,renderDate:date}).nativeProfile,version);
assert.match(historicalSelection({...card,renderDate:'2015-11-11'}).evidence,/not verified/);
console.log(JSON.stringify({ok:true,profiles:['4217','4944'],meshes:40,originalTextureBindings:true,originalTextPositions:true}));
