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
    f_cb4_: array<vec4<f32>, 12>,
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
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
@group(3) @binding(8) 
var f_t4_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb3_: vec2<bool> = vec2(false);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlat27_: f32 = 0f;
    var u_xlat30_: f32 = 0f;
    var u_xlatu30_: u32 = 0u;
    var u_xlatb30_: bool = false;
    var u_xlatu31_: u32 = 0u;
    var u_xlatb31_: bool = false;
    var u_xlat32_: f32 = 0f;
    var u_xlati32_: i32 = 0i;
    var u_xlatu32_: u32 = 0u;
    var u_xlatb32_: bool = false;
    var u_xlat33_: f32 = 0f;
    var u_xlati33_: i32 = 0i;
    var u_xlat34_: f32 = 0f;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;
    var local_2: vec3<f32>;
    var local_3: vec3<f32>;

    let _e117 = vs_TEXCOORD0_1;
    let _e122 = _f_buffer0_.f_cb0_[4];
    let _e127 = hscard_bias.values[1];
    let _e130 = textureSampleBias(f_t1_, samplerf_s1_, _e117.xy, (_e122.x + _e127.x));
    u_xlat0_ = _e130;
    let _e131 = vs_TEXCOORD0_1;
    let _e136 = _f_buffer0_.f_cb0_[4];
    let _e141 = hscard_bias.values[2];
    let _e144 = textureSampleBias(f_t2_, samplerf_s2_, _e131.xy, (_e136.x + _e141.x));
    u_xlat1_ = _e144;
    let _e145 = vs_TEXCOORD0_1;
    let _e150 = _f_buffer0_.f_cb0_[4];
    let _e155 = hscard_bias.values[3];
    let _e158 = textureSampleBias(f_t3_, samplerf_s3_, _e145.zw, (_e150.x + _e155.x));
    u_xlat2_ = _e158;
    let _e159 = vs_TEXCOORD4_1;
    let _e164 = _f_buffer0_.f_cb0_[4];
    let _e169 = hscard_bias.values[4];
    let _e172 = textureSampleBias(f_t4_, samplerf_s4_, _e159.xy, (_e164.x + _e169.x));
    u_xlat3_ = _e172;
    let _e173 = vs_NORMAL0_1;
    let _e175 = vs_NORMAL0_1;
    u_xlat27_ = dot(_e173.xyz, _e175.xyz);
    let _e178 = u_xlat27_;
    u_xlat27_ = inverseSqrt(_e178);
    let _e180 = u_xlat4_;
    let _e182 = u_xlat27_;
    let _e184 = vs_NORMAL0_1;
    let _e186 = (vec3(_e182) * _e184.xyz);
    u_xlat4_.x = _e186.x;
    u_xlat4_.y = _e186.y;
    u_xlat4_.z = _e186.z;
    let _e193 = vs_TEXCOORDindex3_1;
    let _e194 = _e193.xy;
    let _e195 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e194.x, _e194.y, _e195.z);
    let _e201 = txVec0_;
    let _e205 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e201.xy, _e201.z);
    u_xlat27_ = _e205;
    let _e209 = _f_buffer3_.f_cb3_[27];
    u_xlat30_ = (-(_e209.x) + 1f);
    let _e214 = u_xlat27_;
    let _e218 = _f_buffer3_.f_cb3_[27];
    let _e221 = u_xlat30_;
    u_xlat27_ = ((_e214 * _e218.x) + _e221);
    let _e224 = vs_TEXCOORDindex3_1;
    u_xlatb30_ = (0f >= _e224.z);
    let _e227 = vs_TEXCOORDindex3_1;
    u_xlatb31_ = (_e227.z >= 1f);
    let _e231 = u_xlatb30_;
    let _e232 = u_xlatb31_;
    u_xlatb30_ = (_e231 || _e232);
    let _e234 = u_xlatb30_;
    if _e234 {
        local = 1f;
    } else {
        let _e236 = u_xlat27_;
        local = _e236;
    }
    let _e238 = local;
    u_xlat27_ = _e238;
    let _e239 = u_xlat27_;
    let _e243 = _f_buffer2_.f_cb2_[11];
    u_xlat27_ = (_e239 * _e243.z);
    let _e246 = u_xlat5_;
    let _e248 = u_xlat27_;
    let _e253 = _f_buffer0_.f_cb0_[6];
    let _e255 = (vec3(_e248) * _e253.xyz);
    u_xlat5_.x = _e255.x;
    u_xlat5_.y = _e255.y;
    u_xlat5_.z = _e255.z;
    let _e262 = u_xlat4_;
    let _e267 = _f_buffer0_.f_cb0_[5];
    u_xlat27_ = dot(_e262.xyz, _e267.xyz);
    let _e270 = u_xlat27_;
    u_xlat27_ = clamp(_e270, 0f, 1f);
    let _e277 = _f_buffer0_.f_cb0_[10];
    let _e282 = _f_buffer2_.f_cb2_[11];
    u_xlat30_ = min(_e277.x, _e282.y);
    let _e285 = u_xlat30_;
    u_xlatu30_ = u32(i32(_e285));
    u_xlat6_.x = 0f;
    u_xlat6_.y = 0f;
    u_xlat6_.z = 0f;
    loop {
        let _e299 = u_xlatu_loop_1_;
        let _e300 = u_xlatu30_;
        if !((_e299 < _e300)) {
            break;
        }
        {
            let _e306 = u_xlatu_loop_1_;
            u_xlatu32_ = (_e306 >> 2u);
            let _e309 = u_xlatu_loop_1_;
            u_xlati33_ = i32((_e309 & 3u));
            let _e313 = u_xlatu32_;
            let _e319 = _f_buffer2_.f_cb2_[(i32(_e313) + 12i)];
            let _e320 = u_xlati33_;
            let _e324 = local_1[_e320];
            u_xlat32_ = dot(_e319, bitcast<vec4<f32>>(_e324));
            let _e327 = u_xlat32_;
            u_xlati32_ = i32(_e327);
            let _e329 = u_xlat7_;
            let _e331 = vs_TEXCOORD1_1;
            let _e334 = u_xlati32_;
            let _e337 = _f_buffer1_.f_cb1_[_e334];
            let _e340 = u_xlati32_;
            let _e343 = _f_buffer1_.f_cb1_[_e340];
            let _e345 = ((-(_e331.xyz) * _e337.www) + _e343.xyz);
            u_xlat7_.x = _e345.x;
            u_xlat7_.y = _e345.y;
            u_xlat7_.z = _e345.z;
            let _e352 = u_xlat7_;
            let _e354 = u_xlat7_;
            u_xlat33_ = dot(_e352.xyz, _e354.xyz);
            let _e357 = u_xlat33_;
            u_xlat33_ = max(_e357, 0.000061035156f);
            let _e360 = u_xlat33_;
            u_xlat34_ = inverseSqrt(_e360);
            let _e362 = u_xlat7_;
            let _e364 = u_xlat34_;
            let _e366 = u_xlat7_;
            let _e368 = (vec3(_e364) * _e366.xyz);
            u_xlat7_.x = _e368.x;
            u_xlat7_.y = _e368.y;
            u_xlat7_.z = _e368.z;
            let _e377 = u_xlati32_;
            let _e382 = _f_buffer1_.f_cb1_[(_e377 + 512i)];
            u_xlat34_ = (1f / _e382.x);
            let _e385 = u_xlat33_;
            u_xlat33_ = (_e385 * 25f);
            let _e388 = u_xlat33_;
            let _e389 = u_xlat34_;
            u_xlat33_ = (_e388 / _e389);
            let _e391 = u_xlat33_;
            u_xlat33_ = (_e391 + 1f);
            let _e396 = u_xlat33_;
            u_xlat33_ = (1f / _e396);
            let _e398 = u_xlati32_;
            let _e403 = _f_buffer1_.f_cb1_[(_e398 + 768i)];
            let _e405 = u_xlat7_;
            u_xlat34_ = dot(_e403.xyz, _e405.xyz);
            let _e408 = u_xlat34_;
            let _e409 = u_xlati32_;
            let _e414 = _f_buffer1_.f_cb1_[(_e409 + 512i)];
            let _e417 = u_xlati32_;
            let _e422 = _f_buffer1_.f_cb1_[(_e417 + 512i)];
            u_xlat34_ = ((_e408 * _e414.z) + _e422.w);
            let _e425 = u_xlat34_;
            u_xlat34_ = clamp(_e425, 0f, 1f);
            let _e429 = u_xlat34_;
            let _e430 = u_xlat34_;
            u_xlat34_ = (_e429 * _e430);
            let _e432 = u_xlat33_;
            let _e433 = u_xlat34_;
            u_xlat33_ = (_e432 * _e433);
            let _e435 = u_xlat8_;
            let _e437 = u_xlat33_;
            let _e439 = u_xlati32_;
            let _e444 = _f_buffer1_.f_cb1_[(_e439 + 256i)];
            let _e446 = (vec3(_e437) * _e444.xyz);
            u_xlat8_.x = _e446.x;
            u_xlat8_.y = _e446.y;
            u_xlat8_.z = _e446.z;
            let _e453 = u_xlat4_;
            let _e455 = u_xlat7_;
            u_xlat32_ = dot(_e453.xyz, _e455.xyz);
            let _e458 = u_xlat32_;
            u_xlat32_ = clamp(_e458, 0f, 1f);
            let _e462 = u_xlat6_;
            let _e464 = u_xlat8_;
            let _e466 = u_xlat32_;
            let _e469 = u_xlat6_;
            let _e471 = ((_e464.xyz * vec3(_e466)) + _e469.xyz);
            u_xlat6_.x = _e471.x;
            u_xlat6_.y = _e471.y;
            u_xlat6_.z = _e471.z;
        }
        continuing {
            let _e303 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e303 + 1u);
        }
    }
    let _e478 = u_xlat4_;
    let _e480 = u_xlat5_;
    let _e482 = u_xlat27_;
    let _e485 = u_xlat6_;
    let _e487 = ((_e480.xyz * vec3(_e482)) + _e485.xyz);
    u_xlat4_.x = _e487.x;
    u_xlat4_.y = _e487.y;
    u_xlat4_.z = _e487.z;
    let _e498 = _f_buffer2_.f_cb2_[27];
    u_xlat5_.x = abs(_e498.w);
    let _e505 = _f_buffer2_.f_cb2_[28];
    u_xlat5_.y = abs(_e505.w);
    let _e512 = _f_buffer2_.f_cb2_[29];
    u_xlat5_.z = abs(_e512.w);
    let _e515 = u_xlat5_;
    let _e517 = u_xlat5_;
    let _e519 = log2(_e517.xyz);
    u_xlat5_.x = _e519.x;
    u_xlat5_.y = _e519.y;
    u_xlat5_.z = _e519.z;
    let _e526 = u_xlat5_;
    let _e528 = u_xlat5_;
    let _e534 = (_e528.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat5_.x = _e534.x;
    u_xlat5_.y = _e534.y;
    u_xlat5_.z = _e534.z;
    let _e541 = u_xlat5_;
    let _e543 = u_xlat5_;
    let _e545 = exp2(_e543.xyz);
    u_xlat5_.x = _e545.x;
    u_xlat5_.y = _e545.y;
    u_xlat5_.z = _e545.z;
    let _e552 = u_xlat5_;
    let _e554 = u_xlat5_;
    let _e568 = ((_e554.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat5_.x = _e568.x;
    u_xlat5_.y = _e568.y;
    u_xlat5_.z = _e568.z;
    let _e575 = u_xlat5_;
    let _e577 = u_xlat5_;
    let _e583 = clamp(_e577.xyz, vec3(0f), vec3(1f));
    u_xlat5_.x = _e583.x;
    u_xlat5_.y = _e583.y;
    u_xlat5_.z = _e583.z;
    let _e590 = u_xlat4_;
    let _e592 = u_xlat4_;
    let _e594 = u_xlat5_;
    let _e596 = (_e592.xyz + _e594.xyz);
    u_xlat4_.x = _e596.x;
    u_xlat4_.y = _e596.y;
    u_xlat4_.z = _e596.z;
    let _e603 = u_xlat0_;
    let _e605 = u_xlat0_;
    let _e607 = u_xlat4_;
    let _e609 = (_e605.xyz * _e607.xyz);
    u_xlat0_.x = _e609.x;
    u_xlat0_.y = _e609.y;
    u_xlat0_.z = _e609.z;
    let _e616 = u_xlat3_;
    let _e618 = u_xlat3_;
    let _e623 = _f_buffer4_.f_cb4_[5];
    let _e625 = (_e618.zxy * _e623.zxy);
    u_xlat3_.x = _e625.x;
    u_xlat3_.y = _e625.y;
    u_xlat3_.z = _e625.z;
    let _e632 = u_xlat1_;
    let _e636 = _f_buffer4_.f_cb4_[3];
    u_xlat27_ = dot(_e632, _e636);
    let _e638 = u_xlat27_;
    u_xlat27_ = min(_e638, 1f);
    let _e641 = u_xlat27_;
    let _e642 = u_xlat3_;
    u_xlat27_ = (_e641 * _e642.z);
    let _e645 = u_xlat4_;
    let _e647 = u_xlat27_;
    let _e652 = _f_buffer4_.f_cb4_[2];
    let _e654 = (vec3(_e647) * _e652.xyz);
    u_xlat4_.x = _e654.x;
    u_xlat4_.y = _e654.y;
    u_xlat4_.z = _e654.z;
    let _e661 = u_xlat0_;
    let _e663 = u_xlat0_;
    let _e665 = u_xlat3_;
    let _e668 = u_xlat4_;
    let _e670 = ((_e663.xyz * _e665.yyy) + _e668.xyz);
    u_xlat0_.x = _e670.x;
    u_xlat0_.y = _e670.y;
    u_xlat0_.z = _e670.z;
    let _e677 = u_xlat0_;
    let _e679 = u_xlat3_;
    let _e684 = _f_buffer4_.f_cb4_[4];
    let _e687 = u_xlat0_;
    let _e689 = ((_e679.xxx * _e684.xyz) + _e687.xyz);
    u_xlat0_.x = _e689.x;
    u_xlat0_.y = _e689.y;
    u_xlat0_.z = _e689.z;
    let _e696 = u_xlat1_;
    let _e700 = _f_buffer4_.f_cb4_[7];
    u_xlat27_ = dot(_e696, _e700);
    let _e702 = u_xlat27_;
    u_xlat27_ = min(_e702, 1f);
    let _e708 = _f_buffer4_.f_cb4_[8];
    let _e714 = _f_buffer4_.f_cb4_[8];
    u_xlat12_ = (-(_e708.x) + _e714.y);
    let _e717 = u_xlat27_;
    let _e718 = u_xlat12_;
    let _e723 = _f_buffer4_.f_cb4_[8];
    u_xlat27_ = ((_e717 * _e718) + _e723.x);
    let _e727 = u_xlat3_;
    u_xlat3_.x = _e727.x;
    let _e730 = u_xlat3_;
    u_xlat3_.x = clamp(_e730.x, 0f, 1f);
    let _e735 = u_xlat27_;
    let _e740 = _f_buffer4_.f_cb4_[8];
    u_xlat12_ = (-(_e735) + _e740.y);
    let _e744 = u_xlat12_;
    let _e745 = u_xlat3_;
    u_xlat3_.x = (_e744 * _e745.x);
    let _e752 = _f_buffer4_.f_cb4_[6];
    let _e754 = u_xlat3_;
    let _e757 = u_xlat27_;
    SV_Target0_.w = ((_e752.x * _e754.x) + _e757);
    let _e759 = u_xlat1_;
    let _e763 = _f_buffer4_.f_cb4_[10];
    u_xlat27_ = dot(_e759, _e763);
    let _e765 = u_xlat27_;
    u_xlat27_ = min(_e765, 1f);
    let _e768 = u_xlat2_;
    let _e773 = _f_buffer4_.f_cb4_[9];
    u_xlat1_ = (_e768.wxyz * _e773.wxyz);
    let _e776 = u_xlatb3_;
    let _e786 = _f_buffer4_.f_cb4_[11];
    let _e789 = (vec4<f32>(0f, 0f, 0f, 0f) < _e786.wzww).xy;
    u_xlatb3_.x = _e789.x;
    u_xlatb3_.y = _e789.y;
    let _e795 = u_xlat1_;
    let _e800 = _f_buffer4_.f_cb4_[11];
    u_xlat1_.x = (_e795.x * _e800.w);
    let _e804 = u_xlat1_;
    u_xlat1_.x = _e804.x;
    let _e807 = u_xlat1_;
    u_xlat1_.x = clamp(_e807.x, 0f, 1f);
    let _e812 = u_xlat4_;
    let _e814 = u_xlat2_;
    let _e819 = _f_buffer4_.f_cb4_[9];
    let _e822 = u_xlat0_;
    let _e825 = ((_e814.xyz * _e819.xyz) + -(_e822.xyz));
    u_xlat4_.x = _e825.x;
    u_xlat4_.y = _e825.y;
    u_xlat4_.z = _e825.z;
    let _e832 = u_xlat4_;
    let _e834 = u_xlat1_;
    let _e836 = u_xlat4_;
    let _e839 = u_xlat0_;
    let _e841 = ((_e834.xxx * _e836.xyz) + _e839.xyz);
    u_xlat4_.x = _e841.x;
    u_xlat4_.y = _e841.y;
    u_xlat4_.z = _e841.z;
    let _e848 = u_xlat3_;
    let _e850 = u_xlatb3_;
    if _e850.x {
        let _e852 = u_xlat4_;
        local_2 = _e852.xyz;
    } else {
        let _e854 = u_xlat0_;
        local_2 = _e854.xyz;
    }
    let _e857 = local_2;
    u_xlat3_.x = _e857.x;
    u_xlat3_.z = _e857.y;
    u_xlat3_.w = _e857.z;
    let _e864 = u_xlat4_;
    let _e866 = u_xlat1_;
    let _e868 = u_xlat3_;
    let _e870 = (_e866.yzw * _e868.xzw);
    u_xlat4_.x = _e870.x;
    u_xlat4_.y = _e870.y;
    u_xlat4_.z = _e870.z;
    let _e877 = u_xlat3_;
    let _e879 = u_xlat4_;
    let _e884 = _f_buffer4_.f_cb4_[11];
    let _e887 = u_xlat3_;
    let _e889 = ((_e879.xyz * _e884.yyy) + _e887.xzw);
    u_xlat3_.x = _e889.x;
    u_xlat3_.z = _e889.y;
    u_xlat3_.w = _e889.z;
    let _e896 = u_xlat3_;
    let _e901 = _f_buffer4_.f_cb4_[11];
    let _e903 = u_xlat1_;
    let _e906 = u_xlat3_;
    let _e908 = ((_e901.xxx * _e903.yzw) + _e906.xzw);
    u_xlat3_.x = _e908.x;
    u_xlat3_.z = _e908.y;
    u_xlat3_.w = _e908.z;
    let _e915 = u_xlat4_;
    let _e917 = u_xlat3_;
    let _e919 = u_xlat3_;
    let _e921 = (_e917.xzw + _e919.xzw);
    u_xlat4_.x = _e921.x;
    u_xlat4_.y = _e921.y;
    u_xlat4_.z = _e921.z;
    let _e928 = u_xlat5_;
    let _e930 = u_xlat1_;
    let _e932 = u_xlat4_;
    let _e934 = (_e930.yzw * _e932.xyz);
    u_xlat5_.x = _e934.x;
    u_xlat5_.y = _e934.y;
    u_xlat5_.z = _e934.z;
    let _e941 = u_xlat6_;
    let _e943 = u_xlat3_;
    let _e950 = (-(_e943.xzw) + vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e950.x;
    u_xlat6_.y = _e950.y;
    u_xlat6_.z = _e950.z;
    let _e957 = u_xlat6_;
    let _e959 = u_xlat6_;
    let _e961 = u_xlat6_;
    let _e963 = (_e959.xyz + _e961.xyz);
    u_xlat6_.x = _e963.x;
    u_xlat6_.y = _e963.y;
    u_xlat6_.z = _e963.z;
    let _e970 = u_xlat2_;
    let _e972 = u_xlat2_;
    let _e978 = _f_buffer4_.f_cb4_[9];
    let _e985 = ((-(_e972.xyz) * _e978.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e985.x;
    u_xlat2_.y = _e985.y;
    u_xlat2_.z = _e985.z;
    let _e992 = u_xlat2_;
    let _e994 = u_xlat6_;
    let _e997 = u_xlat2_;
    let _e1004 = ((-(_e994.xyz) * _e997.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e1004.x;
    u_xlat2_.y = _e1004.y;
    u_xlat2_.z = _e1004.z;
    let _e1011 = u_xlat6_;
    let _e1013 = u_xlat4_;
    let _e1015 = floor(_e1013.xyz);
    u_xlat6_.x = _e1015.x;
    u_xlat6_.y = _e1015.y;
    u_xlat6_.z = _e1015.z;
    let _e1022 = u_xlat6_;
    let _e1024 = u_xlat6_;
    let _e1030 = min(_e1024.xyz, vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e1030.x;
    u_xlat6_.y = _e1030.y;
    u_xlat6_.z = _e1030.z;
    let _e1037 = u_xlat1_;
    let _e1039 = u_xlat4_;
    let _e1042 = u_xlat1_;
    let _e1045 = u_xlat2_;
    let _e1047 = ((-(_e1039.xyz) * _e1042.yzw) + _e1045.xyz);
    u_xlat1_.x = _e1047.x;
    u_xlat1_.y = _e1047.y;
    u_xlat1_.z = _e1047.z;
    let _e1054 = u_xlat1_;
    let _e1056 = u_xlat6_;
    let _e1058 = u_xlat1_;
    let _e1061 = u_xlat5_;
    let _e1063 = ((_e1056.xyz * _e1058.xyz) + _e1061.xyz);
    u_xlat1_.x = _e1063.x;
    u_xlat1_.y = _e1063.y;
    u_xlat1_.z = _e1063.z;
    let _e1070 = u_xlat1_;
    let _e1072 = u_xlat0_;
    let _e1075 = u_xlat1_;
    let _e1077 = (-(_e1072.xyz) + _e1075.xyz);
    u_xlat1_.x = _e1077.x;
    u_xlat1_.y = _e1077.y;
    u_xlat1_.z = _e1077.z;
    let _e1084 = u_xlat1_;
    let _e1089 = _f_buffer4_.f_cb4_[11];
    let _e1091 = u_xlat1_;
    let _e1094 = u_xlat0_;
    let _e1096 = ((_e1089.zzz * _e1091.xyz) + _e1094.xyz);
    u_xlat1_.x = _e1096.x;
    u_xlat1_.y = _e1096.y;
    u_xlat1_.z = _e1096.z;
    let _e1103 = u_xlat1_;
    let _e1105 = u_xlatb3_;
    if _e1105.y {
        let _e1107 = u_xlat1_;
        local_3 = _e1107.xyz;
    } else {
        let _e1109 = u_xlat3_;
        local_3 = _e1109.xzw;
    }
    let _e1112 = local_3;
    u_xlat1_.x = _e1112.x;
    u_xlat1_.y = _e1112.y;
    u_xlat1_.z = _e1112.z;
    let _e1119 = u_xlat1_;
    let _e1121 = u_xlat0_;
    let _e1124 = u_xlat1_;
    let _e1126 = (-(_e1121.xyz) + _e1124.xyz);
    u_xlat1_.x = _e1126.x;
    u_xlat1_.y = _e1126.y;
    u_xlat1_.z = _e1126.z;
    let _e1133 = SV_Target0_;
    let _e1135 = u_xlat27_;
    let _e1137 = u_xlat1_;
    let _e1140 = u_xlat0_;
    let _e1142 = ((vec3(_e1135) * _e1137.xyz) + _e1140.xyz);
    SV_Target0_.x = _e1142.x;
    SV_Target0_.y = _e1142.y;
    SV_Target0_.z = _e1142.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    main_1();
    let _e63 = SV_Target0_;
    return FragmentOutput(_e63);
}
