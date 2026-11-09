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
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat10_: f32 = 0f;
    var u_xlatb10_: vec2<bool> = vec2(false);
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlat19_: vec2<f32> = vec2(0f);
    var u_xlatb19_: vec2<bool> = vec2(false);
    var u_xlat20_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e88 = u_xlat0_;
    let _e93 = _f_buffer1_.f_cb1_[26];
    let _e95 = vs_TEXCOORD2_1;
    let _e101 = _f_buffer1_.f_cb1_[26];
    let _e103 = ((_e93.zw * _e95.xx) + _e101.xy);
    u_xlat0_.x = _e103.x;
    u_xlat0_.y = _e103.y;
    let _e108 = u_xlat18_;
    let _e113 = _f_buffer1_.f_cb1_[26];
    let _e119 = _f_buffer1_.f_cb1_[27];
    let _e121 = (-(_e113.xy) + _e119.zw);
    u_xlat18_.x = _e121.x;
    u_xlat18_.y = _e121.y;
    let _e126 = vs_TEXCOORD0_1;
    let _e131 = _f_buffer0_.f_cb0_[4];
    let _e136 = hscard_bias.values[1];
    let _e139 = textureSampleBias(f_t1_, samplerf_s1_, _e126.xy, (_e131.x + _e136.x));
    u_xlat1_ = _e139;
    let _e141 = u_xlat1_;
    let _e145 = _f_buffer1_.f_cb1_[28];
    u_xlat2_.x = dot(_e141, _e145);
    let _e148 = u_xlat2_;
    u_xlat2_.x = min(_e148.x, 1f);
    let _e152 = vs_TEXCOORD1_1;
    let _e157 = _f_buffer0_.f_cb0_[4];
    let _e162 = hscard_bias.values[5];
    let _e165 = textureSampleBias(f_t5_, samplerf_s5_, _e152.zw, (_e157.x + _e162.x));
    u_xlat3_ = _e165;
    let _e167 = u_xlat2_;
    let _e169 = u_xlat3_;
    u_xlat2_.x = (_e167.x * _e169.w);
    let _e172 = u_xlat3_;
    let _e177 = _f_buffer1_.f_cb1_[34];
    u_xlat4_ = (_e172.xyxy * _e177);
    let _e179 = u_xlat11_;
    let _e181 = u_xlat4_;
    let _e183 = u_xlat2_;
    let _e186 = vs_TEXCOORD1_1;
    let _e188 = ((_e181.zw * _e183.xx) + _e186.xy);
    u_xlat11_.x = _e188.x;
    u_xlat11_.y = _e188.y;
    let _e193 = u_xlat2_;
    let _e195 = u_xlat4_;
    u_xlat4_ = (_e193.xxxx * _e195);
    let _e197 = u_xlat11_;
    let _e202 = _f_buffer0_.f_cb0_[4];
    let _e207 = hscard_bias.values[4];
    let _e210 = textureSampleBias(f_t4_, samplerf_s4_, _e197.xy, (_e202.x + _e207.x));
    u_xlat5_ = _e210;
    let _e211 = u_xlat11_;
    let _e213 = u_xlat18_;
    let _e216 = u_xlat5_;
    let _e218 = (-(_e213.xy) + _e216.xy);
    u_xlat11_.x = _e218.x;
    u_xlat11_.y = _e218.y;
    let _e223 = u_xlat18_;
    let _e225 = u_xlat11_;
    let _e230 = _f_buffer1_.f_cb1_[27];
    let _e233 = u_xlat18_;
    let _e235 = ((_e225.xy * _e230.xy) + _e233.xy);
    u_xlat18_.x = _e235.x;
    u_xlat18_.y = _e235.y;
    let _e240 = u_xlat0_;
    let _e242 = u_xlat0_;
    let _e244 = u_xlat18_;
    let _e246 = (_e242.xy + _e244.xy);
    u_xlat0_.x = _e246.x;
    u_xlat0_.y = _e246.y;
    let _e251 = u_xlat0_;
    let _e256 = _f_buffer0_.f_cb0_[4];
    let _e261 = hscard_bias.values[3];
    let _e264 = textureSampleBias(f_t3_, samplerf_s3_, _e251.xy, (_e256.x + _e261.x));
    u_xlat0_ = _e264;
    let _e266 = u_xlat5_;
    let _e268 = u_xlat0_;
    u_xlat0_.w = (_e266.z * _e268.w);
    let _e271 = u_xlat0_;
    let _e276 = _f_buffer1_.f_cb1_[25];
    u_xlat5_ = (_e271.xyxy * _e276);
    let _e279 = u_xlat1_;
    let _e283 = _f_buffer1_.f_cb1_[19];
    u_xlat11_.x = dot(_e279, _e283);
    let _e286 = u_xlat11_;
    u_xlat11_.x = min(_e286.x, 1f);
    let _e291 = u_xlat0_;
    let _e293 = u_xlat11_;
    u_xlat11_.x = (_e291.w * _e293.x);
    let _e296 = u_xlat5_;
    let _e297 = u_xlat11_;
    let _e300 = u_xlat4_;
    u_xlat4_ = ((_e296 * _e297.xxxx) + _e300);
    let _e302 = u_xlat1_;
    let _e306 = _f_buffer1_.f_cb1_[10];
    u_xlat20_ = dot(_e302, _e306);
    let _e309 = u_xlat1_;
    let _e313 = _f_buffer1_.f_cb1_[39];
    u_xlat1_.x = dot(_e309, _e313);
    let _e316 = u_xlat1_;
    u_xlat1_.x = min(_e316.x, 1f);
    let _e321 = u_xlat1_;
    let _e323 = vs_TEXCOORD2_1;
    u_xlat1_.x = (_e321.x * _e323.y);
    let _e326 = u_xlat20_;
    u_xlat10_ = min(_e326, 1f);
    let _e329 = u_xlat19_;
    let _e331 = u_xlat4_;
    let _e333 = vs_TEXCOORD0_1;
    let _e335 = (_e331.zw + _e333.zw);
    u_xlat19_.x = _e335.x;
    u_xlat19_.y = _e335.y;
    let _e340 = u_xlat19_;
    let _e345 = _f_buffer0_.f_cb0_[4];
    let _e350 = hscard_bias.values[2];
    let _e353 = textureSampleBias(f_t2_, samplerf_s2_, _e340.xy, (_e345.x + _e350.x));
    u_xlat5_ = _e353;
    let _e354 = u_xlat10_;
    let _e355 = u_xlat5_;
    u_xlat10_ = (_e354 * _e355.w);
    let _e358 = u_xlat19_;
    let _e360 = u_xlat5_;
    let _e365 = _f_buffer1_.f_cb1_[16];
    let _e367 = (_e360.xy * _e365.xy);
    u_xlat19_.x = _e367.x;
    u_xlat19_.y = _e367.y;
    let _e372 = u_xlat19_;
    let _e374 = u_xlat19_;
    let _e376 = u_xlat10_;
    let _e379 = u_xlat4_;
    let _e381 = ((_e374.xy * vec2(_e376)) + _e379.xy);
    u_xlat19_.x = _e381.x;
    u_xlat19_.y = _e381.y;
    let _e386 = u_xlat19_;
    let _e388 = u_xlat19_;
    let _e390 = vs_TEXCOORD0_1;
    let _e392 = (_e388.xy + _e390.xy);
    u_xlat19_.x = _e392.x;
    u_xlat19_.y = _e392.y;
    let _e397 = u_xlat19_;
    let _e402 = _f_buffer0_.f_cb0_[4];
    let _e407 = hscard_bias.values[0];
    let _e410 = textureSampleBias(f_t0_, samplerf_s0_, _e397.xy, (_e402.x + _e407.x));
    u_xlat4_ = _e410;
    let _e414 = _f_buffer1_.f_cb1_[11];
    let _e419 = _f_buffer1_.f_cb1_[11];
    u_xlat6_ = (_e414.wwww * _e419);
    let _e421 = u_xlat5_;
    let _e422 = u_xlat6_;
    let _e424 = u_xlat4_;
    u_xlat7_ = ((_e421 * _e422) + -(_e424));
    let _e427 = u_xlat5_;
    let _e428 = u_xlat6_;
    u_xlat8_ = (_e427 * _e428);
    let _e430 = u_xlat5_;
    let _e432 = u_xlat6_;
    u_xlat5_ = ((-(_e430) * _e432) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e441 = u_xlat8_;
    let _e446 = _f_buffer1_.f_cb1_[15];
    u_xlat19_.x = (_e441.w * _e446.w);
    let _e450 = u_xlat19_;
    u_xlat19_.x = clamp(_e450.x, 0f, 1f);
    let _e455 = u_xlat19_;
    let _e457 = u_xlat7_;
    let _e459 = u_xlat4_;
    u_xlat6_ = ((_e455.xxxx * _e457) + _e459);
    let _e461 = u_xlatb19_;
    let _e471 = _f_buffer1_.f_cb1_[15];
    let _e474 = (vec4<f32>(0f, 0f, 0f, 0f) < _e471.wzwz).xy;
    u_xlatb19_.x = _e474.x;
    u_xlatb19_.y = _e474.y;
    let _e479 = u_xlatb19_;
    if _e479.x {
        let _e481 = u_xlat6_;
        local = _e481;
    } else {
        let _e482 = u_xlat4_;
        local = _e482;
    }
    let _e484 = local;
    u_xlat6_ = _e484;
    let _e485 = u_xlat8_;
    let _e486 = u_xlat6_;
    u_xlat7_ = (_e485 * _e486);
    let _e488 = u_xlat7_;
    let _e492 = _f_buffer1_.f_cb1_[15];
    let _e495 = u_xlat6_;
    u_xlat6_ = ((_e488 * _e492.yyyy) + _e495);
    let _e497 = u_xlat8_;
    let _e501 = _f_buffer1_.f_cb1_[15];
    let _e504 = u_xlat6_;
    u_xlat6_ = ((_e497 * _e501.xxxx) + _e504);
    let _e506 = u_xlat6_;
    u_xlat7_ = (-(_e506) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e514 = u_xlat7_;
    let _e515 = u_xlat7_;
    u_xlat7_ = (_e514 + _e515);
    let _e517 = u_xlat7_;
    let _e519 = u_xlat5_;
    u_xlat5_ = ((-(_e517) * _e519) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e527 = u_xlat6_;
    let _e528 = u_xlat6_;
    u_xlat7_ = (_e527 + _e528);
    let _e530 = u_xlat7_;
    let _e532 = u_xlat8_;
    let _e534 = u_xlat5_;
    u_xlat5_ = ((-(_e530) * _e532) + _e534);
    let _e536 = u_xlat8_;
    let _e537 = u_xlat7_;
    u_xlat8_ = (_e536 * _e537);
    let _e539 = u_xlat7_;
    u_xlat7_ = floor(_e539);
    let _e541 = u_xlat7_;
    u_xlat7_ = min(_e541, vec4<f32>(1f, 1f, 1f, 1f));
    let _e548 = u_xlat7_;
    let _e549 = u_xlat5_;
    let _e551 = u_xlat8_;
    u_xlat5_ = ((_e548 * _e549) + _e551);
    let _e553 = u_xlat4_;
    let _e555 = u_xlat5_;
    u_xlat5_ = (-(_e553) + _e555);
    let _e560 = _f_buffer1_.f_cb1_[15];
    let _e562 = u_xlat5_;
    let _e564 = u_xlat4_;
    u_xlat5_ = ((_e560.zzzz * _e562) + _e564);
    let _e566 = u_xlatb19_;
    if _e566.y {
        let _e568 = u_xlat5_;
        local_1 = _e568;
    } else {
        let _e569 = u_xlat6_;
        local_1 = _e569;
    }
    let _e571 = local_1;
    u_xlat5_ = _e571;
    let _e572 = u_xlat4_;
    let _e574 = u_xlat5_;
    u_xlat5_ = (-(_e572) + _e574);
    let _e576 = u_xlat10_;
    let _e578 = u_xlat5_;
    let _e580 = u_xlat4_;
    u_xlat4_ = ((vec4(_e576) * _e578) + _e580);
    let _e582 = u_xlat11_;
    let _e587 = _f_buffer1_.f_cb1_[20];
    u_xlat5_ = (_e582.xxxx * _e587);
    let _e589 = u_xlat5_;
    let _e593 = _f_buffer1_.f_cb1_[20];
    u_xlat5_ = (_e589 * _e593.wwww);
    let _e596 = u_xlat0_;
    let _e597 = u_xlat5_;
    let _e599 = u_xlat4_;
    u_xlat6_ = ((_e596 * _e597) + -(_e599));
    let _e602 = u_xlat0_;
    let _e603 = u_xlat5_;
    u_xlat7_ = (_e602 * _e603);
    let _e605 = u_xlat0_;
    let _e607 = u_xlat5_;
    u_xlat0_ = ((-(_e605) * _e607) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e615 = u_xlat7_;
    let _e620 = _f_buffer1_.f_cb1_[24];
    u_xlat10_ = (_e615.w * _e620.w);
    let _e623 = u_xlat10_;
    u_xlat10_ = clamp(_e623, 0f, 1f);
    let _e627 = u_xlat10_;
    let _e629 = u_xlat6_;
    let _e631 = u_xlat4_;
    u_xlat5_ = ((vec4(_e627) * _e629) + _e631);
    let _e633 = u_xlatb10_;
    let _e643 = _f_buffer1_.f_cb1_[24];
    let _e646 = (vec4<f32>(0f, 0f, 0f, 0f) < _e643.wzww).xy;
    u_xlatb10_.x = _e646.x;
    u_xlatb10_.y = _e646.y;
    let _e651 = u_xlatb10_;
    if _e651.x {
        let _e653 = u_xlat5_;
        local_2 = _e653;
    } else {
        let _e654 = u_xlat4_;
        local_2 = _e654;
    }
    let _e656 = local_2;
    u_xlat5_ = _e656;
    let _e657 = u_xlat7_;
    let _e658 = u_xlat5_;
    u_xlat6_ = (_e657 * _e658);
    let _e660 = u_xlat6_;
    let _e664 = _f_buffer1_.f_cb1_[24];
    let _e667 = u_xlat5_;
    u_xlat5_ = ((_e660 * _e664.yyyy) + _e667);
    let _e669 = u_xlat7_;
    let _e673 = _f_buffer1_.f_cb1_[24];
    let _e676 = u_xlat5_;
    u_xlat5_ = ((_e669 * _e673.xxxx) + _e676);
    let _e678 = u_xlat5_;
    u_xlat6_ = (-(_e678) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e686 = u_xlat6_;
    let _e687 = u_xlat6_;
    u_xlat6_ = (_e686 + _e687);
    let _e689 = u_xlat6_;
    let _e691 = u_xlat0_;
    u_xlat0_ = ((-(_e689) * _e691) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e699 = u_xlat5_;
    let _e700 = u_xlat5_;
    u_xlat6_ = (_e699 + _e700);
    let _e702 = u_xlat6_;
    let _e704 = u_xlat7_;
    let _e706 = u_xlat0_;
    u_xlat0_ = ((-(_e702) * _e704) + _e706);
    let _e708 = u_xlat7_;
    let _e709 = u_xlat6_;
    u_xlat7_ = (_e708 * _e709);
    let _e711 = u_xlat6_;
    u_xlat6_ = floor(_e711);
    let _e713 = u_xlat6_;
    u_xlat6_ = min(_e713, vec4<f32>(1f, 1f, 1f, 1f));
    let _e720 = u_xlat6_;
    let _e721 = u_xlat0_;
    let _e723 = u_xlat7_;
    u_xlat0_ = ((_e720 * _e721) + _e723);
    let _e725 = u_xlat4_;
    let _e727 = u_xlat0_;
    u_xlat0_ = (-(_e725) + _e727);
    let _e732 = _f_buffer1_.f_cb1_[24];
    let _e734 = u_xlat0_;
    let _e736 = u_xlat4_;
    u_xlat0_ = ((_e732.zzzz * _e734) + _e736);
    let _e738 = u_xlatb10_;
    if _e738.y {
        let _e740 = u_xlat0_;
        local_3 = _e740;
    } else {
        let _e741 = u_xlat5_;
        local_3 = _e741;
    }
    let _e743 = local_3;
    u_xlat0_ = _e743;
    let _e744 = u_xlat4_;
    let _e746 = u_xlat0_;
    u_xlat0_ = (-(_e744) + _e746);
    let _e748 = u_xlat11_;
    let _e750 = u_xlat0_;
    let _e752 = u_xlat4_;
    u_xlat0_ = ((_e748.xxxx * _e750) + _e752);
    let _e754 = u_xlat2_;
    let _e759 = _f_buffer1_.f_cb1_[29];
    u_xlat4_ = (_e754.xxxx * _e759);
    let _e761 = u_xlat4_;
    let _e765 = _f_buffer1_.f_cb1_[29];
    u_xlat4_ = (_e761 * _e765.wwww);
    let _e768 = u_xlat3_;
    let _e769 = u_xlat4_;
    let _e771 = u_xlat0_;
    u_xlat5_ = ((_e768 * _e769) + -(_e771));
    let _e774 = u_xlat3_;
    let _e775 = u_xlat4_;
    u_xlat6_ = (_e774 * _e775);
    let _e777 = u_xlat3_;
    let _e779 = u_xlat4_;
    u_xlat3_ = ((-(_e777) * _e779) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e787 = u_xlat6_;
    let _e792 = _f_buffer1_.f_cb1_[33];
    u_xlat10_ = (_e787.w * _e792.w);
    let _e795 = u_xlat10_;
    u_xlat10_ = clamp(_e795, 0f, 1f);
    let _e799 = u_xlat10_;
    let _e801 = u_xlat5_;
    let _e803 = u_xlat0_;
    u_xlat4_ = ((vec4(_e799) * _e801) + _e803);
    let _e805 = u_xlatb10_;
    let _e815 = _f_buffer1_.f_cb1_[33];
    let _e818 = (vec4<f32>(0f, 0f, 0f, 0f) < _e815.wzww).xy;
    u_xlatb10_.x = _e818.x;
    u_xlatb10_.y = _e818.y;
    let _e823 = u_xlatb10_;
    if _e823.x {
        let _e825 = u_xlat4_;
        local_4 = _e825;
    } else {
        let _e826 = u_xlat0_;
        local_4 = _e826;
    }
    let _e828 = local_4;
    u_xlat4_ = _e828;
    let _e829 = u_xlat6_;
    let _e830 = u_xlat4_;
    u_xlat5_ = (_e829 * _e830);
    let _e832 = u_xlat5_;
    let _e836 = _f_buffer1_.f_cb1_[33];
    let _e839 = u_xlat4_;
    u_xlat4_ = ((_e832 * _e836.yyyy) + _e839);
    let _e841 = u_xlat6_;
    let _e845 = _f_buffer1_.f_cb1_[33];
    let _e848 = u_xlat4_;
    u_xlat4_ = ((_e841 * _e845.xxxx) + _e848);
    let _e850 = u_xlat4_;
    u_xlat5_ = (-(_e850) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e858 = u_xlat5_;
    let _e859 = u_xlat5_;
    u_xlat5_ = (_e858 + _e859);
    let _e861 = u_xlat5_;
    let _e863 = u_xlat3_;
    u_xlat3_ = ((-(_e861) * _e863) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e871 = u_xlat4_;
    let _e872 = u_xlat4_;
    u_xlat5_ = (_e871 + _e872);
    let _e874 = u_xlat5_;
    let _e876 = u_xlat6_;
    let _e878 = u_xlat3_;
    u_xlat3_ = ((-(_e874) * _e876) + _e878);
    let _e880 = u_xlat6_;
    let _e881 = u_xlat5_;
    u_xlat6_ = (_e880 * _e881);
    let _e883 = u_xlat5_;
    u_xlat5_ = floor(_e883);
    let _e885 = u_xlat5_;
    u_xlat5_ = min(_e885, vec4<f32>(1f, 1f, 1f, 1f));
    let _e892 = u_xlat5_;
    let _e893 = u_xlat3_;
    let _e895 = u_xlat6_;
    u_xlat3_ = ((_e892 * _e893) + _e895);
    let _e897 = u_xlat0_;
    let _e899 = u_xlat3_;
    u_xlat3_ = (-(_e897) + _e899);
    let _e904 = _f_buffer1_.f_cb1_[33];
    let _e906 = u_xlat3_;
    let _e908 = u_xlat0_;
    u_xlat3_ = ((_e904.zzzz * _e906) + _e908);
    let _e910 = u_xlatb10_;
    if _e910.y {
        let _e912 = u_xlat3_;
        local_5 = _e912;
    } else {
        let _e913 = u_xlat4_;
        local_5 = _e913;
    }
    let _e915 = local_5;
    u_xlat3_ = _e915;
    let _e916 = u_xlat0_;
    let _e918 = u_xlat3_;
    u_xlat3_ = (-(_e916) + _e918);
    let _e920 = u_xlat2_;
    let _e922 = u_xlat3_;
    let _e924 = u_xlat0_;
    u_xlat0_ = ((_e920.xxxx * _e922) + _e924);
    let _e926 = u_xlat0_;
    u_xlat0_ = clamp(_e926, vec4(0f), vec4(1f));
    let _e932 = u_xlat0_;
    u_xlat2_ = log2(_e932);
    let _e934 = u_xlat2_;
    let _e938 = _f_buffer1_.f_cb1_[38];
    u_xlat2_ = (_e934 * _e938.zzzz);
    let _e941 = u_xlat2_;
    u_xlat2_ = exp2(_e941);
    let _e943 = u_xlat1_;
    let _e945 = u_xlat2_;
    let _e947 = u_xlat0_;
    u_xlat0_ = ((_e943.xxxx * _e945) + _e947);
    let _e949 = u_xlat0_;
    let _e950 = vs_COLOR0_1;
    SV_Target0_ = (_e949 * _e950);
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
