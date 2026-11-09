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
    v_cb3_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORD3_: vec3<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD3_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var u_xlatu18_: u32 = 0u;
    var u_xlatu19_: u32 = 0u;
    var u_xlat20_: f32 = 0f;
    var u_xlati20_: i32 = 0i;
    var u_xlatu20_: u32 = 0u;
    var u_xlatb20_: bool = false;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlat22_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e78 = in_POSITION0_1;
    let _e83 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e78.yyyy * _e83);
    let _e88 = _v_buffer2_.v_cb2_[0];
    let _e89 = in_POSITION0_1;
    let _e92 = u_xlat0_;
    u_xlat0_ = ((_e88 * _e89.xxxx) + _e92);
    let _e97 = _v_buffer2_.v_cb2_[2];
    let _e98 = in_POSITION0_1;
    let _e101 = u_xlat0_;
    u_xlat0_ = ((_e97 * _e98.zzzz) + _e101);
    let _e103 = u_xlat0_;
    let _e107 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e103 + _e107);
    let _e109 = u_xlat0_;
    let _e114 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e109.yyyy * _e114);
    let _e119 = _v_buffer0_.v_cb0_[79];
    let _e120 = u_xlat0_;
    let _e123 = u_xlat1_;
    u_xlat1_ = ((_e119 * _e120.xxxx) + _e123);
    let _e128 = _v_buffer0_.v_cb0_[81];
    let _e129 = u_xlat0_;
    let _e132 = u_xlat1_;
    u_xlat1_ = ((_e128 * _e129.zzzz) + _e132);
    let _e138 = _v_buffer0_.v_cb0_[82];
    let _e139 = u_xlat0_;
    let _e142 = u_xlat1_;
    gl_Position = ((_e138 * _e139.wwww) + _e142);
    let _e144 = u_xlat1_;
    let _e149 = _v_buffer0_.v_cb0_[15];
    let _e154 = _v_buffer3_.v_cb3_[2];
    let _e157 = in_TEXCOORD0_1;
    let _e159 = ((_e149.xx * _e154.yz) + _e157.xy);
    u_xlat1_.x = _e159.x;
    u_xlat1_.y = _e159.y;
    let _e164 = vs_TEXCOORD0_;
    let _e166 = u_xlat1_;
    let _e171 = _v_buffer3_.v_cb3_[2];
    let _e173 = (_e166.xy * _e171.xx);
    vs_TEXCOORD0_.x = _e173.x;
    vs_TEXCOORD0_.y = _e173.y;
    let _e178 = u_xlat1_;
    let _e183 = _v_buffer0_.v_cb0_[15];
    let _e188 = _v_buffer3_.v_cb3_[3];
    let _e191 = in_TEXCOORD0_1;
    let _e193 = ((_e183.xx * _e188.xy) + _e191.xy);
    u_xlat1_.x = _e193.x;
    u_xlat1_.y = _e193.y;
    let _e198 = vs_TEXCOORD0_;
    let _e200 = u_xlat1_;
    let _e205 = _v_buffer3_.v_cb3_[2];
    let _e207 = (_e200.xy * _e205.ww);
    vs_TEXCOORD0_.z = _e207.x;
    vs_TEXCOORD0_.w = _e207.y;
    let _e212 = vs_TEXCOORD1_;
    let _e214 = in_TEXCOORD1_1;
    let _e219 = _v_buffer3_.v_cb3_[0];
    let _e225 = _v_buffer3_.v_cb3_[0];
    let _e227 = ((_e214.xy * _e219.xy) + _e225.zw);
    vs_TEXCOORD1_.x = _e227.x;
    vs_TEXCOORD1_.y = _e227.y;
    let _e232 = in_COLOR0_1;
    let _e236 = _v_buffer3_.v_cb3_[1];
    vs_COLOR0_ = (_e232 * _e236.wwww);
    let _e240 = in_NORMAL0_1;
    let _e245 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e240.xyz, _e245.xyz);
    let _e249 = in_NORMAL0_1;
    let _e254 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e249.xyz, _e254.xyz);
    let _e258 = in_NORMAL0_1;
    let _e263 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e258.xyz, _e263.xyz);
    let _e266 = u_xlat1_;
    let _e268 = u_xlat1_;
    u_xlat18_ = dot(_e266.xyz, _e268.xyz);
    let _e271 = u_xlat18_;
    u_xlat18_ = max(_e271, 0.000000000000000000000000000000000000011754944f);
    let _e274 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e274);
    let _e276 = u_xlat1_;
    let _e278 = u_xlat18_;
    let _e280 = u_xlat1_;
    let _e282 = (vec3(_e278) * _e280.xyz);
    u_xlat1_.x = _e282.x;
    u_xlat1_.y = _e282.y;
    u_xlat1_.z = _e282.z;
    let _e293 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e293.w);
    let _e300 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e300.w);
    let _e307 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e307.w);
    let _e310 = u_xlat2_;
    let _e312 = u_xlat2_;
    let _e314 = log2(_e312.xyz);
    u_xlat2_.x = _e314.x;
    u_xlat2_.y = _e314.y;
    u_xlat2_.z = _e314.z;
    let _e321 = u_xlat2_;
    let _e323 = u_xlat2_;
    let _e329 = (_e323.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e329.x;
    u_xlat2_.y = _e329.y;
    u_xlat2_.z = _e329.z;
    let _e336 = u_xlat2_;
    let _e338 = u_xlat2_;
    let _e340 = exp2(_e338.xyz);
    u_xlat2_.x = _e340.x;
    u_xlat2_.y = _e340.y;
    u_xlat2_.z = _e340.z;
    let _e347 = u_xlat2_;
    let _e349 = u_xlat2_;
    let _e363 = ((_e349.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e363.x;
    u_xlat2_.y = _e363.y;
    u_xlat2_.z = _e363.z;
    let _e370 = u_xlat2_;
    let _e372 = u_xlat2_;
    let _e378 = clamp(_e372.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e378.x;
    u_xlat2_.y = _e378.y;
    u_xlat2_.z = _e378.z;
    let _e388 = _v_buffer0_.v_cb0_[10];
    let _e393 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e388.x, _e393.y);
    let _e396 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e396));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e410 = u_xlatu_loop_1_;
        let _e411 = u_xlatu18_;
        if !((_e410 < _e411)) {
            break;
        }
        {
            let _e417 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e417 >> 2u);
            let _e420 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e420 & 3u));
            let _e424 = u_xlatu20_;
            let _e430 = _v_buffer2_.v_cb2_[(i32(_e424) + 12i)];
            let _e431 = u_xlati21_;
            let _e435 = local[_e431];
            u_xlat20_ = dot(_e430, bitcast<vec4<f32>>(_e435));
            let _e438 = u_xlat20_;
            u_xlati20_ = i32(_e438);
            let _e440 = u_xlat4_;
            let _e442 = u_xlat0_;
            let _e445 = u_xlati20_;
            let _e448 = _v_buffer1_.v_cb1_[_e445];
            let _e451 = u_xlati20_;
            let _e454 = _v_buffer1_.v_cb1_[_e451];
            let _e456 = ((-(_e442.xyz) * _e448.www) + _e454.xyz);
            u_xlat4_.x = _e456.x;
            u_xlat4_.y = _e456.y;
            u_xlat4_.z = _e456.z;
            let _e463 = u_xlat4_;
            let _e465 = u_xlat4_;
            u_xlat21_ = dot(_e463.xyz, _e465.xyz);
            let _e468 = u_xlat21_;
            u_xlat21_ = max(_e468, 0.000061035156f);
            let _e471 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e471);
            let _e473 = u_xlat4_;
            let _e475 = u_xlat22_;
            let _e477 = u_xlat4_;
            let _e479 = (vec3(_e475) * _e477.xyz);
            u_xlat4_.x = _e479.x;
            u_xlat4_.y = _e479.y;
            u_xlat4_.z = _e479.z;
            let _e488 = u_xlati20_;
            let _e493 = _v_buffer1_.v_cb1_[(_e488 + 512i)];
            u_xlat22_ = (1f / _e493.x);
            let _e496 = u_xlat21_;
            u_xlat21_ = (_e496 * 25f);
            let _e499 = u_xlat21_;
            let _e500 = u_xlat22_;
            u_xlat21_ = (_e499 / _e500);
            let _e502 = u_xlat21_;
            u_xlat21_ = (_e502 + 1f);
            let _e507 = u_xlat21_;
            u_xlat21_ = (1f / _e507);
            let _e509 = u_xlati20_;
            let _e514 = _v_buffer1_.v_cb1_[(_e509 + 768i)];
            let _e516 = u_xlat4_;
            u_xlat22_ = dot(_e514.xyz, _e516.xyz);
            let _e519 = u_xlat22_;
            let _e520 = u_xlati20_;
            let _e525 = _v_buffer1_.v_cb1_[(_e520 + 512i)];
            let _e528 = u_xlati20_;
            let _e533 = _v_buffer1_.v_cb1_[(_e528 + 512i)];
            u_xlat22_ = ((_e519 * _e525.z) + _e533.w);
            let _e536 = u_xlat22_;
            u_xlat22_ = clamp(_e536, 0f, 1f);
            let _e540 = u_xlat22_;
            let _e541 = u_xlat22_;
            u_xlat22_ = (_e540 * _e541);
            let _e543 = u_xlat21_;
            let _e544 = u_xlat22_;
            u_xlat21_ = (_e543 * _e544);
            let _e546 = u_xlat5_;
            let _e548 = u_xlat21_;
            let _e550 = u_xlati20_;
            let _e555 = _v_buffer1_.v_cb1_[(_e550 + 256i)];
            let _e557 = (vec3(_e548) * _e555.xyz);
            u_xlat5_.x = _e557.x;
            u_xlat5_.y = _e557.y;
            u_xlat5_.z = _e557.z;
            let _e564 = u_xlat1_;
            let _e566 = u_xlat4_;
            u_xlat20_ = dot(_e564.xyz, _e566.xyz);
            let _e569 = u_xlat20_;
            u_xlat20_ = clamp(_e569, 0f, 1f);
            let _e573 = u_xlat3_;
            let _e575 = u_xlat5_;
            let _e577 = u_xlat20_;
            let _e580 = u_xlat3_;
            let _e582 = ((_e575.xyz * vec3(_e577)) + _e580.xyz);
            u_xlat3_.x = _e582.x;
            u_xlat3_.y = _e582.y;
            u_xlat3_.z = _e582.z;
        }
        continuing {
            let _e414 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e414 + 1u);
        }
    }
    let _e589 = vs_TEXCOORD3_;
    let _e591 = u_xlat2_;
    let _e593 = u_xlat3_;
    let _e595 = (_e591.xyz + _e593.xyz);
    vs_TEXCOORD3_.x = _e595.x;
    vs_TEXCOORD3_.y = _e595.y;
    vs_TEXCOORD3_.z = _e595.z;
    let _e602 = vs_TEXCOORD2_;
    let _e604 = u_xlat0_;
    let _e605 = _e604.xyz;
    vs_TEXCOORD2_.x = _e605.x;
    vs_TEXCOORD2_.y = _e605.y;
    vs_TEXCOORD2_.z = _e605.z;
    let _e612 = vs_NORMAL0_;
    let _e614 = u_xlat1_;
    let _e615 = _e614.xyz;
    vs_NORMAL0_.x = _e615.x;
    vs_NORMAL0_.y = _e615.y;
    vs_NORMAL0_.z = _e615.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e47 = vs_TEXCOORD0_;
    let _e49 = vs_TEXCOORD1_;
    let _e51 = vs_TEXCOORD2_;
    let _e53 = vs_TEXCOORD3_;
    let _e55 = vs_COLOR0_;
    let _e57 = vs_NORMAL0_;
    let _e59 = gl_Position;
    return VertexOutput(_e47, _e49, _e51, _e53, _e55, _e57, _e59);
}
