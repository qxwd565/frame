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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec4<bool> = vec4(false);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlatb7_: vec3<bool> = vec3(false);
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
    var u_xlati37_: i32 = 0i;
    var u_xlatu37_: u32 = 0u;
    var u_xlatb37_: bool = false;
    var u_xlat38_: f32 = 0f;
    var u_xlati38_: i32 = 0i;
    var u_xlatu38_: u32 = 0u;
    var u_xlatb38_: bool = false;
    var u_xlat39_: f32 = 0f;
    var u_xlati39_: i32 = 0i;
    var u_xlat40_: f32 = 0f;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;
    var local_4: f32;
    var local_5: f32;
    var local_6: f32;
    var hlslcc_movcTemp: vec4<f32>;
    var local_7: f32;
    var local_8: f32;
    var local_9: f32;
    var txVec0_: vec3<f32>;
    var local_10: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_11: array<vec4<u32>, 4> = ImmCB_0_;
    var local_12: f32;

    let _e142 = vs_TEXCOORD0_1;
    let _e147 = _f_buffer0_.f_cb0_[4];
    let _e152 = hscard_bias.values[0];
    let _e155 = textureSampleBias(f_t0_, samplerf_s0_, _e142.xy, (_e147.x + _e152.x));
    u_xlat0_ = _e155;
    let _e156 = u_xlat0_;
    let _e161 = _f_buffer3_.f_cb3_[2];
    u_xlat0_ = (_e156.wxyz * _e161.wxyz);
    let _e164 = vs_TEXCOORD0_1;
    let _e169 = _f_buffer0_.f_cb0_[4];
    let _e174 = hscard_bias.values[3];
    let _e177 = textureSampleBias(f_t3_, samplerf_s3_, _e164.xy, (_e169.x + _e174.x));
    u_xlat1_ = _e177;
    let _e178 = u_xlat1_;
    let _e182 = _f_buffer3_.f_cb3_[3];
    u_xlat1_ = (_e178 * _e182);
    let _e184 = vs_TEXCOORD0_1;
    let _e189 = _f_buffer0_.f_cb0_[4];
    let _e194 = hscard_bias.values[1];
    let _e197 = textureSampleBias(f_t1_, samplerf_s1_, _e184.xy, (_e189.x + _e194.x));
    u_xlat2_ = _e197;
    let _e199 = u_xlat2_;
    let _e201 = u_xlat2_;
    u_xlat2_.x = (_e199.x * _e201.w);
    let _e204 = u_xlat2_;
    let _e206 = u_xlat2_;
    let _e217 = ((_e206.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e217.x;
    u_xlat2_.y = _e217.y;
    let _e222 = u_xlat2_;
    let _e224 = u_xlat2_;
    u_xlat24_ = dot(_e222.xy, _e224.xy);
    let _e227 = u_xlat24_;
    u_xlat24_ = min(_e227, 1f);
    let _e230 = u_xlat24_;
    u_xlat24_ = (-(_e230) + 1f);
    let _e234 = u_xlat24_;
    u_xlat24_ = sqrt(_e234);
    let _e236 = u_xlat24_;
    u_xlat24_ = max(_e236, 0.0000000000000001f);
    let _e239 = vs_TEXCOORD0_1;
    let _e244 = _f_buffer0_.f_cb0_[4];
    let _e249 = hscard_bias.values[2];
    let _e252 = textureSampleBias(f_t2_, samplerf_s2_, _e239.xy, (_e244.x + _e249.x));
    u_xlat3_ = _e252;
    let _e253 = u_xlat4_;
    let _e255 = u_xlat2_;
    let _e257 = vs_TEXCOORD4_1;
    let _e259 = (_e255.yyy * _e257.xyz);
    u_xlat4_.x = _e259.x;
    u_xlat4_.y = _e259.y;
    u_xlat4_.z = _e259.z;
    let _e266 = u_xlat2_;
    let _e268 = u_xlat2_;
    let _e270 = vs_TEXCOORD3_1;
    let _e273 = u_xlat4_;
    let _e275 = ((_e268.xxx * _e270.xyz) + _e273.xyz);
    u_xlat2_.x = _e275.x;
    u_xlat2_.y = _e275.y;
    u_xlat2_.w = _e275.z;
    let _e282 = u_xlat2_;
    let _e284 = u_xlat24_;
    let _e286 = vs_TEXCOORD2_1;
    let _e289 = u_xlat2_;
    let _e291 = ((vec3(_e284) * _e286.xyz) + _e289.xyw);
    u_xlat2_.x = _e291.x;
    u_xlat2_.y = _e291.y;
    u_xlat2_.z = _e291.z;
    let _e298 = u_xlat2_;
    let _e300 = u_xlat2_;
    u_xlat35_ = dot(_e298.xyz, _e300.xyz);
    let _e303 = u_xlat35_;
    u_xlat35_ = inverseSqrt(_e303);
    let _e305 = u_xlat2_;
    let _e307 = u_xlat35_;
    let _e309 = u_xlat2_;
    let _e311 = (vec3(_e307) * _e309.xyz);
    u_xlat2_.x = _e311.x;
    u_xlat2_.y = _e311.y;
    u_xlat2_.z = _e311.z;
    let _e319 = vs_TEXCOORD2_1;
    u_xlat4_.x = _e319.w;
    let _e322 = vs_TEXCOORD3_1;
    u_xlat4_.y = _e322.w;
    let _e325 = vs_TEXCOORD4_1;
    u_xlat4_.z = _e325.w;
    let _e327 = u_xlat4_;
    let _e329 = u_xlat4_;
    u_xlat36_ = dot(_e327.xyz, _e329.xyz);
    let _e332 = u_xlat36_;
    u_xlat36_ = max(_e332, 0.000061035156f);
    let _e335 = u_xlat36_;
    u_xlat36_ = inverseSqrt(_e335);
    let _e337 = u_xlat5_;
    let _e339 = vs_TEXCOORD1_1;
    let _e344 = _f_buffer4_.f_cb4_[20];
    let _e347 = (_e339.xyz + -(_e344.xyz));
    u_xlat5_.x = _e347.x;
    u_xlat5_.y = _e347.y;
    u_xlat5_.z = _e347.z;
    let _e354 = u_xlat6_;
    let _e356 = vs_TEXCOORD1_1;
    let _e361 = _f_buffer4_.f_cb4_[21];
    let _e364 = (_e356.xyz + -(_e361.xyz));
    u_xlat6_.x = _e364.x;
    u_xlat6_.y = _e364.y;
    u_xlat6_.z = _e364.z;
    let _e371 = u_xlat7_;
    let _e373 = vs_TEXCOORD1_1;
    let _e378 = _f_buffer4_.f_cb4_[22];
    let _e381 = (_e373.xyz + -(_e378.xyz));
    u_xlat7_.x = _e381.x;
    u_xlat7_.y = _e381.y;
    u_xlat7_.z = _e381.z;
    let _e388 = u_xlat8_;
    let _e390 = vs_TEXCOORD1_1;
    let _e395 = _f_buffer4_.f_cb4_[23];
    let _e398 = (_e390.xyz + -(_e395.xyz));
    u_xlat8_.x = _e398.x;
    u_xlat8_.y = _e398.y;
    u_xlat8_.z = _e398.z;
    let _e406 = u_xlat5_;
    let _e408 = u_xlat5_;
    u_xlat5_.x = dot(_e406.xyz, _e408.xyz);
    let _e412 = u_xlat6_;
    let _e414 = u_xlat6_;
    u_xlat5_.y = dot(_e412.xyz, _e414.xyz);
    let _e418 = u_xlat7_;
    let _e420 = u_xlat7_;
    u_xlat5_.z = dot(_e418.xyz, _e420.xyz);
    let _e424 = u_xlat8_;
    let _e426 = u_xlat8_;
    u_xlat5_.w = dot(_e424.xyz, _e426.xyz);
    let _e429 = u_xlat5_;
    let _e433 = _f_buffer4_.f_cb4_[24];
    u_xlatb5_ = (_e429 < _e433);
    let _e436 = u_xlatb5_;
    if _e436.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e442 = local;
    u_xlat6_.x = _e442;
    let _e444 = u_xlatb5_;
    if _e444.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e450 = local_1;
    u_xlat6_.y = _e450;
    let _e452 = u_xlatb5_;
    if _e452.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e458 = local_2;
    u_xlat6_.z = _e458;
    let _e460 = u_xlatb5_;
    if _e460.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e466 = local_3;
    u_xlat6_.w = _e466;
    let _e468 = u_xlatb5_;
    if _e468.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e477 = local_4;
    u_xlat5_.x = _e477;
    let _e479 = u_xlatb5_;
    if _e479.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e488 = local_5;
    u_xlat5_.y = _e488;
    let _e490 = u_xlatb5_;
    if _e490.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e499 = local_6;
    u_xlat5_.z = _e499;
    let _e500 = u_xlat5_;
    let _e502 = u_xlat5_;
    let _e504 = u_xlat6_;
    let _e506 = (_e502.xyz + _e504.yzw);
    u_xlat5_.x = _e506.x;
    u_xlat5_.y = _e506.y;
    u_xlat5_.z = _e506.z;
    let _e513 = u_xlat6_;
    let _e515 = u_xlat5_;
    let _e521 = max(_e515.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat6_.y = _e521.x;
    u_xlat6_.z = _e521.y;
    u_xlat6_.w = _e521.z;
    let _e528 = u_xlat6_;
    u_xlat37_ = dot(_e528, vec4<f32>(4f, 3f, 2f, 1f));
    let _e535 = u_xlat37_;
    u_xlat37_ = (-(_e535) + 4f);
    let _e539 = u_xlat37_;
    u_xlatu37_ = u32(_e539);
    let _e541 = u_xlatu37_;
    u_xlati37_ = (i32(_e541) << 2u);
    let _e546 = u_xlat5_;
    let _e548 = vs_TEXCOORD1_1;
    let _e550 = u_xlati37_;
    let _e555 = _f_buffer4_.f_cb4_[(_e550 + 1i)];
    let _e557 = (_e548.yyy * _e555.xyz);
    u_xlat5_.x = _e557.x;
    u_xlat5_.y = _e557.y;
    u_xlat5_.z = _e557.z;
    let _e564 = u_xlat5_;
    let _e566 = u_xlati37_;
    let _e569 = _f_buffer4_.f_cb4_[_e566];
    let _e571 = vs_TEXCOORD1_1;
    let _e574 = u_xlat5_;
    let _e576 = ((_e569.xyz * _e571.xxx) + _e574.xyz);
    u_xlat5_.x = _e576.x;
    u_xlat5_.y = _e576.y;
    u_xlat5_.z = _e576.z;
    let _e583 = u_xlat5_;
    let _e585 = u_xlati37_;
    let _e590 = _f_buffer4_.f_cb4_[(_e585 + 2i)];
    let _e592 = vs_TEXCOORD1_1;
    let _e595 = u_xlat5_;
    let _e597 = ((_e590.xyz * _e592.zzz) + _e595.xyz);
    u_xlat5_.x = _e597.x;
    u_xlat5_.y = _e597.y;
    u_xlat5_.z = _e597.z;
    let _e604 = u_xlat5_;
    let _e606 = u_xlat5_;
    let _e608 = u_xlati37_;
    let _e613 = _f_buffer4_.f_cb4_[(_e608 + 3i)];
    let _e615 = (_e606.xyz + _e613.xyz);
    u_xlat5_.x = _e615.x;
    u_xlat5_.y = _e615.y;
    u_xlat5_.z = _e615.z;
    u_xlat2_.w = 1f;
    let _e628 = _f_buffer2_.f_cb2_[27];
    let _e629 = u_xlat2_;
    u_xlat6_.x = dot(_e628, _e629);
    let _e635 = _f_buffer2_.f_cb2_[28];
    let _e636 = u_xlat2_;
    u_xlat6_.y = dot(_e635, _e636);
    let _e642 = _f_buffer2_.f_cb2_[29];
    let _e643 = u_xlat2_;
    u_xlat6_.z = dot(_e642, _e643);
    let _e645 = u_xlat2_;
    let _e647 = u_xlat2_;
    u_xlat7_ = (_e645.yzzx * _e647.xyzz);
    let _e654 = _f_buffer2_.f_cb2_[30];
    let _e655 = u_xlat7_;
    u_xlat8_.x = dot(_e654, _e655);
    let _e661 = _f_buffer2_.f_cb2_[31];
    let _e662 = u_xlat7_;
    u_xlat8_.y = dot(_e661, _e662);
    let _e668 = _f_buffer2_.f_cb2_[32];
    let _e669 = u_xlat7_;
    u_xlat8_.z = dot(_e668, _e669);
    let _e671 = u_xlat2_;
    let _e673 = u_xlat2_;
    u_xlat35_ = (_e671.y * _e673.y);
    let _e676 = u_xlat2_;
    let _e678 = u_xlat2_;
    let _e681 = u_xlat35_;
    u_xlat35_ = ((_e676.x * _e678.x) + -(_e681));
    let _e684 = u_xlat7_;
    let _e689 = _f_buffer2_.f_cb2_[33];
    let _e691 = u_xlat35_;
    let _e694 = u_xlat8_;
    let _e696 = ((_e689.xyz * vec3(_e691)) + _e694.xyz);
    u_xlat7_.x = _e696.x;
    u_xlat7_.y = _e696.y;
    u_xlat7_.z = _e696.z;
    let _e703 = u_xlat6_;
    let _e705 = u_xlat6_;
    let _e707 = u_xlat7_;
    let _e709 = (_e705.xyz + _e707.xyz);
    u_xlat6_.x = _e709.x;
    u_xlat6_.y = _e709.y;
    u_xlat6_.z = _e709.z;
    let _e716 = u_xlatb7_;
    let _e723 = u_xlat6_;
    let _e726 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e723.xyzx).xyz;
    u_xlatb7_.x = _e726.x;
    u_xlatb7_.y = _e726.y;
    u_xlatb7_.z = _e726.z;
    let _e733 = u_xlat8_;
    let _e735 = u_xlat6_;
    let _e741 = (_e735.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat8_.x = _e741.x;
    u_xlat8_.y = _e741.y;
    u_xlat8_.z = _e741.z;
    let _e748 = u_xlat6_;
    let _e750 = u_xlat6_;
    let _e753 = log2(abs(_e750.xyz));
    u_xlat6_.x = _e753.x;
    u_xlat6_.y = _e753.y;
    u_xlat6_.z = _e753.z;
    let _e760 = u_xlat6_;
    let _e762 = u_xlat6_;
    let _e768 = (_e762.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat6_.x = _e768.x;
    u_xlat6_.y = _e768.y;
    u_xlat6_.z = _e768.z;
    let _e775 = u_xlat6_;
    let _e777 = u_xlat6_;
    let _e779 = exp2(_e777.xyz);
    u_xlat6_.x = _e779.x;
    u_xlat6_.y = _e779.y;
    u_xlat6_.z = _e779.z;
    let _e786 = u_xlat6_;
    let _e788 = u_xlat6_;
    let _e802 = ((_e788.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat6_.x = _e802.x;
    u_xlat6_.y = _e802.y;
    u_xlat6_.z = _e802.z;
    {
        let _e809 = u_xlat6_;
        hlslcc_movcTemp = _e809;
        let _e812 = u_xlatb7_;
        if _e812.x {
            let _e814 = u_xlat8_;
            local_7 = _e814.x;
        } else {
            let _e816 = u_xlat6_;
            local_7 = _e816.x;
        }
        let _e819 = local_7;
        hlslcc_movcTemp.x = _e819;
        let _e821 = u_xlatb7_;
        if _e821.y {
            let _e823 = u_xlat8_;
            local_8 = _e823.y;
        } else {
            let _e825 = u_xlat6_;
            local_8 = _e825.y;
        }
        let _e828 = local_8;
        hlslcc_movcTemp.y = _e828;
        let _e830 = u_xlatb7_;
        if _e830.z {
            let _e832 = u_xlat8_;
            local_9 = _e832.z;
        } else {
            let _e834 = u_xlat6_;
            local_9 = _e834.z;
        }
        let _e837 = local_9;
        hlslcc_movcTemp.z = _e837;
        let _e838 = hlslcc_movcTemp;
        u_xlat6_ = _e838;
    }
    let _e839 = u_xlat5_;
    let _e840 = _e839.xy;
    let _e841 = u_xlat5_;
    txVec0_ = vec3<f32>(_e840.x, _e840.y, _e841.z);
    let _e847 = txVec0_;
    let _e851 = textureSampleCompareLevel(f_t4_, samplerf_s4_, _e847.xy, _e847.z);
    u_xlat35_ = _e851;
    let _e855 = _f_buffer4_.f_cb4_[27];
    u_xlat37_ = (-(_e855.x) + 1f);
    let _e860 = u_xlat35_;
    let _e864 = _f_buffer4_.f_cb4_[27];
    let _e867 = u_xlat37_;
    u_xlat35_ = ((_e860 * _e864.x) + _e867);
    let _e870 = u_xlat5_;
    u_xlatb37_ = (0f >= _e870.z);
    let _e874 = u_xlat5_;
    u_xlatb5_.x = (_e874.z >= 1f);
    let _e878 = u_xlatb37_;
    let _e879 = u_xlatb5_;
    u_xlatb37_ = (_e878 || _e879.x);
    let _e882 = u_xlatb37_;
    if _e882 {
        local_10 = 1f;
    } else {
        let _e884 = u_xlat35_;
        local_10 = _e884;
    }
    let _e886 = local_10;
    u_xlat35_ = _e886;
    let _e887 = u_xlat5_;
    let _e889 = vs_TEXCOORD1_1;
    let _e894 = _f_buffer0_.f_cb0_[21];
    let _e897 = (_e889.xyz + -(_e894.xyz));
    u_xlat5_.x = _e897.x;
    u_xlat5_.y = _e897.y;
    u_xlat5_.z = _e897.z;
    let _e904 = u_xlat5_;
    let _e906 = u_xlat5_;
    u_xlat37_ = dot(_e904.xyz, _e906.xyz);
    let _e909 = u_xlat37_;
    let _e913 = _f_buffer4_.f_cb4_[27];
    let _e919 = _f_buffer4_.f_cb4_[27];
    u_xlat37_ = ((_e909 * _e913.z) + _e919.w);
    let _e922 = u_xlat37_;
    u_xlat37_ = clamp(_e922, 0f, 1f);
    let _e927 = u_xlat35_;
    u_xlat5_.x = (-(_e927) + 1f);
    let _e931 = u_xlat37_;
    let _e932 = u_xlat5_;
    let _e935 = u_xlat35_;
    u_xlat35_ = ((_e931 * _e932.x) + _e935);
    let _e937 = u_xlat35_;
    let _e941 = _f_buffer2_.f_cb2_[11];
    u_xlat35_ = (_e937 * _e941.z);
    let _e944 = u_xlat5_;
    let _e946 = u_xlat35_;
    let _e951 = _f_buffer0_.f_cb0_[6];
    let _e953 = (vec3(_e946) * _e951.xyz);
    u_xlat5_.x = _e953.x;
    u_xlat5_.y = _e953.y;
    u_xlat5_.z = _e953.z;
    let _e960 = u_xlat2_;
    let _e965 = _f_buffer0_.f_cb0_[5];
    u_xlat35_ = dot(_e960.xyz, _e965.xyz);
    let _e968 = u_xlat35_;
    u_xlat35_ = clamp(_e968, 0f, 1f);
    let _e972 = u_xlat7_;
    let _e974 = u_xlat35_;
    let _e976 = u_xlat5_;
    let _e978 = (vec3(_e974) * _e976.xyz);
    u_xlat7_.x = _e978.x;
    u_xlat7_.y = _e978.y;
    u_xlat7_.z = _e978.z;
    let _e985 = u_xlat1_;
    u_xlat34_ = ((_e985.w * 10f) + 1f);
    let _e991 = u_xlat34_;
    u_xlat34_ = exp2(_e991);
    let _e993 = u_xlat8_;
    let _e995 = u_xlat4_;
    let _e997 = u_xlat36_;
    let _e1003 = _f_buffer0_.f_cb0_[5];
    let _e1005 = ((_e995.xyz * vec3(_e997)) + _e1003.xyz);
    u_xlat8_.x = _e1005.x;
    u_xlat8_.y = _e1005.y;
    u_xlat8_.z = _e1005.z;
    let _e1012 = u_xlat8_;
    let _e1014 = u_xlat8_;
    u_xlat35_ = dot(_e1012.xyz, _e1014.xyz);
    let _e1017 = u_xlat35_;
    u_xlat35_ = max(_e1017, 0.000000000000000000000000000000000000011754944f);
    let _e1020 = u_xlat35_;
    u_xlat35_ = inverseSqrt(_e1020);
    let _e1022 = u_xlat8_;
    let _e1024 = u_xlat35_;
    let _e1026 = u_xlat8_;
    let _e1028 = (vec3(_e1024) * _e1026.xyz);
    u_xlat8_.x = _e1028.x;
    u_xlat8_.y = _e1028.y;
    u_xlat8_.z = _e1028.z;
    let _e1035 = u_xlat2_;
    let _e1037 = u_xlat8_;
    u_xlat35_ = dot(_e1035.xyz, _e1037.xyz);
    let _e1040 = u_xlat35_;
    u_xlat35_ = clamp(_e1040, 0f, 1f);
    let _e1044 = u_xlat35_;
    u_xlat35_ = log2(_e1044);
    let _e1046 = u_xlat34_;
    let _e1047 = u_xlat35_;
    u_xlat35_ = (_e1046 * _e1047);
    let _e1049 = u_xlat35_;
    u_xlat35_ = exp2(_e1049);
    let _e1051 = u_xlat8_;
    let _e1053 = u_xlat1_;
    let _e1055 = u_xlat35_;
    let _e1057 = (_e1053.xyz * vec3(_e1055));
    u_xlat8_.x = _e1057.x;
    u_xlat8_.y = _e1057.y;
    u_xlat8_.z = _e1057.z;
    let _e1064 = u_xlat5_;
    let _e1066 = u_xlat5_;
    let _e1068 = u_xlat8_;
    let _e1070 = (_e1066.xyz * _e1068.xyz);
    u_xlat5_.x = _e1070.x;
    u_xlat5_.y = _e1070.y;
    u_xlat5_.z = _e1070.z;
    let _e1077 = u_xlat5_;
    let _e1079 = u_xlat7_;
    let _e1081 = u_xlat0_;
    let _e1084 = u_xlat5_;
    let _e1086 = ((_e1079.xyz * _e1081.yzw) + _e1084.xyz);
    u_xlat5_.x = _e1086.x;
    u_xlat5_.y = _e1086.y;
    u_xlat5_.z = _e1086.z;
    let _e1096 = _f_buffer0_.f_cb0_[10];
    let _e1101 = _f_buffer2_.f_cb2_[11];
    u_xlat35_ = min(_e1096.x, _e1101.y);
    let _e1104 = u_xlat35_;
    u_xlatu35_ = u32(i32(_e1104));
    u_xlat7_.x = 0f;
    u_xlat7_.y = 0f;
    u_xlat7_.z = 0f;
    loop {
        let _e1118 = u_xlatu_loop_1_;
        let _e1119 = u_xlatu35_;
        if !((_e1118 < _e1119)) {
            break;
        }
        {
            let _e1125 = u_xlatu_loop_1_;
            u_xlatu38_ = (_e1125 >> 2u);
            let _e1128 = u_xlatu_loop_1_;
            u_xlati39_ = i32((_e1128 & 3u));
            let _e1132 = u_xlatu38_;
            let _e1138 = _f_buffer2_.f_cb2_[(i32(_e1132) + 12i)];
            let _e1139 = u_xlati39_;
            let _e1143 = local_11[_e1139];
            u_xlat38_ = dot(_e1138, bitcast<vec4<f32>>(_e1143));
            let _e1146 = u_xlat38_;
            u_xlati38_ = i32(_e1146);
            let _e1148 = u_xlat8_;
            let _e1150 = vs_TEXCOORD1_1;
            let _e1153 = u_xlati38_;
            let _e1156 = _f_buffer1_.f_cb1_[_e1153];
            let _e1159 = u_xlati38_;
            let _e1162 = _f_buffer1_.f_cb1_[_e1159];
            let _e1164 = ((-(_e1150.xyz) * _e1156.www) + _e1162.xyz);
            u_xlat8_.x = _e1164.x;
            u_xlat8_.y = _e1164.y;
            u_xlat8_.z = _e1164.z;
            let _e1171 = u_xlat8_;
            let _e1173 = u_xlat8_;
            u_xlat39_ = dot(_e1171.xyz, _e1173.xyz);
            let _e1176 = u_xlat39_;
            u_xlat39_ = max(_e1176, 0.000061035156f);
            let _e1179 = u_xlat39_;
            u_xlat40_ = inverseSqrt(_e1179);
            let _e1181 = u_xlat8_;
            let _e1183 = u_xlat40_;
            let _e1185 = u_xlat8_;
            let _e1187 = (vec3(_e1183) * _e1185.xyz);
            u_xlat8_.x = _e1187.x;
            u_xlat8_.y = _e1187.y;
            u_xlat8_.z = _e1187.z;
            let _e1196 = u_xlat39_;
            u_xlat40_ = (1f / _e1196);
            let _e1198 = u_xlat39_;
            let _e1199 = u_xlati38_;
            let _e1204 = _f_buffer1_.f_cb1_[(_e1199 + 512i)];
            u_xlat39_ = (_e1198 * _e1204.x);
            let _e1207 = u_xlat39_;
            let _e1209 = u_xlat39_;
            u_xlat39_ = ((-(_e1207) * _e1209) + 1f);
            let _e1213 = u_xlat39_;
            u_xlat39_ = max(_e1213, 0f);
            let _e1216 = u_xlat39_;
            let _e1217 = u_xlat39_;
            u_xlat39_ = (_e1216 * _e1217);
            let _e1219 = u_xlat39_;
            let _e1220 = u_xlat40_;
            u_xlat39_ = (_e1219 * _e1220);
            let _e1222 = u_xlati38_;
            let _e1227 = _f_buffer1_.f_cb1_[(_e1222 + 768i)];
            let _e1229 = u_xlat8_;
            u_xlat40_ = dot(_e1227.xyz, _e1229.xyz);
            let _e1232 = u_xlat40_;
            let _e1233 = u_xlati38_;
            let _e1238 = _f_buffer1_.f_cb1_[(_e1233 + 512i)];
            let _e1241 = u_xlati38_;
            let _e1246 = _f_buffer1_.f_cb1_[(_e1241 + 512i)];
            u_xlat40_ = ((_e1232 * _e1238.z) + _e1246.w);
            let _e1249 = u_xlat40_;
            u_xlat40_ = clamp(_e1249, 0f, 1f);
            let _e1253 = u_xlat40_;
            let _e1254 = u_xlat40_;
            u_xlat40_ = (_e1253 * _e1254);
            let _e1256 = u_xlat39_;
            let _e1257 = u_xlat40_;
            u_xlat39_ = (_e1256 * _e1257);
            let _e1259 = u_xlat9_;
            let _e1261 = u_xlat39_;
            let _e1263 = u_xlati38_;
            let _e1268 = _f_buffer1_.f_cb1_[(_e1263 + 256i)];
            let _e1270 = (vec3(_e1261) * _e1268.xyz);
            u_xlat9_.x = _e1270.x;
            u_xlat9_.y = _e1270.y;
            u_xlat9_.z = _e1270.z;
            let _e1277 = u_xlat2_;
            let _e1279 = u_xlat8_;
            u_xlat38_ = dot(_e1277.xyz, _e1279.xyz);
            let _e1282 = u_xlat38_;
            u_xlat38_ = clamp(_e1282, 0f, 1f);
            let _e1286 = u_xlat10_;
            let _e1288 = u_xlat38_;
            let _e1290 = u_xlat9_;
            let _e1292 = (vec3(_e1288) * _e1290.xyz);
            u_xlat10_.x = _e1292.x;
            u_xlat10_.y = _e1292.y;
            u_xlat10_.z = _e1292.z;
            let _e1299 = u_xlat8_;
            let _e1301 = u_xlat4_;
            let _e1303 = u_xlat36_;
            let _e1306 = u_xlat8_;
            let _e1308 = ((_e1301.xyz * vec3(_e1303)) + _e1306.xyz);
            u_xlat8_.x = _e1308.x;
            u_xlat8_.y = _e1308.y;
            u_xlat8_.z = _e1308.z;
            let _e1315 = u_xlat8_;
            let _e1317 = u_xlat8_;
            u_xlat38_ = dot(_e1315.xyz, _e1317.xyz);
            let _e1320 = u_xlat38_;
            u_xlat38_ = max(_e1320, 0.000000000000000000000000000000000000011754944f);
            let _e1323 = u_xlat38_;
            u_xlat38_ = inverseSqrt(_e1323);
            let _e1325 = u_xlat8_;
            let _e1327 = u_xlat38_;
            let _e1329 = u_xlat8_;
            let _e1331 = (vec3(_e1327) * _e1329.xyz);
            u_xlat8_.x = _e1331.x;
            u_xlat8_.y = _e1331.y;
            u_xlat8_.z = _e1331.z;
            let _e1338 = u_xlat2_;
            let _e1340 = u_xlat8_;
            u_xlat38_ = dot(_e1338.xyz, _e1340.xyz);
            let _e1343 = u_xlat38_;
            u_xlat38_ = clamp(_e1343, 0f, 1f);
            let _e1347 = u_xlat38_;
            u_xlat38_ = log2(_e1347);
            let _e1349 = u_xlat34_;
            let _e1350 = u_xlat38_;
            u_xlat38_ = (_e1349 * _e1350);
            let _e1352 = u_xlat38_;
            u_xlat38_ = exp2(_e1352);
            let _e1354 = u_xlat8_;
            let _e1356 = u_xlat1_;
            let _e1358 = u_xlat38_;
            let _e1360 = (_e1356.xyz * vec3(_e1358));
            u_xlat8_.x = _e1360.x;
            u_xlat8_.y = _e1360.y;
            u_xlat8_.z = _e1360.z;
            let _e1367 = u_xlat8_;
            let _e1369 = u_xlat8_;
            let _e1371 = u_xlat9_;
            let _e1373 = (_e1369.xyz * _e1371.xyz);
            u_xlat8_.x = _e1373.x;
            u_xlat8_.y = _e1373.y;
            u_xlat8_.z = _e1373.z;
            let _e1380 = u_xlat8_;
            let _e1382 = u_xlat10_;
            let _e1384 = u_xlat0_;
            let _e1387 = u_xlat8_;
            let _e1389 = ((_e1382.xyz * _e1384.yzw) + _e1387.xyz);
            u_xlat8_.x = _e1389.x;
            u_xlat8_.y = _e1389.y;
            u_xlat8_.z = _e1389.z;
            let _e1396 = u_xlat7_;
            let _e1398 = u_xlat7_;
            let _e1400 = u_xlat8_;
            let _e1402 = (_e1398.xyz + _e1400.xyz);
            u_xlat7_.x = _e1402.x;
            u_xlat7_.y = _e1402.y;
            u_xlat7_.z = _e1402.z;
        }
        continuing {
            let _e1122 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e1122 + 1u);
        }
    }
    let _e1409 = u_xlat11_;
    let _e1411 = u_xlat6_;
    let _e1413 = u_xlat0_;
    let _e1416 = u_xlat5_;
    let _e1418 = ((_e1411.xyz * _e1413.yzw) + _e1416.xyz);
    u_xlat11_.x = _e1418.x;
    u_xlat11_.y = _e1418.y;
    u_xlat11_.z = _e1418.z;
    let _e1425 = u_xlat11_;
    let _e1427 = u_xlat7_;
    let _e1429 = u_xlat11_;
    let _e1431 = (_e1427.xyz + _e1429.xyz);
    u_xlat11_.x = _e1431.x;
    u_xlat11_.y = _e1431.y;
    u_xlat11_.z = _e1431.z;
    let _e1438 = SV_Target0_;
    let _e1440 = u_xlat3_;
    let _e1445 = _f_buffer3_.f_cb3_[4];
    let _e1448 = u_xlat11_;
    let _e1450 = ((_e1440.xyz * _e1445.xyz) + _e1448.xyz);
    SV_Target0_.x = _e1450.x;
    SV_Target0_.y = _e1450.y;
    SV_Target0_.z = _e1450.z;
    let _e1460 = _f_buffer3_.f_cb3_[5];
    u_xlatb11_ = (_e1460.y == 1f);
    let _e1465 = u_xlatb11_;
    if _e1465 {
        let _e1466 = u_xlat0_;
        local_12 = _e1466.x;
    } else {
        local_12 = 1f;
    }
    let _e1470 = local_12;
    SV_Target0_.w = _e1470;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    main_1();
    let _e63 = SV_Target0_;
    return FragmentOutput(_e63);
}
