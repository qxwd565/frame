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
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler_comparison;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
@group(3) @binding(8) 
var f_t4_: texture_depth_2d;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_TEXCOORD3_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_TEXCOORD6_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlatb6_: vec3<bool> = vec3(false);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec3<f32> = vec3(0f);
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlat11_: vec3<f32> = vec3(0f);
    var u_xlatb11_: bool = false;
    var u_xlat24_: f32 = 0f;
    var u_xlat34_: f32 = 0f;
    var u_xlat35_: f32 = 0f;
    var u_xlatu35_: u32 = 0u;
    var u_xlat36_: f32 = 0f;
    var u_xlat37_: f32 = 0f;
    var u_xlatu37_: u32 = 0u;
    var u_xlatb37_: bool = false;
    var u_xlat38_: f32 = 0f;
    var u_xlati38_: i32 = 0i;
    var u_xlatu38_: u32 = 0u;
    var u_xlatb38_: bool = false;
    var u_xlat39_: f32 = 0f;
    var u_xlati39_: i32 = 0i;
    var u_xlat40_: f32 = 0f;
    var hlslcc_movcTemp: vec3<f32>;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var txVec0_: vec3<f32>;
    var local_3: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_4: array<vec4<u32>, 4> = ImmCB_0_;
    var local_5: f32;

    let _e136 = vs_TEXCOORD0_1;
    let _e141 = _f_buffer0_.f_cb0_[4];
    let _e146 = hscard_bias.values[0];
    let _e149 = textureSampleBias(f_t0_, samplerf_s0_, _e136.xy, (_e141.x + _e146.x));
    u_xlat0_ = _e149;
    let _e150 = u_xlat0_;
    let _e155 = _f_buffer3_.f_cb3_[2];
    u_xlat0_ = (_e150.wxyz * _e155.wxyz);
    let _e158 = vs_TEXCOORD0_1;
    let _e163 = _f_buffer0_.f_cb0_[4];
    let _e168 = hscard_bias.values[3];
    let _e171 = textureSampleBias(f_t3_, samplerf_s3_, _e158.xy, (_e163.x + _e168.x));
    u_xlat1_ = _e171;
    let _e172 = u_xlat1_;
    let _e176 = _f_buffer3_.f_cb3_[3];
    u_xlat1_ = (_e172 * _e176);
    let _e178 = vs_TEXCOORD0_1;
    let _e183 = _f_buffer0_.f_cb0_[4];
    let _e188 = hscard_bias.values[1];
    let _e191 = textureSampleBias(f_t1_, samplerf_s1_, _e178.xy, (_e183.x + _e188.x));
    u_xlat2_ = _e191;
    let _e193 = u_xlat2_;
    let _e195 = u_xlat2_;
    u_xlat2_.x = (_e193.x * _e195.w);
    let _e198 = u_xlat2_;
    let _e200 = u_xlat2_;
    let _e211 = ((_e200.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e211.x;
    u_xlat2_.y = _e211.y;
    let _e216 = u_xlat2_;
    let _e218 = u_xlat2_;
    u_xlat24_ = dot(_e216.xy, _e218.xy);
    let _e221 = u_xlat24_;
    u_xlat24_ = min(_e221, 1f);
    let _e224 = u_xlat24_;
    u_xlat24_ = (-(_e224) + 1f);
    let _e228 = u_xlat24_;
    u_xlat24_ = sqrt(_e228);
    let _e230 = u_xlat24_;
    u_xlat24_ = max(_e230, 0.0000000000000001f);
    let _e233 = vs_TEXCOORD0_1;
    let _e238 = _f_buffer0_.f_cb0_[4];
    let _e243 = hscard_bias.values[2];
    let _e246 = textureSampleBias(f_t2_, samplerf_s2_, _e233.xy, (_e238.x + _e243.x));
    u_xlat3_ = _e246;
    let _e247 = u_xlat4_;
    let _e249 = u_xlat2_;
    let _e251 = vs_TEXCOORD4_1;
    let _e253 = (_e249.yyy * _e251.xyz);
    u_xlat4_.x = _e253.x;
    u_xlat4_.y = _e253.y;
    u_xlat4_.z = _e253.z;
    let _e260 = u_xlat2_;
    let _e262 = u_xlat2_;
    let _e264 = vs_TEXCOORD3_1;
    let _e267 = u_xlat4_;
    let _e269 = ((_e262.xxx * _e264.xyz) + _e267.xyz);
    u_xlat2_.x = _e269.x;
    u_xlat2_.y = _e269.y;
    u_xlat2_.w = _e269.z;
    let _e276 = u_xlat2_;
    let _e278 = u_xlat24_;
    let _e280 = vs_TEXCOORD2_1;
    let _e283 = u_xlat2_;
    let _e285 = ((vec3(_e278) * _e280.xyz) + _e283.xyw);
    u_xlat2_.x = _e285.x;
    u_xlat2_.y = _e285.y;
    u_xlat2_.z = _e285.z;
    let _e292 = u_xlat2_;
    let _e294 = u_xlat2_;
    u_xlat35_ = dot(_e292.xyz, _e294.xyz);
    let _e297 = u_xlat35_;
    u_xlat35_ = inverseSqrt(_e297);
    let _e299 = u_xlat2_;
    let _e301 = u_xlat35_;
    let _e303 = u_xlat2_;
    let _e305 = (vec3(_e301) * _e303.xyz);
    u_xlat2_.x = _e305.x;
    u_xlat2_.y = _e305.y;
    u_xlat2_.z = _e305.z;
    let _e313 = vs_TEXCOORD2_1;
    u_xlat4_.x = _e313.w;
    let _e316 = vs_TEXCOORD3_1;
    u_xlat4_.y = _e316.w;
    let _e319 = vs_TEXCOORD4_1;
    u_xlat4_.z = _e319.w;
    let _e321 = u_xlat4_;
    let _e323 = u_xlat4_;
    u_xlat36_ = dot(_e321.xyz, _e323.xyz);
    let _e326 = u_xlat36_;
    u_xlat36_ = max(_e326, 0.000061035156f);
    let _e329 = u_xlat36_;
    u_xlat36_ = inverseSqrt(_e329);
    u_xlat2_.w = 1f;
    let _e337 = _f_buffer2_.f_cb2_[27];
    let _e338 = u_xlat2_;
    u_xlat5_.x = dot(_e337, _e338);
    let _e344 = _f_buffer2_.f_cb2_[28];
    let _e345 = u_xlat2_;
    u_xlat5_.y = dot(_e344, _e345);
    let _e351 = _f_buffer2_.f_cb2_[29];
    let _e352 = u_xlat2_;
    u_xlat5_.z = dot(_e351, _e352);
    let _e354 = u_xlat2_;
    let _e356 = u_xlat2_;
    u_xlat6_ = (_e354.yzzx * _e356.xyzz);
    let _e363 = _f_buffer2_.f_cb2_[30];
    let _e364 = u_xlat6_;
    u_xlat7_.x = dot(_e363, _e364);
    let _e370 = _f_buffer2_.f_cb2_[31];
    let _e371 = u_xlat6_;
    u_xlat7_.y = dot(_e370, _e371);
    let _e377 = _f_buffer2_.f_cb2_[32];
    let _e378 = u_xlat6_;
    u_xlat7_.z = dot(_e377, _e378);
    let _e380 = u_xlat2_;
    let _e382 = u_xlat2_;
    u_xlat35_ = (_e380.y * _e382.y);
    let _e385 = u_xlat2_;
    let _e387 = u_xlat2_;
    let _e390 = u_xlat35_;
    u_xlat35_ = ((_e385.x * _e387.x) + -(_e390));
    let _e393 = u_xlat6_;
    let _e398 = _f_buffer2_.f_cb2_[33];
    let _e400 = u_xlat35_;
    let _e403 = u_xlat7_;
    let _e405 = ((_e398.xyz * vec3(_e400)) + _e403.xyz);
    u_xlat6_.x = _e405.x;
    u_xlat6_.y = _e405.y;
    u_xlat6_.z = _e405.z;
    let _e412 = u_xlat5_;
    let _e414 = u_xlat5_;
    let _e416 = u_xlat6_;
    let _e418 = (_e414.xyz + _e416.xyz);
    u_xlat5_.x = _e418.x;
    u_xlat5_.y = _e418.y;
    u_xlat5_.z = _e418.z;
    let _e425 = u_xlatb6_;
    let _e432 = u_xlat5_;
    let _e435 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e432.xyzx).xyz;
    u_xlatb6_.x = _e435.x;
    u_xlatb6_.y = _e435.y;
    u_xlatb6_.z = _e435.z;
    let _e442 = u_xlat7_;
    let _e444 = u_xlat5_;
    let _e450 = (_e444.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat7_.x = _e450.x;
    u_xlat7_.y = _e450.y;
    u_xlat7_.z = _e450.z;
    let _e457 = u_xlat5_;
    let _e459 = u_xlat5_;
    let _e462 = log2(abs(_e459.xyz));
    u_xlat5_.x = _e462.x;
    u_xlat5_.y = _e462.y;
    u_xlat5_.z = _e462.z;
    let _e469 = u_xlat5_;
    let _e471 = u_xlat5_;
    let _e477 = (_e471.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat5_.x = _e477.x;
    u_xlat5_.y = _e477.y;
    u_xlat5_.z = _e477.z;
    let _e484 = u_xlat5_;
    let _e486 = u_xlat5_;
    let _e488 = exp2(_e486.xyz);
    u_xlat5_.x = _e488.x;
    u_xlat5_.y = _e488.y;
    u_xlat5_.z = _e488.z;
    let _e495 = u_xlat5_;
    let _e497 = u_xlat5_;
    let _e511 = ((_e497.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat5_.x = _e511.x;
    u_xlat5_.y = _e511.y;
    u_xlat5_.z = _e511.z;
    {
        let _e518 = u_xlat5_;
        hlslcc_movcTemp = _e518;
        let _e521 = u_xlatb6_;
        if _e521.x {
            let _e523 = u_xlat7_;
            local = _e523.x;
        } else {
            let _e525 = u_xlat5_;
            local = _e525.x;
        }
        let _e528 = local;
        hlslcc_movcTemp.x = _e528;
        let _e530 = u_xlatb6_;
        if _e530.y {
            let _e532 = u_xlat7_;
            local_1 = _e532.y;
        } else {
            let _e534 = u_xlat5_;
            local_1 = _e534.y;
        }
        let _e537 = local_1;
        hlslcc_movcTemp.y = _e537;
        let _e539 = u_xlatb6_;
        if _e539.z {
            let _e541 = u_xlat7_;
            local_2 = _e541.z;
        } else {
            let _e543 = u_xlat5_;
            local_2 = _e543.z;
        }
        let _e546 = local_2;
        hlslcc_movcTemp.z = _e546;
        let _e547 = hlslcc_movcTemp;
        u_xlat5_ = _e547;
    }
    let _e548 = vs_TEXCOORD6_1;
    let _e549 = _e548.xy;
    let _e550 = vs_TEXCOORD6_1;
    txVec0_ = vec3<f32>(_e549.x, _e549.y, _e550.z);
    let _e556 = txVec0_;
    let _e560 = textureSampleCompareLevel(f_t4_, samplerf_s4_, _e556.xy, _e556.z);
    u_xlat35_ = _e560;
    let _e564 = _f_buffer4_.f_cb4_[27];
    u_xlat37_ = (-(_e564.x) + 1f);
    let _e569 = u_xlat35_;
    let _e573 = _f_buffer4_.f_cb4_[27];
    let _e576 = u_xlat37_;
    u_xlat35_ = ((_e569 * _e573.x) + _e576);
    let _e579 = vs_TEXCOORD6_1;
    u_xlatb37_ = (0f >= _e579.z);
    let _e582 = vs_TEXCOORD6_1;
    u_xlatb38_ = (_e582.z >= 1f);
    let _e586 = u_xlatb37_;
    let _e587 = u_xlatb38_;
    u_xlatb37_ = (_e586 || _e587);
    let _e589 = u_xlatb37_;
    if _e589 {
        local_3 = 1f;
    } else {
        let _e591 = u_xlat35_;
        local_3 = _e591;
    }
    let _e593 = local_3;
    u_xlat35_ = _e593;
    let _e594 = u_xlat6_;
    let _e596 = vs_TEXCOORD1_1;
    let _e601 = _f_buffer0_.f_cb0_[21];
    let _e604 = (_e596.xyz + -(_e601.xyz));
    u_xlat6_.x = _e604.x;
    u_xlat6_.y = _e604.y;
    u_xlat6_.z = _e604.z;
    let _e611 = u_xlat6_;
    let _e613 = u_xlat6_;
    u_xlat37_ = dot(_e611.xyz, _e613.xyz);
    let _e616 = u_xlat37_;
    let _e620 = _f_buffer4_.f_cb4_[27];
    let _e626 = _f_buffer4_.f_cb4_[27];
    u_xlat37_ = ((_e616 * _e620.z) + _e626.w);
    let _e629 = u_xlat37_;
    u_xlat37_ = clamp(_e629, 0f, 1f);
    let _e633 = u_xlat35_;
    u_xlat38_ = (-(_e633) + 1f);
    let _e637 = u_xlat37_;
    let _e638 = u_xlat38_;
    let _e640 = u_xlat35_;
    u_xlat35_ = ((_e637 * _e638) + _e640);
    let _e642 = u_xlat35_;
    let _e646 = _f_buffer2_.f_cb2_[11];
    u_xlat35_ = (_e642 * _e646.z);
    let _e649 = u_xlat6_;
    let _e651 = u_xlat35_;
    let _e656 = _f_buffer0_.f_cb0_[6];
    let _e658 = (vec3(_e651) * _e656.xyz);
    u_xlat6_.x = _e658.x;
    u_xlat6_.y = _e658.y;
    u_xlat6_.z = _e658.z;
    let _e665 = u_xlat2_;
    let _e670 = _f_buffer0_.f_cb0_[5];
    u_xlat35_ = dot(_e665.xyz, _e670.xyz);
    let _e673 = u_xlat35_;
    u_xlat35_ = clamp(_e673, 0f, 1f);
    let _e677 = u_xlat7_;
    let _e679 = u_xlat35_;
    let _e681 = u_xlat6_;
    let _e683 = (vec3(_e679) * _e681.xyz);
    u_xlat7_.x = _e683.x;
    u_xlat7_.y = _e683.y;
    u_xlat7_.z = _e683.z;
    let _e690 = u_xlat1_;
    u_xlat34_ = ((_e690.w * 10f) + 1f);
    let _e696 = u_xlat34_;
    u_xlat34_ = exp2(_e696);
    let _e698 = u_xlat8_;
    let _e700 = u_xlat4_;
    let _e702 = u_xlat36_;
    let _e708 = _f_buffer0_.f_cb0_[5];
    let _e710 = ((_e700.xyz * vec3(_e702)) + _e708.xyz);
    u_xlat8_.x = _e710.x;
    u_xlat8_.y = _e710.y;
    u_xlat8_.z = _e710.z;
    let _e717 = u_xlat8_;
    let _e719 = u_xlat8_;
    u_xlat35_ = dot(_e717.xyz, _e719.xyz);
    let _e722 = u_xlat35_;
    u_xlat35_ = max(_e722, 0.000000000000000000000000000000000000011754944f);
    let _e725 = u_xlat35_;
    u_xlat35_ = inverseSqrt(_e725);
    let _e727 = u_xlat8_;
    let _e729 = u_xlat35_;
    let _e731 = u_xlat8_;
    let _e733 = (vec3(_e729) * _e731.xyz);
    u_xlat8_.x = _e733.x;
    u_xlat8_.y = _e733.y;
    u_xlat8_.z = _e733.z;
    let _e740 = u_xlat2_;
    let _e742 = u_xlat8_;
    u_xlat35_ = dot(_e740.xyz, _e742.xyz);
    let _e745 = u_xlat35_;
    u_xlat35_ = clamp(_e745, 0f, 1f);
    let _e749 = u_xlat35_;
    u_xlat35_ = log2(_e749);
    let _e751 = u_xlat34_;
    let _e752 = u_xlat35_;
    u_xlat35_ = (_e751 * _e752);
    let _e754 = u_xlat35_;
    u_xlat35_ = exp2(_e754);
    let _e756 = u_xlat8_;
    let _e758 = u_xlat1_;
    let _e760 = u_xlat35_;
    let _e762 = (_e758.xyz * vec3(_e760));
    u_xlat8_.x = _e762.x;
    u_xlat8_.y = _e762.y;
    u_xlat8_.z = _e762.z;
    let _e769 = u_xlat6_;
    let _e771 = u_xlat6_;
    let _e773 = u_xlat8_;
    let _e775 = (_e771.xyz * _e773.xyz);
    u_xlat6_.x = _e775.x;
    u_xlat6_.y = _e775.y;
    u_xlat6_.z = _e775.z;
    let _e782 = u_xlat6_;
    let _e784 = u_xlat7_;
    let _e786 = u_xlat0_;
    let _e789 = u_xlat6_;
    let _e791 = ((_e784.xyz * _e786.yzw) + _e789.xyz);
    u_xlat6_.x = _e791.x;
    u_xlat6_.y = _e791.y;
    u_xlat6_.z = _e791.z;
    let _e801 = _f_buffer0_.f_cb0_[10];
    let _e806 = _f_buffer2_.f_cb2_[11];
    u_xlat35_ = min(_e801.x, _e806.y);
    let _e809 = u_xlat35_;
    u_xlatu35_ = u32(i32(_e809));
    u_xlat7_.x = 0f;
    u_xlat7_.y = 0f;
    u_xlat7_.z = 0f;
    loop {
        let _e823 = u_xlatu_loop_1_;
        let _e824 = u_xlatu35_;
        if !((_e823 < _e824)) {
            break;
        }
        {
            let _e830 = u_xlatu_loop_1_;
            u_xlatu38_ = (_e830 >> 2u);
            let _e833 = u_xlatu_loop_1_;
            u_xlati39_ = i32((_e833 & 3u));
            let _e837 = u_xlatu38_;
            let _e843 = _f_buffer2_.f_cb2_[(i32(_e837) + 12i)];
            let _e844 = u_xlati39_;
            let _e848 = local_4[_e844];
            u_xlat38_ = dot(_e843, bitcast<vec4<f32>>(_e848));
            let _e851 = u_xlat38_;
            u_xlati38_ = i32(_e851);
            let _e853 = u_xlat8_;
            let _e855 = vs_TEXCOORD1_1;
            let _e858 = u_xlati38_;
            let _e861 = _f_buffer1_.f_cb1_[_e858];
            let _e864 = u_xlati38_;
            let _e867 = _f_buffer1_.f_cb1_[_e864];
            let _e869 = ((-(_e855.xyz) * _e861.www) + _e867.xyz);
            u_xlat8_.x = _e869.x;
            u_xlat8_.y = _e869.y;
            u_xlat8_.z = _e869.z;
            let _e876 = u_xlat8_;
            let _e878 = u_xlat8_;
            u_xlat39_ = dot(_e876.xyz, _e878.xyz);
            let _e881 = u_xlat39_;
            u_xlat39_ = max(_e881, 0.000061035156f);
            let _e884 = u_xlat39_;
            u_xlat40_ = inverseSqrt(_e884);
            let _e886 = u_xlat8_;
            let _e888 = u_xlat40_;
            let _e890 = u_xlat8_;
            let _e892 = (vec3(_e888) * _e890.xyz);
            u_xlat8_.x = _e892.x;
            u_xlat8_.y = _e892.y;
            u_xlat8_.z = _e892.z;
            let _e901 = u_xlat39_;
            u_xlat40_ = (1f / _e901);
            let _e903 = u_xlat39_;
            let _e904 = u_xlati38_;
            let _e909 = _f_buffer1_.f_cb1_[(_e904 + 512i)];
            u_xlat39_ = (_e903 * _e909.x);
            let _e912 = u_xlat39_;
            let _e914 = u_xlat39_;
            u_xlat39_ = ((-(_e912) * _e914) + 1f);
            let _e918 = u_xlat39_;
            u_xlat39_ = max(_e918, 0f);
            let _e921 = u_xlat39_;
            let _e922 = u_xlat39_;
            u_xlat39_ = (_e921 * _e922);
            let _e924 = u_xlat39_;
            let _e925 = u_xlat40_;
            u_xlat39_ = (_e924 * _e925);
            let _e927 = u_xlati38_;
            let _e932 = _f_buffer1_.f_cb1_[(_e927 + 768i)];
            let _e934 = u_xlat8_;
            u_xlat40_ = dot(_e932.xyz, _e934.xyz);
            let _e937 = u_xlat40_;
            let _e938 = u_xlati38_;
            let _e943 = _f_buffer1_.f_cb1_[(_e938 + 512i)];
            let _e946 = u_xlati38_;
            let _e951 = _f_buffer1_.f_cb1_[(_e946 + 512i)];
            u_xlat40_ = ((_e937 * _e943.z) + _e951.w);
            let _e954 = u_xlat40_;
            u_xlat40_ = clamp(_e954, 0f, 1f);
            let _e958 = u_xlat40_;
            let _e959 = u_xlat40_;
            u_xlat40_ = (_e958 * _e959);
            let _e961 = u_xlat39_;
            let _e962 = u_xlat40_;
            u_xlat39_ = (_e961 * _e962);
            let _e964 = u_xlat9_;
            let _e966 = u_xlat39_;
            let _e968 = u_xlati38_;
            let _e973 = _f_buffer1_.f_cb1_[(_e968 + 256i)];
            let _e975 = (vec3(_e966) * _e973.xyz);
            u_xlat9_.x = _e975.x;
            u_xlat9_.y = _e975.y;
            u_xlat9_.z = _e975.z;
            let _e982 = u_xlat2_;
            let _e984 = u_xlat8_;
            u_xlat38_ = dot(_e982.xyz, _e984.xyz);
            let _e987 = u_xlat38_;
            u_xlat38_ = clamp(_e987, 0f, 1f);
            let _e991 = u_xlat10_;
            let _e993 = u_xlat38_;
            let _e995 = u_xlat9_;
            let _e997 = (vec3(_e993) * _e995.xyz);
            u_xlat10_.x = _e997.x;
            u_xlat10_.y = _e997.y;
            u_xlat10_.z = _e997.z;
            let _e1004 = u_xlat8_;
            let _e1006 = u_xlat4_;
            let _e1008 = u_xlat36_;
            let _e1011 = u_xlat8_;
            let _e1013 = ((_e1006.xyz * vec3(_e1008)) + _e1011.xyz);
            u_xlat8_.x = _e1013.x;
            u_xlat8_.y = _e1013.y;
            u_xlat8_.z = _e1013.z;
            let _e1020 = u_xlat8_;
            let _e1022 = u_xlat8_;
            u_xlat38_ = dot(_e1020.xyz, _e1022.xyz);
            let _e1025 = u_xlat38_;
            u_xlat38_ = max(_e1025, 0.000000000000000000000000000000000000011754944f);
            let _e1028 = u_xlat38_;
            u_xlat38_ = inverseSqrt(_e1028);
            let _e1030 = u_xlat8_;
            let _e1032 = u_xlat38_;
            let _e1034 = u_xlat8_;
            let _e1036 = (vec3(_e1032) * _e1034.xyz);
            u_xlat8_.x = _e1036.x;
            u_xlat8_.y = _e1036.y;
            u_xlat8_.z = _e1036.z;
            let _e1043 = u_xlat2_;
            let _e1045 = u_xlat8_;
            u_xlat38_ = dot(_e1043.xyz, _e1045.xyz);
            let _e1048 = u_xlat38_;
            u_xlat38_ = clamp(_e1048, 0f, 1f);
            let _e1052 = u_xlat38_;
            u_xlat38_ = log2(_e1052);
            let _e1054 = u_xlat34_;
            let _e1055 = u_xlat38_;
            u_xlat38_ = (_e1054 * _e1055);
            let _e1057 = u_xlat38_;
            u_xlat38_ = exp2(_e1057);
            let _e1059 = u_xlat8_;
            let _e1061 = u_xlat1_;
            let _e1063 = u_xlat38_;
            let _e1065 = (_e1061.xyz * vec3(_e1063));
            u_xlat8_.x = _e1065.x;
            u_xlat8_.y = _e1065.y;
            u_xlat8_.z = _e1065.z;
            let _e1072 = u_xlat8_;
            let _e1074 = u_xlat8_;
            let _e1076 = u_xlat9_;
            let _e1078 = (_e1074.xyz * _e1076.xyz);
            u_xlat8_.x = _e1078.x;
            u_xlat8_.y = _e1078.y;
            u_xlat8_.z = _e1078.z;
            let _e1085 = u_xlat8_;
            let _e1087 = u_xlat10_;
            let _e1089 = u_xlat0_;
            let _e1092 = u_xlat8_;
            let _e1094 = ((_e1087.xyz * _e1089.yzw) + _e1092.xyz);
            u_xlat8_.x = _e1094.x;
            u_xlat8_.y = _e1094.y;
            u_xlat8_.z = _e1094.z;
            let _e1101 = u_xlat7_;
            let _e1103 = u_xlat7_;
            let _e1105 = u_xlat8_;
            let _e1107 = (_e1103.xyz + _e1105.xyz);
            u_xlat7_.x = _e1107.x;
            u_xlat7_.y = _e1107.y;
            u_xlat7_.z = _e1107.z;
        }
        continuing {
            let _e827 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e827 + 1u);
        }
    }
    let _e1114 = u_xlat11_;
    let _e1116 = u_xlat5_;
    let _e1118 = u_xlat0_;
    let _e1121 = u_xlat6_;
    let _e1123 = ((_e1116.xyz * _e1118.yzw) + _e1121.xyz);
    u_xlat11_.x = _e1123.x;
    u_xlat11_.y = _e1123.y;
    u_xlat11_.z = _e1123.z;
    let _e1130 = u_xlat11_;
    let _e1132 = u_xlat7_;
    let _e1134 = u_xlat11_;
    let _e1136 = (_e1132.xyz + _e1134.xyz);
    u_xlat11_.x = _e1136.x;
    u_xlat11_.y = _e1136.y;
    u_xlat11_.z = _e1136.z;
    let _e1143 = SV_Target0_;
    let _e1145 = u_xlat3_;
    let _e1150 = _f_buffer3_.f_cb3_[4];
    let _e1153 = u_xlat11_;
    let _e1155 = ((_e1145.xyz * _e1150.xyz) + _e1153.xyz);
    SV_Target0_.x = _e1155.x;
    SV_Target0_.y = _e1155.y;
    SV_Target0_.z = _e1155.z;
    let _e1165 = _f_buffer3_.f_cb3_[5];
    u_xlatb11_ = (_e1165.y == 1f);
    let _e1170 = u_xlatb11_;
    if _e1170 {
        let _e1171 = u_xlat0_;
        local_5 = _e1171.x;
    } else {
        local_5 = 1f;
    }
    let _e1175 = local_5;
    SV_Target0_.w = _e1175;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(6) vs_TEXCOORD6_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    main_1();
    let _e67 = SV_Target0_;
    return FragmentOutput(_e67);
}
