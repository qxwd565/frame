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
    f_cb2_: array<vec4<f32>, 34>,
}

struct f_buffer3_ {
    f_cb3_: array<vec4<f32>, 6>,
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
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlati1_: i32 = 0i;
    var u_xlatu1_: u32 = 0u;
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlatb4_: vec3<bool> = vec3(false);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlati8_: i32 = 0i;
    var u_xlatu8_: u32 = 0u;
    var u_xlatb8_: bool = false;
    var u_xlat16_: f32 = 0f;
    var u_xlat24_: f32 = 0f;
    var u_xlatu24_: u32 = 0u;
    var u_xlat26_: f32 = 0f;
    var u_xlati26_: i32 = 0i;
    var u_xlat27_: f32 = 0f;
    var local: u32;
    var local_1: f32;
    var local_2: i32;
    var local_3: f32;
    var local_4: f32;
    var hlslcc_movcTemp: vec3<f32>;
    var local_5: f32;
    var local_6: f32;
    var local_7: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_8: array<vec4<u32>, 4> = ImmCB_0_;
    var local_9: f32;

    let _e100 = vs_TEXCOORD0_1;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[0];
    let _e113 = textureSampleBias(f_t0_, samplerf_s0_, _e100.xy, (_e105.x + _e110.x));
    u_xlat0_ = _e113;
    let _e114 = u_xlat0_;
    let _e119 = _f_buffer3_.f_cb3_[2];
    u_xlat1_ = (_e114.wxyz * _e119.wxyz);
    let _e125 = _f_buffer0_.f_cb0_[4];
    u_xlatb0_ = (_e125.z != 0f);
    let _e133 = _f_buffer3_.f_cb3_[5];
    if (0f >= _e133.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e140 = local;
    u_xlati8_ = i32(_e140);
    let _e142 = u_xlat1_;
    let _e144 = dpdx(_e142.x);
    u_xlat16_ = _e144;
    let _e146 = u_xlat1_;
    let _e148 = dpdy(_e146.x);
    u_xlat2_.x = _e148;
    let _e149 = u_xlat16_;
    let _e151 = u_xlat2_;
    u_xlat16_ = (abs(_e149) + abs(_e151.x));
    let _e155 = u_xlat0_;
    let _e160 = _f_buffer3_.f_cb3_[2];
    let _e166 = _f_buffer3_.f_cb3_[5];
    u_xlat24_ = ((_e155.w * _e160.w) + -(_e166.x));
    let _e171 = u_xlat16_;
    let _e175 = u_xlat24_;
    u_xlat2_.x = ((-(_e171) * 0.5f) + _e175);
    let _e177 = u_xlat16_;
    u_xlat16_ = max(_e177, 0.0001f);
    let _e180 = u_xlat2_;
    let _e182 = u_xlat16_;
    u_xlat16_ = (_e180.x / _e182);
    let _e184 = u_xlat16_;
    u_xlat16_ = (_e184 + 1f);
    let _e187 = u_xlat16_;
    u_xlat16_ = clamp(_e187, 0f, 1f);
    let _e191 = u_xlati8_;
    if (_e191 != 0i) {
        local_1 = 1f;
    } else {
        let _e195 = u_xlat16_;
        local_1 = _e195;
    }
    let _e197 = local_1;
    u_xlat16_ = _e197;
    let _e198 = u_xlati8_;
    u_xlati8_ = ~(_e198);
    let _e200 = u_xlatb0_;
    if _e200 {
        let _e201 = u_xlati8_;
        local_2 = _e201;
    } else {
        local_2 = 0i;
    }
    let _e205 = local_2;
    u_xlati8_ = _e205;
    let _e207 = u_xlat16_;
    u_xlat2_.x = (_e207 + -0.0001f);
    let _e211 = u_xlati8_;
    if (_e211 != 0i) {
        let _e214 = u_xlat2_;
        local_3 = _e214.x;
    } else {
        let _e216 = u_xlat24_;
        local_3 = _e216;
    }
    let _e218 = local_3;
    u_xlat8_ = _e218;
    let _e219 = u_xlatb0_;
    if _e219 {
        let _e220 = u_xlat16_;
        local_4 = _e220;
    } else {
        let _e221 = u_xlat1_;
        local_4 = _e221.x;
    }
    let _e224 = local_4;
    u_xlat16_ = _e224;
    let _e225 = u_xlat8_;
    u_xlatb8_ = (_e225 < 0f);
    let _e228 = u_xlatb8_;
    if ((select(0i, 1i, _e228) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e237 = vs_TEXCOORD2_1;
    let _e239 = vs_TEXCOORD2_1;
    u_xlat8_ = dot(_e237.xyz, _e239.xyz);
    let _e242 = u_xlat8_;
    u_xlat8_ = inverseSqrt(_e242);
    let _e244 = u_xlat2_;
    let _e246 = u_xlat8_;
    let _e248 = vs_TEXCOORD2_1;
    let _e250 = (vec3(_e246) * _e248.xyz);
    u_xlat2_.x = _e250.x;
    u_xlat2_.y = _e250.y;
    u_xlat2_.z = _e250.z;
    u_xlat2_.w = 1f;
    let _e263 = _f_buffer2_.f_cb2_[27];
    let _e264 = u_xlat2_;
    u_xlat3_.x = dot(_e263, _e264);
    let _e270 = _f_buffer2_.f_cb2_[28];
    let _e271 = u_xlat2_;
    u_xlat3_.y = dot(_e270, _e271);
    let _e277 = _f_buffer2_.f_cb2_[29];
    let _e278 = u_xlat2_;
    u_xlat3_.z = dot(_e277, _e278);
    let _e280 = u_xlat2_;
    let _e282 = u_xlat2_;
    u_xlat4_ = (_e280.yzzx * _e282.xyzz);
    let _e289 = _f_buffer2_.f_cb2_[30];
    let _e290 = u_xlat4_;
    u_xlat5_.x = dot(_e289, _e290);
    let _e296 = _f_buffer2_.f_cb2_[31];
    let _e297 = u_xlat4_;
    u_xlat5_.y = dot(_e296, _e297);
    let _e303 = _f_buffer2_.f_cb2_[32];
    let _e304 = u_xlat4_;
    u_xlat5_.z = dot(_e303, _e304);
    let _e306 = u_xlat2_;
    let _e308 = u_xlat2_;
    u_xlat8_ = (_e306.y * _e308.y);
    let _e311 = u_xlat2_;
    let _e313 = u_xlat2_;
    let _e316 = u_xlat8_;
    u_xlat8_ = ((_e311.x * _e313.x) + -(_e316));
    let _e319 = u_xlat4_;
    let _e324 = _f_buffer2_.f_cb2_[33];
    let _e326 = u_xlat8_;
    let _e329 = u_xlat5_;
    let _e331 = ((_e324.xyz * vec3(_e326)) + _e329.xyz);
    u_xlat4_.x = _e331.x;
    u_xlat4_.y = _e331.y;
    u_xlat4_.z = _e331.z;
    let _e338 = u_xlat3_;
    let _e340 = u_xlat3_;
    let _e342 = u_xlat4_;
    let _e344 = (_e340.xyz + _e342.xyz);
    u_xlat3_.x = _e344.x;
    u_xlat3_.y = _e344.y;
    u_xlat3_.z = _e344.z;
    let _e351 = u_xlatb4_;
    let _e358 = u_xlat3_;
    let _e361 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e358.xyzx).xyz;
    u_xlatb4_.x = _e361.x;
    u_xlatb4_.y = _e361.y;
    u_xlatb4_.z = _e361.z;
    let _e368 = u_xlat5_;
    let _e370 = u_xlat3_;
    let _e376 = (_e370.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat5_.x = _e376.x;
    u_xlat5_.y = _e376.y;
    u_xlat5_.z = _e376.z;
    let _e383 = u_xlat3_;
    let _e385 = u_xlat3_;
    let _e388 = log2(abs(_e385.xyz));
    u_xlat3_.x = _e388.x;
    u_xlat3_.y = _e388.y;
    u_xlat3_.z = _e388.z;
    let _e395 = u_xlat3_;
    let _e397 = u_xlat3_;
    let _e403 = (_e397.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e403.x;
    u_xlat3_.y = _e403.y;
    u_xlat3_.z = _e403.z;
    let _e410 = u_xlat3_;
    let _e412 = u_xlat3_;
    let _e414 = exp2(_e412.xyz);
    u_xlat3_.x = _e414.x;
    u_xlat3_.y = _e414.y;
    u_xlat3_.z = _e414.z;
    let _e421 = u_xlat3_;
    let _e423 = u_xlat3_;
    let _e437 = ((_e423.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e437.x;
    u_xlat3_.y = _e437.y;
    u_xlat3_.z = _e437.z;
    {
        let _e444 = u_xlat3_;
        hlslcc_movcTemp = _e444;
        let _e447 = u_xlatb4_;
        if _e447.x {
            let _e449 = u_xlat5_;
            local_5 = _e449.x;
        } else {
            let _e451 = u_xlat3_;
            local_5 = _e451.x;
        }
        let _e454 = local_5;
        hlslcc_movcTemp.x = _e454;
        let _e456 = u_xlatb4_;
        if _e456.y {
            let _e458 = u_xlat5_;
            local_6 = _e458.y;
        } else {
            let _e460 = u_xlat3_;
            local_6 = _e460.y;
        }
        let _e463 = local_6;
        hlslcc_movcTemp.y = _e463;
        let _e465 = u_xlatb4_;
        if _e465.z {
            let _e467 = u_xlat5_;
            local_7 = _e467.z;
        } else {
            let _e469 = u_xlat3_;
            local_7 = _e469.z;
        }
        let _e472 = local_7;
        hlslcc_movcTemp.z = _e472;
        let _e473 = hlslcc_movcTemp;
        u_xlat3_ = _e473;
    }
    let _e474 = u_xlat4_;
    let _e479 = _f_buffer0_.f_cb0_[6];
    let _e484 = _f_buffer2_.f_cb2_[11];
    let _e486 = (_e479.xyz * _e484.zzz);
    u_xlat4_.x = _e486.x;
    u_xlat4_.y = _e486.y;
    u_xlat4_.z = _e486.z;
    let _e493 = u_xlat2_;
    let _e498 = _f_buffer0_.f_cb0_[5];
    u_xlat8_ = dot(_e493.xyz, _e498.xyz);
    let _e501 = u_xlat8_;
    u_xlat8_ = clamp(_e501, 0f, 1f);
    let _e505 = u_xlat4_;
    let _e507 = u_xlat8_;
    let _e509 = u_xlat4_;
    let _e511 = (vec3(_e507) * _e509.xyz);
    u_xlat4_.x = _e511.x;
    u_xlat4_.y = _e511.y;
    u_xlat4_.z = _e511.z;
    let _e518 = u_xlat4_;
    let _e520 = u_xlat1_;
    let _e522 = u_xlat4_;
    let _e524 = (_e520.yzw * _e522.xyz);
    u_xlat4_.x = _e524.x;
    u_xlat4_.y = _e524.y;
    u_xlat4_.z = _e524.z;
    let _e534 = _f_buffer0_.f_cb0_[10];
    let _e539 = _f_buffer2_.f_cb2_[11];
    u_xlat8_ = min(_e534.x, _e539.y);
    let _e542 = u_xlat8_;
    u_xlatu8_ = u32(i32(_e542));
    u_xlat5_.x = 0f;
    u_xlat5_.y = 0f;
    u_xlat5_.z = 0f;
    loop {
        let _e556 = u_xlatu_loop_1_;
        let _e557 = u_xlatu8_;
        if !((_e556 < _e557)) {
            break;
        }
        {
            let _e563 = u_xlatu_loop_1_;
            u_xlatu1_ = (_e563 >> 2u);
            let _e566 = u_xlatu_loop_1_;
            u_xlati26_ = i32((_e566 & 3u));
            let _e571 = u_xlatu1_;
            let _e577 = _f_buffer2_.f_cb2_[(i32(_e571) + 12i)];
            let _e578 = u_xlati26_;
            let _e582 = local_8[_e578];
            u_xlat1_.x = dot(_e577, bitcast<vec4<f32>>(_e582));
            let _e585 = u_xlat1_;
            u_xlati1_ = i32(_e585.x);
            let _e588 = u_xlat6_;
            let _e590 = vs_TEXCOORD1_1;
            let _e593 = u_xlati1_;
            let _e596 = _f_buffer1_.f_cb1_[_e593];
            let _e599 = u_xlati1_;
            let _e602 = _f_buffer1_.f_cb1_[_e599];
            let _e604 = ((-(_e590.xyz) * _e596.www) + _e602.xyz);
            u_xlat6_.x = _e604.x;
            u_xlat6_.y = _e604.y;
            u_xlat6_.z = _e604.z;
            let _e611 = u_xlat6_;
            let _e613 = u_xlat6_;
            u_xlat26_ = dot(_e611.xyz, _e613.xyz);
            let _e616 = u_xlat26_;
            u_xlat26_ = max(_e616, 0.000061035156f);
            let _e619 = u_xlat26_;
            u_xlat27_ = inverseSqrt(_e619);
            let _e621 = u_xlat6_;
            let _e623 = u_xlat27_;
            let _e625 = u_xlat6_;
            let _e627 = (vec3(_e623) * _e625.xyz);
            u_xlat6_.x = _e627.x;
            u_xlat6_.y = _e627.y;
            u_xlat6_.z = _e627.z;
            let _e636 = u_xlat26_;
            u_xlat27_ = (1f / _e636);
            let _e638 = u_xlat26_;
            let _e639 = u_xlati1_;
            let _e644 = _f_buffer1_.f_cb1_[(_e639 + 512i)];
            u_xlat26_ = (_e638 * _e644.x);
            let _e647 = u_xlat26_;
            let _e649 = u_xlat26_;
            u_xlat26_ = ((-(_e647) * _e649) + 1f);
            let _e653 = u_xlat26_;
            u_xlat26_ = max(_e653, 0f);
            let _e656 = u_xlat26_;
            let _e657 = u_xlat26_;
            u_xlat26_ = (_e656 * _e657);
            let _e659 = u_xlat26_;
            let _e660 = u_xlat27_;
            u_xlat26_ = (_e659 * _e660);
            let _e662 = u_xlati1_;
            let _e667 = _f_buffer1_.f_cb1_[(_e662 + 768i)];
            let _e669 = u_xlat6_;
            u_xlat27_ = dot(_e667.xyz, _e669.xyz);
            let _e672 = u_xlat27_;
            let _e673 = u_xlati1_;
            let _e678 = _f_buffer1_.f_cb1_[(_e673 + 512i)];
            let _e681 = u_xlati1_;
            let _e686 = _f_buffer1_.f_cb1_[(_e681 + 512i)];
            u_xlat27_ = ((_e672 * _e678.z) + _e686.w);
            let _e689 = u_xlat27_;
            u_xlat27_ = clamp(_e689, 0f, 1f);
            let _e693 = u_xlat27_;
            let _e694 = u_xlat27_;
            u_xlat27_ = (_e693 * _e694);
            let _e696 = u_xlat26_;
            let _e697 = u_xlat27_;
            u_xlat26_ = (_e696 * _e697);
            let _e699 = u_xlat7_;
            let _e701 = u_xlat26_;
            let _e703 = u_xlati1_;
            let _e708 = _f_buffer1_.f_cb1_[(_e703 + 256i)];
            let _e710 = (vec3(_e701) * _e708.xyz);
            u_xlat7_.x = _e710.x;
            u_xlat7_.y = _e710.y;
            u_xlat7_.z = _e710.z;
            let _e718 = u_xlat2_;
            let _e720 = u_xlat6_;
            u_xlat1_.x = dot(_e718.xyz, _e720.xyz);
            let _e724 = u_xlat1_;
            u_xlat1_.x = clamp(_e724.x, 0f, 1f);
            let _e729 = u_xlat6_;
            let _e731 = u_xlat1_;
            let _e733 = u_xlat7_;
            let _e735 = (_e731.xxx * _e733.xyz);
            u_xlat6_.x = _e735.x;
            u_xlat6_.y = _e735.y;
            u_xlat6_.z = _e735.z;
            let _e742 = u_xlat5_;
            let _e744 = u_xlat6_;
            let _e746 = u_xlat1_;
            let _e749 = u_xlat5_;
            let _e751 = ((_e744.xyz * _e746.yzw) + _e749.xyz);
            u_xlat5_.x = _e751.x;
            u_xlat5_.y = _e751.y;
            u_xlat5_.z = _e751.z;
        }
        continuing {
            let _e560 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e560 + 1u);
        }
    }
    let _e758 = u_xlat1_;
    let _e760 = u_xlat3_;
    let _e762 = u_xlat1_;
    let _e765 = u_xlat4_;
    let _e767 = ((_e760.xyz * _e762.yzw) + _e765.xyz);
    u_xlat1_.x = _e767.x;
    u_xlat1_.y = _e767.y;
    u_xlat1_.z = _e767.z;
    let _e774 = SV_Target0_;
    let _e776 = u_xlat5_;
    let _e778 = u_xlat1_;
    let _e780 = (_e776.xyz + _e778.xyz);
    SV_Target0_.x = _e780.x;
    SV_Target0_.y = _e780.y;
    SV_Target0_.z = _e780.z;
    let _e790 = _f_buffer3_.f_cb3_[5];
    u_xlatb8_ = (_e790.y == 1f);
    let _e794 = u_xlatb8_;
    let _e795 = u_xlatb0_;
    u_xlatb0_ = (_e794 || _e795);
    let _e798 = u_xlatb0_;
    if _e798 {
        let _e799 = u_xlat16_;
        local_9 = _e799;
    } else {
        local_9 = 1f;
    }
    let _e802 = local_9;
    SV_Target0_.w = _e802;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
