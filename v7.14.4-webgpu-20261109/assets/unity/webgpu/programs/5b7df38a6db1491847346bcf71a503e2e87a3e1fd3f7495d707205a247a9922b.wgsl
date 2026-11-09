struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 39>,
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
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlatb18_: vec2<bool> = vec2(false);
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e80 = vs_TEXCOORD0_1;
    let _e85 = _f_buffer0_.f_cb0_[4];
    let _e90 = hscard_bias.values[1];
    let _e93 = textureSampleBias(f_t1_, samplerf_s1_, _e80.xy, (_e85.x + _e90.x));
    u_xlat0_ = _e93;
    let _e95 = u_xlat0_;
    let _e99 = _f_buffer1_.f_cb1_[14];
    u_xlat1_.x = dot(_e95, _e99);
    let _e102 = u_xlat1_;
    u_xlat1_.x = min(_e102.x, 1f);
    let _e106 = vs_TEXCOORD1_1;
    let _e111 = _f_buffer0_.f_cb0_[4];
    let _e116 = hscard_bias.values[5];
    let _e119 = textureSampleBias(f_t5_, samplerf_s5_, _e106.zw, (_e111.x + _e116.x));
    u_xlat2_ = _e119;
    let _e120 = u_xlat10_;
    let _e125 = _f_buffer1_.f_cb1_[37];
    let _e131 = _f_buffer1_.f_cb1_[38];
    let _e133 = (-(_e125.xy) + _e131.zw);
    u_xlat10_.x = _e133.x;
    u_xlat10_.y = _e133.y;
    let _e138 = u_xlat2_;
    let _e140 = u_xlat10_;
    let _e143 = u_xlat2_;
    let _e145 = (-(_e140.xy) + _e143.xy);
    u_xlat2_.x = _e145.x;
    u_xlat2_.y = _e145.y;
    let _e150 = u_xlat10_;
    let _e152 = u_xlat2_;
    let _e157 = _f_buffer1_.f_cb1_[38];
    let _e160 = u_xlat10_;
    let _e162 = ((_e152.xy * _e157.xy) + _e160.xy);
    u_xlat10_.x = _e162.x;
    u_xlat10_.y = _e162.y;
    let _e167 = u_xlat2_;
    let _e172 = _f_buffer1_.f_cb1_[37];
    let _e177 = _f_buffer1_.f_cb1_[37];
    let _e179 = (_e172.zw + _e177.xy);
    u_xlat2_.x = _e179.x;
    u_xlat2_.y = _e179.y;
    let _e184 = u_xlat10_;
    let _e186 = u_xlat10_;
    let _e188 = u_xlat2_;
    let _e190 = (_e186.xy + _e188.xy);
    u_xlat10_.x = _e190.x;
    u_xlat10_.y = _e190.y;
    let _e195 = u_xlat10_;
    let _e200 = _f_buffer0_.f_cb0_[4];
    let _e205 = hscard_bias.values[4];
    let _e208 = textureSampleBias(f_t4_, samplerf_s4_, _e195.xy, (_e200.x + _e205.x));
    u_xlat3_ = _e208;
    let _e210 = u_xlat0_;
    let _e214 = _f_buffer1_.f_cb1_[27];
    u_xlat10_.x = dot(_e210, _e214);
    let _e217 = u_xlat0_;
    let _e221 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = dot(_e217, _e221);
    let _e224 = u_xlat0_;
    u_xlat0_.x = min(_e224.x, 1f);
    let _e228 = u_xlat10_;
    u_xlat9_ = min(_e228.x, 1f);
    let _e233 = u_xlat2_;
    let _e235 = u_xlat3_;
    u_xlat3_.w = (_e233.z * _e235.w);
    let _e238 = u_xlat9_;
    let _e239 = u_xlat3_;
    u_xlat9_ = (_e238 * _e239.w);
    let _e242 = u_xlat9_;
    let _e244 = u_xlat3_;
    u_xlat2_ = (vec4(_e242) * _e244.xyxy);
    let _e247 = u_xlat2_;
    let _e251 = _f_buffer1_.f_cb1_[33];
    u_xlat2_ = (_e247 * _e251.zwxy);
    let _e254 = u_xlat18_;
    let _e256 = u_xlat9_;
    let _e258 = u_xlat2_;
    let _e260 = (vec2(_e256) * _e258.xy);
    u_xlat18_.x = _e260.x;
    u_xlat18_.y = _e260.y;
    let _e265 = u_xlat10_;
    let _e267 = u_xlat18_;
    let _e273 = vs_TEXCOORD1_1;
    let _e275 = ((_e267.xy * vec2<f32>(0.001f, 0.001f)) + _e273.xy);
    u_xlat10_.x = _e275.x;
    u_xlat10_.y = _e275.y;
    let _e280 = u_xlat10_;
    let _e285 = _f_buffer0_.f_cb0_[4];
    let _e290 = hscard_bias.values[3];
    let _e293 = textureSampleBias(f_t3_, samplerf_s3_, _e280.xy, (_e285.x + _e290.x));
    u_xlat4_ = _e293;
    let _e295 = u_xlat1_;
    let _e297 = u_xlat4_;
    u_xlat1_.x = (_e295.x * _e297.w);
    let _e300 = u_xlat10_;
    let _e302 = u_xlat1_;
    let _e304 = u_xlat4_;
    let _e306 = (_e302.xx * _e304.xy);
    u_xlat10_.x = _e306.x;
    u_xlat10_.y = _e306.y;
    let _e311 = u_xlat10_;
    let _e313 = u_xlat10_;
    let _e318 = _f_buffer1_.f_cb1_[20];
    let _e320 = (_e313.xy * _e318.xy);
    u_xlat10_.x = _e320.x;
    u_xlat10_.y = _e320.y;
    let _e325 = u_xlat10_;
    let _e327 = u_xlat1_;
    let _e329 = u_xlat10_;
    let _e331 = (_e327.xx * _e329.xy);
    u_xlat10_.x = _e331.x;
    u_xlat10_.y = _e331.y;
    let _e336 = u_xlat2_;
    let _e338 = u_xlat4_;
    let _e343 = _f_buffer1_.f_cb1_[20];
    let _e345 = (_e338.xy * _e343.zw);
    u_xlat2_.x = _e345.x;
    u_xlat2_.y = _e345.y;
    let _e350 = u_xlat18_;
    let _e352 = u_xlat2_;
    let _e354 = u_xlat1_;
    let _e357 = u_xlat18_;
    let _e359 = ((_e352.xy * _e354.xx) + _e357.xy);
    u_xlat18_.x = _e359.x;
    u_xlat18_.y = _e359.y;
    let _e364 = u_xlat18_;
    let _e366 = u_xlat18_;
    let _e372 = vs_TEXCOORD0_1;
    let _e374 = ((_e366.xy * vec2<f32>(0.001f, 0.001f)) + _e372.zw);
    u_xlat18_.x = _e374.x;
    u_xlat18_.y = _e374.y;
    let _e379 = u_xlat18_;
    let _e384 = _f_buffer0_.f_cb0_[4];
    let _e389 = hscard_bias.values[2];
    let _e392 = textureSampleBias(f_t2_, samplerf_s2_, _e379.xy, (_e384.x + _e389.x));
    u_xlat5_ = _e392;
    let _e394 = u_xlat0_;
    let _e396 = u_xlat5_;
    u_xlat0_.x = (_e394.x * _e396.w);
    let _e399 = u_xlat18_;
    let _e401 = u_xlat5_;
    let _e406 = _f_buffer1_.f_cb1_[8];
    let _e408 = (_e401.xy * _e406.xy);
    u_xlat18_.x = _e408.x;
    u_xlat18_.y = _e408.y;
    let _e413 = u_xlat18_;
    let _e415 = u_xlat18_;
    let _e417 = u_xlat0_;
    let _e420 = u_xlat10_;
    let _e422 = ((_e415.xy * _e417.xx) + _e420.xy);
    u_xlat18_.x = _e422.x;
    u_xlat18_.y = _e422.y;
    let _e427 = u_xlat18_;
    let _e429 = u_xlat2_;
    let _e431 = u_xlat9_;
    let _e434 = u_xlat18_;
    let _e436 = ((_e429.zw * vec2(_e431)) + _e434.xy);
    u_xlat18_.x = _e436.x;
    u_xlat18_.y = _e436.y;
    let _e441 = u_xlat18_;
    let _e443 = u_xlat18_;
    let _e449 = vs_TEXCOORD0_1;
    let _e451 = ((_e443.xy * vec2<f32>(0.001f, 0.001f)) + _e449.xy);
    u_xlat18_.x = _e451.x;
    u_xlat18_.y = _e451.y;
    let _e456 = u_xlat18_;
    let _e461 = _f_buffer0_.f_cb0_[4];
    let _e466 = hscard_bias.values[0];
    let _e469 = textureSampleBias(f_t0_, samplerf_s0_, _e456.xy, (_e461.x + _e466.x));
    u_xlat2_ = _e469;
    let _e473 = _f_buffer1_.f_cb1_[3];
    let _e478 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = (_e473.wwww * _e478);
    let _e480 = u_xlat5_;
    let _e481 = u_xlat6_;
    let _e483 = u_xlat2_;
    u_xlat7_ = ((_e480 * _e481) + -(_e483));
    let _e486 = u_xlat5_;
    let _e487 = u_xlat6_;
    u_xlat8_ = (_e486 * _e487);
    let _e489 = u_xlat5_;
    let _e491 = u_xlat6_;
    u_xlat5_ = ((-(_e489) * _e491) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e500 = u_xlat8_;
    let _e505 = _f_buffer1_.f_cb1_[7];
    u_xlat18_.x = (_e500.w * _e505.w);
    let _e509 = u_xlat18_;
    u_xlat18_.x = clamp(_e509.x, 0f, 1f);
    let _e514 = u_xlat18_;
    let _e516 = u_xlat7_;
    let _e518 = u_xlat2_;
    u_xlat6_ = ((_e514.xxxx * _e516) + _e518);
    let _e520 = u_xlatb18_;
    let _e530 = _f_buffer1_.f_cb1_[7];
    let _e533 = (vec4<f32>(0f, 0f, 0f, 0f) < _e530.wzwz).xy;
    u_xlatb18_.x = _e533.x;
    u_xlatb18_.y = _e533.y;
    let _e538 = u_xlatb18_;
    if _e538.x {
        let _e540 = u_xlat6_;
        local = _e540;
    } else {
        let _e541 = u_xlat2_;
        local = _e541;
    }
    let _e543 = local;
    u_xlat6_ = _e543;
    let _e544 = u_xlat8_;
    let _e545 = u_xlat6_;
    u_xlat7_ = (_e544 * _e545);
    let _e547 = u_xlat7_;
    let _e551 = _f_buffer1_.f_cb1_[7];
    let _e554 = u_xlat6_;
    u_xlat6_ = ((_e547 * _e551.yyyy) + _e554);
    let _e556 = u_xlat8_;
    let _e560 = _f_buffer1_.f_cb1_[7];
    let _e563 = u_xlat6_;
    u_xlat6_ = ((_e556 * _e560.xxxx) + _e563);
    let _e565 = u_xlat6_;
    u_xlat7_ = (-(_e565) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e573 = u_xlat7_;
    let _e574 = u_xlat7_;
    u_xlat7_ = (_e573 + _e574);
    let _e576 = u_xlat7_;
    let _e578 = u_xlat5_;
    u_xlat5_ = ((-(_e576) * _e578) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e586 = u_xlat6_;
    let _e587 = u_xlat6_;
    u_xlat7_ = (_e586 + _e587);
    let _e589 = u_xlat7_;
    let _e591 = u_xlat8_;
    let _e593 = u_xlat5_;
    u_xlat5_ = ((-(_e589) * _e591) + _e593);
    let _e595 = u_xlat8_;
    let _e596 = u_xlat7_;
    u_xlat8_ = (_e595 * _e596);
    let _e598 = u_xlat7_;
    u_xlat7_ = floor(_e598);
    let _e600 = u_xlat7_;
    u_xlat7_ = min(_e600, vec4<f32>(1f, 1f, 1f, 1f));
    let _e607 = u_xlat7_;
    let _e608 = u_xlat5_;
    let _e610 = u_xlat8_;
    u_xlat5_ = ((_e607 * _e608) + _e610);
    let _e612 = u_xlat2_;
    let _e614 = u_xlat5_;
    u_xlat5_ = (-(_e612) + _e614);
    let _e619 = _f_buffer1_.f_cb1_[7];
    let _e621 = u_xlat5_;
    let _e623 = u_xlat2_;
    u_xlat5_ = ((_e619.zzzz * _e621) + _e623);
    let _e625 = u_xlatb18_;
    if _e625.y {
        let _e627 = u_xlat5_;
        local_1 = _e627;
    } else {
        let _e628 = u_xlat6_;
        local_1 = _e628;
    }
    let _e630 = local_1;
    u_xlat5_ = _e630;
    let _e631 = u_xlat2_;
    let _e633 = u_xlat5_;
    u_xlat5_ = (-(_e631) + _e633);
    let _e635 = u_xlat0_;
    let _e637 = u_xlat5_;
    let _e639 = u_xlat2_;
    u_xlat2_ = ((_e635.xxxx * _e637) + _e639);
    let _e644 = _f_buffer1_.f_cb1_[15];
    let _e649 = _f_buffer1_.f_cb1_[15];
    u_xlat5_ = (_e644.wwww * _e649);
    let _e651 = u_xlat4_;
    let _e652 = u_xlat5_;
    let _e654 = u_xlat2_;
    u_xlat6_ = ((_e651 * _e652) + -(_e654));
    let _e657 = u_xlat4_;
    let _e658 = u_xlat5_;
    u_xlat7_ = (_e657 * _e658);
    let _e660 = u_xlat4_;
    let _e662 = u_xlat5_;
    u_xlat4_ = ((-(_e660) * _e662) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e671 = u_xlat7_;
    let _e676 = _f_buffer1_.f_cb1_[19];
    u_xlat0_.x = (_e671.w * _e676.w);
    let _e680 = u_xlat0_;
    u_xlat0_.x = clamp(_e680.x, 0f, 1f);
    let _e685 = u_xlat0_;
    let _e687 = u_xlat6_;
    let _e689 = u_xlat2_;
    u_xlat5_ = ((_e685.xxxx * _e687) + _e689);
    let _e691 = u_xlatb0_;
    let _e701 = _f_buffer1_.f_cb1_[19];
    let _e704 = (vec4<f32>(0f, 0f, 0f, 0f) < _e701.wwzw).xz;
    u_xlatb0_.x = _e704.x;
    u_xlatb0_.z = _e704.y;
    let _e709 = u_xlatb0_;
    if _e709.x {
        let _e711 = u_xlat5_;
        local_2 = _e711;
    } else {
        let _e712 = u_xlat2_;
        local_2 = _e712;
    }
    let _e714 = local_2;
    u_xlat5_ = _e714;
    let _e715 = u_xlat7_;
    let _e716 = u_xlat5_;
    u_xlat6_ = (_e715 * _e716);
    let _e718 = u_xlat6_;
    let _e722 = _f_buffer1_.f_cb1_[19];
    let _e725 = u_xlat5_;
    u_xlat5_ = ((_e718 * _e722.yyyy) + _e725);
    let _e727 = u_xlat7_;
    let _e731 = _f_buffer1_.f_cb1_[19];
    let _e734 = u_xlat5_;
    u_xlat5_ = ((_e727 * _e731.xxxx) + _e734);
    let _e736 = u_xlat5_;
    u_xlat6_ = (-(_e736) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e744 = u_xlat6_;
    let _e745 = u_xlat6_;
    u_xlat6_ = (_e744 + _e745);
    let _e747 = u_xlat6_;
    let _e749 = u_xlat4_;
    u_xlat4_ = ((-(_e747) * _e749) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e757 = u_xlat5_;
    let _e758 = u_xlat5_;
    u_xlat6_ = (_e757 + _e758);
    let _e760 = u_xlat6_;
    let _e762 = u_xlat7_;
    let _e764 = u_xlat4_;
    u_xlat4_ = ((-(_e760) * _e762) + _e764);
    let _e766 = u_xlat7_;
    let _e767 = u_xlat6_;
    u_xlat7_ = (_e766 * _e767);
    let _e769 = u_xlat6_;
    u_xlat6_ = floor(_e769);
    let _e771 = u_xlat6_;
    u_xlat6_ = min(_e771, vec4<f32>(1f, 1f, 1f, 1f));
    let _e778 = u_xlat6_;
    let _e779 = u_xlat4_;
    let _e781 = u_xlat7_;
    u_xlat4_ = ((_e778 * _e779) + _e781);
    let _e783 = u_xlat2_;
    let _e785 = u_xlat4_;
    u_xlat4_ = (-(_e783) + _e785);
    let _e790 = _f_buffer1_.f_cb1_[19];
    let _e792 = u_xlat4_;
    let _e794 = u_xlat2_;
    u_xlat4_ = ((_e790.zzzz * _e792) + _e794);
    let _e796 = u_xlatb0_;
    if _e796.z {
        let _e798 = u_xlat4_;
        local_3 = _e798;
    } else {
        let _e799 = u_xlat5_;
        local_3 = _e799;
    }
    let _e801 = local_3;
    u_xlat4_ = _e801;
    let _e802 = u_xlat2_;
    let _e804 = u_xlat4_;
    u_xlat4_ = (-(_e802) + _e804);
    let _e806 = u_xlat1_;
    let _e808 = u_xlat4_;
    let _e810 = u_xlat2_;
    u_xlat1_ = ((_e806.xxxx * _e808) + _e810);
    let _e815 = _f_buffer1_.f_cb1_[28];
    let _e820 = _f_buffer1_.f_cb1_[28];
    u_xlat2_ = (_e815.wwww * _e820);
    let _e822 = u_xlat3_;
    let _e823 = u_xlat2_;
    let _e825 = u_xlat1_;
    u_xlat4_ = ((_e822 * _e823) + -(_e825));
    let _e828 = u_xlat2_;
    let _e829 = u_xlat3_;
    u_xlat5_ = (_e828 * _e829);
    let _e831 = u_xlat3_;
    let _e833 = u_xlat2_;
    u_xlat2_ = ((-(_e831) * _e833) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e842 = u_xlat5_;
    let _e847 = _f_buffer1_.f_cb1_[32];
    u_xlat0_.x = (_e842.w * _e847.w);
    let _e851 = u_xlat0_;
    u_xlat0_.x = clamp(_e851.x, 0f, 1f);
    let _e856 = u_xlat0_;
    let _e858 = u_xlat4_;
    let _e860 = u_xlat1_;
    u_xlat3_ = ((_e856.xxxx * _e858) + _e860);
    let _e862 = u_xlatb0_;
    let _e872 = _f_buffer1_.f_cb1_[32];
    let _e875 = (vec4<f32>(0f, 0f, 0f, 0f) < _e872.wwzw).xz;
    u_xlatb0_.x = _e875.x;
    u_xlatb0_.z = _e875.y;
    let _e880 = u_xlatb0_;
    if _e880.x {
        let _e882 = u_xlat3_;
        local_4 = _e882;
    } else {
        let _e883 = u_xlat1_;
        local_4 = _e883;
    }
    let _e885 = local_4;
    u_xlat3_ = _e885;
    let _e886 = u_xlat5_;
    let _e887 = u_xlat3_;
    u_xlat4_ = (_e886 * _e887);
    let _e889 = u_xlat4_;
    let _e893 = _f_buffer1_.f_cb1_[32];
    let _e896 = u_xlat3_;
    u_xlat3_ = ((_e889 * _e893.yyyy) + _e896);
    let _e898 = u_xlat5_;
    let _e902 = _f_buffer1_.f_cb1_[32];
    let _e905 = u_xlat3_;
    u_xlat3_ = ((_e898 * _e902.xxxx) + _e905);
    let _e907 = u_xlat3_;
    u_xlat4_ = (-(_e907) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e915 = u_xlat4_;
    let _e916 = u_xlat4_;
    u_xlat4_ = (_e915 + _e916);
    let _e918 = u_xlat4_;
    let _e920 = u_xlat2_;
    u_xlat2_ = ((-(_e918) * _e920) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e928 = u_xlat3_;
    let _e929 = u_xlat3_;
    u_xlat4_ = (_e928 + _e929);
    let _e931 = u_xlat4_;
    let _e933 = u_xlat5_;
    let _e935 = u_xlat2_;
    u_xlat2_ = ((-(_e931) * _e933) + _e935);
    let _e937 = u_xlat5_;
    let _e938 = u_xlat4_;
    u_xlat5_ = (_e937 * _e938);
    let _e940 = u_xlat4_;
    u_xlat4_ = floor(_e940);
    let _e942 = u_xlat4_;
    u_xlat4_ = min(_e942, vec4<f32>(1f, 1f, 1f, 1f));
    let _e949 = u_xlat4_;
    let _e950 = u_xlat2_;
    let _e952 = u_xlat5_;
    u_xlat2_ = ((_e949 * _e950) + _e952);
    let _e954 = u_xlat1_;
    let _e956 = u_xlat2_;
    u_xlat2_ = (-(_e954) + _e956);
    let _e961 = _f_buffer1_.f_cb1_[32];
    let _e963 = u_xlat2_;
    let _e965 = u_xlat1_;
    u_xlat2_ = ((_e961.zzzz * _e963) + _e965);
    let _e967 = u_xlatb0_;
    if _e967.z {
        let _e969 = u_xlat2_;
        local_5 = _e969;
    } else {
        let _e970 = u_xlat3_;
        local_5 = _e970;
    }
    let _e972 = local_5;
    u_xlat2_ = _e972;
    let _e973 = u_xlat1_;
    let _e975 = u_xlat2_;
    u_xlat2_ = (-(_e973) + _e975);
    let _e977 = u_xlat9_;
    let _e979 = u_xlat2_;
    let _e981 = u_xlat1_;
    u_xlat0_ = ((vec4(_e977) * _e979) + _e981);
    let _e983 = u_xlat0_;
    u_xlat0_ = clamp(_e983, vec4(0f), vec4(1f));
    let _e989 = u_xlat0_;
    let _e990 = vs_COLOR0_1;
    u_xlat1_ = (_e989 * _e990);
    let _e992 = u_xlat0_;
    let _e993 = u_xlat1_;
    SV_Target0_ = min(_e992, _e993);
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
