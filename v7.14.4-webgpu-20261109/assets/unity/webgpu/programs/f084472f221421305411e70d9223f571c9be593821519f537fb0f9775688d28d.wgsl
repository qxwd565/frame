struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 22>,
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

    let _e78 = vs_TEXCOORD0_1;
    let _e83 = _f_buffer0_.f_cb0_[4];
    let _e88 = hscard_bias.values[1];
    let _e91 = textureSampleBias(f_t1_, samplerf_s1_, _e78.xy, (_e83.x + _e88.x));
    u_xlat0_ = _e91;
    let _e93 = u_xlat0_;
    let _e97 = _f_buffer1_.f_cb1_[8];
    u_xlat1_.x = dot(_e93, _e97);
    let _e100 = u_xlat1_;
    u_xlat1_.x = min(_e100.x, 1f);
    let _e105 = u_xlat0_;
    let _e109 = _f_buffer1_.f_cb1_[15];
    u_xlat10_.x = dot(_e105, _e109);
    let _e112 = u_xlat0_;
    let _e116 = _f_buffer1_.f_cb1_[1];
    u_xlat0_.x = dot(_e112, _e116);
    let _e119 = u_xlat0_;
    u_xlat0_.x = min(_e119.x, 1f);
    let _e123 = u_xlat10_;
    u_xlat9_ = min(_e123.x, 1f);
    let _e127 = vs_TEXCOORD1_1;
    let _e132 = _f_buffer0_.f_cb0_[4];
    let _e137 = hscard_bias.values[4];
    let _e140 = textureSampleBias(f_t4_, samplerf_s4_, _e127.zw, (_e132.x + _e137.x));
    u_xlat2_ = _e140;
    let _e141 = u_xlat9_;
    let _e142 = u_xlat2_;
    u_xlat9_ = (_e141 * _e142.w);
    let _e145 = u_xlat9_;
    let _e147 = u_xlat2_;
    u_xlat3_ = (vec4(_e145) * _e147.xyxy);
    let _e150 = u_xlat3_;
    let _e154 = _f_buffer1_.f_cb1_[21];
    u_xlat3_ = (_e150 * _e154.zwxy);
    let _e157 = u_xlat18_;
    let _e159 = u_xlat9_;
    let _e161 = u_xlat3_;
    let _e163 = (vec2(_e159) * _e161.xy);
    u_xlat18_.x = _e163.x;
    u_xlat18_.y = _e163.y;
    let _e168 = u_xlat10_;
    let _e170 = u_xlat18_;
    let _e176 = vs_TEXCOORD1_1;
    let _e178 = ((_e170.xy * vec2<f32>(0.001f, 0.001f)) + _e176.xy);
    u_xlat10_.x = _e178.x;
    u_xlat10_.y = _e178.y;
    let _e183 = u_xlat10_;
    let _e188 = _f_buffer0_.f_cb0_[4];
    let _e193 = hscard_bias.values[3];
    let _e196 = textureSampleBias(f_t3_, samplerf_s3_, _e183.xy, (_e188.x + _e193.x));
    u_xlat4_ = _e196;
    let _e198 = u_xlat1_;
    let _e200 = u_xlat4_;
    u_xlat1_.x = (_e198.x * _e200.w);
    let _e203 = u_xlat10_;
    let _e205 = u_xlat1_;
    let _e207 = u_xlat4_;
    let _e209 = (_e205.xx * _e207.xy);
    u_xlat10_.x = _e209.x;
    u_xlat10_.y = _e209.y;
    let _e214 = u_xlat10_;
    let _e216 = u_xlat10_;
    let _e221 = _f_buffer1_.f_cb1_[14];
    let _e223 = (_e216.xy * _e221.xy);
    u_xlat10_.x = _e223.x;
    u_xlat10_.y = _e223.y;
    let _e228 = u_xlat10_;
    let _e230 = u_xlat1_;
    let _e232 = u_xlat10_;
    let _e234 = (_e230.xx * _e232.xy);
    u_xlat10_.x = _e234.x;
    u_xlat10_.y = _e234.y;
    let _e239 = u_xlat3_;
    let _e241 = u_xlat4_;
    let _e246 = _f_buffer1_.f_cb1_[14];
    let _e248 = (_e241.xy * _e246.zw);
    u_xlat3_.x = _e248.x;
    u_xlat3_.y = _e248.y;
    let _e253 = u_xlat18_;
    let _e255 = u_xlat3_;
    let _e257 = u_xlat1_;
    let _e260 = u_xlat18_;
    let _e262 = ((_e255.xy * _e257.xx) + _e260.xy);
    u_xlat18_.x = _e262.x;
    u_xlat18_.y = _e262.y;
    let _e267 = u_xlat18_;
    let _e269 = u_xlat18_;
    let _e275 = vs_TEXCOORD0_1;
    let _e277 = ((_e269.xy * vec2<f32>(0.001f, 0.001f)) + _e275.zw);
    u_xlat18_.x = _e277.x;
    u_xlat18_.y = _e277.y;
    let _e282 = u_xlat18_;
    let _e287 = _f_buffer0_.f_cb0_[4];
    let _e292 = hscard_bias.values[2];
    let _e295 = textureSampleBias(f_t2_, samplerf_s2_, _e282.xy, (_e287.x + _e292.x));
    u_xlat5_ = _e295;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat5_;
    u_xlat0_.x = (_e297.x * _e299.w);
    let _e302 = u_xlat18_;
    let _e304 = u_xlat5_;
    let _e309 = _f_buffer1_.f_cb1_[7];
    let _e311 = (_e304.xy * _e309.xy);
    u_xlat18_.x = _e311.x;
    u_xlat18_.y = _e311.y;
    let _e316 = u_xlat18_;
    let _e318 = u_xlat18_;
    let _e320 = u_xlat0_;
    let _e323 = u_xlat10_;
    let _e325 = ((_e318.xy * _e320.xx) + _e323.xy);
    u_xlat18_.x = _e325.x;
    u_xlat18_.y = _e325.y;
    let _e330 = u_xlat18_;
    let _e332 = u_xlat3_;
    let _e334 = u_xlat9_;
    let _e337 = u_xlat18_;
    let _e339 = ((_e332.zw * vec2(_e334)) + _e337.xy);
    u_xlat18_.x = _e339.x;
    u_xlat18_.y = _e339.y;
    let _e344 = u_xlat18_;
    let _e346 = u_xlat18_;
    let _e352 = vs_TEXCOORD0_1;
    let _e354 = ((_e346.xy * vec2<f32>(0.001f, 0.001f)) + _e352.xy);
    u_xlat18_.x = _e354.x;
    u_xlat18_.y = _e354.y;
    let _e359 = u_xlat18_;
    let _e364 = _f_buffer0_.f_cb0_[4];
    let _e369 = hscard_bias.values[0];
    let _e372 = textureSampleBias(f_t0_, samplerf_s0_, _e359.xy, (_e364.x + _e369.x));
    u_xlat3_ = _e372;
    let _e376 = _f_buffer1_.f_cb1_[2];
    let _e381 = _f_buffer1_.f_cb1_[2];
    u_xlat6_ = (_e376.wwww * _e381);
    let _e383 = u_xlat5_;
    let _e384 = u_xlat6_;
    let _e386 = u_xlat3_;
    u_xlat7_ = ((_e383 * _e384) + -(_e386));
    let _e389 = u_xlat5_;
    let _e390 = u_xlat6_;
    u_xlat8_ = (_e389 * _e390);
    let _e392 = u_xlat5_;
    let _e394 = u_xlat6_;
    u_xlat5_ = ((-(_e392) * _e394) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e403 = u_xlat8_;
    let _e408 = _f_buffer1_.f_cb1_[6];
    u_xlat18_.x = (_e403.w * _e408.w);
    let _e412 = u_xlat18_;
    u_xlat18_.x = clamp(_e412.x, 0f, 1f);
    let _e417 = u_xlat18_;
    let _e419 = u_xlat7_;
    let _e421 = u_xlat3_;
    u_xlat6_ = ((_e417.xxxx * _e419) + _e421);
    let _e423 = u_xlatb18_;
    let _e433 = _f_buffer1_.f_cb1_[6];
    let _e436 = (vec4<f32>(0f, 0f, 0f, 0f) < _e433.wzwz).xy;
    u_xlatb18_.x = _e436.x;
    u_xlatb18_.y = _e436.y;
    let _e441 = u_xlatb18_;
    if _e441.x {
        let _e443 = u_xlat6_;
        local = _e443;
    } else {
        let _e444 = u_xlat3_;
        local = _e444;
    }
    let _e446 = local;
    u_xlat6_ = _e446;
    let _e447 = u_xlat8_;
    let _e448 = u_xlat6_;
    u_xlat7_ = (_e447 * _e448);
    let _e450 = u_xlat7_;
    let _e454 = _f_buffer1_.f_cb1_[6];
    let _e457 = u_xlat6_;
    u_xlat6_ = ((_e450 * _e454.yyyy) + _e457);
    let _e459 = u_xlat8_;
    let _e463 = _f_buffer1_.f_cb1_[6];
    let _e466 = u_xlat6_;
    u_xlat6_ = ((_e459 * _e463.xxxx) + _e466);
    let _e468 = u_xlat6_;
    u_xlat7_ = (-(_e468) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e476 = u_xlat7_;
    let _e477 = u_xlat7_;
    u_xlat7_ = (_e476 + _e477);
    let _e479 = u_xlat7_;
    let _e481 = u_xlat5_;
    u_xlat5_ = ((-(_e479) * _e481) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e489 = u_xlat6_;
    let _e490 = u_xlat6_;
    u_xlat7_ = (_e489 + _e490);
    let _e492 = u_xlat7_;
    let _e494 = u_xlat8_;
    let _e496 = u_xlat5_;
    u_xlat5_ = ((-(_e492) * _e494) + _e496);
    let _e498 = u_xlat8_;
    let _e499 = u_xlat7_;
    u_xlat8_ = (_e498 * _e499);
    let _e501 = u_xlat7_;
    u_xlat7_ = floor(_e501);
    let _e503 = u_xlat7_;
    u_xlat7_ = min(_e503, vec4<f32>(1f, 1f, 1f, 1f));
    let _e510 = u_xlat7_;
    let _e511 = u_xlat5_;
    let _e513 = u_xlat8_;
    u_xlat5_ = ((_e510 * _e511) + _e513);
    let _e515 = u_xlat3_;
    let _e517 = u_xlat5_;
    u_xlat5_ = (-(_e515) + _e517);
    let _e522 = _f_buffer1_.f_cb1_[6];
    let _e524 = u_xlat5_;
    let _e526 = u_xlat3_;
    u_xlat5_ = ((_e522.zzzz * _e524) + _e526);
    let _e528 = u_xlatb18_;
    if _e528.y {
        let _e530 = u_xlat5_;
        local_1 = _e530;
    } else {
        let _e531 = u_xlat6_;
        local_1 = _e531;
    }
    let _e533 = local_1;
    u_xlat5_ = _e533;
    let _e534 = u_xlat3_;
    let _e536 = u_xlat5_;
    u_xlat5_ = (-(_e534) + _e536);
    let _e538 = u_xlat0_;
    let _e540 = u_xlat5_;
    let _e542 = u_xlat3_;
    u_xlat3_ = ((_e538.xxxx * _e540) + _e542);
    let _e547 = _f_buffer1_.f_cb1_[9];
    let _e552 = _f_buffer1_.f_cb1_[9];
    u_xlat5_ = (_e547.wwww * _e552);
    let _e554 = u_xlat4_;
    let _e555 = u_xlat5_;
    let _e557 = u_xlat3_;
    u_xlat6_ = ((_e554 * _e555) + -(_e557));
    let _e560 = u_xlat4_;
    let _e561 = u_xlat5_;
    u_xlat7_ = (_e560 * _e561);
    let _e563 = u_xlat4_;
    let _e565 = u_xlat5_;
    u_xlat4_ = ((-(_e563) * _e565) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e574 = u_xlat7_;
    let _e579 = _f_buffer1_.f_cb1_[13];
    u_xlat0_.x = (_e574.w * _e579.w);
    let _e583 = u_xlat0_;
    u_xlat0_.x = clamp(_e583.x, 0f, 1f);
    let _e588 = u_xlat0_;
    let _e590 = u_xlat6_;
    let _e592 = u_xlat3_;
    u_xlat5_ = ((_e588.xxxx * _e590) + _e592);
    let _e594 = u_xlatb0_;
    let _e604 = _f_buffer1_.f_cb1_[13];
    let _e607 = (vec4<f32>(0f, 0f, 0f, 0f) < _e604.wwzw).xz;
    u_xlatb0_.x = _e607.x;
    u_xlatb0_.z = _e607.y;
    let _e612 = u_xlatb0_;
    if _e612.x {
        let _e614 = u_xlat5_;
        local_2 = _e614;
    } else {
        let _e615 = u_xlat3_;
        local_2 = _e615;
    }
    let _e617 = local_2;
    u_xlat5_ = _e617;
    let _e618 = u_xlat7_;
    let _e619 = u_xlat5_;
    u_xlat6_ = (_e618 * _e619);
    let _e621 = u_xlat6_;
    let _e625 = _f_buffer1_.f_cb1_[13];
    let _e628 = u_xlat5_;
    u_xlat5_ = ((_e621 * _e625.yyyy) + _e628);
    let _e630 = u_xlat7_;
    let _e634 = _f_buffer1_.f_cb1_[13];
    let _e637 = u_xlat5_;
    u_xlat5_ = ((_e630 * _e634.xxxx) + _e637);
    let _e639 = u_xlat5_;
    u_xlat6_ = (-(_e639) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e647 = u_xlat6_;
    let _e648 = u_xlat6_;
    u_xlat6_ = (_e647 + _e648);
    let _e650 = u_xlat6_;
    let _e652 = u_xlat4_;
    u_xlat4_ = ((-(_e650) * _e652) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e660 = u_xlat5_;
    let _e661 = u_xlat5_;
    u_xlat6_ = (_e660 + _e661);
    let _e663 = u_xlat6_;
    let _e665 = u_xlat7_;
    let _e667 = u_xlat4_;
    u_xlat4_ = ((-(_e663) * _e665) + _e667);
    let _e669 = u_xlat7_;
    let _e670 = u_xlat6_;
    u_xlat7_ = (_e669 * _e670);
    let _e672 = u_xlat6_;
    u_xlat6_ = floor(_e672);
    let _e674 = u_xlat6_;
    u_xlat6_ = min(_e674, vec4<f32>(1f, 1f, 1f, 1f));
    let _e681 = u_xlat6_;
    let _e682 = u_xlat4_;
    let _e684 = u_xlat7_;
    u_xlat4_ = ((_e681 * _e682) + _e684);
    let _e686 = u_xlat3_;
    let _e688 = u_xlat4_;
    u_xlat4_ = (-(_e686) + _e688);
    let _e693 = _f_buffer1_.f_cb1_[13];
    let _e695 = u_xlat4_;
    let _e697 = u_xlat3_;
    u_xlat4_ = ((_e693.zzzz * _e695) + _e697);
    let _e699 = u_xlatb0_;
    if _e699.z {
        let _e701 = u_xlat4_;
        local_3 = _e701;
    } else {
        let _e702 = u_xlat5_;
        local_3 = _e702;
    }
    let _e704 = local_3;
    u_xlat4_ = _e704;
    let _e705 = u_xlat3_;
    let _e707 = u_xlat4_;
    u_xlat4_ = (-(_e705) + _e707);
    let _e709 = u_xlat1_;
    let _e711 = u_xlat4_;
    let _e713 = u_xlat3_;
    u_xlat1_ = ((_e709.xxxx * _e711) + _e713);
    let _e718 = _f_buffer1_.f_cb1_[16];
    let _e723 = _f_buffer1_.f_cb1_[16];
    u_xlat3_ = (_e718.wwww * _e723);
    let _e725 = u_xlat2_;
    let _e726 = u_xlat3_;
    let _e728 = u_xlat1_;
    u_xlat4_ = ((_e725 * _e726) + -(_e728));
    let _e731 = u_xlat2_;
    let _e732 = u_xlat3_;
    u_xlat5_ = (_e731 * _e732);
    let _e734 = u_xlat2_;
    let _e736 = u_xlat3_;
    u_xlat2_ = ((-(_e734) * _e736) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e745 = u_xlat5_;
    let _e750 = _f_buffer1_.f_cb1_[20];
    u_xlat0_.x = (_e745.w * _e750.w);
    let _e754 = u_xlat0_;
    u_xlat0_.x = clamp(_e754.x, 0f, 1f);
    let _e759 = u_xlat0_;
    let _e761 = u_xlat4_;
    let _e763 = u_xlat1_;
    u_xlat3_ = ((_e759.xxxx * _e761) + _e763);
    let _e765 = u_xlatb0_;
    let _e775 = _f_buffer1_.f_cb1_[20];
    let _e778 = (vec4<f32>(0f, 0f, 0f, 0f) < _e775.wwzw).xz;
    u_xlatb0_.x = _e778.x;
    u_xlatb0_.z = _e778.y;
    let _e783 = u_xlatb0_;
    if _e783.x {
        let _e785 = u_xlat3_;
        local_4 = _e785;
    } else {
        let _e786 = u_xlat1_;
        local_4 = _e786;
    }
    let _e788 = local_4;
    u_xlat3_ = _e788;
    let _e789 = u_xlat5_;
    let _e790 = u_xlat3_;
    u_xlat4_ = (_e789 * _e790);
    let _e792 = u_xlat4_;
    let _e796 = _f_buffer1_.f_cb1_[20];
    let _e799 = u_xlat3_;
    u_xlat3_ = ((_e792 * _e796.yyyy) + _e799);
    let _e801 = u_xlat5_;
    let _e805 = _f_buffer1_.f_cb1_[20];
    let _e808 = u_xlat3_;
    u_xlat3_ = ((_e801 * _e805.xxxx) + _e808);
    let _e810 = u_xlat3_;
    u_xlat4_ = (-(_e810) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e818 = u_xlat4_;
    let _e819 = u_xlat4_;
    u_xlat4_ = (_e818 + _e819);
    let _e821 = u_xlat4_;
    let _e823 = u_xlat2_;
    u_xlat2_ = ((-(_e821) * _e823) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e831 = u_xlat3_;
    let _e832 = u_xlat3_;
    u_xlat4_ = (_e831 + _e832);
    let _e834 = u_xlat4_;
    let _e836 = u_xlat5_;
    let _e838 = u_xlat2_;
    u_xlat2_ = ((-(_e834) * _e836) + _e838);
    let _e840 = u_xlat5_;
    let _e841 = u_xlat4_;
    u_xlat5_ = (_e840 * _e841);
    let _e843 = u_xlat4_;
    u_xlat4_ = floor(_e843);
    let _e845 = u_xlat4_;
    u_xlat4_ = min(_e845, vec4<f32>(1f, 1f, 1f, 1f));
    let _e852 = u_xlat4_;
    let _e853 = u_xlat2_;
    let _e855 = u_xlat5_;
    u_xlat2_ = ((_e852 * _e853) + _e855);
    let _e857 = u_xlat1_;
    let _e859 = u_xlat2_;
    u_xlat2_ = (-(_e857) + _e859);
    let _e864 = _f_buffer1_.f_cb1_[20];
    let _e866 = u_xlat2_;
    let _e868 = u_xlat1_;
    u_xlat2_ = ((_e864.zzzz * _e866) + _e868);
    let _e870 = u_xlatb0_;
    if _e870.z {
        let _e872 = u_xlat2_;
        local_5 = _e872;
    } else {
        let _e873 = u_xlat3_;
        local_5 = _e873;
    }
    let _e875 = local_5;
    u_xlat2_ = _e875;
    let _e876 = u_xlat1_;
    let _e878 = u_xlat2_;
    u_xlat2_ = (-(_e876) + _e878);
    let _e880 = u_xlat9_;
    let _e882 = u_xlat2_;
    let _e884 = u_xlat1_;
    u_xlat0_ = ((vec4(_e880) * _e882) + _e884);
    let _e886 = u_xlat0_;
    u_xlat0_ = clamp(_e886, vec4(0f), vec4(1f));
    let _e892 = u_xlat0_;
    let _e893 = vs_COLOR0_1;
    u_xlat0_ = (_e892 * _e893);
    let _e895 = u_xlat0_;
    SV_Target0_ = min(_e895, vec4<f32>(1f, 1f, 1f, 1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
