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
    f_cb4_: vec4<f32>,
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
var<private> vs_COLOR0_1: vec4<f32>;
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

    let _e106 = vs_TEXCOORD0_1;
    let _e111 = _f_buffer0_.f_cb0_[4];
    let _e116 = hscard_bias.values[1];
    let _e119 = textureSampleBias(f_t1_, samplerf_s1_, _e106.xy, (_e111.x + _e116.x));
    u_xlat0_ = _e119;
    let _e120 = vs_TEXCOORD1_1;
    let _e125 = _f_buffer0_.f_cb0_[4];
    let _e130 = hscard_bias.values[2];
    let _e133 = textureSampleBias(f_t2_, samplerf_s2_, _e120.xy, (_e125.x + _e130.x));
    u_xlat1_ = _e133;
    let _e134 = u_xlat1_;
    let _e136 = vs_COLOR0_1;
    u_xlat2_ = (_e134.wwww * _e136);
    let _e138 = u_xlat0_;
    let _e140 = u_xlat1_;
    u_xlat1_ = (-(_e138) + _e140);
    let _e142 = u_xlat2_;
    let _e143 = u_xlat1_;
    let _e145 = u_xlat0_;
    u_xlat0_ = ((_e142 * _e143) + _e145);
    let _e147 = u_xlat0_;
    let _e148 = _f_buffer4_;
    u_xlat0_ = (_e147 * _e148.f_cb4_);
    let _e151 = u_xlat1_;
    let _e153 = vs_TEXCOORD2_1;
    let _e158 = _f_buffer3_.f_cb3_[20];
    let _e161 = (_e153.xyz + -(_e158.xyz));
    u_xlat1_.x = _e161.x;
    u_xlat1_.y = _e161.y;
    u_xlat1_.z = _e161.z;
    let _e168 = u_xlat2_;
    let _e170 = vs_TEXCOORD2_1;
    let _e175 = _f_buffer3_.f_cb3_[21];
    let _e178 = (_e170.xyz + -(_e175.xyz));
    u_xlat2_.x = _e178.x;
    u_xlat2_.y = _e178.y;
    u_xlat2_.z = _e178.z;
    let _e185 = u_xlat3_;
    let _e187 = vs_TEXCOORD2_1;
    let _e192 = _f_buffer3_.f_cb3_[22];
    let _e195 = (_e187.xyz + -(_e192.xyz));
    u_xlat3_.x = _e195.x;
    u_xlat3_.y = _e195.y;
    u_xlat3_.z = _e195.z;
    let _e202 = u_xlat4_;
    let _e204 = vs_TEXCOORD2_1;
    let _e209 = _f_buffer3_.f_cb3_[23];
    let _e212 = (_e204.xyz + -(_e209.xyz));
    u_xlat4_.x = _e212.x;
    u_xlat4_.y = _e212.y;
    u_xlat4_.z = _e212.z;
    let _e220 = u_xlat1_;
    let _e222 = u_xlat1_;
    u_xlat1_.x = dot(_e220.xyz, _e222.xyz);
    let _e226 = u_xlat2_;
    let _e228 = u_xlat2_;
    u_xlat1_.y = dot(_e226.xyz, _e228.xyz);
    let _e232 = u_xlat3_;
    let _e234 = u_xlat3_;
    u_xlat1_.z = dot(_e232.xyz, _e234.xyz);
    let _e238 = u_xlat4_;
    let _e240 = u_xlat4_;
    u_xlat1_.w = dot(_e238.xyz, _e240.xyz);
    let _e243 = u_xlat1_;
    let _e247 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e243 < _e247);
    let _e250 = u_xlatb1_;
    if _e250.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e256 = local;
    u_xlat2_.x = _e256;
    let _e258 = u_xlatb1_;
    if _e258.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e264 = local_1;
    u_xlat2_.y = _e264;
    let _e266 = u_xlatb1_;
    if _e266.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e272 = local_2;
    u_xlat2_.z = _e272;
    let _e274 = u_xlatb1_;
    if _e274.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e280 = local_3;
    u_xlat2_.w = _e280;
    let _e282 = u_xlatb1_;
    if _e282.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e291 = local_4;
    u_xlat1_.x = _e291;
    let _e293 = u_xlatb1_;
    if _e293.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e302 = local_5;
    u_xlat1_.y = _e302;
    let _e304 = u_xlatb1_;
    if _e304.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e313 = local_6;
    u_xlat1_.z = _e313;
    let _e314 = u_xlat1_;
    let _e316 = u_xlat1_;
    let _e318 = u_xlat2_;
    let _e320 = (_e316.xyz + _e318.yzw);
    u_xlat1_.x = _e320.x;
    u_xlat1_.y = _e320.y;
    u_xlat1_.z = _e320.z;
    let _e327 = u_xlat2_;
    let _e329 = u_xlat1_;
    let _e335 = max(_e329.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e335.x;
    u_xlat2_.z = _e335.y;
    u_xlat2_.w = _e335.z;
    let _e343 = u_xlat2_;
    u_xlat1_.x = dot(_e343, vec4<f32>(4f, 3f, 2f, 1f));
    let _e351 = u_xlat1_;
    u_xlat1_.x = (-(_e351.x) + 4f);
    let _e356 = u_xlat1_;
    u_xlatu1_ = u32(_e356.x);
    let _e359 = u_xlatu1_;
    u_xlati1_ = (i32(_e359) << 2u);
    let _e364 = u_xlat7_;
    let _e366 = vs_TEXCOORD2_1;
    let _e368 = u_xlati1_;
    let _e373 = _f_buffer3_.f_cb3_[(_e368 + 1i)];
    let _e375 = (_e366.yyy * _e373.xyz);
    u_xlat7_.x = _e375.x;
    u_xlat7_.y = _e375.y;
    u_xlat7_.z = _e375.z;
    let _e382 = u_xlat7_;
    let _e384 = u_xlati1_;
    let _e387 = _f_buffer3_.f_cb3_[_e384];
    let _e389 = vs_TEXCOORD2_1;
    let _e392 = u_xlat7_;
    let _e394 = ((_e387.xyz * _e389.xxx) + _e392.xyz);
    u_xlat7_.x = _e394.x;
    u_xlat7_.y = _e394.y;
    u_xlat7_.z = _e394.z;
    let _e401 = u_xlat7_;
    let _e403 = u_xlati1_;
    let _e408 = _f_buffer3_.f_cb3_[(_e403 + 2i)];
    let _e410 = vs_TEXCOORD2_1;
    let _e413 = u_xlat7_;
    let _e415 = ((_e408.xyz * _e410.zzz) + _e413.xyz);
    u_xlat7_.x = _e415.x;
    u_xlat7_.y = _e415.y;
    u_xlat7_.z = _e415.z;
    let _e422 = u_xlat1_;
    let _e424 = u_xlat7_;
    let _e426 = u_xlati1_;
    let _e431 = _f_buffer3_.f_cb3_[(_e426 + 3i)];
    let _e433 = (_e424.xyz + _e431.xyz);
    u_xlat1_.x = _e433.x;
    u_xlat1_.y = _e433.y;
    u_xlat1_.z = _e433.z;
    let _e440 = vs_NORMAL0_1;
    let _e442 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e440.xyz, _e442.xyz);
    let _e445 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e445);
    let _e447 = u_xlat2_;
    let _e449 = u_xlat19_;
    let _e451 = vs_NORMAL0_1;
    let _e453 = (vec3(_e449) * _e451.xyz);
    u_xlat2_.x = _e453.x;
    u_xlat2_.y = _e453.y;
    u_xlat2_.z = _e453.z;
    let _e460 = u_xlat1_;
    let _e461 = _e460.xy;
    let _e462 = u_xlat1_;
    txVec0_ = vec3<f32>(_e461.x, _e461.y, _e462.z);
    let _e469 = txVec0_;
    let _e473 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e469.xy, _e469.z);
    u_xlat1_.x = _e473;
    let _e478 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e478.x) + 1f);
    let _e484 = u_xlat1_;
    let _e489 = _f_buffer3_.f_cb3_[27];
    let _e492 = u_xlat7_;
    u_xlat1_.x = ((_e484.x * _e489.x) + _e492.x);
    let _e496 = u_xlat1_;
    u_xlatb7_ = (0f >= _e496.z);
    let _e499 = u_xlat1_;
    u_xlatb13_ = (_e499.z >= 1f);
    let _e503 = u_xlatb13_;
    let _e504 = u_xlatb7_;
    u_xlatb7_ = (_e503 || _e504);
    let _e507 = u_xlatb7_;
    if _e507 {
        local_7 = 1f;
    } else {
        let _e509 = u_xlat1_;
        local_7 = _e509.x;
    }
    let _e512 = local_7;
    u_xlat1_.x = _e512;
    let _e514 = u_xlat1_;
    let _e519 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e514.x * _e519.z);
    let _e522 = u_xlat1_;
    let _e524 = u_xlat1_;
    let _e529 = _f_buffer0_.f_cb0_[6];
    let _e531 = (_e524.xxx * _e529.xyz);
    u_xlat1_.x = _e531.x;
    u_xlat1_.y = _e531.y;
    u_xlat1_.z = _e531.z;
    let _e538 = u_xlat2_;
    let _e543 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e538.xyz, _e543.xyz);
    let _e546 = u_xlat19_;
    u_xlat19_ = clamp(_e546, 0f, 1f);
    let _e553 = _f_buffer0_.f_cb0_[10];
    let _e558 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e553.x, _e558.y);
    let _e561 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e561));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e576 = u_xlatu_loop_1_;
        let _e577 = u_xlatu20_;
        if !((_e576 < _e577)) {
            break;
        }
        {
            let _e583 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e583 >> 2u);
            let _e586 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e586 & 3u));
            let _e591 = u_xlatu4_;
            let _e597 = _f_buffer2_.f_cb2_[(i32(_e591) + 12i)];
            let _e598 = u_xlati10_;
            let _e602 = local_8[_e598];
            u_xlat4_.x = dot(_e597, bitcast<vec4<f32>>(_e602));
            let _e605 = u_xlat4_;
            u_xlati4_ = i32(_e605.x);
            let _e608 = u_xlat10_;
            let _e610 = vs_TEXCOORD2_1;
            let _e613 = u_xlati4_;
            let _e616 = _f_buffer1_.f_cb1_[_e613];
            let _e619 = u_xlati4_;
            let _e622 = _f_buffer1_.f_cb1_[_e619];
            let _e624 = ((-(_e610.xyz) * _e616.www) + _e622.xyz);
            u_xlat10_.x = _e624.x;
            u_xlat10_.y = _e624.y;
            u_xlat10_.z = _e624.z;
            let _e632 = u_xlat10_;
            let _e634 = u_xlat10_;
            u_xlat5_.x = dot(_e632.xyz, _e634.xyz);
            let _e638 = u_xlat5_;
            u_xlat5_.x = max(_e638.x, 0.000061035156f);
            let _e642 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e642.x);
            let _e645 = u_xlat10_;
            let _e647 = u_xlat10_;
            let _e649 = u_xlat11_;
            let _e651 = (_e647.xyz * vec3(_e649));
            u_xlat10_.x = _e651.x;
            u_xlat10_.y = _e651.y;
            u_xlat10_.z = _e651.z;
            let _e660 = u_xlati4_;
            let _e665 = _f_buffer1_.f_cb1_[(_e660 + 512i)];
            u_xlat11_ = (1f / _e665.x);
            let _e669 = u_xlat5_;
            u_xlat5_.x = (_e669.x * 25f);
            let _e674 = u_xlat5_;
            let _e676 = u_xlat11_;
            u_xlat5_.x = (_e674.x / _e676);
            let _e679 = u_xlat5_;
            u_xlat5_.x = (_e679.x + 1f);
            let _e686 = u_xlat5_;
            u_xlat5_.x = (1f / _e686.x);
            let _e689 = u_xlati4_;
            let _e694 = _f_buffer1_.f_cb1_[(_e689 + 768i)];
            let _e696 = u_xlat10_;
            u_xlat11_ = dot(_e694.xyz, _e696.xyz);
            let _e699 = u_xlat11_;
            let _e700 = u_xlati4_;
            let _e705 = _f_buffer1_.f_cb1_[(_e700 + 512i)];
            let _e708 = u_xlati4_;
            let _e713 = _f_buffer1_.f_cb1_[(_e708 + 512i)];
            u_xlat11_ = ((_e699 * _e705.z) + _e713.w);
            let _e716 = u_xlat11_;
            u_xlat11_ = clamp(_e716, 0f, 1f);
            let _e720 = u_xlat11_;
            let _e721 = u_xlat11_;
            u_xlat11_ = (_e720 * _e721);
            let _e724 = u_xlat11_;
            let _e725 = u_xlat5_;
            u_xlat5_.x = (_e724 * _e725.x);
            let _e728 = u_xlat5_;
            let _e730 = u_xlat5_;
            let _e732 = u_xlati4_;
            let _e737 = _f_buffer1_.f_cb1_[(_e732 + 256i)];
            let _e739 = (_e730.xxx * _e737.xyz);
            u_xlat5_.x = _e739.x;
            u_xlat5_.y = _e739.y;
            u_xlat5_.z = _e739.z;
            let _e747 = u_xlat2_;
            let _e749 = u_xlat10_;
            u_xlat4_.x = dot(_e747.xyz, _e749.xyz);
            let _e753 = u_xlat4_;
            u_xlat4_.x = clamp(_e753.x, 0f, 1f);
            let _e758 = u_xlat3_;
            let _e760 = u_xlat5_;
            let _e762 = u_xlat4_;
            let _e765 = u_xlat3_;
            let _e767 = ((_e760.xyz * _e762.xxx) + _e765.xyz);
            u_xlat3_.x = _e767.x;
            u_xlat3_.y = _e767.y;
            u_xlat3_.z = _e767.z;
        }
        continuing {
            let _e580 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e580 + 1u);
        }
    }
    let _e774 = u_xlat1_;
    let _e776 = u_xlat1_;
    let _e778 = u_xlat19_;
    let _e781 = u_xlat3_;
    let _e783 = ((_e776.xyz * vec3(_e778)) + _e781.xyz);
    u_xlat1_.x = _e783.x;
    u_xlat1_.y = _e783.y;
    u_xlat1_.z = _e783.z;
    let _e794 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e794.w);
    let _e801 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e801.w);
    let _e808 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e808.w);
    let _e811 = u_xlat2_;
    let _e813 = u_xlat2_;
    let _e815 = log2(_e813.xyz);
    u_xlat2_.x = _e815.x;
    u_xlat2_.y = _e815.y;
    u_xlat2_.z = _e815.z;
    let _e822 = u_xlat2_;
    let _e824 = u_xlat2_;
    let _e830 = (_e824.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e830.x;
    u_xlat2_.y = _e830.y;
    u_xlat2_.z = _e830.z;
    let _e837 = u_xlat2_;
    let _e839 = u_xlat2_;
    let _e841 = exp2(_e839.xyz);
    u_xlat2_.x = _e841.x;
    u_xlat2_.y = _e841.y;
    u_xlat2_.z = _e841.z;
    let _e848 = u_xlat2_;
    let _e850 = u_xlat2_;
    let _e864 = ((_e850.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e864.x;
    u_xlat2_.y = _e864.y;
    u_xlat2_.z = _e864.z;
    let _e871 = u_xlat2_;
    let _e873 = u_xlat2_;
    let _e879 = clamp(_e873.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e879.x;
    u_xlat2_.y = _e879.y;
    u_xlat2_.z = _e879.z;
    let _e886 = u_xlat1_;
    let _e888 = u_xlat1_;
    let _e890 = u_xlat2_;
    let _e892 = (_e888.xyz + _e890.xyz);
    u_xlat1_.x = _e892.x;
    u_xlat1_.y = _e892.y;
    u_xlat1_.z = _e892.z;
    let _e899 = SV_Target0_;
    let _e901 = u_xlat0_;
    let _e903 = u_xlat1_;
    let _e905 = (_e901.xyz * _e903.xyz);
    SV_Target0_.x = _e905.x;
    SV_Target0_.y = _e905.y;
    SV_Target0_.z = _e905.z;
    let _e913 = u_xlat0_;
    SV_Target0_.w = _e913.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e55 = SV_Target0_;
    return FragmentOutput(_e55);
}
