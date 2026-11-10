/** Synchronize mobile deck tiles and GPU placeholders with ONE dates-v1 reducer. */
import {artUrlForSnapshot} from './card-snapshots.mjs?ver=hscard-802d6a89a7024809';
import {readDatedCard} from './card-data.mjs?ver=hscard-802d6a89a7024809';

const activeDecks = new WeakMap();
const raritySet = new Set(['LEGENDARY','EPIC','RARE','COMMON','FREE']);
const frameKinds = new Set(['MINION','SPELL','WEAPON','HERO','LOCATION']);

function refreshCard(element, dated) {
 const li = element.closest('.hscard-deck-card');
 if (!li) return;
 if (!dated) {
  li.hidden = true;li.classList.remove('is-snapshot-pending');li.classList.add('is-card-not-released');
  element.dataset.hscardReady = 'false';
  element.dispatchEvent(new CustomEvent('hscard-card-not-released',{bubbles:true}));
  return;
 }
 const {card,identity,url} = dated;
 li.hidden = false;li.classList.remove('is-card-not-released','is-snapshot-error','is-snapshot-pending');
 li.dataset.hscardCost = String(card.cost??0);li.dataset.hscardName = card.name;
 li.dataset.hscardRarity = card.rarity;
 const title = li.querySelector('.hscard-deck-tile-name-text');if (title) title.textContent = card.name;
 const link = li.querySelector('.hscard-card-link');if (link) link.setAttribute('aria-label',card.name);
 const cost = li.querySelector('.hscard-deck-tile-cost');if (cost) cost.textContent = String(card.cost??0);
 const count = li.querySelector('.hscard-deck-tile-count .hscard-deck-tile-compact-count');
 const tile = li.querySelector('.hscard-deck-tile');
 if (tile) {
  tile.classList.toggle('is-legendary',card.rarity==='LEGENDARY');
  tile.classList.toggle('is-single',card.rarity!=='LEGENDARY'&&Number(identity.quantity)<2);
  tile.classList.toggle('is-two',card.rarity!=='LEGENDARY'&&Number(identity.quantity)>=2);
 }
 if(count)count.textContent=card.rarity==='LEGENDARY'?'★':String(identity.quantity??1);
 const artTag=tile?.querySelector('.hscard-deck-tile-art');
 // If an art change explicitly removes the art, do not resurrect the index image.
 const hasArt=Object.hasOwn(card.raw,'art');
 const newArt=identity.lockedArt ? identity.art : (hasArt ? artUrlForSnapshot(card.art,url) : identity.art);
 if(artTag){if(newArt)artTag.src=newArt;else artTag.remove();}
 else if(tile&&newArt){const image=document.createElement('img');image.className='hscard-deck-tile-art';image.alt='';image.loading='lazy';image.decoding='async';image.draggable=false;image.src=newArt;tile.insertBefore(image,tile.firstChild);}
 tile?.classList.toggle('is-art-error',!newArt);
 element.dataset.hscardFrameKind=card.type;
 element.dataset.hscardFrameClass=card.cardClass.replace(/[^A-Za-z]/g,'').toUpperCase()||'NEUTRAL';
 element.dataset.hscardFrameRarity=raritySet.has(card.rarity)?card.rarity:'FREE';
 element.dataset.hscardFrameRace=card.races.length===0?'0':card.races.length>1?'2':'1';
 element.dataset.hscardFrameSchool=card.school?'1':'0';
 element.dataset.hscardFrameAttack=(card.attack??0)>0?'1':'0';
 element.dataset.hscardFrameArmor=(card.armor??0)>0?'1':'0';
 element.classList.toggle('is-frame-unavailable',!frameKinds.has(card.type));
 const placeholder=element.querySelector('.hscard-card-placeholder');
 if(placeholder)placeholder.setAttribute('aria-label',card.name+', 마나 '+String(card.cost??0)+', '+String(identity.quantity??1)+'장');
 element.dataset.hscardReady='true';
 element.dispatchEvent(new CustomEvent('hscard-snapshot-ready',{bubbles:true,detail:{date:dated.date,id:identity.id}}));
}

