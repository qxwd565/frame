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
    f_cb4_: array<vec4<f32>, 2>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlati1_: i32 = 0i;
    var u_xlatu1_: u32 = 0u;
    var u_xlatb1_: vec4<bool> = vec4(false);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlatb7_: bool = false;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlatb13_: bool = false;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;
    var txVec0_: vec3<f32>;
    var local_7: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_8: array<vec4<u32>, 4> = ImmCB_0_;

    let _e102 = vs_TEXCOORD0_1;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[1];
    let _e115 = textureSampleBias(f_t1_, samplerf_s1_, _e102.xy, (_e107.x + _e112.x));
    u_xlat0_ = _e115;
    let _e116 = u_xlat1_;
    let _e118 = vs_TEXCOORD1_1;
    let _e123 = _f_buffer3_.f_cb3_[20];
    let _e126 = (_e118.xyz + -(_e123.xyz));
    u_xlat1_.x = _e126.x;
    u_xlat1_.y = _e126.y;
    u_xlat1_.z = _e126.z;
    let _e133 = u_xlat2_;
    let _e135 = vs_TEXCOORD1_1;
    let _e140 = _f_buffer3_.f_cb3_[21];
    let _e143 = (_e135.xyz + -(_e140.xyz));
    u_xlat2_.x = _e143.x;
    u_xlat2_.y = _e143.y;
    u_xlat2_.z = _e143.z;
    let _e150 = u_xlat3_;
    let _e152 = vs_TEXCOORD1_1;
    let _e157 = _f_buffer3_.f_cb3_[22];
    let _e160 = (_e152.xyz + -(_e157.xyz));
    u_xlat3_.x = _e160.x;
    u_xlat3_.y = _e160.y;
    u_xlat3_.z = _e160.z;
    let _e167 = u_xlat4_;
    let _e169 = vs_TEXCOORD1_1;
    let _e174 = _f_buffer3_.f_cb3_[23];
    let _e177 = (_e169.xyz + -(_e174.xyz));
    u_xlat4_.x = _e177.x;
    u_xlat4_.y = _e177.y;
    u_xlat4_.z = _e177.z;
    let _e185 = u_xlat1_;
    let _e187 = u_xlat1_;
    u_xlat1_.x = dot(_e185.xyz, _e187.xyz);
    let _e191 = u_xlat2_;
    let _e193 = u_xlat2_;
    u_xlat1_.y = dot(_e191.xyz, _e193.xyz);
    let _e197 = u_xlat3_;
    let _e199 = u_xlat3_;
    u_xlat1_.z = dot(_e197.xyz, _e199.xyz);
    let _e203 = u_xlat4_;
    let _e205 = u_xlat4_;
    u_xlat1_.w = dot(_e203.xyz, _e205.xyz);
    let _e208 = u_xlat1_;
    let _e212 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e208 < _e212);
    let _e215 = u_xlatb1_;
    if _e215.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e221 = local;
    u_xlat2_.x = _e221;
    let _e223 = u_xlatb1_;
    if _e223.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e229 = local_1;
    u_xlat2_.y = _e229;
    let _e231 = u_xlatb1_;
    if _e231.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e237 = local_2;
    u_xlat2_.z = _e237;
    let _e239 = u_xlatb1_;
    if _e239.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e245 = local_3;
    u_xlat2_.w = _e245;
    let _e247 = u_xlatb1_;
    if _e247.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e256 = local_4;
    u_xlat1_.x = _e256;
    let _e258 = u_xlatb1_;
    if _e258.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e267 = local_5;
    u_xlat1_.y = _e267;
    let _e269 = u_xlatb1_;
    if _e269.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e278 = local_6;
    u_xlat1_.z = _e278;
    let _e279 = u_xlat1_;
    let _e281 = u_xlat1_;
    let _e283 = u_xlat2_;
    let _e285 = (_e281.xyz + _e283.yzw);
    u_xlat1_.x = _e285.x;
    u_xlat1_.y = _e285.y;
    u_xlat1_.z = _e285.z;
    let _e292 = u_xlat2_;
    let _e294 = u_xlat1_;
    let _e300 = max(_e294.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e300.x;
    u_xlat2_.z = _e300.y;
    u_xlat2_.w = _e300.z;
    let _e308 = u_xlat2_;
    u_xlat1_.x = dot(_e308, vec4<f32>(4f, 3f, 2f, 1f));
    let _e316 = u_xlat1_;
    u_xlat1_.x = (-(_e316.x) + 4f);
    let _e321 = u_xlat1_;
    u_xlatu1_ = u32(_e321.x);
    let _e324 = u_xlatu1_;
    u_xlati1_ = (i32(_e324) << 2u);
    let _e329 = u_xlat7_;
    let _e331 = vs_TEXCOORD1_1;
    let _e333 = u_xlati1_;
    let _e338 = _f_buffer3_.f_cb3_[(_e333 + 1i)];
    let _e340 = (_e331.yyy * _e338.xyz);
    u_xlat7_.x = _e340.x;
    u_xlat7_.y = _e340.y;
    u_xlat7_.z = _e340.z;
    let _e347 = u_xlat7_;
    let _e349 = u_xlati1_;
    let _e352 = _f_buffer3_.f_cb3_[_e349];
    let _e354 = vs_TEXCOORD1_1;
    let _e357 = u_xlat7_;
    let _e359 = ((_e352.xyz * _e354.xxx) + _e357.xyz);
    u_xlat7_.x = _e359.x;
    u_xlat7_.y = _e359.y;
    u_xlat7_.z = _e359.z;
    let _e366 = u_xlat7_;
    let _e368 = u_xlati1_;
    let _e373 = _f_buffer3_.f_cb3_[(_e368 + 2i)];
    let _e375 = vs_TEXCOORD1_1;
    let _e378 = u_xlat7_;
    let _e380 = ((_e373.xyz * _e375.zzz) + _e378.xyz);
    u_xlat7_.x = _e380.x;
    u_xlat7_.y = _e380.y;
    u_xlat7_.z = _e380.z;
    let _e387 = u_xlat1_;
    let _e389 = u_xlat7_;
    let _e391 = u_xlati1_;
    let _e396 = _f_buffer3_.f_cb3_[(_e391 + 3i)];
    let _e398 = (_e389.xyz + _e396.xyz);
    u_xlat1_.x = _e398.x;
    u_xlat1_.y = _e398.y;
    u_xlat1_.z = _e398.z;
    let _e405 = vs_NORMAL0_1;
    let _e407 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e405.xyz, _e407.xyz);
    let _e410 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e410);
    let _e412 = u_xlat2_;
    let _e414 = u_xlat19_;
    let _e416 = vs_NORMAL0_1;
    let _e418 = (vec3(_e414) * _e416.xyz);
    u_xlat2_.x = _e418.x;
    u_xlat2_.y = _e418.y;
    u_xlat2_.z = _e418.z;
    let _e425 = u_xlat1_;
    let _e426 = _e425.xy;
    let _e427 = u_xlat1_;
    txVec0_ = vec3<f32>(_e426.x, _e426.y, _e427.z);
    let _e434 = txVec0_;
    let _e438 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e434.xy, _e434.z);
    u_xlat1_.x = _e438;
    let _e443 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e443.x) + 1f);
    let _e449 = u_xlat1_;
    let _e454 = _f_buffer3_.f_cb3_[27];
    let _e457 = u_xlat7_;
    u_xlat1_.x = ((_e449.x * _e454.x) + _e457.x);
    let _e461 = u_xlat1_;
    u_xlatb7_ = (0f >= _e461.z);
    let _e464 = u_xlat1_;
    u_xlatb13_ = (_e464.z >= 1f);
    let _e468 = u_xlatb13_;
    let _e469 = u_xlatb7_;
    u_xlatb7_ = (_e468 || _e469);
    let _e472 = u_xlatb7_;
    if _e472 {
        local_7 = 1f;
    } else {
        let _e474 = u_xlat1_;
        local_7 = _e474.x;
    }
    let _e477 = local_7;
    u_xlat1_.x = _e477;
    let _e479 = u_xlat1_;
    let _e484 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e479.x * _e484.z);
    let _e487 = u_xlat1_;
    let _e489 = u_xlat1_;
    let _e494 = _f_buffer0_.f_cb0_[6];
    let _e496 = (_e489.xxx * _e494.xyz);
    u_xlat1_.x = _e496.x;
    u_xlat1_.y = _e496.y;
    u_xlat1_.z = _e496.z;
    let _e503 = u_xlat2_;
    let _e508 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e503.xyz, _e508.xyz);
    let _e511 = u_xlat19_;
    u_xlat19_ = clamp(_e511, 0f, 1f);
    let _e518 = _f_buffer0_.f_cb0_[10];
    let _e523 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e518.x, _e523.y);
    let _e526 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e526));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e541 = u_xlatu_loop_1_;
        let _e542 = u_xlatu20_;
        if !((_e541 < _e542)) {
            break;
        }
        {
            let _e548 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e548 >> 2u);
            let _e551 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e551 & 3u));
            let _e556 = u_xlatu4_;
            let _e562 = _f_buffer2_.f_cb2_[(i32(_e556) + 12i)];
            let _e563 = u_xlati10_;
            let _e567 = local_8[_e563];
            u_xlat4_.x = dot(_e562, bitcast<vec4<f32>>(_e567));
            let _e570 = u_xlat4_;
            u_xlati4_ = i32(_e570.x);
            let _e573 = u_xlat10_;
            let _e575 = vs_TEXCOORD1_1;
            let _e578 = u_xlati4_;
            let _e581 = _f_buffer1_.f_cb1_[_e578];
            let _e584 = u_xlati4_;
            let _e587 = _f_buffer1_.f_cb1_[_e584];
            let _e589 = ((-(_e575.xyz) * _e581.www) + _e587.xyz);
            u_xlat10_.x = _e589.x;
            u_xlat10_.y = _e589.y;
            u_xlat10_.z = _e589.z;
            let _e597 = u_xlat10_;
            let _e599 = u_xlat10_;
            u_xlat5_.x = dot(_e597.xyz, _e599.xyz);
            let _e603 = u_xlat5_;
            u_xlat5_.x = max(_e603.x, 0.000061035156f);
            let _e607 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e607.x);
            let _e610 = u_xlat10_;
            let _e612 = u_xlat10_;
            let _e614 = u_xlat11_;
            let _e616 = (_e612.xyz * vec3(_e614));
            u_xlat10_.x = _e616.x;
            u_xlat10_.y = _e616.y;
            u_xlat10_.z = _e616.z;
            let _e625 = u_xlati4_;
            let _e630 = _f_buffer1_.f_cb1_[(_e625 + 512i)];
            u_xlat11_ = (1f / _e630.x);
            let _e634 = u_xlat5_;
            u_xlat5_.x = (_e634.x * 25f);
            let _e639 = u_xlat5_;
            let _e641 = u_xlat11_;
            u_xlat5_.x = (_e639.x / _e641);
            let _e644 = u_xlat5_;
            u_xlat5_.x = (_e644.x + 1f);
            let _e651 = u_xlat5_;
            u_xlat5_.x = (1f / _e651.x);
            let _e654 = u_xlati4_;
            let _e659 = _f_buffer1_.f_cb1_[(_e654 + 768i)];
            let _e661 = u_xlat10_;
            u_xlat11_ = dot(_e659.xyz, _e661.xyz);
            let _e664 = u_xlat11_;
            let _e665 = u_xlati4_;
            let _e670 = _f_buffer1_.f_cb1_[(_e665 + 512i)];
            let _e673 = u_xlati4_;
            let _e678 = _f_buffer1_.f_cb1_[(_e673 + 512i)];
            u_xlat11_ = ((_e664 * _e670.z) + _e678.w);
            let _e681 = u_xlat11_;
            u_xlat11_ = clamp(_e681, 0f, 1f);
            let _e685 = u_xlat11_;
            let _e686 = u_xlat11_;
            u_xlat11_ = (_e685 * _e686);
            let _e689 = u_xlat11_;
            let _e690 = u_xlat5_;
            u_xlat5_.x = (_e689 * _e690.x);
            let _e693 = u_xlat5_;
            let _e695 = u_xlat5_;
            let _e697 = u_xlati4_;
            let _e702 = _f_buffer1_.f_cb1_[(_e697 + 256i)];
            let _e704 = (_e695.xxx * _e702.xyz);
            u_xlat5_.x = _e704.x;
            u_xlat5_.y = _e704.y;
            u_xlat5_.z = _e704.z;
            let _e712 = u_xlat2_;
            let _e714 = u_xlat10_;
            u_xlat4_.x = dot(_e712.xyz, _e714.xyz);
            let _e718 = u_xlat4_;
            u_xlat4_.x = clamp(_e718.x, 0f, 1f);
            let _e723 = u_xlat3_;
            let _e725 = u_xlat5_;
            let _e727 = u_xlat4_;
            let _e730 = u_xlat3_;
            let _e732 = ((_e725.xyz * _e727.xxx) + _e730.xyz);
            u_xlat3_.x = _e732.x;
            u_xlat3_.y = _e732.y;
            u_xlat3_.z = _e732.z;
        }
        continuing {
            let _e545 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e545 + 1u);
        }
    }
    let _e739 = u_xlat1_;
    let _e741 = u_xlat1_;
    let _e743 = u_xlat19_;
    let _e746 = u_xlat3_;
    let _e748 = ((_e741.xyz * vec3(_e743)) + _e746.xyz);
    u_xlat1_.x = _e748.x;
    u_xlat1_.y = _e748.y;
    u_xlat1_.z = _e748.z;
    let _e759 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e759.w);
    let _e766 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e766.w);
    let _e773 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e773.w);
    let _e776 = u_xlat2_;
    let _e778 = u_xlat2_;
    let _e780 = log2(_e778.xyz);
    u_xlat2_.x = _e780.x;
    u_xlat2_.y = _e780.y;
    u_xlat2_.z = _e780.z;
    let _e787 = u_xlat2_;
    let _e789 = u_xlat2_;
    let _e795 = (_e789.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e795.x;
    u_xlat2_.y = _e795.y;
    u_xlat2_.z = _e795.z;
    let _e802 = u_xlat2_;
    let _e804 = u_xlat2_;
    let _e806 = exp2(_e804.xyz);
    u_xlat2_.x = _e806.x;
    u_xlat2_.y = _e806.y;
    u_xlat2_.z = _e806.z;
    let _e813 = u_xlat2_;
    let _e815 = u_xlat2_;
    let _e829 = ((_e815.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e829.x;
    u_xlat2_.y = _e829.y;
    u_xlat2_.z = _e829.z;
    let _e836 = u_xlat2_;
    let _e838 = u_xlat2_;
    let _e844 = clamp(_e838.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e844.x;
    u_xlat2_.y = _e844.y;
    u_xlat2_.z = _e844.z;
    let _e851 = u_xlat1_;
    let _e853 = u_xlat1_;
    let _e855 = u_xlat2_;
    let _e857 = (_e853.xyz + _e855.xyz);
    u_xlat1_.x = _e857.x;
    u_xlat1_.y = _e857.y;
    u_xlat1_.z = _e857.z;
    let _e864 = u_xlat1_;
    let _e866 = u_xlat0_;
    let _e868 = u_xlat1_;
    let _e871 = u_xlat0_;
    let _e874 = ((_e866.xyz * _e868.xyz) + -(_e871.xyz));
    u_xlat1_.x = _e874.x;
    u_xlat1_.y = _e874.y;
    u_xlat1_.z = _e874.z;
    let _e881 = SV_TARGET0_;
    let _e886 = _f_buffer4_.f_cb4_[1];
    let _e888 = u_xlat1_;
    let _e891 = u_xlat0_;
    let _e893 = ((_e886.xxx * _e888.xyz) + _e891.xyz);
    SV_TARGET0_.x = _e893.x;
    SV_TARGET0_.y = _e893.y;
    SV_TARGET0_.z = _e893.z;
    let _e901 = u_xlat0_;
    SV_TARGET0_.w = _e901.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e43 = SV_TARGET0_;
    return FragmentOutput(_e43);
}
