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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
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

    let _e102 = vs_TEXCOORD0_1;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[1];
    let _e115 = textureSampleBias(f_t1_, samplerf_s1_, _e102.xy, (_e107.x + _e112.x));
    u_xlat0_ = _e115;
    let _e116 = u_xlat0_;
    let _e120 = _f_buffer4_.f_cb4_[1];
    u_xlat0_ = (_e116 * _e120);
    let _e122 = u_xlat1_;
    let _e124 = vs_TEXCOORD1_1;
    let _e129 = _f_buffer3_.f_cb3_[20];
    let _e132 = (_e124.xyz + -(_e129.xyz));
    u_xlat1_.x = _e132.x;
    u_xlat1_.y = _e132.y;
    u_xlat1_.z = _e132.z;
    let _e139 = u_xlat2_;
    let _e141 = vs_TEXCOORD1_1;
    let _e146 = _f_buffer3_.f_cb3_[21];
    let _e149 = (_e141.xyz + -(_e146.xyz));
    u_xlat2_.x = _e149.x;
    u_xlat2_.y = _e149.y;
    u_xlat2_.z = _e149.z;
    let _e156 = u_xlat3_;
    let _e158 = vs_TEXCOORD1_1;
    let _e163 = _f_buffer3_.f_cb3_[22];
    let _e166 = (_e158.xyz + -(_e163.xyz));
    u_xlat3_.x = _e166.x;
    u_xlat3_.y = _e166.y;
    u_xlat3_.z = _e166.z;
    let _e173 = u_xlat4_;
    let _e175 = vs_TEXCOORD1_1;
    let _e180 = _f_buffer3_.f_cb3_[23];
    let _e183 = (_e175.xyz + -(_e180.xyz));
    u_xlat4_.x = _e183.x;
    u_xlat4_.y = _e183.y;
    u_xlat4_.z = _e183.z;
    let _e191 = u_xlat1_;
    let _e193 = u_xlat1_;
    u_xlat1_.x = dot(_e191.xyz, _e193.xyz);
    let _e197 = u_xlat2_;
    let _e199 = u_xlat2_;
    u_xlat1_.y = dot(_e197.xyz, _e199.xyz);
    let _e203 = u_xlat3_;
    let _e205 = u_xlat3_;
    u_xlat1_.z = dot(_e203.xyz, _e205.xyz);
    let _e209 = u_xlat4_;
    let _e211 = u_xlat4_;
    u_xlat1_.w = dot(_e209.xyz, _e211.xyz);
    let _e214 = u_xlat1_;
    let _e218 = _f_buffer3_.f_cb3_[24];
    u_xlatb1_ = (_e214 < _e218);
    let _e221 = u_xlatb1_;
    if _e221.x {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e227 = local;
    u_xlat2_.x = _e227;
    let _e229 = u_xlatb1_;
    if _e229.y {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e235 = local_1;
    u_xlat2_.y = _e235;
    let _e237 = u_xlatb1_;
    if _e237.z {
        local_2 = 1f;
    } else {
        local_2 = 0f;
    }
    let _e243 = local_2;
    u_xlat2_.z = _e243;
    let _e245 = u_xlatb1_;
    if _e245.w {
        local_3 = 1f;
    } else {
        local_3 = 0f;
    }
    let _e251 = local_3;
    u_xlat2_.w = _e251;
    let _e253 = u_xlatb1_;
    if _e253.x {
        local_4 = -1f;
    } else {
        local_4 = -0f;
    }
    let _e262 = local_4;
    u_xlat1_.x = _e262;
    let _e264 = u_xlatb1_;
    if _e264.y {
        local_5 = -1f;
    } else {
        local_5 = -0f;
    }
    let _e273 = local_5;
    u_xlat1_.y = _e273;
    let _e275 = u_xlatb1_;
    if _e275.z {
        local_6 = -1f;
    } else {
        local_6 = -0f;
    }
    let _e284 = local_6;
    u_xlat1_.z = _e284;
    let _e285 = u_xlat1_;
    let _e287 = u_xlat1_;
    let _e289 = u_xlat2_;
    let _e291 = (_e287.xyz + _e289.yzw);
    u_xlat1_.x = _e291.x;
    u_xlat1_.y = _e291.y;
    u_xlat1_.z = _e291.z;
    let _e298 = u_xlat2_;
    let _e300 = u_xlat1_;
    let _e306 = max(_e300.xyz, vec3<f32>(0f, 0f, 0f));
    u_xlat2_.y = _e306.x;
    u_xlat2_.z = _e306.y;
    u_xlat2_.w = _e306.z;
    let _e314 = u_xlat2_;
    u_xlat1_.x = dot(_e314, vec4<f32>(4f, 3f, 2f, 1f));
    let _e322 = u_xlat1_;
    u_xlat1_.x = (-(_e322.x) + 4f);
    let _e327 = u_xlat1_;
    u_xlatu1_ = u32(_e327.x);
    let _e330 = u_xlatu1_;
    u_xlati1_ = (i32(_e330) << 2u);
    let _e335 = u_xlat7_;
    let _e337 = vs_TEXCOORD1_1;
    let _e339 = u_xlati1_;
    let _e344 = _f_buffer3_.f_cb3_[(_e339 + 1i)];
    let _e346 = (_e337.yyy * _e344.xyz);
    u_xlat7_.x = _e346.x;
    u_xlat7_.y = _e346.y;
    u_xlat7_.z = _e346.z;
    let _e353 = u_xlat7_;
    let _e355 = u_xlati1_;
    let _e358 = _f_buffer3_.f_cb3_[_e355];
    let _e360 = vs_TEXCOORD1_1;
    let _e363 = u_xlat7_;
    let _e365 = ((_e358.xyz * _e360.xxx) + _e363.xyz);
    u_xlat7_.x = _e365.x;
    u_xlat7_.y = _e365.y;
    u_xlat7_.z = _e365.z;
    let _e372 = u_xlat7_;
    let _e374 = u_xlati1_;
    let _e379 = _f_buffer3_.f_cb3_[(_e374 + 2i)];
    let _e381 = vs_TEXCOORD1_1;
    let _e384 = u_xlat7_;
    let _e386 = ((_e379.xyz * _e381.zzz) + _e384.xyz);
    u_xlat7_.x = _e386.x;
    u_xlat7_.y = _e386.y;
    u_xlat7_.z = _e386.z;
    let _e393 = u_xlat1_;
    let _e395 = u_xlat7_;
    let _e397 = u_xlati1_;
    let _e402 = _f_buffer3_.f_cb3_[(_e397 + 3i)];
    let _e404 = (_e395.xyz + _e402.xyz);
    u_xlat1_.x = _e404.x;
    u_xlat1_.y = _e404.y;
    u_xlat1_.z = _e404.z;
    let _e411 = vs_NORMAL0_1;
    let _e413 = vs_NORMAL0_1;
    u_xlat19_ = dot(_e411.xyz, _e413.xyz);
    let _e416 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e416);
    let _e418 = u_xlat2_;
    let _e420 = u_xlat19_;
    let _e422 = vs_NORMAL0_1;
    let _e424 = (vec3(_e420) * _e422.xyz);
    u_xlat2_.x = _e424.x;
    u_xlat2_.y = _e424.y;
    u_xlat2_.z = _e424.z;
    let _e431 = u_xlat1_;
    let _e432 = _e431.xy;
    let _e433 = u_xlat1_;
    txVec0_ = vec3<f32>(_e432.x, _e432.y, _e433.z);
    let _e440 = txVec0_;
    let _e444 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e440.xy, _e440.z);
    u_xlat1_.x = _e444;
    let _e449 = _f_buffer3_.f_cb3_[27];
    u_xlat7_.x = (-(_e449.x) + 1f);
    let _e455 = u_xlat1_;
    let _e460 = _f_buffer3_.f_cb3_[27];
    let _e463 = u_xlat7_;
    u_xlat1_.x = ((_e455.x * _e460.x) + _e463.x);
    let _e467 = u_xlat1_;
    u_xlatb7_ = (0f >= _e467.z);
    let _e470 = u_xlat1_;
    u_xlatb13_ = (_e470.z >= 1f);
    let _e474 = u_xlatb13_;
    let _e475 = u_xlatb7_;
    u_xlatb7_ = (_e474 || _e475);
    let _e478 = u_xlatb7_;
    if _e478 {
        local_7 = 1f;
    } else {
        let _e480 = u_xlat1_;
        local_7 = _e480.x;
    }
    let _e483 = local_7;
    u_xlat1_.x = _e483;
    let _e485 = u_xlat1_;
    let _e490 = _f_buffer2_.f_cb2_[11];
    u_xlat1_.x = (_e485.x * _e490.z);
    let _e493 = u_xlat1_;
    let _e495 = u_xlat1_;
    let _e500 = _f_buffer0_.f_cb0_[6];
    let _e502 = (_e495.xxx * _e500.xyz);
    u_xlat1_.x = _e502.x;
    u_xlat1_.y = _e502.y;
    u_xlat1_.z = _e502.z;
    let _e509 = u_xlat2_;
    let _e514 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e509.xyz, _e514.xyz);
    let _e517 = u_xlat19_;
    u_xlat19_ = clamp(_e517, 0f, 1f);
    let _e524 = _f_buffer0_.f_cb0_[10];
    let _e529 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e524.x, _e529.y);
    let _e532 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e532));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e547 = u_xlatu_loop_1_;
        let _e548 = u_xlatu20_;
        if !((_e547 < _e548)) {
            break;
        }
        {
            let _e554 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e554 >> 2u);
            let _e557 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e557 & 3u));
            let _e562 = u_xlatu4_;
            let _e568 = _f_buffer2_.f_cb2_[(i32(_e562) + 12i)];
            let _e569 = u_xlati10_;
            let _e573 = local_8[_e569];
            u_xlat4_.x = dot(_e568, bitcast<vec4<f32>>(_e573));
            let _e576 = u_xlat4_;
            u_xlati4_ = i32(_e576.x);
            let _e579 = u_xlat10_;
            let _e581 = vs_TEXCOORD1_1;
            let _e584 = u_xlati4_;
            let _e587 = _f_buffer1_.f_cb1_[_e584];
            let _e590 = u_xlati4_;
            let _e593 = _f_buffer1_.f_cb1_[_e590];
            let _e595 = ((-(_e581.xyz) * _e587.www) + _e593.xyz);
            u_xlat10_.x = _e595.x;
            u_xlat10_.y = _e595.y;
            u_xlat10_.z = _e595.z;
            let _e603 = u_xlat10_;
            let _e605 = u_xlat10_;
            u_xlat5_.x = dot(_e603.xyz, _e605.xyz);
            let _e609 = u_xlat5_;
            u_xlat5_.x = max(_e609.x, 0.000061035156f);
            let _e613 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e613.x);
            let _e616 = u_xlat10_;
            let _e618 = u_xlat10_;
            let _e620 = u_xlat11_;
            let _e622 = (_e618.xyz * vec3(_e620));
            u_xlat10_.x = _e622.x;
            u_xlat10_.y = _e622.y;
            u_xlat10_.z = _e622.z;
            let _e631 = u_xlati4_;
            let _e636 = _f_buffer1_.f_cb1_[(_e631 + 512i)];
            u_xlat11_ = (1f / _e636.x);
            let _e640 = u_xlat5_;
            u_xlat5_.x = (_e640.x * 25f);
            let _e645 = u_xlat5_;
            let _e647 = u_xlat11_;
            u_xlat5_.x = (_e645.x / _e647);
            let _e650 = u_xlat5_;
            u_xlat5_.x = (_e650.x + 1f);
            let _e657 = u_xlat5_;
            u_xlat5_.x = (1f / _e657.x);
            let _e660 = u_xlati4_;
            let _e665 = _f_buffer1_.f_cb1_[(_e660 + 768i)];
            let _e667 = u_xlat10_;
            u_xlat11_ = dot(_e665.xyz, _e667.xyz);
            let _e670 = u_xlat11_;
            let _e671 = u_xlati4_;
            let _e676 = _f_buffer1_.f_cb1_[(_e671 + 512i)];
            let _e679 = u_xlati4_;
            let _e684 = _f_buffer1_.f_cb1_[(_e679 + 512i)];
            u_xlat11_ = ((_e670 * _e676.z) + _e684.w);
            let _e687 = u_xlat11_;
            u_xlat11_ = clamp(_e687, 0f, 1f);
            let _e691 = u_xlat11_;
            let _e692 = u_xlat11_;
            u_xlat11_ = (_e691 * _e692);
            let _e695 = u_xlat11_;
            let _e696 = u_xlat5_;
            u_xlat5_.x = (_e695 * _e696.x);
            let _e699 = u_xlat5_;
            let _e701 = u_xlat5_;
            let _e703 = u_xlati4_;
            let _e708 = _f_buffer1_.f_cb1_[(_e703 + 256i)];
            let _e710 = (_e701.xxx * _e708.xyz);
            u_xlat5_.x = _e710.x;
            u_xlat5_.y = _e710.y;
            u_xlat5_.z = _e710.z;
            let _e718 = u_xlat2_;
            let _e720 = u_xlat10_;
            u_xlat4_.x = dot(_e718.xyz, _e720.xyz);
            let _e724 = u_xlat4_;
            u_xlat4_.x = clamp(_e724.x, 0f, 1f);
            let _e729 = u_xlat3_;
            let _e731 = u_xlat5_;
            let _e733 = u_xlat4_;
            let _e736 = u_xlat3_;
            let _e738 = ((_e731.xyz * _e733.xxx) + _e736.xyz);
            u_xlat3_.x = _e738.x;
            u_xlat3_.y = _e738.y;
            u_xlat3_.z = _e738.z;
        }
        continuing {
            let _e551 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e551 + 1u);
        }
    }
    let _e745 = u_xlat1_;
    let _e747 = u_xlat1_;
    let _e749 = u_xlat19_;
    let _e752 = u_xlat3_;
    let _e754 = ((_e747.xyz * vec3(_e749)) + _e752.xyz);
    u_xlat1_.x = _e754.x;
    u_xlat1_.y = _e754.y;
    u_xlat1_.z = _e754.z;
    let _e765 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e765.w);
    let _e772 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e772.w);
    let _e779 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e779.w);
    let _e782 = u_xlat2_;
    let _e784 = u_xlat2_;
    let _e786 = log2(_e784.xyz);
    u_xlat2_.x = _e786.x;
    u_xlat2_.y = _e786.y;
    u_xlat2_.z = _e786.z;
    let _e793 = u_xlat2_;
    let _e795 = u_xlat2_;
    let _e801 = (_e795.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e801.x;
    u_xlat2_.y = _e801.y;
    u_xlat2_.z = _e801.z;
    let _e808 = u_xlat2_;
    let _e810 = u_xlat2_;
    let _e812 = exp2(_e810.xyz);
    u_xlat2_.x = _e812.x;
    u_xlat2_.y = _e812.y;
    u_xlat2_.z = _e812.z;
    let _e819 = u_xlat2_;
    let _e821 = u_xlat2_;
    let _e835 = ((_e821.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e835.x;
    u_xlat2_.y = _e835.y;
    u_xlat2_.z = _e835.z;
    let _e842 = u_xlat2_;
    let _e844 = u_xlat2_;
    let _e850 = clamp(_e844.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e850.x;
    u_xlat2_.y = _e850.y;
    u_xlat2_.z = _e850.z;
    let _e857 = u_xlat1_;
    let _e859 = u_xlat1_;
    let _e861 = u_xlat2_;
    let _e863 = (_e859.xyz + _e861.xyz);
    u_xlat1_.x = _e863.x;
    u_xlat1_.y = _e863.y;
    u_xlat1_.z = _e863.z;
    let _e870 = u_xlat1_;
    let _e872 = u_xlat1_;
    let _e877 = _f_buffer4_.f_cb4_[0];
    let _e879 = (_e872.xyz + _e877.xxx);
    u_xlat1_.x = _e879.x;
    u_xlat1_.y = _e879.y;
    u_xlat1_.z = _e879.z;
    let _e886 = SV_TARGET0_;
    let _e888 = u_xlat0_;
    let _e890 = u_xlat1_;
    let _e892 = (_e888.xyz * _e890.xyz);
    SV_TARGET0_.x = _e892.x;
    SV_TARGET0_.y = _e892.y;
    SV_TARGET0_.z = _e892.z;
    let _e900 = u_xlat0_;
    SV_TARGET0_.w = _e900.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e43 = SV_TARGET0_;
    return FragmentOutput(_e43);
}