function sortDeck(deck){
 const list=deck.querySelector('.hscard-deck-cards');if(!list)return;
 const items=[...list.children].filter(node=>node.matches('.hscard-deck-card'));
 const parent=new Map(),children=new Map(),main=[];
 for(const li of items)parent.set(li.dataset.hscardDbfId,li);
 for(const li of items){
  const owner=li.dataset.hscardOwnerDbf;
  if(owner&&owner!=='0'&&owner!==li.dataset.hscardDbfId&&parent.has(owner)){
   if(!children.has(owner))children.set(owner,[]);
   children.get(owner).push(li);
  }else main.push(li);
 }
 const cmp=(a,b)=>{
  const costA=Number(a.dataset.hscardCost||0),costB=Number(b.dataset.hscardCost||0);
  if(costA!==costB)return costA-costB;
  const nameCmp=(a.dataset.hscardName||'').localeCompare(b.dataset.hscardName||'','ko',{numeric:true});
  return nameCmp || Number(a.dataset.hscardDbfId)-Number(b.dataset.hscardDbfId);
 };
 main.sort(cmp);
 const ordered=[];
 for(const li of main){ordered.push(li);const list=children.get(li.dataset.hscardDbfId)||[];list.sort(cmp);ordered.push(...list);}
 // Append existing nodes; this only moves DOM nodes, not canvas textures.
 for(const li of ordered)list.appendChild(li);
}

async function hydrateDeck(deck){
 const token=(activeDecks.get(deck)||0)+1;activeDecks.set(deck,token);
 const figures=[...deck.querySelectorAll('[data-hscard-card]')];
 for(const element of figures){const li=element.closest('.hscard-deck-card');if(li){li.hidden=false;li.classList.add('is-snapshot-pending');li.classList.remove('is-card-not-released','is-snapshot-error');}}
 // Start the first visible cards before the ones outside the viewport. Fetch
 // concurrency is shared globally; duplicate card IDs are coalesced.
 figures.sort((a,b)=>{
  const ra=a.getBoundingClientRect(),rb=b.getBoundingClientRect();
  const dist=r=>r.bottom<0?-r.bottom:r.top>innerHeight?r.top-innerHeight:0;
  return dist(ra)-dist(rb);
 });
 await Promise.allSettled(figures.map(async element=>{
  try{
   const dated=await readDatedCard(element);
   if(activeDecks.get(deck)!==token)return;
   refreshCard(element,dated);
  }catch(error){
   if(activeDecks.get(deck)!==token)return;
   const li=element.closest('.hscard-deck-card');
   if(li){li.classList.remove('is-snapshot-pending');li.classList.add('is-snapshot-error');}
   element.dataset.hscardReady='false';
   element.dispatchEvent(new CustomEvent('hscard-snapshot-error',{bubbles:true,detail:{message:String(error?.message||error)}}));
  }
 }));
 if(activeDecks.get(deck)===token)sortDeck(deck);
}

export function startDeckHydration(){
 const mounted=new WeakSet();
 const find=()=>{
  for(const deck of document.querySelectorAll('.hscard-deck-list[data-hscard-card-urls]')){
   if(mounted.has(deck))continue;
   mounted.add(deck);hydrateDeck(deck);
   const observer=new MutationObserver(mutations=>{
    if(!mutations.some(m=>m.attributeName==='data-hscard-date'||m.attributeName==='data-hscard-frame-profile'))return;
    hydrateDeck(deck);
    document.dispatchEvent(new CustomEvent('hscard-date-change',{detail:{deck}}));
   });
   observer.observe(deck,{attributes:true,attributeFilter:['data-hscard-date','data-hscard-frame-profile']});
  }
 };
 find();
 new MutationObserver(records=>{if(records.some(r=>[...r.addedNodes].some(node=>node.nodeType===1&&(node.matches?.('.hscard-deck-list')||node.querySelector?.('.hscard-deck-list')))))find();}).observe(document.body,{childList:true,subtree:true});
}
