// Port of HSPlus.Rendering.LocalArtworkAnimation. Native curves/gradients and
// the supplied UberMath permutation drive values; no synthetic motion.
const f=Math.fround,rows=x=>Array.isArray(x)?x:x?.Array||[],on=x=>x===true||x===1;
const clamp=x=>Math.max(0,Math.min(1,x)),repeat=(x,n)=>x-Math.floor(x/n)*n;
export function curveValue(curve,time){
 const keys=rows(curve?.m_Curve);if(!keys.length)return 0;if(keys.length===1)return keys[0].value;
 const first=keys[0].time,last=keys.at(-1).time,duration=last-first;if(!(duration>0))return keys.at(-1).value;
 if(time<first||time>last){const mode=time<first?curve.m_PreInfinity:curve.m_PostInfinity;
  if(mode===1)time=first+repeat(time-first,duration);else if(mode===4){const phase=repeat(time-first,duration*2);time=first+(phase<=duration?phase:duration*2-phase);}else return(time<first?keys[0]:keys.at(-1)).value;}
 if(time<=first)return keys[0].value;if(time>=last)return keys.at(-1).value;
 let at=1;while(keys[at].time<time)at++;const a=keys[at-1],b=keys[at],dt=b.time-a.time;let u=(time-a.time)/dt;
 if(!Number.isFinite(a.outSlope)||!Number.isFinite(b.inSlope))return a.value;
 if((a.weightedMode&2)||(b.weightedMode&1)){
  const w0=a.weightedMode&2?a.outWeight:1/3,w1=b.weightedMode&1?b.inWeight:1/3;let lo=0,hi=1;
  for(let i=0;i<24;i++){const mid=(lo+hi)*.5,v=1-mid,x=3*v*v*mid*w0+3*v*mid*mid*(1-w1)+mid**3;if(x<u)lo=mid;else hi=mid;}
  u=(lo+hi)*.5;const q=1-u;return f(q**3*a.value+3*q*q*u*(a.value+a.outSlope*dt*w0)+3*q*u*u*(b.value-b.inSlope*dt*w1)+u**3*b.value);
 }
 return f((2*u**3-3*u*u+1)*a.value+(u**3-2*u*u+u)*dt*a.outSlope+(-2*u**3+3*u*u)*b.value+(u**3-u*u)*dt*b.inSlope);
}
// UberMath.SimplexNoise(float,float), including its original float constants.
const gradients=[[1,1],[-1,1],[1,-1],[-1,-1],[1,0],[-1,0],[1,0],[-1,0],[0,1],[0,-1],[0,1],[0,-1]];
export function simplexNoise(x,y,p){
 const F=f(.36602542),G=f(.21132487),s=f(f(x+y)*F),i=Math.floor(f(x+s)),j=Math.floor(f(y+s)),t=f((i+j)*G),x0=f(x-f(i-t)),y0=f(y-f(j-t)),i1=x0>y0?1:0,j1=1-i1,ii=i&255,jj=j&255;
 const points=[[x0,y0,p[ii+p[jj]]%12],[f(f(x0-i1)+G),f(f(y0-j1)+G),p[ii+i1+p[jj+j1]]%12],[f(f(x0-1)+f(2*G)),f(f(y0-1)+f(2*G)),p[ii+1+p[jj+1]]%12]];
 const n=points.map(([a,b,g])=>{let q=f(f(.5-f(a*a))-f(b*b));if(q<0)return 0;q=f(q*q);return f(f(q*q)*f(f(gradients[g][0]*a)+f(gradients[g][1]*b)));});return f(70*f(f(n[0]+n[1])+n[2]));
}
function elementValue(e,baseline,time,permutation){
 const c=e.animationCurve,r=e.randomAnimation,hasCurve=on(c?.enabled);let value=on(e.incrementingValue)?0:baseline;
 if(hasCurve)value=f((curveValue(c.animationCurve,f(time*c.speed))+c.offset)*c.scale);
 if(on(r?.enabled)){if(!hasCurve)value=0;const intensity=r.intensityCurve==null?1:curveValue(r.intensityCurve,f(time*r.intensitySpeed)),phase=clamp(f(f(f(simplexNoise(f(f(time*r.speed)+r.seed),.5,permutation)+1)*.5)*intensity));value=f(value+f(f(r.minValue+f(f(r.maxValue-r.minValue)*phase))*r.scale));}
 return value;
}
function gradientValue(g,time){const scaled=clamp(time)*65535;return ['r','g','b','a'].map((channel,i)=>{const prefix=i===3?'atime':'ctime',count=i===3?g.m_NumAlphaKeys:g.m_NumColorKeys;if(!count)return 0;let right=0;while(right<count-1&&g[prefix+right]<scaled)right++;const left=Math.max(0,right-1),start=g[prefix+left],end=g[prefix+right];let mix=end<=start?0:clamp((scaled-start)/(end-start));if(g.m_Mode===1)mix=scaled<=start?0:1;return f(g['key'+left][channel]+(g['key'+right][channel]-g['key'+left][channel])*mix);});}
export function validateAnimation(asset,permutation){
 if(!asset)return;if(!asset.animations||rows(asset.animations).length>256)throw Error('Invalid golden animation');
 for(const a of rows(asset.animations)){
  if(typeof a.materialPropertyName!=='string'||![0,1,2].includes(a.propertyType)||rows(a.animationElement).length>4)throw Error('Unsupported golden animation property');
  for(const e of rows(a.animationElement)){if(!Number.isInteger(e.element)||e.element<0||e.element>3||!Number.isFinite(e.incrementingSpeed))throw Error('Invalid golden animation channel');
   if(on(e.randomAnimation?.enabled)&&(!Array.isArray(permutation)||permutation.length!==512||permutation.some(n=>!Number.isInteger(n)||n<0||n>255)))throw Error('Missing native noise permutation');
  }
 }
}
export class ArtworkAnimation {
 constructor(material){this.material=material;this.integrals=new Map();validateAnimation(material.animation,material.noisePermutation);}
 sample(time){
  const values={...this.material.values};if(!this.material.animation)return values;
  for(const a of rows(this.material.animation.animations)){
   const baseline=values[a.materialPropertyName];if(!baseline)continue;const out=[...baseline];while(out.length<4)out.push(0);const elements=rows(a.animationElement);
   if(a.propertyType===2&&(!elements.length||!on(elements[0].colorAnimation?.enabled)))continue;
   for(const e of elements){const ch=e.element;
    if(!on(e.incrementingValue))out[ch]=elementValue(e,out[ch],time,this.material.noisePermutation);
    else if(!on(e.animationCurve?.enabled)&&!on(e.randomAnimation?.enabled))out[ch]=f(time*e.incrementingSpeed);
    else{
     // Cache completed 60 Hz integration steps so playback does not redo the
     // whole timeline on every frame. Partial steps never alter that cache.
     let acc=this.integrals.get(e);if(!acc||time<acc.step/60)acc={step:0,value:0};
     const target=Math.floor(time*60),speed=t=>f(elementValue(e,out[ch],t,this.material.noisePermutation)+e.incrementingSpeed);
     while(acc.step<target){const from=acc.step/60,to=++acc.step/60;acc.value=f(acc.value+f((to-from)*speed(to)));}
     this.integrals.set(e,acc);out[ch]=f(acc.value+f((time-acc.step/60)*speed(time)));
    }
   }
   values[a.materialPropertyName]=a.propertyType===2?gradientValue(elements[0].colorAnimation.gradient,out[0]):out;
  }return values;
 }
}
