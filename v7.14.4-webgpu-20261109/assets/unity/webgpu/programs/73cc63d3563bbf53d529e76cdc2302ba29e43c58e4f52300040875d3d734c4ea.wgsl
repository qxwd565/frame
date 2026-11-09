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
    f_cb4_: array<vec4<f32>, 13>,
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
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec3<f32>;
var<private> vs_TEXCOORD5_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb3_: vec4<bool> = vec4(false);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlati6_: i32 = 0i;
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat11_: f32 = 0f;
    var u_xlatb11_: bool = false;
    var u_xlat24_: f32 = 0f;
    var u_xlati24_: i32 = 0i;
    var u_xlatu24_: u32 = 0u;
    var u_xlat27_: f32 = 0f;
    var u_xlatu27_: u32 = 0u;
    var u_xlatu28_: u32 = 0u;
    var u_xlat29_: f32 = 0f;
    var u_xlati29_: i32 = 0i;
    var u_xlatu29_: u32 = 0u;
    var u_xlatb29_: bool = false;
    var u_xlat30_: f32 = 0f;
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
    var local_9: vec3<f32>;
    var local_10: vec3<f32>;

    let _e111 = vs_TEXCOORD0_1;
    let _e116 = _f_buffer0_.f_cb0_[4];
    let _e121 = hscard_bias.values[1];
    let _e124 = textureSampleBias(f_t1_, samplerf_s1_, _e111.xy, (_e116.x + _e121.x));
    u_xlat0_ = _e124;
    let _e125 = vs_TEXCOORD0_1;
    let _e130 = _f_buffer0_.f_cb0_[4];
    let _e135 = hscard_bias.values[2];
    let _e138 = textureSampleBias(f_t2_, samplerf_s2_, _e125.xy, (_e130.x + _e135.x));
    u_xlat1_ = _e138;
    let _e139 = vs_TEXCOORD0_1;
    let _e144 = _f_buffer0_.f_cb0_[4];
    let _e149 = hscard_bias.values[3];
    let _e152 = textureSampleBias(f_t3_, samplerf_s3_, _e139.zw, (_e144.x + _e149.x));
    u_xlat2_ = _e152;
    let _e153 = u_xlat3_;
    let _e155 = vs_TEXCOORD1_1;
    let _e160 = _f_buffer3_.f_cb3_[20];
    let _e163 = (_e155.xyz + -(_e160.xyz));
    u_xlat3_.x = _e163.x;
    u_xlat3_.y = _e163.y;
    u_xlat3_.z = _e163.z;
    let _e170 = u_xlat4_;
    let _e172 = vs_TEXCOORD1_1;
    let _e177 = _f_buffer3_.f_cb3_[21];
    let _e180 = (_e172.xyz + -(_e177.xyz));
    u_xlat4_.x = _e180.x;
    u_xlat4_.y = _e180.y;
    u_xlat4_.z = _e180.z;
    let _e187 = u_xlat5_;
    let _e189 = vs_TEXCOORD1_1;
    let _e194 = _f_buffer3_.f_cb3_[22];
    let _e197 = (_e189.xyz + -(_e194.xyz));
    u_xlat5_.x = _e197.x;
    u_xlat5_.y = _e197.y;
    u_xlat5_.z = _e197.z;
    let _e204 = u_xlat6_;
    let _e206 = vs_TEXCOORD1_1;
    let _e211 = _f_buffer3_.f_cb3_[23];
    let _e214 = (_e206.xyz + -(_e211.xyz));
    u_xlat6_.x = _e214.x;
    u_xlat6_.y = _e214.y;
    u_xlat6_.z = _e214.z;
    let _e222 = u_xlat3_;
    let _e224 = u_xlat3_;
    u_xlat3_.x = dot(_e222.xyz, _e224.xyz);
    let _e228 = u_xlat4_;
    let _e230 = u_xlat4_;
    u_xlat3_.y = dot(_e228.xyz, _e230.xyz);
    let _e234 = u_xlat5_;
    let _e236 = u_xlat5_;
    u_xlat3_.z = dot(_e234.xyz, _e236.xyz);
    let _e240 = u_xlat6_;
    let _e242 = u_xlat6_;
    u_xlat3_.w = dot(_e240.xyz, _e242.xyz);
    let _e245 = u_xlat3_;
    let _e249 = _f_buffer3_.f_cb3_[24];
    u_xlatb3_ = (_e245 < _e249);
    let _e252 = u_xlatb3_;
    if _e252.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e258 = local;
    u_xlat4_.x = _e258;
    let _e260 = u_xlatb3_;
    if _e260.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e266 = local_1;
    u_xlat4_.y = _e266;
    let _e268 = u_xlatb3_;
    if _e268.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e274 = local_2;
    u_xlat4_.z = _e274;
    let _e276 = u_xlatb3_;
    if _e276.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e282 = local_3;
    u_xlat4_.w = _e282;
    let _e284 = u_xlatb3_;
    if _e284.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e293 = local_4;
    u_xlat3_.x = _e293;
    let _e295 = u_xlatb3_;
    if _e295.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e304 = local_5;
    u_xlat3_.y = _e304;
    let _e306 = u_xlatb3_;
    if _e306.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e315 = local_6;
    u_xlat3_.z = _e315;
    let _e316 = u_xlat3_;
    let _e318 = u_xlat3_;
    let _e320 = u_xlat4_;
    let _e322 = (_e318.xyz + _e320.yzw);
    u_xlat3_.x = _e322.x;
    u_xlat3_.y = _e322.y;
    u_xlat3_.z = _e322.z;
    let _e329 = u_xlat4_;
    let _e331 = u_xlat3_;
    let _e337 = max(_e331.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat4_.y = _e337.x;
    u_xlat4_.z = _e337.y;
    u_xlat4_.w = _e337.z;
    let _e344 = u_xlat4_;
    u_xlat24_ = dot(_e344, vec4<f32>(4f, 3f, 2f, 1f));
    let _e351 = u_xlat24_;
    u_xlat24_ = (-(_e351) + 4f);
    let _e355 = u_xlat24_;
    u_xlatu24_ = u32(_e355);
    let _e357 = u_xlatu24_;
    u_xlati24_ = (i32(_e357) << 2u);
    let _e362 = u_xlat3_;
    let _e364 = vs_TEXCOORD1_1;
    let _e366 = u_xlati24_;
    let _e371 = _f_buffer3_.f_cb3_[(_e366 + 1i)];
    let _e373 = (_e364.yyy * _e371.xyz);
    u_xlat3_.x = _e373.x;
    u_xlat3_.y = _e373.y;
    u_xlat3_.z = _e373.z;
    let _e380 = u_xlat3_;
    let _e382 = u_xlati24_;
    let _e385 = _f_buffer3_.f_cb3_[_e382];
    let _e387 = vs_TEXCOORD1_1;
    let _e390 = u_xlat3_;
    let _e392 = ((_e385.xyz * _e387.xxx) + _e390.xyz);
    u_xlat3_.x = _e392.x;
    u_xlat3_.y = _e392.y;
    u_xlat3_.z = _e392.z;
    let _e399 = u_xlat3_;
    let _e401 = u_xlati24_;
    let _e406 = _f_buffer3_.f_cb3_[(_e401 + 2i)];
    let _e408 = vs_TEXCOORD1_1;
    let _e411 = u_xlat3_;
    let _e413 = ((_e406.xyz * _e408.zzz) + _e411.xyz);
    u_xlat3_.x = _e413.x;
    u_xlat3_.y = _e413.y;
    u_xlat3_.z = _e413.z;
    let _e420 = u_xlat3_;
    let _e422 = u_xlat3_;
    let _e424 = u_xlati24_;
    let _e429 = _f_buffer3_.f_cb3_[(_e424 + 3i)];
    let _e431 = (_e422.xyz + _e429.xyz);
    u_xlat3_.x = _e431.x;
    u_xlat3_.y = _e431.y;
    u_xlat3_.z = _e431.z;
    let _e438 = vs_NORMAL0_1;
    let _e440 = vs_NORMAL0_1;
    u_xlat24_ = dot(_e438.xyz, _e440.xyz);
    let _e443 = u_xlat24_;
    u_xlat24_ = inverseSqrt(_e443);
    let _e445 = u_xlat4_;
    let _e447 = u_xlat24_;
    let _e449 = vs_NORMAL0_1;
    let _e451 = (vec3(_e447) * _e449.xyz);
    u_xlat4_.x = _e451.x;
    u_xlat4_.y = _e451.y;
    u_xlat4_.z = _e451.z;
    let _e458 = u_xlat3_;
    let _e459 = _e458.xy;
    let _e460 = u_xlat3_;
    txVec0_ = vec3<f32>(_e459.x, _e459.y, _e460.z);
    let _e466 = txVec0_;
    let _e470 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e466.xy, _e466.z);
    u_xlat24_ = _e470;
    let _e475 = _f_buffer3_.f_cb3_[27];
    u_xlat3_.x = (-(_e475.x) + 1f);
    let _e480 = u_xlat24_;
    let _e484 = _f_buffer3_.f_cb3_[27];
    let _e487 = u_xlat3_;
    u_xlat24_ = ((_e480 * _e484.x) + _e487.x);
    let _e492 = u_xlat3_;
    u_xlatb3_.x = (0f >= _e492.z);
    let _e495 = u_xlat3_;
    u_xlatb11_ = (_e495.z >= 1f);
    let _e500 = u_xlatb11_;
    let _e501 = u_xlatb3_;
    u_xlatb3_.x = (_e500 || _e501.x);
    let _e504 = u_xlatb3_;
    if _e504.x {
        local_7 = 1f;
    } else {
        let _e507 = u_xlat24_;
        local_7 = _e507;
    }
    let _e509 = local_7;
    u_xlat24_ = _e509;
    let _e510 = u_xlat24_;
    let _e514 = _f_buffer2_.f_cb2_[11];
    u_xlat24_ = (_e510 * _e514.z);
    let _e517 = u_xlat3_;
    let _e519 = u_xlat24_;
    let _e524 = _f_buffer0_.f_cb0_[6];
    let _e526 = (vec3(_e519) * _e524.xyz);
    u_xlat3_.x = _e526.x;
    u_xlat3_.y = _e526.y;
    u_xlat3_.z = _e526.z;
    let _e533 = u_xlat4_;
    let _e538 = _f_buffer0_.f_cb0_[5];
    u_xlat24_ = dot(_e533.xyz, _e538.xyz);
    let _e541 = u_xlat24_;
    u_xlat24_ = clamp(_e541, 0f, 1f);
    let _e548 = _f_buffer0_.f_cb0_[10];
    let _e553 = _f_buffer2_.f_cb2_[11];
    u_xlat27_ = min(_e548.x, _e553.y);
    let _e556 = u_xlat27_;
    u_xlatu27_ = u32(i32(_e556));
    u_xlat5_.x = 0f;
    u_xlat5_.y = 0f;
    u_xlat5_.z = 0f;
    loop {
        let _e570 = u_xlatu_loop_1_;
        let _e571 = u_xlatu27_;
        if !((_e570 < _e571)) {
            break;
        }
        {
            let _e577 = u_xlatu_loop_1_;
            u_xlatu29_ = (_e577 >> 2u);
            let _e580 = u_xlatu_loop_1_;
            u_xlati6_ = i32((_e580 & 3u));
            let _e584 = u_xlatu29_;
            let _e590 = _f_buffer2_.f_cb2_[(i32(_e584) + 12i)];
            let _e591 = u_xlati6_;
            let _e595 = local_8[_e591];
            u_xlat29_ = dot(_e590, bitcast<vec4<f32>>(_e595));
            let _e598 = u_xlat29_;
            u_xlati29_ = i32(_e598);
            let _e600 = u_xlat6_;
            let _e602 = vs_TEXCOORD1_1;
            let _e605 = u_xlati29_;
            let _e608 = _f_buffer1_.f_cb1_[_e605];
            let _e611 = u_xlati29_;
            let _e614 = _f_buffer1_.f_cb1_[_e611];
            let _e616 = ((-(_e602.xyz) * _e608.www) + _e614.xyz);
            u_xlat6_.x = _e616.x;
            u_xlat6_.y = _e616.y;
            u_xlat6_.z = _e616.z;
            let _e623 = u_xlat6_;
            let _e625 = u_xlat6_;
            u_xlat30_ = dot(_e623.xyz, _e625.xyz);
            let _e628 = u_xlat30_;
            u_xlat30_ = max(_e628, 0.000061035156f);
            let _e632 = u_xlat30_;
            u_xlat7_.x = inverseSqrt(_e632);
            let _e634 = u_xlat6_;
            let _e636 = u_xlat6_;
            let _e638 = u_xlat7_;
            let _e640 = (_e636.xyz * _e638.xxx);
            u_xlat6_.x = _e640.x;
            u_xlat6_.y = _e640.y;
            u_xlat6_.z = _e640.z;
            let _e650 = u_xlati29_;
            let _e655 = _f_buffer1_.f_cb1_[(_e650 + 512i)];
            u_xlat7_.x = (1f / _e655.x);
            let _e658 = u_xlat30_;
            u_xlat30_ = (_e658 * 25f);
            let _e661 = u_xlat30_;
            let _e662 = u_xlat7_;
            u_xlat30_ = (_e661 / _e662.x);
            let _e665 = u_xlat30_;
            u_xlat30_ = (_e665 + 1f);
            let _e670 = u_xlat30_;
            u_xlat30_ = (1f / _e670);
            let _e673 = u_xlati29_;
            let _e678 = _f_buffer1_.f_cb1_[(_e673 + 768i)];
            let _e680 = u_xlat6_;
            u_xlat7_.x = dot(_e678.xyz, _e680.xyz);
            let _e684 = u_xlat7_;
            let _e686 = u_xlati29_;
            let _e691 = _f_buffer1_.f_cb1_[(_e686 + 512i)];
            let _e694 = u_xlati29_;
            let _e699 = _f_buffer1_.f_cb1_[(_e694 + 512i)];
            u_xlat7_.x = ((_e684.x * _e691.z) + _e699.w);
            let _e703 = u_xlat7_;
            u_xlat7_.x = clamp(_e703.x, 0f, 1f);
            let _e709 = u_xlat7_;
            let _e711 = u_xlat7_;
            u_xlat7_.x = (_e709.x * _e711.x);
            let _e714 = u_xlat30_;
            let _e715 = u_xlat7_;
            u_xlat30_ = (_e714 * _e715.x);
            let _e718 = u_xlat7_;
            let _e720 = u_xlat30_;
            let _e722 = u_xlati29_;
            let _e727 = _f_buffer1_.f_cb1_[(_e722 + 256i)];
            let _e729 = (vec3(_e720) * _e727.xyz);
            u_xlat7_.x = _e729.x;
            u_xlat7_.y = _e729.y;
            u_xlat7_.z = _e729.z;
            let _e736 = u_xlat4_;
            let _e738 = u_xlat6_;
            u_xlat29_ = dot(_e736.xyz, _e738.xyz);
            let _e741 = u_xlat29_;
            u_xlat29_ = clamp(_e741, 0f, 1f);
            let _e745 = u_xlat5_;
            let _e747 = u_xlat7_;
            let _e749 = u_xlat29_;
            let _e752 = u_xlat5_;
            let _e754 = ((_e747.xyz * vec3(_e749)) + _e752.xyz);
            u_xlat5_.x = _e754.x;
            u_xlat5_.y = _e754.y;
            u_xlat5_.z = _e754.z;
        }
        continuing {
            let _e574 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e574 + 1u);
        }
    }
    let _e761 = u_xlat3_;
    let _e763 = u_xlat3_;
    let _e765 = u_xlat24_;
    let _e768 = u_xlat5_;
    let _e770 = ((_e763.xyz * vec3(_e765)) + _e768.xyz);
    u_xlat3_.x = _e770.x;
    u_xlat3_.y = _e770.y;
    u_xlat3_.z = _e770.z;
    let _e781 = _f_buffer2_.f_cb2_[27];
    u_xlat4_.x = abs(_e781.w);
    let _e788 = _f_buffer2_.f_cb2_[28];
    u_xlat4_.y = abs(_e788.w);
    let _e795 = _f_buffer2_.f_cb2_[29];
    u_xlat4_.z = abs(_e795.w);
    let _e798 = u_xlat4_;
    let _e800 = u_xlat4_;
    let _e802 = log2(_e800.xyz);
    u_xlat4_.x = _e802.x;
    u_xlat4_.y = _e802.y;
    u_xlat4_.z = _e802.z;
    let _e809 = u_xlat4_;
    let _e811 = u_xlat4_;
    let _e817 = (_e811.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat4_.x = _e817.x;
    u_xlat4_.y = _e817.y;
    u_xlat4_.z = _e817.z;
    let _e824 = u_xlat4_;
    let _e826 = u_xlat4_;
    let _e828 = exp2(_e826.xyz);
    u_xlat4_.x = _e828.x;
    u_xlat4_.y = _e828.y;
    u_xlat4_.z = _e828.z;
    let _e835 = u_xlat4_;
    let _e837 = u_xlat4_;
    let _e851 = ((_e837.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat4_.x = _e851.x;
    u_xlat4_.y = _e851.y;
    u_xlat4_.z = _e851.z;
    let _e858 = u_xlat4_;
    let _e860 = u_xlat4_;
    let _e866 = clamp(_e860.xyz, vec3(0f), vec3(1f));
    u_xlat4_.x = _e866.x;
    u_xlat4_.y = _e866.y;
    u_xlat4_.z = _e866.z;
    let _e873 = u_xlat3_;
    let _e875 = u_xlat3_;
    let _e877 = u_xlat4_;
    let _e879 = (_e875.xyz + _e877.xyz);
    u_xlat3_.x = _e879.x;
    u_xlat3_.y = _e879.y;
    u_xlat3_.z = _e879.z;
    let _e886 = u_xlat4_;
    let _e888 = u_xlat0_;
    let _e890 = u_xlat3_;
    let _e892 = (_e888.xyz * _e890.xyz);
    u_xlat4_.x = _e892.x;
    u_xlat4_.y = _e892.y;
    u_xlat4_.z = _e892.z;
    let _e899 = vs_TEXCOORD5_1;
    let _e901 = vs_TEXCOORD4_1;
    u_xlat24_ = dot(_e899.xyz, _e901.xyz);
    let _e904 = u_xlat24_;
    u_xlat24_ = clamp(_e904, 0f, 1f);
    let _e908 = u_xlat24_;
    u_xlat24_ = (-(_e908) + 1f);
    let _e912 = u_xlat24_;
    u_xlat24_ = log2(_e912);
    let _e914 = u_xlat24_;
    let _e918 = _f_buffer4_.f_cb4_[7];
    u_xlat24_ = (_e914 * _e918.x);
    let _e921 = u_xlat24_;
    u_xlat24_ = exp2(_e921);
    let _e923 = u_xlat1_;
    let _e927 = _f_buffer4_.f_cb4_[6];
    u_xlat27_ = dot(_e923, _e927);
    let _e929 = u_xlat27_;
    u_xlat27_ = min(_e929, 1f);
    let _e932 = u_xlat24_;
    let _e933 = u_xlat27_;
    u_xlat24_ = (_e932 * _e933);
    let _e935 = u_xlat24_;
    let _e939 = _f_buffer4_.f_cb4_[7];
    u_xlat24_ = (_e935 * _e939.y);
    let _e942 = u_xlat24_;
    u_xlat24_ = clamp(_e942, 0f, 1f);
    let _e946 = u_xlat0_;
    let _e948 = u_xlat0_;
    let _e951 = u_xlat3_;
    let _e957 = _f_buffer4_.f_cb4_[5];
    let _e959 = ((-(_e948.xyz) * _e951.xyz) + _e957.xyz);
    u_xlat0_.x = _e959.x;
    u_xlat0_.y = _e959.y;
    u_xlat0_.z = _e959.z;
    let _e966 = u_xlat0_;
    let _e968 = u_xlat24_;
    let _e970 = u_xlat0_;
    let _e973 = u_xlat4_;
    let _e975 = ((vec3(_e968) * _e970.xyz) + _e973.xyz);
    u_xlat0_.x = _e975.x;
    u_xlat0_.y = _e975.y;
    u_xlat0_.z = _e975.z;
    let _e986 = _f_buffer0_.f_cb0_[5];
    let _e991 = _f_buffer0_.f_cb0_[5];
    u_xlat3_.x = dot(_e986.xyz, _e991.xyz);
    let _e995 = u_xlat3_;
    u_xlat3_.x = inverseSqrt(_e995.x);
    let _e998 = u_xlat3_;
    let _e1000 = u_xlat3_;
    let _e1005 = _f_buffer0_.f_cb0_[5];
    let _e1007 = (_e1000.xxx * _e1005.xyz);
    u_xlat3_.x = _e1007.x;
    u_xlat3_.y = _e1007.y;
    u_xlat3_.z = _e1007.z;
    let _e1015 = u_xlat3_;
    let _e1017 = vs_NORMAL0_1;
    u_xlat3_.x = dot(_e1015.xyz, _e1017.xyz);
    let _e1020 = u_xlat1_;
    let _e1024 = _f_buffer4_.f_cb4_[3];
    u_xlat11_ = dot(_e1020, _e1024);
    let _e1026 = u_xlat11_;
    u_xlat11_ = min(_e1026, 1f);
    let _e1030 = u_xlat11_;
    let _e1031 = u_xlat3_;
    u_xlat3_.x = (_e1030 * _e1031.x);
    let _e1035 = u_xlat3_;
    let _e1040 = _f_buffer4_.f_cb4_[4];
    u_xlat3_.x = (_e1035.x * _e1040.x);
    let _e1044 = u_xlat3_;
    u_xlat3_.x = clamp(_e1044.x, 0f, 1f);
    let _e1049 = u_xlat0_;
    let _e1054 = _f_buffer4_.f_cb4_[2];
    let _e1056 = u_xlat3_;
    let _e1059 = u_xlat0_;
    let _e1061 = ((_e1054.xyz * _e1056.xxx) + _e1059.xyz);
    u_xlat0_.x = _e1061.x;
    u_xlat0_.y = _e1061.y;
    u_xlat0_.z = _e1061.z;
    let _e1069 = u_xlat1_;
    let _e1073 = _f_buffer4_.f_cb4_[8];
    u_xlat3_.x = dot(_e1069, _e1073);
    let _e1076 = u_xlat3_;
    u_xlat3_.x = min(_e1076.x, 1f);
    let _e1083 = _f_buffer4_.f_cb4_[9];
    let _e1089 = _f_buffer4_.f_cb4_[9];
    u_xlat11_ = (-(_e1083.x) + _e1089.y);
    let _e1093 = u_xlat3_;
    let _e1095 = u_xlat11_;
    let _e1100 = _f_buffer4_.f_cb4_[9];
    u_xlat3_.x = ((_e1093.x * _e1095) + _e1100.x);
    let _e1103 = u_xlat3_;
    let _e1109 = _f_buffer4_.f_cb4_[9];
    u_xlat11_ = (-(_e1103.x) + _e1109.y);
    let _e1112 = u_xlat24_;
    let _e1113 = u_xlat11_;
    u_xlat24_ = (_e1112 * _e1113);
    let _e1119 = _f_buffer4_.f_cb4_[7];
    let _e1121 = u_xlat24_;
    let _e1123 = u_xlat3_;
    SV_Target0_.w = ((_e1119.z * _e1121) + _e1123.x);
    let _e1126 = u_xlat1_;
    let _e1130 = _f_buffer4_.f_cb4_[11];
    u_xlat24_ = dot(_e1126, _e1130);
    let _e1132 = u_xlat24_;
    u_xlat24_ = min(_e1132, 1f);
    let _e1135 = u_xlat2_;
    let _e1140 = _f_buffer4_.f_cb4_[10];
    u_xlat1_ = (_e1135.wxyz * _e1140.wxyz);
    let _e1143 = u_xlatb3_;
    let _e1153 = _f_buffer4_.f_cb4_[12];
    let _e1156 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1153.wzww).xy;
    u_xlatb3_.x = _e1156.x;
    u_xlatb3_.y = _e1156.y;
    let _e1162 = u_xlat1_;
    let _e1167 = _f_buffer4_.f_cb4_[12];
    u_xlat1_.x = (_e1162.x * _e1167.w);
    let _e1171 = u_xlat1_;
    u_xlat1_.x = _e1171.x;
    let _e1174 = u_xlat1_;
    u_xlat1_.x = clamp(_e1174.x, 0f, 1f);
    let _e1179 = u_xlat4_;
    let _e1181 = u_xlat2_;
    let _e1186 = _f_buffer4_.f_cb4_[10];
    let _e1189 = u_xlat0_;
    let _e1192 = ((_e1181.xyz * _e1186.xyz) + -(_e1189.xyz));
    u_xlat4_.x = _e1192.x;
    u_xlat4_.y = _e1192.y;
    u_xlat4_.z = _e1192.z;
    let _e1199 = u_xlat4_;
    let _e1201 = u_xlat1_;
    let _e1203 = u_xlat4_;
    let _e1206 = u_xlat0_;
    let _e1208 = ((_e1201.xxx * _e1203.xyz) + _e1206.xyz);
    u_xlat4_.x = _e1208.x;
    u_xlat4_.y = _e1208.y;
    u_xlat4_.z = _e1208.z;
    let _e1215 = u_xlat3_;
    let _e1217 = u_xlatb3_;
    if _e1217.x {
        let _e1219 = u_xlat4_;
        local_9 = _e1219.xyz;
    } else {
        let _e1221 = u_xlat0_;
        local_9 = _e1221.xyz;
    }
    let _e1224 = local_9;
    u_xlat3_.x = _e1224.x;
    u_xlat3_.z = _e1224.y;
    u_xlat3_.w = _e1224.z;
    let _e1231 = u_xlat4_;
    let _e1233 = u_xlat1_;
    let _e1235 = u_xlat3_;
    let _e1237 = (_e1233.yzw * _e1235.xzw);
    u_xlat4_.x = _e1237.x;
    u_xlat4_.y = _e1237.y;
    u_xlat4_.z = _e1237.z;
    let _e1244 = u_xlat3_;
    let _e1246 = u_xlat4_;
    let _e1251 = _f_buffer4_.f_cb4_[12];
    let _e1254 = u_xlat3_;
    let _e1256 = ((_e1246.xyz * _e1251.yyy) + _e1254.xzw);
    u_xlat3_.x = _e1256.x;
    u_xlat3_.z = _e1256.y;
    u_xlat3_.w = _e1256.z;
    let _e1263 = u_xlat3_;
    let _e1268 = _f_buffer4_.f_cb4_[12];
    let _e1270 = u_xlat1_;
    let _e1273 = u_xlat3_;
    let _e1275 = ((_e1268.xxx * _e1270.yzw) + _e1273.xzw);
    u_xlat3_.x = _e1275.x;
    u_xlat3_.z = _e1275.y;
    u_xlat3_.w = _e1275.z;
    let _e1282 = u_xlat4_;
    let _e1284 = u_xlat3_;
    let _e1286 = u_xlat3_;
    let _e1288 = (_e1284.xzw + _e1286.xzw);
    u_xlat4_.x = _e1288.x;
    u_xlat4_.y = _e1288.y;
    u_xlat4_.z = _e1288.z;
    let _e1295 = u_xlat5_;
    let _e1297 = u_xlat1_;
    let _e1299 = u_xlat4_;
    let _e1301 = (_e1297.yzw * _e1299.xyz);
    u_xlat5_.x = _e1301.x;
    u_xlat5_.y = _e1301.y;
    u_xlat5_.z = _e1301.z;
    let _e1308 = u_xlat6_;
    let _e1310 = u_xlat3_;
    let _e1317 = (-(_e1310.xzw) + vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e1317.x;
    u_xlat6_.y = _e1317.y;
    u_xlat6_.z = _e1317.z;
    let _e1324 = u_xlat6_;
    let _e1326 = u_xlat6_;
    let _e1328 = u_xlat6_;
    let _e1330 = (_e1326.xyz + _e1328.xyz);
    u_xlat6_.x = _e1330.x;
    u_xlat6_.y = _e1330.y;
    u_xlat6_.z = _e1330.z;
    let _e1337 = u_xlat2_;
    let _e1339 = u_xlat2_;
    let _e1345 = _f_buffer4_.f_cb4_[10];
    let _e1352 = ((-(_e1339.xyz) * _e1345.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e1352.x;
    u_xlat2_.y = _e1352.y;
    u_xlat2_.z = _e1352.z;
    let _e1359 = u_xlat2_;
    let _e1361 = u_xlat6_;
    let _e1364 = u_xlat2_;
    let _e1371 = ((-(_e1361.xyz) * _e1364.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e1371.x;
    u_xlat2_.y = _e1371.y;
    u_xlat2_.z = _e1371.z;
    let _e1378 = u_xlat6_;
    let _e1380 = u_xlat4_;
    let _e1382 = floor(_e1380.xyz);
    u_xlat6_.x = _e1382.x;
    u_xlat6_.y = _e1382.y;
    u_xlat6_.z = _e1382.z;
    let _e1389 = u_xlat6_;
    let _e1391 = u_xlat6_;
    let _e1397 = min(_e1391.xyz, vec3<f32>(1f, 1f, 1f));
    u_xlat6_.x = _e1397.x;
    u_xlat6_.y = _e1397.y;
    u_xlat6_.z = _e1397.z;
    let _e1404 = u_xlat1_;
    let _e1406 = u_xlat4_;
    let _e1409 = u_xlat1_;
    let _e1412 = u_xlat2_;
    let _e1414 = ((-(_e1406.xyz) * _e1409.yzw) + _e1412.xyz);
    u_xlat1_.x = _e1414.x;
    u_xlat1_.y = _e1414.y;
    u_xlat1_.z = _e1414.z;
    let _e1421 = u_xlat1_;
    let _e1423 = u_xlat6_;
    let _e1425 = u_xlat1_;
    let _e1428 = u_xlat5_;
    let _e1430 = ((_e1423.xyz * _e1425.xyz) + _e1428.xyz);
    u_xlat1_.x = _e1430.x;
    u_xlat1_.y = _e1430.y;
    u_xlat1_.z = _e1430.z;
    let _e1437 = u_xlat1_;
    let _e1439 = u_xlat0_;
    let _e1442 = u_xlat1_;
    let _e1444 = (-(_e1439.xyz) + _e1442.xyz);
    u_xlat1_.x = _e1444.x;
    u_xlat1_.y = _e1444.y;
    u_xlat1_.z = _e1444.z;
    let _e1451 = u_xlat1_;
    let _e1456 = _f_buffer4_.f_cb4_[12];
    let _e1458 = u_xlat1_;
    let _e1461 = u_xlat0_;
    let _e1463 = ((_e1456.zzz * _e1458.xyz) + _e1461.xyz);
    u_xlat1_.x = _e1463.x;
    u_xlat1_.y = _e1463.y;
    u_xlat1_.z = _e1463.z;
    let _e1470 = u_xlat1_;
    let _e1472 = u_xlatb3_;
    if _e1472.y {
        let _e1474 = u_xlat1_;
        local_10 = _e1474.xyz;
    } else {
        let _e1476 = u_xlat3_;
        local_10 = _e1476.xzw;
    }
    let _e1479 = local_10;
    u_xlat1_.x = _e1479.x;
    u_xlat1_.y = _e1479.y;
    u_xlat1_.z = _e1479.z;
    let _e1486 = u_xlat1_;
    let _e1488 = u_xlat0_;
    let _e1491 = u_xlat1_;
    let _e1493 = (-(_e1488.xyz) + _e1491.xyz);
    u_xlat1_.x = _e1493.x;
    u_xlat1_.y = _e1493.y;
    u_xlat1_.z = _e1493.z;
    let _e1500 = SV_Target0_;
    let _e1502 = u_xlat24_;
    let _e1504 = u_xlat1_;
    let _e1507 = u_xlat0_;
    let _e1509 = ((vec3(_e1502) * _e1504.xyz) + _e1507.xyz);
    SV_Target0_.x = _e1509.x;
    SV_Target0_.y = _e1509.y;
    SV_Target0_.z = _e1509.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec3<f32>, @location(5) vs_TEXCOORD5_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e59 = SV_Target0_;
    return FragmentOutput(_e59);
}
