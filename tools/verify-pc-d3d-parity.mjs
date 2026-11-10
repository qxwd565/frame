// Render the same original draw commands through WebGPU and the original PC
// D3D bytecode, in memory. Reports actual per-pixel differences.
import {spawn} from 'node:child_process';
import fs from 'node:fs/promises';
import crypto from 'node:crypto';
import z from 'node:zlib';
import {setTimeout as sleep} from 'node:timers/promises';
import {fileURLToPath} from 'node:url';
const profile=fileURLToPath(new URL('../.build/preview-browser',import.meta.url)),port=19540;
const chrome=spawn('C:/Program Files/Google/Chrome/Application/chrome.exe',['--headless=new','--remote-debugging-port='+port,'--user-data-dir='+profile,'--no-first-run','--no-default-browser-check','--enable-unsafe-webgpu','about:blank'],{windowsHide:true,stdio:'ignore'});
const ps=`$ErrorActionPreference='Stop'
$p=[Console]::In.ReadToEnd()|ConvertFrom-Json
$asm=[Reflection.Assembly]::LoadFrom('E:\\HSPlus\\development\\plugins\\hsplugin\\HSPlugin.exe')
$reader=$asm.GetType('HSPlus.Storage.PortableJson').GetMethod('Read',[Reflection.BindingFlags]'Static,NonPublic')
$lib=$reader.MakeGenericMethod($asm.GetType('HSPlus.Models.PortableShaderLibrary')).Invoke($null,@([string]$p.library))
$scene=$reader.MakeGenericMethod($asm.GetType('HSPlus.Models.PortableCardScene')).Invoke($null,@([string]$p.scene))
$cache=@{};foreach($v in $p.resources.PSObject.Properties){$cache[$v.Name]=[Convert]::FromBase64String([string]$v.Value)}
$callback=[Func[string,byte[]]]({param($k) return ,$cache[$k]}.GetNewClosure())
$rt=$asm.GetType('HSPlus.Rendering.PortableRenderer')
$renderer=[Activator]::CreateInstance($rt,[Reflection.BindingFlags]'Instance,NonPublic',$null,@($lib),$null)
try{
 $method=$rt.GetMethod('RenderPixels',[Reflection.BindingFlags]'Instance,NonPublic')
 $black=[byte[]]$method.Invoke($renderer,[object[]]@($scene,$callback,[float[]]@(0,0,0,1)))
 $white=[byte[]]$method.Invoke($renderer,[object[]]@($scene,$callback,[float[]]@(1,1,1,1)))
 [Console]::Out.Write((@{black=[Convert]::ToBase64String($black);white=[Convert]::ToBase64String($white)}|ConvertTo-Json -Compress))
}finally{$renderer.Dispose()}`;
function nativeRender(payload){return new Promise((resolve,reject)=>{
 const child=spawn('powershell.exe',['-NoProfile','-NonInteractive','-EncodedCommand',Buffer.from(ps,'utf16le').toString('base64')],{windowsHide:true,stdio:['pipe','pipe','pipe']});
 const out=[],err=[];child.stdout.on('data',x=>out.push(x));child.stderr.on('data',x=>err.push(x));child.on('error',reject);
 child.on('close',code=>{if(code)return reject(Error(Buffer.concat(err).toString().slice(-3000)));try{resolve(JSON.parse(Buffer.concat(out).toString()));}catch(e){reject(e);}});
 child.stdin.end(JSON.stringify(payload));
});}
function compare(expected,black,white,width,height,flip){
 let total=0,max=0,changed=0,visible=0,changedOpaque=0,changedTranslucent=0;const reconstructed=Buffer.alloc(expected.length);
 for(let y=0;y<height;y++)for(let x=0;x<width;x++){
  const out=(y*width+x)*4,i=((flip?height-1-y:y)*width+x)*4;
  const alpha=Math.max(black[i],black[i+1],black[i+2],Math.round(Math.max(0,Math.min(255,255-((white[i]-black[i])+(white[i+1]-black[i+1])+(white[i+2]-black[i+2]))/3))));
  const rgba=[0,1,2].map(c=>alpha?Math.min(255,Math.round(black[i+c]*255/alpha)):0);rgba.push(alpha);
  for(let c=0;c<4;c++)reconstructed[out+c]=rgba[c];
  if(alpha||expected[out+3])visible++;
  let difference=0;for(let c=0;c<4;c++){const n=Math.abs(expected[out+c]-rgba[c]);difference+=n;total+=n;max=Math.max(max,n);}if(difference){changed++;if(alpha===255&&expected[out+3]===255)changedOpaque++;else changedTranslucent++;}
 }
 return{flip,meanAbsoluteError:total/(width*height*4),maxChannelError:max,changedPixels:changed,changedOpaque,changedTranslucent,visiblePixels:visible,exact:changed===0,
  nativeRgbaSha256:crypto.createHash('sha256').update(reconstructed).digest('hex'),webgpuRgbaSha256:crypto.createHash('sha256').update(expected).digest('hex')};
}
let ws;
try{
 let tabs;for(let i=0;i<100;i++){try{tabs=await(await fetch('http://127.0.0.1:'+port+'/json')).json();break;}catch{await sleep(100);}}if(!tabs)throw Error('Chrome unavailable');
 ws=new WebSocket(tabs.find(t=>t.type==='page').webSocketDebuggerUrl);await new Promise((resolve,reject)=>{ws.onopen=resolve;ws.onerror=reject;});
 let sequence=0;const pending=new Map();ws.onmessage=e=>{const m=JSON.parse(e.data),p=pending.get(m.id);if(p){pending.delete(m.id);m.error?p.reject(Error(JSON.stringify(m.error))):p.resolve(m.result);}};
 const call=(method,params={})=>new Promise((resolve,reject)=>{const id=++sequence;pending.set(id,{resolve,reject});ws.send(JSON.stringify({id,method,params}));});
 await call('Page.navigate',{url:'http://127.0.0.1:19420/work/pc-d3d-parity.html'});
 for(let i=0;i<400;i++){const r=await call('Runtime.evaluate',{expression:'window.ready===true',returnByValue:true});if(r.result.value)break;if(i===399)throw Error('Original parity page unavailable');await sleep(250);}
 const results=[];
 for(const [date,build] of [['2013-08-17','3664'],['2013-10-03','3890'],['2013-12-12','4217'],['2014-03-13','4944']]){
  const source=JSON.parse(z.gunzipSync(await fs.readFile(`E:/hearthstone card/하수인 원본 렌더/원본 추출/PC 1.0.0.${build}.json.gz`)));
  const original=new Map(source.assets.filter(x=>x.type===48).flatMap(s=>s.d3d11Programs.map(p=>[p.sha256,p])));
  const classes=process.argv.includes('--all-classes')?['NEUTRAL','DRUID','HUNTER','MAGE','PALADIN','PRIEST','ROGUE','SHAMAN','WARLOCK','WARRIOR']:['MAGE'];
  for(const cardClass of classes)for(const golden of [false,true]){
   const response=await call('Runtime.evaluate',{expression:`window.capture(${JSON.stringify(date)},${golden},${JSON.stringify(cardClass)})`,awaitPromise:true,returnByValue:true});
   if(response.exceptionDetails)throw Error(response.exceptionDetails.text+' '+JSON.stringify(response.exceptionDetails.exception));
   const capture=response.result.value;if(capture.version!=='1.0.0.'+build)throw Error('Incorrect native frame selected');
   const shaders=new Map();for(const draw of capture.draws){
    const vp=original.get(draw.vertexProgram),fp=original.get(draw.fragmentProgram);if(!vp||!fp)throw Error('Original D3D shader bytecode unavailable: '+draw.vertexProgram);
    const id=draw.vertexProgram+':'+draw.fragmentProgram;draw.shader=id;
    if(!shaders.has(id))shaders.set(id,{name:id,subshaders:[{passes:[{index:0,vertex:{variants:[{keywords:[],code:vp.bytecode,sha256:vp.sha256}]},fragment:{variants:[{keywords:[],code:fp.bytecode,sha256:fp.sha256}]}}]}]});
    delete draw.vertexProgram;delete draw.fragmentProgram;
   }
   const output=await nativeRender({library:JSON.stringify({schema:1,shaders:[...shaders.values()]}),scene:JSON.stringify({schema:1,width:capture.width,height:capture.height,draws:capture.draws}),resources:capture.resources});
   const gpu=Buffer.from(capture.webgpuPixels,'base64'),black=Buffer.from(output.black,'base64'),white=Buffer.from(output.white,'base64');
   if(gpu.length!==capture.width*capture.height*4||black.length!==gpu.length||white.length!==gpu.length)throw Error('Reference image size mismatch');
   const options=[false,true].map(flip=>compare(gpu,black,white,capture.width,capture.height,flip));options.sort((a,b)=>a.meanAbsoluteError-b.meanAbsoluteError);
   results.push({version:capture.version,cardClass,golden,scope:'same frame draw commands and original D3D bytecode; text excluded',width:capture.width,height:capture.height,...options[0]});
   console.log(JSON.stringify(results.at(-1)));
   if(options[0].visiblePixels<100000||options[0].meanAbsoluteError>=0.01||options[0].changedPixels>=2000)throw Error('Native/WebGPU frame parity outside verified tolerance');
  }
 }
 const report={schema:1,scope:'Same generated frame draw commands; PC original D3D bytecode compared to translated WebGPU. Text and card-specific golden portrait animation excluded. Differences are reported as measured; no pixel-exact claim.',cases:results};
 if(!process.argv.includes('--no-write'))await fs.writeFile('v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/pc-webgpu-d3d-parity.json',JSON.stringify(report)+'\n');
 console.log(JSON.stringify({completed:true,cases:results.length}));
}finally{ws?.close();chrome.kill();}
