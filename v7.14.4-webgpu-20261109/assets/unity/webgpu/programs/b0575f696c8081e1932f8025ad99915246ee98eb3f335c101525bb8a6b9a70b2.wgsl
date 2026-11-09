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
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlatb6_: vec2<bool> = vec2(false);
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
    let _e267 = u_xlat0_;
    let _e271 = _f_buffer1_.f_cb1_[40];
    u_xlat20_.x = dot(_e267, _e271);
    let _e274 = u_xlat20_;
    u_xlat20_.x = min(_e274.x, 1f);
    let _e279 = u_xlat20_;
    let _e281 = u_xlat5_;
    u_xlat20_.x = (_e279.x * _e281.w);
    let _e284 = u_xlat20_;
    let _e286 = u_xlat5_;
    u_xlat6_ = (_e284.xxxx * _e286.xyxy);
    let _e289 = u_xlat6_;
    let _e293 = _f_buffer1_.f_cb1_[46];
    u_xlat6_ = (_e289 * _e293.zwxy);
    let _e296 = u_xlat20_;
    let _e298 = u_xlat6_;
    u_xlat6_ = (_e296.xxxx * _e298);
    let _e300 = u_xlatb4_;
    if _e300.y {
        local_1 = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e307 = u_xlat6_;
        local_1 = _e307;
    }
    let _e309 = local_1;
    u_xlat6_ = _e309;
    let _e310 = u_xlat38_;
    let _e312 = u_xlat3_;
    let _e314 = u_xlat6_;
    let _e316 = (_e312.xy + _e314.xy);
    u_xlat38_.x = _e316.x;
    u_xlat38_.y = _e316.y;
    let _e321 = u_xlat3_;
    let _e323 = u_xlat38_;
    let _e329 = vs_TEXCOORD1_1;
    let _e331 = ((_e323.xy * vec2<f32>(0.001f, 0.001f)) + _e329.zw);
    u_xlat3_.x = _e331.x;
    u_xlat3_.y = _e331.y;
    let _e336 = u_xlat3_;
    let _e341 = _f_buffer0_.f_cb0_[4];
    let _e346 = hscard_bias.values[5];
    let _e349 = textureSampleBias(f_t5_, samplerf_s5_, _e336.xy, (_e341.x + _e346.x));
    u_xlat7_ = _e349;
    let _e350 = u_xlat3_;
    let _e355 = _f_buffer1_.f_cb1_[37];
    let _e361 = _f_buffer1_.f_cb1_[38];
    let _e363 = (-(_e355.xy) + _e361.zw);
    u_xlat3_.x = _e363.x;
    u_xlat3_.y = _e363.y;
    let _e368 = u_xlat6_;
    let _e370 = u_xlat3_;
    let _e373 = u_xlat7_;
    let _e375 = (-(_e370.xy) + _e373.xy);
    u_xlat6_.x = _e375.x;
    u_xlat6_.y = _e375.y;
    let _e380 = u_xlat3_;
    let _e382 = u_xlat6_;
    let _e387 = _f_buffer1_.f_cb1_[38];
    let _e390 = u_xlat3_;
    let _e392 = ((_e382.xy * _e387.xy) + _e390.xy);
    u_xlat3_.x = _e392.x;
    u_xlat3_.y = _e392.y;
    let _e397 = u_xlat6_;
    let _e402 = _f_buffer1_.f_cb1_[37];
    let _e407 = _f_buffer1_.f_cb1_[37];
    let _e409 = (_e402.zw + _e407.xy);
    u_xlat6_.x = _e409.x;
    u_xlat6_.y = _e409.y;
    let _e414 = u_xlat3_;
    let _e416 = u_xlat3_;
    let _e418 = u_xlat6_;
    let _e420 = (_e416.xy + _e418.xy);
    u_xlat3_.x = _e420.x;
    u_xlat3_.y = _e420.y;
    let _e425 = u_xlat3_;
    let _e430 = _f_buffer0_.f_cb0_[4];
    let _e435 = hscard_bias.values[4];
    let _e438 = textureSampleBias(f_t4_, samplerf_s4_, _e425.xy, (_e430.x + _e435.x));
    u_xlat8_ = _e438;
    let _e440 = u_xlat7_;
    let _e442 = u_xlat8_;
    u_xlat8_.w = (_e440.z * _e442.w);
    let _e446 = u_xlat0_;
    let _e450 = _f_buffer1_.f_cb1_[27];
    u_xlat3_.x = dot(_e446, _e450);
    let _e453 = u_xlat3_;
    u_xlat3_.x = min(_e453.x, 1f);
    let _e458 = u_xlat3_;
    let _e460 = u_xlat8_;
    u_xlat3_.x = (_e458.x * _e460.w);
    let _e463 = u_xlat3_;
    let _e465 = u_xlat8_;
    u_xlat7_ = (_e463.xxxx * _e465.xyxy);
    let _e468 = u_xlat7_;
    let _e472 = _f_buffer1_.f_cb1_[33];
    u_xlat7_ = (_e468 * _e472.zwxy);
    let _e475 = u_xlat3_;
    let _e477 = u_xlat7_;
    u_xlat7_ = (_e475.xxxx * _e477);
    let _e479 = u_xlatb4_;
    if _e479.z {
        local_2 = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e486 = u_xlat7_;
        local_2 = _e486;
    }
    let _e488 = local_2;
    u_xlat7_ = _e488;
    let _e489 = u_xlat38_;
    let _e491 = u_xlat38_;
    let _e493 = u_xlat7_;
    let _e495 = (_e491.xy + _e493.xy);
    u_xlat38_.x = _e495.x;
    u_xlat38_.y = _e495.y;
    let _e500 = u_xlat6_;
    let _e502 = u_xlat38_;
    let _e508 = vs_TEXCOORD1_1;
    let _e510 = ((_e502.xy * vec2<f32>(0.001f, 0.001f)) + _e508.xy);
    u_xlat6_.x = _e510.x;
    u_xlat6_.y = _e510.y;
    let _e515 = u_xlat6_;
    let _e520 = _f_buffer0_.f_cb0_[4];
    let _e525 = hscard_bias.values[3];
    let _e528 = textureSampleBias(f_t3_, samplerf_s3_, _e515.xy, (_e520.x + _e525.x));
    u_xlat9_ = _e528;
    let _e529 = u_xlat0_;
    let _e533 = _f_buffer1_.f_cb1_[14];
    u_xlat21_ = dot(_e529, _e533);
    let _e535 = u_xlat21_;
    u_xlat21_ = min(_e535, 1f);
    let _e538 = u_xlat21_;
    let _e539 = u_xlat9_;
    u_xlat21_ = (_e538 * _e539.w);
    let _e542 = u_xlat6_;
    let _e544 = u_xlat21_;
    let _e546 = u_xlat9_;
    let _e548 = (vec2(_e544) * _e546.xy);
    u_xlat6_.x = _e548.x;
    u_xlat6_.y = _e548.y;
    let _e553 = u_xlat7_;
    let _e555 = u_xlat9_;
    let _e560 = _f_buffer1_.f_cb1_[20];
    let _e562 = (_e555.xy * _e560.zw);
    u_xlat7_.x = _e562.x;
    u_xlat7_.y = _e562.y;
    let _e567 = u_xlat7_;
    let _e569 = u_xlat21_;
    let _e571 = u_xlat7_;
    let _e573 = (vec2(_e569) * _e571.xy);
    u_xlat7_.x = _e573.x;
    u_xlat7_.y = _e573.y;
    let _e578 = u_xlat7_;
    let _e580 = u_xlatb4_;
    if _e580.w {
        local_3 = vec2<f32>(0f, 0f);
    } else {
        let _e585 = u_xlat7_;
        local_3 = _e585.xy;
    }
    let _e588 = local_3;
    u_xlat7_.x = _e588.x;
    u_xlat7_.y = _e588.y;
    let _e593 = u_xlat38_;
    let _e595 = u_xlat38_;
    let _e597 = u_xlat7_;
    let _e599 = (_e595.xy + _e597.xy);
    u_xlat38_.x = _e599.x;
    u_xlat38_.y = _e599.y;
    let _e604 = u_xlat38_;
    let _e606 = u_xlat38_;
    let _e612 = vs_TEXCOORD0_1;
    let _e614 = ((_e606.xy * vec2<f32>(0.001f, 0.001f)) + _e612.zw);
    u_xlat38_.x = _e614.x;
    u_xlat38_.y = _e614.y;
    let _e619 = u_xlat38_;
    let _e624 = _f_buffer0_.f_cb0_[4];
    let _e629 = hscard_bias.values[2];
    let _e632 = textureSampleBias(f_t2_, samplerf_s2_, _e619.xy, (_e624.x + _e629.x));
    u_xlat10_ = _e632;
    let _e634 = u_xlat0_;
    let _e638 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = dot(_e634, _e638);
    let _e641 = u_xlat0_;
    u_xlat0_.x = min(_e641.x, 1f);
    let _e646 = u_xlat0_;
    let _e648 = u_xlat10_;
    u_xlat0_.x = (_e646.x * _e648.w);
    let _e651 = u_xlat18_;
    let _e653 = u_xlat10_;
    let _e658 = _f_buffer1_.f_cb1_[8];
    let _e660 = (_e653.xy * _e658.xy);
    u_xlat18_.x = _e660.x;
    u_xlat18_.y = _e660.y;
    let _e665 = u_xlat18_;
    let _e667 = u_xlat0_;
    let _e669 = u_xlat18_;
    let _e671 = (_e667.xx * _e669.xy);
    u_xlat18_.x = _e671.x;
    u_xlat18_.y = _e671.y;
    let _e676 = u_xlat38_;
    let _e678 = u_xlat6_;
    let _e683 = _f_buffer1_.f_cb1_[20];
    let _e685 = (_e678.xy * _e683.xy);
    u_xlat38_.x = _e685.x;
    u_xlat38_.y = _e685.y;
    let _e690 = u_xlat38_;
    let _e692 = u_xlat21_;
    let _e694 = u_xlat38_;
    let _e696 = (vec2(_e692) * _e694.xy);
    u_xlat38_.x = _e696.x;
    u_xlat38_.y = _e696.y;
    let _e701 = u_xlatb6_;
    let _e706 = _f_buffer1_.f_cb1_[67];
    let _e714 = (_e706.zzzz == vec4<f32>(11f, 1f, 0f, 0f)).xy;
    u_xlatb6_.x = _e714.x;
    u_xlatb6_.y = _e714.y;
    let _e719 = u_xlat18_;
    let _e721 = u_xlatb6_;
    if _e721.x {
        local_4 = vec2<f32>(0f, 0f);
    } else {
        let _e726 = u_xlat18_;
        local_4 = _e726.xy;
    }
    let _e729 = local_4;
    u_xlat18_.x = _e729.x;
    u_xlat18_.y = _e729.y;
    let _e734 = u_xlat38_;
    let _e736 = u_xlatb4_;
    if _e736.w {
        local_5 = vec2<f32>(0f, 0f);
    } else {
        let _e741 = u_xlat38_;
        local_5 = _e741.xy;
    }
    let _e744 = local_5;
    u_xlat38_.x = _e744.x;
    u_xlat38_.y = _e744.y;
    let _e749 = u_xlat18_;
    let _e751 = u_xlat18_;
    let _e753 = u_xlat38_;
    let _e755 = (_e751.xy + _e753.xy);
    u_xlat18_.x = _e755.x;
    u_xlat18_.y = _e755.y;
    let _e760 = u_xlat18_;
    let _e762 = u_xlat7_;
    let _e764 = u_xlat18_;
    let _e766 = (_e762.zw + _e764.xy);
    u_xlat18_.x = _e766.x;
    u_xlat18_.y = _e766.y;
    let _e771 = u_xlat18_;
    let _e773 = u_xlat6_;
    let _e775 = u_xlat18_;
    let _e777 = (_e773.zw + _e775.xy);
    u_xlat18_.x = _e777.x;
    u_xlat18_.y = _e777.y;
    let _e782 = u_xlat18_;
    let _e784 = u_xlat3_;
    let _e786 = u_xlat18_;
    let _e788 = (_e784.zw + _e786.xy);
    u_xlat18_.x = _e788.x;
    u_xlat18_.y = _e788.y;
    let _e793 = u_xlat18_;
    let _e795 = u_xlat18_;
    let _e801 = vs_TEXCOORD0_1;
    let _e803 = ((_e795.xy * vec2<f32>(0.001f, 0.001f)) + _e801.xy);
    u_xlat18_.x = _e803.x;
    u_xlat18_.y = _e803.y;
    let _e808 = u_xlat18_;
    let _e813 = _f_buffer0_.f_cb0_[4];
    let _e818 = hscard_bias.values[0];
    let _e821 = textureSampleBias(f_t0_, samplerf_s0_, _e808.xy, (_e813.x + _e818.x));
    u_xlat7_ = _e821;
    let _e827 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (0f < _e827.z);
    let _e830 = u_xlat7_;
    u_xlat36_ = dot(_e830, vec4<f32>(0.1f, 0.1f, 0.1f, 0.1f));
    let _e838 = u_xlatb18_;
    if _e838.x {
        let _e840 = u_xlat36_;
        local_6 = _e840;
    } else {
        local_6 = 0f;
    }
    let _e844 = local_6;
    u_xlat11_.x = _e844;
    let _e845 = u_xlatb6_;
    if _e845.y {
        {
            let _e847 = u_xlat10_;
            let _e848 = u_xlat0_;
            let _e851 = u_xlat10_;
            u_xlat12_ = ((_e847 * _e848.xxxx) + -(_e851));
            let _e857 = _f_buffer1_.f_cb1_[67];
            let _e859 = u_xlat12_;
            let _e861 = u_xlat10_;
            u_xlat12_ = ((_e857.wwww * _e859) + _e861);
            u_xlat11_.y = 1f;
            let _e865 = u_xlat12_;
            let _e869 = _f_buffer1_.f_cb1_[3];
            let _e871 = u_xlat11_;
            SV_Target0_ = ((_e865 * _e869) + _e871.xxxy);
            return;
        }
    }
    let _e878 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e878.z == 2f);
    let _e882 = u_xlatb18_;
    if _e882.x {
        {
            let _e884 = u_xlat9_;
            let _e885 = u_xlat21_;
            let _e888 = u_xlat9_;
            u_xlat12_ = ((_e884 * vec4(_e885)) + -(_e888));
            let _e894 = _f_buffer1_.f_cb1_[67];
            let _e896 = u_xlat12_;
            let _e898 = u_xlat9_;
            u_xlat12_ = ((_e894.wwww * _e896) + _e898);
            u_xlat11_.z = 1f;
            let _e902 = u_xlat12_;
            let _e906 = _f_buffer1_.f_cb1_[15];
            let _e908 = u_xlat11_;
            SV_Target0_ = ((_e902 * _e906) + _e908.xxxz);
            return;
        }
    }
    let _e915 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e915.z == 3f);
    let _e919 = u_xlatb18_;
    if _e919.x {
        {
            let _e921 = u_xlat8_;
            let _e922 = u_xlat3_;
            let _e925 = u_xlat8_;
            u_xlat12_ = ((_e921 * _e922.xxxx) + -(_e925));
            let _e931 = _f_buffer1_.f_cb1_[67];
            let _e933 = u_xlat12_;
            let _e935 = u_xlat8_;
            u_xlat12_ = ((_e931.wwww * _e933) + _e935);
            u_xlat11_.w = 1f;
            let _e939 = u_xlat12_;
            let _e943 = _f_buffer1_.f_cb1_[28];
            let _e945 = u_xlat11_;
            SV_Target0_ = ((_e939 * _e943) + _e945.xxxw);
            return;
        }
    }
    let _e952 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e952.z == 4f);
    let _e956 = u_xlatb18_;
    if _e956.x {
        {
            let _e958 = u_xlat5_;
            let _e959 = u_xlat20_;
            let _e962 = u_xlat5_;
            u_xlat12_ = ((_e958 * _e959.xxxx) + -(_e962));
            let _e968 = _f_buffer1_.f_cb1_[67];
            let _e970 = u_xlat12_;
            let _e972 = u_xlat5_;
            u_xlat12_ = ((_e968.wwww * _e970) + _e972);
            u_xlat11_.w = 1f;
            let _e976 = u_xlat12_;
            let _e980 = _f_buffer1_.f_cb1_[41];
            let _e982 = u_xlat11_;
            SV_Target0_ = ((_e976 * _e980) + _e982.xxxw);
            return;
        }
    }
    let _e988 = _f_buffer1_.f_cb1_[3];
    let _e993 = _f_buffer1_.f_cb1_[3];
    u_xlat12_ = (_e988.wwww * _e993);
    let _e995 = u_xlat10_;
    let _e996 = u_xlat12_;
    u_xlat13_ = (_e995 * _e996);
    let _e998 = u_xlatb18_;
    let _e1008 = _f_buffer1_.f_cb1_[7];
    let _e1011 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1008.wzww).xy;
    u_xlatb18_.x = _e1011.x;
    u_xlatb18_.y = _e1011.y;
    let _e1016 = u_xlat13_;
    let _e1021 = _f_buffer1_.f_cb1_[7];
    u_xlat54_ = (_e1016.w * _e1021.w);
    let _e1024 = u_xlat54_;
    u_xlat54_ = clamp(_e1024, 0f, 1f);
    let _e1028 = u_xlat10_;
    let _e1029 = u_xlat12_;
    let _e1031 = u_xlat7_;
    u_xlat14_ = ((_e1028 * _e1029) + -(_e1031));
    let _e1034 = u_xlat54_;
    let _e1036 = u_xlat14_;
    let _e1038 = u_xlat7_;
    u_xlat14_ = ((vec4(_e1034) * _e1036) + _e1038);
    let _e1040 = u_xlatb18_;
    if _e1040.x {
        let _e1042 = u_xlat14_;
        local_7 = _e1042;
    } else {
        let _e1043 = u_xlat7_;
        local_7 = _e1043;
    }
    let _e1045 = local_7;
    u_xlat14_ = _e1045;
    let _e1046 = u_xlat13_;
    let _e1047 = u_xlat14_;
    u_xlat15_ = (_e1046 * _e1047);
    let _e1049 = u_xlat15_;
    let _e1053 = _f_buffer1_.f_cb1_[7];
    let _e1056 = u_xlat14_;
    u_xlat14_ = ((_e1049 * _e1053.yyyy) + _e1056);
    let _e1058 = u_xlat13_;
    let _e1062 = _f_buffer1_.f_cb1_[7];
    let _e1065 = u_xlat14_;
    u_xlat14_ = ((_e1058 * _e1062.xxxx) + _e1065);
    let _e1067 = u_xlat14_;
    let _e1068 = u_xlat14_;
    u_xlat15_ = (_e1067 + _e1068);
    let _e1070 = u_xlat13_;
    let _e1071 = u_xlat15_;
    u_xlat16_ = (_e1070 * _e1071);
    let _e1073 = u_xlat14_;
    u_xlat17_ = (-(_e1073) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1081 = u_xlat17_;
    let _e1082 = u_xlat17_;
    u_xlat17_ = (_e1081 + _e1082);
    let _e1084 = u_xlat10_;
    let _e1086 = u_xlat12_;
    u_xlat10_ = ((-(_e1084) * _e1086) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1094 = u_xlat17_;
    let _e1096 = u_xlat10_;
    u_xlat10_ = ((-(_e1094) * _e1096) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1104 = u_xlat15_;
    u_xlat12_ = floor(_e1104);
    let _e1106 = u_xlat12_;
    u_xlat12_ = min(_e1106, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1113 = u_xlat15_;
    let _e1115 = u_xlat13_;
    let _e1117 = u_xlat10_;
    u_xlat10_ = ((-(_e1113) * _e1115) + _e1117);
    let _e1119 = u_xlat12_;
    let _e1120 = u_xlat10_;
    let _e1122 = u_xlat16_;
    u_xlat10_ = ((_e1119 * _e1120) + _e1122);
    let _e1124 = u_xlat7_;
    let _e1126 = u_xlat10_;
    u_xlat10_ = (-(_e1124) + _e1126);
    let _e1131 = _f_buffer1_.f_cb1_[7];
    let _e1133 = u_xlat10_;
    let _e1135 = u_xlat7_;
    u_xlat10_ = ((_e1131.zzzz * _e1133) + _e1135);
    let _e1137 = u_xlatb18_;
    if _e1137.y {
        let _e1139 = u_xlat10_;
        local_8 = _e1139;
    } else {
        let _e1140 = u_xlat14_;
        local_8 = _e1140;
    }
    let _e1142 = local_8;
    u_xlat10_ = _e1142;
    let _e1143 = u_xlat7_;
    let _e1145 = u_xlat10_;
    u_xlat10_ = (-(_e1143) + _e1145);
    let _e1147 = u_xlat0_;
    let _e1149 = u_xlat10_;
    let _e1151 = u_xlat7_;
    u_xlat0_ = ((_e1147.xxxx * _e1149) + _e1151);
    let _e1153 = u_xlatb6_;
    if _e1153.x {
        let _e1155 = u_xlat7_;
        local_9 = _e1155;
    } else {
        let _e1156 = u_xlat0_;
        local_9 = _e1156;
    }
    let _e1158 = local_9;
    u_xlat0_ = _e1158;
    let _e1162 = _f_buffer1_.f_cb1_[15];
    let _e1167 = _f_buffer1_.f_cb1_[15];
    u_xlat6_ = (_e1162.wwww * _e1167);
    let _e1169 = u_xlat6_;
    let _e1170 = u_xlat9_;
    u_xlat7_ = (_e1169 * _e1170);
    let _e1172 = u_xlatb38_;
    let _e1182 = _f_buffer1_.f_cb1_[19];
    let _e1185 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1182.wzwz).xy;
    u_xlatb38_.x = _e1185.x;
    u_xlatb38_.y = _e1185.y;
    let _e1190 = u_xlat7_;
    let _e1195 = _f_buffer1_.f_cb1_[19];
    u_xlat39_ = (_e1190.w * _e1195.w);
    let _e1198 = u_xlat39_;
    u_xlat39_ = clamp(_e1198, 0f, 1f);
    let _e1202 = u_xlat9_;
    let _e1203 = u_xlat6_;
    let _e1205 = u_xlat0_;
    u_xlat10_ = ((_e1202 * _e1203) + -(_e1205));
    let _e1208 = u_xlat39_;
    let _e1210 = u_xlat10_;
    let _e1212 = u_xlat0_;
    u_xlat10_ = ((vec4(_e1208) * _e1210) + _e1212);
    let _e1214 = u_xlatb38_;
    if _e1214.x {
        let _e1216 = u_xlat10_;
        local_10 = _e1216;
    } else {
        let _e1217 = u_xlat0_;
        local_10 = _e1217;
    }
    let _e1219 = local_10;
    u_xlat10_ = _e1219;
    let _e1220 = u_xlat7_;
    let _e1221 = u_xlat10_;
    u_xlat12_ = (_e1220 * _e1221);
    let _e1223 = u_xlat12_;
    let _e1227 = _f_buffer1_.f_cb1_[19];
    let _e1230 = u_xlat10_;
    u_xlat10_ = ((_e1223 * _e1227.yyyy) + _e1230);
    let _e1232 = u_xlat7_;
    let _e1236 = _f_buffer1_.f_cb1_[19];
    let _e1239 = u_xlat10_;
    u_xlat10_ = ((_e1232 * _e1236.xxxx) + _e1239);
    let _e1241 = u_xlat10_;
    let _e1242 = u_xlat10_;
    u_xlat12_ = (_e1241 + _e1242);
    let _e1244 = u_xlat7_;
    let _e1245 = u_xlat12_;
    u_xlat13_ = (_e1244 * _e1245);
    let _e1247 = u_xlat10_;
    u_xlat14_ = (-(_e1247) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1255 = u_xlat14_;
    let _e1256 = u_xlat14_;
    u_xlat14_ = (_e1255 + _e1256);
    let _e1258 = u_xlat9_;
    let _e1260 = u_xlat6_;
    u_xlat6_ = ((-(_e1258) * _e1260) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1268 = u_xlat14_;
    let _e1270 = u_xlat6_;
    u_xlat6_ = ((-(_e1268) * _e1270) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1278 = u_xlat12_;
    u_xlat9_ = floor(_e1278);
    let _e1280 = u_xlat9_;
    u_xlat9_ = min(_e1280, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1287 = u_xlat12_;
    let _e1289 = u_xlat7_;
    let _e1291 = u_xlat6_;
    u_xlat6_ = ((-(_e1287) * _e1289) + _e1291);
    let _e1293 = u_xlat9_;
    let _e1294 = u_xlat6_;
    let _e1296 = u_xlat13_;
    u_xlat6_ = ((_e1293 * _e1294) + _e1296);
    let _e1298 = u_xlat0_;
    let _e1300 = u_xlat6_;
    u_xlat6_ = (-(_e1298) + _e1300);
    let _e1305 = _f_buffer1_.f_cb1_[19];
    let _e1307 = u_xlat6_;
    let _e1309 = u_xlat0_;
    u_xlat6_ = ((_e1305.zzzz * _e1307) + _e1309);
    let _e1311 = u_xlatb38_;
    if _e1311.y {
        let _e1313 = u_xlat6_;
        local_11 = _e1313;
    } else {
        let _e1314 = u_xlat10_;
        local_11 = _e1314;
    }
    let _e1316 = local_11;
    u_xlat6_ = _e1316;
    let _e1317 = u_xlat0_;
    let _e1319 = u_xlat6_;
    u_xlat6_ = (-(_e1317) + _e1319);
    let _e1321 = u_xlat21_;
    let _e1323 = u_xlat6_;
    let _e1325 = u_xlat0_;
    u_xlat6_ = ((vec4(_e1321) * _e1323) + _e1325);
    let _e1327 = u_xlatb4_;
    if _e1327.w {
        let _e1329 = u_xlat0_;
        local_12 = _e1329;
    } else {
        let _e1330 = u_xlat6_;
        local_12 = _e1330;
    }
    let _e1332 = local_12;
    u_xlat0_ = _e1332;
    let _e1336 = _f_buffer1_.f_cb1_[28];
    let _e1341 = _f_buffer1_.f_cb1_[28];
    u_xlat6_ = (_e1336.wwww * _e1341);
    let _e1343 = u_xlat6_;
    let _e1344 = u_xlat8_;
    u_xlat7_ = (_e1343 * _e1344);
    let _e1346 = u_xlatb38_;
    let _e1356 = _f_buffer1_.f_cb1_[32];
    let _e1359 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1356.wzwz).xy;
    u_xlatb38_.x = _e1359.x;
    u_xlatb38_.y = _e1359.y;
    let _e1364 = u_xlat7_;
    let _e1369 = _f_buffer1_.f_cb1_[32];
    u_xlat21_ = (_e1364.w * _e1369.w);
    let _e1372 = u_xlat21_;
    u_xlat21_ = clamp(_e1372, 0f, 1f);
    let _e1376 = u_xlat8_;
    let _e1377 = u_xlat6_;
    let _e1379 = u_xlat0_;
    u_xlat9_ = ((_e1376 * _e1377) + -(_e1379));
    let _e1382 = u_xlat21_;
    let _e1384 = u_xlat9_;
    let _e1386 = u_xlat0_;
    u_xlat9_ = ((vec4(_e1382) * _e1384) + _e1386);
    let _e1388 = u_xlatb38_;
    if _e1388.x {
        let _e1390 = u_xlat9_;
        local_13 = _e1390;
    } else {
        let _e1391 = u_xlat0_;
        local_13 = _e1391;
    }
    let _e1393 = local_13;
    u_xlat9_ = _e1393;
    let _e1394 = u_xlat7_;
    let _e1395 = u_xlat9_;
    u_xlat10_ = (_e1394 * _e1395);
    let _e1397 = u_xlat10_;
    let _e1401 = _f_buffer1_.f_cb1_[32];
    let _e1404 = u_xlat9_;
    u_xlat9_ = ((_e1397 * _e1401.yyyy) + _e1404);
    let _e1406 = u_xlat7_;
    let _e1410 = _f_buffer1_.f_cb1_[32];
    let _e1413 = u_xlat9_;
    u_xlat9_ = ((_e1406 * _e1410.xxxx) + _e1413);
    let _e1415 = u_xlat9_;
    let _e1416 = u_xlat9_;
    u_xlat10_ = (_e1415 + _e1416);
    let _e1418 = u_xlat7_;
    let _e1419 = u_xlat10_;
    u_xlat12_ = (_e1418 * _e1419);
    let _e1421 = u_xlat9_;
    u_xlat13_ = (-(_e1421) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1429 = u_xlat13_;
    let _e1430 = u_xlat13_;
    u_xlat13_ = (_e1429 + _e1430);
    let _e1432 = u_xlat8_;
    let _e1434 = u_xlat6_;
    u_xlat6_ = ((-(_e1432) * _e1434) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1442 = u_xlat13_;
    let _e1444 = u_xlat6_;
    u_xlat6_ = ((-(_e1442) * _e1444) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1452 = u_xlat10_;
    u_xlat8_ = floor(_e1452);
    let _e1454 = u_xlat8_;
    u_xlat8_ = min(_e1454, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1461 = u_xlat10_;
    let _e1463 = u_xlat7_;
    let _e1465 = u_xlat6_;
    u_xlat6_ = ((-(_e1461) * _e1463) + _e1465);
    let _e1467 = u_xlat8_;
    let _e1468 = u_xlat6_;
    let _e1470 = u_xlat12_;
    u_xlat6_ = ((_e1467 * _e1468) + _e1470);
    let _e1472 = u_xlat0_;
    let _e1474 = u_xlat6_;
    u_xlat6_ = (-(_e1472) + _e1474);
    let _e1479 = _f_buffer1_.f_cb1_[32];
    let _e1481 = u_xlat6_;
    let _e1483 = u_xlat0_;
    u_xlat6_ = ((_e1479.zzzz * _e1481) + _e1483);
    let _e1485 = u_xlatb38_;
    if _e1485.y {
        let _e1487 = u_xlat6_;
        local_14 = _e1487;
    } else {
        let _e1488 = u_xlat9_;
        local_14 = _e1488;
    }
    let _e1490 = local_14;
    u_xlat6_ = _e1490;
    let _e1491 = u_xlat0_;
    let _e1493 = u_xlat6_;
    u_xlat6_ = (-(_e1491) + _e1493);
    let _e1495 = u_xlat3_;
    let _e1497 = u_xlat6_;
    let _e1499 = u_xlat0_;
    u_xlat3_ = ((_e1495.xxxx * _e1497) + _e1499);
    let _e1501 = u_xlatb4_;
    if _e1501.z {
        let _e1503 = u_xlat0_;
        local_15 = _e1503;
    } else {
        let _e1504 = u_xlat3_;
        local_15 = _e1504;
    }
    let _e1506 = local_15;
    u_xlat0_ = _e1506;
    let _e1510 = _f_buffer1_.f_cb1_[41];
    let _e1515 = _f_buffer1_.f_cb1_[41];
    u_xlat3_ = (_e1510.wwww * _e1515);
    let _e1517 = u_xlat3_;
    let _e1518 = u_xlat5_;
    u_xlat6_ = (_e1517 * _e1518);
    let _e1520 = u_xlatb38_;
    let _e1530 = _f_buffer1_.f_cb1_[45];
    let _e1533 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1530.wzwz).xy;
    u_xlatb38_.x = _e1533.x;
    u_xlatb38_.y = _e1533.y;
    let _e1538 = u_xlat6_;
    let _e1543 = _f_buffer1_.f_cb1_[45];
    u_xlat40_ = (_e1538.w * _e1543.w);
    let _e1546 = u_xlat40_;
    u_xlat40_ = clamp(_e1546, 0f, 1f);
    let _e1550 = u_xlat5_;
    let _e1551 = u_xlat3_;
    let _e1553 = u_xlat0_;
    u_xlat7_ = ((_e1550 * _e1551) + -(_e1553));
    let _e1556 = u_xlat40_;
    let _e1558 = u_xlat7_;
    let _e1560 = u_xlat0_;
    u_xlat7_ = ((vec4(_e1556) * _e1558) + _e1560);
    let _e1562 = u_xlatb38_;
    if _e1562.x {
        let _e1564 = u_xlat7_;
        local_16 = _e1564;
    } else {
        let _e1565 = u_xlat0_;
        local_16 = _e1565;
    }
    let _e1567 = local_16;
    u_xlat7_ = _e1567;
    let _e1568 = u_xlat6_;
    let _e1569 = u_xlat7_;
    u_xlat8_ = (_e1568 * _e1569);
    let _e1571 = u_xlat8_;
    let _e1575 = _f_buffer1_.f_cb1_[45];
    let _e1578 = u_xlat7_;
    u_xlat7_ = ((_e1571 * _e1575.yyyy) + _e1578);
    let _e1580 = u_xlat6_;
    let _e1584 = _f_buffer1_.f_cb1_[45];
    let _e1587 = u_xlat7_;
    u_xlat7_ = ((_e1580 * _e1584.xxxx) + _e1587);
    let _e1589 = u_xlat7_;
    let _e1590 = u_xlat7_;
    u_xlat8_ = (_e1589 + _e1590);
    let _e1592 = u_xlat6_;
    let _e1593 = u_xlat8_;
    u_xlat9_ = (_e1592 * _e1593);
    let _e1595 = u_xlat7_;
    u_xlat10_ = (-(_e1595) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1603 = u_xlat10_;
    let _e1604 = u_xlat10_;
    u_xlat10_ = (_e1603 + _e1604);
    let _e1606 = u_xlat5_;
    let _e1608 = u_xlat3_;
    u_xlat3_ = ((-(_e1606) * _e1608) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1616 = u_xlat10_;
    let _e1618 = u_xlat3_;
    u_xlat3_ = ((-(_e1616) * _e1618) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1626 = u_xlat8_;
    u_xlat5_ = floor(_e1626);
    let _e1628 = u_xlat5_;
    u_xlat5_ = min(_e1628, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1635 = u_xlat8_;
    let _e1637 = u_xlat6_;
    let _e1639 = u_xlat3_;
    u_xlat3_ = ((-(_e1635) * _e1637) + _e1639);
    let _e1641 = u_xlat5_;
    let _e1642 = u_xlat3_;
    let _e1644 = u_xlat9_;
    u_xlat3_ = ((_e1641 * _e1642) + _e1644);
    let _e1646 = u_xlat0_;
    let _e1648 = u_xlat3_;
    u_xlat3_ = (-(_e1646) + _e1648);
    let _e1653 = _f_buffer1_.f_cb1_[45];
    let _e1655 = u_xlat3_;
    let _e1657 = u_xlat0_;
    u_xlat3_ = ((_e1653.zzzz * _e1655) + _e1657);
    let _e1659 = u_xlatb38_;
    if _e1659.y {
        let _e1661 = u_xlat3_;
        local_17 = _e1661;
    } else {
        let _e1662 = u_xlat7_;
        local_17 = _e1662;
    }
    let _e1664 = local_17;
    u_xlat3_ = _e1664;
    let _e1665 = u_xlat0_;
    let _e1667 = u_xlat3_;
    u_xlat3_ = (-(_e1665) + _e1667);
    let _e1669 = u_xlat20_;
    let _e1671 = u_xlat3_;
    let _e1673 = u_xlat0_;
    u_xlat3_ = ((_e1669.xxxx * _e1671) + _e1673);
    let _e1675 = u_xlatb4_;
    if _e1675.y {
        let _e1677 = u_xlat0_;
        local_18 = _e1677;
    } else {
        let _e1678 = u_xlat3_;
        local_18 = _e1678;
    }
    let _e1680 = local_18;
    u_xlat0_ = _e1680;
    let _e1681 = u_xlatb4_;
    if _e1681.x {
        let _e1683 = u_xlat0_;
        local_19 = _e1683;
    } else {
        let _e1684 = u_xlat1_;
        local_19 = _e1684;
    }
    let _e1686 = local_19;
    u_xlat1_ = _e1686;
    let _e1691 = _f_buffer1_.f_cb1_[67];
    u_xlatb20_.x = (_e1691.z == 5f);
    let _e1695 = u_xlatb20_;
    if _e1695.x {
        {
            let _e1697 = u_xlat1_;
            let _e1698 = u_xlat2_;
            let _e1701 = u_xlat1_;
            u_xlat3_ = ((_e1697 * vec4(_e1698)) + -(_e1701));
            let _e1707 = _f_buffer1_.f_cb1_[67];
            let _e1709 = u_xlat3_;
            let _e1711 = u_xlat1_;
            u_xlat3_ = ((_e1707.wwww * _e1709) + _e1711);
            u_xlat11_.w = 1f;
            let _e1715 = u_xlat3_;
            let _e1719 = _f_buffer1_.f_cb1_[54];
            let _e1721 = u_xlat11_;
            SV_Target0_ = ((_e1715 * _e1719) + _e1721.xxxw);
            return;
        }
    }
    let _e1727 = _f_buffer1_.f_cb1_[54];
    let _e1732 = _f_buffer1_.f_cb1_[54];
    u_xlat3_ = (_e1727.wwww * _e1732);
    let _e1734 = u_xlat1_;
    let _e1735 = u_xlat3_;
    u_xlat5_ = (_e1734 * _e1735);
    let _e1737 = u_xlatb20_;
    let _e1747 = _f_buffer1_.f_cb1_[58];
    let _e1750 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1747.wzww).xy;
    u_xlatb20_.x = _e1750.x;
    u_xlatb20_.y = _e1750.y;
    let _e1755 = u_xlat5_;
    let _e1760 = _f_buffer1_.f_cb1_[58];
    u_xlat56_ = (_e1755.w * _e1760.w);
    let _e1763 = u_xlat56_;
    u_xlat56_ = clamp(_e1763, 0f, 1f);
    let _e1767 = u_xlat1_;
    let _e1768 = u_xlat3_;
    let _e1770 = u_xlat0_;
    u_xlat6_ = ((_e1767 * _e1768) + -(_e1770));
    let _e1773 = u_xlat56_;
    let _e1775 = u_xlat6_;
    let _e1777 = u_xlat0_;
    u_xlat6_ = ((vec4(_e1773) * _e1775) + _e1777);
    let _e1779 = u_xlatb20_;
    if _e1779.x {
        let _e1781 = u_xlat6_;
        local_20 = _e1781;
    } else {
        let _e1782 = u_xlat0_;
        local_20 = _e1782;
    }
    let _e1784 = local_20;
    u_xlat6_ = _e1784;
    let _e1785 = u_xlat5_;
    let _e1786 = u_xlat6_;
    u_xlat7_ = (_e1785 * _e1786);
    let _e1788 = u_xlat7_;
    let _e1792 = _f_buffer1_.f_cb1_[58];
    let _e1795 = u_xlat6_;
    u_xlat6_ = ((_e1788 * _e1792.yyyy) + _e1795);
    let _e1797 = u_xlat5_;
    let _e1801 = _f_buffer1_.f_cb1_[58];
    let _e1804 = u_xlat6_;
    u_xlat6_ = ((_e1797 * _e1801.xxxx) + _e1804);
    let _e1806 = u_xlat6_;
    let _e1807 = u_xlat6_;
    u_xlat7_ = (_e1806 + _e1807);
    let _e1809 = u_xlat5_;
    let _e1810 = u_xlat7_;
    u_xlat8_ = (_e1809 * _e1810);
    let _e1812 = u_xlat6_;
    u_xlat9_ = (-(_e1812) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1820 = u_xlat9_;
    let _e1821 = u_xlat9_;
    u_xlat9_ = (_e1820 + _e1821);
    let _e1823 = u_xlat1_;
    let _e1825 = u_xlat3_;
    u_xlat1_ = ((-(_e1823) * _e1825) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1833 = u_xlat9_;
    let _e1835 = u_xlat1_;
    u_xlat1_ = ((-(_e1833) * _e1835) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1843 = u_xlat7_;
    u_xlat3_ = floor(_e1843);
    let _e1845 = u_xlat3_;
    u_xlat3_ = min(_e1845, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1852 = u_xlat7_;
    let _e1854 = u_xlat5_;
    let _e1856 = u_xlat1_;
    u_xlat1_ = ((-(_e1852) * _e1854) + _e1856);
    let _e1858 = u_xlat3_;
    let _e1859 = u_xlat1_;
    let _e1861 = u_xlat8_;
    u_xlat1_ = ((_e1858 * _e1859) + _e1861);
    let _e1863 = u_xlat0_;
    let _e1865 = u_xlat1_;
    u_xlat1_ = (-(_e1863) + _e1865);
    let _e1870 = _f_buffer1_.f_cb1_[58];
    let _e1872 = u_xlat1_;
    let _e1874 = u_xlat0_;
    u_xlat1_ = ((_e1870.zzzz * _e1872) + _e1874);
    let _e1876 = u_xlatb20_;
    if _e1876.y {
        let _e1878 = u_xlat1_;
        local_21 = _e1878;
    } else {
        let _e1879 = u_xlat6_;
        local_21 = _e1879;
    }
    let _e1881 = local_21;
    u_xlat1_ = _e1881;
    let _e1882 = u_xlat0_;
    let _e1884 = u_xlat1_;
    u_xlat1_ = (-(_e1882) + _e1884);
    let _e1886 = u_xlat2_;
    let _e1888 = u_xlat1_;
    let _e1890 = u_xlat0_;
    u_xlat1_ = ((vec4(_e1886) * _e1888) + _e1890);
    let _e1892 = u_xlatb4_;
    if _e1892.x {
        let _e1894 = u_xlat0_;
        local_22 = _e1894;
    } else {
        let _e1895 = u_xlat1_;
        local_22 = _e1895;
    }
    let _e1897 = local_22;
    u_xlat0_ = _e1897;
    let _e1898 = u_xlat0_;
    u_xlat0_ = clamp(_e1898, vec4(0f), vec4(1f));
    let _e1904 = u_xlat0_;
    let _e1905 = vs_COLOR0_1;
    u_xlat1_ = (_e1904 * _e1905);
    let _e1907 = u_xlat0_;
    let _e1908 = u_xlat1_;
    SV_Target0_ = min(_e1907, _e1908);
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
