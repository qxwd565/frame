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
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlatb9_: vec2<bool> = vec2(false);
    var u_xlat12_: f32 = 0f;
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlatb18_: vec2<bool> = vec2(false);
    var u_xlat21_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e82 = vs_TEXCOORD1_1;
    let _e87 = _f_buffer0_.f_cb0_[4];
    let _e92 = hscard_bias.values[5];
    let _e95 = textureSampleBias(f_t5_, samplerf_s5_, _e82.zw, (_e87.x + _e92.x));
    u_xlat0_ = _e95;
    let _e96 = u_xlat1_;
    let _e101 = _f_buffer1_.f_cb1_[35];
    let _e107 = _f_buffer1_.f_cb1_[36];
    let _e109 = (-(_e101.xy) + _e107.zw);
    u_xlat1_.x = _e109.x;
    u_xlat1_.y = _e109.y;
    let _e114 = u_xlat0_;
    let _e116 = u_xlat0_;
    let _e118 = u_xlat1_;
    let _e121 = (_e116.xy + -(_e118.xy));
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    let _e126 = u_xlat0_;
    let _e128 = u_xlat0_;
    let _e133 = _f_buffer1_.f_cb1_[36];
    let _e136 = u_xlat1_;
    let _e138 = ((_e128.xy * _e133.xy) + _e136.xy);
    u_xlat0_.x = _e138.x;
    u_xlat0_.y = _e138.y;
    let _e143 = u_xlat1_;
    let _e148 = _f_buffer1_.f_cb1_[35];
    let _e150 = vs_TEXCOORD2_1;
    let _e156 = _f_buffer1_.f_cb1_[35];
    let _e158 = ((_e148.zw * _e150.xx) + _e156.xy);
    u_xlat1_.x = _e158.x;
    u_xlat1_.y = _e158.y;
    let _e163 = u_xlat0_;
    let _e165 = u_xlat0_;
    let _e167 = u_xlat1_;
    let _e169 = (_e165.xy + _e167.xy);
    u_xlat0_.x = _e169.x;
    u_xlat0_.y = _e169.y;
    let _e174 = u_xlat0_;
    let _e179 = _f_buffer0_.f_cb0_[4];
    let _e184 = hscard_bias.values[4];
    let _e187 = textureSampleBias(f_t4_, samplerf_s4_, _e174.xy, (_e179.x + _e184.x));
    u_xlat1_ = _e187;
    let _e188 = u_xlat1_;
    let _e193 = _f_buffer1_.f_cb1_[34];
    u_xlat2_ = (_e188.xyxy * _e193);
    let _e196 = u_xlat0_;
    let _e198 = u_xlat1_;
    u_xlat1_.w = (_e196.z * _e198.w);
    let _e201 = vs_TEXCOORD0_1;
    let _e206 = _f_buffer0_.f_cb0_[4];
    let _e211 = hscard_bias.values[1];
    let _e214 = textureSampleBias(f_t1_, samplerf_s1_, _e201.xy, (_e206.x + _e211.x));
    u_xlat0_ = _e214;
    let _e215 = u_xlat0_;
    let _e219 = _f_buffer1_.f_cb1_[28];
    u_xlat3_ = dot(_e215, _e219);
    let _e221 = u_xlat3_;
    u_xlat3_ = min(_e221, 1f);
    let _e224 = u_xlat1_;
    let _e226 = u_xlat3_;
    u_xlat3_ = (_e224.w * _e226);
    let _e228 = u_xlat2_;
    let _e229 = u_xlat3_;
    u_xlat4_ = (_e228 * vec4(_e229));
    let _e232 = u_xlat2_;
    let _e234 = u_xlat2_;
    let _e236 = u_xlat3_;
    let _e239 = vs_TEXCOORD1_1;
    let _e241 = ((_e234.zw * vec2(_e236)) + _e239.xy);
    u_xlat2_.x = _e241.x;
    u_xlat2_.y = _e241.y;
    let _e246 = u_xlat2_;
    let _e251 = _f_buffer0_.f_cb0_[4];
    let _e256 = hscard_bias.values[3];
    let _e259 = textureSampleBias(f_t3_, samplerf_s3_, _e246.xy, (_e251.x + _e256.x));
    u_xlat2_ = _e259;
    let _e260 = u_xlat0_;
    let _e264 = _f_buffer1_.f_cb1_[19];
    u_xlat12_ = dot(_e260, _e264);
    let _e266 = u_xlat12_;
    u_xlat12_ = min(_e266, 1f);
    let _e269 = u_xlat2_;
    let _e271 = u_xlat12_;
    u_xlat12_ = (_e269.w * _e271);
    let _e273 = u_xlat2_;
    let _e278 = _f_buffer1_.f_cb1_[25];
    u_xlat5_ = (_e273.xyxy * _e278);
    let _e280 = u_xlat5_;
    let _e281 = u_xlat12_;
    let _e284 = u_xlat4_;
    u_xlat4_ = ((_e280 * vec4(_e281)) + _e284);
    let _e286 = u_xlat0_;
    let _e290 = _f_buffer1_.f_cb1_[10];
    u_xlat21_ = dot(_e286, _e290);
    let _e293 = u_xlat0_;
    let _e297 = _f_buffer1_.f_cb1_[39];
    u_xlat0_.x = dot(_e293, _e297);
    let _e300 = u_xlat0_;
    u_xlat0_.x = min(_e300.x, 1f);
    let _e305 = u_xlat0_;
    let _e307 = vs_TEXCOORD2_1;
    u_xlat0_.x = (_e305.x * _e307.y);
    let _e310 = u_xlat21_;
    u_xlat9_ = min(_e310, 1f);
    let _e313 = u_xlat18_;
    let _e315 = u_xlat4_;
    let _e317 = vs_TEXCOORD0_1;
    let _e319 = (_e315.zw + _e317.zw);
    u_xlat18_.x = _e319.x;
    u_xlat18_.y = _e319.y;
    let _e324 = u_xlat18_;
    let _e329 = _f_buffer0_.f_cb0_[4];
    let _e334 = hscard_bias.values[2];
    let _e337 = textureSampleBias(f_t2_, samplerf_s2_, _e324.xy, (_e329.x + _e334.x));
    u_xlat5_ = _e337;
    let _e338 = u_xlat9_;
    let _e339 = u_xlat5_;
    u_xlat9_ = (_e338 * _e339.w);
    let _e342 = u_xlat18_;
    let _e344 = u_xlat5_;
    let _e349 = _f_buffer1_.f_cb1_[16];
    let _e351 = (_e344.xy * _e349.xy);
    u_xlat18_.x = _e351.x;
    u_xlat18_.y = _e351.y;
    let _e356 = u_xlat18_;
    let _e358 = u_xlat18_;
    let _e360 = u_xlat9_;
    let _e363 = u_xlat4_;
    let _e365 = ((_e358.xy * vec2(_e360)) + _e363.xy);
    u_xlat18_.x = _e365.x;
    u_xlat18_.y = _e365.y;
    let _e370 = u_xlat18_;
    let _e372 = u_xlat18_;
    let _e374 = vs_TEXCOORD0_1;
    let _e376 = (_e372.xy + _e374.xy);
    u_xlat18_.x = _e376.x;
    u_xlat18_.y = _e376.y;
    let _e381 = u_xlat18_;
    let _e386 = _f_buffer0_.f_cb0_[4];
    let _e391 = hscard_bias.values[0];
    let _e394 = textureSampleBias(f_t0_, samplerf_s0_, _e381.xy, (_e386.x + _e391.x));
    u_xlat4_ = _e394;
    let _e398 = _f_buffer1_.f_cb1_[11];
    let _e403 = _f_buffer1_.f_cb1_[11];
    u_xlat6_ = (_e398.wwww * _e403);
    let _e405 = u_xlat5_;
    let _e406 = u_xlat6_;
    let _e408 = u_xlat4_;
    u_xlat7_ = ((_e405 * _e406) + -(_e408));
    let _e411 = u_xlat5_;
    let _e412 = u_xlat6_;
    u_xlat8_ = (_e411 * _e412);
    let _e414 = u_xlat5_;
    let _e416 = u_xlat6_;
    u_xlat5_ = ((-(_e414) * _e416) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e425 = u_xlat8_;
    let _e430 = _f_buffer1_.f_cb1_[15];
    u_xlat18_.x = (_e425.w * _e430.w);
    let _e434 = u_xlat18_;
    u_xlat18_.x = clamp(_e434.x, 0f, 1f);
    let _e439 = u_xlat18_;
    let _e441 = u_xlat7_;
    let _e443 = u_xlat4_;
    u_xlat6_ = ((_e439.xxxx * _e441) + _e443);
    let _e445 = u_xlatb18_;
    let _e455 = _f_buffer1_.f_cb1_[15];
    let _e458 = (vec4<f32>(0f, 0f, 0f, 0f) < _e455.wzwz).xy;
    u_xlatb18_.x = _e458.x;
    u_xlatb18_.y = _e458.y;
    let _e463 = u_xlatb18_;
    if _e463.x {
        let _e465 = u_xlat6_;
        local = _e465;
    } else {
        let _e466 = u_xlat4_;
        local = _e466;
    }
    let _e468 = local;
    u_xlat6_ = _e468;
    let _e469 = u_xlat8_;
    let _e470 = u_xlat6_;
    u_xlat7_ = (_e469 * _e470);
    let _e472 = u_xlat7_;
    let _e476 = _f_buffer1_.f_cb1_[15];
    let _e479 = u_xlat6_;
    u_xlat6_ = ((_e472 * _e476.yyyy) + _e479);
    let _e481 = u_xlat8_;
    let _e485 = _f_buffer1_.f_cb1_[15];
    let _e488 = u_xlat6_;
    u_xlat6_ = ((_e481 * _e485.xxxx) + _e488);
    let _e490 = u_xlat6_;
    u_xlat7_ = (-(_e490) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e498 = u_xlat7_;
    let _e499 = u_xlat7_;
    u_xlat7_ = (_e498 + _e499);
    let _e501 = u_xlat7_;
    let _e503 = u_xlat5_;
    u_xlat5_ = ((-(_e501) * _e503) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e511 = u_xlat6_;
    let _e512 = u_xlat6_;
    u_xlat7_ = (_e511 + _e512);
    let _e514 = u_xlat7_;
    let _e516 = u_xlat8_;
    let _e518 = u_xlat5_;
    u_xlat5_ = ((-(_e514) * _e516) + _e518);
    let _e520 = u_xlat8_;
    let _e521 = u_xlat7_;
    u_xlat8_ = (_e520 * _e521);
    let _e523 = u_xlat7_;
    u_xlat7_ = floor(_e523);
    let _e525 = u_xlat7_;
    u_xlat7_ = min(_e525, vec4<f32>(1f, 1f, 1f, 1f));
    let _e532 = u_xlat7_;
    let _e533 = u_xlat5_;
    let _e535 = u_xlat8_;
    u_xlat5_ = ((_e532 * _e533) + _e535);
    let _e537 = u_xlat4_;
    let _e539 = u_xlat5_;
    u_xlat5_ = (-(_e537) + _e539);
    let _e544 = _f_buffer1_.f_cb1_[15];
    let _e546 = u_xlat5_;
    let _e548 = u_xlat4_;
    u_xlat5_ = ((_e544.zzzz * _e546) + _e548);
    let _e550 = u_xlatb18_;
    if _e550.y {
        let _e552 = u_xlat5_;
        local_1 = _e552;
    } else {
        let _e553 = u_xlat6_;
        local_1 = _e553;
    }
    let _e555 = local_1;
    u_xlat5_ = _e555;
    let _e556 = u_xlat4_;
    let _e558 = u_xlat5_;
    u_xlat5_ = (-(_e556) + _e558);
    let _e560 = u_xlat9_;
    let _e562 = u_xlat5_;
    let _e564 = u_xlat4_;
    u_xlat4_ = ((vec4(_e560) * _e562) + _e564);
    let _e566 = u_xlat12_;
    let _e571 = _f_buffer1_.f_cb1_[20];
    u_xlat5_ = (vec4(_e566) * _e571);
    let _e573 = u_xlat5_;
    let _e577 = _f_buffer1_.f_cb1_[20];
    u_xlat5_ = (_e573 * _e577.wwww);
    let _e580 = u_xlat2_;
    let _e581 = u_xlat5_;
    let _e583 = u_xlat4_;
    u_xlat6_ = ((_e580 * _e581) + -(_e583));
    let _e586 = u_xlat2_;
    let _e587 = u_xlat5_;
    u_xlat7_ = (_e586 * _e587);
    let _e589 = u_xlat2_;
    let _e591 = u_xlat5_;
    u_xlat2_ = ((-(_e589) * _e591) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e599 = u_xlat7_;
    let _e604 = _f_buffer1_.f_cb1_[24];
    u_xlat9_ = (_e599.w * _e604.w);
    let _e607 = u_xlat9_;
    u_xlat9_ = clamp(_e607, 0f, 1f);
    let _e611 = u_xlat9_;
    let _e613 = u_xlat6_;
    let _e615 = u_xlat4_;
    u_xlat5_ = ((vec4(_e611) * _e613) + _e615);
    let _e617 = u_xlatb9_;
    let _e627 = _f_buffer1_.f_cb1_[24];
    let _e630 = (vec4<f32>(0f, 0f, 0f, 0f) < _e627.wzww).xy;
    u_xlatb9_.x = _e630.x;
    u_xlatb9_.y = _e630.y;
    let _e635 = u_xlatb9_;
    if _e635.x {
        let _e637 = u_xlat5_;
        local_2 = _e637;
    } else {
        let _e638 = u_xlat4_;
        local_2 = _e638;
    }
    let _e640 = local_2;
    u_xlat5_ = _e640;
    let _e641 = u_xlat7_;
    let _e642 = u_xlat5_;
    u_xlat6_ = (_e641 * _e642);
    let _e644 = u_xlat6_;
    let _e648 = _f_buffer1_.f_cb1_[24];
    let _e651 = u_xlat5_;
    u_xlat5_ = ((_e644 * _e648.yyyy) + _e651);
    let _e653 = u_xlat7_;
    let _e657 = _f_buffer1_.f_cb1_[24];
    let _e660 = u_xlat5_;
    u_xlat5_ = ((_e653 * _e657.xxxx) + _e660);
    let _e662 = u_xlat5_;
    u_xlat6_ = (-(_e662) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e670 = u_xlat6_;
    let _e671 = u_xlat6_;
    u_xlat6_ = (_e670 + _e671);
    let _e673 = u_xlat6_;
    let _e675 = u_xlat2_;
    u_xlat2_ = ((-(_e673) * _e675) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e683 = u_xlat5_;
    let _e684 = u_xlat5_;
    u_xlat6_ = (_e683 + _e684);
    let _e686 = u_xlat6_;
    let _e688 = u_xlat7_;
    let _e690 = u_xlat2_;
    u_xlat2_ = ((-(_e686) * _e688) + _e690);
    let _e692 = u_xlat7_;
    let _e693 = u_xlat6_;
    u_xlat7_ = (_e692 * _e693);
    let _e695 = u_xlat6_;
    u_xlat6_ = floor(_e695);
    let _e697 = u_xlat6_;
    u_xlat6_ = min(_e697, vec4<f32>(1f, 1f, 1f, 1f));
    let _e704 = u_xlat6_;
    let _e705 = u_xlat2_;
    let _e707 = u_xlat7_;
    u_xlat2_ = ((_e704 * _e705) + _e707);
    let _e709 = u_xlat4_;
    let _e711 = u_xlat2_;
    u_xlat2_ = (-(_e709) + _e711);
    let _e716 = _f_buffer1_.f_cb1_[24];
    let _e718 = u_xlat2_;
    let _e720 = u_xlat4_;
    u_xlat2_ = ((_e716.zzzz * _e718) + _e720);
    let _e722 = u_xlatb9_;
    if _e722.y {
        let _e724 = u_xlat2_;
        local_3 = _e724;
    } else {
        let _e725 = u_xlat5_;
        local_3 = _e725;
    }
    let _e727 = local_3;
    u_xlat2_ = _e727;
    let _e728 = u_xlat4_;
    let _e730 = u_xlat2_;
    u_xlat2_ = (-(_e728) + _e730);
    let _e732 = u_xlat12_;
    let _e734 = u_xlat2_;
    let _e736 = u_xlat4_;
    u_xlat2_ = ((vec4(_e732) * _e734) + _e736);
    let _e738 = u_xlat3_;
    let _e743 = _f_buffer1_.f_cb1_[29];
    u_xlat4_ = (vec4(_e738) * _e743);
    let _e745 = u_xlat4_;
    let _e749 = _f_buffer1_.f_cb1_[29];
    u_xlat4_ = (_e745 * _e749.wwww);
    let _e752 = u_xlat1_;
    let _e753 = u_xlat4_;
    let _e755 = u_xlat2_;
    u_xlat5_ = ((_e752 * _e753) + -(_e755));
    let _e758 = u_xlat1_;
    let _e759 = u_xlat4_;
    u_xlat6_ = (_e758 * _e759);
    let _e761 = u_xlat1_;
    let _e763 = u_xlat4_;
    u_xlat1_ = ((-(_e761) * _e763) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e771 = u_xlat6_;
    let _e776 = _f_buffer1_.f_cb1_[33];
    u_xlat9_ = (_e771.w * _e776.w);
    let _e779 = u_xlat9_;
    u_xlat9_ = clamp(_e779, 0f, 1f);
    let _e783 = u_xlat9_;
    let _e785 = u_xlat5_;
    let _e787 = u_xlat2_;
    u_xlat4_ = ((vec4(_e783) * _e785) + _e787);
    let _e789 = u_xlatb9_;
    let _e799 = _f_buffer1_.f_cb1_[33];
    let _e802 = (vec4<f32>(0f, 0f, 0f, 0f) < _e799.wzww).xy;
    u_xlatb9_.x = _e802.x;
    u_xlatb9_.y = _e802.y;
    let _e807 = u_xlatb9_;
    if _e807.x {
        let _e809 = u_xlat4_;
        local_4 = _e809;
    } else {
        let _e810 = u_xlat2_;
        local_4 = _e810;
    }
    let _e812 = local_4;
    u_xlat4_ = _e812;
    let _e813 = u_xlat6_;
    let _e814 = u_xlat4_;
    u_xlat5_ = (_e813 * _e814);
    let _e816 = u_xlat5_;
    let _e820 = _f_buffer1_.f_cb1_[33];
    let _e823 = u_xlat4_;
    u_xlat4_ = ((_e816 * _e820.yyyy) + _e823);
    let _e825 = u_xlat6_;
    let _e829 = _f_buffer1_.f_cb1_[33];
    let _e832 = u_xlat4_;
    u_xlat4_ = ((_e825 * _e829.xxxx) + _e832);
    let _e834 = u_xlat4_;
    u_xlat5_ = (-(_e834) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e842 = u_xlat5_;
    let _e843 = u_xlat5_;
    u_xlat5_ = (_e842 + _e843);
    let _e845 = u_xlat5_;
    let _e847 = u_xlat1_;
    u_xlat1_ = ((-(_e845) * _e847) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e855 = u_xlat4_;
    let _e856 = u_xlat4_;
    u_xlat5_ = (_e855 + _e856);
    let _e858 = u_xlat5_;
    let _e860 = u_xlat6_;
    let _e862 = u_xlat1_;
    u_xlat1_ = ((-(_e858) * _e860) + _e862);
    let _e864 = u_xlat6_;
    let _e865 = u_xlat5_;
    u_xlat6_ = (_e864 * _e865);
    let _e867 = u_xlat5_;
    u_xlat5_ = floor(_e867);
    let _e869 = u_xlat5_;
    u_xlat5_ = min(_e869, vec4<f32>(1f, 1f, 1f, 1f));
    let _e876 = u_xlat5_;
    let _e877 = u_xlat1_;
    let _e879 = u_xlat6_;
    u_xlat1_ = ((_e876 * _e877) + _e879);
    let _e881 = u_xlat2_;
    let _e883 = u_xlat1_;
    u_xlat1_ = (-(_e881) + _e883);
    let _e888 = _f_buffer1_.f_cb1_[33];
    let _e890 = u_xlat1_;
    let _e892 = u_xlat2_;
    u_xlat1_ = ((_e888.zzzz * _e890) + _e892);
    let _e894 = u_xlatb9_;
    if _e894.y {
        let _e896 = u_xlat1_;
        local_5 = _e896;
    } else {
        let _e897 = u_xlat4_;
        local_5 = _e897;
    }
    let _e899 = local_5;
    u_xlat1_ = _e899;
    let _e900 = u_xlat2_;
    let _e902 = u_xlat1_;
    u_xlat1_ = (-(_e900) + _e902);
    let _e904 = u_xlat3_;
    let _e906 = u_xlat1_;
    let _e908 = u_xlat2_;
    u_xlat1_ = ((vec4(_e904) * _e906) + _e908);
    let _e910 = u_xlat1_;
    u_xlat1_ = clamp(_e910, vec4(0f), vec4(1f));
    let _e916 = u_xlat1_;
    u_xlat2_ = log2(_e916);
    let _e918 = u_xlat2_;
    let _e922 = _f_buffer1_.f_cb1_[38];
    u_xlat2_ = (_e918 * _e922.zzzz);
    let _e925 = u_xlat2_;
    u_xlat2_ = exp2(_e925);
    let _e927 = u_xlat0_;
    let _e929 = u_xlat2_;
    let _e931 = u_xlat1_;
    u_xlat0_ = ((_e927.xxxx * _e929) + _e931);
    let _e933 = u_xlat0_;
    let _e934 = vs_COLOR0_1;
    SV_Target0_ = (_e933 * _e934);
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
