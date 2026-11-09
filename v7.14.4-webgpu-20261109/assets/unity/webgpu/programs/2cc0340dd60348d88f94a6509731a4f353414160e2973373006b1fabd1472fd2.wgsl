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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
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
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec3<bool> = vec3(false);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlati9_: i32 = 0i;
    var u_xlatu9_: u32 = 0u;
    var u_xlatb9_: bool = false;
    var u_xlat18_: f32 = 0f;
    var u_xlat27_: f32 = 0f;
    var u_xlatu27_: u32 = 0u;
    var u_xlat29_: f32 = 0f;
    var u_xlati29_: i32 = 0i;
    var u_xlat30_: f32 = 0f;
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

    let _e106 = vs_TEXCOORD0_1;
    let _e111 = _f_buffer0_.f_cb0_[4];
    let _e116 = hscard_bias.values[0];
    let _e119 = textureSampleBias(f_t0_, samplerf_s0_, _e106.xy, (_e111.x + _e116.x));
    u_xlat0_ = _e119;
    let _e120 = u_xlat0_;
    let _e125 = _f_buffer3_.f_cb3_[2];
    u_xlat1_ = (_e120.wxyz * _e125.wxyz);
    let _e131 = _f_buffer0_.f_cb0_[4];
    u_xlatb0_ = (_e131.z != 0f);
    let _e139 = _f_buffer3_.f_cb3_[5];
    if (0f >= _e139.x) {
        local = 4294967295u;
    } else {
        local = 0u;
    }
    let _e146 = local;
    u_xlati9_ = i32(_e146);
    let _e148 = u_xlat1_;
    let _e150 = dpdx(_e148.x);
    u_xlat18_ = _e150;
    let _e152 = u_xlat1_;
    let _e154 = dpdy(_e152.x);
    u_xlat2_.x = _e154;
    let _e155 = u_xlat18_;
    let _e157 = u_xlat2_;
    u_xlat18_ = (abs(_e155) + abs(_e157.x));
    let _e161 = u_xlat0_;
    let _e166 = _f_buffer3_.f_cb3_[2];
    let _e172 = _f_buffer3_.f_cb3_[5];
    u_xlat27_ = ((_e161.w * _e166.w) + -(_e172.x));
    let _e177 = u_xlat18_;
    let _e181 = u_xlat27_;
    u_xlat2_.x = ((-(_e177) * 0.5f) + _e181);
    let _e183 = u_xlat18_;
    u_xlat18_ = max(_e183, 0.0001f);
    let _e186 = u_xlat2_;
    let _e188 = u_xlat18_;
    u_xlat18_ = (_e186.x / _e188);
    let _e190 = u_xlat18_;
    u_xlat18_ = (_e190 + 1f);
    let _e193 = u_xlat18_;
    u_xlat18_ = clamp(_e193, 0f, 1f);
    let _e197 = u_xlati9_;
    if (_e197 != 0i) {
        local_1 = 1f;
    } else {
        let _e201 = u_xlat18_;
        local_1 = _e201;
    }
    let _e203 = local_1;
    u_xlat18_ = _e203;
    let _e204 = u_xlati9_;
    u_xlati9_ = ~(_e204);
    let _e206 = u_xlatb0_;
    if _e206 {
        let _e207 = u_xlati9_;
        local_2 = _e207;
    } else {
        local_2 = 0i;
    }
    let _e211 = local_2;
    u_xlati9_ = _e211;
    let _e213 = u_xlat18_;
    u_xlat2_.x = (_e213 + -0.0001f);
    let _e217 = u_xlati9_;
    if (_e217 != 0i) {
        let _e220 = u_xlat2_;
        local_3 = _e220.x;
    } else {
        let _e222 = u_xlat27_;
        local_3 = _e222;
    }
    let _e224 = local_3;
    u_xlat9_ = _e224;
    let _e225 = u_xlatb0_;
    if _e225 {
        let _e226 = u_xlat18_;
        local_4 = _e226;
    } else {
        let _e227 = u_xlat1_;
        local_4 = _e227.x;
    }
    let _e230 = local_4;
    u_xlat18_ = _e230;
    let _e231 = u_xlat9_;
    u_xlatb9_ = (_e231 < 0f);
    let _e234 = u_xlatb9_;
    if ((select(0i, 1i, _e234) * -1i) != 0i) {
        {
            discard;
        }
    }
    let _e243 = vs_TEXCOORD0_1;
    let _e248 = _f_buffer0_.f_cb0_[4];
    let _e253 = hscard_bias.values[1];
    let _e256 = textureSampleBias(f_t1_, samplerf_s1_, _e243.xy, (_e248.x + _e253.x));
    u_xlat2_ = _e256;
    let _e257 = vs_TEXCOORD2_1;
    let _e259 = vs_TEXCOORD2_1;
    u_xlat9_ = dot(_e257.xyz, _e259.xyz);
    let _e262 = u_xlat9_;
    u_xlat9_ = inverseSqrt(_e262);
    let _e264 = u_xlat3_;
    let _e266 = u_xlat9_;
    let _e268 = vs_TEXCOORD2_1;
    let _e270 = (vec3(_e266) * _e268.xyz);
    u_xlat3_.x = _e270.x;
    u_xlat3_.y = _e270.y;
    u_xlat3_.z = _e270.z;
    u_xlat3_.w = 1f;
    let _e283 = _f_buffer2_.f_cb2_[27];
    let _e284 = u_xlat3_;
    u_xlat4_.x = dot(_e283, _e284);
    let _e290 = _f_buffer2_.f_cb2_[28];
    let _e291 = u_xlat3_;
    u_xlat4_.y = dot(_e290, _e291);
    let _e297 = _f_buffer2_.f_cb2_[29];
    let _e298 = u_xlat3_;
    u_xlat4_.z = dot(_e297, _e298);
    let _e300 = u_xlat3_;
    let _e302 = u_xlat3_;
    u_xlat5_ = (_e300.yzzx * _e302.xyzz);
    let _e309 = _f_buffer2_.f_cb2_[30];
    let _e310 = u_xlat5_;
    u_xlat6_.x = dot(_e309, _e310);
    let _e316 = _f_buffer2_.f_cb2_[31];
    let _e317 = u_xlat5_;
    u_xlat6_.y = dot(_e316, _e317);
    let _e323 = _f_buffer2_.f_cb2_[32];
    let _e324 = u_xlat5_;
    u_xlat6_.z = dot(_e323, _e324);
    let _e326 = u_xlat3_;
    let _e328 = u_xlat3_;
    u_xlat9_ = (_e326.y * _e328.y);
    let _e331 = u_xlat3_;
    let _e333 = u_xlat3_;
    let _e336 = u_xlat9_;
    u_xlat9_ = ((_e331.x * _e333.x) + -(_e336));
    let _e339 = u_xlat5_;
    let _e344 = _f_buffer2_.f_cb2_[33];
    let _e346 = u_xlat9_;
    let _e349 = u_xlat6_;
    let _e351 = ((_e344.xyz * vec3(_e346)) + _e349.xyz);
    u_xlat5_.x = _e351.x;
    u_xlat5_.y = _e351.y;
    u_xlat5_.z = _e351.z;
    let _e358 = u_xlat4_;
    let _e360 = u_xlat4_;
    let _e362 = u_xlat5_;
    let _e364 = (_e360.xyz + _e362.xyz);
    u_xlat4_.x = _e364.x;
    u_xlat4_.y = _e364.y;
    u_xlat4_.z = _e364.z;
    let _e371 = u_xlatb5_;
    let _e378 = u_xlat4_;
    let _e381 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e378.xyzx).xyz;
    u_xlatb5_.x = _e381.x;
    u_xlatb5_.y = _e381.y;
    u_xlatb5_.z = _e381.z;
    let _e388 = u_xlat6_;
    let _e390 = u_xlat4_;
    let _e396 = (_e390.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat6_.x = _e396.x;
    u_xlat6_.y = _e396.y;
    u_xlat6_.z = _e396.z;
    let _e403 = u_xlat4_;
    let _e405 = u_xlat4_;
    let _e408 = log2(abs(_e405.xyz));
    u_xlat4_.x = _e408.x;
    u_xlat4_.y = _e408.y;
    u_xlat4_.z = _e408.z;
    let _e415 = u_xlat4_;
    let _e417 = u_xlat4_;
    let _e423 = (_e417.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat4_.x = _e423.x;
    u_xlat4_.y = _e423.y;
    u_xlat4_.z = _e423.z;
    let _e430 = u_xlat4_;
    let _e432 = u_xlat4_;
    let _e434 = exp2(_e432.xyz);
    u_xlat4_.x = _e434.x;
    u_xlat4_.y = _e434.y;
    u_xlat4_.z = _e434.z;
    let _e441 = u_xlat4_;
    let _e443 = u_xlat4_;
    let _e457 = ((_e443.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat4_.x = _e457.x;
    u_xlat4_.y = _e457.y;
    u_xlat4_.z = _e457.z;
    {
        let _e464 = u_xlat4_;
        hlslcc_movcTemp = _e464;
        let _e467 = u_xlatb5_;
        if _e467.x {
            let _e469 = u_xlat6_;
            local_5 = _e469.x;
        } else {
            let _e471 = u_xlat4_;
            local_5 = _e471.x;
        }
        let _e474 = local_5;
        hlslcc_movcTemp.x = _e474;
        let _e476 = u_xlatb5_;
        if _e476.y {
            let _e478 = u_xlat6_;
            local_6 = _e478.y;
        } else {
            let _e480 = u_xlat4_;
            local_6 = _e480.y;
        }
        let _e483 = local_6;
        hlslcc_movcTemp.y = _e483;
        let _e485 = u_xlatb5_;
        if _e485.z {
            let _e487 = u_xlat6_;
            local_7 = _e487.z;
        } else {
            let _e489 = u_xlat4_;
            local_7 = _e489.z;
        }
        let _e492 = local_7;
        hlslcc_movcTemp.z = _e492;
        let _e493 = hlslcc_movcTemp;
        u_xlat4_ = _e493;
    }
    let _e494 = u_xlat5_;
    let _e499 = _f_buffer0_.f_cb0_[6];
    let _e504 = _f_buffer2_.f_cb2_[11];
    let _e506 = (_e499.xyz * _e504.zzz);
    u_xlat5_.x = _e506.x;
    u_xlat5_.y = _e506.y;
    u_xlat5_.z = _e506.z;
    let _e513 = u_xlat3_;
    let _e518 = _f_buffer0_.f_cb0_[5];
    u_xlat9_ = dot(_e513.xyz, _e518.xyz);
    let _e521 = u_xlat9_;
    u_xlat9_ = clamp(_e521, 0f, 1f);
    let _e525 = u_xlat5_;
    let _e527 = u_xlat9_;
    let _e529 = u_xlat5_;
    let _e531 = (vec3(_e527) * _e529.xyz);
    u_xlat5_.x = _e531.x;
    u_xlat5_.y = _e531.y;
    u_xlat5_.z = _e531.z;
    let _e538 = u_xlat5_;
    let _e540 = u_xlat1_;
    let _e542 = u_xlat5_;
    let _e544 = (_e540.yzw * _e542.xyz);
    u_xlat5_.x = _e544.x;
    u_xlat5_.y = _e544.y;
    u_xlat5_.z = _e544.z;
    let _e554 = _f_buffer0_.f_cb0_[10];
    let _e559 = _f_buffer2_.f_cb2_[11];
    u_xlat9_ = min(_e554.x, _e559.y);
    let _e562 = u_xlat9_;
    u_xlatu9_ = u32(i32(_e562));
    u_xlat6_.x = 0f;
    u_xlat6_.y = 0f;
    u_xlat6_.z = 0f;
    loop {
        let _e576 = u_xlatu_loop_1_;
        let _e577 = u_xlatu9_;
        if !((_e576 < _e577)) {
            break;
        }
        {
            let _e583 = u_xlatu_loop_1_;
            u_xlatu1_ = (_e583 >> 2u);
            let _e586 = u_xlatu_loop_1_;
            u_xlati29_ = i32((_e586 & 3u));
            let _e591 = u_xlatu1_;
            let _e597 = _f_buffer2_.f_cb2_[(i32(_e591) + 12i)];
            let _e598 = u_xlati29_;
            let _e602 = local_8[_e598];
            u_xlat1_.x = dot(_e597, bitcast<vec4<f32>>(_e602));
            let _e605 = u_xlat1_;
            u_xlati1_ = i32(_e605.x);
            let _e608 = u_xlat7_;
            let _e610 = vs_TEXCOORD1_1;
            let _e613 = u_xlati1_;
            let _e616 = _f_buffer1_.f_cb1_[_e613];
            let _e619 = u_xlati1_;
            let _e622 = _f_buffer1_.f_cb1_[_e619];
            let _e624 = ((-(_e610.xyz) * _e616.www) + _e622.xyz);
            u_xlat7_.x = _e624.x;
            u_xlat7_.y = _e624.y;
            u_xlat7_.z = _e624.z;
            let _e631 = u_xlat7_;
            let _e633 = u_xlat7_;
            u_xlat29_ = dot(_e631.xyz, _e633.xyz);
            let _e636 = u_xlat29_;
            u_xlat29_ = max(_e636, 0.000061035156f);
            let _e639 = u_xlat29_;
            u_xlat30_ = inverseSqrt(_e639);
            let _e641 = u_xlat7_;
            let _e643 = u_xlat30_;
            let _e645 = u_xlat7_;
            let _e647 = (vec3(_e643) * _e645.xyz);
            u_xlat7_.x = _e647.x;
            u_xlat7_.y = _e647.y;
            u_xlat7_.z = _e647.z;
            let _e656 = u_xlat29_;
            u_xlat30_ = (1f / _e656);
            let _e658 = u_xlat29_;
            let _e659 = u_xlati1_;
            let _e664 = _f_buffer1_.f_cb1_[(_e659 + 512i)];
            u_xlat29_ = (_e658 * _e664.x);
            let _e667 = u_xlat29_;
            let _e669 = u_xlat29_;
            u_xlat29_ = ((-(_e667) * _e669) + 1f);
            let _e673 = u_xlat29_;
            u_xlat29_ = max(_e673, 0f);
            let _e676 = u_xlat29_;
            let _e677 = u_xlat29_;
            u_xlat29_ = (_e676 * _e677);
            let _e679 = u_xlat29_;
            let _e680 = u_xlat30_;
            u_xlat29_ = (_e679 * _e680);
            let _e682 = u_xlati1_;
            let _e687 = _f_buffer1_.f_cb1_[(_e682 + 768i)];
            let _e689 = u_xlat7_;
            u_xlat30_ = dot(_e687.xyz, _e689.xyz);
            let _e692 = u_xlat30_;
            let _e693 = u_xlati1_;
            let _e698 = _f_buffer1_.f_cb1_[(_e693 + 512i)];
            let _e701 = u_xlati1_;
            let _e706 = _f_buffer1_.f_cb1_[(_e701 + 512i)];
            u_xlat30_ = ((_e692 * _e698.z) + _e706.w);
            let _e709 = u_xlat30_;
            u_xlat30_ = clamp(_e709, 0f, 1f);
            let _e713 = u_xlat30_;
            let _e714 = u_xlat30_;
            u_xlat30_ = (_e713 * _e714);
            let _e716 = u_xlat29_;
            let _e717 = u_xlat30_;
            u_xlat29_ = (_e716 * _e717);
            let _e719 = u_xlat8_;
            let _e721 = u_xlat29_;
            let _e723 = u_xlati1_;
            let _e728 = _f_buffer1_.f_cb1_[(_e723 + 256i)];
            let _e730 = (vec3(_e721) * _e728.xyz);
            u_xlat8_.x = _e730.x;
            u_xlat8_.y = _e730.y;
            u_xlat8_.z = _e730.z;
            let _e738 = u_xlat3_;
            let _e740 = u_xlat7_;
            u_xlat1_.x = dot(_e738.xyz, _e740.xyz);
            let _e744 = u_xlat1_;
            u_xlat1_.x = clamp(_e744.x, 0f, 1f);
            let _e749 = u_xlat7_;
            let _e751 = u_xlat1_;
            let _e753 = u_xlat8_;
            let _e755 = (_e751.xxx * _e753.xyz);
            u_xlat7_.x = _e755.x;
            u_xlat7_.y = _e755.y;
            u_xlat7_.z = _e755.z;
            let _e762 = u_xlat6_;
            let _e764 = u_xlat7_;
            let _e766 = u_xlat1_;
            let _e769 = u_xlat6_;
            let _e771 = ((_e764.xyz * _e766.yzw) + _e769.xyz);
            u_xlat6_.x = _e771.x;
            u_xlat6_.y = _e771.y;
            u_xlat6_.z = _e771.z;
        }
        continuing {
            let _e580 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e580 + 1u);
        }
    }
    let _e778 = u_xlat1_;
    let _e780 = u_xlat4_;
    let _e782 = u_xlat1_;
    let _e785 = u_xlat5_;
    let _e787 = ((_e780.xyz * _e782.yzw) + _e785.xyz);
    u_xlat1_.x = _e787.x;
    u_xlat1_.y = _e787.y;
    u_xlat1_.z = _e787.z;
    let _e794 = u_xlat1_;
    let _e796 = u_xlat6_;
    let _e798 = u_xlat1_;
    let _e800 = (_e796.xyz + _e798.xyz);
    u_xlat1_.x = _e800.x;
    u_xlat1_.y = _e800.y;
    u_xlat1_.z = _e800.z;
    let _e807 = SV_Target0_;
    let _e809 = u_xlat2_;
    let _e814 = _f_buffer3_.f_cb3_[4];
    let _e817 = u_xlat1_;
    let _e819 = ((_e809.xyz * _e814.xyz) + _e817.xyz);
    SV_Target0_.x = _e819.x;
    SV_Target0_.y = _e819.y;
    SV_Target0_.z = _e819.z;
    let _e829 = _f_buffer3_.f_cb3_[5];
    u_xlatb9_ = (_e829.y == 1f);
    let _e833 = u_xlatb9_;
    let _e834 = u_xlatb0_;
    u_xlatb0_ = (_e833 || _e834);
    let _e837 = u_xlatb0_;
    if _e837 {
        let _e838 = u_xlat18_;
        local_9 = _e838;
    } else {
        local_9 = 1f;
    }
    let _e841 = local_9;
    SV_Target0_.w = _e841;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
