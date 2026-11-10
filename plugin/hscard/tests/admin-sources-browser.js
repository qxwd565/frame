// Load after the PHP --fixture markup and WordPress's jQuery UI scripts.
window.result = {running:true};
const calls = [];
let rejectNext = false;
window.fetch = async function (url, options) {
  if (!String(url).endsWith('/wp-admin/admin-ajax.php')) throw Error('Unexpected request');
  const body = options.body;
  if (body.get('action') !== 'hscard_reorder_sources' || body.get('nonce') !== 'test-nonce') throw Error('Bad AJAX envelope');
  const order = body.getAll('order[]');calls.push(order);
  await new Promise(resolve=>setTimeout(resolve,80));
  const fail = rejectNext;rejectNext = false;
  return new Response(JSON.stringify(fail ? {success:false,data:{message:'저장 실패 검사'}} : {success:true,data:{order}}), {status:fail?503:200,headers:{'Content-Type':'application/json'}});
};
window.runAdminSourceChecks = async function () {
 const assert=(value,message)=>{if(!value)throw Error(message);};
 const pause=ms=>new Promise(resolve=>setTimeout(resolve,ms));
 const list=document.querySelector('[data-hscard-source-order]');
 const ids=()=>[...list.querySelectorAll(':scope > tr[data-source-id]')].map(row=>row.dataset.sourceId);
 const idle=async()=>{for(let n=0;n<100;n++){if(list.getAttribute('aria-busy')!=='true')return;await pause(20);}throw Error('Save never completed');};
 try{
  assert(window.jQuery(list).sortable('instance'),'WordPress sortable not initialized');
  const form=document.querySelector('[data-hscard-source-form]'),repo=form.querySelector('[name=source_repository]'),preview=form.querySelector('output');
  repo.value='Curse-of-Naxxramas';repo.dispatchEvent(new Event('input'));
  assert(repo.validity.valid&&preview.textContent==='https://raw.githubusercontent.com/qxwd565/Curse-of-Naxxramas/main/cards.json','Repository completion failed');
  repo.value='https://example.test/x';repo.dispatchEvent(new Event('input'));assert(!repo.validity.valid&&preview.hidden,'Full URL accepted as name');
  repo.value='legacy';repo.dispatchEvent(new Event('input'));
  assert(!repo.disabled&&repo.required&&!form.querySelector('[name=hscard_add_method]'),'Repository must be the only add method');
  assert(!form.querySelector('[name=source_art_base]')&&!form.querySelector('[name=source_enabled]'),'Unrequested advanced fields remain');
  assert(!list.querySelector('details')&&list.querySelectorAll('a').length===8,'Direct edit/delete actions missing');
  const setKey=document.querySelector('[data-hscard-auto-set]'),linked=setKey.form.querySelector('[name=source_id]');
  setKey.value='Manual Set';linked.value='managed';linked.dispatchEvent(new Event('change'));
  assert(setKey.value==='Curse-of-Naxxramas'&&setKey.readOnly,'Set ID not generated from repository');
  linked.value='legacy';linked.dispatchEvent(new Event('change'));
  assert(setKey.value==='Manual Set'&&!setKey.readOnly,'Manual ID not restored for older/local sources');
  const handle=list.querySelector('[data-source-id=legacy] .hscard-sort-handle');handle.focus();
  handle.dispatchEvent(new KeyboardEvent('keydown',{key:'ArrowDown',bubbles:true,cancelable:true}));
  await idle();assert(ids().join()==='naxx,legacy,gvg,brm','Keyboard move failed');assert(document.activeElement===handle,'Keyboard focus lost after saving');
  rejectNext=true;handle.dispatchEvent(new KeyboardEvent('keydown',{key:'ArrowDown',bubbles:true,cancelable:true}));
  await idle();assert(ids().join()==='naxx,legacy,gvg,brm','Failed save did not roll back');assert(document.querySelector('[data-hscard-order-status]').textContent==='저장 실패 검사','Failure message missing');
  // Browser driver uses real mouse events to drag the last row to the first.
  const start=list.querySelector('[data-source-id=brm] .hscard-sort-handle').getBoundingClientRect();
  const end=list.querySelector('[data-source-id=naxx]').getBoundingClientRect();
  window.result={running:true,phase:'drag',start:{x:start.x+start.width/2,y:start.y+start.height/2},end:{x:start.x+start.width/2,y:end.y+8}};
  for(let n=0;n<300&&calls.length<3;n++)await pause(25);
  await idle();assert(calls.length===3&&ids().join()==='brm,naxx,legacy,gvg','Mouse drag did not save');
  window.result={running:true,phase:'mobile'};
  while(innerWidth>500)await pause(25);
  const row=list.querySelector('[data-source-id=brm]'), target=list.querySelector('[data-source-id=naxx]');target.scrollIntoView({block:'center'});
  const box=target.getBoundingClientRect(), touchStart=new Event('touchstart',{bubbles:true,cancelable:true}), touchEnd=new Event('touchend',{bubbles:true,cancelable:true});
  Object.defineProperty(touchStart,'touches',{value:[{clientX:box.left+10,clientY:box.top+10}]});
  Object.defineProperty(touchEnd,'changedTouches',{value:[{clientX:box.left+10,clientY:box.bottom-4}]});
  row.querySelector('.hscard-sort-handle').dispatchEvent(touchStart);row.querySelector('.hscard-sort-handle').dispatchEvent(touchEnd);
  await idle();assert(ids().join()==='naxx,brm,legacy,gvg','Mobile menu move failed');
  assert(document.documentElement.scrollWidth<=innerWidth,'Mobile horizontal overflow');
  window.result={running:false,calls:4,order:ids(),drag:true,keyboard:true,mobile:true,rollback:true,repository:true,automaticSetId:true};
 }catch(error){window.result={running:false,error:error.stack,calls};}
};
