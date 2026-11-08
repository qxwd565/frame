// Port of the TrueType metrics used by HS Plus LocalFontFace. It reads the
// source font tables rather than measuring text with browser substitute fonts.
export class FontMetrics {
  constructor(bytes, settings) {
    this.view=new DataView(bytes.buffer,bytes.byteOffset,bytes.byteLength);this.tables=new Map();
    const tag=at=>String.fromCharCode(...new Uint8Array(this.view.buffer,this.view.byteOffset+at,4));
    let directory=tag(0)==='ttcf'?this.u32(12):0, count=this.u16(directory+4);
    if(count<1||count>256)throw Error('Invalid font directory');
    for(let i=0;i<count;i++){const p=directory+12+i*16,name=tag(p),offset=this.u32(p+8),length=this.u32(p+12);if(offset+length>bytes.length||this.tables.has(name))throw Error('Invalid font table');this.tables.set(name,offset);}
    this.units=this.u16(this.table('head')+18);this.metrics=this.u16(this.table('hhea')+34);if(!this.units||!this.metrics)throw Error('Invalid font units');
    const mapping=this.table('cmap'),subtables=this.u16(mapping+2);let selected=-1,wide=false;
    for(let i=0;i<subtables;i++){const p=mapping+4+i*8,platform=this.u16(p),encoding=this.u16(p+2),sub=mapping+this.u32(p+4),format=this.u16(sub);if(format===12&&(platform===0||platform===3&&encoding===10)){selected=sub;wide=true;break;}if(format===4&&(platform===0||platform===3&&encoding===1))selected=sub;}
    if(selected<0)throw Error('Missing Unicode cmap');this.cmap=selected;this.wide=wide;
    this.lineEm=Math.fround(Math.fround(settings.m_LineSpacing)/Math.fround(settings.m_FontSize));
    this.ascentEm=Math.fround(Math.fround(settings.m_Ascent)/Math.fround(settings.m_FontSize));
  }
  u16(at){return this.view.getUint16(at,false);}
  u32(at){return this.view.getUint32(at,false);}
  table(name){if(!this.tables.has(name))throw Error('Missing font table '+name);return this.tables.get(name);}
  glyph(code){
    const c=this.cmap;if(this.wide){const count=this.u32(c+12);if(count>1000000)throw Error('Invalid Unicode groups');for(let i=0;i<count;i++){const p=c+16+i*12,first=this.u32(p),last=this.u32(p+4);if(code<first)break;if(code<=last)return this.u32(p+8)+code-first;}return 0;}
    if(code<0||code>65535)return 0;const count=this.u16(c+6)/2,end=c+14,start=end+count*2+2,delta=start+count*2,ranges=delta+count*2;
    for(let i=0;i<count;i++){if(code>this.u16(end+i*2))continue;const first=this.u16(start+i*2);if(code<first)return 0;const d=this.view.getInt16(delta+i*2,false),range=this.u16(ranges+i*2);if(!range)return(code+d)&65535;const glyph=this.u16(ranges+i*2+range+2*(code-first));return glyph?(glyph+d)&65535:0;}return 0;
  }
  advance(code,pixels){const glyph=this.glyph(code);if(!glyph)return 0;const units=this.u16(this.table('hmtx')+Math.min(glyph,this.metrics-1)*4);return Math.fround(Math.fround(units*Math.fround(pixels))/this.units);}
  roundedAdvance(code,pixels){return Math.floor(this.advance(code,pixels)+.5);}
  lineHeight(pixels){return Math.fround(this.lineEm*Math.fround(pixels));}
  ascent(pixels){return Math.fround(this.ascentEm*Math.fround(pixels));}
}
