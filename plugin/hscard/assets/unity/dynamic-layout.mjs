// Dynamic text fitting for shared HS Plus text settings. No per-card layouts.
const f=Math.fround;
function plain(s){return s.replace(/<[^>]*>/g,'');}
function width(text,metrics,size,scale){let w=0;for(let i=0;i<text.length;i++)w+=metrics.roundedAdvance(text.charCodeAt(i),size);return w*scale*.1;}
function clean(value){return String(value??'').replace(/\[x\]/gi,'').replace(/\r/g,'').replace(/<br\s*\/?>/gi,'\n').replace(/[#$][ad]?(?=\d)/g,'').replace(/<(?!\/?(?:b|i|size|color)(?:[=>\s]|$))[^>]*>/gi,'');}
function wrap(text,metrics,size,scale,limit,unityPrecision=false){
 const tokens=text.match(/<[^>]*>|\n|[^\S\n]+|[^\s<]+/g)||[],lines=[''];let current='',visible='',pending='';
 const over=value=>unityPrecision?f(value)>f(limit):value>limit;
 function finish(){lines[lines.length-1]=current.replace(/\s+$/,'');lines.push('');current='';visible='';pending='';}
 for(const token of tokens){
  if(token==='\n'){finish();continue;}
  if(token[0]==='<'){current+=token;continue;}
  if(/^\s+$/.test(token)){pending+=' ';continue;}
  const candidate=visible+pending+token;
  if(visible&&over(width(candidate,metrics,size,scale))){finish();}
  let word=token;
  if(over(width(word,metrics,size,scale))&&word.length>1){for(const c of word){if(visible&&over(width(visible+pending+c,metrics,size,scale)))finish();current+=pending+c;visible+=pending+c;pending='';}continue;}
  current+=pending+word;visible+=pending+word;pending='';
 }
 lines[lines.length-1]=current.replace(/\s+$/,'');return lines.join('\n');
}

// The 3664 UberText assembly wraps even text containing authored newlines,
// reduces character size by 5% (up to 40 times), and reserves the lower
// ornament area on text objects whose m_Underwear flag is set. Measurements
// use the selected font's advances; Korean uses the configured fallback font.
function wrap3664(text,metrics,size,scale,settings,spacing,ellipsize=false){
 const limit=Number(settings.m_Width),height=Number(settings.m_Height),under=!!settings.m_Underwear;
 const narrow=f(limit*f(1-Number(settings.m_UnderwearWidth||0))),threshold=f(height*f(1-Number(settings.m_UnderwearHeight||0)));
 const out=[],tokens=[];let start=0,inTag=false;
 for(let i=0;i<text.length;i++){const c=text[i];if(c==='<')inTag=true;else if(c==='>')inTag=false;else if(!inTag&&(c===' '||c==='\n')){tokens.push(text.slice(start,i));start=i;}}
 tokens.push(text.slice(start));let line='',rows=1;
 const lineHeight=()=>f(f(metrics.lineHeight(size)*scale*.1)*f(1+f((rows-1)*spacing)));
 for(let token of tokens){
  if(token.startsWith('\n')){out.push(line);line='';rows++;token=token.slice(1);}
  const available=under&&lineHeight()>threshold?narrow:limit;
  if(line&&width(plain(line+token),metrics,size,scale)>=available){
   if(ellipsize&&f(f(metrics.lineHeight(size)*scale*.1)*f(1+f(rows*spacing)))>height){line+=' ...';break;}
   out.push(line);rows++;line=token.replace(/^ +/,'');
  }else line+=token;
 }
 out.push(line);return out.join('\n');
}
function fitText3664(value,settings,metrics){
 const text=clean(String(value??'').replace(/\r\n?/g,'\n').replace(/<br\s*\/?>/gi,'\n'));if(!text)return null;
 const size=Number(settings.m_FontSize),spacing=f(Number(settings.m_LineSpacing)),limit=Number(settings.m_Width),height=Number(settings.m_Height);
 let scale=f(Number(settings.m_CharacterSize)*.01),result=text,measureSpacing=spacing;
 const layout=ellipsize=>settings.m_WordWrap?wrap3664(text,metrics,size,scale,settings,measureSpacing,ellipsize):text;
 result=layout(false);
 if(settings.m_ResizeToFit){
  // 3664 IsMultiLine tests the number of newline characters against one.
  // ReduceText_CharSize temporarily sets spacing to zero when it is false.
  if(result.split('\n').length-1<=1)measureSpacing=0;
  for(let n=0;n<40;n++){
   const lines=result.split('\n'),longest=Math.max(0,...lines.map(row=>width(plain(row),metrics,size,scale)));
   const vertical=f(f(metrics.lineHeight(size)*scale*.1)*f(1+f((lines.length-1)*measureSpacing)));
   if(longest<=limit&&vertical<=height)break;
   const minimum=f(Number(settings.m_MinCharacterSize||0)*.01),next=f(scale*.95);
   if(next<=minimum){scale=minimum;result=layout(true);break;}
   scale=next;result=layout(false);
  }
 }
 return{Text:result,FontSize:size,CharacterSize:scale,LineSpacing:settings.m_ResizeToFit&&result.split('\n').length-1>1?measureSpacing:spacing};
}

export function fitText(value,settings,metrics,role){
 if(settings.nativeLayoutVersion==='1.0.0.3664')return fitText3664(value,settings,metrics);
 const normalized=String(value??'').replace(/\r\n?/g,'\n').replace(/<br\s*\/?>/gi,'\n');
 const manual=normalized.includes('\n');
 let text=clean(normalized),size=Number(settings.m_FontSize),scale=settings.nativeLayout?f(Number(settings.m_CharacterSize)*Number(settings.m_CharacterSizeModifier??1)*.01):f(f(f(Number(settings.m_CharacterSize))*f(Number(settings.m_CharacterSizeModifier??1)))*f(.01)),lineSpacing=Number(settings.m_LineSpacing);
 if(!text)return null;
 const isName=role==='m_nameTextMesh',isLabel=role==='m_raceTextMesh'||role==='m_multiRaceTextMesh';
 if(isName&&!settings.nativeLayout)scale=f(scale*f(.95));
 if(isLabel&&settings.m_ResizeToFitAndGrow){const maxHeight=Number(settings.m_Height),lines=text.split('\n').length,space=lines>1?Number(settings.m_LineSpacing)*Number(settings.m_LineSpaceModifier??1):Number(settings.m_LineSpacing);const ratio=maxHeight/(metrics.lineHeight(size)*.1*(1+(lines-1)*space));scale=f(Math.min(scale*1.5,ratio));}
 const raw=text,limit=Number(settings.m_Width),height=Number(settings.m_Height);
 for(let i=0;i<(settings.nativeLayout?40:28);i++){
  text=settings.m_WordWrap&&(!manual||settings.wrapAuthoredNewlines)?wrap(raw,metrics,size,scale,limit,!!settings.wrapAuthoredNewlines):raw;
  const rows=text.split('\n'),plainRows=rows.map(plain),longest=Math.max(0,...plainRows.map(s=>width(s,metrics,size,scale)));
  lineSpacing=rows.length>1?Number(settings.m_LineSpacing)*Number(settings.m_LineSpaceModifier??1):Number(settings.m_LineSpacing);
  const vertical=metrics.lineHeight(size)*scale*.1*(1+(rows.length-1)*lineSpacing);
  if(!settings.m_ResizeToFit||(longest<=limit+1e-5&&vertical<=height+1e-5))break;
  const next=settings.nativeLayout?f(scale*.95):f(scale*f(.95)),minimum=settings.nativeLayout?f(Number(settings.m_MinCharacterSize||0)*.01):0;
  if(scale<=minimum)break;
  scale=Math.max(minimum,next);
 }
 return {Text:text,FontSize:size,CharacterSize:scale,LineSpacing:f(lineSpacing)};
}
export function textValues(card){
 const race=String(card.race||''),kind=card.kind,school=String(card.school||'');
 return {m_nameTextMesh:card.name,m_powersTextMesh:card.text,m_costTextMesh:String(card.cost??0),
  m_attackTextMesh:kind==='MINION'||kind==='WEAPON'?String(card.attack??0):'',
  m_healthTextMesh:kind==='MINION'?String(card.health??0):kind==='WEAPON'||kind==='LOCATION'?String(card.durability||card.health||0):'',
  m_armorTextMesh:Number(card.armor)>0?String(card.armor):'',
  m_raceTextMesh:kind==='SPELL'?school:race.includes(',')?'':race,
  m_multiRaceTextMesh:race.includes(',')?race.split(',').map(x=>x.trim()).join('\n'):''};
}
