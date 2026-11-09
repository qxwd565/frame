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
    f_cb4_: array<vec4<f32>, 3>,
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
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: vec4<bool> = vec4(false);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlatb7_: bool = false;
    var u_xlat18_: f32 = 0f;
    var u_xlati18_: i32 = 0i;
    var u_xlatu18_: u32 = 0u;
    var u_xlat19_: f32 = 0f;
    var u_xlatu19_: u32 = 0u;
    var u_xlatu20_: u32 = 0u;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlatu21_: u32 = 0u;
    var u_xlatb21_: bool = false;
    var u_xlat22_: f32 = 0f;
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

    let _e94 = vs_TEXCOORD0_1;
    let _e99 = _f_buffer0_.f_cb0_[4];
    let _e104 = hscard_bias.values[1];
    let _e107 = textureSampleBias(f_t1_, samplerf_s1_, _e94.xy, (_e99.x + _e104.x));
    u_xlat0_ = _e107;
    let _e108 = u_xlat0_;
    let _e110 = u_xlat0_;
    let _e115 = _f_buffer4_.f_cb4_[1];
    let _e117 = (_e110.xyz * _e115.xyz);
    u_xlat0_.x = _e117.x;
    u_xlat0_.y = _e117.y;
    u_xlat0_.z = _e117.z;
    let _e124 = u_xlat1_;
    let _e126 = vs_TEXCOORD1_1;
    let _e131 = _f_buffer3_.f_cb3_[20];
    let _e134 = (_e126.xyz + -(_e131.xyz));
    u_xlat1_.x = _e134.x;
    u_xlat1_.y = _e134.y;
    u_xlat1_.z = _e134.z;
    let _e141 = u_xlat2_;
    let _e143 = vs_TEXCOORD1_1;
    let _e148 = _f_buffer3_.f_cb3_[21];
    let _e151 = (_e143.xyz + -(_e148.xyz));
    u_xlat2_.x = _e151.x;
    u_xlat2_.y = _e151.y;
    u_xlat2_.z = _e151.z;
    let _e158 = u_xlat3_;
    let _e160 = vs_TEXCOORD1_1;
    let _e165 = _f_buffer3_.f_cb3_[22];
    let _e168 = (_e160.xyz + -(_e165.xyz));
    u_xlat3_.x = _e168.x;
    u_xlat3_.y = _e168.y;
    u_xlat3_.z = _e168.z;
    let _e175 = u_xlat4_;
    let _e177 = vs_TEXCOORD1_1;
    let _e182 = _f_buffer3_.f_cb3_[23];
    let _e185 = (_e177.xyz + -(_e182.xyz));
    u_xlat4_.x = _e185.x;
    u_xlat4_.y = _e185.y;
    u_xlat4_.z = _e185.z;
    let _e193 = u_xlat1_;
    let _e195 = u_xlat1_;
    u_xlat1_.x = dot(_e193.xyz, _e195.xyz);
    let _e199 = u_xlat2_;
    let _e201 = u_xlat2_;
    u_xlat1_.y = dot(_e199.xyz, _e201.xyz);
    let _e205 = u_xlat3_;
    let _e207 = u_xlat3_;
    u_xlat1_.z = dot(_e205.xyz, _e207.xyz);
    let _e211 = u_xlat4_;
    let _e213 = u_xlat4_;
    u_xlat1_.w = dot(_e211.xyz, _e213.xyz);
    let _e216 = u_xlat1_;
    let _e220 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e216 < _e220);
    let _e223 = u_xlatb1_;
    if _e223.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e229 = local;
    u_xlat2_.x = _e229;
    let _e231 = u_xlatb1_;
    if _e231.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e237 = local_1;
    u_xlat2_.y = _e237;
    let _e239 = u_xlatb1_;
    if _e239.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e245 = local_2;
    u_xlat2_.z = _e245;
    let _e247 = u_xlatb1_;
    if _e247.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e253 = local_3;
    u_xlat2_.w = _e253;
    let _e255 = u_xlatb1_;
    if _e255.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e264 = local_4;
    u_xlat1_.x = _e264;
    let _e266 = u_xlatb1_;
    if _e266.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e275 = local_5;
    u_xlat1_.y = _e275;
    let _e277 = u_xlatb1_;
    if _e277.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e286 = local_6;
    u_xlat1_.z = _e286;
    let _e287 = u_xlat1_;
    let _e289 = u_xlat1_;
    let _e291 = u_xlat2_;
    let _e293 = (_e289.xyz + _e291.yzw);
    u_xlat1_.x = _e293.x;
    u_xlat1_.y = _e293.y;
    u_xlat1_.z = _e293.z;
    let _e300 = u_xlat2_;
    let _e302 = u_xlat1_;
    let _e308 = max(_e302.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e308.x;
    u_xlat2_.z = _e308.y;
    u_xlat2_.w = _e308.z;
    let _e315 = u_xlat2_;
    u_xlat18_ = dot(_e315, vec4<f32>(4f, 3f, 2f, 1f));
    let _e322 = u_xlat18_;
    u_xlat18_ = (-(_e322) + 4f);
    let _e326 = u_xlat18_;
    u_xlatu18_ = u32(_e326);
    let _e328 = u_xlatu18_;
    u_xlati18_ = (i32(_e328) << 2u);
    let _e333 = u_xlat1_;
    let _e335 = vs_TEXCOORD1_1;
    let _e337 = u_xlati18_;
    let _e342 = _f_buffer3_.f_cb3_[(_e337 + 1i)];
    let _e344 = (_e335.yyy * _e342.xyz);
    u_xlat1_.x = _e344.x;
    u_xlat1_.y = _e344.y;
    u_xlat1_.z = _e344.z;
    let _e351 = u_xlat1_;
    let _e353 = u_xlati18_;
    let _e356 = _f_buffer3_.f_cb3_[_e353];
    let _e358 = vs_TEXCOORD1_1;
    let _e361 = u_xlat1_;
    let _e363 = ((_e356.xyz * _e358.xxx) + _e361.xyz);
    u_xlat1_.x = _e363.x;
    u_xlat1_.y = _e363.y;
    u_xlat1_.z = _e363.z;
    let _e370 = u_xlat1_;
    let _e372 = u_xlati18_;
    let _e377 = _f_buffer3_.f_cb3_[(_e372 + 2i)];
    let _e379 = vs_TEXCOORD1_1;
    let _e382 = u_xlat1_;
    let _e384 = ((_e377.xyz * _e379.zzz) + _e382.xyz);
    u_xlat1_.x = _e384.x;
    u_xlat1_.y = _e384.y;
    u_xlat1_.z = _e384.z;
    let _e391 = u_xlat1_;
    let _e393 = u_xlat1_;
    let _e395 = u_xlati18_;
    let _e400 = _f_buffer3_.f_cb3_[(_e395 + 3i)];
    let _e402 = (_e393.xyz + _e400.xyz);
    u_xlat1_.x = _e402.x;
    u_xlat1_.y = _e402.y;
    u_xlat1_.z = _e402.z;
    let _e409 = vs_NORMAL0_1;
    let _e411 = vs_NORMAL0_1;
    u_xlat18_ = dot(_e409.xyz, _e411.xyz);
    let _e414 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e414);
    let _e416 = u_xlat2_;
    let _e418 = u_xlat18_;
    let _e420 = vs_NORMAL0_1;
    let _e422 = (vec3(_e418) * _e420.xyz);
    u_xlat2_.x = _e422.x;
    u_xlat2_.y = _e422.y;
    u_xlat2_.z = _e422.z;
    let _e429 = u_xlat1_;
    let _e430 = _e429.xy;
    let _e431 = u_xlat1_;
    txVec0_ = vec3<f32>(_e430.x, _e430.y, _e431.z);
    let _e437 = txVec0_;
    let _e441 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e437.xy, _e437.z);
    u_xlat18_ = _e441;
    let _e446 = _f_buffer3_.f_cb3_[27];
    u_xlat1_.x = (-(_e446.x) + 1f);
    let _e451 = u_xlat18_;
    let _e455 = _f_buffer3_.f_cb3_[27];
    let _e458 = u_xlat1_;
    u_xlat18_ = ((_e451 * _e455.x) + _e458.x);
    let _e463 = u_xlat1_;
    u_xlatb1_.x = (0f >= _e463.z);
    let _e466 = u_xlat1_;
    u_xlatb7_ = (_e466.z >= 1f);
    let _e471 = u_xlatb7_;
    let _e472 = u_xlatb1_;
    u_xlatb1_.x = (_e471 || _e472.x);
    let _e475 = u_xlatb1_;
    if _e475.x {
        local_7 = 1f;
    } else {
        let _e478 = u_xlat18_;
        local_7 = _e478;
    }
    let _e480 = local_7;
    u_xlat18_ = _e480;
    let _e481 = u_xlat18_;
    let _e485 = _f_buffer2_.f_cb2_[11];
    u_xlat18_ = (_e481 * _e485.z);
    let _e488 = u_xlat1_;
    let _e490 = u_xlat18_;
    let _e495 = _f_buffer0_.f_cb0_[6];
    let _e497 = (vec3(_e490) * _e495.xyz);
    u_xlat1_.x = _e497.x;
    u_xlat1_.y = _e497.y;
    u_xlat1_.z = _e497.z;
    let _e504 = u_xlat2_;
    let _e509 = _f_buffer0_.f_cb0_[5];
    u_xlat18_ = dot(_e504.xyz, _e509.xyz);
    let _e512 = u_xlat18_;
    u_xlat18_ = clamp(_e512, 0f, 1f);
    let _e519 = _f_buffer0_.f_cb0_[10];
    let _e524 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = min(_e519.x, _e524.y);
    let _e527 = u_xlat19_;
    u_xlatu19_ = u32(i32(_e527));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e541 = u_xlatu_loop_1_;
        let _e542 = u_xlatu19_;
        if !((_e541 < _e542)) {
            break;
        }
        {
            let _e548 = u_xlatu_loop_1_;
            u_xlatu21_ = (_e548 >> 2u);
            let _e551 = u_xlatu_loop_1_;
            u_xlati4_ = i32((_e551 & 3u));
            let _e555 = u_xlatu21_;
            let _e561 = _f_buffer2_.f_cb2_[(i32(_e555) + 12i)];
            let _e562 = u_xlati4_;
            let _e566 = local_8[_e562];
            u_xlat21_ = dot(_e561, bitcast<vec4<f32>>(_e566));
            let _e569 = u_xlat21_;
            u_xlati21_ = i32(_e569);
            let _e571 = u_xlat4_;
            let _e573 = vs_TEXCOORD1_1;
            let _e576 = u_xlati21_;
            let _e579 = _f_buffer1_.f_cb1_[_e576];
            let _e582 = u_xlati21_;
            let _e585 = _f_buffer1_.f_cb1_[_e582];
            let _e587 = ((-(_e573.xyz) * _e579.www) + _e585.xyz);
            u_xlat4_.x = _e587.x;
            u_xlat4_.y = _e587.y;
            u_xlat4_.z = _e587.z;
            let _e594 = u_xlat4_;
            let _e596 = u_xlat4_;
            u_xlat22_ = dot(_e594.xyz, _e596.xyz);
            let _e599 = u_xlat22_;
            u_xlat22_ = max(_e599, 0.000061035156f);
            let _e603 = u_xlat22_;
            u_xlat5_.x = inverseSqrt(_e603);
            let _e605 = u_xlat4_;
            let _e607 = u_xlat4_;
            let _e609 = u_xlat5_;
            let _e611 = (_e607.xyz * _e609.xxx);
            u_xlat4_.x = _e611.x;
            u_xlat4_.y = _e611.y;
            u_xlat4_.z = _e611.z;
            let _e621 = u_xlati21_;
            let _e626 = _f_buffer1_.f_cb1_[(_e621 + 512i)];
            u_xlat5_.x = (1f / _e626.x);
            let _e629 = u_xlat22_;
            u_xlat22_ = (_e629 * 25f);
            let _e632 = u_xlat22_;
            let _e633 = u_xlat5_;
            u_xlat22_ = (_e632 / _e633.x);
            let _e636 = u_xlat22_;
            u_xlat22_ = (_e636 + 1f);
            let _e641 = u_xlat22_;
            u_xlat22_ = (1f / _e641);
            let _e644 = u_xlati21_;
            let _e649 = _f_buffer1_.f_cb1_[(_e644 + 768i)];
            let _e651 = u_xlat4_;
            u_xlat5_.x = dot(_e649.xyz, _e651.xyz);
            let _e655 = u_xlat5_;
            let _e657 = u_xlati21_;
            let _e662 = _f_buffer1_.f_cb1_[(_e657 + 512i)];
            let _e665 = u_xlati21_;
            let _e670 = _f_buffer1_.f_cb1_[(_e665 + 512i)];
            u_xlat5_.x = ((_e655.x * _e662.z) + _e670.w);
            let _e674 = u_xlat5_;
            u_xlat5_.x = clamp(_e674.x, 0f, 1f);
            let _e680 = u_xlat5_;
            let _e682 = u_xlat5_;
            u_xlat5_.x = (_e680.x * _e682.x);
            let _e685 = u_xlat22_;
            let _e686 = u_xlat5_;
            u_xlat22_ = (_e685 * _e686.x);
            let _e689 = u_xlat5_;
            let _e691 = u_xlat22_;
            let _e693 = u_xlati21_;
            let _e698 = _f_buffer1_.f_cb1_[(_e693 + 256i)];
            let _e700 = (vec3(_e691) * _e698.xyz);
            u_xlat5_.x = _e700.x;
            u_xlat5_.y = _e700.y;
            u_xlat5_.z = _e700.z;
            let _e707 = u_xlat2_;
            let _e709 = u_xlat4_;
            u_xlat21_ = dot(_e707.xyz, _e709.xyz);
            let _e712 = u_xlat21_;
            u_xlat21_ = clamp(_e712, 0f, 1f);
            let _e716 = u_xlat3_;
            let _e718 = u_xlat5_;
            let _e720 = u_xlat21_;
            let _e723 = u_xlat3_;
            let _e725 = ((_e718.xyz * vec3(_e720)) + _e723.xyz);
            u_xlat3_.x = _e725.x;
            u_xlat3_.y = _e725.y;
            u_xlat3_.z = _e725.z;
        }
        continuing {
            let _e545 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e545 + 1u);
        }
    }
    let _e732 = u_xlat1_;
    let _e734 = u_xlat1_;
    let _e736 = u_xlat18_;
    let _e739 = u_xlat3_;
    let _e741 = ((_e734.xyz * vec3(_e736)) + _e739.xyz);
    u_xlat1_.x = _e741.x;
    u_xlat1_.y = _e741.y;
    u_xlat1_.z = _e741.z;
    let _e752 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e752.w);
    let _e759 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e759.w);
    let _e766 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e766.w);
    let _e769 = u_xlat2_;
    let _e771 = u_xlat2_;
    let _e773 = log2(_e771.xyz);
    u_xlat2_.x = _e773.x;
    u_xlat2_.y = _e773.y;
    u_xlat2_.z = _e773.z;
    let _e780 = u_xlat2_;
    let _e782 = u_xlat2_;
    let _e788 = (_e782.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e788.x;
    u_xlat2_.y = _e788.y;
    u_xlat2_.z = _e788.z;
    let _e795 = u_xlat2_;
    let _e797 = u_xlat2_;
    let _e799 = exp2(_e797.xyz);
    u_xlat2_.x = _e799.x;
    u_xlat2_.y = _e799.y;
    u_xlat2_.z = _e799.z;
    let _e806 = u_xlat2_;
    let _e808 = u_xlat2_;
    let _e822 = ((_e808.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e822.x;
    u_xlat2_.y = _e822.y;
    u_xlat2_.z = _e822.z;
    let _e829 = u_xlat2_;
    let _e831 = u_xlat2_;
    let _e837 = clamp(_e831.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e837.x;
    u_xlat2_.y = _e837.y;
    u_xlat2_.z = _e837.z;
    let _e844 = u_xlat1_;
    let _e846 = u_xlat1_;
    let _e848 = u_xlat2_;
    let _e850 = (_e846.xyz + _e848.xyz);
    u_xlat1_.x = _e850.x;
    u_xlat1_.y = _e850.y;
    u_xlat1_.z = _e850.z;
    let _e857 = u_xlat2_;
    let _e859 = u_xlat2_;
    let _e868 = (_e859.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat2_.x = _e868.x;
    u_xlat2_.y = _e868.y;
    u_xlat2_.z = _e868.z;
    let _e875 = u_xlat2_;
    let _e880 = _f_buffer4_.f_cb4_[2];
    let _e882 = u_xlat2_;
    let _e889 = ((_e880.xxx * _e882.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e889.x;
    u_xlat2_.y = _e889.y;
    u_xlat2_.z = _e889.z;
    let _e896 = u_xlat2_;
    let _e898 = u_xlat0_;
    let _e900 = u_xlat2_;
    let _e902 = (_e898.xyz * _e900.xyz);
    u_xlat2_.x = _e902.x;
    u_xlat2_.y = _e902.y;
    u_xlat2_.z = _e902.z;
    let _e909 = SV_Target0_;
    let _e911 = u_xlat1_;
    let _e913 = u_xlat0_;
    let _e916 = u_xlat2_;
    let _e918 = ((_e911.xyz * _e913.xyz) + _e916.xyz);
    SV_Target0_.x = _e918.x;
    SV_Target0_.y = _e918.y;
    SV_Target0_.z = _e918.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e43 = SV_Target0_;
    return FragmentOutput(_e43);
}
