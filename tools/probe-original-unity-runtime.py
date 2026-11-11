"""Probe a privately launched 3664 Unity player without modifying its files.

Loads a small managed probe from memory through the player's own Mono runtime.
The test only reads Application.unityVersion, then terminates the player that
it started. It does not attach to an existing Hearthstone process.
"""
import ctypes as c
from ctypes import wintypes as w
import pathlib
import struct
import subprocess
import sys
import math
import time

BASE=pathlib.Path(r'E:\HSPlus\development\.codex-work\beta-extracted-20261101\1.0.0.3664')
EXE=BASE/'Hearthstone.exe'
MONO=BASE/'Hearthstone_Data/Mono/mono.dll'
CECIL=r'E:\HSPlus\development\tools\cecil\Mono.Cecil.dll'
UNITY=str(BASE/'Hearthstone_Data/Managed/UnityEngine.dll')
script=r"""
$ErrorActionPreference='Stop'
$dir=Split-Path (Get-Command pwsh).Source
Add-Type -Path (Join-Path $dir 'Microsoft.CodeAnalysis.dll')
Add-Type -Path (Join-Path $dir 'Microsoft.CodeAnalysis.CSharp.dll')
Add-Type -Path 'E:\HSPlus\development\tools\cecil\Mono.Cecil.dll'
$src=[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('__SOURCE__'))
$tree=[Microsoft.CodeAnalysis.CSharp.CSharpSyntaxTree]::ParseText($src)
$base='__MANAGED__'
$unity=[Mono.Cecil.AssemblyDefinition]::ReadAssembly((Join-Path $base 'UnityEngine.dll'))
$ref=$unity.MainModule.AssemblyReferences | Where-Object Name -EQ 'mscorlib'
$ref.Version=[Version]'2.0.5.0';$ref.PublicKeyToken=[byte[]](0x7c,0xec,0x85,0xd7,0xbe,0xa7,0x79,0x8e)
$unityStream=[IO.MemoryStream]::new();$unity.Write($unityStream);$unityStream.Position=0
$refs=[Microsoft.CodeAnalysis.MetadataReference[]]@([Microsoft.CodeAnalysis.MetadataReference]::CreateFromFile((Join-Path $base 'mscorlib.dll')),[Microsoft.CodeAnalysis.MetadataReference]::CreateFromFile((Join-Path $base 'System.dll')),[Microsoft.CodeAnalysis.MetadataReference]::CreateFromStream($unityStream))
$options=[Microsoft.CodeAnalysis.CSharp.CSharpCompilationOptions]::new([Microsoft.CodeAnalysis.OutputKind]::DynamicallyLinkedLibrary)
$comp=[Microsoft.CodeAnalysis.CSharp.CSharpCompilation]::Create('HSRuntimeProbe',[Microsoft.CodeAnalysis.SyntaxTree[]]@($tree),$refs,$options)
$stream=[IO.MemoryStream]::new();$result=$comp.Emit($stream)
if(!$result.Success){throw (($result.Diagnostics | ForEach-Object ToString) -join "`n")}
[Console]::Out.Write([Convert]::ToBase64String($stream.ToArray()));$stream.Dispose();$unityStream.Dispose();$unity.Dispose()
"""

def exports(path):
    data=path.read_bytes()
    u16=lambda n:struct.unpack_from('<H',data,n)[0]
    u32=lambda n:struct.unpack_from('<I',data,n)[0]
    pe=u32(60);opt=pe+24;count=u16(pe+6);sections=opt+u16(pe+20)
    table=[(u32(sections+i*40+12),max(u32(sections+i*40+8),u32(sections+i*40+16)),u32(sections+i*40+20)) for i in range(count)]
    def offset(rva):
        for va,size,raw in table:
            if va<=rva<va+size:return raw+rva-va
        raise ValueError('Invalid Mono export address')
    directory=offset(u32(opt+96));names=offset(u32(directory+32));ordinals=offset(u32(directory+36));functions=offset(u32(directory+28))
    result={}
    for i in range(u32(directory+24)):
        start=offset(u32(names+4*i));name=data[start:data.index(0,start)].decode('ascii')
        if name.startswith('mono_'):result[name]=u32(functions+4*u16(ordinals+2*i))
    return result

class Module(c.Structure):
    _fields_=[('size',w.DWORD),('moduleId',w.DWORD),('processId',w.DWORD),('globalUsage',w.DWORD),('processUsage',w.DWORD),('baseAddress',c.c_void_p),('baseSize',w.DWORD),('moduleHandle',w.HMODULE),('name',w.WCHAR*256),('path',w.WCHAR*260)]

