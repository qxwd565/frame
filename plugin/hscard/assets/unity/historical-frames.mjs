import {resourceURL, resourceFetch} from './resource-url.mjs?ver=hscard-b9ff08d18e1850c3';
// Lazy reader for the bundled native historical resources. This does not
// select a frame for a date or alter the current card renderer.
const limit = 128 * 1024 * 1024;
const decoder = new TextDecoder('utf-8', {fatal:true});
const hash = async bytes => Array.from(new Uint8Array(await crypto.subtle.digest('SHA-256', bytes)), x => x.toString(16).padStart(2, '0')).join('');

async function get(url) {
  const response = await resourceFetch(url, {credentials:'same-origin'});
  if (!response.ok) throw Error('Historical resource HTTP ' + response.status);
  const data = await response.arrayBuffer();
  if (data.byteLength > limit) throw Error('Historical resource exceeds budget');
  return data;
}

export class HistoricalFrames {
  static async load(base = resourceURL('historical-frames/')) {
    const baseURL = new URL(base, import.meta.url), manifest = JSON.parse(decoder.decode(await get(new URL('manifest.json', baseURL))));
    if (![1,2].includes(manifest.schemaVersion) || !Array.isArray(manifest.libraries)) throw Error('Invalid historical frame manifest');
    return new HistoricalFrames(baseURL, manifest);
  }

  constructor(base, manifest) {
    this.base = base;
    this.manifest = manifest;
    this.libraries = new Map();
    this.catalogs = new Map();
    this.blobs = null;
  }

  async catalog(name) {
    if (!this.manifest.catalogs.includes(name)) throw Error('Unknown historical catalog');
    if (!this.catalogs.has(name)) this.catalogs.set(name, get(new URL(name, this.base)).then(bytes => JSON.parse(decoder.decode(bytes))).catch(error => { this.catalogs.delete(name); throw error; }));
    return this.catalogs.get(name);
  }

  async library(edition) {
    if (!this.libraries.has(edition)) {
      const entries = this.manifest.libraries.filter(entry => entry.edition === edition);
      if (entries.length !== 1 || !/^[a-zA-Z0-9.-]+\.frames(?:\.json\.gz)?$/.test(entries[0].file)) throw Error('Unknown historical library');
      const entry = entries[0];
      this.libraries.set(edition, (async () => {
        const bytes = await get(new URL(entry.file, this.base));
        if (bytes.byteLength !== entry.bytes || await hash(bytes) !== entry.sha256) throw Error('Historical library checksum');
        if (entry.storage === 'shared') {
          const headerBytes = await new Response(new Blob([bytes]).stream().pipeThrough(new DecompressionStream('gzip'))).arrayBuffer();
          if (headerBytes.byteLength > 8*1024*1024 || await hash(headerBytes) !== entry.headerSha256) throw Error('Historical header checksum');
          const header = JSON.parse(decoder.decode(headerBytes));
          if (header.schema !== 1 || header.edition !== edition || header.version !== entry.version || !Array.isArray(header.assets) || !Array.isArray(header.blobs)) throw Error('Invalid historical library');
          const assets = new Map();
          for (const asset of header.assets) { if (!asset.key || assets.has(asset.key)) throw Error('Duplicate historical asset'); assets.set(asset.key, asset); }
          return {header,assets,shared:true};
        }
        const view = new DataView(bytes);
        if (bytes.byteLength < 8 || decoder.decode(new Uint8Array(bytes, 0, 4)) !== 'HFS1') throw Error('Historical library header');
        const size = view.getUint32(4, true);
        if (size > 8 * 1024 * 1024 || size > bytes.byteLength - 8) throw Error('Historical header size');
        const headerBytes = new Uint8Array(bytes, 8, size);
        if (await hash(headerBytes) !== entry.headerSha256) throw Error('Historical header checksum');
        const header = JSON.parse(decoder.decode(headerBytes));
        if (header.schema !== 1 || header.edition !== edition || header.version !== entry.version || !Array.isArray(header.assets) || !Array.isArray(header.blobs)) throw Error('Invalid historical library');
        const assets = new Map();
        for (const asset of header.assets) { if (!asset.key || assets.has(asset.key)) throw Error('Duplicate historical asset'); assets.set(asset.key, asset); }
        return {bytes, header, assets, start:8 + size};
      })().catch(error => { this.libraries.delete(edition); throw error; }));
    }
    return this.libraries.get(edition);
  }

