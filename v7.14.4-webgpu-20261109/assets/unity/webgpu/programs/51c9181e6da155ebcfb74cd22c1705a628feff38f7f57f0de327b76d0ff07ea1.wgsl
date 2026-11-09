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
    f_cb3_: array<vec4<f32>, 28>,
}

struct f_buffer4_ {
    f_cb4_: array<vec4<f32>, 5>,
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
@group(1) @binding(4) 
var<uniform> _f_buffer4_: f_buffer4_;
@group(3) @binding(1) 
var samplerf_s0_: sampler_comparison;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlatb3_: bool = false;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlati5_: i32 = 0i;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat23_: f32 = 0f;
    var u_xlatu23_: u32 = 0u;
    var u_xlatb23_: bool = false;
    var u_xlatu24_: u32 = 0u;
    var u_xlat25_: f32 = 0f;
    var u_xlati25_: i32 = 0i;
    var u_xlatu25_: u32 = 0u;
    var u_xlatb25_: bool = false;
    var u_xlat26_: f32 = 0f;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e96 = vs_TEXCOORD0_1;
    let _e101 = _f_buffer0_.f_cb0_[4];
    let _e106 = hscard_bias.values[1];
    let _e109 = textureSampleBias(f_t1_, samplerf_s1_, _e96.xy, (_e101.x + _e106.x));
    u_xlat0_ = _e109;
    let _e110 = vs_TEXCOORD1_1;
    let _e115 = _f_buffer0_.f_cb0_[4];
    let _e120 = hscard_bias.values[2];
    let _e123 = textureSampleBias(f_t2_, samplerf_s2_, _e110.xy, (_e115.x + _e120.x));
    u_xlat1_ = _e123;
    let _e124 = u_xlat1_;
    let _e126 = u_xlat0_;
    let _e129 = u_xlat1_;
    let _e131 = (-(_e126.xyz) + _e129.xyz);
    u_xlat1_.x = _e131.x;
    u_xlat1_.y = _e131.y;
    u_xlat1_.z = _e131.z;
    let _e138 = u_xlat0_;
    let _e143 = _f_buffer4_.f_cb4_[4];
    let _e145 = u_xlat1_;
    let _e148 = u_xlat0_;
    let _e150 = ((_e143.xxx * _e145.xyz) + _e148.xyz);
    u_xlat0_.x = _e150.x;
    u_xlat0_.y = _e150.y;
    u_xlat0_.z = _e150.z;
    let _e161 = _f_buffer4_.f_cb4_[4];
    u_xlat1_.x = _e161.y;
    let _e164 = u_xlat1_;
    u_xlat1_.x = clamp(_e164.x, 0f, 1f);
    let _e170 = u_xlat1_;
    u_xlat8_.x = (-(_e170.x) + 1f);
    let _e175 = u_xlat8_;
    let _e177 = u_xlat0_;
    let _e179 = u_xlat8_;
    let _e181 = (_e177.xyz * _e179.xxx);
    u_xlat8_.x = _e181.x;
    u_xlat8_.y = _e181.y;
    u_xlat8_.z = _e181.z;
    let _e189 = u_xlat1_;
    let _e194 = _f_buffer4_.f_cb4_[4];
    u_xlat1_.x = (_e189.x + _e194.z);
    let _e197 = u_xlat0_;
    let _e199 = u_xlat0_;
    let _e201 = u_xlat1_;
    let _e203 = (_e199.xyz * _e201.xxx);
    u_xlat0_.x = _e203.x;
    u_xlat0_.y = _e203.y;
    u_xlat0_.z = _e203.z;
    let _e211 = vs_NORMAL0_1;
    let _e213 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e211.xyz, _e213.xyz);
    let _e217 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e217.x);
    let _e220 = u_xlat2_;
    let _e222 = u_xlat1_;
    let _e224 = vs_NORMAL0_1;
    let _e226 = (_e222.xxx * _e224.xyz);
    u_xlat2_.x = _e226.x;
    u_xlat2_.y = _e226.y;
    u_xlat2_.z = _e226.z;
    let _e233 = vs_TEXCOORDindex3_1;
    let _e234 = _e233.xy;
    let _e235 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e234.x, _e234.y, _e235.z);
    let _e242 = txVec0_;
    let _e246 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e242.xy, _e242.z);
    u_xlat1_.x = _e246;
    let _e250 = _f_buffer3_.f_cb3_[27];
    u_xlat23_ = (-(_e250.x) + 1f);
    let _e256 = u_xlat1_;
    let _e261 = _f_buffer3_.f_cb3_[27];
    let _e264 = u_xlat23_;
    u_xlat1_.x = ((_e256.x * _e261.x) + _e264);
    let _e267 = vs_TEXCOORDindex3_1;
    u_xlatb23_ = (0f >= _e267.z);
    let _e270 = vs_TEXCOORDindex3_1;
    u_xlatb3_ = (_e270.z >= 1f);
    let _e274 = u_xlatb23_;
    let _e275 = u_xlatb3_;
    u_xlatb23_ = (_e274 || _e275);
    let _e278 = u_xlatb23_;
    if _e278 {
        local = 1f;
    } else {
        let _e280 = u_xlat1_;
        local = _e280.x;
    }
    let _e283 = local;
    u_xlat1_.x = _e283;
    let _e285 = u_xlat1_;
    let _e290 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e285.x * _e290.z);
    let _e293 = u_xlat3_;
    let _e295 = u_xlat1_;
    let _e300 = _f_buffer0_.f_cb0_[6];
    let _e302 = (_e295.xxx * _e300.xyz);
    u_xlat3_.x = _e302.x;
    u_xlat3_.y = _e302.y;
    u_xlat3_.z = _e302.z;
    let _e310 = u_xlat2_;
    let _e315 = _f_buffer0_.f_cb0_[5];
    u_xlat1_.x = dot(_e310.xyz, _e315.xyz);
    let _e319 = u_xlat1_;
    u_xlat1_.x = clamp(_e319.x, 0f, 1f);
    let _e327 = _f_buffer0_.f_cb0_[10];
    let _e332 = _f_buffer2_.f_cb2_[11];
    u_xlat23_ = min(_e327.x, _e332.y);
    let _e335 = u_xlat23_;
    u_xlatu23_ = u32(i32(_e335));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e349 = u_xlatu_loop_1_;
        let _e350 = u_xlatu23_;
        if !((_e349 < _e350)) {
            break;
        }
        {
            let _e356 = u_xlatu_loop_1_;
            u_xlatu25_ = (_e356 >> 2u);
            let _e359 = u_xlatu_loop_1_;
            u_xlati5_ = i32((_e359 & 3u));
            let _e363 = u_xlatu25_;
            let _e369 = _f_buffer2_.f_cb2_[(i32(_e363) + 12i)];
            let _e370 = u_xlati5_;
            let _e374 = local_1[_e370];
            u_xlat25_ = dot(_e369, bitcast<vec4<f32>>(_e374));
            let _e377 = u_xlat25_;
            u_xlati25_ = i32(_e377);
            let _e379 = u_xlat5_;
            let _e381 = vs_TEXCOORD2_1;
            let _e384 = u_xlati25_;
            let _e387 = _f_buffer1_.f_cb1_[_e384];
            let _e390 = u_xlati25_;
            let _e393 = _f_buffer1_.f_cb1_[_e390];
            let _e395 = ((-(_e381.xyz) * _e387.www) + _e393.xyz);
            u_xlat5_.x = _e395.x;
            u_xlat5_.y = _e395.y;
            u_xlat5_.z = _e395.z;
            let _e402 = u_xlat5_;
            let _e404 = u_xlat5_;
            u_xlat26_ = dot(_e402.xyz, _e404.xyz);
            let _e407 = u_xlat26_;
            u_xlat26_ = max(_e407, 0.000061035156f);
            let _e411 = u_xlat26_;
            u_xlat6_.x = inverseSqrt(_e411);
            let _e413 = u_xlat5_;
            let _e415 = u_xlat5_;
            let _e417 = u_xlat6_;
            let _e419 = (_e415.xyz * _e417.xxx);
            u_xlat5_.x = _e419.x;
            u_xlat5_.y = _e419.y;
            u_xlat5_.z = _e419.z;
            let _e429 = u_xlati25_;
            let _e434 = _f_buffer1_.f_cb1_[(_e429 + 512i)];
            u_xlat6_.x = (1f / _e434.x);
            let _e437 = u_xlat26_;
            u_xlat26_ = (_e437 * 25f);
            let _e440 = u_xlat26_;
            let _e441 = u_xlat6_;
            u_xlat26_ = (_e440 / _e441.x);
            let _e444 = u_xlat26_;
            u_xlat26_ = (_e444 + 1f);
            let _e449 = u_xlat26_;
            u_xlat26_ = (1f / _e449);
            let _e452 = u_xlati25_;
            let _e457 = _f_buffer1_.f_cb1_[(_e452 + 768i)];
            let _e459 = u_xlat5_;
            u_xlat6_.x = dot(_e457.xyz, _e459.xyz);
            let _e463 = u_xlat6_;
            let _e465 = u_xlati25_;
            let _e470 = _f_buffer1_.f_cb1_[(_e465 + 512i)];
            let _e473 = u_xlati25_;
            let _e478 = _f_buffer1_.f_cb1_[(_e473 + 512i)];
            u_xlat6_.x = ((_e463.x * _e470.z) + _e478.w);
            let _e482 = u_xlat6_;
            u_xlat6_.x = clamp(_e482.x, 0f, 1f);
            let _e488 = u_xlat6_;
            let _e490 = u_xlat6_;
            u_xlat6_.x = (_e488.x * _e490.x);
            let _e493 = u_xlat26_;
            let _e494 = u_xlat6_;
            u_xlat26_ = (_e493 * _e494.x);
            let _e497 = u_xlat6_;
            let _e499 = u_xlat26_;
            let _e501 = u_xlati25_;
            let _e506 = _f_buffer1_.f_cb1_[(_e501 + 256i)];
            let _e508 = (vec3(_e499) * _e506.xyz);
            u_xlat6_.x = _e508.x;
            u_xlat6_.y = _e508.y;
            u_xlat6_.z = _e508.z;
            let _e515 = u_xlat2_;
            let _e517 = u_xlat5_;
            u_xlat25_ = dot(_e515.xyz, _e517.xyz);
            let _e520 = u_xlat25_;
            u_xlat25_ = clamp(_e520, 0f, 1f);
            let _e524 = u_xlat4_;
            let _e526 = u_xlat6_;
            let _e528 = u_xlat25_;
            let _e531 = u_xlat4_;
            let _e533 = ((_e526.xyz * vec3(_e528)) + _e531.xyz);
            u_xlat4_.x = _e533.x;
            u_xlat4_.y = _e533.y;
            u_xlat4_.z = _e533.z;
        }
        continuing {
            let _e353 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e353 + 1u);
        }
    }
    let _e540 = u_xlat2_;
    let _e542 = u_xlat3_;
    let _e544 = u_xlat1_;
    let _e547 = u_xlat4_;
    let _e549 = ((_e542.xyz * _e544.xxx) + _e547.xyz);
    u_xlat2_.x = _e549.x;
    u_xlat2_.y = _e549.y;
    u_xlat2_.z = _e549.z;
    let _e560 = _f_buffer2_.f_cb2_[27];
    u_xlat3_.x = abs(_e560.w);
    let _e567 = _f_buffer2_.f_cb2_[28];
    u_xlat3_.y = abs(_e567.w);
    let _e574 = _f_buffer2_.f_cb2_[29];
    u_xlat3_.z = abs(_e574.w);
    let _e577 = u_xlat3_;
    let _e579 = u_xlat3_;
    let _e581 = log2(_e579.xyz);
    u_xlat3_.x = _e581.x;
    u_xlat3_.y = _e581.y;
    u_xlat3_.z = _e581.z;
    let _e588 = u_xlat3_;
    let _e590 = u_xlat3_;
    let _e596 = (_e590.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e596.x;
    u_xlat3_.y = _e596.y;
    u_xlat3_.z = _e596.z;
    let _e603 = u_xlat3_;
    let _e605 = u_xlat3_;
    let _e607 = exp2(_e605.xyz);
    u_xlat3_.x = _e607.x;
    u_xlat3_.y = _e607.y;
    u_xlat3_.z = _e607.z;
    let _e614 = u_xlat3_;
    let _e616 = u_xlat3_;
    let _e630 = ((_e616.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e630.x;
    u_xlat3_.y = _e630.y;
    u_xlat3_.z = _e630.z;
    let _e637 = u_xlat3_;
    let _e639 = u_xlat3_;
    let _e645 = clamp(_e639.xyz, vec3(0f), vec3(1f));
    u_xlat3_.x = _e645.x;
    u_xlat3_.y = _e645.y;
    u_xlat3_.z = _e645.z;
    let _e652 = u_xlat2_;
    let _e654 = u_xlat2_;
    let _e656 = u_xlat3_;
    let _e658 = (_e654.xyz + _e656.xyz);
    u_xlat2_.x = _e658.x;
    u_xlat2_.y = _e658.y;
    u_xlat2_.z = _e658.z;
    let _e665 = SV_Target0_;
    let _e667 = u_xlat8_;
    let _e669 = u_xlat2_;
    let _e672 = u_xlat0_;
    let _e674 = ((_e667.xyz * _e669.xyz) + _e672.xyz);
    SV_Target0_.x = _e674.x;
    SV_Target0_.y = _e674.y;
    SV_Target0_.z = _e674.z;
    let _e682 = u_xlat0_;
    SV_Target0_.w = _e682.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e55 = SV_Target0_;
    return FragmentOutput(_e55);
}
