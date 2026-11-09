struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 40>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(1) @binding(1) 
var<uniform> _f_buffer1_: f_buffer1_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler;
@group(3) @binding(11) 
var samplerf_s5_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
@group(3) @binding(8) 
var f_t4_: texture_2d<f32>;
@group(3) @binding(10) 
var f_t5_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_TEXCOORD2_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: vec3<bool> = vec3(false);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec2<bool> = vec2(false);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlatb6_: vec2<bool> = vec2(false);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlat21_: vec2<f32> = vec2(0f);
    var u_xlat27_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e88 = u_xlat0_;
    let _e93 = _f_buffer1_.f_cb1_[17];
    let _e95 = vs_TEXCOORD2_1;
    let _e101 = _f_buffer1_.f_cb1_[17];
    let _e103 = ((_e93.zw * _e95.xx) + _e101.xy);
    u_xlat0_.x = _e103.x;
    u_xlat0_.y = _e103.y;
    let _e108 = vs_TEXCOORD0_1;
    let _e113 = _f_buffer0_.f_cb0_[4];
    let _e118 = hscard_bias.values[1];
    let _e121 = textureSampleBias(f_t1_, samplerf_s1_, _e108.xy, (_e113.x + _e118.x));
    u_xlat1_ = _e121;
    let _e123 = u_xlat1_;
    let _e127 = _f_buffer1_.f_cb1_[19];
    u_xlat18_.x = dot(_e123, _e127);
    let _e130 = u_xlat1_;
    let _e134 = _f_buffer1_.f_cb1_[28];
    u_xlat18_.y = dot(_e130, _e134);
    let _e136 = u_xlat18_;
    let _e138 = u_xlat18_;
    let _e143 = min(_e138.xy, vec2<f32>(1f, 1f));
    u_xlat18_.x = _e143.x;
    u_xlat18_.y = _e143.y;
    let _e148 = vs_TEXCOORD1_1;
    let _e153 = _f_buffer0_.f_cb0_[4];
    let _e158 = hscard_bias.values[5];
    let _e161 = textureSampleBias(f_t5_, samplerf_s5_, _e148.zw, (_e153.x + _e158.x));
    u_xlat2_ = _e161;
    let _e162 = u_xlat18_;
    let _e164 = u_xlat2_;
    u_xlat27_ = (_e162.y * _e164.w);
    let _e167 = u_xlat2_;
    let _e172 = _f_buffer1_.f_cb1_[34];
    u_xlat3_ = (_e167.xyxy * _e172);
    let _e174 = u_xlat4_;
    let _e176 = u_xlat3_;
    let _e178 = u_xlat27_;
    let _e181 = vs_TEXCOORD1_1;
    let _e183 = ((_e176.zw * vec2(_e178)) + _e181.xy);
    u_xlat4_.x = _e183.x;
    u_xlat4_.y = _e183.y;
    let _e188 = u_xlat27_;
    let _e190 = u_xlat3_;
    u_xlat3_ = (vec4(_e188) * _e190);
    let _e192 = u_xlat4_;
    let _e197 = _f_buffer0_.f_cb0_[4];
    let _e202 = hscard_bias.values[4];
    let _e205 = textureSampleBias(f_t4_, samplerf_s4_, _e192.xy, (_e197.x + _e202.x));
    u_xlat4_ = _e205;
    let _e207 = u_xlat18_;
    let _e209 = u_xlat4_;
    u_xlat18_.x = (_e207.x * _e209.w);
    let _e212 = u_xlat4_;
    let _e217 = _f_buffer1_.f_cb1_[25];
    u_xlat5_ = (_e212.xyxy * _e217);
    let _e219 = u_xlat5_;
    let _e220 = u_xlat18_;
    let _e223 = u_xlat3_;
    u_xlat3_ = ((_e219 * _e220.xxxx) + _e223);
    let _e225 = u_xlat21_;
    let _e227 = u_xlat3_;
    let _e229 = vs_TEXCOORD0_1;
    let _e231 = (_e227.zw + _e229.zw);
    u_xlat21_.x = _e231.x;
    u_xlat21_.y = _e231.y;
    let _e236 = u_xlat21_;
    let _e241 = _f_buffer0_.f_cb0_[4];
    let _e246 = hscard_bias.values[3];
    let _e249 = textureSampleBias(f_t3_, samplerf_s3_, _e236.xy, (_e241.x + _e246.x));
    u_xlat5_ = _e249;
    let _e250 = u_xlat21_;
    let _e255 = _f_buffer1_.f_cb1_[17];
    let _e261 = _f_buffer1_.f_cb1_[18];
    let _e263 = (-(_e255.xy) + _e261.zw);
    u_xlat21_.x = _e263.x;
    u_xlat21_.y = _e263.y;
    let _e268 = u_xlat5_;
    let _e270 = u_xlat21_;
    let _e273 = u_xlat5_;
    let _e275 = (-(_e270.xy) + _e273.xy);
    u_xlat5_.x = _e275.x;
    u_xlat5_.y = _e275.y;
    let _e280 = u_xlat21_;
    let _e282 = u_xlat5_;
    let _e287 = _f_buffer1_.f_cb1_[18];
    let _e290 = u_xlat21_;
    let _e292 = ((_e282.xy * _e287.xy) + _e290.xy);
    u_xlat21_.x = _e292.x;
    u_xlat21_.y = _e292.y;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat0_;
    let _e301 = u_xlat21_;
    let _e303 = (_e299.xy + _e301.xy);
    u_xlat0_.x = _e303.x;
    u_xlat0_.y = _e303.y;
    let _e308 = u_xlat0_;
    let _e313 = _f_buffer0_.f_cb0_[4];
    let _e318 = hscard_bias.values[2];
    let _e321 = textureSampleBias(f_t2_, samplerf_s2_, _e308.xy, (_e313.x + _e318.x));
    u_xlat6_ = _e321;
    let _e323 = u_xlat5_;
    let _e325 = u_xlat6_;
    u_xlat6_.w = (_e323.z * _e325.w);
    let _e329 = u_xlat1_;
    let _e333 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = dot(_e329, _e333);
    let _e336 = u_xlat1_;
    let _e340 = _f_buffer1_.f_cb1_[39];
    u_xlat0_.y = dot(_e336, _e340);
    let _e342 = u_xlat0_;
    let _e344 = u_xlat0_;
    let _e349 = min(_e344.xy, vec2<f32>(1f, 1f));
    u_xlat0_.x = _e349.x;
    u_xlat0_.y = _e349.y;
    let _e354 = u_xlat0_;
    let _e356 = vs_TEXCOORD2_1;
    u_xlat9_ = (_e354.y * _e356.y);
    let _e360 = u_xlat0_;
    let _e362 = u_xlat6_;
    u_xlat0_.x = (_e360.x * _e362.w);
    let _e365 = u_xlat1_;
    let _e367 = u_xlat6_;
    let _e372 = _f_buffer1_.f_cb1_[16];
    let _e374 = (_e367.xy * _e372.xy);
    u_xlat1_.x = _e374.x;
    u_xlat1_.y = _e374.y;
    let _e379 = u_xlat1_;
    let _e381 = u_xlat1_;
    let _e383 = u_xlat0_;
    let _e386 = u_xlat3_;
    let _e388 = ((_e381.xy * _e383.xx) + _e386.xy);
    u_xlat1_.x = _e388.x;
    u_xlat1_.y = _e388.y;
    let _e393 = u_xlat1_;
    let _e395 = u_xlat1_;
    let _e397 = vs_TEXCOORD0_1;
    let _e399 = (_e395.xy + _e397.xy);
    u_xlat1_.x = _e399.x;
    u_xlat1_.y = _e399.y;
    let _e404 = u_xlat1_;
    let _e409 = _f_buffer0_.f_cb0_[4];
    let _e414 = hscard_bias.values[0];
    let _e417 = textureSampleBias(f_t0_, samplerf_s0_, _e404.xy, (_e409.x + _e414.x));
    u_xlat1_ = _e417;
    let _e421 = _f_buffer1_.f_cb1_[11];
    let _e426 = _f_buffer1_.f_cb1_[11];
    u_xlat3_ = (_e421.wwww * _e426);
    let _e428 = u_xlat6_;
    let _e429 = u_xlat3_;
    let _e431 = u_xlat1_;
    u_xlat5_ = ((_e428 * _e429) + -(_e431));
    let _e434 = u_xlat3_;
    let _e435 = u_xlat6_;
    u_xlat7_ = (_e434 * _e435);
    let _e437 = u_xlat6_;
    let _e439 = u_xlat3_;
    u_xlat3_ = ((-(_e437) * _e439) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e448 = u_xlat7_;
    let _e453 = _f_buffer1_.f_cb1_[15];
    u_xlat6_.x = (_e448.w * _e453.w);
    let _e457 = u_xlat6_;
    u_xlat6_.x = clamp(_e457.x, 0f, 1f);
    let _e462 = u_xlat6_;
    let _e464 = u_xlat5_;
    let _e466 = u_xlat1_;
    u_xlat5_ = ((_e462.xxxx * _e464) + _e466);
    let _e468 = u_xlatb6_;
    let _e478 = _f_buffer1_.f_cb1_[15];
    let _e481 = (vec4<f32>(0f, 0f, 0f, 0f) < _e478.wzww).xy;
    u_xlatb6_.x = _e481.x;
    u_xlatb6_.y = _e481.y;
    let _e486 = u_xlatb6_;
    if _e486.x {
        let _e488 = u_xlat5_;
        local = _e488;
    } else {
        let _e489 = u_xlat1_;
        local = _e489;
    }
    let _e491 = local;
    u_xlat5_ = _e491;
    let _e492 = u_xlat7_;
    let _e493 = u_xlat5_;
    u_xlat8_ = (_e492 * _e493);
    let _e495 = u_xlat8_;
    let _e499 = _f_buffer1_.f_cb1_[15];
    let _e502 = u_xlat5_;
    u_xlat5_ = ((_e495 * _e499.yyyy) + _e502);
    let _e504 = u_xlat7_;
    let _e508 = _f_buffer1_.f_cb1_[15];
    let _e511 = u_xlat5_;
    u_xlat5_ = ((_e504 * _e508.xxxx) + _e511);
    let _e513 = u_xlat5_;
    u_xlat8_ = (-(_e513) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e521 = u_xlat8_;
    let _e522 = u_xlat8_;
    u_xlat8_ = (_e521 + _e522);
    let _e524 = u_xlat8_;
    let _e526 = u_xlat3_;
    u_xlat3_ = ((-(_e524) * _e526) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e534 = u_xlat5_;
    let _e535 = u_xlat5_;
    u_xlat8_ = (_e534 + _e535);
    let _e537 = u_xlat8_;
    let _e539 = u_xlat7_;
    let _e541 = u_xlat3_;
    u_xlat3_ = ((-(_e537) * _e539) + _e541);
    let _e543 = u_xlat7_;
    let _e544 = u_xlat8_;
    u_xlat7_ = (_e543 * _e544);
    let _e546 = u_xlat8_;
    u_xlat8_ = floor(_e546);
    let _e548 = u_xlat8_;
    u_xlat8_ = min(_e548, vec4<f32>(1f, 1f, 1f, 1f));
    let _e555 = u_xlat8_;
    let _e556 = u_xlat3_;
    let _e558 = u_xlat7_;
    u_xlat3_ = ((_e555 * _e556) + _e558);
    let _e560 = u_xlat1_;
    let _e562 = u_xlat3_;
    u_xlat3_ = (-(_e560) + _e562);
    let _e567 = _f_buffer1_.f_cb1_[15];
    let _e569 = u_xlat3_;
    let _e571 = u_xlat1_;
    u_xlat3_ = ((_e567.zzzz * _e569) + _e571);
    let _e573 = u_xlatb6_;
    if _e573.y {
        let _e575 = u_xlat3_;
        local_1 = _e575;
    } else {
        let _e576 = u_xlat5_;
        local_1 = _e576;
    }
    let _e578 = local_1;
    u_xlat3_ = _e578;
    let _e579 = u_xlat1_;
    let _e581 = u_xlat3_;
    u_xlat3_ = (-(_e579) + _e581);
    let _e583 = u_xlat0_;
    let _e585 = u_xlat3_;
    let _e587 = u_xlat1_;
    u_xlat1_ = ((_e583.xxxx * _e585) + _e587);
    let _e589 = u_xlat18_;
    let _e594 = _f_buffer1_.f_cb1_[20];
    u_xlat3_ = (_e589.xxxx * _e594);
    let _e596 = u_xlat3_;
    let _e600 = _f_buffer1_.f_cb1_[20];
    u_xlat3_ = (_e596 * _e600.wwww);
    let _e603 = u_xlat4_;
    let _e604 = u_xlat3_;
    let _e606 = u_xlat1_;
    u_xlat5_ = ((_e603 * _e604) + -(_e606));
    let _e609 = u_xlat3_;
    let _e610 = u_xlat4_;
    u_xlat6_ = (_e609 * _e610);
    let _e612 = u_xlat4_;
    let _e614 = u_xlat3_;
    u_xlat3_ = ((-(_e612) * _e614) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e623 = u_xlat6_;
    let _e628 = _f_buffer1_.f_cb1_[24];
    u_xlat0_.x = (_e623.w * _e628.w);
    let _e632 = u_xlat0_;
    u_xlat0_.x = clamp(_e632.x, 0f, 1f);
    let _e637 = u_xlat0_;
    let _e639 = u_xlat5_;
    let _e641 = u_xlat1_;
    u_xlat4_ = ((_e637.xxxx * _e639) + _e641);
    let _e643 = u_xlatb5_;
    let _e653 = _f_buffer1_.f_cb1_[24];
    let _e656 = (vec4<f32>(0f, 0f, 0f, 0f) < _e653.wzww).xy;
    u_xlatb5_.x = _e656.x;
    u_xlatb5_.y = _e656.y;
    let _e661 = u_xlatb5_;
    if _e661.x {
        let _e663 = u_xlat4_;
        local_2 = _e663;
    } else {
        let _e664 = u_xlat1_;
        local_2 = _e664;
    }
    let _e666 = local_2;
    u_xlat4_ = _e666;
    let _e667 = u_xlat6_;
    let _e668 = u_xlat4_;
    u_xlat7_ = (_e667 * _e668);
    let _e670 = u_xlat7_;
    let _e674 = _f_buffer1_.f_cb1_[24];
    let _e677 = u_xlat4_;
    u_xlat4_ = ((_e670 * _e674.yyyy) + _e677);
    let _e679 = u_xlat6_;
    let _e683 = _f_buffer1_.f_cb1_[24];
    let _e686 = u_xlat4_;
    u_xlat4_ = ((_e679 * _e683.xxxx) + _e686);
    let _e688 = u_xlat4_;
    u_xlat7_ = (-(_e688) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e696 = u_xlat7_;
    let _e697 = u_xlat7_;
    u_xlat7_ = (_e696 + _e697);
    let _e699 = u_xlat7_;
    let _e701 = u_xlat3_;
    u_xlat3_ = ((-(_e699) * _e701) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e709 = u_xlat4_;
    let _e710 = u_xlat4_;
    u_xlat7_ = (_e709 + _e710);
    let _e712 = u_xlat7_;
    let _e714 = u_xlat6_;
    let _e716 = u_xlat3_;
    u_xlat3_ = ((-(_e712) * _e714) + _e716);
    let _e718 = u_xlat6_;
    let _e719 = u_xlat7_;
    u_xlat6_ = (_e718 * _e719);
    let _e721 = u_xlat7_;
    u_xlat7_ = floor(_e721);
    let _e723 = u_xlat7_;
    u_xlat7_ = min(_e723, vec4<f32>(1f, 1f, 1f, 1f));
    let _e730 = u_xlat7_;
    let _e731 = u_xlat3_;
    let _e733 = u_xlat6_;
    u_xlat3_ = ((_e730 * _e731) + _e733);
    let _e735 = u_xlat1_;
    let _e737 = u_xlat3_;
    u_xlat3_ = (-(_e735) + _e737);
    let _e742 = _f_buffer1_.f_cb1_[24];
    let _e744 = u_xlat3_;
    let _e746 = u_xlat1_;
    u_xlat3_ = ((_e742.zzzz * _e744) + _e746);
    let _e748 = u_xlatb5_;
    if _e748.y {
        let _e750 = u_xlat3_;
        local_3 = _e750;
    } else {
        let _e751 = u_xlat4_;
        local_3 = _e751;
    }
    let _e753 = local_3;
    u_xlat3_ = _e753;
    let _e754 = u_xlat1_;
    let _e756 = u_xlat3_;
    u_xlat3_ = (-(_e754) + _e756);
    let _e758 = u_xlat18_;
    let _e760 = u_xlat3_;
    let _e762 = u_xlat1_;
    u_xlat1_ = ((_e758.xxxx * _e760) + _e762);
    let _e764 = u_xlat27_;
    let _e769 = _f_buffer1_.f_cb1_[29];
    u_xlat3_ = (vec4(_e764) * _e769);
    let _e771 = u_xlat3_;
    let _e775 = _f_buffer1_.f_cb1_[29];
    u_xlat3_ = (_e771 * _e775.wwww);
    let _e778 = u_xlat2_;
    let _e779 = u_xlat3_;
    let _e781 = u_xlat1_;
    u_xlat4_ = ((_e778 * _e779) + -(_e781));
    let _e784 = u_xlat2_;
    let _e785 = u_xlat3_;
    u_xlat5_ = (_e784 * _e785);
    let _e787 = u_xlat2_;
    let _e789 = u_xlat3_;
    u_xlat2_ = ((-(_e787) * _e789) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e798 = u_xlat5_;
    let _e803 = _f_buffer1_.f_cb1_[33];
    u_xlat0_.x = (_e798.w * _e803.w);
    let _e807 = u_xlat0_;
    u_xlat0_.x = clamp(_e807.x, 0f, 1f);
    let _e812 = u_xlat0_;
    let _e814 = u_xlat4_;
    let _e816 = u_xlat1_;
    u_xlat3_ = ((_e812.xxxx * _e814) + _e816);
    let _e818 = u_xlatb0_;
    let _e828 = _f_buffer1_.f_cb1_[33];
    let _e831 = (vec4<f32>(0f, 0f, 0f, 0f) < _e828.wwzw).xz;
    u_xlatb0_.x = _e831.x;
    u_xlatb0_.z = _e831.y;
    let _e836 = u_xlatb0_;
    if _e836.x {
        let _e838 = u_xlat3_;
        local_4 = _e838;
    } else {
        let _e839 = u_xlat1_;
        local_4 = _e839;
    }
    let _e841 = local_4;
    u_xlat3_ = _e841;
    let _e842 = u_xlat5_;
    let _e843 = u_xlat3_;
    u_xlat4_ = (_e842 * _e843);
    let _e845 = u_xlat4_;
    let _e849 = _f_buffer1_.f_cb1_[33];
    let _e852 = u_xlat3_;
    u_xlat3_ = ((_e845 * _e849.yyyy) + _e852);
    let _e854 = u_xlat5_;
    let _e858 = _f_buffer1_.f_cb1_[33];
    let _e861 = u_xlat3_;
    u_xlat3_ = ((_e854 * _e858.xxxx) + _e861);
    let _e863 = u_xlat3_;
    u_xlat4_ = (-(_e863) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e871 = u_xlat4_;
    let _e872 = u_xlat4_;
    u_xlat4_ = (_e871 + _e872);
    let _e874 = u_xlat4_;
    let _e876 = u_xlat2_;
    u_xlat2_ = ((-(_e874) * _e876) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e884 = u_xlat3_;
    let _e885 = u_xlat3_;
    u_xlat4_ = (_e884 + _e885);
    let _e887 = u_xlat4_;
    let _e889 = u_xlat5_;
    let _e891 = u_xlat2_;
    u_xlat2_ = ((-(_e887) * _e889) + _e891);
    let _e893 = u_xlat5_;
    let _e894 = u_xlat4_;
    u_xlat5_ = (_e893 * _e894);
    let _e896 = u_xlat4_;
    u_xlat4_ = floor(_e896);
    let _e898 = u_xlat4_;
    u_xlat4_ = min(_e898, vec4<f32>(1f, 1f, 1f, 1f));
    let _e905 = u_xlat4_;
    let _e906 = u_xlat2_;
    let _e908 = u_xlat5_;
    u_xlat2_ = ((_e905 * _e906) + _e908);
    let _e910 = u_xlat1_;
    let _e912 = u_xlat2_;
    u_xlat2_ = (-(_e910) + _e912);
    let _e917 = _f_buffer1_.f_cb1_[33];
    let _e919 = u_xlat2_;
    let _e921 = u_xlat1_;
    u_xlat2_ = ((_e917.zzzz * _e919) + _e921);
    let _e923 = u_xlatb0_;
    if _e923.z {
        let _e925 = u_xlat2_;
        local_5 = _e925;
    } else {
        let _e926 = u_xlat3_;
        local_5 = _e926;
    }
    let _e928 = local_5;
    u_xlat2_ = _e928;
    let _e929 = u_xlat1_;
    let _e931 = u_xlat2_;
    u_xlat2_ = (-(_e929) + _e931);
    let _e933 = u_xlat27_;
    let _e935 = u_xlat2_;
    let _e937 = u_xlat1_;
    u_xlat1_ = ((vec4(_e933) * _e935) + _e937);
    let _e939 = u_xlat1_;
    u_xlat1_ = clamp(_e939, vec4(0f), vec4(1f));
    let _e945 = u_xlat1_;
    u_xlat2_ = log2(_e945);
    let _e947 = u_xlat2_;
    let _e951 = _f_buffer1_.f_cb1_[38];
    u_xlat2_ = (_e947 * _e951.zzzz);
    let _e954 = u_xlat2_;
    u_xlat2_ = exp2(_e954);
    let _e956 = u_xlat9_;
    let _e958 = u_xlat2_;
    let _e960 = u_xlat1_;
    u_xlat0_ = ((vec4(_e956) * _e958) + _e960);
    let _e962 = u_xlat0_;
    let _e963 = vs_COLOR0_1;
    SV_Target0_ = (_e962 * _e963);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e52 = SV_Target0_;
    return FragmentOutput(_e52);
}
