import {FontMetrics} from './font-metrics.mjs?ver=hscard-2c8d95b9b73e896b';

// The exact font programs come from the installed game via HS Plus's validated
// font loader. FreeType is compiled from the same 2.13.2 release as HS Plus.
export async function createFontRasterizer(wasm, fontArchive, fontSettings) {
  const archive = await new Response(new Blob([fontArchive]).stream().pipeThrough(new DecompressionStream('gzip'))).json();
  if (archive.schema !== 1 || !archive.fonts) throw Error('Invalid original font archive');
  const wasi = new Proxy({}, {get:(_,name)=>name==='proc_exit'?()=>{throw Error('FreeType runtime exited');}:String(name).startsWith('environ_')?()=>0:()=>8});
  // These fonts are verified before use. Reject an exceptional FreeType path
  // rather than continuing after a validation failure in the WASM instance.
  const env={__wasm_setjmp:()=>0,__wasm_setjmp_test:()=>0,__wasm_longjmp:()=>{throw Error('FreeType rejected original font data');}};
  const {instance}=await WebAssembly.instantiate(wasm,{wasi_snapshot_preview1:wasi,env}), ft=instance.exports;
  ft._initialize();if(ft.hs_init())throw Error('FreeType initialization failed');
  const faces=new Map(),glyphs=new Map();let disposed=false,glyphBytes=0;
  async function register(archive,settingsList){
    if(disposed)throw Error('Font rasterizer has been disposed');
    for(const [name,font] of Object.entries(archive.fonts)){
      const settings=settingsList.find(f=>f.name===name);if(!settings||font.name!==name||font.sha256!==settings.sha256)throw Error('Unexpected source font '+name);
      if(faces.has(name)){if(faces.get(name).sha256!==font.sha256)throw Error('Conflicting source font '+name);continue;}
      const binary=atob(font.data),bytes=new Uint8Array(binary.length);for(let i=0;i<binary.length;i++)bytes[i]=binary.charCodeAt(i);
      const hash=[...new Uint8Array(await crypto.subtle.digest('SHA-256',bytes))].map(x=>x.toString(16).padStart(2,'0')).join('');
      if(hash!==settings.sha256)throw Error('Original font checksum mismatch');
      const metrics=new FontMetrics(bytes,settings.settings),ptr=ft.malloc(bytes.length);if(!ptr)throw Error('Font allocation failed');
      new Uint8Array(ft.memory.buffer,ptr,bytes.length).set(bytes);const face=ft.hs_face(ptr,bytes.length);
      if(!face){ft.free(ptr);throw Error('Original font could not be opened');}
      faces.set(name,{face,ptr,metrics,padding:Number(settings.settings.m_CharacterPadding),sha256:font.sha256});
    }
  }
  try {await register(archive,fontSettings);}catch(error){for(const f of faces.values()){ft.hs_close(f.face);ft.free(f.ptr);}throw error;}
  return {
    register,
    render(name,code,size,style=0){
      if(disposed)throw Error('Font rasterizer has been disposed');const f=faces.get(name);
      if(!f || !Number.isInteger(code) || code<0 || code>65535 || !Number.isInteger(size) || size<1 || size>512 || ![0,2].includes(style))throw Error('Unsupported original glyph');
      const key=[name,code,size,style].join(':'),cached=glyphs.get(key);if(cached){glyphs.delete(key);glyphs.set(key,cached);return cached;}
      const status=ft.hs_render(f.face,code,size,style===2?1:0,f.padding);if(status)throw Error('Original glyph render failed: '+status);
      const width=ft.hs_width(),height=ft.hs_height(),alpha=new Uint8Array(new Uint8Array(ft.memory.buffer,ft.hs_alpha(),width*height));
      const glyph={Left:ft.hs_left(),Top:ft.hs_top(),Width:width,Height:height,Advance:f.metrics.roundedAdvance(code,size),alpha};
      if(alpha.length<=16*1024*1024){while(glyphs.size&&(glyphs.size>=4096||glyphBytes+alpha.length>16*1024*1024)){const first=glyphs.keys().next().value;glyphBytes-=glyphs.get(first).alpha.length;glyphs.delete(first);}glyphs.set(key,glyph);glyphBytes+=alpha.length;}
      return glyph;
    },
    metrics(name){const f=faces.get(name);if(disposed||!f)throw Error('Original font unavailable');return f.metrics;},
    dispose(){if(disposed)return;disposed=true;for(const f of faces.values()){ft.hs_close(f.face);ft.free(f.ptr);}faces.clear();glyphs.clear();glyphBytes=0;}
  };
}
