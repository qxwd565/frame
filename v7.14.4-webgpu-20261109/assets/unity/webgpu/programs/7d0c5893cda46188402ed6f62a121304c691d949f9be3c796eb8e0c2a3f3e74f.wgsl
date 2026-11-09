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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
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
    var u_xlat18_: f32 = 0f;
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

    let _e111 = vs_TEXCOORD0_1;
    let _e116 = _f_buffer0_.f_cb0_[4];
    let _e121 = hscard_bias.values[1];
    let _e124 = textureSampleBias(f_t1_, samplerf_s1_, _e111.xy, (_e116.x + _e121.x));
    u_xlat0_ = _e124;
    let _e125 = vs_TEXCOORD0_1;
    let _e130 = _f_buffer0_.f_cb0_[4];
    let _e135 = hscard_bias.values[2];
    let _e138 = textureSampleBias(f_t2_, samplerf_s2_, _e125.zw, (_e130.x + _e135.x));
    u_xlat1_ = _e138;
    let _e139 = u_xlat1_;
    let _e143 = _f_buffer4_.f_cb4_[1];
    u_xlat1_ = (_e139 * _e143.zzzz);
    let _e146 = vs_TEXCOORD1_1;
    let _e151 = _f_buffer0_.f_cb0_[4];
    let _e156 = hscard_bias.values[3];
    let _e159 = textureSampleBias(f_t3_, samplerf_s3_, _e146.xy, (_e151.x + _e156.x));
    u_xlat2_ = _e159;
    let _e160 = u_xlat0_;
    let _e164 = _f_buffer4_.f_cb4_[1];
    let _e167 = u_xlat1_;
    u_xlat0_ = ((_e160 * _e164.yyyy) + _e167);
    let _e169 = u_xlat0_;
    let _e170 = vs_COLOR0_1;
    u_xlat0_ = (_e169 * _e170);
    let _e172 = u_xlat0_;
    u_xlat0_ = clamp(_e172, vec4(0f), vec4(1f));
    let _e178 = u_xlat0_;
    let _e180 = u_xlat2_;
    u_xlat18_ = (_e178.w + _e180.x);
    let _e183 = u_xlat2_;
    let _e185 = u_xlat18_;
    u_xlat18_ = (_e183.x * _e185);
    let _e187 = u_xlat18_;
    let _e191 = _f_buffer4_.f_cb4_[1];
    u_xlat18_ = (_e187 * _e191.x);
    let _e194 = u_xlat18_;
    u_xlat18_ = clamp(_e194, 0f, 1f);
    let _e198 = u_xlat1_;
    let _e200 = vs_TEXCOORD2_1;
    let _e205 = _f_buffer3_.f_cb3_[20];
    let _e208 = (_e200.xyz + -(_e205.xyz));
    u_xlat1_.x = _e208.x;
    u_xlat1_.y = _e208.y;
    u_xlat1_.z = _e208.z;
    let _e215 = u_xlat2_;
    let _e217 = vs_TEXCOORD2_1;
    let _e222 = _f_buffer3_.f_cb3_[21];
    let _e225 = (_e217.xyz + -(_e222.xyz));
    u_xlat2_.x = _e225.x;
    u_xlat2_.y = _e225.y;
    u_xlat2_.z = _e225.z;
    let _e232 = u_xlat3_;
    let _e234 = vs_TEXCOORD2_1;
    let _e239 = _f_buffer3_.f_cb3_[22];
    let _e242 = (_e234.xyz + -(_e239.xyz));
    u_xlat3_.x = _e242.x;
    u_xlat3_.y = _e242.y;
    u_xlat3_.z = _e242.z;
    let _e249 = u_xlat4_;
    let _e251 = vs_TEXCOORD2_1;
    let _e256 = _f_buffer3_.f_cb3_[23];
    let _e259 = (_e251.xyz + -(_e256.xyz));
    u_xlat4_.x = _e259.x;
    u_xlat4_.y = _e259.y;
    u_xlat4_.z = _e259.z;
    let _e267 = u_xlat1_;
    let _e269 = u_xlat1_;
    u_xlat1_.x = dot(_e267.xyz, _e269.xyz);
    let _e273 = u_xlat2_;
    let _e275 = u_xlat2_;
    u_xlat1_.y = dot(_e273.xyz, _e275.xyz);
    let _e279 = u_xlat3_;
    let _e281 = u_xlat3_;
    u_xlat1_.z = dot(_e279.xyz, _e281.xyz);
    let _e285 = u_xlat4_;
    let _e287 = u_xlat4_;
    u_xlat1_.w = dot(_e285.xyz, _e287.xyz);
    let _e290 = u_xlat1_;
    let _e294 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e290 < _e294);
    let _e297 = u_xlatb1_;
    if _e297.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e303 = local;
    u_xlat2_.x = _e303;
    let _e305 = u_xlatb1_;
    if _e305.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e311 = local_1;
    u_xlat2_.y = _e311;
    let _e313 = u_xlatb1_;
    if _e313.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e319 = local_2;
    u_xlat2_.z = _e319;
    let _e321 = u_xlatb1_;
    if _e321.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e327 = local_3;
    u_xlat2_.w = _e327;
    let _e329 = u_xlatb1_;
    if _e329.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e338 = local_4;
    u_xlat1_.x = _e338;
    let _e340 = u_xlatb1_;
    if _e340.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e349 = local_5;
    u_xlat1_.y = _e349;
    let _e351 = u_xlatb1_;
    if _e351.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e360 = local_6;
    u_xlat1_.z = _e360;
    let _e361 = u_xlat1_;
    let _e363 = u_xlat1_;
    let _e365 = u_xlat2_;
    let _e367 = (_e363.xyz + _e365.yzw);
    u_xlat1_.x = _e367.x;
    u_xlat1_.y = _e367.y;
    u_xlat1_.z = _e367.z;
    let _e374 = u_xlat2_;
    let _e376 = u_xlat1_;
    let _e382 = max(_e376.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e382.x;
    u_xlat2_.z = _e382.y;
    u_xlat2_.w = _e382.z;
    let _e390 = u_xlat2_;
    u_xlat1_.x = dot(_e390, vec4<f32>(4f, 3f, 2f, 1f));
    let _e398 = u_xlat1_;
    u_xlat1_.x = (-(_e398.x) + 4f);
    let _e403 = u_xlat1_;
    u_xlatu1_ = u32(_e403.x);
    let _e406 = u_xlatu1_;
    u_xlati1_ = (i32(_e406) << 2u);
    let _e411 = u_xlat7_;
    let _e413 = vs_TEXCOORD2_1;
    let _e415 = u_xlati1_;
    let _e420 = _f_buffer3_.f_cb3_[(_e415 + 1i)];
    let _e422 = (_e413.yyy * _e420.xyz);
    u_xlat7_.x = _e422.x;
    u_xlat7_.y = _e422.y;
    u_xlat7_.z = _e422.z;
    let _e429 = u_xlat7_;
    let _e431 = u_xlati1_;
    let _e434 = _f_buffer3_.f_cb3_[_e431];
    let _e436 = vs_TEXCOORD2_1;
    let _e439 = u_xlat7_;
    let _e441 = ((_e434.xyz * _e436.xxx) + _e439.xyz);
    u_xlat7_.x = _e441.x;
    u_xlat7_.y = _e441.y;
    u_xlat7_.z = _e441.z;
    let _e448 = u_xlat7_;
    let _e450 = u_xlati1_;
    let _e455 = _f_buffer3_.f_cb3_[(_e450 + 2i)];
    let _e457 = vs_TEXCOORD2_1;
    let _e460 = u_xlat7_;
    let _e462 = ((_e455.xyz * _e457.zzz) + _e460.xyz);
    u_xlat7_.x = _e462.x;
    u_xlat7_.y = _e462.y;
    u_xlat7_.z = _e462.z;
    let _e469 = u_xlat1_;
    let _e471 = u_xlat7_;
    let _e473 = u_xlati1_;
    let _e478 = _f_buffer3_.f_cb3_[(_e473 + 3i)];
    let _e480 = (_e471.xyz + _e478.xyz);
    u_xlat1_.x = _e480.x;
    u_xlat1_.y = _e480.y;
    u_xlat1_.z = _e480.z;
    let _e487 = vs_NORMAL0_1;
    let _e489 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e487.xyz, _e489.xyz);
    let _e492 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e492);
    let _e494 = u_xlat2_;
    let _e496 = u_xlat19_;
    let _e498 = vs_NORMAL0_1;
    let _e500 = (vec3(_e496) * _e498.xyz);
    u_xlat2_.x = _e500.x;
    u_xlat2_.y = _e500.y;
    u_xlat2_.z = _e500.z;
    let _e507 = u_xlat1_;
    let _e508 = _e507.xy;
    let _e509 = u_xlat1_;
    txVec0_ = vec3<f32>(_e508.x, _e508.y, _e509.z);
    let _e516 = txVec0_;
    let _e520 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e516.xy, _e516.z);
    u_xlat1_.x = _e520;
    let _e525 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e525.x) + 1f);
    let _e531 = u_xlat1_;
    let _e536 = _f_buffer3_.f_cb3_[27];
    let _e539 = u_xlat7_;
    u_xlat1_.x = ((_e531.x * _e536.x) + _e539.x);
    let _e543 = u_xlat1_;
    u_xlatb7_ = (0f >= _e543.z);
    let _e546 = u_xlat1_;
    u_xlatb13_ = (_e546.z >= 1f);
    let _e550 = u_xlatb13_;
    let _e551 = u_xlatb7_;
    u_xlatb7_ = (_e550 || _e551);
    let _e554 = u_xlatb7_;
    if _e554 {
        local_7 = 1f;
    } else {
        let _e556 = u_xlat1_;
        local_7 = _e556.x;
    }
    let _e559 = local_7;
    u_xlat1_.x = _e559;
    let _e561 = u_xlat1_;
    let _e566 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e561.x * _e566.z);
    let _e569 = u_xlat1_;
    let _e571 = u_xlat1_;
    let _e576 = _f_buffer0_.f_cb0_[6];
    let _e578 = (_e571.xxx * _e576.xyz);
    u_xlat1_.x = _e578.x;
    u_xlat1_.y = _e578.y;
    u_xlat1_.z = _e578.z;
    let _e585 = u_xlat2_;
    let _e590 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e585.xyz, _e590.xyz);
    let _e593 = u_xlat19_;
    u_xlat19_ = clamp(_e593, 0f, 1f);
    let _e600 = _f_buffer0_.f_cb0_[10];
    let _e605 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e600.x, _e605.y);
    let _e608 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e608));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e623 = u_xlatu_loop_1_;
        let _e624 = u_xlatu20_;
        if !((_e623 < _e624)) {
            break;
        }
        {
            let _e630 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e630 >> 2u);
            let _e633 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e633 & 3u));
            let _e638 = u_xlatu4_;
            let _e644 = _f_buffer2_.f_cb2_[(i32(_e638) + 12i)];
            let _e645 = u_xlati10_;
            let _e649 = local_8[_e645];
            u_xlat4_.x = dot(_e644, bitcast<vec4<f32>>(_e649));
            let _e652 = u_xlat4_;
            u_xlati4_ = i32(_e652.x);
            let _e655 = u_xlat10_;
            let _e657 = vs_TEXCOORD2_1;
            let _e660 = u_xlati4_;
            let _e663 = _f_buffer1_.f_cb1_[_e660];
            let _e666 = u_xlati4_;
            let _e669 = _f_buffer1_.f_cb1_[_e666];
            let _e671 = ((-(_e657.xyz) * _e663.www) + _e669.xyz);
            u_xlat10_.x = _e671.x;
            u_xlat10_.y = _e671.y;
            u_xlat10_.z = _e671.z;
            let _e679 = u_xlat10_;
            let _e681 = u_xlat10_;
            u_xlat5_.x = dot(_e679.xyz, _e681.xyz);
            let _e685 = u_xlat5_;
            u_xlat5_.x = max(_e685.x, 0.000061035156f);
            let _e689 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e689.x);
            let _e692 = u_xlat10_;
            let _e694 = u_xlat10_;
            let _e696 = u_xlat11_;
            let _e698 = (_e694.xyz * vec3(_e696));
            u_xlat10_.x = _e698.x;
            u_xlat10_.y = _e698.y;
            u_xlat10_.z = _e698.z;
            let _e707 = u_xlati4_;
            let _e712 = _f_buffer1_.f_cb1_[(_e707 + 512i)];
            u_xlat11_ = (1f / _e712.x);
            let _e716 = u_xlat5_;
            u_xlat5_.x = (_e716.x * 25f);
            let _e721 = u_xlat5_;
            let _e723 = u_xlat11_;
            u_xlat5_.x = (_e721.x / _e723);
            let _e726 = u_xlat5_;
            u_xlat5_.x = (_e726.x + 1f);
            let _e733 = u_xlat5_;
            u_xlat5_.x = (1f / _e733.x);
            let _e736 = u_xlati4_;
            let _e741 = _f_buffer1_.f_cb1_[(_e736 + 768i)];
            let _e743 = u_xlat10_;
            u_xlat11_ = dot(_e741.xyz, _e743.xyz);
            let _e746 = u_xlat11_;
            let _e747 = u_xlati4_;
            let _e752 = _f_buffer1_.f_cb1_[(_e747 + 512i)];
            let _e755 = u_xlati4_;
            let _e760 = _f_buffer1_.f_cb1_[(_e755 + 512i)];
            u_xlat11_ = ((_e746 * _e752.z) + _e760.w);
            let _e763 = u_xlat11_;
            u_xlat11_ = clamp(_e763, 0f, 1f);
            let _e767 = u_xlat11_;
            let _e768 = u_xlat11_;
            u_xlat11_ = (_e767 * _e768);
            let _e771 = u_xlat11_;
            let _e772 = u_xlat5_;
            u_xlat5_.x = (_e771 * _e772.x);
            let _e775 = u_xlat5_;
            let _e777 = u_xlat5_;
            let _e779 = u_xlati4_;
            let _e784 = _f_buffer1_.f_cb1_[(_e779 + 256i)];
            let _e786 = (_e777.xxx * _e784.xyz);
            u_xlat5_.x = _e786.x;
            u_xlat5_.y = _e786.y;
            u_xlat5_.z = _e786.z;
            let _e794 = u_xlat2_;
            let _e796 = u_xlat10_;
            u_xlat4_.x = dot(_e794.xyz, _e796.xyz);
            let _e800 = u_xlat4_;
            u_xlat4_.x = clamp(_e800.x, 0f, 1f);
            let _e805 = u_xlat3_;
            let _e807 = u_xlat5_;
            let _e809 = u_xlat4_;
            let _e812 = u_xlat3_;
            let _e814 = ((_e807.xyz * _e809.xxx) + _e812.xyz);
            u_xlat3_.x = _e814.x;
            u_xlat3_.y = _e814.y;
            u_xlat3_.z = _e814.z;
        }
        continuing {
            let _e627 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e627 + 1u);
        }
    }
    let _e821 = u_xlat1_;
    let _e823 = u_xlat1_;
    let _e825 = u_xlat19_;
    let _e828 = u_xlat3_;
    let _e830 = ((_e823.xyz * vec3(_e825)) + _e828.xyz);
    u_xlat1_.x = _e830.x;
    u_xlat1_.y = _e830.y;
    u_xlat1_.z = _e830.z;
    let _e841 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e841.w);
    let _e848 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e848.w);
    let _e855 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e855.w);
    let _e858 = u_xlat2_;
    let _e860 = u_xlat2_;
    let _e862 = log2(_e860.xyz);
    u_xlat2_.x = _e862.x;
    u_xlat2_.y = _e862.y;
    u_xlat2_.z = _e862.z;
    let _e869 = u_xlat2_;
    let _e871 = u_xlat2_;
    let _e877 = (_e871.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e877.x;
    u_xlat2_.y = _e877.y;
    u_xlat2_.z = _e877.z;
    let _e884 = u_xlat2_;
    let _e886 = u_xlat2_;
    let _e888 = exp2(_e886.xyz);
    u_xlat2_.x = _e888.x;
    u_xlat2_.y = _e888.y;
    u_xlat2_.z = _e888.z;
    let _e895 = u_xlat2_;
    let _e897 = u_xlat2_;
    let _e911 = ((_e897.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e911.x;
    u_xlat2_.y = _e911.y;
    u_xlat2_.z = _e911.z;
    let _e918 = u_xlat2_;
    let _e920 = u_xlat2_;
    let _e926 = clamp(_e920.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e926.x;
    u_xlat2_.y = _e926.y;
    u_xlat2_.z = _e926.z;
    let _e933 = u_xlat1_;
    let _e935 = u_xlat1_;
    let _e937 = u_xlat2_;
    let _e939 = (_e935.xyz + _e937.xyz);
    u_xlat1_.x = _e939.x;
    u_xlat1_.y = _e939.y;
    u_xlat1_.z = _e939.z;
    let _e946 = u_xlat1_;
    let _e948 = u_xlat18_;
    let _e950 = u_xlat1_;
    let _e952 = (vec3(_e948) * _e950.xyz);
    u_xlat1_.x = _e952.x;
    u_xlat1_.y = _e952.y;
    u_xlat1_.z = _e952.z;
    let _e959 = SV_TARGET0_;
    let _e961 = u_xlat0_;
    let _e963 = u_xlat1_;
    let _e965 = (_e961.xyz * _e963.xyz);
    SV_TARGET0_.x = _e965.x;
    SV_TARGET0_.y = _e965.y;
    SV_TARGET0_.z = _e965.z;
    let _e973 = u_xlat18_;
    SV_TARGET0_.w = _e973;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e59 = SV_TARGET0_;
    return FragmentOutput(_e59);
}
