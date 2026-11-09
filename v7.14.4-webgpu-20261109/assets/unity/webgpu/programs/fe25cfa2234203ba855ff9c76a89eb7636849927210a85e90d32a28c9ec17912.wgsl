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
    var u_xlatb5_: vec2<bool> = vec2(false);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlatb6_: vec2<bool> = vec2(false);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlatb18_: vec2<bool> = vec2(false);
    var u_xlat19_: f32 = 0f;
    var u_xlat27_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e89 = vs_TEXCOORD0_1;
    let _e94 = _f_buffer0_.f_cb0_[4];
    let _e99 = hscard_bias.values[1];
    let _e102 = textureSampleBias(f_t1_, samplerf_s1_, _e89.xy, (_e94.x + _e99.x));
    u_xlat0_ = _e102;
    let _e104 = u_xlat0_;
    let _e108 = _f_buffer1_.f_cb1_[10];
    u_xlat1_.x = dot(_e104, _e108);
    let _e111 = u_xlat0_;
    let _e115 = _f_buffer1_.f_cb1_[19];
    u_xlat1_.y = dot(_e111, _e115);
    let _e117 = u_xlat1_;
    let _e119 = u_xlat1_;
    let _e124 = min(_e119.xy, vec2<f32>(1f, 1f));
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    let _e129 = u_xlat0_;
    let _e133 = _f_buffer1_.f_cb1_[28];
    u_xlat19_ = dot(_e129, _e133);
    let _e136 = u_xlat0_;
    let _e140 = _f_buffer1_.f_cb1_[39];
    u_xlat0_.x = dot(_e136, _e140);
    let _e143 = u_xlat0_;
    u_xlat0_.x = min(_e143.x, 1f);
    let _e148 = u_xlat0_;
    let _e150 = vs_TEXCOORD2_1;
    u_xlat0_.x = (_e148.x * _e150.y);
    let _e153 = u_xlat19_;
    u_xlat9_ = min(_e153, 1f);
    let _e156 = vs_TEXCOORD1_1;
    let _e161 = _f_buffer0_.f_cb0_[4];
    let _e166 = hscard_bias.values[4];
    let _e169 = textureSampleBias(f_t4_, samplerf_s4_, _e156.zw, (_e161.x + _e166.x));
    u_xlat2_ = _e169;
    let _e170 = u_xlat9_;
    let _e171 = u_xlat2_;
    u_xlat9_ = (_e170 * _e171.w);
    let _e174 = u_xlat2_;
    let _e179 = _f_buffer1_.f_cb1_[34];
    u_xlat3_ = (_e174.xyxy * _e179);
    let _e181 = u_xlat18_;
    let _e183 = u_xlat3_;
    let _e185 = u_xlat9_;
    let _e188 = vs_TEXCOORD1_1;
    let _e190 = ((_e183.zw * vec2(_e185)) + _e188.xy);
    u_xlat18_.x = _e190.x;
    u_xlat18_.y = _e190.y;
    let _e195 = u_xlat9_;
    let _e197 = u_xlat3_;
    u_xlat3_ = (vec4(_e195) * _e197);
    let _e199 = u_xlat18_;
    let _e204 = _f_buffer0_.f_cb0_[4];
    let _e209 = hscard_bias.values[3];
    let _e212 = textureSampleBias(f_t3_, samplerf_s3_, _e199.xy, (_e204.x + _e209.x));
    u_xlat4_ = _e212;
    let _e214 = u_xlat1_;
    let _e216 = u_xlat4_;
    u_xlat18_.x = (_e214.y * _e216.w);
    let _e219 = u_xlat4_;
    let _e224 = _f_buffer1_.f_cb1_[25];
    u_xlat5_ = (_e219.xyxy * _e224);
    let _e226 = u_xlat5_;
    let _e227 = u_xlat18_;
    let _e230 = u_xlat3_;
    u_xlat3_ = ((_e226 * _e227.xxxx) + _e230);
    let _e232 = u_xlat10_;
    let _e234 = u_xlat3_;
    let _e236 = vs_TEXCOORD0_1;
    let _e238 = (_e234.zw + _e236.zw);
    u_xlat10_.x = _e238.x;
    u_xlat10_.y = _e238.y;
    let _e243 = u_xlat10_;
    let _e248 = _f_buffer0_.f_cb0_[4];
    let _e253 = hscard_bias.values[2];
    let _e256 = textureSampleBias(f_t2_, samplerf_s2_, _e243.xy, (_e248.x + _e253.x));
    u_xlat5_ = _e256;
    let _e257 = u_xlat1_;
    let _e259 = u_xlat5_;
    u_xlat27_ = (_e257.x * _e259.w);
    let _e262 = u_xlat1_;
    let _e264 = u_xlat5_;
    let _e269 = _f_buffer1_.f_cb1_[16];
    let _e271 = (_e264.xy * _e269.xy);
    u_xlat1_.x = _e271.x;
    u_xlat1_.y = _e271.y;
    let _e276 = u_xlat1_;
    let _e278 = u_xlat1_;
    let _e280 = u_xlat27_;
    let _e283 = u_xlat3_;
    let _e285 = ((_e278.xy * vec2(_e280)) + _e283.xy);
    u_xlat1_.x = _e285.x;
    u_xlat1_.y = _e285.y;
    let _e290 = u_xlat1_;
    let _e292 = u_xlat1_;
    let _e294 = vs_TEXCOORD0_1;
    let _e296 = (_e292.xy + _e294.xy);
    u_xlat1_.x = _e296.x;
    u_xlat1_.y = _e296.y;
    let _e301 = u_xlat1_;
    let _e306 = _f_buffer0_.f_cb0_[4];
    let _e311 = hscard_bias.values[0];
    let _e314 = textureSampleBias(f_t0_, samplerf_s0_, _e301.xy, (_e306.x + _e311.x));
    u_xlat1_ = _e314;
    let _e318 = _f_buffer1_.f_cb1_[11];
    let _e323 = _f_buffer1_.f_cb1_[11];
    u_xlat3_ = (_e318.wwww * _e323);
    let _e325 = u_xlat5_;
    let _e326 = u_xlat3_;
    let _e328 = u_xlat1_;
    u_xlat6_ = ((_e325 * _e326) + -(_e328));
    let _e331 = u_xlat3_;
    let _e332 = u_xlat5_;
    u_xlat7_ = (_e331 * _e332);
    let _e334 = u_xlat5_;
    let _e336 = u_xlat3_;
    u_xlat3_ = ((-(_e334) * _e336) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e345 = u_xlat7_;
    let _e350 = _f_buffer1_.f_cb1_[15];
    u_xlat5_.x = (_e345.w * _e350.w);
    let _e354 = u_xlat5_;
    u_xlat5_.x = clamp(_e354.x, 0f, 1f);
    let _e359 = u_xlat5_;
    let _e361 = u_xlat6_;
    let _e363 = u_xlat1_;
    u_xlat5_ = ((_e359.xxxx * _e361) + _e363);
    let _e365 = u_xlatb6_;
    let _e375 = _f_buffer1_.f_cb1_[15];
    let _e378 = (vec4<f32>(0f, 0f, 0f, 0f) < _e375.wzww).xy;
    u_xlatb6_.x = _e378.x;
    u_xlatb6_.y = _e378.y;
    let _e383 = u_xlatb6_;
    if _e383.x {
        let _e385 = u_xlat5_;
        local = _e385;
    } else {
        let _e386 = u_xlat1_;
        local = _e386;
    }
    let _e388 = local;
    u_xlat5_ = _e388;
    let _e389 = u_xlat7_;
    let _e390 = u_xlat5_;
    u_xlat8_ = (_e389 * _e390);
    let _e392 = u_xlat8_;
    let _e396 = _f_buffer1_.f_cb1_[15];
    let _e399 = u_xlat5_;
    u_xlat5_ = ((_e392 * _e396.yyyy) + _e399);
    let _e401 = u_xlat7_;
    let _e405 = _f_buffer1_.f_cb1_[15];
    let _e408 = u_xlat5_;
    u_xlat5_ = ((_e401 * _e405.xxxx) + _e408);
    let _e410 = u_xlat5_;
    u_xlat8_ = (-(_e410) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e418 = u_xlat8_;
    let _e419 = u_xlat8_;
    u_xlat8_ = (_e418 + _e419);
    let _e421 = u_xlat8_;
    let _e423 = u_xlat3_;
    u_xlat3_ = ((-(_e421) * _e423) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e431 = u_xlat5_;
    let _e432 = u_xlat5_;
    u_xlat8_ = (_e431 + _e432);
    let _e434 = u_xlat8_;
    let _e436 = u_xlat7_;
    let _e438 = u_xlat3_;
    u_xlat3_ = ((-(_e434) * _e436) + _e438);
    let _e440 = u_xlat7_;
    let _e441 = u_xlat8_;
    u_xlat7_ = (_e440 * _e441);
    let _e443 = u_xlat8_;
    u_xlat8_ = floor(_e443);
    let _e445 = u_xlat8_;
    u_xlat8_ = min(_e445, vec4<f32>(1f, 1f, 1f, 1f));
    let _e452 = u_xlat8_;
    let _e453 = u_xlat3_;
    let _e455 = u_xlat7_;
    u_xlat3_ = ((_e452 * _e453) + _e455);
    let _e457 = u_xlat1_;
    let _e459 = u_xlat3_;
    u_xlat3_ = (-(_e457) + _e459);
    let _e464 = _f_buffer1_.f_cb1_[15];
    let _e466 = u_xlat3_;
    let _e468 = u_xlat1_;
    u_xlat3_ = ((_e464.zzzz * _e466) + _e468);
    let _e470 = u_xlatb6_;
    if _e470.y {
        let _e472 = u_xlat3_;
        local_1 = _e472;
    } else {
        let _e473 = u_xlat5_;
        local_1 = _e473;
    }
    let _e475 = local_1;
    u_xlat3_ = _e475;
    let _e476 = u_xlat1_;
    let _e478 = u_xlat3_;
    u_xlat3_ = (-(_e476) + _e478);
    let _e480 = u_xlat27_;
    let _e482 = u_xlat3_;
    let _e484 = u_xlat1_;
    u_xlat1_ = ((vec4(_e480) * _e482) + _e484);
    let _e486 = u_xlat18_;
    let _e491 = _f_buffer1_.f_cb1_[20];
    u_xlat3_ = (_e486.xxxx * _e491);
    let _e493 = u_xlat3_;
    let _e497 = _f_buffer1_.f_cb1_[20];
    u_xlat3_ = (_e493 * _e497.wwww);
    let _e500 = u_xlat4_;
    let _e501 = u_xlat3_;
    let _e503 = u_xlat1_;
    u_xlat5_ = ((_e500 * _e501) + -(_e503));
    let _e506 = u_xlat3_;
    let _e507 = u_xlat4_;
    u_xlat6_ = (_e506 * _e507);
    let _e509 = u_xlat4_;
    let _e511 = u_xlat3_;
    u_xlat3_ = ((-(_e509) * _e511) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e519 = u_xlat6_;
    let _e524 = _f_buffer1_.f_cb1_[24];
    u_xlat27_ = (_e519.w * _e524.w);
    let _e527 = u_xlat27_;
    u_xlat27_ = clamp(_e527, 0f, 1f);
    let _e531 = u_xlat27_;
    let _e533 = u_xlat5_;
    let _e535 = u_xlat1_;
    u_xlat4_ = ((vec4(_e531) * _e533) + _e535);
    let _e537 = u_xlatb5_;
    let _e547 = _f_buffer1_.f_cb1_[24];
    let _e550 = (vec4<f32>(0f, 0f, 0f, 0f) < _e547.wzww).xy;
    u_xlatb5_.x = _e550.x;
    u_xlatb5_.y = _e550.y;
    let _e555 = u_xlatb5_;
    if _e555.x {
        let _e557 = u_xlat4_;
        local_2 = _e557;
    } else {
        let _e558 = u_xlat1_;
        local_2 = _e558;
    }
    let _e560 = local_2;
    u_xlat4_ = _e560;
    let _e561 = u_xlat6_;
    let _e562 = u_xlat4_;
    u_xlat7_ = (_e561 * _e562);
    let _e564 = u_xlat7_;
    let _e568 = _f_buffer1_.f_cb1_[24];
    let _e571 = u_xlat4_;
    u_xlat4_ = ((_e564 * _e568.yyyy) + _e571);
    let _e573 = u_xlat6_;
    let _e577 = _f_buffer1_.f_cb1_[24];
    let _e580 = u_xlat4_;
    u_xlat4_ = ((_e573 * _e577.xxxx) + _e580);
    let _e582 = u_xlat4_;
    u_xlat7_ = (-(_e582) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e590 = u_xlat7_;
    let _e591 = u_xlat7_;
    u_xlat7_ = (_e590 + _e591);
    let _e593 = u_xlat7_;
    let _e595 = u_xlat3_;
    u_xlat3_ = ((-(_e593) * _e595) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e603 = u_xlat4_;
    let _e604 = u_xlat4_;
    u_xlat7_ = (_e603 + _e604);
    let _e606 = u_xlat7_;
    let _e608 = u_xlat6_;
    let _e610 = u_xlat3_;
    u_xlat3_ = ((-(_e606) * _e608) + _e610);
    let _e612 = u_xlat6_;
    let _e613 = u_xlat7_;
    u_xlat6_ = (_e612 * _e613);
    let _e615 = u_xlat7_;
    u_xlat7_ = floor(_e615);
    let _e617 = u_xlat7_;
    u_xlat7_ = min(_e617, vec4<f32>(1f, 1f, 1f, 1f));
    let _e624 = u_xlat7_;
    let _e625 = u_xlat3_;
    let _e627 = u_xlat6_;
    u_xlat3_ = ((_e624 * _e625) + _e627);
    let _e629 = u_xlat1_;
    let _e631 = u_xlat3_;
    u_xlat3_ = (-(_e629) + _e631);
    let _e636 = _f_buffer1_.f_cb1_[24];
    let _e638 = u_xlat3_;
    let _e640 = u_xlat1_;
    u_xlat3_ = ((_e636.zzzz * _e638) + _e640);
    let _e642 = u_xlatb5_;
    if _e642.y {
        let _e644 = u_xlat3_;
        local_3 = _e644;
    } else {
        let _e645 = u_xlat4_;
        local_3 = _e645;
    }
    let _e647 = local_3;
    u_xlat3_ = _e647;
    let _e648 = u_xlat1_;
    let _e650 = u_xlat3_;
    u_xlat3_ = (-(_e648) + _e650);
    let _e652 = u_xlat18_;
    let _e654 = u_xlat3_;
    let _e656 = u_xlat1_;
    u_xlat1_ = ((_e652.xxxx * _e654) + _e656);
    let _e658 = u_xlat9_;
    let _e663 = _f_buffer1_.f_cb1_[29];
    u_xlat3_ = (vec4(_e658) * _e663);
    let _e665 = u_xlat3_;
    let _e669 = _f_buffer1_.f_cb1_[29];
    u_xlat3_ = (_e665 * _e669.wwww);
    let _e672 = u_xlat2_;
    let _e673 = u_xlat3_;
    let _e675 = u_xlat1_;
    u_xlat4_ = ((_e672 * _e673) + -(_e675));
    let _e678 = u_xlat2_;
    let _e679 = u_xlat3_;
    u_xlat5_ = (_e678 * _e679);
    let _e681 = u_xlat2_;
    let _e683 = u_xlat3_;
    u_xlat2_ = ((-(_e681) * _e683) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e692 = u_xlat5_;
    let _e697 = _f_buffer1_.f_cb1_[33];
    u_xlat18_.x = (_e692.w * _e697.w);
    let _e701 = u_xlat18_;
    u_xlat18_.x = clamp(_e701.x, 0f, 1f);
    let _e706 = u_xlat18_;
    let _e708 = u_xlat4_;
    let _e710 = u_xlat1_;
    u_xlat3_ = ((_e706.xxxx * _e708) + _e710);
    let _e712 = u_xlatb18_;
    let _e722 = _f_buffer1_.f_cb1_[33];
    let _e725 = (vec4<f32>(0f, 0f, 0f, 0f) < _e722.wzwz).xy;
    u_xlatb18_.x = _e725.x;
    u_xlatb18_.y = _e725.y;
    let _e730 = u_xlatb18_;
    if _e730.x {
        let _e732 = u_xlat3_;
        local_4 = _e732;
    } else {
        let _e733 = u_xlat1_;
        local_4 = _e733;
    }
    let _e735 = local_4;
    u_xlat3_ = _e735;
    let _e736 = u_xlat5_;
    let _e737 = u_xlat3_;
    u_xlat4_ = (_e736 * _e737);
    let _e739 = u_xlat4_;
    let _e743 = _f_buffer1_.f_cb1_[33];
    let _e746 = u_xlat3_;
    u_xlat3_ = ((_e739 * _e743.yyyy) + _e746);
    let _e748 = u_xlat5_;
    let _e752 = _f_buffer1_.f_cb1_[33];
    let _e755 = u_xlat3_;
    u_xlat3_ = ((_e748 * _e752.xxxx) + _e755);
    let _e757 = u_xlat3_;
    u_xlat4_ = (-(_e757) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e765 = u_xlat4_;
    let _e766 = u_xlat4_;
    u_xlat4_ = (_e765 + _e766);
    let _e768 = u_xlat4_;
    let _e770 = u_xlat2_;
    u_xlat2_ = ((-(_e768) * _e770) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e778 = u_xlat3_;
    let _e779 = u_xlat3_;
    u_xlat4_ = (_e778 + _e779);
    let _e781 = u_xlat4_;
    let _e783 = u_xlat5_;
    let _e785 = u_xlat2_;
    u_xlat2_ = ((-(_e781) * _e783) + _e785);
    let _e787 = u_xlat5_;
    let _e788 = u_xlat4_;
    u_xlat5_ = (_e787 * _e788);
    let _e790 = u_xlat4_;
    u_xlat4_ = floor(_e790);
    let _e792 = u_xlat4_;
    u_xlat4_ = min(_e792, vec4<f32>(1f, 1f, 1f, 1f));
    let _e799 = u_xlat4_;
    let _e800 = u_xlat2_;
    let _e802 = u_xlat5_;
    u_xlat2_ = ((_e799 * _e800) + _e802);
    let _e804 = u_xlat1_;
    let _e806 = u_xlat2_;
    u_xlat2_ = (-(_e804) + _e806);
    let _e811 = _f_buffer1_.f_cb1_[33];
    let _e813 = u_xlat2_;
    let _e815 = u_xlat1_;
    u_xlat2_ = ((_e811.zzzz * _e813) + _e815);
    let _e817 = u_xlatb18_;
    if _e817.y {
        let _e819 = u_xlat2_;
        local_5 = _e819;
    } else {
        let _e820 = u_xlat3_;
        local_5 = _e820;
    }
    let _e822 = local_5;
    u_xlat2_ = _e822;
    let _e823 = u_xlat1_;
    let _e825 = u_xlat2_;
    u_xlat2_ = (-(_e823) + _e825);
    let _e827 = u_xlat9_;
    let _e829 = u_xlat2_;
    let _e831 = u_xlat1_;
    u_xlat1_ = ((vec4(_e827) * _e829) + _e831);
    let _e833 = u_xlat1_;
    u_xlat1_ = clamp(_e833, vec4(0f), vec4(1f));
    let _e839 = u_xlat1_;
    u_xlat2_ = log2(_e839);
    let _e841 = u_xlat2_;
    let _e845 = _f_buffer1_.f_cb1_[38];
    u_xlat2_ = (_e841 * _e845.zzzz);
    let _e848 = u_xlat2_;
    u_xlat2_ = exp2(_e848);
    let _e850 = u_xlat0_;
    let _e852 = u_xlat2_;
    let _e854 = u_xlat1_;
    u_xlat0_ = ((_e850.xxxx * _e852) + _e854);
    let _e856 = u_xlat0_;
    let _e857 = vs_COLOR0_1;
    SV_Target0_ = (_e856 * _e857);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e48 = SV_Target0_;
    return FragmentOutput(_e48);
}
