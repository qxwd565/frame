struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 22>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 1024>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 34>,
}

struct f_buffer3_ {
    f_cb3_: array<vec4<f32>, 6>,
}

struct f_buffer4_ {
    f_cb4_: array<vec4<f32>, 28>,
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
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler_comparison;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_depth_2d;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlati1_: i32 = 0i;
    var u_xlatu1_: u32 = 0u;
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlatb4_: vec4<bool> = vec4(false);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlatb6_: vec3<bool> = vec3(false);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlati9_: i32 = 0i;
    var u_xlatu9_: u32 = 0u;
    var u_xlatb9_: bool = false;
    var u_xlat18_: f32 = 0f;
    var u_xlat27_: f32 = 0f;
    var u_xlatu27_: u32 = 0u;
    var u_xlatb27_: bool = false;
    var u_xlat29_: f32 = 0f;
    var u_xlati29_: i32 = 0i;
    var u_xlat30_: f32 = 0f;
    var local: u32;
    var local_1: f32;
    var local_2: i32;
    var local_3: f32;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;
    var local_7: f32;
    var local_8: f32;
    var local_9: f32;
    var local_10: f32;
    var local_11: f32;
    var hlslcc_movcTemp: vec4<f32>;
    var local_12: f32;
    var local_13: f32;
    var local_14: f32;
    var txVec0_: vec3<f32>;
    var local_15: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_16: array<vec4<u32>, 4> = ImmCB_0_;
    var local_17: f32;

