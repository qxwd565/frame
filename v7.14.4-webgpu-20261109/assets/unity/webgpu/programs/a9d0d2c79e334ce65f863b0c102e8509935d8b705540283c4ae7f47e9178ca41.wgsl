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
@group(3) @binding(13) 
var samplerf_s6_: sampler;
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
@group(3) @binding(12) 
var f_t6_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_TEXCOORD2_1: vec2<f32>;
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
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat10_: f32 = 0f;
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlat22_: vec2<f32> = vec2(0f);
    var u_xlat27_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e82 = u_xlat0_;
    let _e87 = _f_buffer1_.f_cb1_[17];
    let _e89 = vs_TEXCOORD2_1;
    let _e95 = _f_buffer1_.f_cb1_[17];
    let _e97 = ((_e87.zw * _e89.xx) + _e95.xy);
    u_xlat0_.x = _e97.x;
    u_xlat0_.y = _e97.y;
    let _e102 = vs_TEXCOORD1_1;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[6];
    let _e115 = textureSampleBias(f_t6_, samplerf_s6_, _e102.zw, (_e107.x + _e112.x));
    u_xlat1_ = _e115;
    let _e116 = u_xlat18_;
    let _e121 = _f_buffer1_.f_cb1_[35];
    let _e127 = _f_buffer1_.f_cb1_[36];
    let _e129 = (-(_e121.xy) + _e127.zw);
    u_xlat18_.x = _e129.x;
    u_xlat18_.y = _e129.y;
    let _e134 = u_xlat1_;
    let _e136 = u_xlat18_;
    let _e139 = u_xlat1_;
    let _e141 = (-(_e136.xy) + _e139.xy);
    u_xlat1_.x = _e141.x;
    u_xlat1_.y = _e141.y;
    let _e146 = u_xlat18_;
    let _e148 = u_xlat1_;
    let _e153 = _f_buffer1_.f_cb1_[36];
    let _e156 = u_xlat18_;
    let _e158 = ((_e148.xy * _e153.xy) + _e156.xy);
    u_xlat18_.x = _e158.x;
    u_xlat18_.y = _e158.y;
    let _e163 = u_xlat1_;
    let _e168 = _f_buffer1_.f_cb1_[35];
    let _e170 = vs_TEXCOORD2_1;
    let _e176 = _f_buffer1_.f_cb1_[35];
    let _e178 = ((_e168.zw * _e170.xx) + _e176.xy);
    u_xlat1_.x = _e178.x;
    u_xlat1_.y = _e178.y;
    let _e183 = u_xlat18_;
    let _e185 = u_xlat18_;
    let _e187 = u_xlat1_;
    let _e189 = (_e185.xy + _e187.xy);
    u_xlat18_.x = _e189.x;
    u_xlat18_.y = _e189.y;
    let _e194 = u_xlat18_;
    let _e199 = _f_buffer0_.f_cb0_[4];
    let _e204 = hscard_bias.values[5];
    let _e207 = textureSampleBias(f_t5_, samplerf_s5_, _e194.xy, (_e199.x + _e204.x));
    u_xlat2_ = _e207;
    let _e208 = u_xlat2_;
    let _e213 = _f_buffer1_.f_cb1_[34];
    u_xlat3_ = (_e208.xyxy * _e213);
    let _e216 = u_xlat1_;
    let _e218 = u_xlat2_;
    u_xlat2_.w = (_e216.z * _e218.w);
    let _e221 = vs_TEXCOORD0_1;
    let _e226 = _f_buffer0_.f_cb0_[4];
    let _e231 = hscard_bias.values[1];
    let _e234 = textureSampleBias(f_t1_, samplerf_s1_, _e221.xy, (_e226.x + _e231.x));
    u_xlat1_ = _e234;
    let _e236 = u_xlat1_;
    let _e240 = _f_buffer1_.f_cb1_[28];
    u_xlat18_.x = dot(_e236, _e240);
    let _e243 = u_xlat18_;
    u_xlat18_.x = min(_e243.x, 1f);
    let _e248 = u_xlat18_;
    let _e250 = u_xlat2_;
    u_xlat18_.x = (_e248.x * _e250.w);
    let _e253 = u_xlat18_;
    let _e255 = u_xlat3_;
    u_xlat4_ = (_e253.xxxx * _e255);
    let _e257 = u_xlat3_;
    let _e259 = u_xlat3_;
    let _e261 = u_xlat18_;
    let _e264 = vs_TEXCOORD1_1;
    let _e266 = ((_e259.zw * _e261.xx) + _e264.xy);
    u_xlat3_.x = _e266.x;
    u_xlat3_.y = _e266.y;
    let _e271 = u_xlat3_;
    let _e276 = _f_buffer0_.f_cb0_[4];
    let _e281 = hscard_bias.values[4];
    let _e284 = textureSampleBias(f_t4_, samplerf_s4_, _e271.xy, (_e276.x + _e281.x));
    u_xlat3_ = _e284;
    let _e285 = u_xlat1_;
    let _e289 = _f_buffer1_.f_cb1_[19];
    u_xlat27_ = dot(_e285, _e289);
    let _e291 = u_xlat27_;
    u_xlat27_ = min(_e291, 1f);
    let _e294 = u_xlat27_;
    let _e295 = u_xlat3_;
    u_xlat27_ = (_e294 * _e295.w);
    let _e298 = u_xlat3_;
    let _e303 = _f_buffer1_.f_cb1_[25];
    u_xlat5_ = (_e298.xyxy * _e303);
    let _e305 = u_xlat5_;
    let _e306 = u_xlat27_;
    let _e309 = u_xlat4_;
    u_xlat4_ = ((_e305 * vec4(_e306)) + _e309);
    let _e311 = u_xlat22_;
    let _e313 = u_xlat4_;
    let _e315 = vs_TEXCOORD0_1;
    let _e317 = (_e313.zw + _e315.zw);
    u_xlat22_.x = _e317.x;
    u_xlat22_.y = _e317.y;
    let _e322 = u_xlat22_;
    let _e327 = _f_buffer0_.f_cb0_[4];
    let _e332 = hscard_bias.values[3];
    let _e335 = textureSampleBias(f_t3_, samplerf_s3_, _e322.xy, (_e327.x + _e332.x));
    u_xlat5_ = _e335;
    let _e336 = u_xlat22_;
    let _e341 = _f_buffer1_.f_cb1_[17];
    let _e347 = _f_buffer1_.f_cb1_[18];
    let _e349 = (-(_e341.xy) + _e347.zw);
    u_xlat22_.x = _e349.x;
    u_xlat22_.y = _e349.y;
    let _e354 = u_xlat5_;
    let _e356 = u_xlat22_;
    let _e359 = u_xlat5_;
    let _e361 = (-(_e356.xy) + _e359.xy);
    u_xlat5_.x = _e361.x;
    u_xlat5_.y = _e361.y;
    let _e366 = u_xlat22_;
    let _e368 = u_xlat5_;
    let _e373 = _f_buffer1_.f_cb1_[18];
    let _e376 = u_xlat22_;
    let _e378 = ((_e368.xy * _e373.xy) + _e376.xy);
    u_xlat22_.x = _e378.x;
    u_xlat22_.y = _e378.y;
    let _e383 = u_xlat0_;
    let _e385 = u_xlat0_;
    let _e387 = u_xlat22_;
    let _e389 = (_e385.xy + _e387.xy);
    u_xlat0_.x = _e389.x;
    u_xlat0_.y = _e389.y;
    let _e394 = u_xlat0_;
    let _e399 = _f_buffer0_.f_cb0_[4];
    let _e404 = hscard_bias.values[2];
    let _e407 = textureSampleBias(f_t2_, samplerf_s2_, _e394.xy, (_e399.x + _e404.x));
    u_xlat6_ = _e407;
    let _e408 = u_xlat0_;
    let _e410 = u_xlat6_;
    let _e415 = _f_buffer1_.f_cb1_[16];
    let _e417 = (_e410.xy * _e415.xy);
    u_xlat0_.x = _e417.x;
    u_xlat0_.y = _e417.y;
    let _e423 = u_xlat1_;
    let _e427 = _f_buffer1_.f_cb1_[10];
    u_xlat22_.x = dot(_e423, _e427);
    let _e430 = u_xlat1_;
    let _e434 = _f_buffer1_.f_cb1_[39];
    u_xlat1_.x = dot(_e430, _e434);
    let _e437 = u_xlat1_;
    u_xlat1_.x = min(_e437.x, 1f);
    let _e442 = u_xlat1_;
    let _e444 = vs_TEXCOORD2_1;
    u_xlat1_.x = (_e442.x * _e444.y);
    let _e447 = u_xlat22_;
    u_xlat10_ = min(_e447.x, 1f);
    let _e452 = u_xlat5_;
    let _e454 = u_xlat6_;
    u_xlat6_.w = (_e452.z * _e454.w);
    let _e457 = u_xlat10_;
    let _e458 = u_xlat6_;
    u_xlat10_ = (_e457 * _e458.w);
    let _e461 = u_xlat0_;
    let _e463 = u_xlat0_;
    let _e465 = u_xlat10_;
    let _e468 = u_xlat4_;
    let _e470 = ((_e463.xy * vec2(_e465)) + _e468.xy);
    u_xlat0_.x = _e470.x;
    u_xlat0_.y = _e470.y;
    let _e475 = u_xlat0_;
    let _e477 = u_xlat0_;
    let _e479 = vs_TEXCOORD0_1;
    let _e481 = (_e477.xy + _e479.xy);
    u_xlat0_.x = _e481.x;
    u_xlat0_.y = _e481.y;
    let _e486 = u_xlat0_;
    let _e491 = _f_buffer0_.f_cb0_[4];
    let _e496 = hscard_bias.values[0];
    let _e499 = textureSampleBias(f_t0_, samplerf_s0_, _e486.xy, (_e491.x + _e496.x));
    u_xlat4_ = _e499;
    let _e503 = _f_buffer1_.f_cb1_[11];
    let _e508 = _f_buffer1_.f_cb1_[11];
    u_xlat5_ = (_e503.wwww * _e508);
    let _e510 = u_xlat6_;
    let _e511 = u_xlat5_;
    let _e513 = u_xlat4_;
    u_xlat7_ = ((_e510 * _e511) + -(_e513));
    let _e516 = u_xlat5_;
    let _e517 = u_xlat6_;
    u_xlat8_ = (_e516 * _e517);
    let _e519 = u_xlat6_;
    let _e521 = u_xlat5_;
    u_xlat5_ = ((-(_e519) * _e521) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e530 = u_xlat8_;
    let _e535 = _f_buffer1_.f_cb1_[15];
    u_xlat0_.x = (_e530.w * _e535.w);
    let _e539 = u_xlat0_;
    u_xlat0_.x = clamp(_e539.x, 0f, 1f);
    let _e544 = u_xlat0_;
    let _e546 = u_xlat7_;
    let _e548 = u_xlat4_;
    u_xlat6_ = ((_e544.xxxx * _e546) + _e548);
    let _e550 = u_xlatb0_;
    let _e560 = _f_buffer1_.f_cb1_[15];
    let _e563 = (vec4<f32>(0f, 0f, 0f, 0f) < _e560.wzww).xy;
    u_xlatb0_.x = _e563.x;
    u_xlatb0_.y = _e563.y;
    let _e568 = u_xlatb0_;
    if _e568.x {
        let _e570 = u_xlat6_;
        local = _e570;
    } else {
        let _e571 = u_xlat4_;
        local = _e571;
    }
    let _e573 = local;
    u_xlat6_ = _e573;
    let _e574 = u_xlat8_;
    let _e575 = u_xlat6_;
    u_xlat7_ = (_e574 * _e575);
    let _e577 = u_xlat7_;
    let _e581 = _f_buffer1_.f_cb1_[15];
    let _e584 = u_xlat6_;
    u_xlat6_ = ((_e577 * _e581.yyyy) + _e584);
    let _e586 = u_xlat8_;
    let _e590 = _f_buffer1_.f_cb1_[15];
    let _e593 = u_xlat6_;
    u_xlat6_ = ((_e586 * _e590.xxxx) + _e593);
    let _e595 = u_xlat6_;
    u_xlat7_ = (-(_e595) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e603 = u_xlat7_;
    let _e604 = u_xlat7_;
    u_xlat7_ = (_e603 + _e604);
    let _e606 = u_xlat7_;
    let _e608 = u_xlat5_;
    u_xlat5_ = ((-(_e606) * _e608) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e616 = u_xlat6_;
    let _e617 = u_xlat6_;
    u_xlat7_ = (_e616 + _e617);
    let _e619 = u_xlat7_;
    let _e621 = u_xlat8_;
    let _e623 = u_xlat5_;
    u_xlat5_ = ((-(_e619) * _e621) + _e623);
    let _e625 = u_xlat8_;
    let _e626 = u_xlat7_;
    u_xlat8_ = (_e625 * _e626);
    let _e628 = u_xlat7_;
    u_xlat7_ = floor(_e628);
    let _e630 = u_xlat7_;
    u_xlat7_ = min(_e630, vec4<f32>(1f, 1f, 1f, 1f));
    let _e637 = u_xlat7_;
    let _e638 = u_xlat5_;
    let _e640 = u_xlat8_;
    u_xlat5_ = ((_e637 * _e638) + _e640);
    let _e642 = u_xlat4_;
    let _e644 = u_xlat5_;
    u_xlat5_ = (-(_e642) + _e644);
    let _e649 = _f_buffer1_.f_cb1_[15];
    let _e651 = u_xlat5_;
    let _e653 = u_xlat4_;
    u_xlat5_ = ((_e649.zzzz * _e651) + _e653);
    let _e655 = u_xlatb0_;
    if _e655.y {
        let _e657 = u_xlat5_;
        local_1 = _e657;
    } else {
        let _e658 = u_xlat6_;
        local_1 = _e658;
    }
    let _e660 = local_1;
    u_xlat5_ = _e660;
    let _e661 = u_xlat4_;
    let _e663 = u_xlat5_;
    u_xlat5_ = (-(_e661) + _e663);
    let _e665 = u_xlat10_;
    let _e667 = u_xlat5_;
    let _e669 = u_xlat4_;
    u_xlat4_ = ((vec4(_e665) * _e667) + _e669);
    let _e671 = u_xlat27_;
    let _e676 = _f_buffer1_.f_cb1_[20];
    u_xlat5_ = (vec4(_e671) * _e676);
    let _e678 = u_xlat5_;
    let _e682 = _f_buffer1_.f_cb1_[20];
    u_xlat5_ = (_e678 * _e682.wwww);
    let _e685 = u_xlat3_;
    let _e686 = u_xlat5_;
    let _e688 = u_xlat4_;
    u_xlat6_ = ((_e685 * _e686) + -(_e688));
    let _e691 = u_xlat3_;
    let _e692 = u_xlat5_;
    u_xlat7_ = (_e691 * _e692);
    let _e694 = u_xlat3_;
    let _e696 = u_xlat5_;
    u_xlat3_ = ((-(_e694) * _e696) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e705 = u_xlat7_;
    let _e710 = _f_buffer1_.f_cb1_[24];
    u_xlat0_.x = (_e705.w * _e710.w);
    let _e714 = u_xlat0_;
    u_xlat0_.x = clamp(_e714.x, 0f, 1f);
    let _e719 = u_xlat0_;
    let _e721 = u_xlat6_;
    let _e723 = u_xlat4_;
    u_xlat5_ = ((_e719.xxxx * _e721) + _e723);
    let _e725 = u_xlatb0_;
    let _e735 = _f_buffer1_.f_cb1_[24];
    let _e738 = (vec4<f32>(0f, 0f, 0f, 0f) < _e735.wzww).xy;
    u_xlatb0_.x = _e738.x;
    u_xlatb0_.y = _e738.y;
    let _e743 = u_xlatb0_;
    if _e743.x {
        let _e745 = u_xlat5_;
        local_2 = _e745;
    } else {
        let _e746 = u_xlat4_;
        local_2 = _e746;
    }
    let _e748 = local_2;
    u_xlat5_ = _e748;
    let _e749 = u_xlat7_;
    let _e750 = u_xlat5_;
    u_xlat6_ = (_e749 * _e750);
    let _e752 = u_xlat6_;
    let _e756 = _f_buffer1_.f_cb1_[24];
    let _e759 = u_xlat5_;
    u_xlat5_ = ((_e752 * _e756.yyyy) + _e759);
    let _e761 = u_xlat7_;
    let _e765 = _f_buffer1_.f_cb1_[24];
    let _e768 = u_xlat5_;
    u_xlat5_ = ((_e761 * _e765.xxxx) + _e768);
    let _e770 = u_xlat5_;
    u_xlat6_ = (-(_e770) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e778 = u_xlat6_;
    let _e779 = u_xlat6_;
    u_xlat6_ = (_e778 + _e779);
    let _e781 = u_xlat6_;
    let _e783 = u_xlat3_;
    u_xlat3_ = ((-(_e781) * _e783) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e791 = u_xlat5_;
    let _e792 = u_xlat5_;
    u_xlat6_ = (_e791 + _e792);
    let _e794 = u_xlat6_;
    let _e796 = u_xlat7_;
    let _e798 = u_xlat3_;
    u_xlat3_ = ((-(_e794) * _e796) + _e798);
    let _e800 = u_xlat7_;
    let _e801 = u_xlat6_;
    u_xlat7_ = (_e800 * _e801);
    let _e803 = u_xlat6_;
    u_xlat6_ = floor(_e803);
    let _e805 = u_xlat6_;
    u_xlat6_ = min(_e805, vec4<f32>(1f, 1f, 1f, 1f));
    let _e812 = u_xlat6_;
    let _e813 = u_xlat3_;
    let _e815 = u_xlat7_;
    u_xlat3_ = ((_e812 * _e813) + _e815);
    let _e817 = u_xlat4_;
    let _e819 = u_xlat3_;
    u_xlat3_ = (-(_e817) + _e819);
    let _e824 = _f_buffer1_.f_cb1_[24];
    let _e826 = u_xlat3_;
    let _e828 = u_xlat4_;
    u_xlat3_ = ((_e824.zzzz * _e826) + _e828);
    let _e830 = u_xlatb0_;
    if _e830.y {
        let _e832 = u_xlat3_;
        local_3 = _e832;
    } else {
        let _e833 = u_xlat5_;
        local_3 = _e833;
    }
    let _e835 = local_3;
    u_xlat3_ = _e835;
    let _e836 = u_xlat4_;
    let _e838 = u_xlat3_;
    u_xlat3_ = (-(_e836) + _e838);
    let _e840 = u_xlat27_;
    let _e842 = u_xlat3_;
    let _e844 = u_xlat4_;
    u_xlat3_ = ((vec4(_e840) * _e842) + _e844);
    let _e846 = u_xlat18_;
    let _e851 = _f_buffer1_.f_cb1_[29];
    u_xlat4_ = (_e846.xxxx * _e851);
    let _e853 = u_xlat4_;
    let _e857 = _f_buffer1_.f_cb1_[29];
    u_xlat4_ = (_e853 * _e857.wwww);
    let _e860 = u_xlat2_;
    let _e861 = u_xlat4_;
    let _e863 = u_xlat3_;
    u_xlat5_ = ((_e860 * _e861) + -(_e863));
    let _e866 = u_xlat2_;
    let _e867 = u_xlat4_;
    u_xlat6_ = (_e866 * _e867);
    let _e869 = u_xlat2_;
    let _e871 = u_xlat4_;
    u_xlat2_ = ((-(_e869) * _e871) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e880 = u_xlat6_;
    let _e885 = _f_buffer1_.f_cb1_[33];
    u_xlat0_.x = (_e880.w * _e885.w);
    let _e889 = u_xlat0_;
    u_xlat0_.x = clamp(_e889.x, 0f, 1f);
    let _e894 = u_xlat0_;
    let _e896 = u_xlat5_;
    let _e898 = u_xlat3_;
    u_xlat4_ = ((_e894.xxxx * _e896) + _e898);
    let _e900 = u_xlatb0_;
    let _e910 = _f_buffer1_.f_cb1_[33];
    let _e913 = (vec4<f32>(0f, 0f, 0f, 0f) < _e910.wzww).xy;
    u_xlatb0_.x = _e913.x;
    u_xlatb0_.y = _e913.y;
    let _e918 = u_xlatb0_;
    if _e918.x {
        let _e920 = u_xlat4_;
        local_4 = _e920;
    } else {
        let _e921 = u_xlat3_;
        local_4 = _e921;
    }
    let _e923 = local_4;
    u_xlat4_ = _e923;
    let _e924 = u_xlat6_;
    let _e925 = u_xlat4_;
    u_xlat5_ = (_e924 * _e925);
    let _e927 = u_xlat5_;
    let _e931 = _f_buffer1_.f_cb1_[33];
    let _e934 = u_xlat4_;
    u_xlat4_ = ((_e927 * _e931.yyyy) + _e934);
    let _e936 = u_xlat6_;
    let _e940 = _f_buffer1_.f_cb1_[33];
    let _e943 = u_xlat4_;
    u_xlat4_ = ((_e936 * _e940.xxxx) + _e943);
    let _e945 = u_xlat4_;
    u_xlat5_ = (-(_e945) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e953 = u_xlat5_;
    let _e954 = u_xlat5_;
    u_xlat5_ = (_e953 + _e954);
    let _e956 = u_xlat5_;
    let _e958 = u_xlat2_;
    u_xlat2_ = ((-(_e956) * _e958) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e966 = u_xlat4_;
    let _e967 = u_xlat4_;
    u_xlat5_ = (_e966 + _e967);
    let _e969 = u_xlat5_;
    let _e971 = u_xlat6_;
    let _e973 = u_xlat2_;
    u_xlat2_ = ((-(_e969) * _e971) + _e973);
    let _e975 = u_xlat6_;
    let _e976 = u_xlat5_;
    u_xlat6_ = (_e975 * _e976);
    let _e978 = u_xlat5_;
    u_xlat5_ = floor(_e978);
    let _e980 = u_xlat5_;
    u_xlat5_ = min(_e980, vec4<f32>(1f, 1f, 1f, 1f));
    let _e987 = u_xlat5_;
    let _e988 = u_xlat2_;
    let _e990 = u_xlat6_;
    u_xlat2_ = ((_e987 * _e988) + _e990);
    let _e992 = u_xlat3_;
    let _e994 = u_xlat2_;
    u_xlat2_ = (-(_e992) + _e994);
    let _e999 = _f_buffer1_.f_cb1_[33];
    let _e1001 = u_xlat2_;
    let _e1003 = u_xlat3_;
    u_xlat2_ = ((_e999.zzzz * _e1001) + _e1003);
    let _e1005 = u_xlatb0_;
    if _e1005.y {
        let _e1007 = u_xlat2_;
        local_5 = _e1007;
    } else {
        let _e1008 = u_xlat4_;
        local_5 = _e1008;
    }
    let _e1010 = local_5;
    u_xlat2_ = _e1010;
    let _e1011 = u_xlat3_;
    let _e1013 = u_xlat2_;
    u_xlat2_ = (-(_e1011) + _e1013);
    let _e1015 = u_xlat18_;
    let _e1017 = u_xlat2_;
    let _e1019 = u_xlat3_;
    u_xlat0_ = ((_e1015.xxxx * _e1017) + _e1019);
    let _e1021 = u_xlat0_;
    u_xlat0_ = clamp(_e1021, vec4(0f), vec4(1f));
    let _e1027 = u_xlat0_;
    u_xlat2_ = log2(_e1027);
    let _e1029 = u_xlat2_;
    let _e1033 = _f_buffer1_.f_cb1_[38];
    u_xlat2_ = (_e1029 * _e1033.zzzz);
    let _e1036 = u_xlat2_;
    u_xlat2_ = exp2(_e1036);
    let _e1038 = u_xlat1_;
    let _e1040 = u_xlat2_;
    let _e1042 = u_xlat0_;
    u_xlat0_ = ((_e1038.xxxx * _e1040) + _e1042);
    let _e1044 = u_xlat0_;
    let _e1045 = vs_COLOR0_1;
    SV_Target0_ = (_e1044 * _e1045);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e56 = SV_Target0_;
    return FragmentOutput(_e56);
}
