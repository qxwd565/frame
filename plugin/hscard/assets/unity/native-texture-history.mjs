import {resourceFetch} from './resource-url.mjs?ver=hscard-a573f18746776bc1';

const digest = async bytes => Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256', bytes)), b => b.toString(16).padStart(2,'0')).join('');

export function selectTextureVariant(history, name, date) {
 if (history?.schema !== 1 || !/^\d{4}-\d{2}-\d{2}$/.test(date)) return null;
 const rows = history.textures?.[name];
 if (!Array.isArray(rows)) return null;
 return rows.filter(row => row.effectiveFromKst <= date).sort((a,b) => b.effectiveFromKst.localeCompare(a.effectiveFromKst))[0] || null;
}

// Decode original 8-bit RGBA PNGs without canvas premultiplication, preserving
// even the RGB bytes of fully transparent texels.
export async function decodeTexturePng(bytes, expected) {
 const data = new Uint8Array(bytes), view = new DataView(data.buffer, data.byteOffset, data.byteLength);
 if (data.length < 33 || [137,80,78,71,13,10,26,10].some((b,i)=>data[i]!==b)) throw Error('Invalid texture PNG');
 if (await digest(data) !== expected.pngSha256) throw Error('Texture PNG checksum');
 let pos=8, width=0, height=0, idat=[], ended=false;
 while (pos+12<=data.length) {
  const size=view.getUint32(pos), type=String.fromCharCode(...data.subarray(pos+4,pos+8)), start=pos+8, end=start+size;
  if (end+4>data.length) throw Error('Truncated texture PNG');
  if(type==='IHDR') {
   if(size!==13 || width) throw Error('Invalid PNG header');
   width=view.getUint32(start);height=view.getUint32(start+4);
   if(width!==expected.width || height!==expected.height || width*height>16777216 || data[start+8]!==8 || data[start+9]!==6 || data[start+10] || data[start+11] || data[start+12]) throw Error('Unsupported texture PNG format');
  } else if(type==='IDAT') idat.push(data.subarray(start,end));
  else if(type==='IEND'){ended=true;break;}
  pos=end+4;
 }
 if(!ended||!width||!idat.length)throw Error('Incomplete texture PNG');
 const raw=new Uint8Array(await new Response(new Blob(idat).stream().pipeThrough(new DecompressionStream('deflate'))).arrayBuffer());
 const stride=width*4;if(raw.length!==(stride+1)*height)throw Error('Texture PNG data length');
 const pixels=new Uint8Array(stride*height);
 for(let y=0;y<height;y++){
  const filter=raw[y*(stride+1)];if(filter>4)throw Error('Unsupported PNG filter');
  for(let x=0;x<stride;x++){
   const i=y*stride+x,a=x>=4?pixels[i-4]:0,b=y?pixels[i-stride]:0,c=y&&x>=4?pixels[i-stride-4]:0;
   let predictor=0;
   if(filter===1)predictor=a;else if(filter===2)predictor=b;else if(filter===3)predictor=Math.floor((a+b)/2);
   else if(filter===4){const p=a+b-c,pa=Math.abs(p-a),pb=Math.abs(p-b),pc=Math.abs(p-c);predictor=pa<=pb&&pa<=pc?a:pb<=pc?b:c;}
   pixels[i]=(raw[y*(stride+1)+1+x]+predictor)&255;
  }
 }
 if(await digest(pixels)!==expected.rgbaSha256)throw Error('Texture pixel checksum');
 return {width,height,format:28,levels:[pixels]};
}

export async function loadTextureVariant(base, row) {
 if(!/^texture-history\/1\.0\.0\.\d+\/[A-Za-z0-9_]+\.png$/.test(row.file))throw Error('Invalid texture history path');
 const response=await resourceFetch(new URL(row.file,base));
 if(!response.ok)throw Error('Texture history HTTP '+response.status);
 const pixels=await decodeTexturePng(await response.arrayBuffer(),row),s=row.sampler;
 if(!s)throw Error('Original texture sampler unavailable');
 return {pixels,sampler:{filter:s.m_FilterMode,wrapU:s.m_WrapMode,wrapV:s.m_WrapMode,anisotropy:s.m_Aniso,bias:s.m_MipBias},st:[1,1,0,0]};
}
