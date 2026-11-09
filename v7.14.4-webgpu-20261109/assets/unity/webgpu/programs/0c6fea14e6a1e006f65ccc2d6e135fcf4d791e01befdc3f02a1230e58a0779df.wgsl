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
    v_cb3_: vec4<f32>,
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
    var u_xlat0_: vec3<f32> = vec3(0f);
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

    let _e74 = u_xlat0_;
    let _e76 = in_POSITION0_1;
    let _e81 = _v_buffer2_.v_cb2_[1];
    let _e83 = (_e76.yyy * _e81.xyz);
    u_xlat0_.x = _e83.x;
    u_xlat0_.y = _e83.y;
    u_xlat0_.z = _e83.z;
    let _e90 = u_xlat0_;
    let _e95 = _v_buffer2_.v_cb2_[0];
    let _e97 = in_POSITION0_1;
    let _e100 = u_xlat0_;
    let _e102 = ((_e95.xyz * _e97.xxx) + _e100.xyz);
    u_xlat0_.x = _e102.x;
    u_xlat0_.y = _e102.y;
    u_xlat0_.z = _e102.z;
    let _e109 = u_xlat0_;
    let _e114 = _v_buffer2_.v_cb2_[2];
    let _e116 = in_POSITION0_1;
    let _e119 = u_xlat0_;
    let _e121 = ((_e114.xyz * _e116.zzz) + _e119.xyz);
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    u_xlat0_.z = _e121.z;
    let _e128 = u_xlat0_;
    let _e130 = u_xlat0_;
    let _e135 = _v_buffer2_.v_cb2_[3];
    let _e137 = (_e130.xyz + _e135.xyz);
    u_xlat0_.x = _e137.x;
    u_xlat0_.y = _e137.y;
    u_xlat0_.z = _e137.z;
    let _e144 = u_xlat0_;
    let _e149 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e144.yyyy * _e149);
    let _e154 = _v_buffer0_.v_cb0_[79];
    let _e155 = u_xlat0_;
    let _e158 = u_xlat1_;
    u_xlat1_ = ((_e154 * _e155.xxxx) + _e158);
    let _e163 = _v_buffer0_.v_cb0_[81];
    let _e164 = u_xlat0_;
    let _e167 = u_xlat1_;
    u_xlat1_ = ((_e163 * _e164.zzzz) + _e167);
    let _e170 = u_xlat1_;
    let _e174 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e170 + _e174);
    let _e176 = vs_TEXCOORD0_;
    let _e178 = in_TEXCOORD0_1;
    let _e180 = _v_buffer3_;
    let _e184 = _v_buffer3_;
    let _e187 = ((_e178.xy * _e180.v_cb3_.xy) + _e184.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e187.x;
    vs_TEXCOORD0_.y = _e187.y;
    let _e193 = in_NORMAL0_1;
    let _e198 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e193.xyz, _e198.xyz);
    let _e202 = in_NORMAL0_1;
    let _e207 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e202.xyz, _e207.xyz);
    let _e211 = in_NORMAL0_1;
    let _e216 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e211.xyz, _e216.xyz);
    let _e219 = u_xlat1_;
    let _e221 = u_xlat1_;
    u_xlat18_ = dot(_e219.xyz, _e221.xyz);
    let _e224 = u_xlat18_;
    u_xlat18_ = max(_e224, 0.000000000000000000000000000000000000011754944f);
    let _e227 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e227);
    let _e229 = u_xlat1_;
    let _e231 = u_xlat18_;
    let _e233 = u_xlat1_;
    let _e235 = (vec3(_e231) * _e233.xyz);
    u_xlat1_.x = _e235.x;
    u_xlat1_.y = _e235.y;
    u_xlat1_.z = _e235.z;
    let _e246 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e246.w);
    let _e253 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e253.w);
    let _e260 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e260.w);
    let _e263 = u_xlat2_;
    let _e265 = u_xlat2_;
    let _e267 = log2(_e265.xyz);
    u_xlat2_.x = _e267.x;
    u_xlat2_.y = _e267.y;
    u_xlat2_.z = _e267.z;
    let _e274 = u_xlat2_;
    let _e276 = u_xlat2_;
    let _e282 = (_e276.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e282.x;
    u_xlat2_.y = _e282.y;
    u_xlat2_.z = _e282.z;
    let _e289 = u_xlat2_;
    let _e291 = u_xlat2_;
    let _e293 = exp2(_e291.xyz);
    u_xlat2_.x = _e293.x;
    u_xlat2_.y = _e293.y;
    u_xlat2_.z = _e293.z;
    let _e300 = u_xlat2_;
    let _e302 = u_xlat2_;
    let _e316 = ((_e302.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e316.x;
    u_xlat2_.y = _e316.y;
    u_xlat2_.z = _e316.z;
    let _e323 = u_xlat2_;
    let _e325 = u_xlat2_;
    let _e331 = clamp(_e325.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e331.x;
    u_xlat2_.y = _e331.y;
    u_xlat2_.z = _e331.z;
    let _e341 = _v_buffer0_.v_cb0_[10];
    let _e346 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e341.x, _e346.y);
    let _e349 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e349));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e363 = u_xlatu_loop_1_;
        let _e364 = u_xlatu18_;
        if !((_e363 < _e364)) {
            break;
        }
        {
            let _e370 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e370 >> 2u);
            let _e373 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e373 & 3u));
            let _e377 = u_xlatu20_;
            let _e383 = _v_buffer2_.v_cb2_[(i32(_e377) + 12i)];
            let _e384 = u_xlati21_;
            let _e388 = local[_e384];
            u_xlat20_ = dot(_e383, bitcast<vec4<f32>>(_e388));
            let _e391 = u_xlat20_;
            u_xlati20_ = i32(_e391);
            let _e393 = u_xlat4_;
            let _e395 = u_xlat0_;
            let _e398 = u_xlati20_;
            let _e401 = _v_buffer1_.v_cb1_[_e398];
            let _e404 = u_xlati20_;
            let _e407 = _v_buffer1_.v_cb1_[_e404];
            let _e409 = ((-(_e395.xyz) * _e401.www) + _e407.xyz);
            u_xlat4_.x = _e409.x;
            u_xlat4_.y = _e409.y;
            u_xlat4_.z = _e409.z;
            let _e416 = u_xlat4_;
            let _e418 = u_xlat4_;
            u_xlat21_ = dot(_e416.xyz, _e418.xyz);
            let _e421 = u_xlat21_;
            u_xlat21_ = max(_e421, 0.000061035156f);
            let _e424 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e424);
            let _e426 = u_xlat4_;
            let _e428 = u_xlat22_;
            let _e430 = u_xlat4_;
            let _e432 = (vec3(_e428) * _e430.xyz);
            u_xlat4_.x = _e432.x;
            u_xlat4_.y = _e432.y;
            u_xlat4_.z = _e432.z;
            let _e441 = u_xlati20_;
            let _e446 = _v_buffer1_.v_cb1_[(_e441 + 512i)];
            u_xlat22_ = (1f / _e446.x);
            let _e449 = u_xlat21_;
            u_xlat21_ = (_e449 * 25f);
            let _e452 = u_xlat21_;
            let _e453 = u_xlat22_;
            u_xlat21_ = (_e452 / _e453);
            let _e455 = u_xlat21_;
            u_xlat21_ = (_e455 + 1f);
            let _e460 = u_xlat21_;
            u_xlat21_ = (1f / _e460);
            let _e462 = u_xlati20_;
            let _e467 = _v_buffer1_.v_cb1_[(_e462 + 768i)];
            let _e469 = u_xlat4_;
            u_xlat22_ = dot(_e467.xyz, _e469.xyz);
            let _e472 = u_xlat22_;
            let _e473 = u_xlati20_;
            let _e478 = _v_buffer1_.v_cb1_[(_e473 + 512i)];
            let _e481 = u_xlati20_;
            let _e486 = _v_buffer1_.v_cb1_[(_e481 + 512i)];
            u_xlat22_ = ((_e472 * _e478.z) + _e486.w);
            let _e489 = u_xlat22_;
            u_xlat22_ = clamp(_e489, 0f, 1f);
            let _e493 = u_xlat22_;
            let _e494 = u_xlat22_;
            u_xlat22_ = (_e493 * _e494);
            let _e496 = u_xlat21_;
            let _e497 = u_xlat22_;
            u_xlat21_ = (_e496 * _e497);
            let _e499 = u_xlat5_;
            let _e501 = u_xlat21_;
            let _e503 = u_xlati20_;
            let _e508 = _v_buffer1_.v_cb1_[(_e503 + 256i)];
            let _e510 = (vec3(_e501) * _e508.xyz);
            u_xlat5_.x = _e510.x;
            u_xlat5_.y = _e510.y;
            u_xlat5_.z = _e510.z;
            let _e517 = u_xlat1_;
            let _e519 = u_xlat4_;
            u_xlat20_ = dot(_e517.xyz, _e519.xyz);
            let _e522 = u_xlat20_;
            u_xlat20_ = clamp(_e522, 0f, 1f);
            let _e526 = u_xlat3_;
            let _e528 = u_xlat5_;
            let _e530 = u_xlat20_;
            let _e533 = u_xlat3_;
            let _e535 = ((_e528.xyz * vec3(_e530)) + _e533.xyz);
            u_xlat3_.x = _e535.x;
            u_xlat3_.y = _e535.y;
            u_xlat3_.z = _e535.z;
        }
        continuing {
            let _e367 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e367 + 1u);
        }
    }
    let _e542 = vs_TEXCOORD2_;
    let _e544 = u_xlat2_;
    let _e546 = u_xlat3_;
    let _e548 = (_e544.xyz + _e546.xyz);
    vs_TEXCOORD2_.x = _e548.x;
    vs_TEXCOORD2_.y = _e548.y;
    vs_TEXCOORD2_.z = _e548.z;
    let _e555 = vs_TEXCOORD1_;
    let _e557 = u_xlat0_;
    let _e558 = _e557.xyz;
    vs_TEXCOORD1_.x = _e558.x;
    vs_TEXCOORD1_.y = _e558.y;
    vs_TEXCOORD1_.z = _e558.z;
    let _e565 = vs_NORMAL0_;
    let _e567 = u_xlat1_;
    let _e568 = _e567.xyz;
    vs_NORMAL0_.x = _e568.x;
    vs_NORMAL0_.y = _e568.y;
    vs_NORMAL0_.z = _e568.z;
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
