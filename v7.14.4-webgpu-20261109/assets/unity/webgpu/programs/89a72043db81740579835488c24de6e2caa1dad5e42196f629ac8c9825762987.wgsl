struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 34>,
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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: vec2<bool> = vec2(false);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlatb6_: vec2<bool> = vec2(false);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlatb9_: vec3<bool> = vec3(false);
    var u_xlat18_: f32 = 0f;
    var u_xlat19_: vec2<f32> = vec2(0f);
    var u_xlat27_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e86 = u_xlat0_;
    let _e91 = _f_buffer1_.f_cb1_[24];
    let _e96 = _f_buffer1_.f_cb1_[24];
    let _e98 = (_e91.zw + _e96.xy);
    u_xlat0_.x = _e98.x;
    u_xlat0_.y = _e98.y;
    let _e103 = vs_TEXCOORD0_1;
    let _e108 = _f_buffer0_.f_cb0_[4];
    let _e113 = hscard_bias.values[1];
    let _e116 = textureSampleBias(f_t1_, samplerf_s1_, _e103.xy, (_e108.x + _e113.x));
    u_xlat1_ = _e116;
    let _e117 = u_xlat1_;
    let _e121 = _f_buffer1_.f_cb1_[27];
    u_xlat18_ = dot(_e117, _e121);
    let _e123 = u_xlat18_;
    u_xlat18_ = min(_e123, 1f);
    let _e126 = vs_TEXCOORD1_1;
    let _e131 = _f_buffer0_.f_cb0_[4];
    let _e136 = hscard_bias.values[5];
    let _e139 = textureSampleBias(f_t5_, samplerf_s5_, _e126.zw, (_e131.x + _e136.x));
    u_xlat2_ = _e139;
    let _e140 = u_xlat18_;
    let _e141 = u_xlat2_;
    u_xlat18_ = (_e140 * _e141.w);
    let _e144 = u_xlat18_;
    let _e146 = u_xlat2_;
    u_xlat3_ = (vec4(_e144) * _e146.xyxy);
    let _e149 = u_xlat3_;
    let _e153 = _f_buffer1_.f_cb1_[33];
    u_xlat3_ = (_e149 * _e153.zwxy);
    let _e156 = u_xlat3_;
    let _e158 = u_xlat18_;
    let _e160 = u_xlat3_;
    let _e162 = (vec2(_e158) * _e160.xy);
    u_xlat3_.x = _e162.x;
    u_xlat3_.y = _e162.y;
    let _e167 = u_xlat4_;
    let _e169 = u_xlat3_;
    let _e175 = vs_TEXCOORD1_1;
    let _e177 = ((_e169.xy * vec2<f32>(0.001f, 0.001f)) + _e175.xy);
    u_xlat4_.x = _e177.x;
    u_xlat4_.y = _e177.y;
    let _e182 = u_xlat4_;
    let _e187 = _f_buffer0_.f_cb0_[4];
    let _e192 = hscard_bias.values[4];
    let _e195 = textureSampleBias(f_t4_, samplerf_s4_, _e182.xy, (_e187.x + _e192.x));
    u_xlat4_ = _e195;
    let _e196 = u_xlat5_;
    let _e201 = _f_buffer1_.f_cb1_[24];
    let _e207 = _f_buffer1_.f_cb1_[25];
    let _e209 = (-(_e201.xy) + _e207.zw);
    u_xlat5_.x = _e209.x;
    u_xlat5_.y = _e209.y;
    let _e214 = u_xlat4_;
    let _e216 = u_xlat4_;
    let _e218 = u_xlat5_;
    let _e221 = (_e216.xy + -(_e218.xy));
    u_xlat4_.x = _e221.x;
    u_xlat4_.y = _e221.y;
    let _e226 = u_xlat4_;
    let _e228 = u_xlat4_;
    let _e233 = _f_buffer1_.f_cb1_[25];
    let _e236 = u_xlat5_;
    let _e238 = ((_e228.xy * _e233.xy) + _e236.xy);
    u_xlat4_.x = _e238.x;
    u_xlat4_.y = _e238.y;
    let _e243 = u_xlat0_;
    let _e245 = u_xlat0_;
    let _e247 = u_xlat4_;
    let _e249 = (_e245.xy + _e247.xy);
    u_xlat0_.x = _e249.x;
    u_xlat0_.y = _e249.y;
    let _e254 = u_xlat0_;
    let _e259 = _f_buffer0_.f_cb0_[4];
    let _e264 = hscard_bias.values[3];
    let _e267 = textureSampleBias(f_t3_, samplerf_s3_, _e254.xy, (_e259.x + _e264.x));
    u_xlat5_ = _e267;
    let _e269 = u_xlat1_;
    let _e273 = _f_buffer1_.f_cb1_[14];
    u_xlat0_.x = dot(_e269, _e273);
    let _e276 = u_xlat1_;
    let _e280 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.y = dot(_e276, _e280);
    let _e282 = u_xlat0_;
    let _e284 = u_xlat0_;
    let _e289 = min(_e284.xy, vec2<f32>(1f, 1f));
    u_xlat0_.x = _e289.x;
    u_xlat0_.y = _e289.y;
    let _e295 = u_xlat4_;
    let _e297 = u_xlat5_;
    u_xlat5_.w = (_e295.z * _e297.w);
    let _e301 = u_xlat0_;
    let _e303 = u_xlat5_;
    u_xlat0_.x = (_e301.x * _e303.w);
    let _e306 = u_xlat1_;
    let _e308 = u_xlat0_;
    let _e310 = u_xlat5_;
    let _e312 = (_e308.xx * _e310.xy);
    u_xlat1_.x = _e312.x;
    u_xlat1_.y = _e312.y;
    let _e317 = u_xlat1_;
    let _e319 = u_xlat1_;
    let _e324 = _f_buffer1_.f_cb1_[20];
    let _e326 = (_e319.xy * _e324.xy);
    u_xlat1_.x = _e326.x;
    u_xlat1_.y = _e326.y;
    let _e331 = u_xlat1_;
    let _e333 = u_xlat0_;
    let _e335 = u_xlat1_;
    let _e337 = (_e333.xx * _e335.xy);
    u_xlat1_.x = _e337.x;
    u_xlat1_.y = _e337.y;
    let _e342 = u_xlat19_;
    let _e344 = u_xlat5_;
    let _e349 = _f_buffer1_.f_cb1_[20];
    let _e351 = (_e344.xy * _e349.zw);
    u_xlat19_.x = _e351.x;
    u_xlat19_.y = _e351.y;
    let _e356 = u_xlat19_;
    let _e358 = u_xlat19_;
    let _e360 = u_xlat0_;
    let _e363 = u_xlat3_;
    let _e365 = ((_e358.xy * _e360.xx) + _e363.xy);
    u_xlat19_.x = _e365.x;
    u_xlat19_.y = _e365.y;
    let _e370 = u_xlat19_;
    let _e372 = u_xlat19_;
    let _e378 = vs_TEXCOORD0_1;
    let _e380 = ((_e372.xy * vec2<f32>(0.001f, 0.001f)) + _e378.zw);
    u_xlat19_.x = _e380.x;
    u_xlat19_.y = _e380.y;
    let _e385 = u_xlat19_;
    let _e390 = _f_buffer0_.f_cb0_[4];
    let _e395 = hscard_bias.values[2];
    let _e398 = textureSampleBias(f_t2_, samplerf_s2_, _e385.xy, (_e390.x + _e395.x));
    u_xlat4_ = _e398;
    let _e399 = u_xlat0_;
    let _e401 = u_xlat4_;
    u_xlat9_ = (_e399.y * _e401.w);
    let _e404 = u_xlat19_;
    let _e406 = u_xlat4_;
    let _e411 = _f_buffer1_.f_cb1_[8];
    let _e413 = (_e406.xy * _e411.xy);
    u_xlat19_.x = _e413.x;
    u_xlat19_.y = _e413.y;
    let _e418 = u_xlat1_;
    let _e420 = u_xlat19_;
    let _e422 = u_xlat9_;
    let _e425 = u_xlat1_;
    let _e427 = ((_e420.xy * vec2(_e422)) + _e425.xy);
    u_xlat1_.x = _e427.x;
    u_xlat1_.y = _e427.y;
    let _e432 = u_xlat1_;
    let _e434 = u_xlat3_;
    let _e436 = u_xlat18_;
    let _e439 = u_xlat1_;
    let _e441 = ((_e434.zw * vec2(_e436)) + _e439.xy);
    u_xlat1_.x = _e441.x;
    u_xlat1_.y = _e441.y;
    let _e446 = u_xlat1_;
    let _e448 = u_xlat1_;
    let _e454 = vs_TEXCOORD0_1;
    let _e456 = ((_e448.xy * vec2<f32>(0.001f, 0.001f)) + _e454.xy);
    u_xlat1_.x = _e456.x;
    u_xlat1_.y = _e456.y;
    let _e461 = u_xlat1_;
    let _e466 = _f_buffer0_.f_cb0_[4];
    let _e471 = hscard_bias.values[0];
    let _e474 = textureSampleBias(f_t0_, samplerf_s0_, _e461.xy, (_e466.x + _e471.x));
    u_xlat1_ = _e474;
    let _e478 = _f_buffer1_.f_cb1_[3];
    let _e483 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = (_e478.wwww * _e483);
    let _e485 = u_xlat4_;
    let _e486 = u_xlat3_;
    let _e488 = u_xlat1_;
    u_xlat6_ = ((_e485 * _e486) + -(_e488));
    let _e491 = u_xlat3_;
    let _e492 = u_xlat4_;
    u_xlat7_ = (_e491 * _e492);
    let _e494 = u_xlat4_;
    let _e496 = u_xlat3_;
    u_xlat3_ = ((-(_e494) * _e496) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e504 = u_xlat7_;
    let _e509 = _f_buffer1_.f_cb1_[7];
    u_xlat27_ = (_e504.w * _e509.w);
    let _e512 = u_xlat27_;
    u_xlat27_ = clamp(_e512, 0f, 1f);
    let _e516 = u_xlat27_;
    let _e518 = u_xlat6_;
    let _e520 = u_xlat1_;
    u_xlat4_ = ((vec4(_e516) * _e518) + _e520);
    let _e522 = u_xlatb6_;
    let _e532 = _f_buffer1_.f_cb1_[7];
    let _e535 = (vec4<f32>(0f, 0f, 0f, 0f) < _e532.wzww).xy;
    u_xlatb6_.x = _e535.x;
    u_xlatb6_.y = _e535.y;
    let _e540 = u_xlatb6_;
    if _e540.x {
        let _e542 = u_xlat4_;
        local = _e542;
    } else {
        let _e543 = u_xlat1_;
        local = _e543;
    }
    let _e545 = local;
    u_xlat4_ = _e545;
    let _e546 = u_xlat7_;
    let _e547 = u_xlat4_;
    u_xlat8_ = (_e546 * _e547);
    let _e549 = u_xlat8_;
    let _e553 = _f_buffer1_.f_cb1_[7];
    let _e556 = u_xlat4_;
    u_xlat4_ = ((_e549 * _e553.yyyy) + _e556);
    let _e558 = u_xlat7_;
    let _e562 = _f_buffer1_.f_cb1_[7];
    let _e565 = u_xlat4_;
    u_xlat4_ = ((_e558 * _e562.xxxx) + _e565);
    let _e567 = u_xlat4_;
    u_xlat8_ = (-(_e567) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e575 = u_xlat8_;
    let _e576 = u_xlat8_;
    u_xlat8_ = (_e575 + _e576);
    let _e578 = u_xlat8_;
    let _e580 = u_xlat3_;
    u_xlat3_ = ((-(_e578) * _e580) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e588 = u_xlat4_;
    let _e589 = u_xlat4_;
    u_xlat8_ = (_e588 + _e589);
    let _e591 = u_xlat8_;
    let _e593 = u_xlat7_;
    let _e595 = u_xlat3_;
    u_xlat3_ = ((-(_e591) * _e593) + _e595);
    let _e597 = u_xlat7_;
    let _e598 = u_xlat8_;
    u_xlat7_ = (_e597 * _e598);
    let _e600 = u_xlat8_;
    u_xlat8_ = floor(_e600);
    let _e602 = u_xlat8_;
    u_xlat8_ = min(_e602, vec4<f32>(1f, 1f, 1f, 1f));
    let _e609 = u_xlat8_;
    let _e610 = u_xlat3_;
    let _e612 = u_xlat7_;
    u_xlat3_ = ((_e609 * _e610) + _e612);
    let _e614 = u_xlat1_;
    let _e616 = u_xlat3_;
    u_xlat3_ = (-(_e614) + _e616);
    let _e621 = _f_buffer1_.f_cb1_[7];
    let _e623 = u_xlat3_;
    let _e625 = u_xlat1_;
    u_xlat3_ = ((_e621.zzzz * _e623) + _e625);
    let _e627 = u_xlatb6_;
    if _e627.y {
        let _e629 = u_xlat3_;
        local_1 = _e629;
    } else {
        let _e630 = u_xlat4_;
        local_1 = _e630;
    }
    let _e632 = local_1;
    u_xlat3_ = _e632;
    let _e633 = u_xlat1_;
    let _e635 = u_xlat3_;
    u_xlat3_ = (-(_e633) + _e635);
    let _e637 = u_xlat9_;
    let _e639 = u_xlat3_;
    let _e641 = u_xlat1_;
    u_xlat1_ = ((vec4(_e637) * _e639) + _e641);
    let _e646 = _f_buffer1_.f_cb1_[15];
    let _e651 = _f_buffer1_.f_cb1_[15];
    u_xlat3_ = (_e646.wwww * _e651);
    let _e653 = u_xlat5_;
    let _e654 = u_xlat3_;
    let _e656 = u_xlat1_;
    u_xlat4_ = ((_e653 * _e654) + -(_e656));
    let _e659 = u_xlat3_;
    let _e660 = u_xlat5_;
    u_xlat6_ = (_e659 * _e660);
    let _e662 = u_xlat5_;
    let _e664 = u_xlat3_;
    u_xlat3_ = ((-(_e662) * _e664) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e672 = u_xlat6_;
    let _e677 = _f_buffer1_.f_cb1_[19];
    u_xlat9_ = (_e672.w * _e677.w);
    let _e680 = u_xlat9_;
    u_xlat9_ = clamp(_e680, 0f, 1f);
    let _e684 = u_xlat9_;
    let _e686 = u_xlat4_;
    let _e688 = u_xlat1_;
    u_xlat4_ = ((vec4(_e684) * _e686) + _e688);
    let _e690 = u_xlatb9_;
    let _e700 = _f_buffer1_.f_cb1_[19];
    let _e703 = (vec4<f32>(0f, 0f, 0f, 0f) < _e700.wwzz).xz;
    u_xlatb9_.x = _e703.x;
    u_xlatb9_.z = _e703.y;
    let _e708 = u_xlatb9_;
    if _e708.x {
        let _e710 = u_xlat4_;
        local_2 = _e710;
    } else {
        let _e711 = u_xlat1_;
        local_2 = _e711;
    }
    let _e713 = local_2;
    u_xlat4_ = _e713;
    let _e714 = u_xlat6_;
    let _e715 = u_xlat4_;
    u_xlat5_ = (_e714 * _e715);
    let _e717 = u_xlat5_;
    let _e721 = _f_buffer1_.f_cb1_[19];
    let _e724 = u_xlat4_;
    u_xlat4_ = ((_e717 * _e721.yyyy) + _e724);
    let _e726 = u_xlat6_;
    let _e730 = _f_buffer1_.f_cb1_[19];
    let _e733 = u_xlat4_;
    u_xlat4_ = ((_e726 * _e730.xxxx) + _e733);
    let _e735 = u_xlat4_;
    u_xlat5_ = (-(_e735) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e743 = u_xlat5_;
    let _e744 = u_xlat5_;
    u_xlat5_ = (_e743 + _e744);
    let _e746 = u_xlat5_;
    let _e748 = u_xlat3_;
    u_xlat3_ = ((-(_e746) * _e748) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e756 = u_xlat4_;
    let _e757 = u_xlat4_;
    u_xlat5_ = (_e756 + _e757);
    let _e759 = u_xlat5_;
    let _e761 = u_xlat6_;
    let _e763 = u_xlat3_;
    u_xlat3_ = ((-(_e759) * _e761) + _e763);
    let _e765 = u_xlat6_;
    let _e766 = u_xlat5_;
    u_xlat6_ = (_e765 * _e766);
    let _e768 = u_xlat5_;
    u_xlat5_ = floor(_e768);
    let _e770 = u_xlat5_;
    u_xlat5_ = min(_e770, vec4<f32>(1f, 1f, 1f, 1f));
    let _e777 = u_xlat5_;
    let _e778 = u_xlat3_;
    let _e780 = u_xlat6_;
    u_xlat3_ = ((_e777 * _e778) + _e780);
    let _e782 = u_xlat1_;
    let _e784 = u_xlat3_;
    u_xlat3_ = (-(_e782) + _e784);
    let _e789 = _f_buffer1_.f_cb1_[19];
    let _e791 = u_xlat3_;
    let _e793 = u_xlat1_;
    u_xlat3_ = ((_e789.zzzz * _e791) + _e793);
    let _e795 = u_xlatb9_;
    if _e795.z {
        let _e797 = u_xlat3_;
        local_3 = _e797;
    } else {
        let _e798 = u_xlat4_;
        local_3 = _e798;
    }
    let _e800 = local_3;
    u_xlat3_ = _e800;
    let _e801 = u_xlat1_;
    let _e803 = u_xlat3_;
    u_xlat3_ = (-(_e801) + _e803);
    let _e805 = u_xlat0_;
    let _e807 = u_xlat3_;
    let _e809 = u_xlat1_;
    u_xlat1_ = ((_e805.xxxx * _e807) + _e809);
    let _e814 = _f_buffer1_.f_cb1_[28];
    let _e819 = _f_buffer1_.f_cb1_[28];
    u_xlat3_ = (_e814.wwww * _e819);
    let _e821 = u_xlat2_;
    let _e822 = u_xlat3_;
    let _e824 = u_xlat1_;
    u_xlat4_ = ((_e821 * _e822) + -(_e824));
    let _e827 = u_xlat2_;
    let _e828 = u_xlat3_;
    u_xlat5_ = (_e827 * _e828);
    let _e830 = u_xlat2_;
    let _e832 = u_xlat3_;
    u_xlat2_ = ((-(_e830) * _e832) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e841 = u_xlat5_;
    let _e846 = _f_buffer1_.f_cb1_[32];
    u_xlat0_.x = (_e841.w * _e846.w);
    let _e850 = u_xlat0_;
    u_xlat0_.x = clamp(_e850.x, 0f, 1f);
    let _e855 = u_xlat0_;
    let _e857 = u_xlat4_;
    let _e859 = u_xlat1_;
    u_xlat3_ = ((_e855.xxxx * _e857) + _e859);
    let _e861 = u_xlatb0_;
    let _e871 = _f_buffer1_.f_cb1_[32];
    let _e874 = (vec4<f32>(0f, 0f, 0f, 0f) < _e871.wzww).xy;
    u_xlatb0_.x = _e874.x;
    u_xlatb0_.y = _e874.y;
    let _e879 = u_xlatb0_;
    if _e879.x {
        let _e881 = u_xlat3_;
        local_4 = _e881;
    } else {
        let _e882 = u_xlat1_;
        local_4 = _e882;
    }
    let _e884 = local_4;
    u_xlat3_ = _e884;
    let _e885 = u_xlat5_;
    let _e886 = u_xlat3_;
    u_xlat4_ = (_e885 * _e886);
    let _e888 = u_xlat4_;
    let _e892 = _f_buffer1_.f_cb1_[32];
    let _e895 = u_xlat3_;
    u_xlat3_ = ((_e888 * _e892.yyyy) + _e895);
    let _e897 = u_xlat5_;
    let _e901 = _f_buffer1_.f_cb1_[32];
    let _e904 = u_xlat3_;
    u_xlat3_ = ((_e897 * _e901.xxxx) + _e904);
    let _e906 = u_xlat3_;
    u_xlat4_ = (-(_e906) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e914 = u_xlat4_;
    let _e915 = u_xlat4_;
    u_xlat4_ = (_e914 + _e915);
    let _e917 = u_xlat4_;
    let _e919 = u_xlat2_;
    u_xlat2_ = ((-(_e917) * _e919) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e927 = u_xlat3_;
    let _e928 = u_xlat3_;
    u_xlat4_ = (_e927 + _e928);
    let _e930 = u_xlat4_;
    let _e932 = u_xlat5_;
    let _e934 = u_xlat2_;
    u_xlat2_ = ((-(_e930) * _e932) + _e934);
    let _e936 = u_xlat5_;
    let _e937 = u_xlat4_;
    u_xlat5_ = (_e936 * _e937);
    let _e939 = u_xlat4_;
    u_xlat4_ = floor(_e939);
    let _e941 = u_xlat4_;
    u_xlat4_ = min(_e941, vec4<f32>(1f, 1f, 1f, 1f));
    let _e948 = u_xlat4_;
    let _e949 = u_xlat2_;
    let _e951 = u_xlat5_;
    u_xlat2_ = ((_e948 * _e949) + _e951);
    let _e953 = u_xlat1_;
    let _e955 = u_xlat2_;
    u_xlat2_ = (-(_e953) + _e955);
    let _e960 = _f_buffer1_.f_cb1_[32];
    let _e962 = u_xlat2_;
    let _e964 = u_xlat1_;
    u_xlat2_ = ((_e960.zzzz * _e962) + _e964);
    let _e966 = u_xlatb0_;
    if _e966.y {
        let _e968 = u_xlat2_;
        local_5 = _e968;
    } else {
        let _e969 = u_xlat3_;
        local_5 = _e969;
    }
    let _e971 = local_5;
    u_xlat2_ = _e971;
    let _e972 = u_xlat1_;
    let _e974 = u_xlat2_;
    u_xlat2_ = (-(_e972) + _e974);
    let _e976 = u_xlat18_;
    let _e978 = u_xlat2_;
    let _e980 = u_xlat1_;
    u_xlat0_ = ((vec4(_e976) * _e978) + _e980);
    let _e982 = u_xlat0_;
    u_xlat0_ = clamp(_e982, vec4(0f), vec4(1f));
    let _e988 = u_xlat0_;
    let _e989 = vs_COLOR0_1;
    u_xlat1_ = (_e988 * _e989);
    let _e991 = u_xlat0_;
    let _e992 = u_xlat1_;
    SV_Target0_ = min(_e991, _e992);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e48 = SV_Target0_;
    return FragmentOutput(_e48);
}
