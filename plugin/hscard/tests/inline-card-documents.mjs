import assert from 'node:assert/strict';
import {cardSourceURL,loadCardSnapshot,invalidateCard,artUrlForSnapshot} from '../assets/unity/card-snapshots.mjs';
globalThis.document={baseURI:'https://example.test/post/'};
globalThis.location={origin:'https://example.test'};
assert.equal(artUrlForSnapshot('https://raw.githubusercontent.com/qxwd565/League-Of-Explorers/main/art/LOE_002.png',''), 'https://raw.githubusercontent.com/qxwd565/The-League-of-Explorers/main/art/LOE_002.png');
assert.equal(artUrlForSnapshot('https://example.test/qxwd565/League-Of-Explorers/x.png',''), 'https://example.test/qxwd565/League-Of-Explorers/x.png');
const url='https://raw.githubusercontent.com/qxwd565/legacy/main/data/CS2_072.json';
const original={
 '2013-08-17':{id:'CS2_072',dbfId:180,name:'기습',type:'SPELL',cardClass:'ROGUE',rarity:'RARE',text:'<b>원문</b><br></br>줄바꿈',races:['DRAGON']},
 '2013-10-03':{rarity:'LEGENDARY',races:null,text:'<i>다음 시기</i>'}
};
let requests=0;
globalThis.fetch=async input=>{requests++;assert.equal(String(input),url);return Response.json(original);};
function element(documents){
 const deck={dataset:{hscardCardUrls:JSON.stringify({180:url}),hscardDocuments:JSON.stringify(documents)}};
 return {dataset:{hscardCard:JSON.stringify({id:'CS2_072',dbfId:180})},closest:()=>deck};
}
let el=element({[url]:original});
assert.equal(cardSourceURL(el,'CS2_072'),url);
const early=await loadCardSnapshot(url,'2013-08-17'),later=await loadCardSnapshot(url,'2013-10-03');
assert.equal(early.state.rarity,'RARE');assert.equal(later.state.rarity,'LEGENDARY');
assert.deepEqual(early.state.races,['DRAGON']);assert.equal(Object.hasOwn(later.state,'races'),false);
assert.equal(early.state.text,original['2013-08-17'].text);
assert.equal(requests,0,'Initial HTML must not wait for the card API');
assert.equal(await loadCardSnapshot(url,'2013-08-16'),null);
for(const bad of [{[url]:{card:original}}, {'https://other.test/data/CS2_072.json':original}, {[url]:{'2013-08-17':{name:'x',type:'SPELL',constructor:'unsafe'}}}]){
 invalidateCard(url);el=element(bad);cardSourceURL(el,'CS2_072');
 const before=requests;const values=await Promise.all([loadCardSnapshot(url,'2013-08-17'),loadCardSnapshot(url,'2013-10-03')]);
 assert.equal(requests,before+1,'Fallback must share the exact source request');assert.equal(values[1].state.rarity,'LEGENDARY');
}
console.log(JSON.stringify({ok:true,initialCardApiRequests:0,datedRarityAndRace:true,rawFormatting:true,notReleased:true,invalidCacheFallback:true,exactSourceOnly:true}));
