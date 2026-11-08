// Keep recently viewed card targets without allowing unbounded GPU growth.
// Never evict visible cards or uncommitted staging targets.
export const CARD_TARGET_BUDGET=96*1024*1024;
export function trimCardCache(surface,items,budget=CARD_TARGET_BUDGET){
 let bytes=0;for(const entry of surface.items.values())for(const target of [entry.target,entry.previewTarget])if(target)bytes+=target.width*target.height*4;
 if(bytes<=budget)return;
 const candidates=[...items.values()].filter(item=>!item.visible&&item.preparedVersion>=0&&surface.items.has(item.key)).sort((a,b)=>(a.lastVisible||0)-(b.lastVisible||0));
 for(const item of candidates){
  if(bytes<=budget)break;
  const entry=surface.items.get(item.key);if(!entry)continue;
  for(const target of [entry.target,entry.previewTarget])if(target)bytes-=target.width*target.height*4;
  surface.remove(item.key);item.preparedVersion=-1;item.loadingFrame=false;item.element.classList.remove('is-native-ready','is-loading-frame');item.element.querySelector('.hscard-card-placeholder')?.setAttribute('aria-busy','true');
 }
}
