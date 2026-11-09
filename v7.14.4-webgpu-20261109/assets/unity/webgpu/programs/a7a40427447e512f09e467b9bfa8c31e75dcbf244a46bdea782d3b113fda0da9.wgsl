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
    let _e351 = u_xlat0_;
    let _e355 = _f_buffer1_.f_cb1_[27];
    u_xlat3_.x = dot(_e351, _e355);
    let _e358 = u_xlat3_;
    u_xlat3_.x = min(_e358.x, 1f);
    let _e363 = u_xlat3_;
    let _e365 = u_xlat7_;
    u_xlat3_.x = (_e363.x * _e365.w);
    let _e368 = u_xlat3_;
    let _e370 = u_xlat7_;
    u_xlat8_ = (_e368.xxxx * _e370.xyxy);
    let _e373 = u_xlat8_;
    let _e377 = _f_buffer1_.f_cb1_[33];
    u_xlat8_ = (_e373 * _e377.zwxy);
    let _e380 = u_xlat3_;
    let _e382 = u_xlat8_;
    u_xlat8_ = (_e380.xxxx * _e382);
    let _e384 = u_xlatb4_;
    if _e384.z {
        local_2 = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e391 = u_xlat8_;
        local_2 = _e391;
    }
    let _e393 = local_2;
    u_xlat8_ = _e393;
    let _e394 = u_xlat38_;
    let _e396 = u_xlat38_;
    let _e398 = u_xlat8_;
    let _e400 = (_e396.xy + _e398.xy);
    u_xlat38_.x = _e400.x;
    u_xlat38_.y = _e400.y;
    let _e405 = u_xlat6_;
    let _e407 = u_xlat38_;
    let _e413 = vs_TEXCOORD1_1;
    let _e415 = ((_e407.xy * vec2<f32>(0.001f, 0.001f)) + _e413.xy);
    u_xlat6_.x = _e415.x;
    u_xlat6_.y = _e415.y;
    let _e420 = u_xlat6_;
    let _e425 = _f_buffer0_.f_cb0_[4];
    let _e430 = hscard_bias.values[4];
    let _e433 = textureSampleBias(f_t4_, samplerf_s4_, _e420.xy, (_e425.x + _e430.x));
    u_xlat9_ = _e433;
    let _e437 = _f_buffer1_.f_cb1_[26];
    let _e442 = _f_buffer1_.f_cb1_[26];
    u_xlat21_ = (_e437.y + _e442.x);
    let _e446 = u_xlat21_;
    u_xlat6_.x = sin(_e446);
    let _e449 = u_xlat21_;
    u_xlat8_.x = cos(_e449);
    let _e452 = u_xlat6_;
    u_xlat10_.x = -(_e452.x);
    let _e455 = u_xlat11_;
    let _e460 = _f_buffer1_.f_cb1_[24];
    let _e466 = _f_buffer1_.f_cb1_[26];
    let _e468 = (-(_e460.xy) + _e466.zw);
    u_xlat11_.x = _e468.x;
    u_xlat11_.y = _e468.y;
    let _e473 = u_xlat9_;
    let _e475 = u_xlat9_;
    let _e477 = u_xlat11_;
    let _e480 = (_e475.xy + -(_e477.xy));
    u_xlat9_.x = _e480.x;
    u_xlat9_.y = _e480.y;
    let _e486 = u_xlat8_;
    u_xlat10_.y = _e486.x;
    let _e489 = u_xlat6_;
    u_xlat10_.z = _e489.x;
    let _e492 = u_xlat9_;
    let _e494 = u_xlat10_;
    u_xlat6_.x = dot(_e492.xy, _e494.yz);
    let _e498 = u_xlat9_;
    let _e500 = u_xlat10_;
    u_xlat6_.y = dot(_e498.xy, _e500.xy);
    let _e503 = u_xlat6_;
    let _e505 = u_xlat11_;
    let _e507 = u_xlat6_;
    let _e509 = (_e505.xy + _e507.xy);
    u_xlat6_.x = _e509.x;
    u_xlat6_.y = _e509.y;
    let _e514 = u_xlat8_;
    let _e519 = _f_buffer1_.f_cb1_[24];
    let _e525 = _f_buffer1_.f_cb1_[25];
    let _e527 = (-(_e519.xy) + _e525.zw);
    u_xlat8_.x = _e527.x;
    u_xlat8_.y = _e527.y;
    let _e532 = u_xlat6_;
    let _e534 = u_xlat6_;
    let _e536 = u_xlat8_;
    let _e539 = (_e534.xy + -(_e536.xy));
    u_xlat6_.x = _e539.x;
    u_xlat6_.y = _e539.y;
    let _e544 = u_xlat6_;
    let _e546 = u_xlat6_;
    let _e551 = _f_buffer1_.f_cb1_[25];
    let _e554 = u_xlat8_;
    let _e556 = ((_e546.xy * _e551.xy) + _e554.xy);
    u_xlat6_.x = _e556.x;
    u_xlat6_.y = _e556.y;
    let _e561 = u_xlat8_;
    let _e566 = _f_buffer1_.f_cb1_[24];
    let _e571 = _f_buffer1_.f_cb1_[24];
    let _e573 = (_e566.zw + _e571.xy);
    u_xlat8_.x = _e573.x;
    u_xlat8_.y = _e573.y;
    let _e578 = u_xlat6_;
    let _e580 = u_xlat6_;
    let _e582 = u_xlat8_;
    let _e584 = (_e580.xy + _e582.xy);
    u_xlat6_.x = _e584.x;
    u_xlat6_.y = _e584.y;
    let _e589 = u_xlat6_;
    let _e594 = _f_buffer0_.f_cb0_[4];
    let _e599 = hscard_bias.values[3];
    let _e602 = textureSampleBias(f_t3_, samplerf_s3_, _e589.xy, (_e594.x + _e599.x));
    u_xlat10_ = _e602;
    let _e604 = u_xlat9_;
    let _e606 = u_xlat10_;
    u_xlat10_.w = (_e604.z * _e606.w);
    let _e609 = u_xlat0_;
    let _e613 = _f_buffer1_.f_cb1_[14];
    u_xlat21_ = dot(_e609, _e613);
    let _e615 = u_xlat21_;
    u_xlat21_ = min(_e615, 1f);
    let _e618 = u_xlat21_;
    let _e619 = u_xlat10_;
    u_xlat21_ = (_e618 * _e619.w);
    let _e622 = u_xlat6_;
    let _e624 = u_xlat21_;
    let _e626 = u_xlat10_;
    let _e628 = (vec2(_e624) * _e626.xy);
    u_xlat6_.x = _e628.x;
    u_xlat6_.y = _e628.y;
    let _e633 = u_xlat8_;
    let _e635 = u_xlat10_;
    let _e640 = _f_buffer1_.f_cb1_[20];
    let _e642 = (_e635.xy * _e640.zw);
    u_xlat8_.x = _e642.x;
    u_xlat8_.y = _e642.y;
    let _e647 = u_xlat8_;
    let _e649 = u_xlat21_;
    let _e651 = u_xlat8_;
    let _e653 = (vec2(_e649) * _e651.xy);
    u_xlat8_.x = _e653.x;
    u_xlat8_.y = _e653.y;
    let _e658 = u_xlat8_;
    let _e660 = u_xlatb4_;
    if _e660.w {
        local_3 = vec2<f32>(0f, 0f);
    } else {
        let _e665 = u_xlat8_;
        local_3 = _e665.xy;
    }
    let _e668 = local_3;
    u_xlat8_.x = _e668.x;
    u_xlat8_.y = _e668.y;
    let _e673 = u_xlat38_;
    let _e675 = u_xlat38_;
    let _e677 = u_xlat8_;
    let _e679 = (_e675.xy + _e677.xy);
    u_xlat38_.x = _e679.x;
    u_xlat38_.y = _e679.y;
    let _e684 = u_xlat38_;
    let _e686 = u_xlat38_;
    let _e692 = vs_TEXCOORD0_1;
    let _e694 = ((_e686.xy * vec2<f32>(0.001f, 0.001f)) + _e692.zw);
    u_xlat38_.x = _e694.x;
    u_xlat38_.y = _e694.y;
    let _e699 = u_xlat38_;
    let _e704 = _f_buffer0_.f_cb0_[4];
    let _e709 = hscard_bias.values[2];
    let _e712 = textureSampleBias(f_t2_, samplerf_s2_, _e699.xy, (_e704.x + _e709.x));
    u_xlat9_ = _e712;
    let _e714 = u_xlat0_;
    let _e718 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = dot(_e714, _e718);
    let _e721 = u_xlat0_;
    u_xlat0_.x = min(_e721.x, 1f);
    let _e726 = u_xlat0_;
    let _e728 = u_xlat9_;
    u_xlat0_.x = (_e726.x * _e728.w);
    let _e731 = u_xlat18_;
    let _e733 = u_xlat9_;
    let _e738 = _f_buffer1_.f_cb1_[8];
    let _e740 = (_e733.xy * _e738.xy);
    u_xlat18_.x = _e740.x;
    u_xlat18_.y = _e740.y;
    let _e745 = u_xlat18_;
    let _e747 = u_xlat0_;
    let _e749 = u_xlat18_;
    let _e751 = (_e747.xx * _e749.xy);
    u_xlat18_.x = _e751.x;
    u_xlat18_.y = _e751.y;
    let _e756 = u_xlat38_;
    let _e758 = u_xlat6_;
    let _e763 = _f_buffer1_.f_cb1_[20];
    let _e765 = (_e758.xy * _e763.xy);
    u_xlat38_.x = _e765.x;
    u_xlat38_.y = _e765.y;
    let _e770 = u_xlat38_;
    let _e772 = u_xlat21_;
    let _e774 = u_xlat38_;
    let _e776 = (vec2(_e772) * _e774.xy);
    u_xlat38_.x = _e776.x;
    u_xlat38_.y = _e776.y;
    let _e781 = u_xlatb6_;
    let _e786 = _f_buffer1_.f_cb1_[67];
    let _e794 = (_e786.zzzz == vec4<f32>(11f, 1f, 0f, 0f)).xy;
    u_xlatb6_.x = _e794.x;
    u_xlatb6_.y = _e794.y;
    let _e799 = u_xlat18_;
    let _e801 = u_xlatb6_;
    if _e801.x {
        local_4 = vec2<f32>(0f, 0f);
    } else {
        let _e806 = u_xlat18_;
        local_4 = _e806.xy;
    }
    let _e809 = local_4;
    u_xlat18_.x = _e809.x;
    u_xlat18_.y = _e809.y;
    let _e814 = u_xlat38_;
    let _e816 = u_xlatb4_;
    if _e816.w {
        local_5 = vec2<f32>(0f, 0f);
    } else {
        let _e821 = u_xlat38_;
        local_5 = _e821.xy;
    }
    let _e824 = local_5;
    u_xlat38_.x = _e824.x;
    u_xlat38_.y = _e824.y;
    let _e829 = u_xlat18_;
    let _e831 = u_xlat18_;
    let _e833 = u_xlat38_;
    let _e835 = (_e831.xy + _e833.xy);
    u_xlat18_.x = _e835.x;
    u_xlat18_.y = _e835.y;
    let _e840 = u_xlat18_;
    let _e842 = u_xlat8_;
    let _e844 = u_xlat18_;
    let _e846 = (_e842.zw + _e844.xy);
    u_xlat18_.x = _e846.x;
    u_xlat18_.y = _e846.y;
    let _e851 = u_xlat18_;
    let _e853 = u_xlat6_;
    let _e855 = u_xlat18_;
    let _e857 = (_e853.zw + _e855.xy);
    u_xlat18_.x = _e857.x;
    u_xlat18_.y = _e857.y;
    let _e862 = u_xlat18_;
    let _e864 = u_xlat3_;
    let _e866 = u_xlat18_;
    let _e868 = (_e864.zw + _e866.xy);
    u_xlat18_.x = _e868.x;
    u_xlat18_.y = _e868.y;
    let _e873 = u_xlat18_;
    let _e875 = u_xlat18_;
    let _e881 = vs_TEXCOORD0_1;
    let _e883 = ((_e875.xy * vec2<f32>(0.001f, 0.001f)) + _e881.xy);
    u_xlat18_.x = _e883.x;
    u_xlat18_.y = _e883.y;
    let _e888 = u_xlat18_;
    let _e893 = _f_buffer0_.f_cb0_[4];
    let _e898 = hscard_bias.values[0];
    let _e901 = textureSampleBias(f_t0_, samplerf_s0_, _e888.xy, (_e893.x + _e898.x));
    u_xlat8_ = _e901;
    let _e907 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (0f < _e907.z);
    let _e910 = u_xlat8_;
    u_xlat36_ = dot(_e910, vec4<f32>(0.1f, 0.1f, 0.1f, 0.1f));
    let _e918 = u_xlatb18_;
    if _e918.x {
        let _e920 = u_xlat36_;
        local_6 = _e920;
    } else {
        local_6 = 0f;
    }
    let _e924 = local_6;
    u_xlat11_.x = _e924;
    let _e925 = u_xlatb6_;
    if _e925.y {
        {
            let _e927 = u_xlat9_;
            let _e928 = u_xlat0_;
            let _e931 = u_xlat9_;
            u_xlat12_ = ((_e927 * _e928.xxxx) + -(_e931));
            let _e937 = _f_buffer1_.f_cb1_[67];
            let _e939 = u_xlat12_;
            let _e941 = u_xlat9_;
            u_xlat12_ = ((_e937.wwww * _e939) + _e941);
            u_xlat11_.y = 1f;
            let _e945 = u_xlat12_;
            let _e949 = _f_buffer1_.f_cb1_[3];
            let _e951 = u_xlat11_;
            SV_Target0_ = ((_e945 * _e949) + _e951.xxxy);
            return;
        }
    }
    let _e958 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e958.z == 2f);
    let _e962 = u_xlatb18_;
    if _e962.x {
        {
            let _e964 = u_xlat10_;
            let _e965 = u_xlat21_;
            let _e968 = u_xlat10_;
            u_xlat12_ = ((_e964 * vec4(_e965)) + -(_e968));
            let _e974 = _f_buffer1_.f_cb1_[67];
            let _e976 = u_xlat12_;
            let _e978 = u_xlat10_;
            u_xlat12_ = ((_e974.wwww * _e976) + _e978);
            u_xlat11_.z = 1f;
            let _e982 = u_xlat12_;
            let _e986 = _f_buffer1_.f_cb1_[15];
            let _e988 = u_xlat11_;
            SV_Target0_ = ((_e982 * _e986) + _e988.xxxz);
            return;
        }
    }
    let _e995 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e995.z == 3f);
    let _e999 = u_xlatb18_;
    if _e999.x {
        {
            let _e1001 = u_xlat7_;
            let _e1002 = u_xlat3_;
            let _e1005 = u_xlat7_;
            u_xlat12_ = ((_e1001 * _e1002.xxxx) + -(_e1005));
            let _e1011 = _f_buffer1_.f_cb1_[67];
            let _e1013 = u_xlat12_;
            let _e1015 = u_xlat7_;
            u_xlat12_ = ((_e1011.wwww * _e1013) + _e1015);
            u_xlat11_.w = 1f;
            let _e1019 = u_xlat12_;
            let _e1023 = _f_buffer1_.f_cb1_[28];
            let _e1025 = u_xlat11_;
            SV_Target0_ = ((_e1019 * _e1023) + _e1025.xxxw);
            return;
        }
    }
    let _e1032 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e1032.z == 4f);
    let _e1036 = u_xlatb18_;
    if _e1036.x {
        {
            let _e1038 = u_xlat5_;
            let _e1039 = u_xlat20_;
            let _e1042 = u_xlat5_;
            u_xlat12_ = ((_e1038 * _e1039.xxxx) + -(_e1042));
            let _e1048 = _f_buffer1_.f_cb1_[67];
            let _e1050 = u_xlat12_;
            let _e1052 = u_xlat5_;
            u_xlat12_ = ((_e1048.wwww * _e1050) + _e1052);
            u_xlat11_.w = 1f;
            let _e1056 = u_xlat12_;
            let _e1060 = _f_buffer1_.f_cb1_[41];
            let _e1062 = u_xlat11_;
            SV_Target0_ = ((_e1056 * _e1060) + _e1062.xxxw);
            return;
        }
    }
    let _e1068 = _f_buffer1_.f_cb1_[3];
    let _e1073 = _f_buffer1_.f_cb1_[3];
    u_xlat12_ = (_e1068.wwww * _e1073);
    let _e1075 = u_xlat9_;
    let _e1076 = u_xlat12_;
    u_xlat13_ = (_e1075 * _e1076);
    let _e1078 = u_xlatb18_;
    let _e1088 = _f_buffer1_.f_cb1_[7];
    let _e1091 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1088.wzww).xy;
    u_xlatb18_.x = _e1091.x;
    u_xlatb18_.y = _e1091.y;
    let _e1096 = u_xlat13_;
    let _e1101 = _f_buffer1_.f_cb1_[7];
    u_xlat54_ = (_e1096.w * _e1101.w);
    let _e1104 = u_xlat54_;
    u_xlat54_ = clamp(_e1104, 0f, 1f);
    let _e1108 = u_xlat9_;
    let _e1109 = u_xlat12_;
    let _e1111 = u_xlat8_;
    u_xlat14_ = ((_e1108 * _e1109) + -(_e1111));
    let _e1114 = u_xlat54_;
    let _e1116 = u_xlat14_;
    let _e1118 = u_xlat8_;
    u_xlat14_ = ((vec4(_e1114) * _e1116) + _e1118);
    let _e1120 = u_xlatb18_;
    if _e1120.x {
        let _e1122 = u_xlat14_;
        local_7 = _e1122;
    } else {
        let _e1123 = u_xlat8_;
        local_7 = _e1123;
    }
    let _e1125 = local_7;
    u_xlat14_ = _e1125;
    let _e1126 = u_xlat13_;
    let _e1127 = u_xlat14_;
    u_xlat15_ = (_e1126 * _e1127);
    let _e1129 = u_xlat15_;
    let _e1133 = _f_buffer1_.f_cb1_[7];
    let _e1136 = u_xlat14_;
    u_xlat14_ = ((_e1129 * _e1133.yyyy) + _e1136);
    let _e1138 = u_xlat13_;
    let _e1142 = _f_buffer1_.f_cb1_[7];
    let _e1145 = u_xlat14_;
    u_xlat14_ = ((_e1138 * _e1142.xxxx) + _e1145);
    let _e1147 = u_xlat14_;
    let _e1148 = u_xlat14_;
    u_xlat15_ = (_e1147 + _e1148);
    let _e1150 = u_xlat13_;
    let _e1151 = u_xlat15_;
    u_xlat16_ = (_e1150 * _e1151);
    let _e1153 = u_xlat14_;
    u_xlat17_ = (-(_e1153) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1161 = u_xlat17_;
    let _e1162 = u_xlat17_;
    u_xlat17_ = (_e1161 + _e1162);
    let _e1164 = u_xlat9_;
    let _e1166 = u_xlat12_;
    u_xlat9_ = ((-(_e1164) * _e1166) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1174 = u_xlat17_;
    let _e1176 = u_xlat9_;
    u_xlat9_ = ((-(_e1174) * _e1176) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1184 = u_xlat15_;
    u_xlat12_ = floor(_e1184);
    let _e1186 = u_xlat12_;
    u_xlat12_ = min(_e1186, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1193 = u_xlat15_;
    let _e1195 = u_xlat13_;
    let _e1197 = u_xlat9_;
    u_xlat9_ = ((-(_e1193) * _e1195) + _e1197);
    let _e1199 = u_xlat12_;
    let _e1200 = u_xlat9_;
    let _e1202 = u_xlat16_;
    u_xlat9_ = ((_e1199 * _e1200) + _e1202);
    let _e1204 = u_xlat8_;
    let _e1206 = u_xlat9_;
    u_xlat9_ = (-(_e1204) + _e1206);
    let _e1211 = _f_buffer1_.f_cb1_[7];
    let _e1213 = u_xlat9_;
    let _e1215 = u_xlat8_;
    u_xlat9_ = ((_e1211.zzzz * _e1213) + _e1215);
    let _e1217 = u_xlatb18_;
    if _e1217.y {
        let _e1219 = u_xlat9_;
        local_8 = _e1219;
    } else {
        let _e1220 = u_xlat14_;
        local_8 = _e1220;
    }
    let _e1222 = local_8;
    u_xlat9_ = _e1222;
    let _e1223 = u_xlat8_;
    let _e1225 = u_xlat9_;
    u_xlat9_ = (-(_e1223) + _e1225);
    let _e1227 = u_xlat0_;
    let _e1229 = u_xlat9_;
    let _e1231 = u_xlat8_;
    u_xlat0_ = ((_e1227.xxxx * _e1229) + _e1231);
    let _e1233 = u_xlatb6_;
    if _e1233.x {
        let _e1235 = u_xlat8_;
        local_9 = _e1235;
    } else {
        let _e1236 = u_xlat0_;
        local_9 = _e1236;
    }
    let _e1238 = local_9;
    u_xlat0_ = _e1238;
    let _e1242 = _f_buffer1_.f_cb1_[15];
    let _e1247 = _f_buffer1_.f_cb1_[15];
    u_xlat6_ = (_e1242.wwww * _e1247);
    let _e1249 = u_xlat6_;
    let _e1250 = u_xlat10_;
    u_xlat8_ = (_e1249 * _e1250);
    let _e1252 = u_xlatb38_;
    let _e1262 = _f_buffer1_.f_cb1_[19];
    let _e1265 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1262.wzwz).xy;
    u_xlatb38_.x = _e1265.x;
    u_xlatb38_.y = _e1265.y;
    let _e1270 = u_xlat8_;
    let _e1275 = _f_buffer1_.f_cb1_[19];
    u_xlat39_ = (_e1270.w * _e1275.w);
    let _e1278 = u_xlat39_;
    u_xlat39_ = clamp(_e1278, 0f, 1f);
    let _e1282 = u_xlat10_;
    let _e1283 = u_xlat6_;
    let _e1285 = u_xlat0_;
    u_xlat9_ = ((_e1282 * _e1283) + -(_e1285));
    let _e1288 = u_xlat39_;
    let _e1290 = u_xlat9_;
    let _e1292 = u_xlat0_;
    u_xlat9_ = ((vec4(_e1288) * _e1290) + _e1292);
    let _e1294 = u_xlatb38_;
    if _e1294.x {
        let _e1296 = u_xlat9_;
        local_10 = _e1296;
    } else {
        let _e1297 = u_xlat0_;
        local_10 = _e1297;
    }
    let _e1299 = local_10;
    u_xlat9_ = _e1299;
    let _e1300 = u_xlat8_;
    let _e1301 = u_xlat9_;
    u_xlat12_ = (_e1300 * _e1301);
    let _e1303 = u_xlat12_;
    let _e1307 = _f_buffer1_.f_cb1_[19];
    let _e1310 = u_xlat9_;
    u_xlat9_ = ((_e1303 * _e1307.yyyy) + _e1310);
    let _e1312 = u_xlat8_;
    let _e1316 = _f_buffer1_.f_cb1_[19];
    let _e1319 = u_xlat9_;
    u_xlat9_ = ((_e1312 * _e1316.xxxx) + _e1319);
    let _e1321 = u_xlat9_;
    let _e1322 = u_xlat9_;
    u_xlat12_ = (_e1321 + _e1322);
    let _e1324 = u_xlat8_;
    let _e1325 = u_xlat12_;
    u_xlat13_ = (_e1324 * _e1325);
    let _e1327 = u_xlat9_;
    u_xlat14_ = (-(_e1327) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1335 = u_xlat14_;
    let _e1336 = u_xlat14_;
    u_xlat14_ = (_e1335 + _e1336);
    let _e1338 = u_xlat10_;
    let _e1340 = u_xlat6_;
    u_xlat6_ = ((-(_e1338) * _e1340) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1348 = u_xlat14_;
    let _e1350 = u_xlat6_;
    u_xlat6_ = ((-(_e1348) * _e1350) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1358 = u_xlat12_;
    u_xlat10_ = floor(_e1358);
    let _e1360 = u_xlat10_;
    u_xlat10_ = min(_e1360, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1367 = u_xlat12_;
    let _e1369 = u_xlat8_;
    let _e1371 = u_xlat6_;
    u_xlat6_ = ((-(_e1367) * _e1369) + _e1371);
    let _e1373 = u_xlat10_;
    let _e1374 = u_xlat6_;
    let _e1376 = u_xlat13_;
    u_xlat6_ = ((_e1373 * _e1374) + _e1376);
    let _e1378 = u_xlat0_;
    let _e1380 = u_xlat6_;
    u_xlat6_ = (-(_e1378) + _e1380);
    let _e1385 = _f_buffer1_.f_cb1_[19];
    let _e1387 = u_xlat6_;
    let _e1389 = u_xlat0_;
    u_xlat6_ = ((_e1385.zzzz * _e1387) + _e1389);
    let _e1391 = u_xlatb38_;
    if _e1391.y {
        let _e1393 = u_xlat6_;
        local_11 = _e1393;
    } else {
        let _e1394 = u_xlat9_;
        local_11 = _e1394;
    }
    let _e1396 = local_11;
    u_xlat6_ = _e1396;
    let _e1397 = u_xlat0_;
    let _e1399 = u_xlat6_;
    u_xlat6_ = (-(_e1397) + _e1399);
    let _e1401 = u_xlat21_;
    let _e1403 = u_xlat6_;
    let _e1405 = u_xlat0_;
    u_xlat6_ = ((vec4(_e1401) * _e1403) + _e1405);
    let _e1407 = u_xlatb4_;
    if _e1407.w {
        let _e1409 = u_xlat0_;
        local_12 = _e1409;
    } else {
        let _e1410 = u_xlat6_;
        local_12 = _e1410;
    }
    let _e1412 = local_12;
    u_xlat0_ = _e1412;
    let _e1416 = _f_buffer1_.f_cb1_[28];
    let _e1421 = _f_buffer1_.f_cb1_[28];
    u_xlat6_ = (_e1416.wwww * _e1421);
    let _e1423 = u_xlat6_;
    let _e1424 = u_xlat7_;
    u_xlat8_ = (_e1423 * _e1424);
    let _e1426 = u_xlatb38_;
    let _e1436 = _f_buffer1_.f_cb1_[32];
    let _e1439 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1436.wzwz).xy;
    u_xlatb38_.x = _e1439.x;
    u_xlatb38_.y = _e1439.y;
    let _e1444 = u_xlat8_;
    let _e1449 = _f_buffer1_.f_cb1_[32];
    u_xlat21_ = (_e1444.w * _e1449.w);
    let _e1452 = u_xlat21_;
    u_xlat21_ = clamp(_e1452, 0f, 1f);
    let _e1456 = u_xlat7_;
    let _e1457 = u_xlat6_;
    let _e1459 = u_xlat0_;
    u_xlat9_ = ((_e1456 * _e1457) + -(_e1459));
    let _e1462 = u_xlat21_;
    let _e1464 = u_xlat9_;
    let _e1466 = u_xlat0_;
    u_xlat9_ = ((vec4(_e1462) * _e1464) + _e1466);
    let _e1468 = u_xlatb38_;
    if _e1468.x {
        let _e1470 = u_xlat9_;
        local_13 = _e1470;
    } else {
        let _e1471 = u_xlat0_;
        local_13 = _e1471;
    }
    let _e1473 = local_13;
    u_xlat9_ = _e1473;
    let _e1474 = u_xlat8_;
    let _e1475 = u_xlat9_;
    u_xlat10_ = (_e1474 * _e1475);
    let _e1477 = u_xlat10_;
    let _e1481 = _f_buffer1_.f_cb1_[32];
    let _e1484 = u_xlat9_;
    u_xlat9_ = ((_e1477 * _e1481.yyyy) + _e1484);
    let _e1486 = u_xlat8_;
    let _e1490 = _f_buffer1_.f_cb1_[32];
    let _e1493 = u_xlat9_;
    u_xlat9_ = ((_e1486 * _e1490.xxxx) + _e1493);
    let _e1495 = u_xlat9_;
    let _e1496 = u_xlat9_;
    u_xlat10_ = (_e1495 + _e1496);
    let _e1498 = u_xlat8_;
    let _e1499 = u_xlat10_;
    u_xlat12_ = (_e1498 * _e1499);
    let _e1501 = u_xlat9_;
    u_xlat13_ = (-(_e1501) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1509 = u_xlat13_;
    let _e1510 = u_xlat13_;
    u_xlat13_ = (_e1509 + _e1510);
    let _e1512 = u_xlat7_;
    let _e1514 = u_xlat6_;
    u_xlat6_ = ((-(_e1512) * _e1514) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1522 = u_xlat13_;
    let _e1524 = u_xlat6_;
    u_xlat6_ = ((-(_e1522) * _e1524) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1532 = u_xlat10_;
    u_xlat7_ = floor(_e1532);
    let _e1534 = u_xlat7_;
    u_xlat7_ = min(_e1534, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1541 = u_xlat10_;
    let _e1543 = u_xlat8_;
    let _e1545 = u_xlat6_;
    u_xlat6_ = ((-(_e1541) * _e1543) + _e1545);
    let _e1547 = u_xlat7_;
    let _e1548 = u_xlat6_;
    let _e1550 = u_xlat12_;
    u_xlat6_ = ((_e1547 * _e1548) + _e1550);
    let _e1552 = u_xlat0_;
    let _e1554 = u_xlat6_;
    u_xlat6_ = (-(_e1552) + _e1554);
    let _e1559 = _f_buffer1_.f_cb1_[32];
    let _e1561 = u_xlat6_;
    let _e1563 = u_xlat0_;
    u_xlat6_ = ((_e1559.zzzz * _e1561) + _e1563);
    let _e1565 = u_xlatb38_;
    if _e1565.y {
        let _e1567 = u_xlat6_;
        local_14 = _e1567;
    } else {
        let _e1568 = u_xlat9_;
        local_14 = _e1568;
    }
    let _e1570 = local_14;
    u_xlat6_ = _e1570;
    let _e1571 = u_xlat0_;
    let _e1573 = u_xlat6_;
    u_xlat6_ = (-(_e1571) + _e1573);
    let _e1575 = u_xlat3_;
    let _e1577 = u_xlat6_;
    let _e1579 = u_xlat0_;
    u_xlat3_ = ((_e1575.xxxx * _e1577) + _e1579);
    let _e1581 = u_xlatb4_;
    if _e1581.z {
        let _e1583 = u_xlat0_;
        local_15 = _e1583;
    } else {
        let _e1584 = u_xlat3_;
        local_15 = _e1584;
    }
    let _e1586 = local_15;
    u_xlat0_ = _e1586;
    let _e1590 = _f_buffer1_.f_cb1_[41];
    let _e1595 = _f_buffer1_.f_cb1_[41];
    u_xlat3_ = (_e1590.wwww * _e1595);
    let _e1597 = u_xlat3_;
    let _e1598 = u_xlat5_;
    u_xlat6_ = (_e1597 * _e1598);
    let _e1600 = u_xlatb38_;
    let _e1610 = _f_buffer1_.f_cb1_[45];
    let _e1613 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1610.wzwz).xy;
    u_xlatb38_.x = _e1613.x;
    u_xlatb38_.y = _e1613.y;
    let _e1618 = u_xlat6_;
    let _e1623 = _f_buffer1_.f_cb1_[45];
    u_xlat40_ = (_e1618.w * _e1623.w);
    let _e1626 = u_xlat40_;
    u_xlat40_ = clamp(_e1626, 0f, 1f);
    let _e1630 = u_xlat5_;
    let _e1631 = u_xlat3_;
    let _e1633 = u_xlat0_;
    u_xlat7_ = ((_e1630 * _e1631) + -(_e1633));
    let _e1636 = u_xlat40_;
    let _e1638 = u_xlat7_;
    let _e1640 = u_xlat0_;
    u_xlat7_ = ((vec4(_e1636) * _e1638) + _e1640);
    let _e1642 = u_xlatb38_;
    if _e1642.x {
        let _e1644 = u_xlat7_;
        local_16 = _e1644;
    } else {
        let _e1645 = u_xlat0_;
        local_16 = _e1645;
    }
    let _e1647 = local_16;
    u_xlat7_ = _e1647;
    let _e1648 = u_xlat6_;
    let _e1649 = u_xlat7_;
    u_xlat8_ = (_e1648 * _e1649);
    let _e1651 = u_xlat8_;
    let _e1655 = _f_buffer1_.f_cb1_[45];
    let _e1658 = u_xlat7_;
    u_xlat7_ = ((_e1651 * _e1655.yyyy) + _e1658);
    let _e1660 = u_xlat6_;
    let _e1664 = _f_buffer1_.f_cb1_[45];
    let _e1667 = u_xlat7_;
    u_xlat7_ = ((_e1660 * _e1664.xxxx) + _e1667);
    let _e1669 = u_xlat7_;
    let _e1670 = u_xlat7_;
    u_xlat8_ = (_e1669 + _e1670);
    let _e1672 = u_xlat6_;
    let _e1673 = u_xlat8_;
    u_xlat9_ = (_e1672 * _e1673);
    let _e1675 = u_xlat7_;
    u_xlat10_ = (-(_e1675) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1683 = u_xlat10_;
    let _e1684 = u_xlat10_;
    u_xlat10_ = (_e1683 + _e1684);
    let _e1686 = u_xlat5_;
    let _e1688 = u_xlat3_;
    u_xlat3_ = ((-(_e1686) * _e1688) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1696 = u_xlat10_;
    let _e1698 = u_xlat3_;
    u_xlat3_ = ((-(_e1696) * _e1698) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1706 = u_xlat8_;
    u_xlat5_ = floor(_e1706);
    let _e1708 = u_xlat5_;
    u_xlat5_ = min(_e1708, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1715 = u_xlat8_;
    let _e1717 = u_xlat6_;
    let _e1719 = u_xlat3_;
    u_xlat3_ = ((-(_e1715) * _e1717) + _e1719);
    let _e1721 = u_xlat5_;
    let _e1722 = u_xlat3_;
    let _e1724 = u_xlat9_;
    u_xlat3_ = ((_e1721 * _e1722) + _e1724);
    let _e1726 = u_xlat0_;
    let _e1728 = u_xlat3_;
    u_xlat3_ = (-(_e1726) + _e1728);
    let _e1733 = _f_buffer1_.f_cb1_[45];
    let _e1735 = u_xlat3_;
    let _e1737 = u_xlat0_;
    u_xlat3_ = ((_e1733.zzzz * _e1735) + _e1737);
    let _e1739 = u_xlatb38_;
    if _e1739.y {
        let _e1741 = u_xlat3_;
        local_17 = _e1741;
    } else {
        let _e1742 = u_xlat7_;
        local_17 = _e1742;
    }
    let _e1744 = local_17;
    u_xlat3_ = _e1744;
    let _e1745 = u_xlat0_;
    let _e1747 = u_xlat3_;
    u_xlat3_ = (-(_e1745) + _e1747);
    let _e1749 = u_xlat20_;
    let _e1751 = u_xlat3_;
    let _e1753 = u_xlat0_;
    u_xlat3_ = ((_e1749.xxxx * _e1751) + _e1753);
    let _e1755 = u_xlatb4_;
    if _e1755.y {
        let _e1757 = u_xlat0_;
        local_18 = _e1757;
    } else {
        let _e1758 = u_xlat3_;
        local_18 = _e1758;
    }
    let _e1760 = local_18;
    u_xlat0_ = _e1760;
    let _e1761 = u_xlatb4_;
    if _e1761.x {
        let _e1763 = u_xlat0_;
        local_19 = _e1763;
    } else {
        let _e1764 = u_xlat1_;
        local_19 = _e1764;
    }
    let _e1766 = local_19;
    u_xlat1_ = _e1766;
    let _e1771 = _f_buffer1_.f_cb1_[67];
    u_xlatb20_.x = (_e1771.z == 5f);
    let _e1775 = u_xlatb20_;
    if _e1775.x {
        {
            let _e1777 = u_xlat1_;
            let _e1778 = u_xlat2_;
            let _e1781 = u_xlat1_;
            u_xlat3_ = ((_e1777 * vec4(_e1778)) + -(_e1781));
            let _e1787 = _f_buffer1_.f_cb1_[67];
            let _e1789 = u_xlat3_;
            let _e1791 = u_xlat1_;
            u_xlat3_ = ((_e1787.wwww * _e1789) + _e1791);
            u_xlat11_.w = 1f;
            let _e1795 = u_xlat3_;
            let _e1799 = _f_buffer1_.f_cb1_[54];
            let _e1801 = u_xlat11_;
            SV_Target0_ = ((_e1795 * _e1799) + _e1801.xxxw);
            return;
        }
    }
    let _e1807 = _f_buffer1_.f_cb1_[54];
    let _e1812 = _f_buffer1_.f_cb1_[54];
    u_xlat3_ = (_e1807.wwww * _e1812);
    let _e1814 = u_xlat1_;
    let _e1815 = u_xlat3_;
    u_xlat5_ = (_e1814 * _e1815);
    let _e1817 = u_xlatb20_;
    let _e1827 = _f_buffer1_.f_cb1_[58];
    let _e1830 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1827.wzww).xy;
    u_xlatb20_.x = _e1830.x;
    u_xlatb20_.y = _e1830.y;
    let _e1835 = u_xlat5_;
    let _e1840 = _f_buffer1_.f_cb1_[58];
    u_xlat56_ = (_e1835.w * _e1840.w);
    let _e1843 = u_xlat56_;
    u_xlat56_ = clamp(_e1843, 0f, 1f);
    let _e1847 = u_xlat1_;
    let _e1848 = u_xlat3_;
    let _e1850 = u_xlat0_;
    u_xlat6_ = ((_e1847 * _e1848) + -(_e1850));
    let _e1853 = u_xlat56_;
    let _e1855 = u_xlat6_;
    let _e1857 = u_xlat0_;
    u_xlat6_ = ((vec4(_e1853) * _e1855) + _e1857);
    let _e1859 = u_xlatb20_;
    if _e1859.x {
        let _e1861 = u_xlat6_;
        local_20 = _e1861;
    } else {
        let _e1862 = u_xlat0_;
        local_20 = _e1862;
    }
    let _e1864 = local_20;
    u_xlat6_ = _e1864;
    let _e1865 = u_xlat5_;
    let _e1866 = u_xlat6_;
    u_xlat7_ = (_e1865 * _e1866);
    let _e1868 = u_xlat7_;
    let _e1872 = _f_buffer1_.f_cb1_[58];
    let _e1875 = u_xlat6_;
    u_xlat6_ = ((_e1868 * _e1872.yyyy) + _e1875);
    let _e1877 = u_xlat5_;
    let _e1881 = _f_buffer1_.f_cb1_[58];
    let _e1884 = u_xlat6_;
    u_xlat6_ = ((_e1877 * _e1881.xxxx) + _e1884);
    let _e1886 = u_xlat6_;
    let _e1887 = u_xlat6_;
    u_xlat7_ = (_e1886 + _e1887);
    let _e1889 = u_xlat5_;
    let _e1890 = u_xlat7_;
    u_xlat8_ = (_e1889 * _e1890);
    let _e1892 = u_xlat6_;
    u_xlat9_ = (-(_e1892) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1900 = u_xlat9_;
    let _e1901 = u_xlat9_;
    u_xlat9_ = (_e1900 + _e1901);
    let _e1903 = u_xlat1_;
    let _e1905 = u_xlat3_;
    u_xlat1_ = ((-(_e1903) * _e1905) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1913 = u_xlat9_;
    let _e1915 = u_xlat1_;
    u_xlat1_ = ((-(_e1913) * _e1915) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1923 = u_xlat7_;
    u_xlat3_ = floor(_e1923);
    let _e1925 = u_xlat3_;
    u_xlat3_ = min(_e1925, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1932 = u_xlat7_;
    let _e1934 = u_xlat5_;
    let _e1936 = u_xlat1_;
    u_xlat1_ = ((-(_e1932) * _e1934) + _e1936);
    let _e1938 = u_xlat3_;
    let _e1939 = u_xlat1_;
    let _e1941 = u_xlat8_;
    u_xlat1_ = ((_e1938 * _e1939) + _e1941);
    let _e1943 = u_xlat0_;
    let _e1945 = u_xlat1_;
    u_xlat1_ = (-(_e1943) + _e1945);
    let _e1950 = _f_buffer1_.f_cb1_[58];
    let _e1952 = u_xlat1_;
    let _e1954 = u_xlat0_;
    u_xlat1_ = ((_e1950.zzzz * _e1952) + _e1954);
    let _e1956 = u_xlatb20_;
    if _e1956.y {
        let _e1958 = u_xlat1_;
        local_21 = _e1958;
    } else {
        let _e1959 = u_xlat6_;
        local_21 = _e1959;
    }
    let _e1961 = local_21;
    u_xlat1_ = _e1961;
    let _e1962 = u_xlat0_;
    let _e1964 = u_xlat1_;
    u_xlat1_ = (-(_e1962) + _e1964);
    let _e1966 = u_xlat2_;
    let _e1968 = u_xlat1_;
    let _e1970 = u_xlat0_;
    u_xlat1_ = ((vec4(_e1966) * _e1968) + _e1970);
    let _e1972 = u_xlatb4_;
    if _e1972.x {
        let _e1974 = u_xlat0_;
        local_22 = _e1974;
    } else {
        let _e1975 = u_xlat1_;
        local_22 = _e1975;
    }
    let _e1977 = local_22;
    u_xlat0_ = _e1977;
    let _e1978 = u_xlat0_;
    u_xlat0_ = clamp(_e1978, vec4(0f), vec4(1f));
    let _e1984 = u_xlat0_;
    let _e1985 = vs_COLOR0_1;
    u_xlat1_ = (_e1984 * _e1985);
    let _e1987 = u_xlat0_;
    let _e1988 = u_xlat1_;
    SV_Target0_ = min(_e1987, _e1988);
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
