struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 68>,
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
@group(3) @binding(15) 
var samplerf_s7_: sampler;
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
@group(3) @binding(14) 
var f_t7_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb4_: vec4<bool> = vec4(false);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec2<bool> = vec2(false);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat9_: vec4<f32> = vec4(0f);
    var u_xlat10_: vec4<f32> = vec4(0f);
    var u_xlat11_: vec4<f32> = vec4(0f);
    var u_xlat12_: vec4<f32> = vec4(0f);
    var u_xlat13_: vec4<f32> = vec4(0f);
    var u_xlat14_: vec4<f32> = vec4(0f);
    var u_xlat15_: vec4<f32> = vec4(0f);
    var u_xlat16_: vec4<f32> = vec4(0f);
    var u_xlat17_: vec4<f32> = vec4(0f);
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlatb18_: vec2<bool> = vec2(false);
    var u_xlat20_: vec2<f32> = vec2(0f);
    var u_xlatb20_: vec2<bool> = vec2(false);
    var u_xlat21_: f32 = 0f;
    var u_xlat36_: f32 = 0f;
    var u_xlat38_: vec2<f32> = vec2(0f);
    var u_xlatb38_: vec2<bool> = vec2(false);
    var u_xlat39_: f32 = 0f;
    var u_xlat40_: f32 = 0f;
    var u_xlat54_: f32 = 0f;
    var u_xlat56_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec2<f32>;
    var local_4: vec2<f32>;
    var local_5: vec2<f32>;
    var local_6: f32;
    var local_7: vec4<f32>;
    var local_8: vec4<f32>;
    var local_9: vec4<f32>;
    var local_10: vec4<f32>;
    var local_11: vec4<f32>;
    var local_12: vec4<f32>;
    var local_13: vec4<f32>;
    var local_14: vec4<f32>;
    var local_15: vec4<f32>;
    var local_16: vec4<f32>;
    var local_17: vec4<f32>;
    var local_18: vec4<f32>;
    var local_19: vec4<f32>;
    var local_20: vec4<f32>;
    var local_21: vec4<f32>;
    var local_22: vec4<f32>;

    let _e153 = _f_buffer1_.f_cb1_[67];
    u_xlatb0_ = (_e153.z == 10f);
    let _e157 = u_xlatb0_;
    if _e157 {
        {
            let _e158 = vs_COLOR0_1;
            SV_Target0_ = _e158;
            return;
        }
    }
    let _e159 = vs_TEXCOORD0_1;
    let _e164 = _f_buffer0_.f_cb0_[4];
    let _e169 = hscard_bias.values[1];
    let _e172 = textureSampleBias(f_t1_, samplerf_s1_, _e159.xy, (_e164.x + _e169.x));
    u_xlat0_ = _e172;
    let _e173 = vs_TEXCOORD2_1;
    let _e178 = _f_buffer0_.f_cb0_[4];
    let _e183 = hscard_bias.values[7];
    let _e186 = textureSampleBias(f_t7_, samplerf_s7_, _e173.zw, (_e178.x + _e183.x));
    u_xlat1_ = _e186;
    let _e187 = u_xlat0_;
    let _e191 = _f_buffer1_.f_cb1_[53];
    u_xlat2_ = dot(_e187, _e191);
    let _e193 = u_xlat2_;
    u_xlat2_ = min(_e193, 1f);
    let _e196 = u_xlat1_;
    let _e198 = u_xlat2_;
    u_xlat2_ = (_e196.w * _e198);
    let _e200 = u_xlat1_;
    let _e202 = u_xlat2_;
    u_xlat3_ = (_e200.xyxy * vec4(_e202));
    let _e205 = u_xlat3_;
    let _e209 = _f_buffer1_.f_cb1_[59];
    u_xlat3_ = (_e205 * _e209.zwxy);
    let _e212 = u_xlat2_;
    let _e214 = u_xlat3_;
    u_xlat3_ = (vec4(_e212) * _e214);
    let _e219 = _f_buffer1_.f_cb1_[67];
    u_xlatb4_ = (_e219.zzzz == vec4<f32>(15f, 14f, 13f, 12f));
    let _e227 = u_xlatb4_;
    if _e227.x {
        local = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e234 = u_xlat3_;
        local = _e234;
    }
    let _e236 = local;
    u_xlat3_ = _e236;
    let _e237 = u_xlat20_;
    let _e239 = u_xlat3_;
    let _e245 = vs_TEXCOORD2_1;
    let _e247 = ((_e239.xy * vec2<f32>(0.001f, 0.001f)) + _e245.xy);
    u_xlat20_.x = _e247.x;
    u_xlat20_.y = _e247.y;
    let _e252 = u_xlat20_;
    let _e257 = _f_buffer0_.f_cb0_[4];
    let _e262 = hscard_bias.values[6];
    let _e265 = textureSampleBias(f_t6_, samplerf_s6_, _e252.xy, (_e257.x + _e262.x));
    u_xlat5_ = _e265;
    let _e270 = _f_buffer1_.f_cb1_[52];
    let _e275 = _f_buffer1_.f_cb1_[52];
    u_xlat20_.x = (_e270.y + _e275.x);
    let _e279 = u_xlat20_;
    u_xlat6_.x = sin(_e279.x);
    let _e283 = u_xlat20_;
    u_xlat7_.x = cos(_e283.x);
    let _e287 = u_xlat6_;
    u_xlat8_.x = -(_e287.x);
    let _e290 = u_xlat20_;
    let _e295 = _f_buffer1_.f_cb1_[50];
    let _e301 = _f_buffer1_.f_cb1_[52];
    let _e303 = (-(_e295.xy) + _e301.zw);
    u_xlat20_.x = _e303.x;
    u_xlat20_.y = _e303.y;
    let _e308 = u_xlat5_;
    let _e310 = u_xlat20_;
    let _e313 = u_xlat5_;
    let _e315 = (-(_e310.xy) + _e313.xy);
    u_xlat5_.x = _e315.x;
    u_xlat5_.y = _e315.y;
    let _e321 = u_xlat7_;
    u_xlat8_.y = _e321.x;
    let _e324 = u_xlat6_;
    u_xlat8_.z = _e324.x;
    let _e327 = u_xlat5_;
    let _e329 = u_xlat8_;
    u_xlat6_.x = dot(_e327.xy, _e329.yz);
    let _e333 = u_xlat5_;
    let _e335 = u_xlat8_;
    u_xlat6_.y = dot(_e333.xy, _e335.xy);
    let _e338 = u_xlat20_;
    let _e340 = u_xlat20_;
    let _e342 = u_xlat6_;
    let _e344 = (_e340.xy + _e342.xy);
    u_xlat20_.x = _e344.x;
    u_xlat20_.y = _e344.y;
    let _e349 = u_xlat5_;
    let _e354 = _f_buffer1_.f_cb1_[50];
    let _e360 = _f_buffer1_.f_cb1_[51];
    let _e362 = (-(_e354.xy) + _e360.zw);
    u_xlat5_.x = _e362.x;
    u_xlat5_.y = _e362.y;
    let _e367 = u_xlat20_;
    let _e369 = u_xlat20_;
    let _e371 = u_xlat5_;
    let _e374 = (_e369.xy + -(_e371.xy));
    u_xlat20_.x = _e374.x;
    u_xlat20_.y = _e374.y;
    let _e379 = u_xlat20_;
    let _e381 = u_xlat20_;
    let _e386 = _f_buffer1_.f_cb1_[51];
    let _e389 = u_xlat5_;
    let _e391 = ((_e381.xy * _e386.xy) + _e389.xy);
    u_xlat20_.x = _e391.x;
    u_xlat20_.y = _e391.y;
    let _e396 = u_xlat5_;
    let _e401 = _f_buffer1_.f_cb1_[50];
    let _e406 = _f_buffer1_.f_cb1_[50];
    let _e408 = (_e401.zw + _e406.xy);
    u_xlat5_.x = _e408.x;
    u_xlat5_.y = _e408.y;
    let _e413 = u_xlat20_;
    let _e415 = u_xlat20_;
    let _e417 = u_xlat5_;
    let _e419 = (_e415.xy + _e417.xy);
    u_xlat20_.x = _e419.x;
    u_xlat20_.y = _e419.y;
    let _e424 = u_xlat20_;
    let _e429 = _f_buffer0_.f_cb0_[4];
    let _e434 = hscard_bias.values[5];
    let _e437 = textureSampleBias(f_t5_, samplerf_s5_, _e424.xy, (_e429.x + _e434.x));
    u_xlat6_ = _e437;
    let _e439 = u_xlat5_;
    let _e441 = u_xlat6_;
    u_xlat6_.w = (_e439.z * _e441.w);
    let _e445 = u_xlat0_;
    let _e449 = _f_buffer1_.f_cb1_[40];
    u_xlat20_.x = dot(_e445, _e449);
    let _e452 = u_xlat20_;
    u_xlat20_.x = min(_e452.x, 1f);
    let _e457 = u_xlat20_;
    let _e459 = u_xlat6_;
    u_xlat20_.x = (_e457.x * _e459.w);
    let _e462 = u_xlat20_;
    let _e464 = u_xlat6_;
    u_xlat5_ = (_e462.xxxx * _e464.xyxy);
    let _e467 = u_xlat5_;
    let _e471 = _f_buffer1_.f_cb1_[46];
    u_xlat5_ = (_e467 * _e471.zwxy);
    let _e474 = u_xlat20_;
    let _e476 = u_xlat5_;
    u_xlat5_ = (_e474.xxxx * _e476);
    let _e478 = u_xlatb4_;
    if _e478.y {
        local_1 = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e485 = u_xlat5_;
        local_1 = _e485;
    }
    let _e487 = local_1;
    u_xlat5_ = _e487;
    let _e488 = u_xlat38_;
    let _e490 = u_xlat3_;
    let _e492 = u_xlat5_;
    let _e494 = (_e490.xy + _e492.xy);
    u_xlat38_.x = _e494.x;
    u_xlat38_.y = _e494.y;
    let _e499 = u_xlat3_;
    let _e501 = u_xlat38_;
    let _e507 = vs_TEXCOORD1_1;
    let _e509 = ((_e501.xy * vec2<f32>(0.001f, 0.001f)) + _e507.zw);
    u_xlat3_.x = _e509.x;
    u_xlat3_.y = _e509.y;
    let _e514 = u_xlat3_;
    let _e519 = _f_buffer0_.f_cb0_[4];
    let _e524 = hscard_bias.values[4];
    let _e527 = textureSampleBias(f_t4_, samplerf_s4_, _e514.xy, (_e519.x + _e524.x));
    u_xlat7_ = _e527;
    let _e529 = u_xlat0_;
    let _e533 = _f_buffer1_.f_cb1_[27];
    u_xlat3_.x = dot(_e529, _e533);
    let _e536 = u_xlat3_;
    u_xlat3_.x = min(_e536.x, 1f);
    let _e541 = u_xlat3_;
    let _e543 = u_xlat7_;
    u_xlat3_.x = (_e541.x * _e543.w);
    let _e546 = u_xlat3_;
    let _e548 = u_xlat7_;
    u_xlat8_ = (_e546.xxxx * _e548.xyxy);
    let _e551 = u_xlat8_;
    let _e555 = _f_buffer1_.f_cb1_[33];
    u_xlat8_ = (_e551 * _e555.zwxy);
    let _e558 = u_xlat3_;
    let _e560 = u_xlat8_;
    u_xlat8_ = (_e558.xxxx * _e560);
    let _e562 = u_xlatb4_;
    if _e562.z {
        local_2 = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e569 = u_xlat8_;
        local_2 = _e569;
    }
    let _e571 = local_2;
    u_xlat8_ = _e571;
    let _e572 = u_xlat38_;
    let _e574 = u_xlat38_;
    let _e576 = u_xlat8_;
    let _e578 = (_e574.xy + _e576.xy);
    u_xlat38_.x = _e578.x;
    u_xlat38_.y = _e578.y;
    let _e583 = u_xlat5_;
    let _e585 = u_xlat38_;
    let _e591 = vs_TEXCOORD1_1;
    let _e593 = ((_e585.xy * vec2<f32>(0.001f, 0.001f)) + _e591.xy);
    u_xlat5_.x = _e593.x;
    u_xlat5_.y = _e593.y;
    let _e598 = u_xlat5_;
    let _e603 = _f_buffer0_.f_cb0_[4];
    let _e608 = hscard_bias.values[3];
    let _e611 = textureSampleBias(f_t3_, samplerf_s3_, _e598.xy, (_e603.x + _e608.x));
    u_xlat9_ = _e611;
    let _e612 = u_xlat0_;
    let _e616 = _f_buffer1_.f_cb1_[14];
    u_xlat21_ = dot(_e612, _e616);
    let _e618 = u_xlat21_;
    u_xlat21_ = min(_e618, 1f);
    let _e621 = u_xlat21_;
    let _e622 = u_xlat9_;
    u_xlat21_ = (_e621 * _e622.w);
    let _e625 = u_xlat5_;
    let _e627 = u_xlat21_;
    let _e629 = u_xlat9_;
    let _e631 = (vec2(_e627) * _e629.xy);
    u_xlat5_.x = _e631.x;
    u_xlat5_.y = _e631.y;
    let _e636 = u_xlat8_;
    let _e638 = u_xlat9_;
    let _e643 = _f_buffer1_.f_cb1_[20];
    let _e645 = (_e638.xy * _e643.zw);
    u_xlat8_.x = _e645.x;
    u_xlat8_.y = _e645.y;
    let _e650 = u_xlat8_;
    let _e652 = u_xlat21_;
    let _e654 = u_xlat8_;
    let _e656 = (vec2(_e652) * _e654.xy);
    u_xlat8_.x = _e656.x;
    u_xlat8_.y = _e656.y;
    let _e661 = u_xlat8_;
    let _e663 = u_xlatb4_;
    if _e663.w {
        local_3 = vec2<f32>(0f, 0f);
    } else {
        let _e668 = u_xlat8_;
        local_3 = _e668.xy;
    }
    let _e671 = local_3;
    u_xlat8_.x = _e671.x;
    u_xlat8_.y = _e671.y;
    let _e676 = u_xlat38_;
    let _e678 = u_xlat38_;
    let _e680 = u_xlat8_;
    let _e682 = (_e678.xy + _e680.xy);
    u_xlat38_.x = _e682.x;
    u_xlat38_.y = _e682.y;
    let _e687 = u_xlat38_;
    let _e689 = u_xlat38_;
    let _e695 = vs_TEXCOORD0_1;
    let _e697 = ((_e689.xy * vec2<f32>(0.001f, 0.001f)) + _e695.zw);
    u_xlat38_.x = _e697.x;
    u_xlat38_.y = _e697.y;
    let _e702 = u_xlat38_;
    let _e707 = _f_buffer0_.f_cb0_[4];
    let _e712 = hscard_bias.values[2];
    let _e715 = textureSampleBias(f_t2_, samplerf_s2_, _e702.xy, (_e707.x + _e712.x));
    u_xlat10_ = _e715;
    let _e717 = u_xlat0_;
    let _e721 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = dot(_e717, _e721);
    let _e724 = u_xlat0_;
    u_xlat0_.x = min(_e724.x, 1f);
    let _e729 = u_xlat0_;
    let _e731 = u_xlat10_;
    u_xlat0_.x = (_e729.x * _e731.w);
    let _e734 = u_xlat18_;
    let _e736 = u_xlat10_;
    let _e741 = _f_buffer1_.f_cb1_[8];
    let _e743 = (_e736.xy * _e741.xy);
    u_xlat18_.x = _e743.x;
    u_xlat18_.y = _e743.y;
    let _e748 = u_xlat18_;
    let _e750 = u_xlat0_;
    let _e752 = u_xlat18_;
    let _e754 = (_e750.xx * _e752.xy);
    u_xlat18_.x = _e754.x;
    u_xlat18_.y = _e754.y;
    let _e759 = u_xlat38_;
    let _e761 = u_xlat5_;
    let _e766 = _f_buffer1_.f_cb1_[20];
    let _e768 = (_e761.xy * _e766.xy);
    u_xlat38_.x = _e768.x;
    u_xlat38_.y = _e768.y;
    let _e773 = u_xlat38_;
    let _e775 = u_xlat21_;
    let _e777 = u_xlat38_;
    let _e779 = (vec2(_e775) * _e777.xy);
    u_xlat38_.x = _e779.x;
    u_xlat38_.y = _e779.y;
    let _e784 = u_xlatb5_;
    let _e789 = _f_buffer1_.f_cb1_[67];
    let _e797 = (_e789.zzzz == vec4<f32>(11f, 1f, 0f, 0f)).xy;
    u_xlatb5_.x = _e797.x;
    u_xlatb5_.y = _e797.y;
    let _e802 = u_xlat18_;
    let _e804 = u_xlatb5_;
    if _e804.x {
        local_4 = vec2<f32>(0f, 0f);
    } else {
        let _e809 = u_xlat18_;
        local_4 = _e809.xy;
    }
    let _e812 = local_4;
    u_xlat18_.x = _e812.x;
    u_xlat18_.y = _e812.y;
    let _e817 = u_xlat38_;
    let _e819 = u_xlatb4_;
    if _e819.w {
        local_5 = vec2<f32>(0f, 0f);
    } else {
        let _e824 = u_xlat38_;
        local_5 = _e824.xy;
    }
    let _e827 = local_5;
    u_xlat38_.x = _e827.x;
    u_xlat38_.y = _e827.y;
    let _e832 = u_xlat18_;
    let _e834 = u_xlat18_;
    let _e836 = u_xlat38_;
    let _e838 = (_e834.xy + _e836.xy);
    u_xlat18_.x = _e838.x;
    u_xlat18_.y = _e838.y;
    let _e843 = u_xlat18_;
    let _e845 = u_xlat8_;
    let _e847 = u_xlat18_;
    let _e849 = (_e845.zw + _e847.xy);
    u_xlat18_.x = _e849.x;
    u_xlat18_.y = _e849.y;
    let _e854 = u_xlat18_;
    let _e856 = u_xlat5_;
    let _e858 = u_xlat18_;
    let _e860 = (_e856.zw + _e858.xy);
    u_xlat18_.x = _e860.x;
    u_xlat18_.y = _e860.y;
    let _e865 = u_xlat18_;
    let _e867 = u_xlat3_;
    let _e869 = u_xlat18_;
    let _e871 = (_e867.zw + _e869.xy);
    u_xlat18_.x = _e871.x;
    u_xlat18_.y = _e871.y;
    let _e876 = u_xlat18_;
    let _e878 = u_xlat18_;
    let _e884 = vs_TEXCOORD0_1;
    let _e886 = ((_e878.xy * vec2<f32>(0.001f, 0.001f)) + _e884.xy);
    u_xlat18_.x = _e886.x;
    u_xlat18_.y = _e886.y;
    let _e891 = u_xlat18_;
    let _e896 = _f_buffer0_.f_cb0_[4];
    let _e901 = hscard_bias.values[0];
    let _e904 = textureSampleBias(f_t0_, samplerf_s0_, _e891.xy, (_e896.x + _e901.x));
    u_xlat8_ = _e904;
    let _e910 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (0f < _e910.z);
    let _e913 = u_xlat8_;
    u_xlat36_ = dot(_e913, vec4<f32>(0.1f, 0.1f, 0.1f, 0.1f));
    let _e921 = u_xlatb18_;
    if _e921.x {
        let _e923 = u_xlat36_;
        local_6 = _e923;
    } else {
        local_6 = 0f;
    }
    let _e927 = local_6;
    u_xlat11_.x = _e927;
    let _e928 = u_xlatb5_;
    if _e928.y {
        {
            let _e930 = u_xlat10_;
            let _e931 = u_xlat0_;
            let _e934 = u_xlat10_;
            u_xlat12_ = ((_e930 * _e931.xxxx) + -(_e934));
            let _e940 = _f_buffer1_.f_cb1_[67];
            let _e942 = u_xlat12_;
            let _e944 = u_xlat10_;
            u_xlat12_ = ((_e940.wwww * _e942) + _e944);
            u_xlat11_.y = 1f;
            let _e948 = u_xlat12_;
            let _e952 = _f_buffer1_.f_cb1_[3];
            let _e954 = u_xlat11_;
            SV_Target0_ = ((_e948 * _e952) + _e954.xxxy);
            return;
        }
    }
    let _e961 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e961.z == 2f);
    let _e965 = u_xlatb18_;
    if _e965.x {
        {
            let _e967 = u_xlat9_;
            let _e968 = u_xlat21_;
            let _e971 = u_xlat9_;
            u_xlat12_ = ((_e967 * vec4(_e968)) + -(_e971));
            let _e977 = _f_buffer1_.f_cb1_[67];
            let _e979 = u_xlat12_;
            let _e981 = u_xlat9_;
            u_xlat12_ = ((_e977.wwww * _e979) + _e981);
            u_xlat11_.z = 1f;
            let _e985 = u_xlat12_;
            let _e989 = _f_buffer1_.f_cb1_[15];
            let _e991 = u_xlat11_;
            SV_Target0_ = ((_e985 * _e989) + _e991.xxxz);
            return;
        }
    }
    let _e998 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e998.z == 3f);
    let _e1002 = u_xlatb18_;
    if _e1002.x {
        {
            let _e1004 = u_xlat7_;
            let _e1005 = u_xlat3_;
            let _e1008 = u_xlat7_;
            u_xlat12_ = ((_e1004 * _e1005.xxxx) + -(_e1008));
            let _e1014 = _f_buffer1_.f_cb1_[67];
            let _e1016 = u_xlat12_;
            let _e1018 = u_xlat7_;
            u_xlat12_ = ((_e1014.wwww * _e1016) + _e1018);
            u_xlat11_.w = 1f;
            let _e1022 = u_xlat12_;
            let _e1026 = _f_buffer1_.f_cb1_[28];
            let _e1028 = u_xlat11_;
            SV_Target0_ = ((_e1022 * _e1026) + _e1028.xxxw);
            return;
        }
    }
    let _e1035 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e1035.z == 4f);
    let _e1039 = u_xlatb18_;
    if _e1039.x {
        {
            let _e1041 = u_xlat6_;
            let _e1042 = u_xlat20_;
            let _e1045 = u_xlat6_;
            u_xlat12_ = ((_e1041 * _e1042.xxxx) + -(_e1045));
            let _e1051 = _f_buffer1_.f_cb1_[67];
            let _e1053 = u_xlat12_;
            let _e1055 = u_xlat6_;
            u_xlat12_ = ((_e1051.wwww * _e1053) + _e1055);
            u_xlat11_.w = 1f;
            let _e1059 = u_xlat12_;
            let _e1063 = _f_buffer1_.f_cb1_[41];
            let _e1065 = u_xlat11_;
            SV_Target0_ = ((_e1059 * _e1063) + _e1065.xxxw);
            return;
        }
    }
    let _e1071 = _f_buffer1_.f_cb1_[3];
    let _e1076 = _f_buffer1_.f_cb1_[3];
    u_xlat12_ = (_e1071.wwww * _e1076);
    let _e1078 = u_xlat10_;
    let _e1079 = u_xlat12_;
    u_xlat13_ = (_e1078 * _e1079);
    let _e1081 = u_xlatb18_;
    let _e1091 = _f_buffer1_.f_cb1_[7];
    let _e1094 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1091.wzww).xy;
    u_xlatb18_.x = _e1094.x;
    u_xlatb18_.y = _e1094.y;
    let _e1099 = u_xlat13_;
    let _e1104 = _f_buffer1_.f_cb1_[7];
    u_xlat54_ = (_e1099.w * _e1104.w);
    let _e1107 = u_xlat54_;
    u_xlat54_ = clamp(_e1107, 0f, 1f);
    let _e1111 = u_xlat10_;
    let _e1112 = u_xlat12_;
    let _e1114 = u_xlat8_;
    u_xlat14_ = ((_e1111 * _e1112) + -(_e1114));
    let _e1117 = u_xlat54_;
    let _e1119 = u_xlat14_;
    let _e1121 = u_xlat8_;
    u_xlat14_ = ((vec4(_e1117) * _e1119) + _e1121);
    let _e1123 = u_xlatb18_;
    if _e1123.x {
        let _e1125 = u_xlat14_;
        local_7 = _e1125;
    } else {
        let _e1126 = u_xlat8_;
        local_7 = _e1126;
    }
    let _e1128 = local_7;
    u_xlat14_ = _e1128;
    let _e1129 = u_xlat13_;
    let _e1130 = u_xlat14_;
    u_xlat15_ = (_e1129 * _e1130);
    let _e1132 = u_xlat15_;
    let _e1136 = _f_buffer1_.f_cb1_[7];
    let _e1139 = u_xlat14_;
    u_xlat14_ = ((_e1132 * _e1136.yyyy) + _e1139);
    let _e1141 = u_xlat13_;
    let _e1145 = _f_buffer1_.f_cb1_[7];
    let _e1148 = u_xlat14_;
    u_xlat14_ = ((_e1141 * _e1145.xxxx) + _e1148);
    let _e1150 = u_xlat14_;
    let _e1151 = u_xlat14_;
    u_xlat15_ = (_e1150 + _e1151);
    let _e1153 = u_xlat13_;
    let _e1154 = u_xlat15_;
    u_xlat16_ = (_e1153 * _e1154);
    let _e1156 = u_xlat14_;
    u_xlat17_ = (-(_e1156) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1164 = u_xlat17_;
    let _e1165 = u_xlat17_;
    u_xlat17_ = (_e1164 + _e1165);
    let _e1167 = u_xlat10_;
    let _e1169 = u_xlat12_;
    u_xlat10_ = ((-(_e1167) * _e1169) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1177 = u_xlat17_;
    let _e1179 = u_xlat10_;
    u_xlat10_ = ((-(_e1177) * _e1179) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1187 = u_xlat15_;
    u_xlat12_ = floor(_e1187);
    let _e1189 = u_xlat12_;
    u_xlat12_ = min(_e1189, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1196 = u_xlat15_;
    let _e1198 = u_xlat13_;
    let _e1200 = u_xlat10_;
    u_xlat10_ = ((-(_e1196) * _e1198) + _e1200);
    let _e1202 = u_xlat12_;
    let _e1203 = u_xlat10_;
    let _e1205 = u_xlat16_;
    u_xlat10_ = ((_e1202 * _e1203) + _e1205);
    let _e1207 = u_xlat8_;
    let _e1209 = u_xlat10_;
    u_xlat10_ = (-(_e1207) + _e1209);
    let _e1214 = _f_buffer1_.f_cb1_[7];
    let _e1216 = u_xlat10_;
    let _e1218 = u_xlat8_;
    u_xlat10_ = ((_e1214.zzzz * _e1216) + _e1218);
    let _e1220 = u_xlatb18_;
    if _e1220.y {
        let _e1222 = u_xlat10_;
        local_8 = _e1222;
    } else {
        let _e1223 = u_xlat14_;
        local_8 = _e1223;
    }
    let _e1225 = local_8;
    u_xlat10_ = _e1225;
    let _e1226 = u_xlat8_;
    let _e1228 = u_xlat10_;
    u_xlat10_ = (-(_e1226) + _e1228);
    let _e1230 = u_xlat0_;
    let _e1232 = u_xlat10_;
    let _e1234 = u_xlat8_;
    u_xlat0_ = ((_e1230.xxxx * _e1232) + _e1234);
    let _e1236 = u_xlatb5_;
    if _e1236.x {
        let _e1238 = u_xlat8_;
        local_9 = _e1238;
    } else {
        let _e1239 = u_xlat0_;
        local_9 = _e1239;
    }
    let _e1241 = local_9;
    u_xlat0_ = _e1241;
    let _e1245 = _f_buffer1_.f_cb1_[15];
    let _e1250 = _f_buffer1_.f_cb1_[15];
    u_xlat5_ = (_e1245.wwww * _e1250);
    let _e1252 = u_xlat5_;
    let _e1253 = u_xlat9_;
    u_xlat8_ = (_e1252 * _e1253);
    let _e1255 = u_xlatb38_;
    let _e1265 = _f_buffer1_.f_cb1_[19];
    let _e1268 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1265.wzwz).xy;
    u_xlatb38_.x = _e1268.x;
    u_xlatb38_.y = _e1268.y;
    let _e1273 = u_xlat8_;
    let _e1278 = _f_buffer1_.f_cb1_[19];
    u_xlat39_ = (_e1273.w * _e1278.w);
    let _e1281 = u_xlat39_;
    u_xlat39_ = clamp(_e1281, 0f, 1f);
    let _e1285 = u_xlat9_;
    let _e1286 = u_xlat5_;
    let _e1288 = u_xlat0_;
    u_xlat10_ = ((_e1285 * _e1286) + -(_e1288));
    let _e1291 = u_xlat39_;
    let _e1293 = u_xlat10_;
    let _e1295 = u_xlat0_;
    u_xlat10_ = ((vec4(_e1291) * _e1293) + _e1295);
    let _e1297 = u_xlatb38_;
    if _e1297.x {
        let _e1299 = u_xlat10_;
        local_10 = _e1299;
    } else {
        let _e1300 = u_xlat0_;
        local_10 = _e1300;
    }
    let _e1302 = local_10;
    u_xlat10_ = _e1302;
    let _e1303 = u_xlat8_;
    let _e1304 = u_xlat10_;
    u_xlat12_ = (_e1303 * _e1304);
    let _e1306 = u_xlat12_;
    let _e1310 = _f_buffer1_.f_cb1_[19];
    let _e1313 = u_xlat10_;
    u_xlat10_ = ((_e1306 * _e1310.yyyy) + _e1313);
    let _e1315 = u_xlat8_;
    let _e1319 = _f_buffer1_.f_cb1_[19];
    let _e1322 = u_xlat10_;
    u_xlat10_ = ((_e1315 * _e1319.xxxx) + _e1322);
    let _e1324 = u_xlat10_;
    let _e1325 = u_xlat10_;
    u_xlat12_ = (_e1324 + _e1325);
    let _e1327 = u_xlat8_;
    let _e1328 = u_xlat12_;
    u_xlat13_ = (_e1327 * _e1328);
    let _e1330 = u_xlat10_;
    u_xlat14_ = (-(_e1330) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1338 = u_xlat14_;
    let _e1339 = u_xlat14_;
    u_xlat14_ = (_e1338 + _e1339);
    let _e1341 = u_xlat9_;
    let _e1343 = u_xlat5_;
    u_xlat5_ = ((-(_e1341) * _e1343) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1351 = u_xlat14_;
    let _e1353 = u_xlat5_;
    u_xlat5_ = ((-(_e1351) * _e1353) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1361 = u_xlat12_;
    u_xlat9_ = floor(_e1361);
    let _e1363 = u_xlat9_;
    u_xlat9_ = min(_e1363, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1370 = u_xlat12_;
    let _e1372 = u_xlat8_;
    let _e1374 = u_xlat5_;
    u_xlat5_ = ((-(_e1370) * _e1372) + _e1374);
    let _e1376 = u_xlat9_;
    let _e1377 = u_xlat5_;
    let _e1379 = u_xlat13_;
    u_xlat5_ = ((_e1376 * _e1377) + _e1379);
    let _e1381 = u_xlat0_;
    let _e1383 = u_xlat5_;
    u_xlat5_ = (-(_e1381) + _e1383);
    let _e1388 = _f_buffer1_.f_cb1_[19];
    let _e1390 = u_xlat5_;
    let _e1392 = u_xlat0_;
    u_xlat5_ = ((_e1388.zzzz * _e1390) + _e1392);
    let _e1394 = u_xlatb38_;
    if _e1394.y {
        let _e1396 = u_xlat5_;
        local_11 = _e1396;
    } else {
        let _e1397 = u_xlat10_;
        local_11 = _e1397;
    }
    let _e1399 = local_11;
    u_xlat5_ = _e1399;
    let _e1400 = u_xlat0_;
    let _e1402 = u_xlat5_;
    u_xlat5_ = (-(_e1400) + _e1402);
    let _e1404 = u_xlat21_;
    let _e1406 = u_xlat5_;
    let _e1408 = u_xlat0_;
    u_xlat5_ = ((vec4(_e1404) * _e1406) + _e1408);
    let _e1410 = u_xlatb4_;
    if _e1410.w {
        let _e1412 = u_xlat0_;
        local_12 = _e1412;
    } else {
        let _e1413 = u_xlat5_;
        local_12 = _e1413;
    }
    let _e1415 = local_12;
    u_xlat0_ = _e1415;
    let _e1419 = _f_buffer1_.f_cb1_[28];
    let _e1424 = _f_buffer1_.f_cb1_[28];
    u_xlat5_ = (_e1419.wwww * _e1424);
    let _e1426 = u_xlat5_;
    let _e1427 = u_xlat7_;
    u_xlat8_ = (_e1426 * _e1427);
    let _e1429 = u_xlatb38_;
    let _e1439 = _f_buffer1_.f_cb1_[32];
    let _e1442 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1439.wzwz).xy;
    u_xlatb38_.x = _e1442.x;
    u_xlatb38_.y = _e1442.y;
    let _e1447 = u_xlat8_;
    let _e1452 = _f_buffer1_.f_cb1_[32];
    u_xlat21_ = (_e1447.w * _e1452.w);
    let _e1455 = u_xlat21_;
    u_xlat21_ = clamp(_e1455, 0f, 1f);
    let _e1459 = u_xlat7_;
    let _e1460 = u_xlat5_;
    let _e1462 = u_xlat0_;
    u_xlat9_ = ((_e1459 * _e1460) + -(_e1462));
    let _e1465 = u_xlat21_;
    let _e1467 = u_xlat9_;
    let _e1469 = u_xlat0_;
    u_xlat9_ = ((vec4(_e1465) * _e1467) + _e1469);
    let _e1471 = u_xlatb38_;
    if _e1471.x {
        let _e1473 = u_xlat9_;
        local_13 = _e1473;
    } else {
        let _e1474 = u_xlat0_;
        local_13 = _e1474;
    }
    let _e1476 = local_13;
    u_xlat9_ = _e1476;
    let _e1477 = u_xlat8_;
    let _e1478 = u_xlat9_;
    u_xlat10_ = (_e1477 * _e1478);
    let _e1480 = u_xlat10_;
    let _e1484 = _f_buffer1_.f_cb1_[32];
    let _e1487 = u_xlat9_;
    u_xlat9_ = ((_e1480 * _e1484.yyyy) + _e1487);
    let _e1489 = u_xlat8_;
    let _e1493 = _f_buffer1_.f_cb1_[32];
    let _e1496 = u_xlat9_;
    u_xlat9_ = ((_e1489 * _e1493.xxxx) + _e1496);
    let _e1498 = u_xlat9_;
    let _e1499 = u_xlat9_;
    u_xlat10_ = (_e1498 + _e1499);
    let _e1501 = u_xlat8_;
    let _e1502 = u_xlat10_;
    u_xlat12_ = (_e1501 * _e1502);
    let _e1504 = u_xlat9_;
    u_xlat13_ = (-(_e1504) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1512 = u_xlat13_;
    let _e1513 = u_xlat13_;
    u_xlat13_ = (_e1512 + _e1513);
    let _e1515 = u_xlat7_;
    let _e1517 = u_xlat5_;
    u_xlat5_ = ((-(_e1515) * _e1517) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1525 = u_xlat13_;
    let _e1527 = u_xlat5_;
    u_xlat5_ = ((-(_e1525) * _e1527) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1535 = u_xlat10_;
    u_xlat7_ = floor(_e1535);
    let _e1537 = u_xlat7_;
    u_xlat7_ = min(_e1537, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1544 = u_xlat10_;
    let _e1546 = u_xlat8_;
    let _e1548 = u_xlat5_;
    u_xlat5_ = ((-(_e1544) * _e1546) + _e1548);
    let _e1550 = u_xlat7_;
    let _e1551 = u_xlat5_;
    let _e1553 = u_xlat12_;
    u_xlat5_ = ((_e1550 * _e1551) + _e1553);
    let _e1555 = u_xlat0_;
    let _e1557 = u_xlat5_;
    u_xlat5_ = (-(_e1555) + _e1557);
    let _e1562 = _f_buffer1_.f_cb1_[32];
    let _e1564 = u_xlat5_;
    let _e1566 = u_xlat0_;
    u_xlat5_ = ((_e1562.zzzz * _e1564) + _e1566);
    let _e1568 = u_xlatb38_;
    if _e1568.y {
        let _e1570 = u_xlat5_;
        local_14 = _e1570;
    } else {
        let _e1571 = u_xlat9_;
        local_14 = _e1571;
    }
    let _e1573 = local_14;
    u_xlat5_ = _e1573;
    let _e1574 = u_xlat0_;
    let _e1576 = u_xlat5_;
    u_xlat5_ = (-(_e1574) + _e1576);
    let _e1578 = u_xlat3_;
    let _e1580 = u_xlat5_;
    let _e1582 = u_xlat0_;
    u_xlat3_ = ((_e1578.xxxx * _e1580) + _e1582);
    let _e1584 = u_xlatb4_;
    if _e1584.z {
        let _e1586 = u_xlat0_;
        local_15 = _e1586;
    } else {
        let _e1587 = u_xlat3_;
        local_15 = _e1587;
    }
    let _e1589 = local_15;
    u_xlat0_ = _e1589;
    let _e1593 = _f_buffer1_.f_cb1_[41];
    let _e1598 = _f_buffer1_.f_cb1_[41];
    u_xlat3_ = (_e1593.wwww * _e1598);
    let _e1600 = u_xlat3_;
    let _e1601 = u_xlat6_;
    u_xlat5_ = (_e1600 * _e1601);
    let _e1603 = u_xlatb38_;
    let _e1613 = _f_buffer1_.f_cb1_[45];
    let _e1616 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1613.wzwz).xy;
    u_xlatb38_.x = _e1616.x;
    u_xlatb38_.y = _e1616.y;
    let _e1621 = u_xlat5_;
    let _e1626 = _f_buffer1_.f_cb1_[45];
    u_xlat40_ = (_e1621.w * _e1626.w);
    let _e1629 = u_xlat40_;
    u_xlat40_ = clamp(_e1629, 0f, 1f);
    let _e1633 = u_xlat6_;
    let _e1634 = u_xlat3_;
    let _e1636 = u_xlat0_;
    u_xlat7_ = ((_e1633 * _e1634) + -(_e1636));
    let _e1639 = u_xlat40_;
    let _e1641 = u_xlat7_;
    let _e1643 = u_xlat0_;
    u_xlat7_ = ((vec4(_e1639) * _e1641) + _e1643);
    let _e1645 = u_xlatb38_;
    if _e1645.x {
        let _e1647 = u_xlat7_;
        local_16 = _e1647;
    } else {
        let _e1648 = u_xlat0_;
        local_16 = _e1648;
    }
    let _e1650 = local_16;
    u_xlat7_ = _e1650;
    let _e1651 = u_xlat5_;
    let _e1652 = u_xlat7_;
    u_xlat8_ = (_e1651 * _e1652);
    let _e1654 = u_xlat8_;
    let _e1658 = _f_buffer1_.f_cb1_[45];
    let _e1661 = u_xlat7_;
    u_xlat7_ = ((_e1654 * _e1658.yyyy) + _e1661);
    let _e1663 = u_xlat5_;
    let _e1667 = _f_buffer1_.f_cb1_[45];
    let _e1670 = u_xlat7_;
    u_xlat7_ = ((_e1663 * _e1667.xxxx) + _e1670);
    let _e1672 = u_xlat7_;
    let _e1673 = u_xlat7_;
    u_xlat8_ = (_e1672 + _e1673);
    let _e1675 = u_xlat5_;
    let _e1676 = u_xlat8_;
    u_xlat9_ = (_e1675 * _e1676);
    let _e1678 = u_xlat7_;
    u_xlat10_ = (-(_e1678) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1686 = u_xlat10_;
    let _e1687 = u_xlat10_;
    u_xlat10_ = (_e1686 + _e1687);
    let _e1689 = u_xlat6_;
    let _e1691 = u_xlat3_;
    u_xlat3_ = ((-(_e1689) * _e1691) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1699 = u_xlat10_;
    let _e1701 = u_xlat3_;
    u_xlat3_ = ((-(_e1699) * _e1701) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1709 = u_xlat8_;
    u_xlat6_ = floor(_e1709);
    let _e1711 = u_xlat6_;
    u_xlat6_ = min(_e1711, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1718 = u_xlat8_;
    let _e1720 = u_xlat5_;
    let _e1722 = u_xlat3_;
    u_xlat3_ = ((-(_e1718) * _e1720) + _e1722);
    let _e1724 = u_xlat6_;
    let _e1725 = u_xlat3_;
    let _e1727 = u_xlat9_;
    u_xlat3_ = ((_e1724 * _e1725) + _e1727);
    let _e1729 = u_xlat0_;
    let _e1731 = u_xlat3_;
    u_xlat3_ = (-(_e1729) + _e1731);
    let _e1736 = _f_buffer1_.f_cb1_[45];
    let _e1738 = u_xlat3_;
    let _e1740 = u_xlat0_;
    u_xlat3_ = ((_e1736.zzzz * _e1738) + _e1740);
    let _e1742 = u_xlatb38_;
    if _e1742.y {
        let _e1744 = u_xlat3_;
        local_17 = _e1744;
    } else {
        let _e1745 = u_xlat7_;
        local_17 = _e1745;
    }
    let _e1747 = local_17;
    u_xlat3_ = _e1747;
    let _e1748 = u_xlat0_;
    let _e1750 = u_xlat3_;
    u_xlat3_ = (-(_e1748) + _e1750);
    let _e1752 = u_xlat20_;
    let _e1754 = u_xlat3_;
    let _e1756 = u_xlat0_;
    u_xlat3_ = ((_e1752.xxxx * _e1754) + _e1756);
    let _e1758 = u_xlatb4_;
    if _e1758.y {
        let _e1760 = u_xlat0_;
        local_18 = _e1760;
    } else {
        let _e1761 = u_xlat3_;
        local_18 = _e1761;
    }
    let _e1763 = local_18;
    u_xlat0_ = _e1763;
    let _e1764 = u_xlatb4_;
    if _e1764.x {
        let _e1766 = u_xlat0_;
        local_19 = _e1766;
    } else {
        let _e1767 = u_xlat1_;
        local_19 = _e1767;
    }
    let _e1769 = local_19;
    u_xlat1_ = _e1769;
    let _e1774 = _f_buffer1_.f_cb1_[67];
    u_xlatb20_.x = (_e1774.z == 5f);
    let _e1778 = u_xlatb20_;
    if _e1778.x {
        {
            let _e1780 = u_xlat1_;
            let _e1781 = u_xlat2_;
            let _e1784 = u_xlat1_;
            u_xlat3_ = ((_e1780 * vec4(_e1781)) + -(_e1784));
            let _e1790 = _f_buffer1_.f_cb1_[67];
            let _e1792 = u_xlat3_;
            let _e1794 = u_xlat1_;
            u_xlat3_ = ((_e1790.wwww * _e1792) + _e1794);
            u_xlat11_.w = 1f;
            let _e1798 = u_xlat3_;
            let _e1802 = _f_buffer1_.f_cb1_[54];
            let _e1804 = u_xlat11_;
            SV_Target0_ = ((_e1798 * _e1802) + _e1804.xxxw);
            return;
        }
    }
    let _e1810 = _f_buffer1_.f_cb1_[54];
    let _e1815 = _f_buffer1_.f_cb1_[54];
    u_xlat3_ = (_e1810.wwww * _e1815);
    let _e1817 = u_xlat1_;
    let _e1818 = u_xlat3_;
    u_xlat5_ = (_e1817 * _e1818);
    let _e1820 = u_xlatb20_;
    let _e1830 = _f_buffer1_.f_cb1_[58];
    let _e1833 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1830.wzww).xy;
    u_xlatb20_.x = _e1833.x;
    u_xlatb20_.y = _e1833.y;
    let _e1838 = u_xlat5_;
    let _e1843 = _f_buffer1_.f_cb1_[58];
    u_xlat56_ = (_e1838.w * _e1843.w);
    let _e1846 = u_xlat56_;
    u_xlat56_ = clamp(_e1846, 0f, 1f);
    let _e1850 = u_xlat1_;
    let _e1851 = u_xlat3_;
    let _e1853 = u_xlat0_;
    u_xlat6_ = ((_e1850 * _e1851) + -(_e1853));
    let _e1856 = u_xlat56_;
    let _e1858 = u_xlat6_;
    let _e1860 = u_xlat0_;
    u_xlat6_ = ((vec4(_e1856) * _e1858) + _e1860);
    let _e1862 = u_xlatb20_;
    if _e1862.x {
        let _e1864 = u_xlat6_;
        local_20 = _e1864;
    } else {
        let _e1865 = u_xlat0_;
        local_20 = _e1865;
    }
    let _e1867 = local_20;
    u_xlat6_ = _e1867;
    let _e1868 = u_xlat5_;
    let _e1869 = u_xlat6_;
    u_xlat7_ = (_e1868 * _e1869);
    let _e1871 = u_xlat7_;
    let _e1875 = _f_buffer1_.f_cb1_[58];
    let _e1878 = u_xlat6_;
    u_xlat6_ = ((_e1871 * _e1875.yyyy) + _e1878);
    let _e1880 = u_xlat5_;
    let _e1884 = _f_buffer1_.f_cb1_[58];
    let _e1887 = u_xlat6_;
    u_xlat6_ = ((_e1880 * _e1884.xxxx) + _e1887);
    let _e1889 = u_xlat6_;
    let _e1890 = u_xlat6_;
    u_xlat7_ = (_e1889 + _e1890);
    let _e1892 = u_xlat5_;
    let _e1893 = u_xlat7_;
    u_xlat8_ = (_e1892 * _e1893);
    let _e1895 = u_xlat6_;
    u_xlat9_ = (-(_e1895) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1903 = u_xlat9_;
    let _e1904 = u_xlat9_;
    u_xlat9_ = (_e1903 + _e1904);
    let _e1906 = u_xlat1_;
    let _e1908 = u_xlat3_;
    u_xlat1_ = ((-(_e1906) * _e1908) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1916 = u_xlat9_;
    let _e1918 = u_xlat1_;
    u_xlat1_ = ((-(_e1916) * _e1918) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1926 = u_xlat7_;
    u_xlat3_ = floor(_e1926);
    let _e1928 = u_xlat3_;
    u_xlat3_ = min(_e1928, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1935 = u_xlat7_;
    let _e1937 = u_xlat5_;
    let _e1939 = u_xlat1_;
    u_xlat1_ = ((-(_e1935) * _e1937) + _e1939);
    let _e1941 = u_xlat3_;
    let _e1942 = u_xlat1_;
    let _e1944 = u_xlat8_;
    u_xlat1_ = ((_e1941 * _e1942) + _e1944);
    let _e1946 = u_xlat0_;
    let _e1948 = u_xlat1_;
    u_xlat1_ = (-(_e1946) + _e1948);
    let _e1953 = _f_buffer1_.f_cb1_[58];
    let _e1955 = u_xlat1_;
    let _e1957 = u_xlat0_;
    u_xlat1_ = ((_e1953.zzzz * _e1955) + _e1957);
    let _e1959 = u_xlatb20_;
    if _e1959.y {
        let _e1961 = u_xlat1_;
        local_21 = _e1961;
    } else {
        let _e1962 = u_xlat6_;
        local_21 = _e1962;
    }
    let _e1964 = local_21;
    u_xlat1_ = _e1964;
    let _e1965 = u_xlat0_;
    let _e1967 = u_xlat1_;
    u_xlat1_ = (-(_e1965) + _e1967);
    let _e1969 = u_xlat2_;
    let _e1971 = u_xlat1_;
    let _e1973 = u_xlat0_;
    u_xlat1_ = ((vec4(_e1969) * _e1971) + _e1973);
    let _e1975 = u_xlatb4_;
    if _e1975.x {
        let _e1977 = u_xlat0_;
        local_22 = _e1977;
    } else {
        let _e1978 = u_xlat1_;
        local_22 = _e1978;
    }
    let _e1980 = local_22;
    u_xlat0_ = _e1980;
    let _e1981 = u_xlat0_;
    u_xlat0_ = clamp(_e1981, vec4(0f), vec4(1f));
    let _e1987 = u_xlat0_;
    let _e1988 = vs_COLOR0_1;
    u_xlat1_ = (_e1987 * _e1988);
    let _e1990 = u_xlat0_;
    let _e1991 = u_xlat1_;
    SV_Target0_ = min(_e1990, _e1991);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e60 = SV_Target0_;
    return FragmentOutput(_e60);
}
