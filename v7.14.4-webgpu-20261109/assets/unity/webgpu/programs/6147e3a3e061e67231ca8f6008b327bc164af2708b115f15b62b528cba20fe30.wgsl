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
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
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
    var u_xlat19_: vec2<f32> = vec2(0f);
    var u_xlatb19_: vec2<bool> = vec2(false);
    var u_xlat20_: vec2<f32> = vec2(0f);
    var u_xlat21_: f32 = 0f;
    var u_xlat36_: f32 = 0f;
    var u_xlat37_: vec2<f32> = vec2(0f);
    var u_xlatb37_: vec2<bool> = vec2(false);
    var u_xlat39_: f32 = 0f;
    var u_xlat40_: f32 = 0f;
    var u_xlat54_: f32 = 0f;
    var u_xlat55_: f32 = 0f;
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

    let _e162 = _f_buffer1_.f_cb1_[67];
    u_xlatb0_ = (_e162.z == 10f);
    let _e166 = u_xlatb0_;
    if _e166 {
        {
            let _e167 = vs_COLOR0_1;
            SV_Target0_ = _e167;
            return;
        }
    }
    let _e168 = vs_TEXCOORD0_1;
    let _e173 = _f_buffer0_.f_cb0_[4];
    let _e178 = hscard_bias.values[1];
    let _e181 = textureSampleBias(f_t1_, samplerf_s1_, _e168.xy, (_e173.x + _e178.x));
    u_xlat0_ = _e181;
    let _e182 = vs_TEXCOORD2_1;
    let _e187 = _f_buffer0_.f_cb0_[4];
    let _e192 = hscard_bias.values[7];
    let _e195 = textureSampleBias(f_t7_, samplerf_s7_, _e182.zw, (_e187.x + _e192.x));
    u_xlat1_ = _e195;
    let _e199 = _f_buffer1_.f_cb1_[65];
    let _e204 = _f_buffer1_.f_cb1_[65];
    u_xlat55_ = (_e199.y + _e204.x);
    let _e208 = u_xlat55_;
    u_xlat2_.x = sin(_e208);
    let _e211 = u_xlat55_;
    u_xlat3_.x = cos(_e211);
    let _e214 = u_xlat2_;
    u_xlat4_.x = -(_e214.x);
    let _e217 = u_xlat20_;
    let _e222 = _f_buffer1_.f_cb1_[63];
    let _e228 = _f_buffer1_.f_cb1_[65];
    let _e230 = (-(_e222.xy) + _e228.zw);
    u_xlat20_.x = _e230.x;
    u_xlat20_.y = _e230.y;
    let _e235 = u_xlat1_;
    let _e237 = u_xlat1_;
    let _e239 = u_xlat20_;
    let _e242 = (_e237.xy + -(_e239.xy));
    u_xlat1_.x = _e242.x;
    u_xlat1_.y = _e242.y;
    let _e248 = u_xlat3_;
    u_xlat4_.y = _e248.x;
    let _e251 = u_xlat2_;
    u_xlat4_.z = _e251.x;
    let _e254 = u_xlat1_;
    let _e256 = u_xlat4_;
    u_xlat3_.x = dot(_e254.xy, _e256.yz);
    let _e260 = u_xlat1_;
    let _e262 = u_xlat4_;
    u_xlat3_.y = dot(_e260.xy, _e262.xy);
    let _e265 = u_xlat1_;
    let _e267 = u_xlat20_;
    let _e269 = u_xlat3_;
    let _e271 = (_e267.xy + _e269.xy);
    u_xlat1_.x = _e271.x;
    u_xlat1_.y = _e271.y;
    let _e276 = u_xlat2_;
    let _e281 = _f_buffer1_.f_cb1_[63];
    let _e287 = _f_buffer1_.f_cb1_[64];
    let _e289 = (-(_e281.xy) + _e287.zw);
    u_xlat2_.x = _e289.x;
    u_xlat2_.y = _e289.y;
    let _e294 = u_xlat1_;
    let _e296 = u_xlat1_;
    let _e298 = u_xlat2_;
    let _e301 = (_e296.xy + -(_e298.xy));
    u_xlat1_.x = _e301.x;
    u_xlat1_.y = _e301.y;
    let _e306 = u_xlat1_;
    let _e308 = u_xlat1_;
    let _e313 = _f_buffer1_.f_cb1_[64];
    let _e316 = u_xlat2_;
    let _e318 = ((_e308.xy * _e313.xy) + _e316.xy);
    u_xlat1_.x = _e318.x;
    u_xlat1_.y = _e318.y;
    let _e323 = u_xlat2_;
    let _e328 = _f_buffer1_.f_cb1_[63];
    let _e333 = _f_buffer1_.f_cb1_[63];
    let _e335 = (_e328.zw + _e333.xy);
    u_xlat2_.x = _e335.x;
    u_xlat2_.y = _e335.y;
    let _e340 = u_xlat1_;
    let _e342 = u_xlat1_;
    let _e344 = u_xlat2_;
    let _e346 = (_e342.xy + _e344.xy);
    u_xlat1_.x = _e346.x;
    u_xlat1_.y = _e346.y;
    let _e351 = u_xlat1_;
    let _e356 = _f_buffer0_.f_cb0_[4];
    let _e361 = hscard_bias.values[6];
    let _e364 = textureSampleBias(f_t6_, samplerf_s6_, _e351.xy, (_e356.x + _e361.x));
    u_xlat2_ = _e364;
    let _e366 = u_xlat1_;
    let _e368 = u_xlat2_;
    u_xlat2_.w = (_e366.z * _e368.w);
    let _e372 = u_xlat0_;
    let _e376 = _f_buffer1_.f_cb1_[53];
    u_xlat1_.x = dot(_e372, _e376);
    let _e379 = u_xlat1_;
    u_xlat1_.x = min(_e379.x, 1f);
    let _e384 = u_xlat1_;
    let _e386 = u_xlat2_;
    u_xlat1_.x = (_e384.x * _e386.w);
    let _e389 = u_xlat1_;
    let _e391 = u_xlat2_;
    u_xlat3_ = (_e389.xxxx * _e391.xyxy);
    let _e394 = u_xlat3_;
    let _e398 = _f_buffer1_.f_cb1_[59];
    u_xlat3_ = (_e394 * _e398.zwxy);
    let _e401 = u_xlat1_;
    let _e403 = u_xlat3_;
    u_xlat3_ = (_e401.xxxx * _e403);
    let _e408 = _f_buffer1_.f_cb1_[67];
    u_xlatb4_ = (_e408.zzzz == vec4<f32>(15f, 14f, 13f, 12f));
    let _e416 = u_xlatb4_;
    if _e416.x {
        local = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e423 = u_xlat3_;
        local = _e423;
    }
    let _e425 = local;
    u_xlat3_ = _e425;
    let _e426 = u_xlat19_;
    let _e428 = u_xlat3_;
    let _e434 = vs_TEXCOORD2_1;
    let _e436 = ((_e428.xy * vec2<f32>(0.001f, 0.001f)) + _e434.xy);
    u_xlat19_.x = _e436.x;
    u_xlat19_.y = _e436.y;
    let _e441 = u_xlat19_;
    let _e446 = _f_buffer0_.f_cb0_[4];
    let _e451 = hscard_bias.values[5];
    let _e454 = textureSampleBias(f_t5_, samplerf_s5_, _e441.xy, (_e446.x + _e451.x));
    u_xlat5_ = _e454;
    let _e456 = u_xlat0_;
    let _e460 = _f_buffer1_.f_cb1_[40];
    u_xlat19_.x = dot(_e456, _e460);
    let _e463 = u_xlat19_;
    u_xlat19_.x = min(_e463.x, 1f);
    let _e468 = u_xlat19_;
    let _e470 = u_xlat5_;
    u_xlat19_.x = (_e468.x * _e470.w);
    let _e473 = u_xlat19_;
    let _e475 = u_xlat5_;
    u_xlat6_ = (_e473.xxxx * _e475.xyxy);
    let _e478 = u_xlat6_;
    let _e482 = _f_buffer1_.f_cb1_[46];
    u_xlat6_ = (_e478 * _e482.zwxy);
    let _e485 = u_xlat19_;
    let _e487 = u_xlat6_;
    u_xlat6_ = (_e485.xxxx * _e487);
    let _e489 = u_xlatb4_;
    if _e489.y {
        local_1 = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e496 = u_xlat6_;
        local_1 = _e496;
    }
    let _e498 = local_1;
    u_xlat6_ = _e498;
    let _e499 = u_xlat37_;
    let _e501 = u_xlat3_;
    let _e503 = u_xlat6_;
    let _e505 = (_e501.xy + _e503.xy);
    u_xlat37_.x = _e505.x;
    u_xlat37_.y = _e505.y;
    let _e510 = u_xlat3_;
    let _e512 = u_xlat37_;
    let _e518 = vs_TEXCOORD1_1;
    let _e520 = ((_e512.xy * vec2<f32>(0.001f, 0.001f)) + _e518.zw);
    u_xlat3_.x = _e520.x;
    u_xlat3_.y = _e520.y;
    let _e525 = u_xlat3_;
    let _e530 = _f_buffer0_.f_cb0_[4];
    let _e535 = hscard_bias.values[4];
    let _e538 = textureSampleBias(f_t4_, samplerf_s4_, _e525.xy, (_e530.x + _e535.x));
    u_xlat7_ = _e538;
    let _e540 = u_xlat0_;
    let _e544 = _f_buffer1_.f_cb1_[27];
    u_xlat3_.x = dot(_e540, _e544);
    let _e547 = u_xlat3_;
    u_xlat3_.x = min(_e547.x, 1f);
    let _e552 = u_xlat3_;
    let _e554 = u_xlat7_;
    u_xlat3_.x = (_e552.x * _e554.w);
    let _e557 = u_xlat3_;
    let _e559 = u_xlat7_;
    u_xlat8_ = (_e557.xxxx * _e559.xyxy);
    let _e562 = u_xlat8_;
    let _e566 = _f_buffer1_.f_cb1_[33];
    u_xlat8_ = (_e562 * _e566.zwxy);
    let _e569 = u_xlat3_;
    let _e571 = u_xlat8_;
    u_xlat8_ = (_e569.xxxx * _e571);
    let _e573 = u_xlatb4_;
    if _e573.z {
        local_2 = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e580 = u_xlat8_;
        local_2 = _e580;
    }
    let _e582 = local_2;
    u_xlat8_ = _e582;
    let _e583 = u_xlat37_;
    let _e585 = u_xlat37_;
    let _e587 = u_xlat8_;
    let _e589 = (_e585.xy + _e587.xy);
    u_xlat37_.x = _e589.x;
    u_xlat37_.y = _e589.y;
    let _e594 = u_xlat6_;
    let _e596 = u_xlat37_;
    let _e602 = vs_TEXCOORD1_1;
    let _e604 = ((_e596.xy * vec2<f32>(0.001f, 0.001f)) + _e602.xy);
    u_xlat6_.x = _e604.x;
    u_xlat6_.y = _e604.y;
    let _e609 = u_xlat6_;
    let _e614 = _f_buffer0_.f_cb0_[4];
    let _e619 = hscard_bias.values[3];
    let _e622 = textureSampleBias(f_t3_, samplerf_s3_, _e609.xy, (_e614.x + _e619.x));
    u_xlat9_ = _e622;
    let _e623 = u_xlat0_;
    let _e627 = _f_buffer1_.f_cb1_[14];
    u_xlat21_ = dot(_e623, _e627);
    let _e629 = u_xlat21_;
    u_xlat21_ = min(_e629, 1f);
    let _e632 = u_xlat21_;
    let _e633 = u_xlat9_;
    u_xlat21_ = (_e632 * _e633.w);
    let _e636 = u_xlat6_;
    let _e638 = u_xlat21_;
    let _e640 = u_xlat9_;
    let _e642 = (vec2(_e638) * _e640.xy);
    u_xlat6_.x = _e642.x;
    u_xlat6_.y = _e642.y;
    let _e647 = u_xlat8_;
    let _e649 = u_xlat9_;
    let _e654 = _f_buffer1_.f_cb1_[20];
    let _e656 = (_e649.xy * _e654.zw);
    u_xlat8_.x = _e656.x;
    u_xlat8_.y = _e656.y;
    let _e661 = u_xlat8_;
    let _e663 = u_xlat21_;
    let _e665 = u_xlat8_;
    let _e667 = (vec2(_e663) * _e665.xy);
    u_xlat8_.x = _e667.x;
    u_xlat8_.y = _e667.y;
    let _e672 = u_xlat8_;
    let _e674 = u_xlatb4_;
    if _e674.w {
        local_3 = vec2<f32>(0f, 0f);
    } else {
        let _e679 = u_xlat8_;
        local_3 = _e679.xy;
    }
    let _e682 = local_3;
    u_xlat8_.x = _e682.x;
    u_xlat8_.y = _e682.y;
    let _e687 = u_xlat37_;
    let _e689 = u_xlat37_;
    let _e691 = u_xlat8_;
    let _e693 = (_e689.xy + _e691.xy);
    u_xlat37_.x = _e693.x;
    u_xlat37_.y = _e693.y;
    let _e698 = u_xlat37_;
    let _e700 = u_xlat37_;
    let _e706 = vs_TEXCOORD0_1;
    let _e708 = ((_e700.xy * vec2<f32>(0.001f, 0.001f)) + _e706.zw);
    u_xlat37_.x = _e708.x;
    u_xlat37_.y = _e708.y;
    let _e713 = u_xlat37_;
    let _e718 = _f_buffer0_.f_cb0_[4];
    let _e723 = hscard_bias.values[2];
    let _e726 = textureSampleBias(f_t2_, samplerf_s2_, _e713.xy, (_e718.x + _e723.x));
    u_xlat10_ = _e726;
    let _e728 = u_xlat0_;
    let _e732 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = dot(_e728, _e732);
    let _e735 = u_xlat0_;
    u_xlat0_.x = min(_e735.x, 1f);
    let _e740 = u_xlat0_;
    let _e742 = u_xlat10_;
    u_xlat0_.x = (_e740.x * _e742.w);
    let _e745 = u_xlat18_;
    let _e747 = u_xlat10_;
    let _e752 = _f_buffer1_.f_cb1_[8];
    let _e754 = (_e747.xy * _e752.xy);
    u_xlat18_.x = _e754.x;
    u_xlat18_.y = _e754.y;
    let _e759 = u_xlat18_;
    let _e761 = u_xlat0_;
    let _e763 = u_xlat18_;
    let _e765 = (_e761.xx * _e763.xy);
    u_xlat18_.x = _e765.x;
    u_xlat18_.y = _e765.y;
    let _e770 = u_xlat37_;
    let _e772 = u_xlat6_;
    let _e777 = _f_buffer1_.f_cb1_[20];
    let _e779 = (_e772.xy * _e777.xy);
    u_xlat37_.x = _e779.x;
    u_xlat37_.y = _e779.y;
    let _e784 = u_xlat37_;
    let _e786 = u_xlat21_;
    let _e788 = u_xlat37_;
    let _e790 = (vec2(_e786) * _e788.xy);
    u_xlat37_.x = _e790.x;
    u_xlat37_.y = _e790.y;
    let _e795 = u_xlatb6_;
    let _e800 = _f_buffer1_.f_cb1_[67];
    let _e808 = (_e800.zzzz == vec4<f32>(11f, 1f, 0f, 0f)).xy;
    u_xlatb6_.x = _e808.x;
    u_xlatb6_.y = _e808.y;
    let _e813 = u_xlat18_;
    let _e815 = u_xlatb6_;
    if _e815.x {
        local_4 = vec2<f32>(0f, 0f);
    } else {
        let _e820 = u_xlat18_;
        local_4 = _e820.xy;
    }
    let _e823 = local_4;
    u_xlat18_.x = _e823.x;
    u_xlat18_.y = _e823.y;
    let _e828 = u_xlat37_;
    let _e830 = u_xlatb4_;
    if _e830.w {
        local_5 = vec2<f32>(0f, 0f);
    } else {
        let _e835 = u_xlat37_;
        local_5 = _e835.xy;
    }
    let _e838 = local_5;
    u_xlat37_.x = _e838.x;
    u_xlat37_.y = _e838.y;
    let _e843 = u_xlat18_;
    let _e845 = u_xlat18_;
    let _e847 = u_xlat37_;
    let _e849 = (_e845.xy + _e847.xy);
    u_xlat18_.x = _e849.x;
    u_xlat18_.y = _e849.y;
    let _e854 = u_xlat18_;
    let _e856 = u_xlat8_;
    let _e858 = u_xlat18_;
    let _e860 = (_e856.zw + _e858.xy);
    u_xlat18_.x = _e860.x;
    u_xlat18_.y = _e860.y;
    let _e865 = u_xlat18_;
    let _e867 = u_xlat6_;
    let _e869 = u_xlat18_;
    let _e871 = (_e867.zw + _e869.xy);
    u_xlat18_.x = _e871.x;
    u_xlat18_.y = _e871.y;
    let _e876 = u_xlat18_;
    let _e878 = u_xlat3_;
    let _e880 = u_xlat18_;
    let _e882 = (_e878.zw + _e880.xy);
    u_xlat18_.x = _e882.x;
    u_xlat18_.y = _e882.y;
    let _e887 = u_xlat18_;
    let _e889 = u_xlat18_;
    let _e895 = vs_TEXCOORD0_1;
    let _e897 = ((_e889.xy * vec2<f32>(0.001f, 0.001f)) + _e895.xy);
    u_xlat18_.x = _e897.x;
    u_xlat18_.y = _e897.y;
    let _e902 = u_xlat18_;
    let _e907 = _f_buffer0_.f_cb0_[4];
    let _e912 = hscard_bias.values[0];
    let _e915 = textureSampleBias(f_t0_, samplerf_s0_, _e902.xy, (_e907.x + _e912.x));
    u_xlat8_ = _e915;
    let _e921 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (0f < _e921.z);
    let _e924 = u_xlat8_;
    u_xlat36_ = dot(_e924, vec4<f32>(0.1f, 0.1f, 0.1f, 0.1f));
    let _e932 = u_xlatb18_;
    if _e932.x {
        let _e934 = u_xlat36_;
        local_6 = _e934;
    } else {
        local_6 = 0f;
    }
    let _e938 = local_6;
    u_xlat11_.x = _e938;
    let _e939 = u_xlatb6_;
    if _e939.y {
        {
            let _e941 = u_xlat10_;
            let _e942 = u_xlat0_;
            let _e945 = u_xlat10_;
            u_xlat12_ = ((_e941 * _e942.xxxx) + -(_e945));
            let _e951 = _f_buffer1_.f_cb1_[67];
            let _e953 = u_xlat12_;
            let _e955 = u_xlat10_;
            u_xlat12_ = ((_e951.wwww * _e953) + _e955);
            u_xlat11_.y = 1f;
            let _e959 = u_xlat12_;
            let _e963 = _f_buffer1_.f_cb1_[3];
            let _e965 = u_xlat11_;
            SV_Target0_ = ((_e959 * _e963) + _e965.xxxy);
            return;
        }
    }
    let _e972 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e972.z == 2f);
    let _e976 = u_xlatb18_;
    if _e976.x {
        {
            let _e978 = u_xlat9_;
            let _e979 = u_xlat21_;
            let _e982 = u_xlat9_;
            u_xlat12_ = ((_e978 * vec4(_e979)) + -(_e982));
            let _e988 = _f_buffer1_.f_cb1_[67];
            let _e990 = u_xlat12_;
            let _e992 = u_xlat9_;
            u_xlat12_ = ((_e988.wwww * _e990) + _e992);
            u_xlat11_.z = 1f;
            let _e996 = u_xlat12_;
            let _e1000 = _f_buffer1_.f_cb1_[15];
            let _e1002 = u_xlat11_;
            SV_Target0_ = ((_e996 * _e1000) + _e1002.xxxz);
            return;
        }
    }
    let _e1009 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e1009.z == 3f);
    let _e1013 = u_xlatb18_;
    if _e1013.x {
        {
            let _e1015 = u_xlat7_;
            let _e1016 = u_xlat3_;
            let _e1019 = u_xlat7_;
            u_xlat12_ = ((_e1015 * _e1016.xxxx) + -(_e1019));
            let _e1025 = _f_buffer1_.f_cb1_[67];
            let _e1027 = u_xlat12_;
            let _e1029 = u_xlat7_;
            u_xlat12_ = ((_e1025.wwww * _e1027) + _e1029);
            u_xlat11_.w = 1f;
            let _e1033 = u_xlat12_;
            let _e1037 = _f_buffer1_.f_cb1_[28];
            let _e1039 = u_xlat11_;
            SV_Target0_ = ((_e1033 * _e1037) + _e1039.xxxw);
            return;
        }
    }
    let _e1046 = _f_buffer1_.f_cb1_[67];
    u_xlatb18_.x = (_e1046.z == 4f);
    let _e1050 = u_xlatb18_;
    if _e1050.x {
        {
            let _e1052 = u_xlat5_;
            let _e1053 = u_xlat19_;
            let _e1056 = u_xlat5_;
            u_xlat12_ = ((_e1052 * _e1053.xxxx) + -(_e1056));
            let _e1062 = _f_buffer1_.f_cb1_[67];
            let _e1064 = u_xlat12_;
            let _e1066 = u_xlat5_;
            u_xlat12_ = ((_e1062.wwww * _e1064) + _e1066);
            u_xlat11_.w = 1f;
            let _e1070 = u_xlat12_;
            let _e1074 = _f_buffer1_.f_cb1_[41];
            let _e1076 = u_xlat11_;
            SV_Target0_ = ((_e1070 * _e1074) + _e1076.xxxw);
            return;
        }
    }
    let _e1082 = _f_buffer1_.f_cb1_[3];
    let _e1087 = _f_buffer1_.f_cb1_[3];
    u_xlat12_ = (_e1082.wwww * _e1087);
    let _e1089 = u_xlat10_;
    let _e1090 = u_xlat12_;
    u_xlat13_ = (_e1089 * _e1090);
    let _e1092 = u_xlatb18_;
    let _e1102 = _f_buffer1_.f_cb1_[7];
    let _e1105 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1102.wzww).xy;
    u_xlatb18_.x = _e1105.x;
    u_xlatb18_.y = _e1105.y;
    let _e1110 = u_xlat13_;
    let _e1115 = _f_buffer1_.f_cb1_[7];
    u_xlat54_ = (_e1110.w * _e1115.w);
    let _e1118 = u_xlat54_;
    u_xlat54_ = clamp(_e1118, 0f, 1f);
    let _e1122 = u_xlat10_;
    let _e1123 = u_xlat12_;
    let _e1125 = u_xlat8_;
    u_xlat14_ = ((_e1122 * _e1123) + -(_e1125));
    let _e1128 = u_xlat54_;
    let _e1130 = u_xlat14_;
    let _e1132 = u_xlat8_;
    u_xlat14_ = ((vec4(_e1128) * _e1130) + _e1132);
    let _e1134 = u_xlatb18_;
    if _e1134.x {
        let _e1136 = u_xlat14_;
        local_7 = _e1136;
    } else {
        let _e1137 = u_xlat8_;
        local_7 = _e1137;
    }
    let _e1139 = local_7;
    u_xlat14_ = _e1139;
    let _e1140 = u_xlat13_;
    let _e1141 = u_xlat14_;
    u_xlat15_ = (_e1140 * _e1141);
    let _e1143 = u_xlat15_;
    let _e1147 = _f_buffer1_.f_cb1_[7];
    let _e1150 = u_xlat14_;
    u_xlat14_ = ((_e1143 * _e1147.yyyy) + _e1150);
    let _e1152 = u_xlat13_;
    let _e1156 = _f_buffer1_.f_cb1_[7];
    let _e1159 = u_xlat14_;
    u_xlat14_ = ((_e1152 * _e1156.xxxx) + _e1159);
    let _e1161 = u_xlat14_;
    let _e1162 = u_xlat14_;
    u_xlat15_ = (_e1161 + _e1162);
    let _e1164 = u_xlat13_;
    let _e1165 = u_xlat15_;
    u_xlat16_ = (_e1164 * _e1165);
    let _e1167 = u_xlat14_;
    u_xlat17_ = (-(_e1167) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1175 = u_xlat17_;
    let _e1176 = u_xlat17_;
    u_xlat17_ = (_e1175 + _e1176);
    let _e1178 = u_xlat10_;
    let _e1180 = u_xlat12_;
    u_xlat10_ = ((-(_e1178) * _e1180) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1188 = u_xlat17_;
    let _e1190 = u_xlat10_;
    u_xlat10_ = ((-(_e1188) * _e1190) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1198 = u_xlat15_;
    u_xlat12_ = floor(_e1198);
    let _e1200 = u_xlat12_;
    u_xlat12_ = min(_e1200, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1207 = u_xlat15_;
    let _e1209 = u_xlat13_;
    let _e1211 = u_xlat10_;
    u_xlat10_ = ((-(_e1207) * _e1209) + _e1211);
    let _e1213 = u_xlat12_;
    let _e1214 = u_xlat10_;
    let _e1216 = u_xlat16_;
    u_xlat10_ = ((_e1213 * _e1214) + _e1216);
    let _e1218 = u_xlat8_;
    let _e1220 = u_xlat10_;
    u_xlat10_ = (-(_e1218) + _e1220);
    let _e1225 = _f_buffer1_.f_cb1_[7];
    let _e1227 = u_xlat10_;
    let _e1229 = u_xlat8_;
    u_xlat10_ = ((_e1225.zzzz * _e1227) + _e1229);
    let _e1231 = u_xlatb18_;
    if _e1231.y {
        let _e1233 = u_xlat10_;
        local_8 = _e1233;
    } else {
        let _e1234 = u_xlat14_;
        local_8 = _e1234;
    }
    let _e1236 = local_8;
    u_xlat10_ = _e1236;
    let _e1237 = u_xlat8_;
    let _e1239 = u_xlat10_;
    u_xlat10_ = (-(_e1237) + _e1239);
    let _e1241 = u_xlat0_;
    let _e1243 = u_xlat10_;
    let _e1245 = u_xlat8_;
    u_xlat0_ = ((_e1241.xxxx * _e1243) + _e1245);
    let _e1247 = u_xlatb6_;
    if _e1247.x {
        let _e1249 = u_xlat8_;
        local_9 = _e1249;
    } else {
        let _e1250 = u_xlat0_;
        local_9 = _e1250;
    }
    let _e1252 = local_9;
    u_xlat0_ = _e1252;
    let _e1256 = _f_buffer1_.f_cb1_[15];
    let _e1261 = _f_buffer1_.f_cb1_[15];
    u_xlat6_ = (_e1256.wwww * _e1261);
    let _e1263 = u_xlat6_;
    let _e1264 = u_xlat9_;
    u_xlat8_ = (_e1263 * _e1264);
    let _e1266 = u_xlatb37_;
    let _e1276 = _f_buffer1_.f_cb1_[19];
    let _e1279 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1276.wzwz).xy;
    u_xlatb37_.x = _e1279.x;
    u_xlatb37_.y = _e1279.y;
    let _e1284 = u_xlat8_;
    let _e1289 = _f_buffer1_.f_cb1_[19];
    u_xlat39_ = (_e1284.w * _e1289.w);
    let _e1292 = u_xlat39_;
    u_xlat39_ = clamp(_e1292, 0f, 1f);
    let _e1296 = u_xlat9_;
    let _e1297 = u_xlat6_;
    let _e1299 = u_xlat0_;
    u_xlat10_ = ((_e1296 * _e1297) + -(_e1299));
    let _e1302 = u_xlat39_;
    let _e1304 = u_xlat10_;
    let _e1306 = u_xlat0_;
    u_xlat10_ = ((vec4(_e1302) * _e1304) + _e1306);
    let _e1308 = u_xlatb37_;
    if _e1308.x {
        let _e1310 = u_xlat10_;
        local_10 = _e1310;
    } else {
        let _e1311 = u_xlat0_;
        local_10 = _e1311;
    }
    let _e1313 = local_10;
    u_xlat10_ = _e1313;
    let _e1314 = u_xlat8_;
    let _e1315 = u_xlat10_;
    u_xlat12_ = (_e1314 * _e1315);
    let _e1317 = u_xlat12_;
    let _e1321 = _f_buffer1_.f_cb1_[19];
    let _e1324 = u_xlat10_;
    u_xlat10_ = ((_e1317 * _e1321.yyyy) + _e1324);
    let _e1326 = u_xlat8_;
    let _e1330 = _f_buffer1_.f_cb1_[19];
    let _e1333 = u_xlat10_;
    u_xlat10_ = ((_e1326 * _e1330.xxxx) + _e1333);
    let _e1335 = u_xlat10_;
    let _e1336 = u_xlat10_;
    u_xlat12_ = (_e1335 + _e1336);
    let _e1338 = u_xlat8_;
    let _e1339 = u_xlat12_;
    u_xlat13_ = (_e1338 * _e1339);
    let _e1341 = u_xlat10_;
    u_xlat14_ = (-(_e1341) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1349 = u_xlat14_;
    let _e1350 = u_xlat14_;
    u_xlat14_ = (_e1349 + _e1350);
    let _e1352 = u_xlat9_;
    let _e1354 = u_xlat6_;
    u_xlat6_ = ((-(_e1352) * _e1354) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1362 = u_xlat14_;
    let _e1364 = u_xlat6_;
    u_xlat6_ = ((-(_e1362) * _e1364) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1372 = u_xlat12_;
    u_xlat9_ = floor(_e1372);
    let _e1374 = u_xlat9_;
    u_xlat9_ = min(_e1374, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1381 = u_xlat12_;
    let _e1383 = u_xlat8_;
    let _e1385 = u_xlat6_;
    u_xlat6_ = ((-(_e1381) * _e1383) + _e1385);
    let _e1387 = u_xlat9_;
    let _e1388 = u_xlat6_;
    let _e1390 = u_xlat13_;
    u_xlat6_ = ((_e1387 * _e1388) + _e1390);
    let _e1392 = u_xlat0_;
    let _e1394 = u_xlat6_;
    u_xlat6_ = (-(_e1392) + _e1394);
    let _e1399 = _f_buffer1_.f_cb1_[19];
    let _e1401 = u_xlat6_;
    let _e1403 = u_xlat0_;
    u_xlat6_ = ((_e1399.zzzz * _e1401) + _e1403);
    let _e1405 = u_xlatb37_;
    if _e1405.y {
        let _e1407 = u_xlat6_;
        local_11 = _e1407;
    } else {
        let _e1408 = u_xlat10_;
        local_11 = _e1408;
    }
    let _e1410 = local_11;
    u_xlat6_ = _e1410;
    let _e1411 = u_xlat0_;
    let _e1413 = u_xlat6_;
    u_xlat6_ = (-(_e1411) + _e1413);
    let _e1415 = u_xlat21_;
    let _e1417 = u_xlat6_;
    let _e1419 = u_xlat0_;
    u_xlat6_ = ((vec4(_e1415) * _e1417) + _e1419);
    let _e1421 = u_xlatb4_;
    if _e1421.w {
        let _e1423 = u_xlat0_;
        local_12 = _e1423;
    } else {
        let _e1424 = u_xlat6_;
        local_12 = _e1424;
    }
    let _e1426 = local_12;
    u_xlat0_ = _e1426;
    let _e1430 = _f_buffer1_.f_cb1_[28];
    let _e1435 = _f_buffer1_.f_cb1_[28];
    u_xlat6_ = (_e1430.wwww * _e1435);
    let _e1437 = u_xlat6_;
    let _e1438 = u_xlat7_;
    u_xlat8_ = (_e1437 * _e1438);
    let _e1440 = u_xlatb37_;
    let _e1450 = _f_buffer1_.f_cb1_[32];
    let _e1453 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1450.wzwz).xy;
    u_xlatb37_.x = _e1453.x;
    u_xlatb37_.y = _e1453.y;
    let _e1458 = u_xlat8_;
    let _e1463 = _f_buffer1_.f_cb1_[32];
    u_xlat21_ = (_e1458.w * _e1463.w);
    let _e1466 = u_xlat21_;
    u_xlat21_ = clamp(_e1466, 0f, 1f);
    let _e1470 = u_xlat7_;
    let _e1471 = u_xlat6_;
    let _e1473 = u_xlat0_;
    u_xlat9_ = ((_e1470 * _e1471) + -(_e1473));
    let _e1476 = u_xlat21_;
    let _e1478 = u_xlat9_;
    let _e1480 = u_xlat0_;
    u_xlat9_ = ((vec4(_e1476) * _e1478) + _e1480);
    let _e1482 = u_xlatb37_;
    if _e1482.x {
        let _e1484 = u_xlat9_;
        local_13 = _e1484;
    } else {
        let _e1485 = u_xlat0_;
        local_13 = _e1485;
    }
    let _e1487 = local_13;
    u_xlat9_ = _e1487;
    let _e1488 = u_xlat8_;
    let _e1489 = u_xlat9_;
    u_xlat10_ = (_e1488 * _e1489);
    let _e1491 = u_xlat10_;
    let _e1495 = _f_buffer1_.f_cb1_[32];
    let _e1498 = u_xlat9_;
    u_xlat9_ = ((_e1491 * _e1495.yyyy) + _e1498);
    let _e1500 = u_xlat8_;
    let _e1504 = _f_buffer1_.f_cb1_[32];
    let _e1507 = u_xlat9_;
    u_xlat9_ = ((_e1500 * _e1504.xxxx) + _e1507);
    let _e1509 = u_xlat9_;
    let _e1510 = u_xlat9_;
    u_xlat10_ = (_e1509 + _e1510);
    let _e1512 = u_xlat8_;
    let _e1513 = u_xlat10_;
    u_xlat12_ = (_e1512 * _e1513);
    let _e1515 = u_xlat9_;
    u_xlat13_ = (-(_e1515) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1523 = u_xlat13_;
    let _e1524 = u_xlat13_;
    u_xlat13_ = (_e1523 + _e1524);
    let _e1526 = u_xlat7_;
    let _e1528 = u_xlat6_;
    u_xlat6_ = ((-(_e1526) * _e1528) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1536 = u_xlat13_;
    let _e1538 = u_xlat6_;
    u_xlat6_ = ((-(_e1536) * _e1538) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1546 = u_xlat10_;
    u_xlat7_ = floor(_e1546);
    let _e1548 = u_xlat7_;
    u_xlat7_ = min(_e1548, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1555 = u_xlat10_;
    let _e1557 = u_xlat8_;
    let _e1559 = u_xlat6_;
    u_xlat6_ = ((-(_e1555) * _e1557) + _e1559);
    let _e1561 = u_xlat7_;
    let _e1562 = u_xlat6_;
    let _e1564 = u_xlat12_;
    u_xlat6_ = ((_e1561 * _e1562) + _e1564);
    let _e1566 = u_xlat0_;
    let _e1568 = u_xlat6_;
    u_xlat6_ = (-(_e1566) + _e1568);
    let _e1573 = _f_buffer1_.f_cb1_[32];
    let _e1575 = u_xlat6_;
    let _e1577 = u_xlat0_;
    u_xlat6_ = ((_e1573.zzzz * _e1575) + _e1577);
    let _e1579 = u_xlatb37_;
    if _e1579.y {
        let _e1581 = u_xlat6_;
        local_14 = _e1581;
    } else {
        let _e1582 = u_xlat9_;
        local_14 = _e1582;
    }
    let _e1584 = local_14;
    u_xlat6_ = _e1584;
    let _e1585 = u_xlat0_;
    let _e1587 = u_xlat6_;
    u_xlat6_ = (-(_e1585) + _e1587);
    let _e1589 = u_xlat3_;
    let _e1591 = u_xlat6_;
    let _e1593 = u_xlat0_;
    u_xlat3_ = ((_e1589.xxxx * _e1591) + _e1593);
    let _e1595 = u_xlatb4_;
    if _e1595.z {
        let _e1597 = u_xlat0_;
        local_15 = _e1597;
    } else {
        let _e1598 = u_xlat3_;
        local_15 = _e1598;
    }
    let _e1600 = local_15;
    u_xlat0_ = _e1600;
    let _e1604 = _f_buffer1_.f_cb1_[41];
    let _e1609 = _f_buffer1_.f_cb1_[41];
    u_xlat3_ = (_e1604.wwww * _e1609);
    let _e1611 = u_xlat3_;
    let _e1612 = u_xlat5_;
    u_xlat6_ = (_e1611 * _e1612);
    let _e1614 = u_xlatb37_;
    let _e1624 = _f_buffer1_.f_cb1_[45];
    let _e1627 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1624.wzwz).xy;
    u_xlatb37_.x = _e1627.x;
    u_xlatb37_.y = _e1627.y;
    let _e1632 = u_xlat6_;
    let _e1637 = _f_buffer1_.f_cb1_[45];
    u_xlat40_ = (_e1632.w * _e1637.w);
    let _e1640 = u_xlat40_;
    u_xlat40_ = clamp(_e1640, 0f, 1f);
    let _e1644 = u_xlat5_;
    let _e1645 = u_xlat3_;
    let _e1647 = u_xlat0_;
    u_xlat7_ = ((_e1644 * _e1645) + -(_e1647));
    let _e1650 = u_xlat40_;
    let _e1652 = u_xlat7_;
    let _e1654 = u_xlat0_;
    u_xlat7_ = ((vec4(_e1650) * _e1652) + _e1654);
    let _e1656 = u_xlatb37_;
    if _e1656.x {
        let _e1658 = u_xlat7_;
        local_16 = _e1658;
    } else {
        let _e1659 = u_xlat0_;
        local_16 = _e1659;
    }
    let _e1661 = local_16;
    u_xlat7_ = _e1661;
    let _e1662 = u_xlat6_;
    let _e1663 = u_xlat7_;
    u_xlat8_ = (_e1662 * _e1663);
    let _e1665 = u_xlat8_;
    let _e1669 = _f_buffer1_.f_cb1_[45];
    let _e1672 = u_xlat7_;
    u_xlat7_ = ((_e1665 * _e1669.yyyy) + _e1672);
    let _e1674 = u_xlat6_;
    let _e1678 = _f_buffer1_.f_cb1_[45];
    let _e1681 = u_xlat7_;
    u_xlat7_ = ((_e1674 * _e1678.xxxx) + _e1681);
    let _e1683 = u_xlat7_;
    let _e1684 = u_xlat7_;
    u_xlat8_ = (_e1683 + _e1684);
    let _e1686 = u_xlat6_;
    let _e1687 = u_xlat8_;
    u_xlat9_ = (_e1686 * _e1687);
    let _e1689 = u_xlat7_;
    u_xlat10_ = (-(_e1689) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1697 = u_xlat10_;
    let _e1698 = u_xlat10_;
    u_xlat10_ = (_e1697 + _e1698);
    let _e1700 = u_xlat5_;
    let _e1702 = u_xlat3_;
    u_xlat3_ = ((-(_e1700) * _e1702) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1710 = u_xlat10_;
    let _e1712 = u_xlat3_;
    u_xlat3_ = ((-(_e1710) * _e1712) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1720 = u_xlat8_;
    u_xlat5_ = floor(_e1720);
    let _e1722 = u_xlat5_;
    u_xlat5_ = min(_e1722, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1729 = u_xlat8_;
    let _e1731 = u_xlat6_;
    let _e1733 = u_xlat3_;
    u_xlat3_ = ((-(_e1729) * _e1731) + _e1733);
    let _e1735 = u_xlat5_;
    let _e1736 = u_xlat3_;
    let _e1738 = u_xlat9_;
    u_xlat3_ = ((_e1735 * _e1736) + _e1738);
    let _e1740 = u_xlat0_;
    let _e1742 = u_xlat3_;
    u_xlat3_ = (-(_e1740) + _e1742);
    let _e1747 = _f_buffer1_.f_cb1_[45];
    let _e1749 = u_xlat3_;
    let _e1751 = u_xlat0_;
    u_xlat3_ = ((_e1747.zzzz * _e1749) + _e1751);
    let _e1753 = u_xlatb37_;
    if _e1753.y {
        let _e1755 = u_xlat3_;
        local_17 = _e1755;
    } else {
        let _e1756 = u_xlat7_;
        local_17 = _e1756;
    }
    let _e1758 = local_17;
    u_xlat3_ = _e1758;
    let _e1759 = u_xlat0_;
    let _e1761 = u_xlat3_;
    u_xlat3_ = (-(_e1759) + _e1761);
    let _e1763 = u_xlat19_;
    let _e1765 = u_xlat3_;
    let _e1767 = u_xlat0_;
    u_xlat3_ = ((_e1763.xxxx * _e1765) + _e1767);
    let _e1769 = u_xlatb4_;
    if _e1769.y {
        let _e1771 = u_xlat0_;
        local_18 = _e1771;
    } else {
        let _e1772 = u_xlat3_;
        local_18 = _e1772;
    }
    let _e1774 = local_18;
    u_xlat0_ = _e1774;
    let _e1775 = u_xlatb4_;
    if _e1775.x {
        let _e1777 = u_xlat0_;
        local_19 = _e1777;
    } else {
        let _e1778 = u_xlat2_;
        local_19 = _e1778;
    }
    let _e1780 = local_19;
    u_xlat2_ = _e1780;
    let _e1785 = _f_buffer1_.f_cb1_[67];
    u_xlatb19_.x = (_e1785.z == 5f);
    let _e1789 = u_xlatb19_;
    if _e1789.x {
        {
            let _e1791 = u_xlat2_;
            let _e1792 = u_xlat1_;
            let _e1795 = u_xlat2_;
            u_xlat3_ = ((_e1791 * _e1792.xxxx) + -(_e1795));
            let _e1801 = _f_buffer1_.f_cb1_[67];
            let _e1803 = u_xlat3_;
            let _e1805 = u_xlat2_;
            u_xlat3_ = ((_e1801.wwww * _e1803) + _e1805);
            u_xlat11_.w = 1f;
            let _e1809 = u_xlat3_;
            let _e1813 = _f_buffer1_.f_cb1_[54];
            let _e1815 = u_xlat11_;
            SV_Target0_ = ((_e1809 * _e1813) + _e1815.xxxw);
            return;
        }
    }
    let _e1821 = _f_buffer1_.f_cb1_[54];
    let _e1826 = _f_buffer1_.f_cb1_[54];
    u_xlat3_ = (_e1821.wwww * _e1826);
    let _e1828 = u_xlat2_;
    let _e1829 = u_xlat3_;
    u_xlat5_ = (_e1828 * _e1829);
    let _e1831 = u_xlatb19_;
    let _e1841 = _f_buffer1_.f_cb1_[58];
    let _e1844 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1841.wzww).xy;
    u_xlatb19_.x = _e1844.x;
    u_xlatb19_.y = _e1844.y;
    let _e1849 = u_xlat5_;
    let _e1854 = _f_buffer1_.f_cb1_[58];
    u_xlat55_ = (_e1849.w * _e1854.w);
    let _e1857 = u_xlat55_;
    u_xlat55_ = clamp(_e1857, 0f, 1f);
    let _e1861 = u_xlat2_;
    let _e1862 = u_xlat3_;
    let _e1864 = u_xlat0_;
    u_xlat6_ = ((_e1861 * _e1862) + -(_e1864));
    let _e1867 = u_xlat55_;
    let _e1869 = u_xlat6_;
    let _e1871 = u_xlat0_;
    u_xlat6_ = ((vec4(_e1867) * _e1869) + _e1871);
    let _e1873 = u_xlatb19_;
    if _e1873.x {
        let _e1875 = u_xlat6_;
        local_20 = _e1875;
    } else {
        let _e1876 = u_xlat0_;
        local_20 = _e1876;
    }
    let _e1878 = local_20;
    u_xlat6_ = _e1878;
    let _e1879 = u_xlat5_;
    let _e1880 = u_xlat6_;
    u_xlat7_ = (_e1879 * _e1880);
    let _e1882 = u_xlat7_;
    let _e1886 = _f_buffer1_.f_cb1_[58];
    let _e1889 = u_xlat6_;
    u_xlat6_ = ((_e1882 * _e1886.yyyy) + _e1889);
    let _e1891 = u_xlat5_;
    let _e1895 = _f_buffer1_.f_cb1_[58];
    let _e1898 = u_xlat6_;
    u_xlat6_ = ((_e1891 * _e1895.xxxx) + _e1898);
    let _e1900 = u_xlat6_;
    let _e1901 = u_xlat6_;
    u_xlat7_ = (_e1900 + _e1901);
    let _e1903 = u_xlat5_;
    let _e1904 = u_xlat7_;
    u_xlat8_ = (_e1903 * _e1904);
    let _e1906 = u_xlat6_;
    u_xlat9_ = (-(_e1906) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1914 = u_xlat9_;
    let _e1915 = u_xlat9_;
    u_xlat9_ = (_e1914 + _e1915);
    let _e1917 = u_xlat2_;
    let _e1919 = u_xlat3_;
    u_xlat2_ = ((-(_e1917) * _e1919) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1927 = u_xlat9_;
    let _e1929 = u_xlat2_;
    u_xlat2_ = ((-(_e1927) * _e1929) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1937 = u_xlat7_;
    u_xlat3_ = floor(_e1937);
    let _e1939 = u_xlat3_;
    u_xlat3_ = min(_e1939, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1946 = u_xlat7_;
    let _e1948 = u_xlat5_;
    let _e1950 = u_xlat2_;
    u_xlat2_ = ((-(_e1946) * _e1948) + _e1950);
    let _e1952 = u_xlat3_;
    let _e1953 = u_xlat2_;
    let _e1955 = u_xlat8_;
    u_xlat2_ = ((_e1952 * _e1953) + _e1955);
    let _e1957 = u_xlat0_;
    let _e1959 = u_xlat2_;
    u_xlat2_ = (-(_e1957) + _e1959);
    let _e1964 = _f_buffer1_.f_cb1_[58];
    let _e1966 = u_xlat2_;
    let _e1968 = u_xlat0_;
    u_xlat2_ = ((_e1964.zzzz * _e1966) + _e1968);
    let _e1970 = u_xlatb19_;
    if _e1970.y {
        let _e1972 = u_xlat2_;
        local_21 = _e1972;
    } else {
        let _e1973 = u_xlat6_;
        local_21 = _e1973;
    }
    let _e1975 = local_21;
    u_xlat2_ = _e1975;
    let _e1976 = u_xlat0_;
    let _e1978 = u_xlat2_;
    u_xlat2_ = (-(_e1976) + _e1978);
    let _e1980 = u_xlat1_;
    let _e1982 = u_xlat2_;
    let _e1984 = u_xlat0_;
    u_xlat1_ = ((_e1980.xxxx * _e1982) + _e1984);
    let _e1986 = u_xlatb4_;
    if _e1986.x {
        let _e1988 = u_xlat0_;
        local_22 = _e1988;
    } else {
        let _e1989 = u_xlat1_;
        local_22 = _e1989;
    }
    let _e1991 = local_22;
    u_xlat0_ = _e1991;
    let _e1992 = u_xlat0_;
    u_xlat0_ = clamp(_e1992, vec4(0f), vec4(1f));
    let _e1998 = u_xlat0_;
    let _e1999 = vs_COLOR0_1;
    u_xlat1_ = (_e1998 * _e1999);
    let _e2001 = u_xlat0_;
    let _e2002 = u_xlat1_;
    SV_Target0_ = min(_e2001, _e2002);
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
