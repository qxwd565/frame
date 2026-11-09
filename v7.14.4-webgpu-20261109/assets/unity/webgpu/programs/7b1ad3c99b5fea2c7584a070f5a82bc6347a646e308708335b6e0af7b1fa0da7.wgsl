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
    v_cb3_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORD3_: vec3<f32>,
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
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD3_: vec3<f32>;
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

    let _e75 = in_POSITION0_1;
    let _e80 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e75.yyyy * _e80);
    let _e85 = _v_buffer2_.v_cb2_[0];
    let _e86 = in_POSITION0_1;
    let _e89 = u_xlat0_;
    u_xlat0_ = ((_e85 * _e86.xxxx) + _e89);
    let _e94 = _v_buffer2_.v_cb2_[2];
    let _e95 = in_POSITION0_1;
    let _e98 = u_xlat0_;
    u_xlat0_ = ((_e94 * _e95.zzzz) + _e98);
    let _e100 = u_xlat0_;
    let _e104 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e100 + _e104);
    let _e106 = u_xlat0_;
    let _e111 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e106.yyyy * _e111);
    let _e116 = _v_buffer0_.v_cb0_[79];
    let _e117 = u_xlat0_;
    let _e120 = u_xlat1_;
    u_xlat1_ = ((_e116 * _e117.xxxx) + _e120);
    let _e125 = _v_buffer0_.v_cb0_[81];
    let _e126 = u_xlat0_;
    let _e129 = u_xlat1_;
    u_xlat1_ = ((_e125 * _e126.zzzz) + _e129);
    let _e135 = _v_buffer0_.v_cb0_[82];
    let _e136 = u_xlat0_;
    let _e139 = u_xlat1_;
    gl_Position = ((_e135 * _e136.wwww) + _e139);
    let _e141 = vs_TEXCOORD0_;
    let _e143 = in_TEXCOORD0_1;
    let _e148 = _v_buffer3_.v_cb3_[0];
    let _e154 = _v_buffer3_.v_cb3_[0];
    let _e156 = ((_e143.xy * _e148.xy) + _e154.zw);
    vs_TEXCOORD0_.x = _e156.x;
    vs_TEXCOORD0_.y = _e156.y;
    let _e161 = vs_TEXCOORD1_;
    let _e163 = in_TEXCOORD0_1;
    let _e168 = _v_buffer3_.v_cb3_[1];
    let _e174 = _v_buffer3_.v_cb3_[1];
    let _e176 = ((_e163.xy * _e168.xy) + _e174.zw);
    vs_TEXCOORD1_.x = _e176.x;
    vs_TEXCOORD1_.y = _e176.y;
    let _e182 = in_NORMAL0_1;
    let _e187 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e182.xyz, _e187.xyz);
    let _e191 = in_NORMAL0_1;
    let _e196 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e191.xyz, _e196.xyz);
    let _e200 = in_NORMAL0_1;
    let _e205 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e200.xyz, _e205.xyz);
    let _e208 = u_xlat1_;
    let _e210 = u_xlat1_;
    u_xlat18_ = dot(_e208.xyz, _e210.xyz);
    let _e213 = u_xlat18_;
    u_xlat18_ = max(_e213, 0.000000000000000000000000000000000000011754944f);
    let _e216 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e216);
    let _e218 = u_xlat1_;
    let _e220 = u_xlat18_;
    let _e222 = u_xlat1_;
    let _e224 = (vec3(_e220) * _e222.xyz);
    u_xlat1_.x = _e224.x;
    u_xlat1_.y = _e224.y;
    u_xlat1_.z = _e224.z;
    let _e235 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e235.w);
    let _e242 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e242.w);
    let _e249 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e249.w);
    let _e252 = u_xlat2_;
    let _e254 = u_xlat2_;
    let _e256 = log2(_e254.xyz);
    u_xlat2_.x = _e256.x;
    u_xlat2_.y = _e256.y;
    u_xlat2_.z = _e256.z;
    let _e263 = u_xlat2_;
    let _e265 = u_xlat2_;
    let _e271 = (_e265.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e271.x;
    u_xlat2_.y = _e271.y;
    u_xlat2_.z = _e271.z;
    let _e278 = u_xlat2_;
    let _e280 = u_xlat2_;
    let _e282 = exp2(_e280.xyz);
    u_xlat2_.x = _e282.x;
    u_xlat2_.y = _e282.y;
    u_xlat2_.z = _e282.z;
    let _e289 = u_xlat2_;
    let _e291 = u_xlat2_;
    let _e305 = ((_e291.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e305.x;
    u_xlat2_.y = _e305.y;
    u_xlat2_.z = _e305.z;
    let _e312 = u_xlat2_;
    let _e314 = u_xlat2_;
    let _e320 = clamp(_e314.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e320.x;
    u_xlat2_.y = _e320.y;
    u_xlat2_.z = _e320.z;
    let _e330 = _v_buffer0_.v_cb0_[10];
    let _e335 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e330.x, _e335.y);
    let _e338 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e338));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e352 = u_xlatu_loop_1_;
        let _e353 = u_xlatu18_;
        if !((_e352 < _e353)) {
            break;
        }
        {
            let _e359 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e359 >> 2u);
            let _e362 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e362 & 3u));
            let _e366 = u_xlatu20_;
            let _e372 = _v_buffer2_.v_cb2_[(i32(_e366) + 12i)];
            let _e373 = u_xlati21_;
            let _e377 = local[_e373];
            u_xlat20_ = dot(_e372, bitcast<vec4<f32>>(_e377));
            let _e380 = u_xlat20_;
            u_xlati20_ = i32(_e380);
            let _e382 = u_xlat4_;
            let _e384 = u_xlat0_;
            let _e387 = u_xlati20_;
            let _e390 = _v_buffer1_.v_cb1_[_e387];
            let _e393 = u_xlati20_;
            let _e396 = _v_buffer1_.v_cb1_[_e393];
            let _e398 = ((-(_e384.xyz) * _e390.www) + _e396.xyz);
            u_xlat4_.x = _e398.x;
            u_xlat4_.y = _e398.y;
            u_xlat4_.z = _e398.z;
            let _e405 = u_xlat4_;
            let _e407 = u_xlat4_;
            u_xlat21_ = dot(_e405.xyz, _e407.xyz);
            let _e410 = u_xlat21_;
            u_xlat21_ = max(_e410, 0.000061035156f);
            let _e413 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e413);
            let _e415 = u_xlat4_;
            let _e417 = u_xlat22_;
            let _e419 = u_xlat4_;
            let _e421 = (vec3(_e417) * _e419.xyz);
            u_xlat4_.x = _e421.x;
            u_xlat4_.y = _e421.y;
            u_xlat4_.z = _e421.z;
            let _e430 = u_xlati20_;
            let _e435 = _v_buffer1_.v_cb1_[(_e430 + 512i)];
            u_xlat22_ = (1f / _e435.x);
            let _e438 = u_xlat21_;
            u_xlat21_ = (_e438 * 25f);
            let _e441 = u_xlat21_;
            let _e442 = u_xlat22_;
            u_xlat21_ = (_e441 / _e442);
            let _e444 = u_xlat21_;
            u_xlat21_ = (_e444 + 1f);
            let _e449 = u_xlat21_;
            u_xlat21_ = (1f / _e449);
            let _e451 = u_xlati20_;
            let _e456 = _v_buffer1_.v_cb1_[(_e451 + 768i)];
            let _e458 = u_xlat4_;
            u_xlat22_ = dot(_e456.xyz, _e458.xyz);
            let _e461 = u_xlat22_;
            let _e462 = u_xlati20_;
            let _e467 = _v_buffer1_.v_cb1_[(_e462 + 512i)];
            let _e470 = u_xlati20_;
            let _e475 = _v_buffer1_.v_cb1_[(_e470 + 512i)];
            u_xlat22_ = ((_e461 * _e467.z) + _e475.w);
            let _e478 = u_xlat22_;
            u_xlat22_ = clamp(_e478, 0f, 1f);
            let _e482 = u_xlat22_;
            let _e483 = u_xlat22_;
            u_xlat22_ = (_e482 * _e483);
            let _e485 = u_xlat21_;
            let _e486 = u_xlat22_;
            u_xlat21_ = (_e485 * _e486);
            let _e488 = u_xlat5_;
            let _e490 = u_xlat21_;
            let _e492 = u_xlati20_;
            let _e497 = _v_buffer1_.v_cb1_[(_e492 + 256i)];
            let _e499 = (vec3(_e490) * _e497.xyz);
            u_xlat5_.x = _e499.x;
            u_xlat5_.y = _e499.y;
            u_xlat5_.z = _e499.z;
            let _e506 = u_xlat1_;
            let _e508 = u_xlat4_;
            u_xlat20_ = dot(_e506.xyz, _e508.xyz);
            let _e511 = u_xlat20_;
            u_xlat20_ = clamp(_e511, 0f, 1f);
            let _e515 = u_xlat3_;
            let _e517 = u_xlat5_;
            let _e519 = u_xlat20_;
            let _e522 = u_xlat3_;
            let _e524 = ((_e517.xyz * vec3(_e519)) + _e522.xyz);
            u_xlat3_.x = _e524.x;
            u_xlat3_.y = _e524.y;
            u_xlat3_.z = _e524.z;
        }
        continuing {
            let _e356 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e356 + 1u);
        }
    }
    let _e531 = vs_TEXCOORD3_;
    let _e533 = u_xlat2_;
    let _e535 = u_xlat3_;
    let _e537 = (_e533.xyz + _e535.xyz);
    vs_TEXCOORD3_.x = _e537.x;
    vs_TEXCOORD3_.y = _e537.y;
    vs_TEXCOORD3_.z = _e537.z;
    let _e544 = vs_TEXCOORD2_;
    let _e546 = u_xlat0_;
    let _e547 = _e546.xyz;
    vs_TEXCOORD2_.x = _e547.x;
    vs_TEXCOORD2_.y = _e547.y;
    vs_TEXCOORD2_.z = _e547.z;
    let _e554 = vs_NORMAL0_;
    let _e556 = u_xlat1_;
    let _e557 = _e556.xyz;
    vs_NORMAL0_.x = _e557.x;
    vs_NORMAL0_.y = _e557.y;
    vs_NORMAL0_.z = _e557.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e37 = vs_TEXCOORD0_;
    let _e39 = vs_TEXCOORD1_;
    let _e41 = vs_TEXCOORD2_;
    let _e43 = vs_TEXCOORD3_;
    let _e45 = vs_NORMAL0_;
    let _e47 = gl_Position;
    return VertexOutput(_e37, _e39, _e41, _e43, _e45, _e47);
}
