import {resourceURL,resourceFetch} from './resource-url.mjs?ver=hscard-b9ff08d18e1850c3';

// The history-view hero-power prefab has a separate premium frame and
// portrait mesh. Its artwork remains supplied by the selected card.
const FIT={kind:'HERO_POWER',golden:true,legendary:false,width:436,height:555,
  sourceProjection:[0.7474223485268967,0,0,0,0,0.5871642233472558,0,0,0,0,0.01,0,0.005280088758540247,-0.019914289413340613,0,1],
  sourceView:[1,0,0,0,0,0,-1,0,0,1,0,0,0,0,15,1]};
const BLANK={width:1,height:1,format:28,levels:[new Uint8Array([255,255,255,255])]};
const ART_SAMPLER={filter:1,wrapU:0,wrapV:0,wrapW:1,anisotropy:1,bias:0};

function portraitGeometry(data){
  const mesh=data.portrait,attributes=new Map();
  for(const [name,values] of [['POSITION0',mesh.vertices],['NORMAL0',mesh.normals],['TANGENT0',mesh.tangents],['TEXCOORD0',mesh.uv],['TEXCOORD1',mesh.uv2]]){
    if(!values)continue;
    const out=new Float32Array(values.length*4);
    values.forEach((row,i)=>{for(let j=0;j<row.length&&j<4;j++)out[i*4+j]=row[j];if(name==='POSITION0')out[i*4+3]=1;});
    attributes.set(name,out);
  }
  return {attributes,indices:new Uint32Array(mesh.indices)};
}

function heroPowerGeometry(mesh,slot){
  return portraitGeometry({portrait:{...mesh,indices:mesh.triangles[slot].flat()}});
}

// The normal history prefab uses a three-submesh HeroPowerV2, in addition to
// its mana gem and history frame. Keep its original per-submesh materials.
export class CurrentHeroPower {
  static async load(sources){
    const response=await resourceFetch(resourceURL('current-hero-power.json'));
    if(!response.ok)throw Error('Current hero-power resource HTTP '+response.status);
    const data=await response.json(),normal=data.normal;
    if(data.schema!==1||data.sourceBuild!=='6000.3.11.3145967'||!normal||!Array.isArray(normal.assets)||normal.nodes?.length!==2||normal.mesh?.triangles?.length!==3||normal.meshPose?.length!==16)throw Error('Invalid current normal hero-power resource');
    return new CurrentHeroPower(sources,normal);
  }
  constructor(sources,data){
    this.sources=sources;this.data=data;
    for(const asset of data.assets){const key=asset.key.toLowerCase();if(!sources.assets.has(key))sources.assets.set(key,asset);}
    this.meshes=[0,1,2].map(slot=>heroPowerGeometry(data.mesh,slot));
  }
  async compose(card,composer){
    const parts=this.data.nodes.map(node=>{
      const key=node.materials[0],material=this.sources.material(key);
      material.values._LightingBlend=[0];
      return {path:node.path,slot:0,mesh:{key:node.mesh,slot:0},pose:node.pose,material,queue:composer.queue(key,material.shader),blank:false};
    });
    for(const slot of [0,1,2]){
      const key=this.data.meshMaterials[slot];
      const material=slot===1?{shader:'Custom/Card/Unlit_Portrait',keywords:[],values:{_BlendIntensity:[2],_LightingBlend:[0],_Color:[1,1,1,1],_SecondTint:[0.5,0.5,0.5,0.3960784375667572]},textures:{
        _MainTex:{pixels:card.artPixels||BLANK,sampler:card.artPixels?.originalSampler||ART_SAMPLER,st:[1,1,0,0]},
        _SecondTex:composer.texture('CAB-cfdc5301ac0b17c5a76ad477fba38b57:-7921515223053421486')
      }}:this.sources.material(key);
      material.values._LightingBlend=[0];
      parts.push({path:'History_HeroPower/RootObject/Mesh',slot,mesh:this.meshes[slot],pose:this.data.meshPose,material,queue:composer.queue(slot===1?null:key,material.shader),blank:slot===1});
    }
    parts.sort((a,b)=>a.queue-b.queue||(a.queue<2500?b.pose[13]-a.pose[13]:a.pose[13]-b.pose[13]));
    return {fit:{...FIT,golden:false},parts,exactAlpha:true};
  }
}

export class CurrentGoldenHeroPower {
  static async load(sources){
    const response=await resourceFetch(resourceURL('current-hero-power.json'));
    if(!response.ok)throw Error('Current hero-power resource HTTP '+response.status);
    const data=await response.json();
    if(data.schema!==1||data.sourceBuild!=='6000.3.11.3145967'||!Array.isArray(data.assets)||!Array.isArray(data.nodes)||data.nodes.length!==2||!data.portrait||!Array.isArray(data.portrait.vertices)||!Array.isArray(data.portrait.indices)||!Array.isArray(data.portraitPose)||data.portraitPose.length!==16)throw Error('Invalid current hero-power resource');
    return new CurrentGoldenHeroPower(sources,data);
  }
  constructor(sources,data){
    this.sources=sources;this.data=data;
    for(const asset of data.assets){const key=asset.key.toLowerCase();if(!sources.assets.has(key))sources.assets.set(key,asset);}
    this.portrait=portraitGeometry(data);
  }
  async compose(card,composer){
    const parts=this.data.nodes.map(node=>{
      const key=node.materials[0],material=this.sources.material(key);
      material.values._LightingBlend=[0];
      return {path:node.path,slot:0,mesh:{key:node.mesh,slot:0},pose:node.pose,material,queue:composer.queue(key,material.shader),blank:false};
    });
    const classKey='CAB-cfdc5301ac0b17c5a76ad477fba38b57:-7921515223053421486';
    const original={shader:'Custom/Card/Unlit_Portrait',keywords:[],values:{_BlendIntensity:[2],_EmissionLM:[0],_LightingBlend:[0],_Shininess:[0.4475279748439789],_Color:[1,1,1,1],_SecondTint:[0.5,0.5,0.5,0.3960784375667572],_SpecColor:[0.07058823853731155,0.07058823853731155,0.07058823853731155,1]},textures:{
      _MainTex:{pixels:card.artPixels||BLANK,sampler:card.artPixels?.originalSampler||ART_SAMPLER,st:[1,1,0,0]},
      _SecondTex:composer.texture(classKey)
    }};
    const material=card.goldenPortrait?{...card.goldenPortrait,values:{...card.goldenPortrait.values},textures:{...card.goldenPortrait.textures}}:original;
    parts.push({path:'History_HeroPower_Premium/RootObject/Mesh',slot:0,mesh:this.portrait,pose:this.data.portraitPose,material,queue:composer.queue(null,material.shader),blank:true});
    parts.sort((a,b)=>a.queue-b.queue||(a.queue<2500?b.pose[13]-a.pose[13]:a.pose[13]-b.pose[13]));
    return {fit:FIT,parts,exactAlpha:true};
  }
}
