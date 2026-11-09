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
var<private> vs_TEXCOORD6_1: vec4<f32>;
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
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec3<bool> = vec3(false);
    var u_xlat6_: vec3<f32> = vec3(0f);
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
    var hlslcc_movcTemp: vec3<f32>;
    var local_5: f32;
    var local_6: f32;
    var local_7: f32;
    var txVec0_: vec3<f32>;
    var local_8: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_9: array<vec4<u32>, 4> = ImmCB_0_;
    var local_10: f32;

    let _e115 = vs_TEXCOORD0_1;
    let _e120 = _f_buffer0_.f_cb0_[4];
    let _e125 = hscard_bias.values[0];
    let _e128 = textureSampleBias(f_t0_, samplerf_s0_, _e115.xy, (_e120.x + _e125.x));
    u_xlat0_ = _e128;
    let _e129 = u_xlat0_;
    let _e134 = _f_buffer3_.f_cb3_[2];
    u_xlat1_ = (_e129.wxyz * _e134.wxyz);
    let _e140 = _f_buffer0_.f_cb0_[4];
    u_xlatb0_ = (_e140.z != 0f);
    let _e148 = _f_buffer3_.f_cb3_[5];
    if (0f >= _e148.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e155 = local;
    u_xlati9_ = i32(_e155);
    let _e157 = u_xlat1_;
    let _e159 = dpdx(_e157.x);
    u_xlat18_ = _e159;
    let _e161 = u_xlat1_;
    let _e163 = dpdy(_e161.x);
    u_xlat2_.x = _e163;
    let _e164 = u_xlat18_;
    let _e166 = u_xlat2_;
    u_xlat18_ = (abs(_e164) + abs(_e166.x));
    let _e170 = u_xlat0_;
    let _e175 = _f_buffer3_.f_cb3_[2];
    let _e181 = _f_buffer3_.f_cb3_[5];
    u_xlat27_ = ((_e170.w * _e175.w) + -(_e181.x));
    let _e186 = u_xlat18_;
    let _e190 = u_xlat27_;
    u_xlat2_.x = ((-(_e186) * 0.5f) + _e190);
    let _e192 = u_xlat18_;
    u_xlat18_ = max(_e192, 0.0001f);
    let _e195 = u_xlat2_;
    let _e197 = u_xlat18_;
    u_xlat18_ = (_e195.x / _e197);
    let _e199 = u_xlat18_;
    u_xlat18_ = (_e199 + 1f);
    let _e202 = u_xlat18_;
    u_xlat18_ = clamp(_e202, 0f, 1f);
    let _e206 = u_xlati9_;
    if (_e206 != 0i) {
        local_1 = 1f;
    } else {
        let _e210 = u_xlat18_;
        local_1 = _e210;
    }
    let _e212 = local_1;
    u_xlat18_ = _e212;
    let _e213 = u_xlati9_;
    u_xlati9_ = ~(_e213);
    let _e215 = u_xlatb0_;
    if _e215 {
        let _e216 = u_xlati9_;
        local_2 = _e216;
    } else {
        local_2 = 0i;
    }
    let _e220 = local_2;
    u_xlati9_ = _e220;
    let _e222 = u_xlat18_;
    u_xlat2_.x = (_e222 + -0.0001f);
    let _e226 = u_xlati9_;
    if (_e226 != 0i) {
        let _e229 = u_xlat2_;
        local_3 = _e229.x;
    } else {
        let _e231 = u_xlat27_;
        local_3 = _e231;
    }
    let _e233 = local_3;
    u_xlat9_ = _e233;
    let _e234 = u_xlatb0_;
    if _e234 {
        let _e235 = u_xlat18_;
        local_4 = _e235;
    } else {
        let _e236 = u_xlat1_;
        local_4 = _e236.x;
    }
    let _e239 = local_4;
    u_xlat18_ = _e239;
    let _e240 = u_xlat9_;
    u_xlatb9_ = (_e240 < 0f);
    let _e243 = u_xlatb9_;
    if ((select(0i, 1i, _e243) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e252 = vs_TEXCOORD0_1;
    let _e257 = _f_buffer0_.f_cb0_[4];
    let _e262 = hscard_bias.values[1];
    let _e265 = textureSampleBias(f_t1_, samplerf_s1_, _e252.xy, (_e257.x + _e262.x));
    u_xlat2_ = _e265;
    let _e266 = vs_TEXCOORD2_1;
    let _e268 = vs_TEXCOORD2_1;
    u_xlat9_ = dot(_e266.xyz, _e268.xyz);
    let _e271 = u_xlat9_;
    u_xlat9_ = inverseSqrt(_e271);
    let _e273 = u_xlat3_;
    let _e275 = u_xlat9_;
    let _e277 = vs_TEXCOORD2_1;
    let _e279 = (vec3(_e275) * _e277.xyz);
    u_xlat3_.x = _e279.x;
    u_xlat3_.y = _e279.y;
    u_xlat3_.z = _e279.z;
    u_xlat3_.w = 1f;
    let _e292 = _f_buffer2_.f_cb2_[27];
    let _e293 = u_xlat3_;
    u_xlat4_.x = dot(_e292, _e293);
    let _e299 = _f_buffer2_.f_cb2_[28];
    let _e300 = u_xlat3_;
    u_xlat4_.y = dot(_e299, _e300);
    let _e306 = _f_buffer2_.f_cb2_[29];
    let _e307 = u_xlat3_;
    u_xlat4_.z = dot(_e306, _e307);
    let _e309 = u_xlat3_;
    let _e311 = u_xlat3_;
    u_xlat5_ = (_e309.yzzx * _e311.xyzz);
    let _e318 = _f_buffer2_.f_cb2_[30];
    let _e319 = u_xlat5_;
    u_xlat6_.x = dot(_e318, _e319);
    let _e325 = _f_buffer2_.f_cb2_[31];
    let _e326 = u_xlat5_;
    u_xlat6_.y = dot(_e325, _e326);
    let _e332 = _f_buffer2_.f_cb2_[32];
    let _e333 = u_xlat5_;
    u_xlat6_.z = dot(_e332, _e333);
    let _e335 = u_xlat3_;
    let _e337 = u_xlat3_;
    u_xlat9_ = (_e335.y * _e337.y);
    let _e340 = u_xlat3_;
    let _e342 = u_xlat3_;
    let _e345 = u_xlat9_;
    u_xlat9_ = ((_e340.x * _e342.x) + -(_e345));
    let _e348 = u_xlat5_;
    let _e353 = _f_buffer2_.f_cb2_[33];
    let _e355 = u_xlat9_;
    let _e358 = u_xlat6_;
    let _e360 = ((_e353.xyz * vec3(_e355)) + _e358.xyz);
    u_xlat5_.x = _e360.x;
    u_xlat5_.y = _e360.y;
    u_xlat5_.z = _e360.z;
    let _e367 = u_xlat4_;
    let _e369 = u_xlat4_;
    let _e371 = u_xlat5_;
    let _e373 = (_e369.xyz + _e371.xyz);
    u_xlat4_.x = _e373.x;
    u_xlat4_.y = _e373.y;
    u_xlat4_.z = _e373.z;
    let _e380 = u_xlatb5_;
    let _e387 = u_xlat4_;
    let _e390 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e387.xyzx).xyz;
    u_xlatb5_.x = _e390.x;
    u_xlatb5_.y = _e390.y;
    u_xlatb5_.z = _e390.z;
    let _e397 = u_xlat6_;
    let _e399 = u_xlat4_;
    let _e405 = (_e399.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat6_.x = _e405.x;
    u_xlat6_.y = _e405.y;
    u_xlat6_.z = _e405.z;
    let _e412 = u_xlat4_;
    let _e414 = u_xlat4_;
    let _e417 = log2(abs(_e414.xyz));
    u_xlat4_.x = _e417.x;
    u_xlat4_.y = _e417.y;
    u_xlat4_.z = _e417.z;
    let _e424 = u_xlat4_;
    let _e426 = u_xlat4_;
    let _e432 = (_e426.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat4_.x = _e432.x;
    u_xlat4_.y = _e432.y;
    u_xlat4_.z = _e432.z;
    let _e439 = u_xlat4_;
    let _e441 = u_xlat4_;
    let _e443 = exp2(_e441.xyz);
    u_xlat4_.x = _e443.x;
    u_xlat4_.y = _e443.y;
    u_xlat4_.z = _e443.z;
    let _e450 = u_xlat4_;
    let _e452 = u_xlat4_;
    let _e466 = ((_e452.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat4_.x = _e466.x;
    u_xlat4_.y = _e466.y;
    u_xlat4_.z = _e466.z;
    {
        let _e473 = u_xlat4_;
        hlslcc_movcTemp = _e473;
        let _e476 = u_xlatb5_;
        if _e476.x {
            let _e478 = u_xlat6_;
            local_5 = _e478.x;
        } else {
            let _e480 = u_xlat4_;
            local_5 = _e480.x;
        }
        let _e483 = local_5;
        hlslcc_movcTemp.x = _e483;
        let _e485 = u_xlatb5_;
        if _e485.y {
            let _e487 = u_xlat6_;
            local_6 = _e487.y;
        } else {
            let _e489 = u_xlat4_;
            local_6 = _e489.y;
        }
        let _e492 = local_6;
        hlslcc_movcTemp.y = _e492;
        let _e494 = u_xlatb5_;
        if _e494.z {
            let _e496 = u_xlat6_;
            local_7 = _e496.z;
        } else {
            let _e498 = u_xlat4_;
            local_7 = _e498.z;
        }
        let _e501 = local_7;
        hlslcc_movcTemp.z = _e501;
        let _e502 = hlslcc_movcTemp;
        u_xlat4_ = _e502;
    }
    let _e503 = vs_TEXCOORD6_1;
    let _e504 = _e503.xy;
    let _e505 = vs_TEXCOORD6_1;
    txVec0_ = vec3<f32>(_e504.x, _e504.y, _e505.z);
    let _e511 = txVec0_;
    let _e515 = textureSampleCompareLevel(f_t2_, samplerf_s2_, _e511.xy, _e511.z);
    u_xlat9_ = _e515;
    let _e519 = _f_buffer4_.f_cb4_[27];
    u_xlat27_ = (-(_e519.x) + 1f);
    let _e524 = u_xlat9_;
    let _e528 = _f_buffer4_.f_cb4_[27];
    let _e531 = u_xlat27_;
    u_xlat9_ = ((_e524 * _e528.x) + _e531);
    let _e534 = vs_TEXCOORD6_1;
    u_xlatb27_ = (0f >= _e534.z);
    let _e537 = vs_TEXCOORD6_1;
    u_xlatb1_ = (_e537.z >= 1f);
    let _e541 = u_xlatb27_;
    let _e542 = u_xlatb1_;
    u_xlatb27_ = (_e541 || _e542);
    let _e544 = u_xlatb27_;
    if _e544 {
        local_8 = 1f;
    } else {
        let _e546 = u_xlat9_;
        local_8 = _e546;
    }
    let _e548 = local_8;
    u_xlat9_ = _e548;
    let _e549 = u_xlat5_;
    let _e551 = vs_TEXCOORD1_1;
    let _e556 = _f_buffer0_.f_cb0_[21];
    let _e559 = (_e551.xyz + -(_e556.xyz));
    u_xlat5_.x = _e559.x;
    u_xlat5_.y = _e559.y;
    u_xlat5_.z = _e559.z;
    let _e566 = u_xlat5_;
    let _e568 = u_xlat5_;
    u_xlat27_ = dot(_e566.xyz, _e568.xyz);
    let _e571 = u_xlat27_;
    let _e575 = _f_buffer4_.f_cb4_[27];
    let _e581 = _f_buffer4_.f_cb4_[27];
    u_xlat27_ = ((_e571 * _e575.z) + _e581.w);
    let _e584 = u_xlat27_;
    u_xlat27_ = clamp(_e584, 0f, 1f);
    let _e589 = u_xlat9_;
    u_xlat1_.x = (-(_e589) + 1f);
    let _e593 = u_xlat27_;
    let _e594 = u_xlat1_;
    let _e597 = u_xlat9_;
    u_xlat9_ = ((_e593 * _e594.x) + _e597);
    let _e599 = u_xlat9_;
    let _e603 = _f_buffer2_.f_cb2_[11];
    u_xlat9_ = (_e599 * _e603.z);
    let _e606 = u_xlat5_;
    let _e608 = u_xlat9_;
    let _e613 = _f_buffer0_.f_cb0_[6];
    let _e615 = (vec3(_e608) * _e613.xyz);
    u_xlat5_.x = _e615.x;
    u_xlat5_.y = _e615.y;
    u_xlat5_.z = _e615.z;
    let _e622 = u_xlat3_;
    let _e627 = _f_buffer0_.f_cb0_[5];
    u_xlat9_ = dot(_e622.xyz, _e627.xyz);
    let _e630 = u_xlat9_;
    u_xlat9_ = clamp(_e630, 0f, 1f);
    let _e634 = u_xlat5_;
    let _e636 = u_xlat9_;
    let _e638 = u_xlat5_;
    let _e640 = (vec3(_e636) * _e638.xyz);
    u_xlat5_.x = _e640.x;
    u_xlat5_.y = _e640.y;
    u_xlat5_.z = _e640.z;
    let _e647 = u_xlat5_;
    let _e649 = u_xlat1_;
    let _e651 = u_xlat5_;
    let _e653 = (_e649.yzw * _e651.xyz);
    u_xlat5_.x = _e653.x;
    u_xlat5_.y = _e653.y;
    u_xlat5_.z = _e653.z;
    let _e663 = _f_buffer0_.f_cb0_[10];
    let _e668 = _f_buffer2_.f_cb2_[11];
    u_xlat9_ = min(_e663.x, _e668.y);
    let _e671 = u_xlat9_;
    u_xlatu9_ = u32(i32(_e671));
    u_xlat6_.x = 0f;
    u_xlat6_.y = 0f;
    u_xlat6_.z = 0f;
    loop {
        let _e685 = u_xlatu_loop_1_;
        let _e686 = u_xlatu9_;
        if !((_e685 < _e686)) {
            break;
        }
        {
            let _e692 = u_xlatu_loop_1_;
            u_xlatu1_ = (_e692 >> 2u);
            let _e695 = u_xlatu_loop_1_;
            u_xlati29_ = i32((_e695 & 3u));
            let _e700 = u_xlatu1_;
            let _e706 = _f_buffer2_.f_cb2_[(i32(_e700) + 12i)];
            let _e707 = u_xlati29_;
            let _e711 = local_9[_e707];
            u_xlat1_.x = dot(_e706, bitcast<vec4<f32>>(_e711));
            let _e714 = u_xlat1_;
            u_xlati1_ = i32(_e714.x);
            let _e717 = u_xlat7_;
            let _e719 = vs_TEXCOORD1_1;
            let _e722 = u_xlati1_;
            let _e725 = _f_buffer1_.f_cb1_[_e722];
            let _e728 = u_xlati1_;
            let _e731 = _f_buffer1_.f_cb1_[_e728];
            let _e733 = ((-(_e719.xyz) * _e725.www) + _e731.xyz);
            u_xlat7_.x = _e733.x;
            u_xlat7_.y = _e733.y;
            u_xlat7_.z = _e733.z;
            let _e740 = u_xlat7_;
            let _e742 = u_xlat7_;
            u_xlat29_ = dot(_e740.xyz, _e742.xyz);
            let _e745 = u_xlat29_;
            u_xlat29_ = max(_e745, 0.000061035156f);
            let _e748 = u_xlat29_;
            u_xlat30_ = inverseSqrt(_e748);
            let _e750 = u_xlat7_;
            let _e752 = u_xlat30_;
            let _e754 = u_xlat7_;
            let _e756 = (vec3(_e752) * _e754.xyz);
            u_xlat7_.x = _e756.x;
            u_xlat7_.y = _e756.y;
            u_xlat7_.z = _e756.z;
            let _e765 = u_xlat29_;
            u_xlat30_ = (1f / _e765);
            let _e767 = u_xlat29_;
            let _e768 = u_xlati1_;
            let _e773 = _f_buffer1_.f_cb1_[(_e768 + 512i)];
            u_xlat29_ = (_e767 * _e773.x);
            let _e776 = u_xlat29_;
            let _e778 = u_xlat29_;
            u_xlat29_ = ((-(_e776) * _e778) + 1f);
            let _e782 = u_xlat29_;
            u_xlat29_ = max(_e782, 0f);
            let _e785 = u_xlat29_;
            let _e786 = u_xlat29_;
            u_xlat29_ = (_e785 * _e786);
            let _e788 = u_xlat29_;
            let _e789 = u_xlat30_;
            u_xlat29_ = (_e788 * _e789);
            let _e791 = u_xlati1_;
            let _e796 = _f_buffer1_.f_cb1_[(_e791 + 768i)];
            let _e798 = u_xlat7_;
            u_xlat30_ = dot(_e796.xyz, _e798.xyz);
            let _e801 = u_xlat30_;
            let _e802 = u_xlati1_;
            let _e807 = _f_buffer1_.f_cb1_[(_e802 + 512i)];
            let _e810 = u_xlati1_;
            let _e815 = _f_buffer1_.f_cb1_[(_e810 + 512i)];
            u_xlat30_ = ((_e801 * _e807.z) + _e815.w);
            let _e818 = u_xlat30_;
            u_xlat30_ = clamp(_e818, 0f, 1f);
            let _e822 = u_xlat30_;
            let _e823 = u_xlat30_;
            u_xlat30_ = (_e822 * _e823);
            let _e825 = u_xlat29_;
            let _e826 = u_xlat30_;
            u_xlat29_ = (_e825 * _e826);
            let _e828 = u_xlat8_;
            let _e830 = u_xlat29_;
            let _e832 = u_xlati1_;
            let _e837 = _f_buffer1_.f_cb1_[(_e832 + 256i)];
            let _e839 = (vec3(_e830) * _e837.xyz);
            u_xlat8_.x = _e839.x;
            u_xlat8_.y = _e839.y;
            u_xlat8_.z = _e839.z;
            let _e847 = u_xlat3_;
            let _e849 = u_xlat7_;
            u_xlat1_.x = dot(_e847.xyz, _e849.xyz);
            let _e853 = u_xlat1_;
            u_xlat1_.x = clamp(_e853.x, 0f, 1f);
            let _e858 = u_xlat7_;
            let _e860 = u_xlat1_;
            let _e862 = u_xlat8_;
            let _e864 = (_e860.xxx * _e862.xyz);
            u_xlat7_.x = _e864.x;
            u_xlat7_.y = _e864.y;
            u_xlat7_.z = _e864.z;
            let _e871 = u_xlat6_;
            let _e873 = u_xlat7_;
            let _e875 = u_xlat1_;
            let _e878 = u_xlat6_;
            let _e880 = ((_e873.xyz * _e875.yzw) + _e878.xyz);
            u_xlat6_.x = _e880.x;
            u_xlat6_.y = _e880.y;
            u_xlat6_.z = _e880.z;
        }
        continuing {
            let _e689 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e689 + 1u);
        }
    }
    let _e887 = u_xlat1_;
    let _e889 = u_xlat4_;
    let _e891 = u_xlat1_;
    let _e894 = u_xlat5_;
    let _e896 = ((_e889.xyz * _e891.yzw) + _e894.xyz);
    u_xlat1_.x = _e896.x;
    u_xlat1_.y = _e896.y;
    u_xlat1_.z = _e896.z;
    let _e903 = u_xlat1_;
    let _e905 = u_xlat6_;
    let _e907 = u_xlat1_;
    let _e909 = (_e905.xyz + _e907.xyz);
    u_xlat1_.x = _e909.x;
    u_xlat1_.y = _e909.y;
    u_xlat1_.z = _e909.z;
    let _e916 = SV_Target0_;
    let _e918 = u_xlat2_;
    let _e923 = _f_buffer3_.f_cb3_[4];
    let _e926 = u_xlat1_;
    let _e928 = ((_e918.xyz * _e923.xyz) + _e926.xyz);
    SV_Target0_.x = _e928.x;
    SV_Target0_.y = _e928.y;
    SV_Target0_.z = _e928.z;
    let _e938 = _f_buffer3_.f_cb3_[5];
    u_xlatb9_ = (_e938.y == 1f);
    let _e942 = u_xlatb9_;
    let _e943 = u_xlatb0_;
    u_xlatb0_ = (_e942 || _e943);
    let _e946 = u_xlatb0_;
    if _e946 {
        let _e947 = u_xlat18_;
        local_10 = _e947;
    } else {
        local_10 = 1f;
    }
    let _e950 = local_10;
    SV_Target0_.w = _e950;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(6) vs_TEXCOORD6_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    main_1();
    let _e51 = SV_Target0_;
    return FragmentOutput(_e51);
}
