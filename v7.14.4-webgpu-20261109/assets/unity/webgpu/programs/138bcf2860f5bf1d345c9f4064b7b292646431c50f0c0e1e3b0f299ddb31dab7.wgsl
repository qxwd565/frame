struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 1024>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 30>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 3>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

const ImmCB_0_: array<vec4<u32>, 4> = array<vec4<u32>, 4>(vec4<u32>(1065353216u, 0u, 0u, 0u), vec4<u32>(0u, 1065353216u, 0u, 0u), vec4<u32>(0u, 0u, 1065353216u, 0u), vec4<u32>(0u, 0u, 0u, 1065353216u));

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlati3_: i32 = 0i;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlatu15_: u32 = 0u;
    var u_xlatu16_: u32 = 0u;
    var u_xlat17_: f32 = 0f;
    var u_xlati17_: i32 = 0i;
    var u_xlatu17_: u32 = 0u;
    var u_xlatb17_: bool = false;
    var u_xlat18_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e67 = in_POSITION0_1;
    let _e72 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e67.yyyy * _e72);
    let _e77 = _v_buffer2_.v_cb2_[0];
    let _e78 = in_POSITION0_1;
    let _e81 = u_xlat0_;
    u_xlat0_ = ((_e77 * _e78.xxxx) + _e81);
    let _e86 = _v_buffer2_.v_cb2_[2];
    let _e87 = in_POSITION0_1;
    let _e90 = u_xlat0_;
    u_xlat0_ = ((_e86 * _e87.zzzz) + _e90);
    let _e92 = u_xlat0_;
    let _e96 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e92 + _e96);
    let _e98 = u_xlat0_;
    let _e103 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e98.yyyy * _e103);
    let _e108 = _v_buffer0_.v_cb0_[79];
    let _e109 = u_xlat0_;
    let _e112 = u_xlat1_;
    u_xlat1_ = ((_e108 * _e109.xxxx) + _e112);
    let _e117 = _v_buffer0_.v_cb0_[81];
    let _e118 = u_xlat0_;
    let _e121 = u_xlat1_;
    u_xlat1_ = ((_e117 * _e118.zzzz) + _e121);
    let _e127 = _v_buffer0_.v_cb0_[82];
    let _e128 = u_xlat0_;
    let _e131 = u_xlat1_;
    gl_Position = ((_e127 * _e128.wwww) + _e131);
    let _e133 = vs_TEXCOORD0_;
    let _e135 = in_TEXCOORD0_1;
    let _e140 = _v_buffer3_.v_cb3_[2];
    let _e146 = _v_buffer3_.v_cb3_[2];
    let _e148 = ((_e135.xy * _e140.xy) + _e146.zw);
    vs_TEXCOORD0_.x = _e148.x;
    vs_TEXCOORD0_.y = _e148.y;
    let _e157 = _v_buffer2_.v_cb2_[27];
    u_xlat1_.x = abs(_e157.w);
    let _e164 = _v_buffer2_.v_cb2_[28];
    u_xlat1_.y = abs(_e164.w);
    let _e171 = _v_buffer2_.v_cb2_[29];
    u_xlat1_.z = abs(_e171.w);
    let _e174 = u_xlat1_;
    let _e176 = u_xlat1_;
    let _e178 = log2(_e176.xyz);
    u_xlat1_.x = _e178.x;
    u_xlat1_.y = _e178.y;
    u_xlat1_.z = _e178.z;
    let _e185 = u_xlat1_;
    let _e187 = u_xlat1_;
    let _e193 = (_e187.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat1_.x = _e193.x;
    u_xlat1_.y = _e193.y;
    u_xlat1_.z = _e193.z;
    let _e200 = u_xlat1_;
    let _e202 = u_xlat1_;
    let _e204 = exp2(_e202.xyz);
    u_xlat1_.x = _e204.x;
    u_xlat1_.y = _e204.y;
    u_xlat1_.z = _e204.z;
    let _e211 = u_xlat1_;
    let _e213 = u_xlat1_;
    let _e227 = ((_e213.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat1_.x = _e227.x;
    u_xlat1_.y = _e227.y;
    u_xlat1_.z = _e227.z;
    let _e234 = u_xlat1_;
    let _e236 = u_xlat1_;
    let _e242 = clamp(_e236.xyz, vec3(0f), vec3(1f));
    u_xlat1_.x = _e242.x;
    u_xlat1_.y = _e242.y;
    u_xlat1_.z = _e242.z;
    let _e252 = _v_buffer0_.v_cb0_[10];
    let _e257 = _v_buffer2_.v_cb2_[11];
    u_xlat15_ = min(_e252.x, _e257.y);
    let _e260 = u_xlat15_;
    u_xlatu15_ = u32(i32(_e260));
    u_xlat2_.x = 0f;
    u_xlat2_.y = 0f;
    u_xlat2_.z = 0f;
    loop {
        let _e274 = u_xlatu_loop_1_;
        let _e275 = u_xlatu15_;
        if !((_e274 < _e275)) {
            break;
        }
        {
            let _e281 = u_xlatu_loop_1_;
            u_xlatu17_ = (_e281 >> 2u);
            let _e284 = u_xlatu_loop_1_;
            u_xlati3_ = i32((_e284 & 3u));
            let _e288 = u_xlatu17_;
            let _e294 = _v_buffer2_.v_cb2_[(i32(_e288) + 12i)];
            let _e295 = u_xlati3_;
            let _e299 = local[_e295];
            u_xlat17_ = dot(_e294, bitcast<vec4<f32>>(_e299));
            let _e302 = u_xlat17_;
            u_xlati17_ = i32(_e302);
            let _e304 = u_xlat3_;
            let _e306 = u_xlat0_;
            let _e309 = u_xlati17_;
            let _e312 = _v_buffer1_.v_cb1_[_e309];
            let _e315 = u_xlati17_;
            let _e318 = _v_buffer1_.v_cb1_[_e315];
            let _e320 = ((-(_e306.xyz) * _e312.www) + _e318.xyz);
            u_xlat3_.x = _e320.x;
            u_xlat3_.y = _e320.y;
            u_xlat3_.z = _e320.z;
            let _e327 = u_xlat3_;
            let _e329 = u_xlat3_;
            u_xlat18_ = dot(_e327.xyz, _e329.xyz);
            let _e332 = u_xlat18_;
            u_xlat18_ = max(_e332, 0.000061035156f);
            let _e336 = u_xlat18_;
            u_xlat4_.x = inverseSqrt(_e336);
            let _e338 = u_xlat3_;
            let _e340 = u_xlat3_;
            let _e342 = u_xlat4_;
            let _e344 = (_e340.xyz * _e342.xxx);
            u_xlat3_.x = _e344.x;
            u_xlat3_.y = _e344.y;
            u_xlat3_.z = _e344.z;
            let _e354 = u_xlati17_;
            let _e359 = _v_buffer1_.v_cb1_[(_e354 + 512i)];
            u_xlat4_.x = (1f / _e359.x);
            let _e362 = u_xlat18_;
            u_xlat18_ = (_e362 * 25f);
            let _e365 = u_xlat18_;
            let _e366 = u_xlat4_;
            u_xlat18_ = (_e365 / _e366.x);
            let _e369 = u_xlat18_;
            u_xlat18_ = (_e369 + 1f);
            let _e374 = u_xlat18_;
            u_xlat18_ = (1f / _e374);
            let _e377 = u_xlati17_;
            let _e382 = _v_buffer1_.v_cb1_[(_e377 + 768i)];
            let _e384 = u_xlat3_;
            u_xlat4_.x = dot(_e382.xyz, _e384.xyz);
            let _e388 = u_xlat4_;
            let _e390 = u_xlati17_;
            let _e395 = _v_buffer1_.v_cb1_[(_e390 + 512i)];
            let _e398 = u_xlati17_;
            let _e403 = _v_buffer1_.v_cb1_[(_e398 + 512i)];
            u_xlat4_.x = ((_e388.x * _e395.z) + _e403.w);
            let _e407 = u_xlat4_;
            u_xlat4_.x = clamp(_e407.x, 0f, 1f);
            let _e413 = u_xlat4_;
            let _e415 = u_xlat4_;
            u_xlat4_.x = (_e413.x * _e415.x);
            let _e418 = u_xlat18_;
            let _e419 = u_xlat4_;
            u_xlat18_ = (_e418 * _e419.x);
            let _e422 = u_xlat4_;
            let _e424 = u_xlat18_;
            let _e426 = u_xlati17_;
            let _e431 = _v_buffer1_.v_cb1_[(_e426 + 256i)];
            let _e433 = (vec3(_e424) * _e431.xyz);
            u_xlat4_.x = _e433.x;
            u_xlat4_.y = _e433.y;
            u_xlat4_.z = _e433.z;
            let _e440 = in_NORMAL0_1;
            let _e442 = u_xlat3_;
            u_xlat17_ = dot(_e440.xyz, _e442.xyz);
            let _e445 = u_xlat17_;
            u_xlat17_ = clamp(_e445, 0f, 1f);
            let _e449 = u_xlat2_;
            let _e451 = u_xlat4_;
            let _e453 = u_xlat17_;
            let _e456 = u_xlat2_;
            let _e458 = ((_e451.xyz * vec3(_e453)) + _e456.xyz);
            u_xlat2_.x = _e458.x;
            u_xlat2_.y = _e458.y;
            u_xlat2_.z = _e458.z;
        }
        continuing {
            let _e278 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e278 + 1u);
        }
    }
    let _e465 = vs_TEXCOORD2_;
    let _e467 = u_xlat1_;
    let _e469 = u_xlat2_;
    let _e471 = (_e467.xyz + _e469.xyz);
    vs_TEXCOORD2_.x = _e471.x;
    vs_TEXCOORD2_.y = _e471.y;
    vs_TEXCOORD2_.z = _e471.z;
    let _e478 = vs_TEXCOORD1_;
    let _e480 = u_xlat0_;
    let _e481 = _e480.xyz;
    vs_TEXCOORD1_.x = _e481.x;
    vs_TEXCOORD1_.y = _e481.y;
    vs_TEXCOORD1_.z = _e481.z;
    let _e488 = vs_NORMAL0_;
    let _e490 = in_NORMAL0_1;
    let _e491 = _e490.xyz;
    vs_NORMAL0_.x = _e491.x;
    vs_NORMAL0_.y = _e491.y;
    vs_NORMAL0_.z = _e491.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e35 = vs_TEXCOORD0_;
    let _e37 = vs_TEXCOORD1_;
    let _e39 = vs_TEXCOORD2_;
    let _e41 = vs_NORMAL0_;
    let _e43 = gl_Position;
    return VertexOutput(_e35, _e37, _e39, _e41, _e43);
}
