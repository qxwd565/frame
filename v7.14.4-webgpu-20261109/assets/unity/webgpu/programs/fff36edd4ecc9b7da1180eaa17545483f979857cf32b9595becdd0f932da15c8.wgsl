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
    var u_xlatb0_: vec3<bool> = vec3(false);
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
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlatb18_: vec2<bool> = vec2(false);
    var u_xlat19_: vec2<f32> = vec2(0f);
    var u_xlat27_: f32 = 0f;
    var u_xlat28_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e94 = vs_TEXCOORD0_1;
    let _e99 = _f_buffer0_.f_cb0_[4];
    let _e104 = hscard_bias.values[1];
    let _e107 = textureSampleBias(f_t1_, samplerf_s1_, _e94.xy, (_e99.x + _e104.x));
    u_xlat0_ = _e107;
    let _e109 = u_xlat0_;
    let _e113 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = dot(_e109, _e113);
    let _e116 = u_xlat1_;
    u_xlat1_.x = min(_e116.x, 1f);
    let _e120 = u_xlat10_;
    let _e125 = _f_buffer1_.f_cb1_[11];
    let _e130 = _f_buffer1_.f_cb1_[11];
    let _e132 = (_e125.zw + _e130.xy);
    u_xlat10_.x = _e132.x;
    u_xlat10_.y = _e132.y;
    let _e137 = u_xlat0_;
    let _e141 = _f_buffer1_.f_cb1_[27];
    u_xlat28_ = dot(_e137, _e141);
    let _e144 = u_xlat0_;
    let _e148 = _f_buffer1_.f_cb1_[14];
    u_xlat0_.x = dot(_e144, _e148);
    let _e151 = u_xlat0_;
    u_xlat0_.x = min(_e151.x, 1f);
    let _e155 = u_xlat28_;
    u_xlat9_ = min(_e155, 1f);
    let _e158 = vs_TEXCOORD1_1;
    let _e163 = _f_buffer0_.f_cb0_[4];
    let _e168 = hscard_bias.values[5];
    let _e171 = textureSampleBias(f_t5_, samplerf_s5_, _e158.zw, (_e163.x + _e168.x));
    u_xlat2_ = _e171;
    let _e172 = u_xlat9_;
    let _e173 = u_xlat2_;
    u_xlat9_ = (_e172 * _e173.w);
    let _e176 = u_xlat9_;
    let _e178 = u_xlat2_;
    u_xlat3_ = (vec4(_e176) * _e178.xyxy);
    let _e181 = u_xlat3_;
    let _e185 = _f_buffer1_.f_cb1_[33];
    u_xlat3_ = (_e181 * _e185.zwxy);
    let _e188 = u_xlat18_;
    let _e190 = u_xlat9_;
    let _e192 = u_xlat3_;
    let _e194 = (vec2(_e190) * _e192.xy);
    u_xlat18_.x = _e194.x;
    u_xlat18_.y = _e194.y;
    let _e199 = u_xlat3_;
    let _e201 = u_xlat18_;
    let _e207 = vs_TEXCOORD1_1;
    let _e209 = ((_e201.xy * vec2<f32>(0.001f, 0.001f)) + _e207.xy);
    u_xlat3_.x = _e209.x;
    u_xlat3_.y = _e209.y;
    let _e214 = u_xlat3_;
    let _e219 = _f_buffer0_.f_cb0_[4];
    let _e224 = hscard_bias.values[4];
    let _e227 = textureSampleBias(f_t4_, samplerf_s4_, _e214.xy, (_e219.x + _e224.x));
    u_xlat4_ = _e227;
    let _e229 = u_xlat0_;
    let _e231 = u_xlat4_;
    u_xlat0_.x = (_e229.x * _e231.w);
    let _e234 = u_xlat3_;
    let _e236 = u_xlat4_;
    let _e241 = _f_buffer1_.f_cb1_[20];
    let _e243 = (_e236.xy * _e241.zw);
    u_xlat3_.x = _e243.x;
    u_xlat3_.y = _e243.y;
    let _e248 = u_xlat18_;
    let _e250 = u_xlat3_;
    let _e252 = u_xlat0_;
    let _e255 = u_xlat18_;
    let _e257 = ((_e250.xy * _e252.xx) + _e255.xy);
    u_xlat18_.x = _e257.x;
    u_xlat18_.y = _e257.y;
    let _e262 = u_xlat18_;
    let _e264 = u_xlat18_;
    let _e270 = vs_TEXCOORD0_1;
    let _e272 = ((_e264.xy * vec2<f32>(0.001f, 0.001f)) + _e270.zw);
    u_xlat18_.x = _e272.x;
    u_xlat18_.y = _e272.y;
    let _e277 = u_xlat18_;
    let _e282 = _f_buffer0_.f_cb0_[4];
    let _e287 = hscard_bias.values[3];
    let _e290 = textureSampleBias(f_t3_, samplerf_s3_, _e277.xy, (_e282.x + _e287.x));
    u_xlat5_ = _e290;
    let _e291 = u_xlat18_;
    let _e296 = _f_buffer1_.f_cb1_[11];
    let _e302 = _f_buffer1_.f_cb1_[12];
    let _e304 = (-(_e296.xy) + _e302.zw);
    u_xlat18_.x = _e304.x;
    u_xlat18_.y = _e304.y;
    let _e309 = u_xlat3_;
    let _e311 = u_xlat18_;
    let _e314 = u_xlat5_;
    let _e316 = (-(_e311.xy) + _e314.xy);
    u_xlat3_.x = _e316.x;
    u_xlat3_.y = _e316.y;
    let _e321 = u_xlat18_;
    let _e323 = u_xlat3_;
    let _e328 = _f_buffer1_.f_cb1_[12];
    let _e331 = u_xlat18_;
    let _e333 = ((_e323.xy * _e328.xy) + _e331.xy);
    u_xlat18_.x = _e333.x;
    u_xlat18_.y = _e333.y;
    let _e338 = u_xlat18_;
    let _e340 = u_xlat10_;
    let _e342 = u_xlat18_;
    let _e344 = (_e340.xy + _e342.xy);
    u_xlat18_.x = _e344.x;
    u_xlat18_.y = _e344.y;
    let _e349 = u_xlat18_;
    let _e354 = _f_buffer0_.f_cb0_[4];
    let _e359 = hscard_bias.values[2];
    let _e362 = textureSampleBias(f_t2_, samplerf_s2_, _e349.xy, (_e354.x + _e359.x));
    u_xlat6_ = _e362;
    let _e364 = u_xlat5_;
    let _e366 = u_xlat6_;
    u_xlat6_.w = (_e364.z * _e366.w);
    let _e370 = u_xlat1_;
    let _e372 = u_xlat6_;
    u_xlat18_.x = (_e370.x * _e372.w);
    let _e375 = u_xlat1_;
    let _e377 = u_xlat6_;
    let _e382 = _f_buffer1_.f_cb1_[8];
    let _e384 = (_e377.xy * _e382.xy);
    u_xlat1_.x = _e384.x;
    u_xlat1_.y = _e384.y;
    let _e389 = u_xlat19_;
    let _e391 = u_xlat0_;
    let _e393 = u_xlat4_;
    let _e395 = (_e391.xx * _e393.xy);
    u_xlat19_.x = _e395.x;
    u_xlat19_.y = _e395.y;
    let _e400 = u_xlat19_;
    let _e402 = u_xlat19_;
    let _e407 = _f_buffer1_.f_cb1_[20];
    let _e409 = (_e402.xy * _e407.xy);
    u_xlat19_.x = _e409.x;
    u_xlat19_.y = _e409.y;
    let _e414 = u_xlat19_;
    let _e416 = u_xlat0_;
    let _e418 = u_xlat19_;
    let _e420 = (_e416.xx * _e418.xy);
    u_xlat19_.x = _e420.x;
    u_xlat19_.y = _e420.y;
    let _e425 = u_xlat1_;
    let _e427 = u_xlat1_;
    let _e429 = u_xlat18_;
    let _e432 = u_xlat19_;
    let _e434 = ((_e427.xy * _e429.xx) + _e432.xy);
    u_xlat1_.x = _e434.x;
    u_xlat1_.y = _e434.y;
    let _e439 = u_xlat1_;
    let _e441 = u_xlat3_;
    let _e443 = u_xlat9_;
    let _e446 = u_xlat1_;
    let _e448 = ((_e441.zw * vec2(_e443)) + _e446.xy);
    u_xlat1_.x = _e448.x;
    u_xlat1_.y = _e448.y;
    let _e453 = u_xlat1_;
    let _e455 = u_xlat1_;
    let _e461 = vs_TEXCOORD0_1;
    let _e463 = ((_e455.xy * vec2<f32>(0.001f, 0.001f)) + _e461.xy);
    u_xlat1_.x = _e463.x;
    u_xlat1_.y = _e463.y;
    let _e468 = u_xlat1_;
    let _e473 = _f_buffer0_.f_cb0_[4];
    let _e478 = hscard_bias.values[0];
    let _e481 = textureSampleBias(f_t0_, samplerf_s0_, _e468.xy, (_e473.x + _e478.x));
    u_xlat1_ = _e481;
    let _e485 = _f_buffer1_.f_cb1_[3];
    let _e490 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = (_e485.wwww * _e490);
    let _e492 = u_xlat6_;
    let _e493 = u_xlat3_;
    let _e495 = u_xlat1_;
    u_xlat5_ = ((_e492 * _e493) + -(_e495));
    let _e498 = u_xlat3_;
    let _e499 = u_xlat6_;
    u_xlat7_ = (_e498 * _e499);
    let _e501 = u_xlat6_;
    let _e503 = u_xlat3_;
    u_xlat3_ = ((-(_e501) * _e503) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e511 = u_xlat7_;
    let _e516 = _f_buffer1_.f_cb1_[7];
    u_xlat27_ = (_e511.w * _e516.w);
    let _e519 = u_xlat27_;
    u_xlat27_ = clamp(_e519, 0f, 1f);
    let _e523 = u_xlat27_;
    let _e525 = u_xlat5_;
    let _e527 = u_xlat1_;
    u_xlat5_ = ((vec4(_e523) * _e525) + _e527);
    let _e529 = u_xlatb6_;
    let _e539 = _f_buffer1_.f_cb1_[7];
    let _e542 = (vec4<f32>(0f, 0f, 0f, 0f) < _e539.wzww).xy;
    u_xlatb6_.x = _e542.x;
    u_xlatb6_.y = _e542.y;
    let _e547 = u_xlatb6_;
    if _e547.x {
        let _e549 = u_xlat5_;
        local = _e549;
    } else {
        let _e550 = u_xlat1_;
        local = _e550;
    }
    let _e552 = local;
    u_xlat5_ = _e552;
    let _e553 = u_xlat7_;
    let _e554 = u_xlat5_;
    u_xlat8_ = (_e553 * _e554);
    let _e556 = u_xlat8_;
    let _e560 = _f_buffer1_.f_cb1_[7];
    let _e563 = u_xlat5_;
    u_xlat5_ = ((_e556 * _e560.yyyy) + _e563);
    let _e565 = u_xlat7_;
    let _e569 = _f_buffer1_.f_cb1_[7];
    let _e572 = u_xlat5_;
    u_xlat5_ = ((_e565 * _e569.xxxx) + _e572);
    let _e574 = u_xlat5_;
    u_xlat8_ = (-(_e574) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e582 = u_xlat8_;
    let _e583 = u_xlat8_;
    u_xlat8_ = (_e582 + _e583);
    let _e585 = u_xlat8_;
    let _e587 = u_xlat3_;
    u_xlat3_ = ((-(_e585) * _e587) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e595 = u_xlat5_;
    let _e596 = u_xlat5_;
    u_xlat8_ = (_e595 + _e596);
    let _e598 = u_xlat8_;
    let _e600 = u_xlat7_;
    let _e602 = u_xlat3_;
    u_xlat3_ = ((-(_e598) * _e600) + _e602);
    let _e604 = u_xlat7_;
    let _e605 = u_xlat8_;
    u_xlat7_ = (_e604 * _e605);
    let _e607 = u_xlat8_;
    u_xlat8_ = floor(_e607);
    let _e609 = u_xlat8_;
    u_xlat8_ = min(_e609, vec4<f32>(1f, 1f, 1f, 1f));
    let _e616 = u_xlat8_;
    let _e617 = u_xlat3_;
    let _e619 = u_xlat7_;
    u_xlat3_ = ((_e616 * _e617) + _e619);
    let _e621 = u_xlat1_;
    let _e623 = u_xlat3_;
    u_xlat3_ = (-(_e621) + _e623);
    let _e628 = _f_buffer1_.f_cb1_[7];
    let _e630 = u_xlat3_;
    let _e632 = u_xlat1_;
    u_xlat3_ = ((_e628.zzzz * _e630) + _e632);
    let _e634 = u_xlatb6_;
    if _e634.y {
        let _e636 = u_xlat3_;
        local_1 = _e636;
    } else {
        let _e637 = u_xlat5_;
        local_1 = _e637;
    }
    let _e639 = local_1;
    u_xlat3_ = _e639;
    let _e640 = u_xlat1_;
    let _e642 = u_xlat3_;
    u_xlat3_ = (-(_e640) + _e642);
    let _e644 = u_xlat18_;
    let _e646 = u_xlat3_;
    let _e648 = u_xlat1_;
    u_xlat1_ = ((_e644.xxxx * _e646) + _e648);
    let _e653 = _f_buffer1_.f_cb1_[15];
    let _e658 = _f_buffer1_.f_cb1_[15];
    u_xlat3_ = (_e653.wwww * _e658);
    let _e660 = u_xlat4_;
    let _e661 = u_xlat3_;
    let _e663 = u_xlat1_;
    u_xlat5_ = ((_e660 * _e661) + -(_e663));
    let _e666 = u_xlat3_;
    let _e667 = u_xlat4_;
    u_xlat6_ = (_e666 * _e667);
    let _e669 = u_xlat4_;
    let _e671 = u_xlat3_;
    u_xlat3_ = ((-(_e669) * _e671) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e680 = u_xlat6_;
    let _e685 = _f_buffer1_.f_cb1_[19];
    u_xlat18_.x = (_e680.w * _e685.w);
    let _e689 = u_xlat18_;
    u_xlat18_.x = clamp(_e689.x, 0f, 1f);
    let _e694 = u_xlat18_;
    let _e696 = u_xlat5_;
    let _e698 = u_xlat1_;
    u_xlat4_ = ((_e694.xxxx * _e696) + _e698);
    let _e700 = u_xlatb18_;
    let _e710 = _f_buffer1_.f_cb1_[19];
    let _e713 = (vec4<f32>(0f, 0f, 0f, 0f) < _e710.wzwz).xy;
    u_xlatb18_.x = _e713.x;
    u_xlatb18_.y = _e713.y;
    let _e718 = u_xlatb18_;
    if _e718.x {
        let _e720 = u_xlat4_;
        local_2 = _e720;
    } else {
        let _e721 = u_xlat1_;
        local_2 = _e721;
    }
    let _e723 = local_2;
    u_xlat4_ = _e723;
    let _e724 = u_xlat6_;
    let _e725 = u_xlat4_;
    u_xlat5_ = (_e724 * _e725);
    let _e727 = u_xlat5_;
    let _e731 = _f_buffer1_.f_cb1_[19];
    let _e734 = u_xlat4_;
    u_xlat4_ = ((_e727 * _e731.yyyy) + _e734);
    let _e736 = u_xlat6_;
    let _e740 = _f_buffer1_.f_cb1_[19];
    let _e743 = u_xlat4_;
    u_xlat4_ = ((_e736 * _e740.xxxx) + _e743);
    let _e745 = u_xlat4_;
    u_xlat5_ = (-(_e745) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e753 = u_xlat5_;
    let _e754 = u_xlat5_;
    u_xlat5_ = (_e753 + _e754);
    let _e756 = u_xlat5_;
    let _e758 = u_xlat3_;
    u_xlat3_ = ((-(_e756) * _e758) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e766 = u_xlat4_;
    let _e767 = u_xlat4_;
    u_xlat5_ = (_e766 + _e767);
    let _e769 = u_xlat5_;
    let _e771 = u_xlat6_;
    let _e773 = u_xlat3_;
    u_xlat3_ = ((-(_e769) * _e771) + _e773);
    let _e775 = u_xlat6_;
    let _e776 = u_xlat5_;
    u_xlat6_ = (_e775 * _e776);
    let _e778 = u_xlat5_;
    u_xlat5_ = floor(_e778);
    let _e780 = u_xlat5_;
    u_xlat5_ = min(_e780, vec4<f32>(1f, 1f, 1f, 1f));
    let _e787 = u_xlat5_;
    let _e788 = u_xlat3_;
    let _e790 = u_xlat6_;
    u_xlat3_ = ((_e787 * _e788) + _e790);
    let _e792 = u_xlat1_;
    let _e794 = u_xlat3_;
    u_xlat3_ = (-(_e792) + _e794);
    let _e799 = _f_buffer1_.f_cb1_[19];
    let _e801 = u_xlat3_;
    let _e803 = u_xlat1_;
    u_xlat3_ = ((_e799.zzzz * _e801) + _e803);
    let _e805 = u_xlatb18_;
    if _e805.y {
        let _e807 = u_xlat3_;
        local_3 = _e807;
    } else {
        let _e808 = u_xlat4_;
        local_3 = _e808;
    }
    let _e810 = local_3;
    u_xlat3_ = _e810;
    let _e811 = u_xlat1_;
    let _e813 = u_xlat3_;
    u_xlat3_ = (-(_e811) + _e813);
    let _e815 = u_xlat0_;
    let _e817 = u_xlat3_;
    let _e819 = u_xlat1_;
    u_xlat1_ = ((_e815.xxxx * _e817) + _e819);
    let _e824 = _f_buffer1_.f_cb1_[28];
    let _e829 = _f_buffer1_.f_cb1_[28];
    u_xlat3_ = (_e824.wwww * _e829);
    let _e831 = u_xlat2_;
    let _e832 = u_xlat3_;
    let _e834 = u_xlat1_;
    u_xlat4_ = ((_e831 * _e832) + -(_e834));
    let _e837 = u_xlat2_;
    let _e838 = u_xlat3_;
    u_xlat5_ = (_e837 * _e838);
    let _e840 = u_xlat2_;
    let _e842 = u_xlat3_;
    u_xlat2_ = ((-(_e840) * _e842) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e851 = u_xlat5_;
    let _e856 = _f_buffer1_.f_cb1_[32];
    u_xlat0_.x = (_e851.w * _e856.w);
    let _e860 = u_xlat0_;
    u_xlat0_.x = clamp(_e860.x, 0f, 1f);
    let _e865 = u_xlat0_;
    let _e867 = u_xlat4_;
    let _e869 = u_xlat1_;
    u_xlat3_ = ((_e865.xxxx * _e867) + _e869);
    let _e871 = u_xlatb0_;
    let _e881 = _f_buffer1_.f_cb1_[32];
    let _e884 = (vec4<f32>(0f, 0f, 0f, 0f) < _e881.wwzw).xz;
    u_xlatb0_.x = _e884.x;
    u_xlatb0_.z = _e884.y;
    let _e889 = u_xlatb0_;
    if _e889.x {
        let _e891 = u_xlat3_;
        local_4 = _e891;
    } else {
        let _e892 = u_xlat1_;
        local_4 = _e892;
    }
    let _e894 = local_4;
    u_xlat3_ = _e894;
    let _e895 = u_xlat5_;
    let _e896 = u_xlat3_;
    u_xlat4_ = (_e895 * _e896);
    let _e898 = u_xlat4_;
    let _e902 = _f_buffer1_.f_cb1_[32];
    let _e905 = u_xlat3_;
    u_xlat3_ = ((_e898 * _e902.yyyy) + _e905);
    let _e907 = u_xlat5_;
    let _e911 = _f_buffer1_.f_cb1_[32];
    let _e914 = u_xlat3_;
    u_xlat3_ = ((_e907 * _e911.xxxx) + _e914);
    let _e916 = u_xlat3_;
    u_xlat4_ = (-(_e916) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e924 = u_xlat4_;
    let _e925 = u_xlat4_;
    u_xlat4_ = (_e924 + _e925);
    let _e927 = u_xlat4_;
    let _e929 = u_xlat2_;
    u_xlat2_ = ((-(_e927) * _e929) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e937 = u_xlat3_;
    let _e938 = u_xlat3_;
    u_xlat4_ = (_e937 + _e938);
    let _e940 = u_xlat4_;
    let _e942 = u_xlat5_;
    let _e944 = u_xlat2_;
    u_xlat2_ = ((-(_e940) * _e942) + _e944);
    let _e946 = u_xlat5_;
    let _e947 = u_xlat4_;
    u_xlat5_ = (_e946 * _e947);
    let _e949 = u_xlat4_;
    u_xlat4_ = floor(_e949);
    let _e951 = u_xlat4_;
    u_xlat4_ = min(_e951, vec4<f32>(1f, 1f, 1f, 1f));
    let _e958 = u_xlat4_;
    let _e959 = u_xlat2_;
    let _e961 = u_xlat5_;
    u_xlat2_ = ((_e958 * _e959) + _e961);
    let _e963 = u_xlat1_;
    let _e965 = u_xlat2_;
    u_xlat2_ = (-(_e963) + _e965);
    let _e970 = _f_buffer1_.f_cb1_[32];
    let _e972 = u_xlat2_;
    let _e974 = u_xlat1_;
    u_xlat2_ = ((_e970.zzzz * _e972) + _e974);
    let _e976 = u_xlatb0_;
    if _e976.z {
        let _e978 = u_xlat2_;
        local_5 = _e978;
    } else {
        let _e979 = u_xlat3_;
        local_5 = _e979;
    }
    let _e981 = local_5;
    u_xlat2_ = _e981;
    let _e982 = u_xlat1_;
    let _e984 = u_xlat2_;
    u_xlat2_ = (-(_e982) + _e984);
    let _e986 = u_xlat9_;
    let _e988 = u_xlat2_;
    let _e990 = u_xlat1_;
    u_xlat0_ = ((vec4(_e986) * _e988) + _e990);
    let _e992 = u_xlat0_;
    u_xlat0_ = clamp(_e992, vec4(0f), vec4(1f));
    let _e998 = u_xlat0_;
    let _e999 = vs_COLOR0_1;
    u_xlat1_ = (_e998 * _e999);
    let _e1001 = u_xlat0_;
    let _e1002 = u_xlat1_;
    SV_Target0_ = min(_e1001, _e1002);
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
