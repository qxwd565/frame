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
    var txVec0_: vec3<f32>;
    var local_7: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_8: array<vec4<u32>, 4> = ImmCB_0_;

    let _e105 = vs_TEXCOORD0_1;
    let _e110 = _f_buffer0_.f_cb0_[4];
    let _e115 = hscard_bias.values[1];
    let _e118 = textureSampleBias(f_t1_, samplerf_s1_, _e105.xy, (_e110.x + _e115.x));
    u_xlat0_ = _e118;
    let _e119 = vs_TEXCOORD5_1;
    let _e124 = _f_buffer0_.f_cb0_[4];
    let _e129 = hscard_bias.values[2];
    let _e132 = textureSampleBias(f_t2_, samplerf_s2_, _e119.xy, (_e124.x + _e129.x));
    u_xlat1_ = _e132;
    let _e134 = u_xlat1_;
    let _e139 = _f_buffer4_.f_cb4_[3];
    u_xlat1_.x = (_e134.x * _e139.x);
    let _e142 = u_xlat2_;
    let _e144 = u_xlat1_;
    let _e149 = _f_buffer4_.f_cb4_[2];
    let _e151 = (_e144.zzz * _e149.xyz);
    u_xlat2_.x = _e151.x;
    u_xlat2_.y = _e151.y;
    u_xlat2_.z = _e151.z;
    let _e158 = u_xlat0_;
    let _e160 = u_xlat0_;
    let _e162 = u_xlat1_;
    let _e165 = u_xlat2_;
    let _e167 = ((_e160.xyz * _e162.xxx) + _e165.xyz);
    u_xlat0_.x = _e167.x;
    u_xlat0_.y = _e167.y;
    u_xlat0_.z = _e167.z;
    let _e174 = u_xlat0_;
    let _e176 = u_xlat1_;
    let _e181 = _f_buffer4_.f_cb4_[3];
    let _e184 = u_xlat0_;
    let _e186 = ((_e176.yyy * _e181.yyy) + _e184.xyz);
    u_xlat0_.x = _e186.x;
    u_xlat0_.y = _e186.y;
    u_xlat0_.z = _e186.z;
    let _e193 = u_xlat1_;
    let _e195 = vs_TEXCOORD1_1;
    let _e200 = _f_buffer3_.f_cb3_[20];
    let _e203 = (_e195.xyz + -(_e200.xyz));
    u_xlat1_.x = _e203.x;
    u_xlat1_.y = _e203.y;
    u_xlat1_.z = _e203.z;
    let _e210 = u_xlat2_;
    let _e212 = vs_TEXCOORD1_1;
    let _e217 = _f_buffer3_.f_cb3_[21];
    let _e220 = (_e212.xyz + -(_e217.xyz));
    u_xlat2_.x = _e220.x;
    u_xlat2_.y = _e220.y;
    u_xlat2_.z = _e220.z;
    let _e227 = u_xlat3_;
    let _e229 = vs_TEXCOORD1_1;
    let _e234 = _f_buffer3_.f_cb3_[22];
    let _e237 = (_e229.xyz + -(_e234.xyz));
    u_xlat3_.x = _e237.x;
    u_xlat3_.y = _e237.y;
    u_xlat3_.z = _e237.z;
    let _e244 = u_xlat4_;
    let _e246 = vs_TEXCOORD1_1;
    let _e251 = _f_buffer3_.f_cb3_[23];
    let _e254 = (_e246.xyz + -(_e251.xyz));
    u_xlat4_.x = _e254.x;
    u_xlat4_.y = _e254.y;
    u_xlat4_.z = _e254.z;
    let _e262 = u_xlat1_;
    let _e264 = u_xlat1_;
    u_xlat1_.x = dot(_e262.xyz, _e264.xyz);
    let _e268 = u_xlat2_;
    let _e270 = u_xlat2_;
    u_xlat1_.y = dot(_e268.xyz, _e270.xyz);
    let _e274 = u_xlat3_;
    let _e276 = u_xlat3_;
    u_xlat1_.z = dot(_e274.xyz, _e276.xyz);
    let _e280 = u_xlat4_;
    let _e282 = u_xlat4_;
    u_xlat1_.w = dot(_e280.xyz, _e282.xyz);
    let _e285 = u_xlat1_;
    let _e289 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e285 < _e289);
    let _e292 = u_xlatb1_;
    if _e292.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e298 = local;
    u_xlat2_.x = _e298;
    let _e300 = u_xlatb1_;
    if _e300.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e306 = local_1;
    u_xlat2_.y = _e306;
    let _e308 = u_xlatb1_;
    if _e308.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e314 = local_2;
    u_xlat2_.z = _e314;
    let _e316 = u_xlatb1_;
    if _e316.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e322 = local_3;
    u_xlat2_.w = _e322;
    let _e324 = u_xlatb1_;
    if _e324.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e333 = local_4;
    u_xlat1_.x = _e333;
    let _e335 = u_xlatb1_;
    if _e335.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e344 = local_5;
    u_xlat1_.y = _e344;
    let _e346 = u_xlatb1_;
    if _e346.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e355 = local_6;
    u_xlat1_.z = _e355;
    let _e356 = u_xlat1_;
    let _e358 = u_xlat1_;
    let _e360 = u_xlat2_;
    let _e362 = (_e358.xyz + _e360.yzw);
    u_xlat1_.x = _e362.x;
    u_xlat1_.y = _e362.y;
    u_xlat1_.z = _e362.z;
    let _e369 = u_xlat2_;
    let _e371 = u_xlat1_;
    let _e377 = max(_e371.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e377.x;
    u_xlat2_.z = _e377.y;
    u_xlat2_.w = _e377.z;
    let _e385 = u_xlat2_;
    u_xlat1_.x = dot(_e385, vec4<f32>(4f, 3f, 2f, 1f));
    let _e393 = u_xlat1_;
    u_xlat1_.x = (-(_e393.x) + 4f);
    let _e398 = u_xlat1_;
    u_xlatu1_ = u32(_e398.x);
    let _e401 = u_xlatu1_;
    u_xlati1_ = (i32(_e401) << 2u);
    let _e406 = u_xlat7_;
    let _e408 = vs_TEXCOORD1_1;
    let _e410 = u_xlati1_;
    let _e415 = _f_buffer3_.f_cb3_[(_e410 + 1i)];
    let _e417 = (_e408.yyy * _e415.xyz);
    u_xlat7_.x = _e417.x;
    u_xlat7_.y = _e417.y;
    u_xlat7_.z = _e417.z;
    let _e424 = u_xlat7_;
    let _e426 = u_xlati1_;
    let _e429 = _f_buffer3_.f_cb3_[_e426];
    let _e431 = vs_TEXCOORD1_1;
    let _e434 = u_xlat7_;
    let _e436 = ((_e429.xyz * _e431.xxx) + _e434.xyz);
    u_xlat7_.x = _e436.x;
    u_xlat7_.y = _e436.y;
    u_xlat7_.z = _e436.z;
    let _e443 = u_xlat7_;
    let _e445 = u_xlati1_;
    let _e450 = _f_buffer3_.f_cb3_[(_e445 + 2i)];
    let _e452 = vs_TEXCOORD1_1;
    let _e455 = u_xlat7_;
    let _e457 = ((_e450.xyz * _e452.zzz) + _e455.xyz);
    u_xlat7_.x = _e457.x;
    u_xlat7_.y = _e457.y;
    u_xlat7_.z = _e457.z;
    let _e464 = u_xlat1_;
    let _e466 = u_xlat7_;
    let _e468 = u_xlati1_;
    let _e473 = _f_buffer3_.f_cb3_[(_e468 + 3i)];
    let _e475 = (_e466.xyz + _e473.xyz);
    u_xlat1_.x = _e475.x;
    u_xlat1_.y = _e475.y;
    u_xlat1_.z = _e475.z;
    let _e482 = vs_NORMAL0_1;
    let _e484 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e482.xyz, _e484.xyz);
    let _e487 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e487);
    let _e489 = u_xlat2_;
    let _e491 = u_xlat19_;
    let _e493 = vs_NORMAL0_1;
    let _e495 = (vec3(_e491) * _e493.xyz);
    u_xlat2_.x = _e495.x;
    u_xlat2_.y = _e495.y;
    u_xlat2_.z = _e495.z;
    let _e502 = u_xlat1_;
    let _e503 = _e502.xy;
    let _e504 = u_xlat1_;
    txVec0_ = vec3<f32>(_e503.x, _e503.y, _e504.z);
    let _e511 = txVec0_;
    let _e515 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e511.xy, _e511.z);
    u_xlat1_.x = _e515;
    let _e520 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e520.x) + 1f);
    let _e526 = u_xlat1_;
    let _e531 = _f_buffer3_.f_cb3_[27];
    let _e534 = u_xlat7_;
    u_xlat1_.x = ((_e526.x * _e531.x) + _e534.x);
    let _e538 = u_xlat1_;
    u_xlatb7_ = (0f >= _e538.z);
    let _e541 = u_xlat1_;
    u_xlatb13_ = (_e541.z >= 1f);
    let _e545 = u_xlatb13_;
    let _e546 = u_xlatb7_;
    u_xlatb7_ = (_e545 || _e546);
    let _e549 = u_xlatb7_;
    if _e549 {
        local_7 = 1f;
    } else {
        let _e551 = u_xlat1_;
        local_7 = _e551.x;
    }
    let _e554 = local_7;
    u_xlat1_.x = _e554;
    let _e556 = u_xlat1_;
    let _e561 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e556.x * _e561.z);
    let _e564 = u_xlat1_;
    let _e566 = u_xlat1_;
    let _e571 = _f_buffer0_.f_cb0_[6];
    let _e573 = (_e566.xxx * _e571.xyz);
    u_xlat1_.x = _e573.x;
    u_xlat1_.y = _e573.y;
    u_xlat1_.z = _e573.z;
    let _e580 = u_xlat2_;
    let _e585 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e580.xyz, _e585.xyz);
    let _e588 = u_xlat19_;
    u_xlat19_ = clamp(_e588, 0f, 1f);
    let _e595 = _f_buffer0_.f_cb0_[10];
    let _e600 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e595.x, _e600.y);
    let _e603 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e603));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e618 = u_xlatu_loop_1_;
        let _e619 = u_xlatu20_;
        if !((_e618 < _e619)) {
            break;
        }
        {
            let _e625 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e625 >> 2u);
            let _e628 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e628 & 3u));
            let _e633 = u_xlatu4_;
            let _e639 = _f_buffer2_.f_cb2_[(i32(_e633) + 12i)];
            let _e640 = u_xlati10_;
            let _e644 = local_8[_e640];
            u_xlat4_.x = dot(_e639, bitcast<vec4<f32>>(_e644));
            let _e647 = u_xlat4_;
            u_xlati4_ = i32(_e647.x);
            let _e650 = u_xlat10_;
            let _e652 = vs_TEXCOORD1_1;
            let _e655 = u_xlati4_;
            let _e658 = _f_buffer1_.f_cb1_[_e655];
            let _e661 = u_xlati4_;
            let _e664 = _f_buffer1_.f_cb1_[_e661];
            let _e666 = ((-(_e652.xyz) * _e658.www) + _e664.xyz);
            u_xlat10_.x = _e666.x;
            u_xlat10_.y = _e666.y;
            u_xlat10_.z = _e666.z;
            let _e674 = u_xlat10_;
            let _e676 = u_xlat10_;
            u_xlat5_.x = dot(_e674.xyz, _e676.xyz);
            let _e680 = u_xlat5_;
            u_xlat5_.x = max(_e680.x, 0.000061035156f);
            let _e684 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e684.x);
            let _e687 = u_xlat10_;
            let _e689 = u_xlat10_;
            let _e691 = u_xlat11_;
            let _e693 = (_e689.xyz * vec3(_e691));
            u_xlat10_.x = _e693.x;
            u_xlat10_.y = _e693.y;
            u_xlat10_.z = _e693.z;
            let _e702 = u_xlati4_;
            let _e707 = _f_buffer1_.f_cb1_[(_e702 + 512i)];
            u_xlat11_ = (1f / _e707.x);
            let _e711 = u_xlat5_;
            u_xlat5_.x = (_e711.x * 25f);
            let _e716 = u_xlat5_;
            let _e718 = u_xlat11_;
            u_xlat5_.x = (_e716.x / _e718);
            let _e721 = u_xlat5_;
            u_xlat5_.x = (_e721.x + 1f);
            let _e728 = u_xlat5_;
            u_xlat5_.x = (1f / _e728.x);
            let _e731 = u_xlati4_;
            let _e736 = _f_buffer1_.f_cb1_[(_e731 + 768i)];
            let _e738 = u_xlat10_;
            u_xlat11_ = dot(_e736.xyz, _e738.xyz);
            let _e741 = u_xlat11_;
            let _e742 = u_xlati4_;
            let _e747 = _f_buffer1_.f_cb1_[(_e742 + 512i)];
            let _e750 = u_xlati4_;
            let _e755 = _f_buffer1_.f_cb1_[(_e750 + 512i)];
            u_xlat11_ = ((_e741 * _e747.z) + _e755.w);
            let _e758 = u_xlat11_;
            u_xlat11_ = clamp(_e758, 0f, 1f);
            let _e762 = u_xlat11_;
            let _e763 = u_xlat11_;
            u_xlat11_ = (_e762 * _e763);
            let _e766 = u_xlat11_;
            let _e767 = u_xlat5_;
            u_xlat5_.x = (_e766 * _e767.x);
            let _e770 = u_xlat5_;
            let _e772 = u_xlat5_;
            let _e774 = u_xlati4_;
            let _e779 = _f_buffer1_.f_cb1_[(_e774 + 256i)];
            let _e781 = (_e772.xxx * _e779.xyz);
            u_xlat5_.x = _e781.x;
            u_xlat5_.y = _e781.y;
            u_xlat5_.z = _e781.z;
            let _e789 = u_xlat2_;
            let _e791 = u_xlat10_;
            u_xlat4_.x = dot(_e789.xyz, _e791.xyz);
            let _e795 = u_xlat4_;
            u_xlat4_.x = clamp(_e795.x, 0f, 1f);
            let _e800 = u_xlat3_;
            let _e802 = u_xlat5_;
            let _e804 = u_xlat4_;
            let _e807 = u_xlat3_;
            let _e809 = ((_e802.xyz * _e804.xxx) + _e807.xyz);
            u_xlat3_.x = _e809.x;
            u_xlat3_.y = _e809.y;
            u_xlat3_.z = _e809.z;
        }
        continuing {
            let _e622 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e622 + 1u);
        }
    }
    let _e816 = u_xlat1_;
    let _e818 = u_xlat1_;
    let _e820 = u_xlat19_;
    let _e823 = u_xlat3_;
    let _e825 = ((_e818.xyz * vec3(_e820)) + _e823.xyz);
    u_xlat1_.x = _e825.x;
    u_xlat1_.y = _e825.y;
    u_xlat1_.z = _e825.z;
    let _e836 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e836.w);
    let _e843 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e843.w);
    let _e850 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e850.w);
    let _e853 = u_xlat2_;
    let _e855 = u_xlat2_;
    let _e857 = log2(_e855.xyz);
    u_xlat2_.x = _e857.x;
    u_xlat2_.y = _e857.y;
    u_xlat2_.z = _e857.z;
    let _e864 = u_xlat2_;
    let _e866 = u_xlat2_;
    let _e872 = (_e866.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e872.x;
    u_xlat2_.y = _e872.y;
    u_xlat2_.z = _e872.z;
    let _e879 = u_xlat2_;
    let _e881 = u_xlat2_;
    let _e883 = exp2(_e881.xyz);
    u_xlat2_.x = _e883.x;
    u_xlat2_.y = _e883.y;
    u_xlat2_.z = _e883.z;
    let _e890 = u_xlat2_;
    let _e892 = u_xlat2_;
    let _e906 = ((_e892.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e906.x;
    u_xlat2_.y = _e906.y;
    u_xlat2_.z = _e906.z;
    let _e913 = u_xlat2_;
    let _e915 = u_xlat2_;
    let _e921 = clamp(_e915.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e921.x;
    u_xlat2_.y = _e921.y;
    u_xlat2_.z = _e921.z;
    let _e928 = u_xlat1_;
    let _e930 = u_xlat1_;
    let _e932 = u_xlat2_;
    let _e934 = (_e930.xyz + _e932.xyz);
    u_xlat1_.x = _e934.x;
    u_xlat1_.y = _e934.y;
    u_xlat1_.z = _e934.z;
    let _e941 = SV_Target0_;
    let _e943 = u_xlat0_;
    let _e945 = u_xlat1_;
    let _e947 = (_e943.xyz * _e945.xyz);
    SV_Target0_.x = _e947.x;
    SV_Target0_.y = _e947.y;
    SV_Target0_.z = _e947.z;
    let _e955 = u_xlat0_;
    SV_Target0_.w = _e955.w;
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
