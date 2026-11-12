// Text quads and atlas follow HS Plus LocalTextComposer.Build. Fit parameters
// are calculated by HS Plus's original game text layout and stored as data.
export function composeGlyphs(raster,font,fit,settings){
  const f=Math.fround, size=fit.FontSize, text=fit.Text;
  if(typeof text!=='string'||text.length>32768)throw Error('Invalid card text');
  const lines=[[]],sizes=[size],initial=settings.m_TextColor||{r:1,g:1,b:1,a:1},colors=[[initial.r,initial.g,initial.b,initial.a]];
  let italic=0,bold=0;
  for(let i=0;i<text.length;i++){
    const code=text.charCodeAt(i);if(code===13)continue;if(code===10){lines.push([]);continue;}
    if(code===60){const end=text.indexOf('>',i+1);if(end<0)throw Error('Unclosed rich text');const tag=text.slice(i+1,end).toLowerCase();
      if(tag==='i')italic++;else if(tag==='/i')italic=Math.max(0,italic-1);else if(tag==='b'||tag==='material=1')bold++;else if(tag==='/b'||tag==='/material')bold=Math.max(0,bold-1);
      else if(tag.startsWith('size=')){const n=Number(tag.slice(5));if(!Number.isInteger(n)||n<1||n>512)throw Error('Unsupported text size');sizes.push(n);}
      else if(tag==='/size'){if(sizes.length>1)sizes.pop();}
      else if(tag.startsWith('color=#')){const hex=tag.slice(7);if(!/^(?:[0-9a-f]{6}|[0-9a-f]{8})$/.test(hex))throw Error('Unsupported text color');const a=[];for(let at=0;at<hex.length;at+=2)a.push(f(parseInt(hex.slice(at,at+2),16)/255));if(a.length===3)a.push(1);colors.push(a);}
      else if(tag==='/color'){if(colors.length>1)colors.pop();}else throw Error('Unsupported rich text: '+tag);i=end;continue;
    }
    lines[lines.length-1].push({code,size:sizes[sizes.length-1],style:italic?2:0,material:bold?1:0,color:colors[colors.length-1]});
  }
  const glyphs=new Map();let x=0,y=0,rowHeight=0;
  for(const char of lines.flat()){
    const key=[char.code,char.size,char.style].join(':');let glyph=glyphs.get(key);
    if(!glyph){const data=raster.render(font,char.code,char.size,char.style);if(x+data.Width>1024){x=0;y+=rowHeight;rowHeight=0;}glyph={...data,code:char.code,size:char.size,style:char.style,x,y};glyphs.set(key,glyph);x+=data.Width+2;rowHeight=Math.max(rowHeight,data.Height+2);}
    char.glyph=glyph;
  }
  let height=1;while(height<y+rowHeight)height*=2;if(height>4096)throw Error('Text atlas too large');
  const atlas=new Uint8Array(1024*height);
  for(const glyph of glyphs.values())for(let row=0;row<glyph.Height;row++)atlas.set(glyph.alpha.subarray(row*glyph.Width,(row+1)*glyph.Width),(height-1-glyph.y-row)*1024+glyph.x);
  const metrics=raster.metrics(font),scale=f(f(fit.CharacterSize)*f(.1)),lineHeight=metrics.lineHeight(size),spacing=f(fit.LineSpacing);
  const fullHeight=f(lineHeight*f(1+f(f(lines.length-1)*spacing))),baseline=f(f(f(settings.m_Anchor)*fullHeight)*f(.5)-metrics.ascent(size)+(settings.nativeUnity4KoreanBaseline?f((f(lineHeight*.5)-metrics.ascent(size))*.406):0)),align=Number(settings.m_Alignment),quads=[];
  for(let line=0;line<lines.length;line++){
    const row=lines[line];let width=0;for(const c of row)width=f(width+c.glyph.Advance);let pen=f(f(-align*width)/2);
    for(const c of row){const g=c.glyph;if(c.code!==32&&g.Width>0&&g.Height>0){
      const left=f(f(pen+g.Left)*scale),right=f(f(f(pen+g.Left)+g.Width)*scale), offset=f(f(f(line*lineHeight)*spacing));
      const bottom=f(f(f(f(baseline-offset)+g.Top)-g.Height)*scale),top=f(f(f(baseline-offset)+g.Top)*scale);
      quads.push({code:c.code,material:c.material,color:c.color,position:[left,bottom,right,top],uv:[f(g.x/1024),f((height-g.y-g.Height)/height),f((g.x+g.Width)/1024),f((height-g.y)/height)]});
    }pen=f(pen+g.Advance);}
  }
  return {width:1024,height,atlas,glyphs:[...glyphs.values()].map(({code,size,style,x,y,Width,Height})=>({code,size,style,x,y,width:Width,height:Height})),quads};
}