  async texture(catalog, id) {
    const matches = catalog.textures.filter(item => item.id === id);
    if (matches.length !== 1) throw Error('Unknown historical texture');
    const source = matches[0], edition = source.edition || catalog.edition || '2019', library = await this.library(edition), asset = library.assets.get(source.assetKey);
    if (!asset || asset.type !== 28 || asset.width !== source.width || asset.height !== source.height || !Number.isInteger(asset.rgbaBlob)) throw Error('Historical texture metadata');
    const blob = library.header.blobs[asset.rgbaBlob];
    if (library.shared) return this.sharedTexture(blob,source);
    if (!blob || blob.encoding !== 'rgba32' || !Number.isSafeInteger(blob.offset) || !Number.isSafeInteger(blob.length) || blob.offset < 0 || blob.length < 1 || blob.offset + blob.length > library.bytes.byteLength - library.start || !Number.isSafeInteger(blob.rawLength) || blob.rawLength < 4 || blob.rawLength > limit || blob.rawLength !== source.width * source.height * 4) throw Error('Historical texture bounds');
    const packed = new Uint8Array(library.bytes, library.start + blob.offset, blob.length);
    if (await hash(packed) !== blob.sha256) throw Error('Historical texture transport checksum');
    const pixels = new Uint8Array(await new Response(new Blob([packed]).stream().pipeThrough(new DecompressionStream('gzip'))).arrayBuffer());
    if (pixels.byteLength !== blob.rawLength || pixels.byteLength !== source.width * source.height * 4 || await hash(pixels) !== blob.rawSha256 || blob.rawSha256 !== source.rgbaSha256) throw Error('Historical texture checksum');
    return {width:source.width, height:source.height, format:28, levels:[pixels]};
  }

  async sharedTexture(blob,source) {
    if (!blob || blob.encoding !== 'rgba32' || blob.rawLength !== source.width*source.height*4 || blob.rawLength > limit) throw Error('Historical texture bounds');
    if (!this.blobs) this.blobs = get(new URL(this.manifest.blobIndex,this.base)).then(bytes=>JSON.parse(decoder.decode(bytes))).catch(error=>{this.blobs=null;throw error;});
    const descriptor=(await this.blobs)[blob.sha256];
    if (!descriptor || descriptor.encoding !== 'rgba32' || descriptor.rawSha256 !== blob.rawSha256 || descriptor.rawLength !== blob.rawLength || descriptor.width !== source.width || descriptor.height !== source.height) throw Error('Historical shared texture metadata');
    if(blob.rawSha256!==source.rgbaSha256)throw Error('Historical texture checksum');
    return readTexturePlanes(this.base,{...descriptor,rgbaSha256:blob.rawSha256});
  }

  async mesh(edition, key) {
    const library = await this.library(edition), asset = library.assets.get(key);
    if (!asset || asset.type !== 43 || !asset.runtimeMesh) throw Error('Historical mesh unavailable');
    return asset.runtimeMesh;
  }
}

export async function readTexturePlanes(base,descriptor) {
    const plane = async entry => {
      if (!entry || !/^blobs\/[A-Za-z0-9_().-]+\.webp$/.test(entry.file) || entry.file.includes('..')) throw Error('Historical plane path');
      const bytes=await get(new URL(entry.file,base));
      if(bytes.byteLength!==entry.bytes || await hash(bytes)!==entry.sha256)throw Error('Historical plane checksum');
      const image=await createImageBitmap(new Blob([bytes],{type:'image/webp'}),{premultiplyAlpha:'none',colorSpaceConversion:'none'});
      const canvas=document.createElement('canvas');
      try {
        if(image.width!==descriptor.width || image.height!==descriptor.height)throw Error('Historical plane dimensions');
        canvas.width=image.width;canvas.height=image.height;
        const ctx=canvas.getContext('2d',{willReadFrequently:true});if(!ctx)throw Error('Historical texture decoder unavailable');
        ctx.drawImage(image,0,0);return ctx.getImageData(0,0,image.width,image.height).data;
      } finally {image.close();canvas.width=canvas.height=1;}
    };
    // Separate opaque RGB and alpha images preserve all original RGBA bytes,
    // including RGB under transparent pixels. No premultiplication correction.
    const [rgb,alpha]=await Promise.all([plane(descriptor.rgb),plane(descriptor.alpha)]);const pixels=new Uint8Array(rgb);
    for(let i=0;i<pixels.length;i+=4)pixels[i+3]=alpha[i];
    if(await hash(pixels)!==descriptor.rgbaSha256)throw Error('Historical texture checksum');
    return {width:descriptor.width,height:descriptor.height,format:28,levels:[pixels]};
}
