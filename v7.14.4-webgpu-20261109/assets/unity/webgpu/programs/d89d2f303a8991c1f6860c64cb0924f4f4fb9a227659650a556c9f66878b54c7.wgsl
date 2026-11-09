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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: vec4<bool> = vec4(false);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
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

    let _e105 = _f_buffer4_.f_cb4_[3];
    let _e111 = _f_buffer4_.f_cb4_[3];
    u_xlat0_.x = (-(_e105.z) + _e111.y);
    let _e118 = _f_buffer4_.f_cb4_[3];
    let _e123 = _f_buffer4_.f_cb4_[3];
    u_xlat6_.x = (_e118.z + _e123.y);
    let _e127 = u_xlat0_;
    let _e130 = u_xlat6_;
    u_xlat6_.x = (-(_e127.x) + _e130.x);
    let _e134 = u_xlat0_;
    let _e137 = vs_TEXCOORD0_1;
    u_xlat0_.x = (-(_e134.x) + _e137.x);
    let _e143 = u_xlat6_;
    u_xlat6_.x = (1f / _e143.x);
    let _e147 = u_xlat6_;
    let _e149 = u_xlat0_;
    u_xlat0_.x = (_e147.x * _e149.x);
    let _e153 = u_xlat0_;
    u_xlat0_.x = clamp(_e153.x, 0f, 1f);
    let _e159 = u_xlat0_;
    u_xlat6_.x = ((_e159.x * -2f) + 3f);
    let _e167 = u_xlat0_;
    let _e169 = u_xlat0_;
    u_xlat0_.x = (_e167.x * _e169.x);
    let _e173 = u_xlat6_;
    let _e176 = u_xlat0_;
    u_xlat0_.x = ((-(_e173.x) * _e176.x) + 1f);
    let _e181 = vs_TEXCOORD0_1;
    let _e186 = _f_buffer0_.f_cb0_[4];
    let _e191 = hscard_bias.values[1];
    let _e194 = textureSampleBias(f_t1_, samplerf_s1_, _e181.xy, (_e186.x + _e191.x));
    u_xlat1_ = _e194;
    let _e195 = vs_TEXCOORD1_1;
    let _e200 = _f_buffer0_.f_cb0_[4];
    let _e205 = hscard_bias.values[2];
    let _e208 = textureSampleBias(f_t2_, samplerf_s2_, _e195.xy, (_e200.x + _e205.x));
    u_xlat2_ = _e208;
    let _e209 = u_xlat6_;
    let _e211 = u_xlat1_;
    let _e214 = u_xlat2_;
    let _e216 = (-(_e211.xyz) + _e214.xyz);
    u_xlat6_.x = _e216.x;
    u_xlat6_.y = _e216.y;
    u_xlat6_.z = _e216.z;
    let _e223 = u_xlat0_;
    let _e225 = u_xlat0_;
    let _e227 = u_xlat6_;
    let _e230 = u_xlat1_;
    let _e232 = ((_e225.xxx * _e227.xyz) + _e230.xyz);
    u_xlat0_.x = _e232.x;
    u_xlat0_.y = _e232.y;
    u_xlat0_.z = _e232.z;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat0_;
    let _e246 = _f_buffer4_.f_cb4_[2];
    let _e248 = (_e241.xyz * _e246.xyz);
    u_xlat0_.x = _e248.x;
    u_xlat0_.y = _e248.y;
    u_xlat0_.z = _e248.z;
    let _e255 = u_xlat1_;
    let _e257 = vs_TEXCOORD2_1;
    let _e262 = _f_buffer3_.f_cb3_[20];
    let _e265 = (_e257.xyz + -(_e262.xyz));
    u_xlat1_.x = _e265.x;
    u_xlat1_.y = _e265.y;
    u_xlat1_.z = _e265.z;
    let _e272 = u_xlat2_;
    let _e274 = vs_TEXCOORD2_1;
    let _e279 = _f_buffer3_.f_cb3_[21];
    let _e282 = (_e274.xyz + -(_e279.xyz));
    u_xlat2_.x = _e282.x;
    u_xlat2_.y = _e282.y;
    u_xlat2_.z = _e282.z;
    let _e289 = u_xlat3_;
    let _e291 = vs_TEXCOORD2_1;
    let _e296 = _f_buffer3_.f_cb3_[22];
    let _e299 = (_e291.xyz + -(_e296.xyz));
    u_xlat3_.x = _e299.x;
    u_xlat3_.y = _e299.y;
    u_xlat3_.z = _e299.z;
    let _e306 = u_xlat4_;
    let _e308 = vs_TEXCOORD2_1;
    let _e313 = _f_buffer3_.f_cb3_[23];
    let _e316 = (_e308.xyz + -(_e313.xyz));
    u_xlat4_.x = _e316.x;
    u_xlat4_.y = _e316.y;
    u_xlat4_.z = _e316.z;
    let _e324 = u_xlat1_;
    let _e326 = u_xlat1_;
    u_xlat1_.x = dot(_e324.xyz, _e326.xyz);
    let _e330 = u_xlat2_;
    let _e332 = u_xlat2_;
    u_xlat1_.y = dot(_e330.xyz, _e332.xyz);
    let _e336 = u_xlat3_;
    let _e338 = u_xlat3_;
    u_xlat1_.z = dot(_e336.xyz, _e338.xyz);
    let _e342 = u_xlat4_;
    let _e344 = u_xlat4_;
    u_xlat1_.w = dot(_e342.xyz, _e344.xyz);
    let _e347 = u_xlat1_;
    let _e351 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e347 < _e351);
    let _e354 = u_xlatb1_;
    if _e354.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e360 = local;
    u_xlat2_.x = _e360;
    let _e362 = u_xlatb1_;
    if _e362.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e368 = local_1;
    u_xlat2_.y = _e368;
    let _e370 = u_xlatb1_;
    if _e370.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e376 = local_2;
    u_xlat2_.z = _e376;
    let _e378 = u_xlatb1_;
    if _e378.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e384 = local_3;
    u_xlat2_.w = _e384;
    let _e386 = u_xlatb1_;
    if _e386.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e395 = local_4;
    u_xlat1_.x = _e395;
    let _e397 = u_xlatb1_;
    if _e397.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e406 = local_5;
    u_xlat1_.y = _e406;
    let _e408 = u_xlatb1_;
    if _e408.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e417 = local_6;
    u_xlat1_.z = _e417;
    let _e418 = u_xlat1_;
    let _e420 = u_xlat1_;
    let _e422 = u_xlat2_;
    let _e424 = (_e420.xyz + _e422.yzw);
    u_xlat1_.x = _e424.x;
    u_xlat1_.y = _e424.y;
    u_xlat1_.z = _e424.z;
    let _e431 = u_xlat2_;
    let _e433 = u_xlat1_;
    let _e439 = max(_e433.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e439.x;
    u_xlat2_.z = _e439.y;
    u_xlat2_.w = _e439.z;
    let _e446 = u_xlat2_;
    u_xlat18_ = dot(_e446, vec4<f32>(4f, 3f, 2f, 1f));
    let _e453 = u_xlat18_;
    u_xlat18_ = (-(_e453) + 4f);
    let _e457 = u_xlat18_;
    u_xlatu18_ = u32(_e457);
    let _e459 = u_xlatu18_;
    u_xlati18_ = (i32(_e459) << 2u);
    let _e464 = u_xlat1_;
    let _e466 = vs_TEXCOORD2_1;
    let _e468 = u_xlati18_;
    let _e473 = _f_buffer3_.f_cb3_[(_e468 + 1i)];
    let _e475 = (_e466.yyy * _e473.xyz);
    u_xlat1_.x = _e475.x;
    u_xlat1_.y = _e475.y;
    u_xlat1_.z = _e475.z;
    let _e482 = u_xlat1_;
    let _e484 = u_xlati18_;
    let _e487 = _f_buffer3_.f_cb3_[_e484];
    let _e489 = vs_TEXCOORD2_1;
    let _e492 = u_xlat1_;
    let _e494 = ((_e487.xyz * _e489.xxx) + _e492.xyz);
    u_xlat1_.x = _e494.x;
    u_xlat1_.y = _e494.y;
    u_xlat1_.z = _e494.z;
    let _e501 = u_xlat1_;
    let _e503 = u_xlati18_;
    let _e508 = _f_buffer3_.f_cb3_[(_e503 + 2i)];
    let _e510 = vs_TEXCOORD2_1;
    let _e513 = u_xlat1_;
    let _e515 = ((_e508.xyz * _e510.zzz) + _e513.xyz);
    u_xlat1_.x = _e515.x;
    u_xlat1_.y = _e515.y;
    u_xlat1_.z = _e515.z;
    let _e522 = u_xlat1_;
    let _e524 = u_xlat1_;
    let _e526 = u_xlati18_;
    let _e531 = _f_buffer3_.f_cb3_[(_e526 + 3i)];
    let _e533 = (_e524.xyz + _e531.xyz);
    u_xlat1_.x = _e533.x;
    u_xlat1_.y = _e533.y;
    u_xlat1_.z = _e533.z;
    let _e540 = vs_NORMAL0_1;
    let _e542 = vs_NORMAL0_1;
    u_xlat18_ = dot(_e540.xyz, _e542.xyz);
    let _e545 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e545);
    let _e547 = u_xlat2_;
    let _e549 = u_xlat18_;
    let _e551 = vs_NORMAL0_1;
    let _e553 = (vec3(_e549) * _e551.xyz);
    u_xlat2_.x = _e553.x;
    u_xlat2_.y = _e553.y;
    u_xlat2_.z = _e553.z;
    let _e560 = u_xlat1_;
    let _e561 = _e560.xy;
    let _e562 = u_xlat1_;
    txVec0_ = vec3<f32>(_e561.x, _e561.y, _e562.z);
    let _e568 = txVec0_;
    let _e572 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e568.xy, _e568.z);
    u_xlat18_ = _e572;
    let _e577 = _f_buffer3_.f_cb3_[27];
    u_xlat1_.x = (-(_e577.x) + 1f);
    let _e582 = u_xlat18_;
    let _e586 = _f_buffer3_.f_cb3_[27];
    let _e589 = u_xlat1_;
    u_xlat18_ = ((_e582 * _e586.x) + _e589.x);
    let _e594 = u_xlat1_;
    u_xlatb1_.x = (0f >= _e594.z);
    let _e597 = u_xlat1_;
    u_xlatb7_ = (_e597.z >= 1f);
    let _e602 = u_xlatb7_;
    let _e603 = u_xlatb1_;
    u_xlatb1_.x = (_e602 || _e603.x);
    let _e606 = u_xlatb1_;
    if _e606.x {
        local_7 = 1f;
    } else {
        let _e609 = u_xlat18_;
        local_7 = _e609;
    }
    let _e611 = local_7;
    u_xlat18_ = _e611;
    let _e612 = u_xlat18_;
    let _e616 = _f_buffer2_.f_cb2_[11];
    u_xlat18_ = (_e612 * _e616.z);
    let _e619 = u_xlat1_;
    let _e621 = u_xlat18_;
    let _e626 = _f_buffer0_.f_cb0_[6];
    let _e628 = (vec3(_e621) * _e626.xyz);
    u_xlat1_.x = _e628.x;
    u_xlat1_.y = _e628.y;
    u_xlat1_.z = _e628.z;
    let _e635 = u_xlat2_;
    let _e640 = _f_buffer0_.f_cb0_[5];
    u_xlat18_ = dot(_e635.xyz, _e640.xyz);
    let _e643 = u_xlat18_;
    u_xlat18_ = clamp(_e643, 0f, 1f);
    let _e650 = _f_buffer0_.f_cb0_[10];
    let _e655 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = min(_e650.x, _e655.y);
    let _e658 = u_xlat19_;
    u_xlatu19_ = u32(i32(_e658));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e672 = u_xlatu_loop_1_;
        let _e673 = u_xlatu19_;
        if !((_e672 < _e673)) {
            break;
        }
        {
            let _e679 = u_xlatu_loop_1_;
            u_xlatu21_ = (_e679 >> 2u);
            let _e682 = u_xlatu_loop_1_;
            u_xlati4_ = i32((_e682 & 3u));
            let _e686 = u_xlatu21_;
            let _e692 = _f_buffer2_.f_cb2_[(i32(_e686) + 12i)];
            let _e693 = u_xlati4_;
            let _e697 = local_8[_e693];
            u_xlat21_ = dot(_e692, bitcast<vec4<f32>>(_e697));
            let _e700 = u_xlat21_;
            u_xlati21_ = i32(_e700);
            let _e702 = u_xlat4_;
            let _e704 = vs_TEXCOORD2_1;
            let _e707 = u_xlati21_;
            let _e710 = _f_buffer1_.f_cb1_[_e707];
            let _e713 = u_xlati21_;
            let _e716 = _f_buffer1_.f_cb1_[_e713];
            let _e718 = ((-(_e704.xyz) * _e710.www) + _e716.xyz);
            u_xlat4_.x = _e718.x;
            u_xlat4_.y = _e718.y;
            u_xlat4_.z = _e718.z;
            let _e725 = u_xlat4_;
            let _e727 = u_xlat4_;
            u_xlat22_ = dot(_e725.xyz, _e727.xyz);
            let _e730 = u_xlat22_;
            u_xlat22_ = max(_e730, 0.000061035156f);
            let _e734 = u_xlat22_;
            u_xlat5_.x = inverseSqrt(_e734);
            let _e736 = u_xlat4_;
            let _e738 = u_xlat4_;
            let _e740 = u_xlat5_;
            let _e742 = (_e738.xyz * _e740.xxx);
            u_xlat4_.x = _e742.x;
            u_xlat4_.y = _e742.y;
            u_xlat4_.z = _e742.z;
            let _e752 = u_xlati21_;
            let _e757 = _f_buffer1_.f_cb1_[(_e752 + 512i)];
            u_xlat5_.x = (1f / _e757.x);
            let _e760 = u_xlat22_;
            u_xlat22_ = (_e760 * 25f);
            let _e763 = u_xlat22_;
            let _e764 = u_xlat5_;
            u_xlat22_ = (_e763 / _e764.x);
            let _e767 = u_xlat22_;
            u_xlat22_ = (_e767 + 1f);
            let _e772 = u_xlat22_;
            u_xlat22_ = (1f / _e772);
            let _e775 = u_xlati21_;
            let _e780 = _f_buffer1_.f_cb1_[(_e775 + 768i)];
            let _e782 = u_xlat4_;
            u_xlat5_.x = dot(_e780.xyz, _e782.xyz);
            let _e786 = u_xlat5_;
            let _e788 = u_xlati21_;
            let _e793 = _f_buffer1_.f_cb1_[(_e788 + 512i)];
            let _e796 = u_xlati21_;
            let _e801 = _f_buffer1_.f_cb1_[(_e796 + 512i)];
            u_xlat5_.x = ((_e786.x * _e793.z) + _e801.w);
            let _e805 = u_xlat5_;
            u_xlat5_.x = clamp(_e805.x, 0f, 1f);
            let _e811 = u_xlat5_;
            let _e813 = u_xlat5_;
            u_xlat5_.x = (_e811.x * _e813.x);
            let _e816 = u_xlat22_;
            let _e817 = u_xlat5_;
            u_xlat22_ = (_e816 * _e817.x);
            let _e820 = u_xlat5_;
            let _e822 = u_xlat22_;
            let _e824 = u_xlati21_;
            let _e829 = _f_buffer1_.f_cb1_[(_e824 + 256i)];
            let _e831 = (vec3(_e822) * _e829.xyz);
            u_xlat5_.x = _e831.x;
            u_xlat5_.y = _e831.y;
            u_xlat5_.z = _e831.z;
            let _e838 = u_xlat2_;
            let _e840 = u_xlat4_;
            u_xlat21_ = dot(_e838.xyz, _e840.xyz);
            let _e843 = u_xlat21_;
            u_xlat21_ = clamp(_e843, 0f, 1f);
            let _e847 = u_xlat3_;
            let _e849 = u_xlat5_;
            let _e851 = u_xlat21_;
            let _e854 = u_xlat3_;
            let _e856 = ((_e849.xyz * vec3(_e851)) + _e854.xyz);
            u_xlat3_.x = _e856.x;
            u_xlat3_.y = _e856.y;
            u_xlat3_.z = _e856.z;
        }
        continuing {
            let _e676 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e676 + 1u);
        }
    }
    let _e863 = u_xlat1_;
    let _e865 = u_xlat1_;
    let _e867 = u_xlat18_;
    let _e870 = u_xlat3_;
    let _e872 = ((_e865.xyz * vec3(_e867)) + _e870.xyz);
    u_xlat1_.x = _e872.x;
    u_xlat1_.y = _e872.y;
    u_xlat1_.z = _e872.z;
    let _e883 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e883.w);
    let _e890 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e890.w);
    let _e897 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e897.w);
    let _e900 = u_xlat2_;
    let _e902 = u_xlat2_;
    let _e904 = log2(_e902.xyz);
    u_xlat2_.x = _e904.x;
    u_xlat2_.y = _e904.y;
    u_xlat2_.z = _e904.z;
    let _e911 = u_xlat2_;
    let _e913 = u_xlat2_;
    let _e919 = (_e913.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e919.x;
    u_xlat2_.y = _e919.y;
    u_xlat2_.z = _e919.z;
    let _e926 = u_xlat2_;
    let _e928 = u_xlat2_;
    let _e930 = exp2(_e928.xyz);
    u_xlat2_.x = _e930.x;
    u_xlat2_.y = _e930.y;
    u_xlat2_.z = _e930.z;
    let _e937 = u_xlat2_;
    let _e939 = u_xlat2_;
    let _e953 = ((_e939.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e953.x;
    u_xlat2_.y = _e953.y;
    u_xlat2_.z = _e953.z;
    let _e960 = u_xlat2_;
    let _e962 = u_xlat2_;
    let _e968 = clamp(_e962.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e968.x;
    u_xlat2_.y = _e968.y;
    u_xlat2_.z = _e968.z;
    let _e975 = u_xlat1_;
    let _e977 = u_xlat1_;
    let _e979 = u_xlat2_;
    let _e981 = (_e977.xyz + _e979.xyz);
    u_xlat1_.x = _e981.x;
    u_xlat1_.y = _e981.y;
    u_xlat1_.z = _e981.z;
    let _e988 = u_xlat2_;
    let _e990 = u_xlat2_;
    let _e999 = (_e990.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat2_.x = _e999.x;
    u_xlat2_.y = _e999.y;
    u_xlat2_.z = _e999.z;
    let _e1006 = u_xlat2_;
    let _e1011 = _f_buffer4_.f_cb4_[3];
    let _e1013 = u_xlat2_;
    let _e1020 = ((_e1011.xxx * _e1013.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e1020.x;
    u_xlat2_.y = _e1020.y;
    u_xlat2_.z = _e1020.z;
    let _e1027 = u_xlat2_;
    let _e1029 = u_xlat0_;
    let _e1031 = u_xlat2_;
    let _e1033 = (_e1029.xyz * _e1031.xyz);
    u_xlat2_.x = _e1033.x;
    u_xlat2_.y = _e1033.y;
    u_xlat2_.z = _e1033.z;
    let _e1040 = SV_Target0_;
    let _e1042 = u_xlat1_;
    let _e1044 = u_xlat0_;
    let _e1047 = u_xlat2_;
    let _e1049 = ((_e1042.xyz * _e1044.xyz) + _e1047.xyz);
    SV_Target0_.x = _e1049.x;
    SV_Target0_.y = _e1049.y;
    SV_Target0_.z = _e1049.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e51 = SV_Target0_;
    return FragmentOutput(_e51);
}
