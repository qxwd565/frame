struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 11>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 1024>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 30>,
}

struct f_buffer3_ {
    f_cb3_: vec4<f32>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

const ImmCB_0_: array<vec4<u32>, 4> = array<vec4<u32>, 4>(vec4<u32>(1065353216u, 0u, 0u, 0u), vec4<u32>(0u, 1065353216u, 0u, 0u), vec4<u32>(0u, 0u, 1065353216u, 0u), vec4<u32>(0u, 0u, 0u, 1065353216u));

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(1) @binding(1) 
var<uniform> _f_buffer1_: f_buffer1_;
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(1) @binding(3) 
var<uniform> _f_buffer3_: f_buffer3_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e80 = vs_TEXCOORD0_1;
    let _e85 = _f_buffer0_.f_cb0_[4];
    let _e90 = hscard_bias.values[0];
    let _e93 = textureSampleBias(f_t0_, samplerf_s0_, _e80.xy, (_e85.x + _e90.x));
    u_xlat0_ = _e93;
    let _e94 = vs_TEXCOORD1_1;
    let _e99 = _f_buffer0_.f_cb0_[4];
    let _e104 = hscard_bias.values[1];
    let _e107 = textureSampleBias(f_t1_, samplerf_s1_, _e94.xy, (_e99.x + _e104.x));
    u_xlat1_ = _e107;
    let _e108 = u_xlat1_;
    let _e110 = vs_COLOR0_1;
    u_xlat2_ = (_e108.wwww * _e110);
    let _e112 = u_xlat0_;
    let _e114 = u_xlat1_;
    u_xlat1_ = (-(_e112) + _e114);
    let _e116 = u_xlat2_;
    let _e117 = u_xlat1_;
    let _e119 = u_xlat0_;
    u_xlat0_ = ((_e116 * _e117) + _e119);
    let _e121 = u_xlat0_;
    let _e122 = _f_buffer3_;
    u_xlat0_ = (_e121 * _e122.f_cb3_);
    let _e126 = vs_NORMAL0_1;
    let _e128 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e126.xyz, _e128.xyz);
    let _e132 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e132.x);
    let _e135 = u_xlat1_;
    let _e137 = u_xlat1_;
    let _e139 = vs_NORMAL0_1;
    let _e141 = (_e137.xxx * _e139.xyz);
    u_xlat1_.x = _e141.x;
    u_xlat1_.y = _e141.y;
    u_xlat1_.z = _e141.z;
    let _e148 = u_xlat2_;
    let _e153 = _f_buffer0_.f_cb0_[6];
    let _e158 = _f_buffer2_.f_cb2_[11];
    let _e160 = (_e153.xyz * _e158.zzz);
    u_xlat2_.x = _e160.x;
    u_xlat2_.y = _e160.y;
    u_xlat2_.z = _e160.z;
    let _e167 = u_xlat1_;
    let _e172 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e167.xyz, _e172.xyz);
    let _e175 = u_xlat19_;
    u_xlat19_ = clamp(_e175, 0f, 1f);
    let _e182 = _f_buffer0_.f_cb0_[10];
    let _e187 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e182.x, _e187.y);
    let _e190 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e190));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e205 = u_xlatu_loop_1_;
        let _e206 = u_xlatu20_;
        if !((_e205 < _e206)) {
            break;
        }
        {
            let _e212 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e212 >> 2u);
            let _e215 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e215 & 3u));
            let _e219 = u_xlatu4_;
            let _e225 = _f_buffer2_.f_cb2_[(i32(_e219) + 12i)];
            let _e226 = u_xlati10_;
            let _e230 = local[_e226];
            u_xlat4_ = dot(_e225, bitcast<vec4<f32>>(_e230));
            let _e233 = u_xlat4_;
            u_xlati4_ = i32(_e233);
            let _e235 = u_xlat10_;
            let _e237 = vs_TEXCOORD2_1;
            let _e240 = u_xlati4_;
            let _e243 = _f_buffer1_.f_cb1_[_e240];
            let _e246 = u_xlati4_;
            let _e249 = _f_buffer1_.f_cb1_[_e246];
            let _e251 = ((-(_e237.xyz) * _e243.www) + _e249.xyz);
            u_xlat10_.x = _e251.x;
            u_xlat10_.y = _e251.y;
            u_xlat10_.z = _e251.z;
            let _e259 = u_xlat10_;
            let _e261 = u_xlat10_;
            u_xlat5_.x = dot(_e259.xyz, _e261.xyz);
            let _e265 = u_xlat5_;
            u_xlat5_.x = max(_e265.x, 0.000061035156f);
            let _e269 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e269.x);
            let _e272 = u_xlat10_;
            let _e274 = u_xlat10_;
            let _e276 = u_xlat11_;
            let _e278 = (_e274.xyz * vec3(_e276));
            u_xlat10_.x = _e278.x;
            u_xlat10_.y = _e278.y;
            u_xlat10_.z = _e278.z;
            let _e287 = u_xlati4_;
            let _e292 = _f_buffer1_.f_cb1_[(_e287 + 512i)];
            u_xlat11_ = (1f / _e292.x);
            let _e296 = u_xlat5_;
            u_xlat5_.x = (_e296.x * 25f);
            let _e301 = u_xlat5_;
            let _e303 = u_xlat11_;
            u_xlat5_.x = (_e301.x / _e303);
            let _e306 = u_xlat5_;
            u_xlat5_.x = (_e306.x + 1f);
            let _e313 = u_xlat5_;
            u_xlat5_.x = (1f / _e313.x);
            let _e316 = u_xlati4_;
            let _e321 = _f_buffer1_.f_cb1_[(_e316 + 768i)];
            let _e323 = u_xlat10_;
            u_xlat11_ = dot(_e321.xyz, _e323.xyz);
            let _e326 = u_xlat11_;
            let _e327 = u_xlati4_;
            let _e332 = _f_buffer1_.f_cb1_[(_e327 + 512i)];
            let _e335 = u_xlati4_;
            let _e340 = _f_buffer1_.f_cb1_[(_e335 + 512i)];
            u_xlat11_ = ((_e326 * _e332.z) + _e340.w);
            let _e343 = u_xlat11_;
            u_xlat11_ = clamp(_e343, 0f, 1f);
            let _e347 = u_xlat11_;
            let _e348 = u_xlat11_;
            u_xlat11_ = (_e347 * _e348);
            let _e351 = u_xlat11_;
            let _e352 = u_xlat5_;
            u_xlat5_.x = (_e351 * _e352.x);
            let _e355 = u_xlat5_;
            let _e357 = u_xlat5_;
            let _e359 = u_xlati4_;
            let _e364 = _f_buffer1_.f_cb1_[(_e359 + 256i)];
            let _e366 = (_e357.xxx * _e364.xyz);
            u_xlat5_.x = _e366.x;
            u_xlat5_.y = _e366.y;
            u_xlat5_.z = _e366.z;
            let _e373 = u_xlat1_;
            let _e375 = u_xlat10_;
            u_xlat4_ = dot(_e373.xyz, _e375.xyz);
            let _e378 = u_xlat4_;
            u_xlat4_ = clamp(_e378, 0f, 1f);
            let _e382 = u_xlat3_;
            let _e384 = u_xlat5_;
            let _e386 = u_xlat4_;
            let _e389 = u_xlat3_;
            let _e391 = ((_e384.xyz * vec3(_e386)) + _e389.xyz);
            u_xlat3_.x = _e391.x;
            u_xlat3_.y = _e391.y;
            u_xlat3_.z = _e391.z;
        }
        continuing {
            let _e209 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e209 + 1u);
        }
    }
    let _e398 = u_xlat1_;
    let _e400 = u_xlat2_;
    let _e402 = u_xlat19_;
    let _e405 = u_xlat3_;
    let _e407 = ((_e400.xyz * vec3(_e402)) + _e405.xyz);
    u_xlat1_.x = _e407.x;
    u_xlat1_.y = _e407.y;
    u_xlat1_.z = _e407.z;
    let _e418 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e418.w);
    let _e425 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e425.w);
    let _e432 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e432.w);
    let _e435 = u_xlat2_;
    let _e437 = u_xlat2_;
    let _e439 = log2(_e437.xyz);
    u_xlat2_.x = _e439.x;
    u_xlat2_.y = _e439.y;
    u_xlat2_.z = _e439.z;
    let _e446 = u_xlat2_;
    let _e448 = u_xlat2_;
    let _e454 = (_e448.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e454.x;
    u_xlat2_.y = _e454.y;
    u_xlat2_.z = _e454.z;
    let _e461 = u_xlat2_;
    let _e463 = u_xlat2_;
    let _e465 = exp2(_e463.xyz);
    u_xlat2_.x = _e465.x;
    u_xlat2_.y = _e465.y;
    u_xlat2_.z = _e465.z;
    let _e472 = u_xlat2_;
    let _e474 = u_xlat2_;
    let _e488 = ((_e474.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e488.x;
    u_xlat2_.y = _e488.y;
    u_xlat2_.z = _e488.z;
    let _e495 = u_xlat2_;
    let _e497 = u_xlat2_;
    let _e503 = clamp(_e497.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e503.x;
    u_xlat2_.y = _e503.y;
    u_xlat2_.z = _e503.z;
    let _e510 = u_xlat1_;
    let _e512 = u_xlat1_;
    let _e514 = u_xlat2_;
    let _e516 = (_e512.xyz + _e514.xyz);
    u_xlat1_.x = _e516.x;
    u_xlat1_.y = _e516.y;
    u_xlat1_.z = _e516.z;
    let _e523 = SV_Target0_;
    let _e525 = u_xlat0_;
    let _e527 = u_xlat1_;
    let _e529 = (_e525.xyz * _e527.xyz);
    SV_Target0_.x = _e529.x;
    SV_Target0_.y = _e529.y;
    SV_Target0_.z = _e529.z;
    let _e537 = u_xlat0_;
    SV_Target0_.w = _e537.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e48 = SV_Target0_;
    return FragmentOutput(_e48);
}