def main():
    import base64
    time_argument=next((x.split('=',1)[1] for x in sys.argv if x.startswith('--time=')), '0.05')
    capture_time=float(time_argument)
    if not math.isfinite(capture_time) or capture_time<=0 or capture_time>0.4:raise ValueError('Capture time must be in (0, 0.4]')
    time_label=format(capture_time,'.2f')
    background=next((x.split('=',1)[1].upper() for x in sys.argv if x.startswith('--background=')), '000000')
    if len(background)!=6 or any(c not in '0123456789ABCDEF' for c in background):raise ValueError('Invalid capture background')
    background_label='' if background=='000000' else ' - 배경 '+background
    # PowerShell executes the supplied source directly; the generated assembly
    # exists only in memory and is transferred to the launched process.
    if '--record-timeline' in sys.argv:
        source='''using UnityEngine;using System;using System.IO;using System.Threading; namespace HSRuntimeProbe {public class Tick:MonoBehaviour {public static ManualResetEvent done=new ManualResetEvent(false);public static string value;void Update(){try{var bundle=AssetBundle.CreateFromFile(@"'''+str(BASE/'Data/actors.unity3d')+'''");var template=bundle.Load("final/data/actors/card_hand_ally_spelltable.unity3d") as GameObject;var clone=(GameObject)UnityEngine.Object.Instantiate(template);clone.SetActive(true);var summon=clone.transform.Find("SummonIn");summon.gameObject.SetActive(true);var container=summon.Find("GameObjectContainer");container.gameObject.SetActive(true);var child=container.Find("FX_BlueRays");child.parent=null;clone.SetActive(false);child.gameObject.SetActive(true);var ps=child.GetComponent<ParticleSystem>();var particles=new ParticleSystem.Particle[1000];var stream=new MemoryStream();var writer=new BinaryWriter(stream);writer.Write(0x31535048);writer.Write(211);writer.Write(123456);for(int frame=0;frame<211;frame++){float t=frame/60f;ps.randomSeed=123456;ps.Simulate(t,true,true);int count=ps.GetParticles(particles);writer.Write(t);writer.Write(count);for(int i=0;i<count;i++){var p=particles[i];var pos=p.position;var vel=p.velocity;var color=p.color;writer.Write(p.randomSeed);writer.Write(pos.x);writer.Write(pos.y);writer.Write(pos.z);writer.Write(vel.x);writer.Write(vel.y);writer.Write(vel.z);writer.Write(p.size);writer.Write(p.rotation);writer.Write(p.lifetime);writer.Write(p.startLifetime);writer.Write(color.r);writer.Write(color.g);writer.Write(color.b);writer.Write(color.a);}}writer.Flush();value="TIMELINE:"+Convert.ToBase64String(stream.ToArray());}catch(Exception e){value="exception: "+e.ToString();}done.Set();enabled=false;}}public static class Entry {public static string Run(){var go=new GameObject("HS runtime probe");go.AddComponent<Tick>();if(!Tick.done.WaitOne(20000))return "main thread callback timeout";return Tick.value;}}}'''
        source=source.replace('writer.Write(211);','writer.Write(241);').replace('frame<211;','frame<241;')
    elif any(x in sys.argv for x in ('--d3d-clear','--unity-frame','--unity-colors','--unity-alpha','--record-rendered')):
        source='''using UnityEngine;using System;using System.Runtime.InteropServices; namespace HSRuntimeProbe {
public static class Native {
 [StructLayout(LayoutKind.Sequential)] public struct Desc{public uint width,height,mips,array,format,samples,quality,usage,bind,cpu,misc;}
 [StructLayout(LayoutKind.Sequential)] public struct Mapped{public IntPtr data;public uint pitch,depth;}
 [UnmanagedFunctionPointer(CallingConvention.StdCall)] public delegate void GetDevice(IntPtr self,out IntPtr device);
 [UnmanagedFunctionPointer(CallingConvention.StdCall)] public delegate void GetDesc(IntPtr self,out Desc desc);
 [UnmanagedFunctionPointer(CallingConvention.StdCall)] public delegate void GetContext(IntPtr self,out IntPtr context);
 [UnmanagedFunctionPointer(CallingConvention.StdCall)] public delegate int CreateTexture(IntPtr self,ref Desc desc,IntPtr initial,out IntPtr texture);
 [UnmanagedFunctionPointer(CallingConvention.StdCall)] public delegate void Copy(IntPtr self,IntPtr dst,IntPtr src);
 [UnmanagedFunctionPointer(CallingConvention.StdCall)] public delegate int Map(IntPtr self,IntPtr resource,uint sub,uint mode,uint flags,out Mapped mapped);
 [UnmanagedFunctionPointer(CallingConvention.StdCall)] public delegate void Unmap(IntPtr self,IntPtr resource,uint sub);
 public static T Method<T>(IntPtr obj,int index) where T:class {IntPtr v=Marshal.ReadIntPtr(obj);IntPtr f=Marshal.ReadIntPtr(v,index*IntPtr.Size);return Marshal.GetDelegateForFunctionPointer(f,typeof(T)) as T;}
 public static string Read(RenderTexture target){IntPtr texture=target.GetNativeTexturePtr(),device=IntPtr.Zero,context=IntPtr.Zero,staging=IntPtr.Zero;Desc desc;Method<GetDesc>(texture,10)(texture,out desc);Method<GetDevice>(texture,3)(texture,out device);Method<GetContext>(device,40)(device,out context);desc.usage=3;desc.bind=0;desc.cpu=0x20000;desc.misc=0;int hr=Method<CreateTexture>(device,5)(device,ref desc,IntPtr.Zero,out staging);if(hr!=0)return "create hr="+hr+" format="+desc.format;Method<Copy>(context,47)(context,staging,texture);Mapped map;hr=Method<Map>(context,14)(context,staging,0,1,0,out map);if(hr!=0)return "map hr="+hr;byte[] row=new byte[desc.width*4];int match=0,other=0;for(int y=0;y<desc.height;y++){Marshal.Copy(new IntPtr(unchecked(map.data.ToInt32()+(int)(y*map.pitch))),row,0,row.Length);for(int x=0;x<row.Length;x+=4){if(row[x]==255&&row[x+1]==0&&row[x+2]==255&&row[x+3]==255)match++;else other++;}}Method<Unmap>(context,15)(context,staging,0);Marshal.Release(staging);Marshal.Release(context);Marshal.Release(device);return "format="+desc.format+" match="+match+" other="+other;}
}
public class Tick:MonoBehaviour {public static System.Threading.ManualResetEvent done=new System.Threading.ManualResetEvent(false);public static string value;int step;RenderTexture target;void Update(){try{if(step++==0){var go=new GameObject("HS clear test");var camera=go.AddComponent<Camera>();camera.enabled=false;camera.cullingMask=0;camera.clearFlags=CameraClearFlags.SolidColor;camera.backgroundColor=new Color(1,0,1,1);target=new RenderTexture(64,64,24,RenderTextureFormat.ARGB32);target.Create();camera.targetTexture=target;camera.Render();return;}value=Native.Read(target);}catch(Exception e){value="exception: "+e.ToString();}done.Set();enabled=false;}}
public static class Entry{public static string Run(){var go=new GameObject("HS runtime probe");go.AddComponent<Tick>();if(!Tick.done.WaitOne(10000))return "main thread callback timeout";return Tick.value;}} }'''
        if '--record-rendered' in sys.argv:
            read=''' public static byte[] ReadBytes(RenderTexture target){IntPtr texture=target.GetNativeTexturePtr(),device=IntPtr.Zero,context=IntPtr.Zero,staging=IntPtr.Zero;Desc desc;Method<GetDesc>(texture,10)(texture,out desc);Method<GetDevice>(texture,3)(texture,out device);Method<GetContext>(device,40)(device,out context);desc.usage=3;desc.bind=0;desc.cpu=0x20000;desc.misc=0;int hr=Method<CreateTexture>(device,5)(device,ref desc,IntPtr.Zero,out staging);if(hr!=0)throw new Exception("D3D staging create "+hr);Method<Copy>(context,47)(context,staging,texture);Mapped map;hr=Method<Map>(context,14)(context,staging,0,1,0,out map);if(hr!=0)throw new Exception("D3D staging map "+hr);byte[] all=new byte[desc.width*desc.height*4];for(int y=0;y<desc.height;y++)Marshal.Copy(new IntPtr(unchecked(map.data.ToInt32()+(int)(y*map.pitch))),all,(int)(y*desc.width*4),(int)desc.width*4);Method<Unmap>(context,15)(context,staging,0);Marshal.Release(staging);Marshal.Release(context);Marshal.Release(device);return all;}
'''
            start=source.index(' public static string Read(');end=source.index('\n}\npublic class Tick',start);source=source[:start]+read+source[end:]
            tick='''public class Tick:MonoBehaviour {public static System.Threading.ManualResetEvent done=new System.Threading.ManualResetEvent(false);public static string value;void Update(){try{var b=AssetBundle.CreateFromFile(@"'''+str(BASE/'Data/actors.unity3d')+'''");var template=b.Load("final/data/actors/card_hand_ally_spelltable.unity3d") as GameObject;var clone=(GameObject)UnityEngine.Object.Instantiate(template);clone.SetActive(true);var summon=clone.transform.Find("SummonIn");summon.gameObject.SetActive(true);var container=summon.Find("GameObjectContainer");container.gameObject.SetActive(true);var child=container.Find("FX_BlueRays");child.parent=null;clone.SetActive(false);child.gameObject.layer=30;child.gameObject.SetActive(true);var ps=child.GetComponent<ParticleSystem>();var obj=new GameObject("HS D3D capture camera");var cam=obj.AddComponent<Camera>();cam.enabled=false;cam.orthographic=true;cam.cullingMask=1<<30;cam.clearFlags=CameraClearFlags.SolidColor;cam.backgroundColor=Color.black;var view=new Matrix4x4();view.m00=1;view.m12=1;view.m21=-1;view.m23=15;view.m33=1;cam.worldToCameraMatrix=view;var proj=new Matrix4x4();proj.m00=0.799348533f;proj.m11=0.799348533f*436f/682f;proj.m22=0.01f;proj.m33=1;cam.projectionMatrix=proj;var target=new RenderTexture(436,682,24,RenderTextureFormat.ARGB32);target.Create();cam.targetTexture=target;var archive=new System.IO.MemoryStream();var writer=new System.IO.BinaryWriter(archive);writer.Write(0x31465248);writer.Write(436);writer.Write(682);writer.Write(60);writer.Write(241);writer.Write(123456);for(int i=0;i<241;i++){ps.randomSeed=123456;ps.Simulate(i/60f,true,true);cam.Render();byte[] pixels=Native.ReadBytes(target);var compressed=new System.IO.MemoryStream();using(var zip=new System.IO.Compression.GZipStream(compressed,System.IO.Compression.CompressionMode.Compress,true)){zip.Write(pixels,0,pixels.Length);}var data=compressed.ToArray();writer.Write(data.Length);writer.Write(data);}writer.Flush();value="FRAMES:"+Convert.ToBase64String(archive.ToArray());}catch(Exception e){value="exception: "+e.ToString();}done.Set();enabled=false;}}
'''
            start=source.index('public class Tick:MonoBehaviour');end=source.index('public static class Entry',start);source=source[:start]+tick+source[end:]
            source=source.replace('Tick.done.WaitOne(10000)','Tick.done.WaitOne(40000)')
            compression='''[DllImport("ntdll.dll")]public static extern int RtlGetCompressionWorkSpaceSize(ushort format,out uint workspace,out uint fragment);[DllImport("ntdll.dll")]public static extern int RtlCompressBuffer(ushort format,byte[] input,uint inputSize,byte[] output,uint outputSize,uint chunk,out uint final,byte[] workspace);public static byte[] Compress(byte[] input){uint size,frag;int status=RtlGetCompressionWorkSpaceSize(4,out size,out frag);if(status!=0)throw new Exception("compression workspace "+status);byte[] work=new byte[size],output=new byte[input.Length+65536];uint length;status=RtlCompressBuffer(4,input,(uint)input.Length,output,(uint)output.Length,4096,out length,work);if(status!=0)throw new Exception("compression "+status);byte[] result=new byte[length];Array.Copy(output,result,(int)length);return result;}
'''
            source=source.replace('public static class Native {','public static class Native {\n'+compression)
            old='var compressed=new System.IO.MemoryStream();using(var zip=new System.IO.Compression.GZipStream(compressed,System.IO.Compression.CompressionMode.Compress,true)){zip.Write(pixels,0,pixels.Length);}var data=compressed.ToArray();'
            if source.count(old)!=1:raise ValueError('Unexpected original frame compressor template')
            source=source.replace(old,'var data=Native.Compress(pixels);')
        if '--d3d-same-frame' in sys.argv:
            source=source.replace('camera.Render();return;}value=Native.Read(target);','camera.Render();value=Native.Read(target);done.Set();enabled=false;return;}value=Native.Read(target);')
        if any(x in sys.argv for x in ('--unity-frame','--unity-colors','--unity-alpha')):
            read=''' public static string Read(RenderTexture target){IntPtr texture=target.GetNativeTexturePtr(),device=IntPtr.Zero,context=IntPtr.Zero,staging=IntPtr.Zero;Desc desc;Method<GetDesc>(texture,10)(texture,out desc);Method<GetDevice>(texture,3)(texture,out device);Method<GetContext>(device,40)(device,out context);desc.usage=3;desc.bind=0;desc.cpu=0x20000;desc.misc=0;int hr=Method<CreateTexture>(device,5)(device,ref desc,IntPtr.Zero,out staging);if(hr!=0)return "create hr="+hr;Method<Copy>(context,47)(context,staging,texture);Mapped map;hr=Method<Map>(context,14)(context,staging,0,1,0,out map);if(hr!=0)return "map hr="+hr;byte[] all=new byte[desc.width*desc.height*4];for(int y=0;y<desc.height;y++)Marshal.Copy(new IntPtr(unchecked(map.data.ToInt32()+(int)(y*map.pitch))),all,(int)(y*desc.width*4),(int)desc.width*4);Method<Unmap>(context,15)(context,staging,0);Marshal.Release(staging);Marshal.Release(context);Marshal.Release(device);return "RAW:"+Convert.ToBase64String(all);}
'''
            start=source.index(' public static string Read(');end=source.index('\n}\npublic class Tick',start)
            source=source[:start]+read+source[end:]
            tick='''public class Tick:MonoBehaviour {public static System.Threading.ManualResetEvent done=new System.Threading.ManualResetEvent(false);public static string value;int step;RenderTexture target;void Update(){try{if(step++==0){var b=AssetBundle.CreateFromFile(@"'''+str(BASE/'Data/actors.unity3d')+'''");var template=b.Load("final/data/actors/card_hand_ally_spelltable.unity3d") as GameObject;var clone=(GameObject)Object.Instantiate(template);clone.SetActive(true);var summon=clone.transform.Find("SummonIn");summon.gameObject.SetActive(true);var container=summon.Find("GameObjectContainer");container.gameObject.SetActive(true);var child=container.Find("FX_BlueRays");child.parent=null;clone.SetActive(false);child.gameObject.layer=30;child.gameObject.SetActive(true);var ps=child.GetComponent<ParticleSystem>();ps.randomSeed=123456;ps.Simulate(0.05f,true,true);if(ps.particleCount!=200)throw new Exception("unexpected particle count "+ps.particleCount);var obj=new GameObject("HS D3D capture camera");var cam=obj.AddComponent<Camera>();cam.enabled=false;cam.cullingMask=1<<30;cam.clearFlags=CameraClearFlags.SolidColor;cam.backgroundColor=Color.black;var view=new Matrix4x4();view.m00=1;view.m12=1;view.m21=-1;view.m23=15;view.m33=1;cam.worldToCameraMatrix=view;var proj=new Matrix4x4();proj.m00=0.799348533f;proj.m11=0.799348533f*436f/682f;proj.m22=0.01f;proj.m33=1;cam.projectionMatrix=proj;target=new RenderTexture(436,682,24,RenderTextureFormat.ARGB32);target.Create();cam.targetTexture=target;cam.Render();return;}value=Native.Read(target);}catch(Exception e){value="exception: "+e.ToString();}done.Set();enabled=false;}}
'''
            start=source.index('public class Tick:MonoBehaviour');end=source.index('public static class Entry',start)
            source=source[:start]+tick+source[end:]
            source=source.replace('(GameObject)Object.Instantiate(template)','(GameObject)UnityEngine.Object.Instantiate(template)')
            source=source.replace('cam.enabled=false;cam.cullingMask=1<<30;', 'cam.enabled=false;cam.orthographic=true;cam.cullingMask=1<<30;')
            if background!='000000':
                r,g,b=(int(background[i:i+2],16) for i in (0,2,4))
                source=source.replace('cam.backgroundColor=Color.black;','cam.backgroundColor=new Color('+str(r)+'f/255f,'+str(g)+'f/255f,'+str(b)+'f/255f,1f);')
            source=source.replace('int step;RenderTexture target;void Update()', 'int step;RenderTexture target;public static byte[] particleState;void Update()')
            marker='if(ps.particleCount!=200)throw new Exception("unexpected particle count "+ps.particleCount);'
            state='''var observed=new ParticleSystem.Particle[1000];int count=ps.GetParticles(observed);var stream=new System.IO.MemoryStream();var writer=new System.IO.BinaryWriter(stream);writer.Write(count);for(int i=0;i<count;i++){var p=observed[i];var pos=p.position;var vel=p.velocity;var color=p.color;writer.Write(p.randomSeed);writer.Write(pos.x);writer.Write(pos.y);writer.Write(pos.z);writer.Write(vel.x);writer.Write(vel.y);writer.Write(vel.z);writer.Write(p.size);writer.Write(p.rotation);writer.Write(p.lifetime);writer.Write(p.startLifetime);writer.Write(color.r);writer.Write(color.g);writer.Write(color.b);writer.Write(color.a);}writer.Flush();particleState=stream.ToArray();'''
            if source.count(marker)!=1:raise ValueError('Unexpected original particle capture template')
            source=source.replace(marker,marker+state)
            if '--unity-colors' in sys.argv or '--unity-alpha' in sys.argv:
                grid='''var white=new Texture2D(2,2,TextureFormat.RGBA32,false);white.SetPixels32(new Color32[]{new Color32(255,255,255,255),new Color32(255,255,255,255),new Color32(255,255,255,255),new Color32(255,255,255,255)});white.Apply();var renderer=child.GetComponent<ParticleSystemRenderer>();renderer.material.SetTexture("_MainTex",white);renderer.material.SetColor("_TintColor",new Color(.5f,.5f,.5f,1f));for(int i=0;i<count;i++){var p=observed[i];p.position=new Vector3(-1f+(i%20)*.1f,0,-.9f+(i/20)*.1f);p.size=.08f;p.rotation=0;observed[i]=p;}ps.SetParticles(observed,count);'''
                if '--unity-alpha' in sys.argv:grid=grid.replace('new Color(.5f,.5f,.5f,1f)','new Color(.5f,.5f,1f,.5f)')
                source=source.replace('particleState=stream.ToArray();','particleState=stream.ToArray();'+grid)
            source=source.replace('return "RAW:"+Convert.ToBase64String(all);','return "RAW:"+Convert.ToBase64String(all)+":STATE:"+Convert.ToBase64String(Tick.particleState);')
            source=source.replace('ps.Simulate(0.05f,true,true);','ps.Simulate('+format(capture_time,'.9g')+'f,true,true);')
    elif '--texture-clear' in sys.argv:
        source='''using UnityEngine; namespace HSRuntimeProbe { public class Tick:MonoBehaviour { public static System.Threading.ManualResetEvent done=new System.Threading.ManualResetEvent(false); public static string value; void Update(){try{var tex=new Texture2D(64,64,TextureFormat.RGBA32,false);var colors=new Color32[4096];for(int i=0;i<colors.Length;i++)colors[i]=new Color32(255,0,255,255);tex.SetPixels32(colors);tex.Apply();var read=tex.GetPixels32();int exact=0;foreach(var p in read)if(p.r==255&&p.g==0&&p.b==255&&p.a==255)exact++;value="exact="+exact+" pixels="+read.Length;}catch(System.Exception e){value="exception: "+e.ToString();}done.Set();enabled=false;} } public static class Entry {public static string Run(){var go=new GameObject("HS runtime probe");go.AddComponent<Tick>();if(!Tick.done.WaitOne(10000))return "main thread callback timeout";return Tick.value;}} }'''
    elif '--graphics-clear' in sys.argv:
        source='''using UnityEngine; namespace HSRuntimeProbe { public class Tick:MonoBehaviour { public static System.Threading.ManualResetEvent done=new System.Threading.ManualResetEvent(false); public static string value;int step;RenderTexture target;bool created; void Update(){try{if(step++==0){var go=new GameObject("HS clear test");var camera=go.AddComponent<Camera>();camera.enabled=false;camera.cullingMask=0;camera.clearFlags=CameraClearFlags.SolidColor;camera.backgroundColor=new Color(1,0,1,1);target=new RenderTexture(64,64,24,RenderTextureFormat.ARGB32);created=target.Create();camera.targetTexture=target;camera.Render();return;}RenderTexture.active=target;var tex=new Texture2D(64,64,TextureFormat.RGBA32,false);tex.ReadPixels(new Rect(0,0,64,64),0,0);tex.Apply();var pixels=tex.GetPixels32();int exact=0,empty=0;foreach(var p in pixels){if(p.r==255&&p.g==0&&p.b==255&&p.a==255)exact++;if(p.r==0&&p.g==0&&p.b==0&&p.a==0)empty++;}value="created="+created+" exact="+exact+" empty="+empty+" device="+SystemInfo.graphicsDeviceName;}catch(System.Exception e){value="exception: "+e.ToString();}done.Set();enabled=false;} } public static class Entry {public static string Run(){var go=new GameObject("HS runtime probe");go.AddComponent<Tick>();if(!Tick.done.WaitOne(10000))return "main thread callback timeout";return Tick.value;}} }'''
    elif '--main-thread' in sys.argv:
        source='''using UnityEngine;using System.Threading; namespace HSRuntimeProbe { public class Tick:MonoBehaviour { public static ManualResetEvent done=new ManualResetEvent(false); public static int callbackThread; void Update(){callbackThread=Thread.CurrentThread.ManagedThreadId;done.Set();enabled=false;} } public static class Entry { public static string Run() { try { int worker=Thread.CurrentThread.ManagedThreadId;var go=new GameObject("HSRuntimeProbe");go.AddComponent<Tick>();if(!Tick.done.WaitOne(5000))return "update callback timeout";return "worker="+worker+" callback="+Tick.callbackThread; } catch(System.Exception e) {return "exception: "+e.ToString();} } } }'''
    elif '--capture-frame' in sys.argv:
        source='''using UnityEngine; namespace HSRuntimeProbe { public static class Entry { public static string Run() { try { var b=AssetBundle.CreateFromFile(@"'''+str(BASE/'Data/actors.unity3d')+'''"); var template=b.Load("final/data/actors/card_hand_ally_spelltable.unity3d") as GameObject; var clone=(GameObject)Object.Instantiate(template); clone.SetActive(true); var summon=clone.transform.Find("SummonIn"); summon.gameObject.SetActive(true); var container=summon.Find("GameObjectContainer"); container.gameObject.SetActive(true); var child=container.Find("FX_BlueRays"); child.parent=null; clone.SetActive(false); child.gameObject.layer=30; child.gameObject.SetActive(true); var ps=child.GetComponent<ParticleSystem>(); ps.randomSeed=123456; ps.Simulate(0.05f,true,true); var obj=new GameObject("HS runtime comparison camera"); var cam=obj.AddComponent<Camera>(); cam.enabled=false; cam.cullingMask=1<<30; cam.clearFlags=CameraClearFlags.SolidColor; cam.backgroundColor=Color.black; var view=new Matrix4x4(); view.m00=1;view.m12=1;view.m21=-1;view.m23=15;view.m33=1; cam.worldToCameraMatrix=view; var proj=new Matrix4x4();proj.m00=0.799348533f;proj.m11=0.799348533f*436f/682f;proj.m22=0.01f;proj.m33=1;cam.projectionMatrix=proj;var target=new RenderTexture(436,682,24,RenderTextureFormat.ARGB32);bool created=target.Create();cam.targetTexture=target;cam.Render();RenderTexture.active=target;var image=new Texture2D(436,682,TextureFormat.RGBA32,false);image.ReadPixels(new Rect(0,0,436,682),0,0);image.Apply();var pixels=image.GetPixels32();int nonzero=0;foreach(var p in pixels)if(p.r!=0||p.g!=0||p.b!=0||p.a!=0)nonzero++;if(nonzero==0)return "empty render: created="+created+" device="+SystemInfo.graphicsDeviceName+" particles="+ps.particleCount;return "PNG:"+System.Convert.ToBase64String(image.EncodeToPNG()); } catch(System.Exception e) {return "exception: "+e.ToString();} } } }'''
        original='namespace HSRuntimeProbe { public static class Entry { public static string Run() { try {'
        replacement='''namespace HSRuntimeProbe { public class Tick:MonoBehaviour { public static System.Threading.ManualResetEvent done=new System.Threading.ManualResetEvent(false); public static string value; void Update(){value=Entry.Capture();done.Set();enabled=false;} } public static class Entry { public static string Run(){var go=new GameObject("HS runtime probe");go.AddComponent<Tick>();if(!Tick.done.WaitOne(10000))return "main thread callback timeout";return Tick.value;} public static string Capture() { try {'''
        if source.count(original)!=1:raise ValueError('Unexpected capture assembly template')
        source=source.replace(original,replacement)
    elif '--timeline' in sys.argv:
        source='''using UnityEngine; using System.Text; using System.Globalization; namespace HSRuntimeProbe { public static class Entry { public static string Run() { try { var b=AssetBundle.CreateFromFile(@"'''+str(BASE/'Data/actors.unity3d')+'''"); var template=b.Load("final/data/actors/card_hand_ally_spelltable.unity3d") as GameObject; var clone=(GameObject)Object.Instantiate(template); clone.SetActive(true); var summon=clone.transform.Find("SummonIn"); summon.gameObject.SetActive(true); var container=summon.Find("GameObjectContainer"); container.gameObject.SetActive(true); var child=container.Find("FX_BlueRays"); child.gameObject.SetActive(true); var ps=child.GetComponent<ParticleSystem>(); var particles=new ParticleSystem.Particle[1000]; var sb=new StringBuilder(); foreach(float time in new float[]{0.0f,0.05f,0.2f,0.4f,0.8f,1.2f}) { ps.randomSeed=123456; ps.Simulate(time,true,true); int n=ps.GetParticles(particles); sb.Append("t=").Append(time.ToString("R",CultureInfo.InvariantCulture)).Append(" count=").Append(n); if(n>0) {var p=particles[0];var q=p.position;var v=p.velocity;sb.Append(" pos=").Append(q.x.ToString("R",CultureInfo.InvariantCulture)).Append(",").Append(q.y.ToString("R",CultureInfo.InvariantCulture)).Append(",").Append(q.z.ToString("R",CultureInfo.InvariantCulture)).Append(" vel=").Append(v.x.ToString("R",CultureInfo.InvariantCulture)).Append(",").Append(v.y.ToString("R",CultureInfo.InvariantCulture)).Append(",").Append(v.z.ToString("R",CultureInfo.InvariantCulture)).Append(" size=").Append(p.size.ToString("R",CultureInfo.InvariantCulture)).Append(" life=").Append(p.lifetime.ToString("R",CultureInfo.InvariantCulture));} sb.Append("\\n"); } return sb.ToString(); } catch(System.Exception e) {return "exception: "+e.ToString();} } } }'''
    elif '--particles' in sys.argv:
        source='''using UnityEngine; namespace HSRuntimeProbe { public static class Entry { public static string Run() { try { var b=AssetBundle.CreateFromFile(@"'''+str(BASE/'Data/actors.unity3d')+'''"); if(b==null)return "bundle is null"; var template=b.Load("final/data/actors/card_hand_ally_spelltable.unity3d") as GameObject; if(template==null)return "prefab is null"; var clone=(GameObject)Object.Instantiate(template); clone.SetActive(true); var summon=clone.transform.Find("SummonIn"); summon.gameObject.SetActive(true); var container=summon.Find("GameObjectContainer"); container.gameObject.SetActive(true); var child=container.Find("FX_BlueRays"); if(child==null)return "particle child is null"; child.gameObject.SetActive(true); var ps=child.GetComponent<ParticleSystem>(); if(ps==null)return "particle system is null"; ps.randomSeed=123456; ps.Simulate(0.05f,true,true); var particles=new ParticleSystem.Particle[1000]; int n=ps.GetParticles(particles); if(n==0)return "particles: 0, active="+ps.gameObject.activeInHierarchy+" seed="+ps.randomSeed; var p=particles[0]; return "particles: "+n+" position: "+p.position.ToString()+" velocity: "+p.velocity.ToString()+" size: "+p.size+" life: "+p.lifetime; } catch(System.Exception e) {return "exception: "+e.ToString();} } } }'''
    elif '--graphics' in sys.argv:
        source='using UnityEngine; namespace HSRuntimeProbe { public static class Entry { public static string Run() { return SystemInfo.graphicsDeviceName; } } }'
    elif '--bundle' in sys.argv:
        source='''using UnityEngine; namespace HSRuntimeProbe { public static class Entry { public static string Run() { try { var b=AssetBundle.CreateFromFile(@"'''+str(BASE/'Data/actors.unity3d')+'''"); if(b==null)return "bundle is null"; var o=b.Load("final/data/actors/card_hand_ally_spelltable.unity3d"); return o==null?"asset is null":"asset: "+o.name; } catch(System.Exception e) {return "exception: "+e.ToString();} } } }'''
    else:
        source='using UnityEngine; namespace HSRuntimeProbe { public static class Entry { public static string Run() { return Application.unityVersion; } } }'
    command=script.replace('__SOURCE__',base64.b64encode(source.encode()).decode()).replace('__MANAGED__',str(BASE/'Hearthstone_Data/Managed'))
    managed=base64.b64decode(subprocess.check_output(['pwsh','-NoProfile','-NonInteractive','-Command',command],timeout=30))
    k=c.WinDLL('kernel32',use_last_error=True)
    k.OpenProcess.argtypes=[w.DWORD,w.BOOL,w.DWORD];k.OpenProcess.restype=w.HANDLE
    k.CreateToolhelp32Snapshot.argtypes=[w.DWORD,w.DWORD];k.CreateToolhelp32Snapshot.restype=w.HANDLE
    k.Module32FirstW.argtypes=[w.HANDLE,c.POINTER(Module)];k.Module32NextW.argtypes=[w.HANDLE,c.POINTER(Module)]
    k.VirtualAllocEx.argtypes=[w.HANDLE,c.c_void_p,c.c_size_t,w.DWORD,w.DWORD];k.VirtualAllocEx.restype=c.c_void_p
    k.WriteProcessMemory.argtypes=[w.HANDLE,c.c_void_p,c.c_void_p,c.c_size_t,c.POINTER(c.c_size_t)]
    k.ReadProcessMemory.argtypes=[w.HANDLE,c.c_void_p,c.c_void_p,c.c_size_t,c.POINTER(c.c_size_t)]
    k.CreateRemoteThread.argtypes=[w.HANDLE,c.c_void_p,c.c_size_t,c.c_void_p,c.c_void_p,w.DWORD,c.c_void_p];k.CreateRemoteThread.restype=w.HANDLE
    k.WaitForSingleObject.argtypes=[w.HANDLE,w.DWORD];k.WaitForSingleObject.restype=w.DWORD
    k.CloseHandle.argtypes=[w.HANDLE]
    startup=subprocess.STARTUPINFO();startup.dwFlags|=subprocess.STARTF_USESHOWWINDOW;startup.wShowWindow=subprocess.SW_HIDE
    launch=[str(EXE),'-logFile','NUL']
    if not any(x in sys.argv for x in ('--graphics','--capture-frame','--graphics-clear','--texture-clear','--d3d-clear','--unity-frame','--unity-colors','--unity-alpha','--record-rendered')):launch.extend(['-batchmode','-nographics'])
    else:launch.extend(['-force-d3d9' if '--d3d9' in sys.argv else '-force-d3d11','-screen-width','436','-screen-height','682'])
    game=subprocess.Popen(launch,cwd=str(BASE),startupinfo=startup,creationflags=subprocess.CREATE_NO_WINDOW)
    process=thread=None
    try:
        mono_base=None
        for _ in range(120):
            if game.poll() is not None:raise RuntimeError('Original player exited: '+str(game.returncode))
            snap=k.CreateToolhelp32Snapshot(0x08|0x10,game.pid)
            if snap not in (None,c.c_void_p(-1).value):
                try:
                    entry=Module();entry.size=c.sizeof(Module);ok=k.Module32FirstW(snap,c.byref(entry))
                    while ok:
                        if entry.name.lower()=='mono.dll':mono_base=entry.baseAddress;break
                        ok=k.Module32NextW(snap,c.byref(entry))
                finally:k.CloseHandle(snap)
            if mono_base:break
            time.sleep(.25)
        if not mono_base:raise RuntimeError('Original player did not load Mono')
        # Allow Unity to initialize its root domain before querying it.
        time.sleep(3)
        process=k.OpenProcess(0x1f0fff,False,game.pid)
        if not process:raise OSError(c.get_last_error(),'Open original player')
        base=k.VirtualAllocEx(process,None,0x4000+len(managed),0x3000,0x40)
        if not base or base>0xffffffff:raise OSError(c.get_last_error(),'Allocate player probe')
        scratch=base+0x2000;blob=base+0x4000
        def write(addr,data):
            buf=c.create_string_buffer(data);written=c.c_size_t()
            if not k.WriteProcessMemory(process,addr,buf,len(data),c.byref(written)) or written.value!=len(data):raise OSError(c.get_last_error(),'Write player probe')
        def read(addr,size):
            buf=c.create_string_buffer(size);done=c.c_size_t()
            if not k.ReadProcessMemory(process,addr,buf,size,c.byref(done)) or done.value!=size:raise OSError(c.get_last_error(),'Read player probe')
            return buf.raw
        write(blob,managed);write(scratch,b'\0'*256)
        for at,value in [(32,b'HSRuntimeProbe.dll\0'),(64,b'HSRuntimeProbe\0'),(96,b'Entry\0'),(112,b'Run\0')]:write(scratch+at,value)
        exp=exports(MONO);code=bytearray(b'\x60');fixups=[]
        def push(n):code.extend(b'\x68'+struct.pack('<I',n&0xffffffff))
        def call(name,nargs):code.extend(b'\xb8'+struct.pack('<I',mono_base+exp[name])+b'\xff\xd0');code.extend(b'\x83\xc4'+bytes([nargs*4]) if nargs else b'')
        def save(offset):code.extend(b'\xa3'+struct.pack('<I',scratch+offset))
        def checked():code.extend(b'\x85\xc0\x0f\x84');fixups.append(len(code));code.extend(b'\0'*4)
        call('mono_get_root_domain',0);save(0);checked();code.extend(b'\x50');call('mono_thread_attach',1)
        for arg in [0,scratch+20,1,len(managed),blob]:push(arg)
        call('mono_image_open_from_data_full',5);save(4);checked()
        for arg in [0,scratch+20,scratch+32]:push(arg)
        code.extend(b'\x50');call('mono_assembly_load_from_full',4);save(8);checked();code.extend(b'\x50');call('mono_assembly_get_image',1);checked()
        push(scratch+96);push(scratch+64);code.extend(b'\x50');call('mono_class_from_name',3);save(12);checked()
        push(0);push(scratch+112);code.extend(b'\x50');call('mono_class_get_method_from_name',3);save(16);checked()
        push(scratch+24);push(0);push(0);code.extend(b'\x50');call('mono_runtime_invoke',4);save(28);checked()
        code.extend(b'\x50');call('mono_string_to_utf8',1);save(124)
        end=len(code);code.extend(b'\x61\x31\xc0\xc2\x04\x00')
        for at in fixups:struct.pack_into('<i',code,at,end-(at+4))
        write(base,bytes(code));thread=k.CreateRemoteThread(process,None,0,base,None,0,None)
        if not thread:raise OSError(c.get_last_error(),'Start in-memory Unity probe')
        if k.WaitForSingleObject(thread,50000)!=0:raise RuntimeError('Unity runtime probe timed out')
        status=struct.unpack('<32I',read(scratch,128));ptr=status[31]
        if status[6] or not ptr:raise RuntimeError('Unity runtime probe did not complete: '+str(status[:8]))
        chars=bytearray()
        for i in range(0,16*1024*1024,512):
            try:chunk=read(ptr+i,512)
            except OSError:
                chunk=bytearray()
                for j in range(512):
                    b=read(ptr+i+j,1);chunk.extend(b)
                    if b==b'\0':break
                chunk=bytes(chunk)
            if b'\0' in chunk:chars.extend(chunk[:chunk.index(b'\0')]);break
            chars.extend(chunk)
        else:raise RuntimeError('Unity probe string did not terminate')
        value=chars.decode('utf8')
        if value.startswith('FRAMES:'):
            import gzip,hashlib,json
            from PIL import Image
            raw=base64.b64decode(value[7:],validate=True)
            if struct.unpack_from('<6I',raw)!=(0x31465248,436,682,60,241,123456):raise ValueError('Original rendered particle sequence header')
            nt=c.WinDLL('ntdll');decompress=nt.RtlDecompressBufferEx;decompress.argtypes=[c.c_ushort,c.c_void_p,c.c_ulong,c.c_void_p,c.c_ulong,c.POINTER(c.c_ulong),c.c_void_p];decompress.restype=c.c_long
            work_size,fragment_size=c.c_ulong(),c.c_ulong();status=nt.RtlGetCompressionWorkSpaceSize(4,c.byref(work_size),c.byref(fragment_size))
            if status!=0:raise OSError(status,'Original rendered particle workspace')
            work=c.create_string_buffer(fragment_size.value)
            pos=24;first_visible=0;frame3=None;converted=bytearray(raw[:24]);destination=c.create_string_buffer(436*682*4)
            for i in range(241):
                size=struct.unpack_from('<I',raw,pos)[0];pos+=4
                packed=c.create_string_buffer(raw[pos:pos+size]);pos+=size;length=c.c_ulong()
                status=decompress(4,destination,len(destination),packed,size,c.byref(length),work)
                if status!=0 or length.value!=436*682*4:raise ValueError('Original rendered particle decompression: '+str(status))
                image=destination.raw
                if i==3:frame3=image
                if any(image[j] or image[j+1] or image[j+2] for j in range(0,len(image),4)):first_visible+=1
                compressed=gzip.compress(image,compresslevel=6,mtime=0);converted.extend(struct.pack('<I',len(compressed)));converted.extend(compressed)
            if pos!=len(raw):raise ValueError('Original rendered particle sequence length')
            original=Image.open('v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/pc-1.0.0.3664-unity-particles-0.05.png').convert('RGBA').tobytes()
            if frame3!=original:raise ValueError('Sequence frame differs from the independently captured 0.05-second original')
            output=pathlib.Path('v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/pc-1.0.0.3664-unity-rendered-particles-60fps.bin')
            data=bytes(converted)
            if output.exists() and output.read_bytes()!=data:raise ValueError('Original rendered particle sequence was not repeatable')
            if not output.exists():output.write_bytes(data)
            print(json.dumps({'renderedFrames':241,'visibleFrames':first_visible,'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest(),'path':str(output)}))
        elif value.startswith('TIMELINE:'):
            import gzip,hashlib,json
            raw=base64.b64decode(value[9:],validate=True)
            magic,frames,seed=struct.unpack_from('<III',raw)
            if (magic,frames,seed)!=(0x31535048,241,123456):raise ValueError('Invalid original Unity particle timeline')
            pos=12;reference=None;counts=[]
            for frame in range(frames):
                t,count=struct.unpack_from('<fI',raw,pos);pos+=8
                if count>1000 or abs(t-frame/60)>1e-5:raise ValueError('Invalid original Unity particle frame')
                data=raw[pos:pos+48*count];pos+=48*count;counts.append(count)
                if frame==3:reference=struct.pack('<I',count)+data
            if pos!=len(raw):raise ValueError('Original Unity particle timeline length')
            expected=pathlib.Path('v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/pc-1.0.0.3664-unity-particles-0.05.bin').read_bytes()
            if reference!=expected:raise ValueError('Timeline differs from the separately rendered original Unity frame')
            packed=gzip.compress(raw,compresslevel=9,mtime=0)
            output=pathlib.Path('v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/pc-1.0.0.3664-unity-particles-60fps.bin.gz')
            if output.exists() and gzip.decompress(output.read_bytes())!=raw:raise ValueError('Original Unity particle timeline was not repeatable')
            if not output.exists():output.write_bytes(packed)
            print(json.dumps({'timeline':str(output),'frames':frames,'seed':seed,'maxParticles':max(counts),'lastParticles':counts[-1],'rawBytes':len(raw),'gzipBytes':len(packed),'rawSha256':hashlib.sha256(raw).hexdigest()}))
        elif value.startswith('RAW:'):
            from PIL import Image
            import io
            image_data,state_data=value[4:].split(':STATE:',1)
            raw=base64.b64decode(image_data,validate=True)
            state=base64.b64decode(state_data,validate=True)
            if len(state)!=4+200*48 or struct.unpack_from('<I',state)[0]!=200:raise ValueError('Original Unity particle state size')
            if len(raw)!=436*682*4:raise ValueError('Original Unity framebuffer length')
            image=Image.frombytes('RGBA',(436,682),raw)
            state_path=pathlib.Path('v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/pc-1.0.0.3664-unity-particles-'+time_label+'.bin')
            if state_path.exists() and state_path.read_bytes()!=state:raise ValueError('Original Unity particle state was not repeatable')
            if not state_path.exists():state_path.write_bytes(state)
            if '--unity-colors' in sys.argv or '--unity-alpha' in sys.argv:
                import json
                scale=0.799348533*436/2
                colors=[]
                for i in range(200):
                    x=round(218+scale*(-1+(i%20)*.1));y=round(341+scale*(-.9+(i//20)*.1+.2067241668701172))
                    colors.append(image.getpixel((x,y)))
                label='alpha' if '--unity-alpha' in sys.argv else 'color'
                data=(json.dumps({'schema':1,'seed':123456,'time':capture_time,'mode':label,'samples':colors},separators=(',',':'))+'\n').encode()
                out=pathlib.Path('v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/pc-1.0.0.3664-unity-vertex-'+label+'-'+time_label+'.json')
                if out.exists() and out.read_bytes()!=data:raise ValueError('Original Unity vertex '+label+' output not repeatable')
                if not out.exists():out.write_bytes(data)
                print(json.dumps({'mode':label,'nativeSamples':colors[:12],'colorsNonBlack':sum(1 for c in colors if c[0] or c[1] or c[2]),'path':str(out)}))
                return
            visible=sum(1 for r,g,b,a in image.getdata() if r or g or b)
            if not visible:raise ValueError('Original Unity effect rendered no visible pixels')
            output=io.BytesIO();image.save(output,format='PNG');data=output.getvalue()
            target=pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교')/('3664 - 소환 입자 원본 Unity D3D - '+time_label+'초'+background_label+'.png')
            if target.exists() and target.read_bytes()!=data:raise FileExistsError('Different Unity reference already exists: '+str(target))
            if not target.exists():target.write_bytes(data)
            source_image=pathlib.Path('v7.14.4-webgpu-20261109/assets/unity/historical-frames/early-native/pc-1.0.0.3664-unity-particles-'+time_label+('-'+background if background!='000000' else '')+'.png')
            if source_image.exists() and source_image.read_bytes()!=data:raise ValueError('Original Unity rendered image was not repeatable')
            if not source_image.exists():source_image.write_bytes(data)
            print('Original Unity D3D frame: '+str(target)+' visible='+str(visible)+' particles=200')
        elif value.startswith('PNG:'):
            image=base64.b64decode(value[4:],validate=True)
            target=pathlib.Path(r'E:\hearthstone card\시기별 프레임 직업별 렌더 비교')/'3664 - 소환 입자 원본 Unity D3D - 0.05초.png'
            if target.exists() and target.read_bytes()!=image:raise FileExistsError('Different Unity reference already exists: '+str(target))
            if not target.exists():target.write_bytes(image)
            print('Original Unity D3D frame: '+str(target)+' bytes='+str(len(image)))
        else:print('Original player probe: '+value)
    finally:
        if thread:k.CloseHandle(thread)
        if process:k.CloseHandle(process)
        if game.poll() is None:game.terminate()
        try:game.wait(timeout=5)
        except subprocess.TimeoutExpired:game.kill();game.wait()

if __name__=='__main__':main()
