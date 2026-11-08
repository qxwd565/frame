// Dynamic text fitting for shared HS Plus text settings. No per-card layouts.
const f=Math.fround;
function plain(s){return s.replace(/<[^>]*>/g,'');}
function width(text,metrics,size,scale){let w=0;for(let i=0;i<text.length;i++)w+=metrics.roundedAdvance(text.charCodeAt(i),size);return w*scale*.1;}
function clean(value){return String(value??'').replace(/\[x\]/gi,'').replace(/\r/g,'').replace(/<br\s*\/?>/gi,'\n').replace(/[#$][ad]?(?=\d)/g,'').replace(/<(?!\/?(?:b|i|size|color)(?:[=>\s]|$))[^>]*>/gi,'');}
function wrap(text,metrics,size,scale,limit){
 const tokens=text.match(/<[^>]*>|\n|[^\S\n]+|[^\s<]+/g)||[],lines=[''];let current='',visible='',pending='';
 function finish(){lines[lines.length-1]=current.replace(/\s+$/,'');lines.push('');current='';visible='';pending='';}
 for(const token of tokens){
  if(token==='\n'){finish();continue;}
  if(token[0]==='<'){current+=token;continue;}
  if(/^\s+$/.test(token)){pending+=' ';continue;}
  const candidate=visible+pending+token;
  if(visible&&width(candidate,metrics,size,scale)>limit){finish();}
  let word=token;
  if(width(word,metrics,size,scale)>limit&&word.length>1){for(const c of word){if(visible&&width(visible+pending+c,metrics,size,scale)>limit)finish();current+=pending+c;visible+=pending+c;pending='';}continue;}
  current+=pending+word;visible+=pending+word;pending='';
 }
 lines[lines.length-1]=current.replace(/\s+$/,'');return lines.join('\n');
}
export function fitText(value,settings,metrics,role){
 const normalized=String(value??'').replace(/\r\n?/g,'\n').replace(/<br\s*\/?>/gi,'\n');
 const manual=normalized.includes('\n');
 let text=clean(normalized),size=Number(settings.m_FontSize),scale=f(Number(settings.m_CharacterSize)*Number(settings.m_CharacterSizeModifier??1)*.01),lineSpacing=Number(settings.m_LineSpacing);
 if(!text)return null;
 const isName=role==='m_nameTextMesh',isLabel=role==='m_raceTextMesh'||role==='m_multiRaceTextMesh';
 if(isName&&!settings.nativeLayout)scale=f(scale*.95);
 if(isLabel&&settings.m_ResizeToFitAndGrow){const maxHeight=Number(settings.m_Height),lines=text.split('\n').length,space=lines>1?Number(settings.m_LineSpacing)*Number(settings.m_LineSpaceModifier??1):Number(settings.m_LineSpacing);const ratio=maxHeight/(metrics.lineHeight(size)*.1*(1+(lines-1)*space));scale=f(Math.min(scale*1.5,ratio));}
 const raw=text,limit=Number(settings.m_Width),height=Number(settings.m_Height);
 for(let i=0;i<(settings.nativeLayout?40:28);i++){
  text=settings.m_WordWrap&&!manual?wrap(raw,metrics,size,scale,limit):raw;
  const rows=text.split('\n'),plainRows=rows.map(plain),longest=Math.max(0,...plainRows.map(s=>width(s,metrics,size,scale)));
  lineSpacing=rows.length>1?Number(settings.m_LineSpacing)*Number(settings.m_LineSpaceModifier??1):Number(settings.m_LineSpacing);
  const vertical=metrics.lineHeight(size)*scale*.1*(1+(rows.length-1)*lineSpacing);
  if(!settings.m_ResizeToFit||(longest<=limit+1e-5&&vertical<=height+1e-5))break;
  const next=f(scale*.95),minimum=settings.nativeLayout?f(Number(settings.m_MinCharacterSize||0)*.01):0;
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
