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
    f_cb3_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: f32 = 0f;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e85 = vs_TEXCOORD0_1;
    let _e90 = _f_buffer0_.f_cb0_[4];
    let _e95 = hscard_bias.values[0];
    let _e98 = textureSampleBias(f_t0_, samplerf_s0_, _e85.xy, (_e90.x + _e95.x));
    u_xlat0_ = _e98;
    let _e100 = vs_TEXCOORD0_1;
    let _e102 = dpdx(_e100.x);
    u_xlat1_.x = _e102;
    let _e103 = vs_TEXCOORD0_1;
    let _e105 = dpdy(_e103.x);
    u_xlat7_ = _e105;
    let _e107 = u_xlat7_;
    let _e109 = u_xlat1_;
    u_xlat1_.x = (abs(_e107) + abs(_e109.x));
    let _e113 = u_xlat1_;
    let _e123 = vs_TEXCOORD0_1;
    u_xlat1_ = ((_e113.xxxx * vec4<f32>(-0.5f, -0.5f, 0.5f, 0.5f)) + _e123.xyxy);
    let _e126 = u_xlat1_;
    let _e131 = _f_buffer0_.f_cb0_[4];
    let _e136 = hscard_bias.values[0];
    let _e139 = textureSampleBias(f_t0_, samplerf_s0_, _e126.xy, (_e131.x + _e136.x));
    u_xlat2_ = _e139;
    let _e140 = u_xlat0_;
    let _e141 = u_xlat2_;
    u_xlat0_ = (_e140 + _e141);
    let _e143 = u_xlat1_;
    let _e148 = _f_buffer0_.f_cb0_[4];
    let _e153 = hscard_bias.values[0];
    let _e156 = textureSampleBias(f_t0_, samplerf_s0_, _e143.zw, (_e148.x + _e153.x));
    u_xlat1_ = _e156;
    let _e157 = u_xlat0_;
    let _e158 = u_xlat1_;
    u_xlat0_ = (_e157 + _e158);
    let _e160 = u_xlat0_;
    u_xlat0_ = (_e160 * vec4<f32>(0.33333334f, 0.33333334f, 0.33333334f, 0.33333334f));
    let _e171 = _f_buffer3_.f_cb3_[1];
    u_xlatb1_ = (0f < _e171.x);
    let _e174 = u_xlatb1_;
    if _e174 {
        {
            let _e175 = vs_TEXCOORD5_1;
            let _e180 = _f_buffer0_.f_cb0_[4];
            let _e185 = hscard_bias.values[1];
            let _e188 = textureSampleBias(f_t1_, samplerf_s1_, _e175.xy, (_e180.x + _e185.x));
            u_xlat1_ = _e188;
            let _e192 = _f_buffer3_.f_cb3_[3];
            let _e194 = u_xlat1_;
            u_xlatb1_ = (_e192.x < _e194.x);
            let _e198 = u_xlatb1_;
            if _e198 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e203 = local;
            u_xlat1_.x = _e203;
            let _e205 = u_xlat0_;
            let _e207 = u_xlat1_;
            u_xlat0_.w = (_e205.w * _e207.x);
        }
    }
    let _e211 = vs_NORMAL0_1;
    let _e213 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e211.xyz, _e213.xyz);
    let _e217 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e217.x);
    let _e220 = u_xlat1_;
    let _e222 = u_xlat1_;
    let _e224 = vs_NORMAL0_1;
    let _e226 = (_e222.xxx * _e224.xyz);
    u_xlat1_.x = _e226.x;
    u_xlat1_.y = _e226.y;
    u_xlat1_.z = _e226.z;
    let _e233 = u_xlat2_;
    let _e238 = _f_buffer0_.f_cb0_[6];
    let _e243 = _f_buffer2_.f_cb2_[11];
    let _e245 = (_e238.xyz * _e243.zzz);
    u_xlat2_.x = _e245.x;
    u_xlat2_.y = _e245.y;
    u_xlat2_.z = _e245.z;
    let _e252 = u_xlat1_;
    let _e257 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e252.xyz, _e257.xyz);
    let _e260 = u_xlat19_;
    u_xlat19_ = clamp(_e260, 0f, 1f);
    let _e267 = _f_buffer0_.f_cb0_[10];
    let _e272 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e267.x, _e272.y);
    let _e275 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e275));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e290 = u_xlatu_loop_1_;
        let _e291 = u_xlatu20_;
        if !((_e290 < _e291)) {
            break;
        }
        {
            let _e297 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e297 >> 2u);
            let _e300 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e300 & 3u));
            let _e304 = u_xlatu4_;
            let _e310 = _f_buffer2_.f_cb2_[(i32(_e304) + 12i)];
            let _e311 = u_xlati10_;
            let _e315 = local_1[_e311];
            u_xlat4_ = dot(_e310, bitcast<vec4<f32>>(_e315));
            let _e318 = u_xlat4_;
            u_xlati4_ = i32(_e318);
            let _e320 = u_xlat10_;
            let _e322 = vs_TEXCOORD1_1;
            let _e325 = u_xlati4_;
            let _e328 = _f_buffer1_.f_cb1_[_e325];
            let _e331 = u_xlati4_;
            let _e334 = _f_buffer1_.f_cb1_[_e331];
            let _e336 = ((-(_e322.xyz) * _e328.www) + _e334.xyz);
            u_xlat10_.x = _e336.x;
            u_xlat10_.y = _e336.y;
            u_xlat10_.z = _e336.z;
            let _e344 = u_xlat10_;
            let _e346 = u_xlat10_;
            u_xlat5_.x = dot(_e344.xyz, _e346.xyz);
            let _e350 = u_xlat5_;
            u_xlat5_.x = max(_e350.x, 0.000061035156f);
            let _e354 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e354.x);
            let _e357 = u_xlat10_;
            let _e359 = u_xlat10_;
            let _e361 = u_xlat11_;
            let _e363 = (_e359.xyz * vec3(_e361));
            u_xlat10_.x = _e363.x;
            u_xlat10_.y = _e363.y;
            u_xlat10_.z = _e363.z;
            let _e372 = u_xlati4_;
            let _e377 = _f_buffer1_.f_cb1_[(_e372 + 512i)];
            u_xlat11_ = (1f / _e377.x);
            let _e381 = u_xlat5_;
            u_xlat5_.x = (_e381.x * 25f);
            let _e386 = u_xlat5_;
            let _e388 = u_xlat11_;
            u_xlat5_.x = (_e386.x / _e388);
            let _e391 = u_xlat5_;
            u_xlat5_.x = (_e391.x + 1f);
            let _e398 = u_xlat5_;
            u_xlat5_.x = (1f / _e398.x);
            let _e401 = u_xlati4_;
            let _e406 = _f_buffer1_.f_cb1_[(_e401 + 768i)];
            let _e408 = u_xlat10_;
            u_xlat11_ = dot(_e406.xyz, _e408.xyz);
            let _e411 = u_xlat11_;
            let _e412 = u_xlati4_;
            let _e417 = _f_buffer1_.f_cb1_[(_e412 + 512i)];
            let _e420 = u_xlati4_;
            let _e425 = _f_buffer1_.f_cb1_[(_e420 + 512i)];
            u_xlat11_ = ((_e411 * _e417.z) + _e425.w);
            let _e428 = u_xlat11_;
            u_xlat11_ = clamp(_e428, 0f, 1f);
            let _e432 = u_xlat11_;
            let _e433 = u_xlat11_;
            u_xlat11_ = (_e432 * _e433);
            let _e436 = u_xlat11_;
            let _e437 = u_xlat5_;
            u_xlat5_.x = (_e436 * _e437.x);
            let _e440 = u_xlat5_;
            let _e442 = u_xlat5_;
            let _e444 = u_xlati4_;
            let _e449 = _f_buffer1_.f_cb1_[(_e444 + 256i)];
            let _e451 = (_e442.xxx * _e449.xyz);
            u_xlat5_.x = _e451.x;
            u_xlat5_.y = _e451.y;
            u_xlat5_.z = _e451.z;
            let _e458 = u_xlat1_;
            let _e460 = u_xlat10_;
            u_xlat4_ = dot(_e458.xyz, _e460.xyz);
            let _e463 = u_xlat4_;
            u_xlat4_ = clamp(_e463, 0f, 1f);
            let _e467 = u_xlat3_;
            let _e469 = u_xlat5_;
            let _e471 = u_xlat4_;
            let _e474 = u_xlat3_;
            let _e476 = ((_e469.xyz * vec3(_e471)) + _e474.xyz);
            u_xlat3_.x = _e476.x;
            u_xlat3_.y = _e476.y;
            u_xlat3_.z = _e476.z;
        }
        continuing {
            let _e294 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e294 + 1u);
        }
    }
    let _e483 = u_xlat1_;
    let _e485 = u_xlat2_;
    let _e487 = u_xlat19_;
    let _e490 = u_xlat3_;
    let _e492 = ((_e485.xyz * vec3(_e487)) + _e490.xyz);
    u_xlat1_.x = _e492.x;
    u_xlat1_.y = _e492.y;
    u_xlat1_.z = _e492.z;
    let _e503 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e503.w);
    let _e510 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e510.w);
    let _e517 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e517.w);
    let _e520 = u_xlat2_;
    let _e522 = u_xlat2_;
    let _e524 = log2(_e522.xyz);
    u_xlat2_.x = _e524.x;
    u_xlat2_.y = _e524.y;
    u_xlat2_.z = _e524.z;
    let _e531 = u_xlat2_;
    let _e533 = u_xlat2_;
    let _e539 = (_e533.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e539.x;
    u_xlat2_.y = _e539.y;
    u_xlat2_.z = _e539.z;
    let _e546 = u_xlat2_;
    let _e548 = u_xlat2_;
    let _e550 = exp2(_e548.xyz);
    u_xlat2_.x = _e550.x;
    u_xlat2_.y = _e550.y;
    u_xlat2_.z = _e550.z;
    let _e557 = u_xlat2_;
    let _e559 = u_xlat2_;
    let _e573 = ((_e559.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e573.x;
    u_xlat2_.y = _e573.y;
    u_xlat2_.z = _e573.z;
    let _e580 = u_xlat2_;
    let _e582 = u_xlat2_;
    let _e588 = clamp(_e582.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e588.x;
    u_xlat2_.y = _e588.y;
    u_xlat2_.z = _e588.z;
    let _e595 = u_xlat1_;
    let _e597 = u_xlat1_;
    let _e599 = u_xlat2_;
    let _e601 = (_e597.xyz + _e599.xyz);
    u_xlat1_.x = _e601.x;
    u_xlat1_.y = _e601.y;
    u_xlat1_.z = _e601.z;
    let _e608 = u_xlat1_;
    let _e610 = u_xlat0_;
    let _e612 = u_xlat1_;
    let _e614 = (_e610.xyz * _e612.xyz);
    u_xlat1_.x = _e614.x;
    u_xlat1_.y = _e614.y;
    u_xlat1_.z = _e614.z;
    let _e621 = u_xlat0_;
    let _e623 = u_xlat0_;
    let _e625 = u_xlat1_;
    let _e627 = (_e623.www * _e625.xyz);
    u_xlat0_.x = _e627.x;
    u_xlat0_.y = _e627.y;
    u_xlat0_.z = _e627.z;
    let _e634 = u_xlat0_;
    SV_Target0_ = _e634;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
