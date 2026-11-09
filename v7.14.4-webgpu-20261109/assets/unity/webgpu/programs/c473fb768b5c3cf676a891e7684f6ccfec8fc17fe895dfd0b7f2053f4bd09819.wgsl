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
    f_cb4_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

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
    var local_7: f32;
    var txVec0_: vec3<f32>;
    var local_8: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_9: array<vec4<u32>, 4> = ImmCB_0_;

    let _e105 = vs_TEXCOORD0_1;
    let _e110 = _f_buffer0_.f_cb0_[4];
    let _e115 = hscard_bias.values[1];
    let _e118 = textureSampleBias(f_t1_, samplerf_s1_, _e105.xy, (_e110.x + _e115.x));
    u_xlat0_ = _e118;
    let _e120 = vs_TEXCOORD0_1;
    let _e122 = dpdx(_e120.x);
    u_xlat1_.x = _e122;
    let _e124 = vs_TEXCOORD0_1;
    let _e126 = dpdy(_e124.x);
    u_xlat7_.x = _e126;
    let _e128 = u_xlat7_;
    let _e131 = u_xlat1_;
    u_xlat1_.x = (abs(_e128.x) + abs(_e131.x));
    let _e135 = u_xlat1_;
    let _e145 = vs_TEXCOORD0_1;
    u_xlat1_ = ((_e135.xxxx * vec4<f32>(-0.5f, -0.5f, 0.5f, 0.5f)) + _e145.xyxy);
    let _e148 = u_xlat1_;
    let _e153 = _f_buffer0_.f_cb0_[4];
    let _e158 = hscard_bias.values[1];
    let _e161 = textureSampleBias(f_t1_, samplerf_s1_, _e148.xy, (_e153.x + _e158.x));
    u_xlat2_ = _e161;
    let _e162 = u_xlat0_;
    let _e163 = u_xlat2_;
    u_xlat0_ = (_e162 + _e163);
    let _e165 = u_xlat1_;
    let _e170 = _f_buffer0_.f_cb0_[4];
    let _e175 = hscard_bias.values[1];
    let _e178 = textureSampleBias(f_t1_, samplerf_s1_, _e165.zw, (_e170.x + _e175.x));
    u_xlat1_ = _e178;
    let _e179 = u_xlat0_;
    let _e180 = u_xlat1_;
    u_xlat0_ = (_e179 + _e180);
    let _e182 = u_xlat0_;
    u_xlat0_ = (_e182 * vec4<f32>(0.33333334f, 0.33333334f, 0.33333334f, 0.33333334f));
    let _e194 = _f_buffer4_.f_cb4_[1];
    u_xlatb1_.x = (0f < _e194.x);
    let _e197 = u_xlatb1_;
    if _e197.x {
        {
            let _e199 = vs_TEXCOORD5_1;
            let _e204 = _f_buffer0_.f_cb0_[4];
            let _e209 = hscard_bias.values[2];
            let _e212 = textureSampleBias(f_t2_, samplerf_s2_, _e199.xy, (_e204.x + _e209.x));
            u_xlat1_ = _e212;
            let _e217 = _f_buffer4_.f_cb4_[3];
            let _e219 = u_xlat1_;
            u_xlatb1_.x = (_e217.x < _e219.x);
            let _e223 = u_xlatb1_;
            if _e223.x {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e229 = local;
            u_xlat1_.x = _e229;
            let _e231 = u_xlat0_;
            let _e233 = u_xlat1_;
            u_xlat0_.w = (_e231.w * _e233.x);
        }
    }
    let _e236 = u_xlat1_;
    let _e238 = vs_TEXCOORD1_1;
    let _e243 = _f_buffer3_.f_cb3_[20];
    let _e246 = (_e238.xyz + -(_e243.xyz));
    u_xlat1_.x = _e246.x;
    u_xlat1_.y = _e246.y;
    u_xlat1_.z = _e246.z;
    let _e253 = u_xlat2_;
    let _e255 = vs_TEXCOORD1_1;
    let _e260 = _f_buffer3_.f_cb3_[21];
    let _e263 = (_e255.xyz + -(_e260.xyz));
    u_xlat2_.x = _e263.x;
    u_xlat2_.y = _e263.y;
    u_xlat2_.z = _e263.z;
    let _e270 = u_xlat3_;
    let _e272 = vs_TEXCOORD1_1;
    let _e277 = _f_buffer3_.f_cb3_[22];
    let _e280 = (_e272.xyz + -(_e277.xyz));
    u_xlat3_.x = _e280.x;
    u_xlat3_.y = _e280.y;
    u_xlat3_.z = _e280.z;
    let _e287 = u_xlat4_;
    let _e289 = vs_TEXCOORD1_1;
    let _e294 = _f_buffer3_.f_cb3_[23];
    let _e297 = (_e289.xyz + -(_e294.xyz));
    u_xlat4_.x = _e297.x;
    u_xlat4_.y = _e297.y;
    u_xlat4_.z = _e297.z;
    let _e305 = u_xlat1_;
    let _e307 = u_xlat1_;
    u_xlat1_.x = dot(_e305.xyz, _e307.xyz);
    let _e311 = u_xlat2_;
    let _e313 = u_xlat2_;
    u_xlat1_.y = dot(_e311.xyz, _e313.xyz);
    let _e317 = u_xlat3_;
    let _e319 = u_xlat3_;
    u_xlat1_.z = dot(_e317.xyz, _e319.xyz);
    let _e323 = u_xlat4_;
    let _e325 = u_xlat4_;
    u_xlat1_.w = dot(_e323.xyz, _e325.xyz);
    let _e328 = u_xlat1_;
    let _e332 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e328 < _e332);
    let _e335 = u_xlatb1_;
    if _e335.x {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e341 = local_1;
    u_xlat2_.x = _e341;
    let _e343 = u_xlatb1_;
    if _e343.y {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e349 = local_2;
    u_xlat2_.y = _e349;
    let _e351 = u_xlatb1_;
    if _e351.z {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e357 = local_3;
    u_xlat2_.z = _e357;
    let _e359 = u_xlatb1_;
    if _e359.w {
        local_4 = 1f;
    } else {
        local_4 = 0f;
    }
    let _e365 = local_4;
    u_xlat2_.w = _e365;
    let _e367 = u_xlatb1_;
    if _e367.x {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e376 = local_5;
    u_xlat1_.x = _e376;
    let _e378 = u_xlatb1_;
    if _e378.y {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e387 = local_6;
    u_xlat1_.y = _e387;
    let _e389 = u_xlatb1_;
    if _e389.z {
        local_7 = -1f;
    } else {
        local_7 = -0f;
    }
    let _e398 = local_7;
    u_xlat1_.z = _e398;
    let _e399 = u_xlat1_;
    let _e401 = u_xlat1_;
    let _e403 = u_xlat2_;
    let _e405 = (_e401.xyz + _e403.yzw);
    u_xlat1_.x = _e405.x;
    u_xlat1_.y = _e405.y;
    u_xlat1_.z = _e405.z;
    let _e412 = u_xlat2_;
    let _e414 = u_xlat1_;
    let _e420 = max(_e414.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e420.x;
    u_xlat2_.z = _e420.y;
    u_xlat2_.w = _e420.z;
    let _e428 = u_xlat2_;
    u_xlat1_.x = dot(_e428, vec4<f32>(4f, 3f, 2f, 1f));
    let _e436 = u_xlat1_;
    u_xlat1_.x = (-(_e436.x) + 4f);
    let _e441 = u_xlat1_;
    u_xlatu1_ = u32(_e441.x);
    let _e444 = u_xlatu1_;
    u_xlati1_ = (i32(_e444) << 2u);
    let _e449 = u_xlat7_;
    let _e451 = vs_TEXCOORD1_1;
    let _e453 = u_xlati1_;
    let _e458 = _f_buffer3_.f_cb3_[(_e453 + 1i)];
    let _e460 = (_e451.yyy * _e458.xyz);
    u_xlat7_.x = _e460.x;
    u_xlat7_.y = _e460.y;
    u_xlat7_.z = _e460.z;
    let _e467 = u_xlat7_;
    let _e469 = u_xlati1_;
    let _e472 = _f_buffer3_.f_cb3_[_e469];
    let _e474 = vs_TEXCOORD1_1;
    let _e477 = u_xlat7_;
    let _e479 = ((_e472.xyz * _e474.xxx) + _e477.xyz);
    u_xlat7_.x = _e479.x;
    u_xlat7_.y = _e479.y;
    u_xlat7_.z = _e479.z;
    let _e486 = u_xlat7_;
    let _e488 = u_xlati1_;
    let _e493 = _f_buffer3_.f_cb3_[(_e488 + 2i)];
    let _e495 = vs_TEXCOORD1_1;
    let _e498 = u_xlat7_;
    let _e500 = ((_e493.xyz * _e495.zzz) + _e498.xyz);
    u_xlat7_.x = _e500.x;
    u_xlat7_.y = _e500.y;
    u_xlat7_.z = _e500.z;
    let _e507 = u_xlat1_;
    let _e509 = u_xlat7_;
    let _e511 = u_xlati1_;
    let _e516 = _f_buffer3_.f_cb3_[(_e511 + 3i)];
    let _e518 = (_e509.xyz + _e516.xyz);
    u_xlat1_.x = _e518.x;
    u_xlat1_.y = _e518.y;
    u_xlat1_.z = _e518.z;
    let _e525 = vs_NORMAL0_1;
    let _e527 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e525.xyz, _e527.xyz);
    let _e530 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e530);
    let _e532 = u_xlat2_;
    let _e534 = u_xlat19_;
    let _e536 = vs_NORMAL0_1;
    let _e538 = (vec3(_e534) * _e536.xyz);
    u_xlat2_.x = _e538.x;
    u_xlat2_.y = _e538.y;
    u_xlat2_.z = _e538.z;
    let _e545 = u_xlat1_;
    let _e546 = _e545.xy;
    let _e547 = u_xlat1_;
    txVec0_ = vec3<f32>(_e546.x, _e546.y, _e547.z);
    let _e554 = txVec0_;
    let _e558 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e554.xy, _e554.z);
    u_xlat1_.x = _e558;
    let _e563 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e563.x) + 1f);
    let _e569 = u_xlat1_;
    let _e574 = _f_buffer3_.f_cb3_[27];
    let _e577 = u_xlat7_;
    u_xlat1_.x = ((_e569.x * _e574.x) + _e577.x);
    let _e581 = u_xlat1_;
    u_xlatb7_ = (0f >= _e581.z);
    let _e584 = u_xlat1_;
    u_xlatb13_ = (_e584.z >= 1f);
    let _e588 = u_xlatb13_;
    let _e589 = u_xlatb7_;
    u_xlatb7_ = (_e588 || _e589);
    let _e592 = u_xlatb7_;
    if _e592 {
        local_8 = 1f;
    } else {
        let _e594 = u_xlat1_;
        local_8 = _e594.x;
    }
    let _e597 = local_8;
    u_xlat1_.x = _e597;
    let _e599 = u_xlat1_;
    let _e604 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e599.x * _e604.z);
    let _e607 = u_xlat1_;
    let _e609 = u_xlat1_;
    let _e614 = _f_buffer0_.f_cb0_[6];
    let _e616 = (_e609.xxx * _e614.xyz);
    u_xlat1_.x = _e616.x;
    u_xlat1_.y = _e616.y;
    u_xlat1_.z = _e616.z;
    let _e623 = u_xlat2_;
    let _e628 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e623.xyz, _e628.xyz);
    let _e631 = u_xlat19_;
    u_xlat19_ = clamp(_e631, 0f, 1f);
    let _e638 = _f_buffer0_.f_cb0_[10];
    let _e643 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e638.x, _e643.y);
    let _e646 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e646));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e661 = u_xlatu_loop_1_;
        let _e662 = u_xlatu20_;
        if !((_e661 < _e662)) {
            break;
        }
        {
            let _e668 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e668 >> 2u);
            let _e671 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e671 & 3u));
            let _e676 = u_xlatu4_;
            let _e682 = _f_buffer2_.f_cb2_[(i32(_e676) + 12i)];
            let _e683 = u_xlati10_;
            let _e687 = local_9[_e683];
            u_xlat4_.x = dot(_e682, bitcast<vec4<f32>>(_e687));
            let _e690 = u_xlat4_;
            u_xlati4_ = i32(_e690.x);
            let _e693 = u_xlat10_;
            let _e695 = vs_TEXCOORD1_1;
            let _e698 = u_xlati4_;
            let _e701 = _f_buffer1_.f_cb1_[_e698];
            let _e704 = u_xlati4_;
            let _e707 = _f_buffer1_.f_cb1_[_e704];
            let _e709 = ((-(_e695.xyz) * _e701.www) + _e707.xyz);
            u_xlat10_.x = _e709.x;
            u_xlat10_.y = _e709.y;
            u_xlat10_.z = _e709.z;
            let _e717 = u_xlat10_;
            let _e719 = u_xlat10_;
            u_xlat5_.x = dot(_e717.xyz, _e719.xyz);
            let _e723 = u_xlat5_;
            u_xlat5_.x = max(_e723.x, 0.000061035156f);
            let _e727 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e727.x);
            let _e730 = u_xlat10_;
            let _e732 = u_xlat10_;
            let _e734 = u_xlat11_;
            let _e736 = (_e732.xyz * vec3(_e734));
            u_xlat10_.x = _e736.x;
            u_xlat10_.y = _e736.y;
            u_xlat10_.z = _e736.z;
            let _e745 = u_xlati4_;
            let _e750 = _f_buffer1_.f_cb1_[(_e745 + 512i)];
            u_xlat11_ = (1f / _e750.x);
            let _e754 = u_xlat5_;
            u_xlat5_.x = (_e754.x * 25f);
            let _e759 = u_xlat5_;
            let _e761 = u_xlat11_;
            u_xlat5_.x = (_e759.x / _e761);
            let _e764 = u_xlat5_;
            u_xlat5_.x = (_e764.x + 1f);
            let _e771 = u_xlat5_;
            u_xlat5_.x = (1f / _e771.x);
            let _e774 = u_xlati4_;
            let _e779 = _f_buffer1_.f_cb1_[(_e774 + 768i)];
            let _e781 = u_xlat10_;
            u_xlat11_ = dot(_e779.xyz, _e781.xyz);
            let _e784 = u_xlat11_;
            let _e785 = u_xlati4_;
            let _e790 = _f_buffer1_.f_cb1_[(_e785 + 512i)];
            let _e793 = u_xlati4_;
            let _e798 = _f_buffer1_.f_cb1_[(_e793 + 512i)];
            u_xlat11_ = ((_e784 * _e790.z) + _e798.w);
            let _e801 = u_xlat11_;
            u_xlat11_ = clamp(_e801, 0f, 1f);
            let _e805 = u_xlat11_;
            let _e806 = u_xlat11_;
            u_xlat11_ = (_e805 * _e806);
            let _e809 = u_xlat11_;
            let _e810 = u_xlat5_;
            u_xlat5_.x = (_e809 * _e810.x);
            let _e813 = u_xlat5_;
            let _e815 = u_xlat5_;
            let _e817 = u_xlati4_;
            let _e822 = _f_buffer1_.f_cb1_[(_e817 + 256i)];
            let _e824 = (_e815.xxx * _e822.xyz);
            u_xlat5_.x = _e824.x;
            u_xlat5_.y = _e824.y;
            u_xlat5_.z = _e824.z;
            let _e832 = u_xlat2_;
            let _e834 = u_xlat10_;
            u_xlat4_.x = dot(_e832.xyz, _e834.xyz);
            let _e838 = u_xlat4_;
            u_xlat4_.x = clamp(_e838.x, 0f, 1f);
            let _e843 = u_xlat3_;
            let _e845 = u_xlat5_;
            let _e847 = u_xlat4_;
            let _e850 = u_xlat3_;
            let _e852 = ((_e845.xyz * _e847.xxx) + _e850.xyz);
            u_xlat3_.x = _e852.x;
            u_xlat3_.y = _e852.y;
            u_xlat3_.z = _e852.z;
        }
        continuing {
            let _e665 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e665 + 1u);
        }
    }
    let _e859 = u_xlat1_;
    let _e861 = u_xlat1_;
    let _e863 = u_xlat19_;
    let _e866 = u_xlat3_;
    let _e868 = ((_e861.xyz * vec3(_e863)) + _e866.xyz);
    u_xlat1_.x = _e868.x;
    u_xlat1_.y = _e868.y;
    u_xlat1_.z = _e868.z;
    let _e879 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e879.w);
    let _e886 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e886.w);
    let _e893 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e893.w);
    let _e896 = u_xlat2_;
    let _e898 = u_xlat2_;
    let _e900 = log2(_e898.xyz);
    u_xlat2_.x = _e900.x;
    u_xlat2_.y = _e900.y;
    u_xlat2_.z = _e900.z;
    let _e907 = u_xlat2_;
    let _e909 = u_xlat2_;
    let _e915 = (_e909.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e915.x;
    u_xlat2_.y = _e915.y;
    u_xlat2_.z = _e915.z;
    let _e922 = u_xlat2_;
    let _e924 = u_xlat2_;
    let _e926 = exp2(_e924.xyz);
    u_xlat2_.x = _e926.x;
    u_xlat2_.y = _e926.y;
    u_xlat2_.z = _e926.z;
    let _e933 = u_xlat2_;
    let _e935 = u_xlat2_;
    let _e949 = ((_e935.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e949.x;
    u_xlat2_.y = _e949.y;
    u_xlat2_.z = _e949.z;
    let _e956 = u_xlat2_;
    let _e958 = u_xlat2_;
    let _e964 = clamp(_e958.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e964.x;
    u_xlat2_.y = _e964.y;
    u_xlat2_.z = _e964.z;
    let _e971 = u_xlat1_;
    let _e973 = u_xlat1_;
    let _e975 = u_xlat2_;
    let _e977 = (_e973.xyz + _e975.xyz);
    u_xlat1_.x = _e977.x;
    u_xlat1_.y = _e977.y;
    u_xlat1_.z = _e977.z;
    let _e984 = u_xlat1_;
    let _e986 = u_xlat0_;
    let _e988 = u_xlat1_;
    let _e990 = (_e986.xyz * _e988.xyz);
    u_xlat1_.x = _e990.x;
    u_xlat1_.y = _e990.y;
    u_xlat1_.z = _e990.z;
    let _e997 = u_xlat0_;
    let _e999 = u_xlat0_;
    let _e1001 = u_xlat1_;
    let _e1003 = (_e999.www * _e1001.xyz);
    u_xlat0_.x = _e1003.x;
    u_xlat0_.y = _e1003.y;
    u_xlat0_.z = _e1003.z;
    let _e1010 = u_xlat0_;
    SV_Target0_ = _e1010;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e51 = SV_Target0_;
    return FragmentOutput(_e51);
}