    let _e118 = vs_TEXCOORD0_1;
    let _e123 = _f_buffer0_.f_cb0_[4];
    let _e128 = hscard_bias.values[0];
    let _e131 = textureSampleBias(f_t0_, samplerf_s0_, _e118.xy, (_e123.x + _e128.x));
    u_xlat0_ = _e131;
    let _e132 = u_xlat0_;
    let _e137 = _f_buffer3_.f_cb3_[2];
    u_xlat1_ = (_e132.wxyz * _e137.wxyz);
    let _e143 = _f_buffer0_.f_cb0_[4];
    u_xlatb0_ = (_e143.z != 0f);
    let _e151 = _f_buffer3_.f_cb3_[5];
    if (0f >= _e151.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e158 = local;
    u_xlati9_ = i32(_e158);
    let _e160 = u_xlat1_;
    let _e162 = dpdx(_e160.x);
    u_xlat18_ = _e162;
    let _e164 = u_xlat1_;
    let _e166 = dpdy(_e164.x);
    u_xlat2_.x = _e166;
    let _e167 = u_xlat18_;
    let _e169 = u_xlat2_;
    u_xlat18_ = (abs(_e167) + abs(_e169.x));
    let _e173 = u_xlat0_;
    let _e178 = _f_buffer3_.f_cb3_[2];
    let _e184 = _f_buffer3_.f_cb3_[5];
    u_xlat27_ = ((_e173.w * _e178.w) + -(_e184.x));
    let _e189 = u_xlat18_;
    let _e193 = u_xlat27_;
    u_xlat2_.x = ((-(_e189) * 0.5f) + _e193);
    let _e195 = u_xlat18_;
    u_xlat18_ = max(_e195, 0.0001f);
    let _e198 = u_xlat2_;
    let _e200 = u_xlat18_;
    u_xlat18_ = (_e198.x / _e200);
    let _e202 = u_xlat18_;
    u_xlat18_ = (_e202 + 1f);
    let _e205 = u_xlat18_;
    u_xlat18_ = clamp(_e205, 0f, 1f);
    let _e209 = u_xlati9_;
    if (_e209 != 0i) {
        local_1 = 1f;
    } else {
        let _e213 = u_xlat18_;
        local_1 = _e213;
    }
    let _e215 = local_1;
    u_xlat18_ = _e215;
    let _e216 = u_xlati9_;
    u_xlati9_ = ~(_e216);
    let _e218 = u_xlatb0_;
    if _e218 {
        let _e219 = u_xlati9_;
        local_2 = _e219;
    } else {
        local_2 = 0i;
    }
    let _e223 = local_2;
    u_xlati9_ = _e223;
    let _e225 = u_xlat18_;
    u_xlat2_.x = (_e225 + -0.0001f);
    let _e229 = u_xlati9_;
    if (_e229 != 0i) {
        let _e232 = u_xlat2_;
        local_3 = _e232.x;
    } else {
        let _e234 = u_xlat27_;
        local_3 = _e234;
    }
    let _e236 = local_3;
    u_xlat9_ = _e236;
    let _e237 = u_xlatb0_;
    if _e237 {
        let _e238 = u_xlat18_;
        local_4 = _e238;
    } else {
        let _e239 = u_xlat1_;
        local_4 = _e239.x;
    }
    let _e242 = local_4;
    u_xlat18_ = _e242;
    let _e243 = u_xlat9_;
    u_xlatb9_ = (_e243 < 0f);
    let _e246 = u_xlatb9_;
    if ((select(0i, 1i, _e246) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e255 = vs_TEXCOORD0_1;
    let _e260 = _f_buffer0_.f_cb0_[4];
    let _e265 = hscard_bias.values[1];
    let _e268 = textureSampleBias(f_t1_, samplerf_s1_, _e255.xy, (_e260.x + _e265.x));
    u_xlat2_ = _e268;
    let _e269 = vs_TEXCOORD2_1;
    let _e271 = vs_TEXCOORD2_1;
    u_xlat9_ = dot(_e269.xyz, _e271.xyz);
    let _e274 = u_xlat9_;
    u_xlat9_ = inverseSqrt(_e274);
    let _e276 = u_xlat3_;
    let _e278 = u_xlat9_;
    let _e280 = vs_TEXCOORD2_1;
    let _e282 = (vec3(_e278) * _e280.xyz);
    u_xlat3_.x = _e282.x;
    u_xlat3_.y = _e282.y;
    u_xlat3_.z = _e282.z;
    let _e289 = u_xlat4_;
    let _e291 = vs_TEXCOORD1_1;
    let _e296 = _f_buffer4_.f_cb4_[20];
    let _e299 = (_e291.xyz + -(_e296.xyz));
    u_xlat4_.x = _e299.x;
    u_xlat4_.y = _e299.y;
    u_xlat4_.z = _e299.z;
    let _e306 = u_xlat5_;
    let _e308 = vs_TEXCOORD1_1;
    let _e313 = _f_buffer4_.f_cb4_[21];
    let _e316 = (_e308.xyz + -(_e313.xyz));
    u_xlat5_.x = _e316.x;
    u_xlat5_.y = _e316.y;
    u_xlat5_.z = _e316.z;
    let _e323 = u_xlat6_;
    let _e325 = vs_TEXCOORD1_1;
    let _e330 = _f_buffer4_.f_cb4_[22];
    let _e333 = (_e325.xyz + -(_e330.xyz));
    u_xlat6_.x = _e333.x;
    u_xlat6_.y = _e333.y;
    u_xlat6_.z = _e333.z;
    let _e340 = u_xlat7_;
    let _e342 = vs_TEXCOORD1_1;
    let _e347 = _f_buffer4_.f_cb4_[23];
    let _e350 = (_e342.xyz + -(_e347.xyz));
    u_xlat7_.x = _e350.x;
    u_xlat7_.y = _e350.y;
    u_xlat7_.z = _e350.z;
    let _e358 = u_xlat4_;
    let _e360 = u_xlat4_;
    u_xlat4_.x = dot(_e358.xyz, _e360.xyz);
    let _e364 = u_xlat5_;
    let _e366 = u_xlat5_;
    u_xlat4_.y = dot(_e364.xyz, _e366.xyz);
    let _e370 = u_xlat6_;
    let _e372 = u_xlat6_;
    u_xlat4_.z = dot(_e370.xyz, _e372.xyz);
    let _e376 = u_xlat7_;
    let _e378 = u_xlat7_;
    u_xlat4_.w = dot(_e376.xyz, _e378.xyz);
    let _e381 = u_xlat4_;
    let _e385 = _f_buffer4_.f_cb4_[24];
    u_xlatb4_ = (_e381 < _e385);
    let _e388 = u_xlatb4_;
    if _e388.x {
        local_5 = 1f;
    } else {
        local_5 = 0f;
    }
    let _e394 = local_5;
    u_xlat5_.x = _e394;
    let _e396 = u_xlatb4_;
    if _e396.y {
        local_6 = 1f;
    } else {
        local_6 = 0f;
    }
    let _e402 = local_6;
    u_xlat5_.y = _e402;
    let _e404 = u_xlatb4_;
    if _e404.z {
        local_7 = 1f;
    } else {
        local_7 = 0f;
    }
    let _e410 = local_7;
    u_xlat5_.z = _e410;
    let _e412 = u_xlatb4_;
    if _e412.w {
        local_8 = 1f;
    } else {
        local_8 = 0f;
    }
    let _e418 = local_8;
    u_xlat5_.w = _e418;
    let _e420 = u_xlatb4_;
    if _e420.x {
        local_9 = -1f;
    } else {
        local_9 = -0f;
    }
    let _e429 = local_9;
    u_xlat4_.x = _e429;
    let _e431 = u_xlatb4_;
    if _e431.y {
        local_10 = -1f;
    } else {
        local_10 = -0f;
    }
    let _e440 = local_10;
    u_xlat4_.y = _e440;
    let _e442 = u_xlatb4_;
    if _e442.z {
        local_11 = -1f;
    } else {
        local_11 = -0f;
    }
    let _e451 = local_11;
    u_xlat4_.z = _e451;
    let _e452 = u_xlat4_;
    let _e454 = u_xlat4_;
    let _e456 = u_xlat5_;
    let _e458 = (_e454.xyz + _e456.yzw);
    u_xlat4_.x = _e458.x;
    u_xlat4_.y = _e458.y;
    u_xlat4_.z = _e458.z;
    let _e465 = u_xlat5_;
    let _e467 = u_xlat4_;
    let _e473 = max(_e467.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat5_.y = _e473.x;
    u_xlat5_.z = _e473.y;
    u_xlat5_.w = _e473.z;
    let _e480 = u_xlat5_;
    u_xlat9_ = dot(_e480, vec4<f32>(4f, 3f, 2f, 1f));
    let _e487 = u_xlat9_;
    u_xlat9_ = (-(_e487) + 4f);
    let _e491 = u_xlat9_;
    u_xlatu9_ = u32(_e491);
    let _e493 = u_xlatu9_;
    u_xlati9_ = (i32(_e493) << 2u);
    let _e498 = u_xlat4_;
    let _e500 = vs_TEXCOORD1_1;
    let _e502 = u_xlati9_;
    let _e507 = _f_buffer4_.f_cb4_[(_e502 + 1i)];
    let _e509 = (_e500.yyy * _e507.xyz);
    u_xlat4_.x = _e509.x;
    u_xlat4_.y = _e509.y;
    u_xlat4_.z = _e509.z;
    let _e516 = u_xlat4_;
    let _e518 = u_xlati9_;
    let _e521 = _f_buffer4_.f_cb4_[_e518];
    let _e523 = vs_TEXCOORD1_1;
    let _e526 = u_xlat4_;
    let _e528 = ((_e521.xyz * _e523.xxx) + _e526.xyz);
    u_xlat4_.x = _e528.x;
    u_xlat4_.y = _e528.y;
    u_xlat4_.z = _e528.z;
    let _e535 = u_xlat4_;
    let _e537 = u_xlati9_;
    let _e542 = _f_buffer4_.f_cb4_[(_e537 + 2i)];
    let _e544 = vs_TEXCOORD1_1;
    let _e547 = u_xlat4_;
    let _e549 = ((_e542.xyz * _e544.zzz) + _e547.xyz);
    u_xlat4_.x = _e549.x;
    u_xlat4_.y = _e549.y;
    u_xlat4_.z = _e549.z;
    let _e556 = u_xlat4_;
    let _e558 = u_xlat4_;
    let _e560 = u_xlati9_;
    let _e565 = _f_buffer4_.f_cb4_[(_e560 + 3i)];
    let _e567 = (_e558.xyz + _e565.xyz);
    u_xlat4_.x = _e567.x;
    u_xlat4_.y = _e567.y;
    u_xlat4_.z = _e567.z;
    u_xlat3_.w = 1f;
    let _e580 = _f_buffer2_.f_cb2_[27];
    let _e581 = u_xlat3_;
    u_xlat5_.x = dot(_e580, _e581);
    let _e587 = _f_buffer2_.f_cb2_[28];
    let _e588 = u_xlat3_;
    u_xlat5_.y = dot(_e587, _e588);
    let _e594 = _f_buffer2_.f_cb2_[29];
    let _e595 = u_xlat3_;
    u_xlat5_.z = dot(_e594, _e595);
    let _e597 = u_xlat3_;
    let _e599 = u_xlat3_;
    u_xlat6_ = (_e597.yzzx * _e599.xyzz);
    let _e606 = _f_buffer2_.f_cb2_[30];
    let _e607 = u_xlat6_;
    u_xlat7_.x = dot(_e606, _e607);
    let _e613 = _f_buffer2_.f_cb2_[31];
    let _e614 = u_xlat6_;
    u_xlat7_.y = dot(_e613, _e614);
    let _e620 = _f_buffer2_.f_cb2_[32];
    let _e621 = u_xlat6_;
    u_xlat7_.z = dot(_e620, _e621);
    let _e623 = u_xlat3_;
    let _e625 = u_xlat3_;
    u_xlat9_ = (_e623.y * _e625.y);
    let _e628 = u_xlat3_;
    let _e630 = u_xlat3_;
    let _e633 = u_xlat9_;
    u_xlat9_ = ((_e628.x * _e630.x) + -(_e633));
    let _e636 = u_xlat6_;
    let _e641 = _f_buffer2_.f_cb2_[33];
    let _e643 = u_xlat9_;
    let _e646 = u_xlat7_;
    let _e648 = ((_e641.xyz * vec3(_e643)) + _e646.xyz);
    u_xlat6_.x = _e648.x;
    u_xlat6_.y = _e648.y;
    u_xlat6_.z = _e648.z;
    let _e655 = u_xlat5_;
    let _e657 = u_xlat5_;
    let _e659 = u_xlat6_;
    let _e661 = (_e657.xyz + _e659.xyz);
    u_xlat5_.x = _e661.x;
    u_xlat5_.y = _e661.y;
    u_xlat5_.z = _e661.z;
    let _e668 = u_xlatb6_;
    let _e675 = u_xlat5_;
    let _e678 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e675.xyzx).xyz;
    u_xlatb6_.x = _e678.x;
    u_xlatb6_.y = _e678.y;
    u_xlatb6_.z = _e678.z;
    let _e685 = u_xlat7_;
    let _e687 = u_xlat5_;
    let _e693 = (_e687.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat7_.x = _e693.x;
    u_xlat7_.y = _e693.y;
    u_xlat7_.z = _e693.z;
    let _e700 = u_xlat5_;
    let _e702 = u_xlat5_;
    let _e705 = log2(abs(_e702.xyz));
    u_xlat5_.x = _e705.x;
    u_xlat5_.y = _e705.y;
    u_xlat5_.z = _e705.z;
    let _e712 = u_xlat5_;
    let _e714 = u_xlat5_;
    let _e720 = (_e714.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat5_.x = _e720.x;
    u_xlat5_.y = _e720.y;
    u_xlat5_.z = _e720.z;
    let _e727 = u_xlat5_;
    let _e729 = u_xlat5_;
    let _e731 = exp2(_e729.xyz);
    u_xlat5_.x = _e731.x;
    u_xlat5_.y = _e731.y;
    u_xlat5_.z = _e731.z;
    let _e738 = u_xlat5_;
    let _e740 = u_xlat5_;
    let _e754 = ((_e740.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat5_.x = _e754.x;
    u_xlat5_.y = _e754.y;
    u_xlat5_.z = _e754.z;
    {
        let _e761 = u_xlat5_;
        hlslcc_movcTemp = _e761;
        let _e764 = u_xlatb6_;
        if _e764.x {
            let _e766 = u_xlat7_;
            local_12 = _e766.x;
        } else {
            let _e768 = u_xlat5_;
            local_12 = _e768.x;
        }
        let _e771 = local_12;
        hlslcc_movcTemp.x = _e771;
        let _e773 = u_xlatb6_;
        if _e773.y {
            let _e775 = u_xlat7_;
            local_13 = _e775.y;
        } else {
            let _e777 = u_xlat5_;
            local_13 = _e777.y;
        }
        let _e780 = local_13;
        hlslcc_movcTemp.y = _e780;
        let _e782 = u_xlatb6_;
        if _e782.z {
            let _e784 = u_xlat7_;
            local_14 = _e784.z;
        } else {
            let _e786 = u_xlat5_;
            local_14 = _e786.z;
        }
        let _e789 = local_14;
        hlslcc_movcTemp.z = _e789;
        let _e790 = hlslcc_movcTemp;
        u_xlat5_ = _e790;
    }
    let _e791 = u_xlat4_;
    let _e792 = _e791.xy;
    let _e793 = u_xlat4_;
    txVec0_ = vec3<f32>(_e792.x, _e792.y, _e793.z);
    let _e799 = txVec0_;
    let _e803 = textureSampleCompareLevel(f_t2_, samplerf_s2_, _e799.xy, _e799.z);
    u_xlat9_ = _e803;
    let _e807 = _f_buffer4_.f_cb4_[27];
    u_xlat27_ = (-(_e807.x) + 1f);
    let _e812 = u_xlat9_;
    let _e816 = _f_buffer4_.f_cb4_[27];
    let _e819 = u_xlat27_;
    u_xlat9_ = ((_e812 * _e816.x) + _e819);
    let _e822 = u_xlat4_;
    u_xlatb27_ = (0f >= _e822.z);
    let _e825 = u_xlat4_;
    u_xlatb1_ = (_e825.z >= 1f);
    let _e829 = u_xlatb27_;
    let _e830 = u_xlatb1_;
    u_xlatb27_ = (_e829 || _e830);
    let _e832 = u_xlatb27_;
    if _e832 {
        local_15 = 1f;
    } else {
        let _e834 = u_xlat9_;
        local_15 = _e834;
    }
    let _e836 = local_15;
    u_xlat9_ = _e836;
    let _e837 = u_xlat4_;
    let _e839 = vs_TEXCOORD1_1;
    let _e844 = _f_buffer0_.f_cb0_[21];
    let _e847 = (_e839.xyz + -(_e844.xyz));
    u_xlat4_.x = _e847.x;
    u_xlat4_.y = _e847.y;
    u_xlat4_.z = _e847.z;
    let _e854 = u_xlat4_;
    let _e856 = u_xlat4_;
    u_xlat27_ = dot(_e854.xyz, _e856.xyz);
    let _e859 = u_xlat27_;
    let _e863 = _f_buffer4_.f_cb4_[27];
    let _e869 = _f_buffer4_.f_cb4_[27];
    u_xlat27_ = ((_e859 * _e863.z) + _e869.w);
    let _e872 = u_xlat27_;
    u_xlat27_ = clamp(_e872, 0f, 1f);
    let _e877 = u_xlat9_;
    u_xlat1_.x = (-(_e877) + 1f);
    let _e881 = u_xlat27_;
    let _e882 = u_xlat1_;
    let _e885 = u_xlat9_;
    u_xlat9_ = ((_e881 * _e882.x) + _e885);
    let _e887 = u_xlat9_;
    let _e891 = _f_buffer2_.f_cb2_[11];
    u_xlat9_ = (_e887 * _e891.z);
    let _e894 = u_xlat4_;
    let _e896 = u_xlat9_;
    let _e901 = _f_buffer0_.f_cb0_[6];
    let _e903 = (vec3(_e896) * _e901.xyz);
    u_xlat4_.x = _e903.x;
    u_xlat4_.y = _e903.y;
    u_xlat4_.z = _e903.z;
    let _e910 = u_xlat3_;
    let _e915 = _f_buffer0_.f_cb0_[5];
    u_xlat9_ = dot(_e910.xyz, _e915.xyz);
    let _e918 = u_xlat9_;
    u_xlat9_ = clamp(_e918, 0f, 1f);
    let _e922 = u_xlat4_;
    let _e924 = u_xlat9_;
    let _e926 = u_xlat4_;
    let _e928 = (vec3(_e924) * _e926.xyz);
    u_xlat4_.x = _e928.x;
    u_xlat4_.y = _e928.y;
    u_xlat4_.z = _e928.z;
    let _e935 = u_xlat4_;
    let _e937 = u_xlat1_;
    let _e939 = u_xlat4_;
    let _e941 = (_e937.yzw * _e939.xyz);
    u_xlat4_.x = _e941.x;
    u_xlat4_.y = _e941.y;
    u_xlat4_.z = _e941.z;
    let _e951 = _f_buffer0_.f_cb0_[10];
    let _e956 = _f_buffer2_.f_cb2_[11];
    u_xlat9_ = min(_e951.x, _e956.y);
    let _e959 = u_xlat9_;
    u_xlatu9_ = u32(i32(_e959));
    u_xlat6_.x = 0f;
    u_xlat6_.y = 0f;
    u_xlat6_.z = 0f;
    loop {
        let _e973 = u_xlatu_loop_1_;
        let _e974 = u_xlatu9_;
        if !((_e973 < _e974)) {
            break;
        }
        {
            let _e980 = u_xlatu_loop_1_;
            u_xlatu1_ = (_e980 >> 2u);
            let _e983 = u_xlatu_loop_1_;
            u_xlati29_ = i32((_e983 & 3u));
            let _e988 = u_xlatu1_;
            let _e994 = _f_buffer2_.f_cb2_[(i32(_e988) + 12i)];
            let _e995 = u_xlati29_;
            let _e999 = local_16[_e995];
            u_xlat1_.x = dot(_e994, bitcast<vec4<f32>>(_e999));
            let _e1002 = u_xlat1_;
            u_xlati1_ = i32(_e1002.x);
            let _e1005 = u_xlat7_;
            let _e1007 = vs_TEXCOORD1_1;
            let _e1010 = u_xlati1_;
            let _e1013 = _f_buffer1_.f_cb1_[_e1010];
            let _e1016 = u_xlati1_;
            let _e1019 = _f_buffer1_.f_cb1_[_e1016];
            let _e1021 = ((-(_e1007.xyz) * _e1013.www) + _e1019.xyz);
            u_xlat7_.x = _e1021.x;
            u_xlat7_.y = _e1021.y;
            u_xlat7_.z = _e1021.z;
            let _e1028 = u_xlat7_;
            let _e1030 = u_xlat7_;
            u_xlat29_ = dot(_e1028.xyz, _e1030.xyz);
            let _e1033 = u_xlat29_;
            u_xlat29_ = max(_e1033, 0.000061035156f);
            let _e1036 = u_xlat29_;
            u_xlat30_ = inverseSqrt(_e1036);
            let _e1038 = u_xlat7_;
            let _e1040 = u_xlat30_;
            let _e1042 = u_xlat7_;
            let _e1044 = (vec3(_e1040) * _e1042.xyz);
            u_xlat7_.x = _e1044.x;
            u_xlat7_.y = _e1044.y;
            u_xlat7_.z = _e1044.z;
            let _e1053 = u_xlat29_;
            u_xlat30_ = (1f / _e1053);
            let _e1055 = u_xlat29_;
            let _e1056 = u_xlati1_;
            let _e1061 = _f_buffer1_.f_cb1_[(_e1056 + 512i)];
            u_xlat29_ = (_e1055 * _e1061.x);
            let _e1064 = u_xlat29_;
            let _e1066 = u_xlat29_;
            u_xlat29_ = ((-(_e1064) * _e1066) + 1f);
            let _e1070 = u_xlat29_;
            u_xlat29_ = max(_e1070, 0f);
            let _e1073 = u_xlat29_;
            let _e1074 = u_xlat29_;
            u_xlat29_ = (_e1073 * _e1074);
            let _e1076 = u_xlat29_;
            let _e1077 = u_xlat30_;
            u_xlat29_ = (_e1076 * _e1077);
            let _e1079 = u_xlati1_;
            let _e1084 = _f_buffer1_.f_cb1_[(_e1079 + 768i)];
            let _e1086 = u_xlat7_;
            u_xlat30_ = dot(_e1084.xyz, _e1086.xyz);
            let _e1089 = u_xlat30_;
            let _e1090 = u_xlati1_;
            let _e1095 = _f_buffer1_.f_cb1_[(_e1090 + 512i)];
            let _e1098 = u_xlati1_;
            let _e1103 = _f_buffer1_.f_cb1_[(_e1098 + 512i)];
            u_xlat30_ = ((_e1089 * _e1095.z) + _e1103.w);
            let _e1106 = u_xlat30_;
            u_xlat30_ = clamp(_e1106, 0f, 1f);
            let _e1110 = u_xlat30_;
            let _e1111 = u_xlat30_;
            u_xlat30_ = (_e1110 * _e1111);
            let _e1113 = u_xlat29_;
            let _e1114 = u_xlat30_;
            u_xlat29_ = (_e1113 * _e1114);
            let _e1116 = u_xlat8_;
            let _e1118 = u_xlat29_;
            let _e1120 = u_xlati1_;
            let _e1125 = _f_buffer1_.f_cb1_[(_e1120 + 256i)];
            let _e1127 = (vec3(_e1118) * _e1125.xyz);
            u_xlat8_.x = _e1127.x;
            u_xlat8_.y = _e1127.y;
            u_xlat8_.z = _e1127.z;
            let _e1135 = u_xlat3_;
            let _e1137 = u_xlat7_;
            u_xlat1_.x = dot(_e1135.xyz, _e1137.xyz);
            let _e1141 = u_xlat1_;
            u_xlat1_.x = clamp(_e1141.x, 0f, 1f);
            let _e1146 = u_xlat7_;
            let _e1148 = u_xlat1_;
            let _e1150 = u_xlat8_;
            let _e1152 = (_e1148.xxx * _e1150.xyz);
            u_xlat7_.x = _e1152.x;
            u_xlat7_.y = _e1152.y;
            u_xlat7_.z = _e1152.z;
            let _e1159 = u_xlat6_;
            let _e1161 = u_xlat7_;
            let _e1163 = u_xlat1_;
            let _e1166 = u_xlat6_;
            let _e1168 = ((_e1161.xyz * _e1163.yzw) + _e1166.xyz);
            u_xlat6_.x = _e1168.x;
            u_xlat6_.y = _e1168.y;
            u_xlat6_.z = _e1168.z;
        }
        continuing {
            let _e977 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e977 + 1u);
        }
    }
    let _e1175 = u_xlat1_;
    let _e1177 = u_xlat5_;
    let _e1179 = u_xlat1_;
    let _e1182 = u_xlat4_;
    let _e1184 = ((_e1177.xyz * _e1179.yzw) + _e1182.xyz);
    u_xlat1_.x = _e1184.x;
    u_xlat1_.y = _e1184.y;
    u_xlat1_.z = _e1184.z;
    let _e1191 = u_xlat1_;
    let _e1193 = u_xlat6_;
    let _e1195 = u_xlat1_;
    let _e1197 = (_e1193.xyz + _e1195.xyz);
    u_xlat1_.x = _e1197.x;
    u_xlat1_.y = _e1197.y;
    u_xlat1_.z = _e1197.z;
    let _e1204 = SV_Target0_;
    let _e1206 = u_xlat2_;
    let _e1211 = _f_buffer3_.f_cb3_[4];
    let _e1214 = u_xlat1_;
    let _e1216 = ((_e1206.xyz * _e1211.xyz) + _e1214.xyz);
    SV_Target0_.x = _e1216.x;
    SV_Target0_.y = _e1216.y;
    SV_Target0_.z = _e1216.z;
    let _e1226 = _f_buffer3_.f_cb3_[5];
    u_xlatb9_ = (_e1226.y == 1f);
    let _e1230 = u_xlatb9_;
    let _e1231 = u_xlatb0_;
    u_xlatb0_ = (_e1230 || _e1231);
    let _e1234 = u_xlatb0_;
    if _e1234 {
        let _e1235 = u_xlat18_;
        local_17 = _e1235;
    } else {
        local_17 = 1f;
    }
    let _e1238 = local_17;
    SV_Target0_.w = _e1238;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e47 = SV_Target0_;
    return FragmentOutput(_e47);
}
