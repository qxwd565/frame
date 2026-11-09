// Unity stores binding metadata beside the stripped DXBC. Rebuild only the
// compiler reflection chunk; retain every original instruction/signature byte.
export function withReflection(dxbc, layout, stage) {
  const chunks=[];
  for(let i=0;i<dxbc.readUInt32LE(28);i++){
    const p=dxbc.readUInt32LE(32+i*4),n=dxbc.readUInt32LE(p+4);
    chunks.push(dxbc.subarray(p,p+8+n));
  }
  if(chunks.some(c=>c.toString('ascii',0,4)==='RDEF'))return dxbc;
  const instructions=chunks.find(c=>['SHDR','SHEX'].includes(c.toString('ascii',0,4))).subarray(8);
  const declaredBuffers=[],textures=[],samplers=[];
  for(let p=8;p<instructions.length;){
    const token=instructions.readUInt32LE(p),op=token&2047,len=op===53?instructions.readUInt32LE(p+4):(token>>>24)&127;
    if(!len||p+len*4>instructions.length)throw Error('Invalid instruction length');
    if(op===53){p+=len*4;continue;}
    let operand=p+4,t=token;while(t>>>31){t=instructions.readUInt32LE(operand);operand+=4;}
    if(op===89)declaredBuffers.push({slot:instructions.readUInt32LE(operand+4),size:instructions.readUInt32LE(operand+8)*16});
    if(op===88)textures.push({slot:instructions.readUInt32LE(operand+4),dimension:({1:1,2:2,3:4,4:6,5:8,6:9,7:3,8:5,9:7,10:10,11:11})[(token>>>11)&31],returnType:instructions.readUInt32LE(p+len*4-4)&15});
    if(op===90)samplers.push({slot:instructions.readUInt32LE(operand+4)});
    p+=len*4;
  }
  for(const cb of declaredBuffers){const binding=layout.binding.find(b=>b.slot===cb.slot);const buffer=layout.buffers.find(b=>b.name===binding?.name);if(!buffer||buffer.size<cb.size)throw Error('Missing Unity constant-buffer layout '+stage+':'+cb.slot);}
  const prefix=stage==='vertex'?'v':'f',buf=Buffer.alloc(1024*1024);let top=28;
  const reserve=n=>{const p=top;top+=n;return p;};
  const string=s=>{const b=Buffer.from(s+'\0');const p=reserve((b.length+3)&~3);b.copy(buf,p);return p;};
  const words=(p,values)=>values.forEach((v,i)=>buf.writeUInt32LE(v>>>0,p+i*4));
  const cbStart=reserve(declaredBuffers.length*24),resCount=declaredBuffers.length+textures.length+samplers.length,resStart=reserve(resCount*32);
  words(0,[declaredBuffers.length,cbStart,resCount,resStart,instructions.readUInt32LE(0),0,0]);
  let r=0;
  for(let i=0;i<declaredBuffers.length;i++){
    const cb=declaredBuffers[i],name=string(prefix+'_buffer'+cb.slot),variable=reserve(24),type=reserve(16),varName=string(prefix+'_cb'+cb.slot);
    words(cbStart+i*24,[name,1,variable,cb.size,0,0]);
    words(variable,[varName,0,cb.size,2,type,0]);
    [1,3,1,4,cb.size/16,0].forEach((v,k)=>buf.writeUInt16LE(v,type+k*2));
    words(resStart+r++*32,[name,0,0,0,0,cb.slot,1,0]);
  }
  for(const tex of textures){if(!tex.dimension)throw Error('Unsupported resource dimension');words(resStart+r++*32,[string(prefix+'_t'+tex.slot),2,tex.returnType,tex.dimension,0xffffffff,tex.slot,1,0]);}
  for(const sampler of samplers)words(resStart+r++*32,[string(prefix+'_s'+sampler.slot),3,0,0,0,sampler.slot,1,0]);
  const rdef=Buffer.alloc(8+top);rdef.write('RDEF');rdef.writeUInt32LE(top,4);buf.copy(rdef,8,0,top);chunks.push(rdef);
  const header=Buffer.alloc(32+chunks.length*4);dxbc.copy(header,0,0,24);header.fill(0,4,20);header.writeUInt32LE(chunks.length,28);let total=header.length;
  chunks.forEach((chunk,i)=>{header.writeUInt32LE(total,32+i*4);total+=chunk.length;});header.writeUInt32LE(total,24);
  return Buffer.concat([header,...chunks]);
}
