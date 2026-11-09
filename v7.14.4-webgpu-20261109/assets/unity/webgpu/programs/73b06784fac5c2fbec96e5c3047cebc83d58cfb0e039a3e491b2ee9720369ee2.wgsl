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
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
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

    let _e105 = vs_TEXCOORD0_1;
    let _e110 = _f_buffer0_.f_cb0_[4];
    let _e115 = hscard_bias.values[1];
    let _e118 = textureSampleBias(f_t1_, samplerf_s1_, _e105.xy, (_e110.x + _e115.x));
    u_xlat0_ = _e118;
    let _e119 = u_xlat0_;
    let _e121 = u_xlat0_;
    let _e126 = _f_buffer4_.f_cb4_[0];
    let _e128 = (_e121.xyz * _e126.xyz);
    u_xlat0_.x = _e128.x;
    u_xlat0_.y = _e128.y;
    u_xlat0_.z = _e128.z;
    let _e135 = u_xlat0_;
    let _e140 = _f_buffer4_.f_cb4_[0];
    let _e146 = _f_buffer4_.f_cb4_[1];
    u_xlat18_ = ((_e135.w * _e140.w) + -(_e146.x));
    let _e150 = u_xlat18_;
    u_xlat18_ = ceil(_e150);
    let _e152 = u_xlat0_;
    let _e154 = u_xlat18_;
    let _e156 = u_xlat0_;
    let _e158 = (vec3(_e154) * _e156.xyz);
    u_xlat0_.x = _e158.x;
    u_xlat0_.y = _e158.y;
    u_xlat0_.z = _e158.z;
    let _e165 = u_xlat1_;
    let _e167 = vs_TEXCOORD1_1;
    let _e172 = _f_buffer3_.f_cb3_[20];
    let _e175 = (_e167.xyz + -(_e172.xyz));
    u_xlat1_.x = _e175.x;
    u_xlat1_.y = _e175.y;
    u_xlat1_.z = _e175.z;
    let _e182 = u_xlat2_;
    let _e184 = vs_TEXCOORD1_1;
    let _e189 = _f_buffer3_.f_cb3_[21];
    let _e192 = (_e184.xyz + -(_e189.xyz));
    u_xlat2_.x = _e192.x;
    u_xlat2_.y = _e192.y;
    u_xlat2_.z = _e192.z;
    let _e199 = u_xlat3_;
    let _e201 = vs_TEXCOORD1_1;
    let _e206 = _f_buffer3_.f_cb3_[22];
    let _e209 = (_e201.xyz + -(_e206.xyz));
    u_xlat3_.x = _e209.x;
    u_xlat3_.y = _e209.y;
    u_xlat3_.z = _e209.z;
    let _e216 = u_xlat4_;
    let _e218 = vs_TEXCOORD1_1;
    let _e223 = _f_buffer3_.f_cb3_[23];
    let _e226 = (_e218.xyz + -(_e223.xyz));
    u_xlat4_.x = _e226.x;
    u_xlat4_.y = _e226.y;
    u_xlat4_.z = _e226.z;
    let _e234 = u_xlat1_;
    let _e236 = u_xlat1_;
    u_xlat1_.x = dot(_e234.xyz, _e236.xyz);
    let _e240 = u_xlat2_;
    let _e242 = u_xlat2_;
    u_xlat1_.y = dot(_e240.xyz, _e242.xyz);
    let _e246 = u_xlat3_;
    let _e248 = u_xlat3_;
    u_xlat1_.z = dot(_e246.xyz, _e248.xyz);
    let _e252 = u_xlat4_;
    let _e254 = u_xlat4_;
    u_xlat1_.w = dot(_e252.xyz, _e254.xyz);
    let _e257 = u_xlat1_;
    let _e261 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e257 < _e261);
    let _e264 = u_xlatb1_;
    if _e264.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e270 = local;
    u_xlat2_.x = _e270;
    let _e272 = u_xlatb1_;
    if _e272.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e278 = local_1;
    u_xlat2_.y = _e278;
    let _e280 = u_xlatb1_;
    if _e280.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e286 = local_2;
    u_xlat2_.z = _e286;
    let _e288 = u_xlatb1_;
    if _e288.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e294 = local_3;
    u_xlat2_.w = _e294;
    let _e296 = u_xlatb1_;
    if _e296.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e305 = local_4;
    u_xlat1_.x = _e305;
    let _e307 = u_xlatb1_;
    if _e307.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e316 = local_5;
    u_xlat1_.y = _e316;
    let _e318 = u_xlatb1_;
    if _e318.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e327 = local_6;
    u_xlat1_.z = _e327;
    let _e328 = u_xlat1_;
    let _e330 = u_xlat1_;
    let _e332 = u_xlat2_;
    let _e334 = (_e330.xyz + _e332.yzw);
    u_xlat1_.x = _e334.x;
    u_xlat1_.y = _e334.y;
    u_xlat1_.z = _e334.z;
    let _e341 = u_xlat2_;
    let _e343 = u_xlat1_;
    let _e349 = max(_e343.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e349.x;
    u_xlat2_.z = _e349.y;
    u_xlat2_.w = _e349.z;
    let _e357 = u_xlat2_;
    u_xlat1_.x = dot(_e357, vec4<f32>(4f, 3f, 2f, 1f));
    let _e365 = u_xlat1_;
    u_xlat1_.x = (-(_e365.x) + 4f);
    let _e370 = u_xlat1_;
    u_xlatu1_ = u32(_e370.x);
    let _e373 = u_xlatu1_;
    u_xlati1_ = (i32(_e373) << 2u);
    let _e378 = u_xlat7_;
    let _e380 = vs_TEXCOORD1_1;
    let _e382 = u_xlati1_;
    let _e387 = _f_buffer3_.f_cb3_[(_e382 + 1i)];
    let _e389 = (_e380.yyy * _e387.xyz);
    u_xlat7_.x = _e389.x;
    u_xlat7_.y = _e389.y;
    u_xlat7_.z = _e389.z;
    let _e396 = u_xlat7_;
    let _e398 = u_xlati1_;
    let _e401 = _f_buffer3_.f_cb3_[_e398];
    let _e403 = vs_TEXCOORD1_1;
    let _e406 = u_xlat7_;
    let _e408 = ((_e401.xyz * _e403.xxx) + _e406.xyz);
    u_xlat7_.x = _e408.x;
    u_xlat7_.y = _e408.y;
    u_xlat7_.z = _e408.z;
    let _e415 = u_xlat7_;
    let _e417 = u_xlati1_;
    let _e422 = _f_buffer3_.f_cb3_[(_e417 + 2i)];
    let _e424 = vs_TEXCOORD1_1;
    let _e427 = u_xlat7_;
    let _e429 = ((_e422.xyz * _e424.zzz) + _e427.xyz);
    u_xlat7_.x = _e429.x;
    u_xlat7_.y = _e429.y;
    u_xlat7_.z = _e429.z;
    let _e436 = u_xlat1_;
    let _e438 = u_xlat7_;
    let _e440 = u_xlati1_;
    let _e445 = _f_buffer3_.f_cb3_[(_e440 + 3i)];
    let _e447 = (_e438.xyz + _e445.xyz);
    u_xlat1_.x = _e447.x;
    u_xlat1_.y = _e447.y;
    u_xlat1_.z = _e447.z;
    let _e454 = vs_NORMAL0_1;
    let _e456 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e454.xyz, _e456.xyz);
    let _e459 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e459);
    let _e461 = u_xlat2_;
    let _e463 = u_xlat19_;
    let _e465 = vs_NORMAL0_1;
    let _e467 = (vec3(_e463) * _e465.xyz);
    u_xlat2_.x = _e467.x;
    u_xlat2_.y = _e467.y;
    u_xlat2_.z = _e467.z;
    let _e474 = u_xlat1_;
    let _e475 = _e474.xy;
    let _e476 = u_xlat1_;
    txVec0_ = vec3<f32>(_e475.x, _e475.y, _e476.z);
    let _e483 = txVec0_;
    let _e487 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e483.xy, _e483.z);
    u_xlat1_.x = _e487;
    let _e492 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e492.x) + 1f);
    let _e498 = u_xlat1_;
    let _e503 = _f_buffer3_.f_cb3_[27];
    let _e506 = u_xlat7_;
    u_xlat1_.x = ((_e498.x * _e503.x) + _e506.x);
    let _e510 = u_xlat1_;
    u_xlatb7_ = (0f >= _e510.z);
    let _e513 = u_xlat1_;
    u_xlatb13_ = (_e513.z >= 1f);
    let _e517 = u_xlatb13_;
    let _e518 = u_xlatb7_;
    u_xlatb7_ = (_e517 || _e518);
    let _e521 = u_xlatb7_;
    if _e521 {
        local_7 = 1f;
    } else {
        let _e523 = u_xlat1_;
        local_7 = _e523.x;
    }
    let _e526 = local_7;
    u_xlat1_.x = _e526;
    let _e528 = u_xlat1_;
    let _e533 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e528.x * _e533.z);
    let _e536 = u_xlat1_;
    let _e538 = u_xlat1_;
    let _e543 = _f_buffer0_.f_cb0_[6];
    let _e545 = (_e538.xxx * _e543.xyz);
    u_xlat1_.x = _e545.x;
    u_xlat1_.y = _e545.y;
    u_xlat1_.z = _e545.z;
    let _e552 = u_xlat2_;
    let _e557 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e552.xyz, _e557.xyz);
    let _e560 = u_xlat19_;
    u_xlat19_ = clamp(_e560, 0f, 1f);
    let _e567 = _f_buffer0_.f_cb0_[10];
    let _e572 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e567.x, _e572.y);
    let _e575 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e575));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e590 = u_xlatu_loop_1_;
        let _e591 = u_xlatu20_;
        if !((_e590 < _e591)) {
            break;
        }
        {
            let _e597 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e597 >> 2u);
            let _e600 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e600 & 3u));
            let _e605 = u_xlatu4_;
            let _e611 = _f_buffer2_.f_cb2_[(i32(_e605) + 12i)];
            let _e612 = u_xlati10_;
            let _e616 = local_8[_e612];
            u_xlat4_.x = dot(_e611, bitcast<vec4<f32>>(_e616));
            let _e619 = u_xlat4_;
            u_xlati4_ = i32(_e619.x);
            let _e622 = u_xlat10_;
            let _e624 = vs_TEXCOORD1_1;
            let _e627 = u_xlati4_;
            let _e630 = _f_buffer1_.f_cb1_[_e627];
            let _e633 = u_xlati4_;
            let _e636 = _f_buffer1_.f_cb1_[_e633];
            let _e638 = ((-(_e624.xyz) * _e630.www) + _e636.xyz);
            u_xlat10_.x = _e638.x;
            u_xlat10_.y = _e638.y;
            u_xlat10_.z = _e638.z;
            let _e646 = u_xlat10_;
            let _e648 = u_xlat10_;
            u_xlat5_.x = dot(_e646.xyz, _e648.xyz);
            let _e652 = u_xlat5_;
            u_xlat5_.x = max(_e652.x, 0.000061035156f);
            let _e656 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e656.x);
            let _e659 = u_xlat10_;
            let _e661 = u_xlat10_;
            let _e663 = u_xlat11_;
            let _e665 = (_e661.xyz * vec3(_e663));
            u_xlat10_.x = _e665.x;
            u_xlat10_.y = _e665.y;
            u_xlat10_.z = _e665.z;
            let _e674 = u_xlati4_;
            let _e679 = _f_buffer1_.f_cb1_[(_e674 + 512i)];
            u_xlat11_ = (1f / _e679.x);
            let _e683 = u_xlat5_;
            u_xlat5_.x = (_e683.x * 25f);
            let _e688 = u_xlat5_;
            let _e690 = u_xlat11_;
            u_xlat5_.x = (_e688.x / _e690);
            let _e693 = u_xlat5_;
            u_xlat5_.x = (_e693.x + 1f);
            let _e700 = u_xlat5_;
            u_xlat5_.x = (1f / _e700.x);
            let _e703 = u_xlati4_;
            let _e708 = _f_buffer1_.f_cb1_[(_e703 + 768i)];
            let _e710 = u_xlat10_;
            u_xlat11_ = dot(_e708.xyz, _e710.xyz);
            let _e713 = u_xlat11_;
            let _e714 = u_xlati4_;
            let _e719 = _f_buffer1_.f_cb1_[(_e714 + 512i)];
            let _e722 = u_xlati4_;
            let _e727 = _f_buffer1_.f_cb1_[(_e722 + 512i)];
            u_xlat11_ = ((_e713 * _e719.z) + _e727.w);
            let _e730 = u_xlat11_;
            u_xlat11_ = clamp(_e730, 0f, 1f);
            let _e734 = u_xlat11_;
            let _e735 = u_xlat11_;
            u_xlat11_ = (_e734 * _e735);
            let _e738 = u_xlat11_;
            let _e739 = u_xlat5_;
            u_xlat5_.x = (_e738 * _e739.x);
            let _e742 = u_xlat5_;
            let _e744 = u_xlat5_;
            let _e746 = u_xlati4_;
            let _e751 = _f_buffer1_.f_cb1_[(_e746 + 256i)];
            let _e753 = (_e744.xxx * _e751.xyz);
            u_xlat5_.x = _e753.x;
            u_xlat5_.y = _e753.y;
            u_xlat5_.z = _e753.z;
            let _e761 = u_xlat2_;
            let _e763 = u_xlat10_;
            u_xlat4_.x = dot(_e761.xyz, _e763.xyz);
            let _e767 = u_xlat4_;
            u_xlat4_.x = clamp(_e767.x, 0f, 1f);
            let _e772 = u_xlat3_;
            let _e774 = u_xlat5_;
            let _e776 = u_xlat4_;
            let _e779 = u_xlat3_;
            let _e781 = ((_e774.xyz * _e776.xxx) + _e779.xyz);
            u_xlat3_.x = _e781.x;
            u_xlat3_.y = _e781.y;
            u_xlat3_.z = _e781.z;
        }
        continuing {
            let _e594 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e594 + 1u);
        }
    }
    let _e788 = u_xlat1_;
    let _e790 = u_xlat1_;
    let _e792 = u_xlat19_;
    let _e795 = u_xlat3_;
    let _e797 = ((_e790.xyz * vec3(_e792)) + _e795.xyz);
    u_xlat1_.x = _e797.x;
    u_xlat1_.y = _e797.y;
    u_xlat1_.z = _e797.z;
    let _e808 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e808.w);
    let _e815 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e815.w);
    let _e822 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e822.w);
    let _e825 = u_xlat2_;
    let _e827 = u_xlat2_;
    let _e829 = log2(_e827.xyz);
    u_xlat2_.x = _e829.x;
    u_xlat2_.y = _e829.y;
    u_xlat2_.z = _e829.z;
    let _e836 = u_xlat2_;
    let _e838 = u_xlat2_;
    let _e844 = (_e838.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e844.x;
    u_xlat2_.y = _e844.y;
    u_xlat2_.z = _e844.z;
    let _e851 = u_xlat2_;
    let _e853 = u_xlat2_;
    let _e855 = exp2(_e853.xyz);
    u_xlat2_.x = _e855.x;
    u_xlat2_.y = _e855.y;
    u_xlat2_.z = _e855.z;
    let _e862 = u_xlat2_;
    let _e864 = u_xlat2_;
    let _e878 = ((_e864.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e878.x;
    u_xlat2_.y = _e878.y;
    u_xlat2_.z = _e878.z;
    let _e885 = u_xlat2_;
    let _e887 = u_xlat2_;
    let _e893 = clamp(_e887.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e893.x;
    u_xlat2_.y = _e893.y;
    u_xlat2_.z = _e893.z;
    let _e900 = u_xlat1_;
    let _e902 = u_xlat1_;
    let _e904 = u_xlat2_;
    let _e906 = (_e902.xyz + _e904.xyz);
    u_xlat1_.x = _e906.x;
    u_xlat1_.y = _e906.y;
    u_xlat1_.z = _e906.z;
    let _e913 = SV_TARGET0_;
    let _e915 = u_xlat0_;
    let _e917 = u_xlat1_;
    let _e919 = (_e915.xyz * _e917.xyz);
    SV_TARGET0_.x = _e919.x;
    SV_TARGET0_.y = _e919.y;
    SV_TARGET0_.z = _e919.z;
    let _e927 = u_xlat18_;
    SV_TARGET0_.w = _e927;
    return;
}

@fragment 
fn main(@location(12) vs_NORMAL0_: vec3<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>) -> FragmentOutput {
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e43 = SV_TARGET0_;
    return FragmentOutput(_e43);
}
