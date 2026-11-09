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
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat9_: vec4<f32> = vec4(0f);
    var u_xlat10_: vec4<f32> = vec4(0f);
    var u_xlat11_: vec4<f32> = vec4(0f);
    var u_xlat12_: vec4<f32> = vec4(0f);
    var u_xlat13_: vec4<f32> = vec4(0f);
    var u_xlat14_: vec4<f32> = vec4(0f);
    var u_xlat15_: vec2<f32> = vec2(0f);
    var u_xlatb15_: vec2<bool> = vec2(false);
    var u_xlat17_: vec2<f32> = vec2(0f);
    var u_xlatb17_: vec2<bool> = vec2(false);
    var u_xlat18_: f32 = 0f;
    var u_xlat30_: f32 = 0f;
    var u_xlat32_: vec2<f32> = vec2(0f);
    var u_xlatb32_: vec2<bool> = vec2(false);
    var u_xlat34_: f32 = 0f;
    var u_xlat45_: f32 = 0f;
    var u_xlat47_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec2<f32>;
    var local_3: vec2<f32>;
    var local_4: vec2<f32>;
    var local_5: f32;
    var local_6: vec4<f32>;
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

    let _e132 = _f_buffer1_.f_cb1_[67];
    u_xlatb0_ = (_e132.z == 10f);
    let _e136 = u_xlatb0_;
    if _e136 {
        {
            let _e137 = vs_COLOR0_1;
            SV_Target0_ = _e137;
            return;
        }
    }
    let _e138 = vs_TEXCOORD0_1;
    let _e143 = _f_buffer0_.f_cb0_[4];
    let _e148 = hscard_bias.values[1];
    let _e151 = textureSampleBias(f_t1_, samplerf_s1_, _e138.xy, (_e143.x + _e148.x));
    u_xlat0_ = _e151;
    let _e152 = vs_TEXCOORD2_1;
    let _e157 = _f_buffer0_.f_cb0_[4];
    let _e162 = hscard_bias.values[6];
    let _e165 = textureSampleBias(f_t6_, samplerf_s6_, _e152.xy, (_e157.x + _e162.x));
    u_xlat1_ = _e165;
    let _e166 = u_xlat0_;
    let _e170 = _f_buffer1_.f_cb1_[40];
    u_xlat2_ = dot(_e166, _e170);
    let _e172 = u_xlat2_;
    u_xlat2_ = min(_e172, 1f);
    let _e175 = u_xlat1_;
    let _e177 = u_xlat2_;
    u_xlat2_ = (_e175.w * _e177);
    let _e179 = u_xlat1_;
    let _e181 = u_xlat2_;
    u_xlat3_ = (_e179.xyxy * vec4(_e181));
    let _e184 = u_xlat3_;
    let _e188 = _f_buffer1_.f_cb1_[46];
    u_xlat3_ = (_e184 * _e188.zwxy);
    let _e191 = u_xlat2_;
    let _e193 = u_xlat3_;
    u_xlat3_ = (vec4(_e191) * _e193);
    let _e198 = _f_buffer1_.f_cb1_[67];
    u_xlatb4_ = (_e198.zzzz == vec4<f32>(14f, 13f, 12f, 11f));
    let _e206 = u_xlatb4_;
    if _e206.x {
        local = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e213 = u_xlat3_;
        local = _e213;
    }
    let _e215 = local;
    u_xlat3_ = _e215;
    let _e216 = u_xlat17_;
    let _e218 = u_xlat3_;
    let _e224 = vs_TEXCOORD1_1;
    let _e226 = ((_e218.xy * vec2<f32>(0.001f, 0.001f)) + _e224.zw);
    u_xlat17_.x = _e226.x;
    u_xlat17_.y = _e226.y;
    let _e231 = u_xlat17_;
    let _e236 = _f_buffer0_.f_cb0_[4];
    let _e241 = hscard_bias.values[5];
    let _e244 = textureSampleBias(f_t5_, samplerf_s5_, _e231.xy, (_e236.x + _e241.x));
    u_xlat5_ = _e244;
    let _e246 = u_xlat0_;
    let _e250 = _f_buffer1_.f_cb1_[27];
    u_xlat17_.x = dot(_e246, _e250);
    let _e253 = u_xlat17_;
    u_xlat17_.x = min(_e253.x, 1f);
    let _e258 = u_xlat17_;
    let _e260 = u_xlat5_;
    u_xlat17_.x = (_e258.x * _e260.w);
    let _e263 = u_xlat17_;
    let _e265 = u_xlat5_;
    u_xlat6_ = (_e263.xxxx * _e265.xyxy);
    let _e268 = u_xlat6_;
    let _e272 = _f_buffer1_.f_cb1_[33];
    u_xlat6_ = (_e268 * _e272.zwxy);
    let _e275 = u_xlat17_;
    let _e277 = u_xlat6_;
    u_xlat6_ = (_e275.xxxx * _e277);
    let _e279 = u_xlatb4_;
    if _e279.y {
        local_1 = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e286 = u_xlat6_;
        local_1 = _e286;
    }
    let _e288 = local_1;
    u_xlat6_ = _e288;
    let _e289 = u_xlat32_;
    let _e291 = u_xlat3_;
    let _e293 = u_xlat6_;
    let _e295 = (_e291.xy + _e293.xy);
    u_xlat32_.x = _e295.x;
    u_xlat32_.y = _e295.y;
    let _e300 = u_xlat3_;
    let _e302 = u_xlat32_;
    let _e308 = vs_TEXCOORD1_1;
    let _e310 = ((_e302.xy * vec2<f32>(0.001f, 0.001f)) + _e308.xy);
    u_xlat3_.x = _e310.x;
    u_xlat3_.y = _e310.y;
    let _e315 = u_xlat3_;
    let _e320 = _f_buffer0_.f_cb0_[4];
    let _e325 = hscard_bias.values[4];
    let _e328 = textureSampleBias(f_t4_, samplerf_s4_, _e315.xy, (_e320.x + _e325.x));
    u_xlat7_ = _e328;
    let _e330 = u_xlat0_;
    let _e334 = _f_buffer1_.f_cb1_[14];
    u_xlat3_.x = dot(_e330, _e334);
    let _e337 = u_xlat3_;
    u_xlat3_.x = min(_e337.x, 1f);
    let _e342 = u_xlat3_;
    let _e344 = u_xlat7_;
    u_xlat3_.x = (_e342.x * _e344.w);
    let _e347 = u_xlat6_;
    let _e349 = u_xlat3_;
    let _e351 = u_xlat7_;
    let _e353 = (_e349.xx * _e351.xy);
    u_xlat6_.x = _e353.x;
    u_xlat6_.y = _e353.y;
    let _e358 = u_xlat8_;
    let _e360 = u_xlat7_;
    let _e365 = _f_buffer1_.f_cb1_[20];
    let _e367 = (_e360.xy * _e365.zw);
    u_xlat8_.x = _e367.x;
    u_xlat8_.y = _e367.y;
    let _e372 = u_xlat8_;
    let _e374 = u_xlat3_;
    let _e376 = u_xlat8_;
    let _e378 = (_e374.xx * _e376.xy);
    u_xlat8_.x = _e378.x;
    u_xlat8_.y = _e378.y;
    let _e383 = u_xlat8_;
    let _e385 = u_xlatb4_;
    if _e385.z {
        local_2 = vec2<f32>(0f, 0f);
    } else {
        let _e390 = u_xlat8_;
        local_2 = _e390.xy;
    }
    let _e393 = local_2;
    u_xlat8_.x = _e393.x;
    u_xlat8_.y = _e393.y;
    let _e398 = u_xlat32_;
    let _e400 = u_xlat32_;
    let _e402 = u_xlat8_;
    let _e404 = (_e400.xy + _e402.xy);
    u_xlat32_.x = _e404.x;
    u_xlat32_.y = _e404.y;
    let _e409 = u_xlat32_;
    let _e411 = u_xlat32_;
    let _e417 = vs_TEXCOORD0_1;
    let _e419 = ((_e411.xy * vec2<f32>(0.001f, 0.001f)) + _e417.zw);
    u_xlat32_.x = _e419.x;
    u_xlat32_.y = _e419.y;
    let _e424 = u_xlat32_;
    let _e429 = _f_buffer0_.f_cb0_[4];
    let _e434 = hscard_bias.values[3];
    let _e437 = textureSampleBias(f_t3_, samplerf_s3_, _e424.xy, (_e429.x + _e434.x));
    u_xlat8_ = _e437;
    let _e438 = u_xlat32_;
    let _e443 = _f_buffer1_.f_cb1_[11];
    let _e449 = _f_buffer1_.f_cb1_[12];
    let _e451 = (-(_e443.xy) + _e449.zw);
    u_xlat32_.x = _e451.x;
    u_xlat32_.y = _e451.y;
    let _e456 = u_xlat8_;
    let _e458 = u_xlat32_;
    let _e461 = u_xlat8_;
    let _e463 = (-(_e458.xy) + _e461.xy);
    u_xlat8_.x = _e463.x;
    u_xlat8_.y = _e463.y;
    let _e468 = u_xlat32_;
    let _e470 = u_xlat8_;
    let _e475 = _f_buffer1_.f_cb1_[12];
    let _e478 = u_xlat32_;
    let _e480 = ((_e470.xy * _e475.xy) + _e478.xy);
    u_xlat32_.x = _e480.x;
    u_xlat32_.y = _e480.y;
    let _e485 = u_xlat8_;
    let _e490 = _f_buffer1_.f_cb1_[11];
    let _e495 = _f_buffer1_.f_cb1_[11];
    let _e497 = (_e490.zw + _e495.xy);
    u_xlat8_.x = _e497.x;
    u_xlat8_.y = _e497.y;
    let _e502 = u_xlat32_;
    let _e504 = u_xlat32_;
    let _e506 = u_xlat8_;
    let _e508 = (_e504.xy + _e506.xy);
    u_xlat32_.x = _e508.x;
    u_xlat32_.y = _e508.y;
    let _e513 = u_xlat32_;
    let _e518 = _f_buffer0_.f_cb0_[4];
    let _e523 = hscard_bias.values[2];
    let _e526 = textureSampleBias(f_t2_, samplerf_s2_, _e513.xy, (_e518.x + _e523.x));
    u_xlat9_ = _e526;
    let _e528 = u_xlat8_;
    let _e530 = u_xlat9_;
    u_xlat9_.w = (_e528.z * _e530.w);
    let _e534 = u_xlat0_;
    let _e538 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = dot(_e534, _e538);
    let _e541 = u_xlat0_;
    u_xlat0_.x = min(_e541.x, 1f);
    let _e546 = u_xlat0_;
    let _e548 = u_xlat9_;
    u_xlat0_.x = (_e546.x * _e548.w);
    let _e551 = u_xlat15_;
    let _e553 = u_xlat9_;
    let _e558 = _f_buffer1_.f_cb1_[8];
    let _e560 = (_e553.xy * _e558.xy);
    u_xlat15_.x = _e560.x;
    u_xlat15_.y = _e560.y;
    let _e565 = u_xlat15_;
    let _e567 = u_xlat0_;
    let _e569 = u_xlat15_;
    let _e571 = (_e567.xx * _e569.xy);
    u_xlat15_.x = _e571.x;
    u_xlat15_.y = _e571.y;
    let _e576 = u_xlat32_;
    let _e578 = u_xlat6_;
    let _e583 = _f_buffer1_.f_cb1_[20];
    let _e585 = (_e578.xy * _e583.xy);
    u_xlat32_.x = _e585.x;
    u_xlat32_.y = _e585.y;
    let _e590 = u_xlat32_;
    let _e592 = u_xlat3_;
    let _e594 = u_xlat32_;
    let _e596 = (_e592.xx * _e594.xy);
    u_xlat32_.x = _e596.x;
    u_xlat32_.y = _e596.y;
    let _e601 = u_xlat15_;
    let _e603 = u_xlatb4_;
    if _e603.w {
        local_3 = vec2<f32>(0f, 0f);
    } else {
        let _e608 = u_xlat15_;
        local_3 = _e608.xy;
    }
    let _e611 = local_3;
    u_xlat15_.x = _e611.x;
    u_xlat15_.y = _e611.y;
    let _e616 = u_xlat32_;
    let _e618 = u_xlatb4_;
    if _e618.z {
        local_4 = vec2<f32>(0f, 0f);
    } else {
        let _e623 = u_xlat32_;
        local_4 = _e623.xy;
    }
    let _e626 = local_4;
    u_xlat32_.x = _e626.x;
    u_xlat32_.y = _e626.y;
    let _e631 = u_xlat15_;
    let _e633 = u_xlat15_;
    let _e635 = u_xlat32_;
    let _e637 = (_e633.xy + _e635.xy);
    u_xlat15_.x = _e637.x;
    u_xlat15_.y = _e637.y;
    let _e642 = u_xlat15_;
    let _e644 = u_xlat6_;
    let _e646 = u_xlat15_;
    let _e648 = (_e644.zw + _e646.xy);
    u_xlat15_.x = _e648.x;
    u_xlat15_.y = _e648.y;
    let _e653 = u_xlat15_;
    let _e655 = u_xlat3_;
    let _e657 = u_xlat15_;
    let _e659 = (_e655.zw + _e657.xy);
    u_xlat15_.x = _e659.x;
    u_xlat15_.y = _e659.y;
    let _e664 = u_xlat15_;
    let _e666 = u_xlat15_;
    let _e672 = vs_TEXCOORD0_1;
    let _e674 = ((_e666.xy * vec2<f32>(0.001f, 0.001f)) + _e672.xy);
    u_xlat15_.x = _e674.x;
    u_xlat15_.y = _e674.y;
    let _e679 = u_xlat15_;
    let _e684 = _f_buffer0_.f_cb0_[4];
    let _e689 = hscard_bias.values[0];
    let _e692 = textureSampleBias(f_t0_, samplerf_s0_, _e679.xy, (_e684.x + _e689.x));
    u_xlat6_ = _e692;
    let _e698 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (0f < _e698.z);
    let _e701 = u_xlat6_;
    u_xlat30_ = dot(_e701, vec4<f32>(0.1f, 0.1f, 0.1f, 0.1f));
    let _e709 = u_xlatb15_;
    if _e709.x {
        let _e711 = u_xlat30_;
        local_5 = _e711;
    } else {
        local_5 = 0f;
    }
    let _e715 = local_5;
    u_xlat8_.x = _e715;
    let _e720 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (_e720.z == 1f);
    let _e724 = u_xlatb15_;
    if _e724.x {
        {
            let _e726 = u_xlat9_;
            let _e727 = u_xlat0_;
            let _e730 = u_xlat9_;
            u_xlat10_ = ((_e726 * _e727.xxxx) + -(_e730));
            let _e736 = _f_buffer1_.f_cb1_[67];
            let _e738 = u_xlat10_;
            let _e740 = u_xlat9_;
            u_xlat10_ = ((_e736.wwww * _e738) + _e740);
            u_xlat8_.y = 1f;
            let _e744 = u_xlat10_;
            let _e748 = _f_buffer1_.f_cb1_[3];
            let _e750 = u_xlat8_;
            SV_Target0_ = ((_e744 * _e748) + _e750.xxxy);
            return;
        }
    }
    let _e757 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (_e757.z == 2f);
    let _e761 = u_xlatb15_;
    if _e761.x {
        {
            let _e763 = u_xlat7_;
            let _e764 = u_xlat3_;
            let _e767 = u_xlat7_;
            u_xlat10_ = ((_e763 * _e764.xxxx) + -(_e767));
            let _e773 = _f_buffer1_.f_cb1_[67];
            let _e775 = u_xlat10_;
            let _e777 = u_xlat7_;
            u_xlat10_ = ((_e773.wwww * _e775) + _e777);
            u_xlat8_.z = 1f;
            let _e781 = u_xlat10_;
            let _e785 = _f_buffer1_.f_cb1_[15];
            let _e787 = u_xlat8_;
            SV_Target0_ = ((_e781 * _e785) + _e787.xxxz);
            return;
        }
    }
    let _e794 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (_e794.z == 3f);
    let _e798 = u_xlatb15_;
    if _e798.x {
        {
            let _e800 = u_xlat5_;
            let _e801 = u_xlat17_;
            let _e804 = u_xlat5_;
            u_xlat10_ = ((_e800 * _e801.xxxx) + -(_e804));
            let _e810 = _f_buffer1_.f_cb1_[67];
            let _e812 = u_xlat10_;
            let _e814 = u_xlat5_;
            u_xlat10_ = ((_e810.wwww * _e812) + _e814);
            u_xlat8_.w = 1f;
            let _e818 = u_xlat10_;
            let _e822 = _f_buffer1_.f_cb1_[28];
            let _e824 = u_xlat8_;
            SV_Target0_ = ((_e818 * _e822) + _e824.xxxw);
            return;
        }
    }
    let _e831 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (_e831.z == 4f);
    let _e835 = u_xlatb15_;
    if _e835.x {
        {
            let _e837 = u_xlat1_;
            let _e838 = u_xlat2_;
            let _e841 = u_xlat1_;
            u_xlat10_ = ((_e837 * vec4(_e838)) + -(_e841));
            let _e847 = _f_buffer1_.f_cb1_[67];
            let _e849 = u_xlat10_;
            let _e851 = u_xlat1_;
            u_xlat10_ = ((_e847.wwww * _e849) + _e851);
            u_xlat8_.w = 1f;
            let _e855 = u_xlat10_;
            let _e859 = _f_buffer1_.f_cb1_[41];
            let _e861 = u_xlat8_;
            SV_Target0_ = ((_e855 * _e859) + _e861.xxxw);
            return;
        }
    }
    let _e867 = _f_buffer1_.f_cb1_[3];
    let _e872 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = (_e867.wwww * _e872);
    let _e874 = u_xlat8_;
    let _e875 = u_xlat9_;
    u_xlat10_ = (_e874 * _e875);
    let _e877 = u_xlatb15_;
    let _e887 = _f_buffer1_.f_cb1_[7];
    let _e890 = (vec4<f32>(0f, 0f, 0f, 0f) < _e887.wzww).xy;
    u_xlatb15_.x = _e890.x;
    u_xlatb15_.y = _e890.y;
    let _e895 = u_xlat10_;
    let _e900 = _f_buffer1_.f_cb1_[7];
    u_xlat45_ = (_e895.w * _e900.w);
    let _e903 = u_xlat45_;
    u_xlat45_ = clamp(_e903, 0f, 1f);
    let _e907 = u_xlat9_;
    let _e908 = u_xlat8_;
    let _e910 = u_xlat6_;
    u_xlat11_ = ((_e907 * _e908) + -(_e910));
    let _e913 = u_xlat45_;
    let _e915 = u_xlat11_;
    let _e917 = u_xlat6_;
    u_xlat11_ = ((vec4(_e913) * _e915) + _e917);
    let _e919 = u_xlatb15_;
    if _e919.x {
        let _e921 = u_xlat11_;
        local_6 = _e921;
    } else {
        let _e922 = u_xlat6_;
        local_6 = _e922;
    }
    let _e924 = local_6;
    u_xlat11_ = _e924;
    let _e925 = u_xlat10_;
    let _e926 = u_xlat11_;
    u_xlat12_ = (_e925 * _e926);
    let _e928 = u_xlat12_;
    let _e932 = _f_buffer1_.f_cb1_[7];
    let _e935 = u_xlat11_;
    u_xlat11_ = ((_e928 * _e932.yyyy) + _e935);
    let _e937 = u_xlat10_;
    let _e941 = _f_buffer1_.f_cb1_[7];
    let _e944 = u_xlat11_;
    u_xlat11_ = ((_e937 * _e941.xxxx) + _e944);
    let _e946 = u_xlat11_;
    let _e947 = u_xlat11_;
    u_xlat12_ = (_e946 + _e947);
    let _e949 = u_xlat10_;
    let _e950 = u_xlat12_;
    u_xlat13_ = (_e949 * _e950);
    let _e952 = u_xlat11_;
    u_xlat14_ = (-(_e952) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e960 = u_xlat14_;
    let _e961 = u_xlat14_;
    u_xlat14_ = (_e960 + _e961);
    let _e963 = u_xlat9_;
    let _e965 = u_xlat8_;
    u_xlat8_ = ((-(_e963) * _e965) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e973 = u_xlat14_;
    let _e975 = u_xlat8_;
    u_xlat8_ = ((-(_e973) * _e975) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e983 = u_xlat12_;
    u_xlat9_ = floor(_e983);
    let _e985 = u_xlat9_;
    u_xlat9_ = min(_e985, vec4<f32>(1f, 1f, 1f, 1f));
    let _e992 = u_xlat12_;
    let _e994 = u_xlat10_;
    let _e996 = u_xlat8_;
    u_xlat8_ = ((-(_e992) * _e994) + _e996);
    let _e998 = u_xlat9_;
    let _e999 = u_xlat8_;
    let _e1001 = u_xlat13_;
    u_xlat8_ = ((_e998 * _e999) + _e1001);
    let _e1003 = u_xlat6_;
    let _e1005 = u_xlat8_;
    u_xlat8_ = (-(_e1003) + _e1005);
    let _e1010 = _f_buffer1_.f_cb1_[7];
    let _e1012 = u_xlat8_;
    let _e1014 = u_xlat6_;
    u_xlat8_ = ((_e1010.zzzz * _e1012) + _e1014);
    let _e1016 = u_xlatb15_;
    if _e1016.y {
        let _e1018 = u_xlat8_;
        local_7 = _e1018;
    } else {
        let _e1019 = u_xlat11_;
        local_7 = _e1019;
    }
    let _e1021 = local_7;
    u_xlat8_ = _e1021;
    let _e1022 = u_xlat6_;
    let _e1024 = u_xlat8_;
    u_xlat8_ = (-(_e1022) + _e1024);
    let _e1026 = u_xlat0_;
    let _e1028 = u_xlat8_;
    let _e1030 = u_xlat6_;
    u_xlat0_ = ((_e1026.xxxx * _e1028) + _e1030);
    let _e1032 = u_xlatb4_;
    if _e1032.w {
        let _e1034 = u_xlat6_;
        local_8 = _e1034;
    } else {
        let _e1035 = u_xlat0_;
        local_8 = _e1035;
    }
    let _e1037 = local_8;
    u_xlat0_ = _e1037;
    let _e1041 = _f_buffer1_.f_cb1_[15];
    let _e1046 = _f_buffer1_.f_cb1_[15];
    u_xlat6_ = (_e1041.wwww * _e1046);
    let _e1048 = u_xlat6_;
    let _e1049 = u_xlat7_;
    u_xlat8_ = (_e1048 * _e1049);
    let _e1051 = u_xlatb32_;
    let _e1061 = _f_buffer1_.f_cb1_[19];
    let _e1064 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1061.wzwz).xy;
    u_xlatb32_.x = _e1064.x;
    u_xlatb32_.y = _e1064.y;
    let _e1069 = u_xlat8_;
    let _e1074 = _f_buffer1_.f_cb1_[19];
    u_xlat18_ = (_e1069.w * _e1074.w);
    let _e1077 = u_xlat18_;
    u_xlat18_ = clamp(_e1077, 0f, 1f);
    let _e1081 = u_xlat7_;
    let _e1082 = u_xlat6_;
    let _e1084 = u_xlat0_;
    u_xlat9_ = ((_e1081 * _e1082) + -(_e1084));
    let _e1087 = u_xlat18_;
    let _e1089 = u_xlat9_;
    let _e1091 = u_xlat0_;
    u_xlat9_ = ((vec4(_e1087) * _e1089) + _e1091);
    let _e1093 = u_xlatb32_;
    if _e1093.x {
        let _e1095 = u_xlat9_;
        local_9 = _e1095;
    } else {
        let _e1096 = u_xlat0_;
        local_9 = _e1096;
    }
    let _e1098 = local_9;
    u_xlat9_ = _e1098;
    let _e1099 = u_xlat8_;
    let _e1100 = u_xlat9_;
    u_xlat10_ = (_e1099 * _e1100);
    let _e1102 = u_xlat10_;
    let _e1106 = _f_buffer1_.f_cb1_[19];
    let _e1109 = u_xlat9_;
    u_xlat9_ = ((_e1102 * _e1106.yyyy) + _e1109);
    let _e1111 = u_xlat8_;
    let _e1115 = _f_buffer1_.f_cb1_[19];
    let _e1118 = u_xlat9_;
    u_xlat9_ = ((_e1111 * _e1115.xxxx) + _e1118);
    let _e1120 = u_xlat9_;
    let _e1121 = u_xlat9_;
    u_xlat10_ = (_e1120 + _e1121);
    let _e1123 = u_xlat8_;
    let _e1124 = u_xlat10_;
    u_xlat11_ = (_e1123 * _e1124);
    let _e1126 = u_xlat9_;
    u_xlat12_ = (-(_e1126) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1134 = u_xlat12_;
    let _e1135 = u_xlat12_;
    u_xlat12_ = (_e1134 + _e1135);
    let _e1137 = u_xlat7_;
    let _e1139 = u_xlat6_;
    u_xlat6_ = ((-(_e1137) * _e1139) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1147 = u_xlat12_;
    let _e1149 = u_xlat6_;
    u_xlat6_ = ((-(_e1147) * _e1149) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1157 = u_xlat10_;
    u_xlat7_ = floor(_e1157);
    let _e1159 = u_xlat7_;
    u_xlat7_ = min(_e1159, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1166 = u_xlat10_;
    let _e1168 = u_xlat8_;
    let _e1170 = u_xlat6_;
    u_xlat6_ = ((-(_e1166) * _e1168) + _e1170);
    let _e1172 = u_xlat7_;
    let _e1173 = u_xlat6_;
    let _e1175 = u_xlat11_;
    u_xlat6_ = ((_e1172 * _e1173) + _e1175);
    let _e1177 = u_xlat0_;
    let _e1179 = u_xlat6_;
    u_xlat6_ = (-(_e1177) + _e1179);
    let _e1184 = _f_buffer1_.f_cb1_[19];
    let _e1186 = u_xlat6_;
    let _e1188 = u_xlat0_;
    u_xlat6_ = ((_e1184.zzzz * _e1186) + _e1188);
    let _e1190 = u_xlatb32_;
    if _e1190.y {
        let _e1192 = u_xlat6_;
        local_10 = _e1192;
    } else {
        let _e1193 = u_xlat9_;
        local_10 = _e1193;
    }
    let _e1195 = local_10;
    u_xlat6_ = _e1195;
    let _e1196 = u_xlat0_;
    let _e1198 = u_xlat6_;
    u_xlat6_ = (-(_e1196) + _e1198);
    let _e1200 = u_xlat3_;
    let _e1202 = u_xlat6_;
    let _e1204 = u_xlat0_;
    u_xlat3_ = ((_e1200.xxxx * _e1202) + _e1204);
    let _e1206 = u_xlatb4_;
    if _e1206.z {
        let _e1208 = u_xlat0_;
        local_11 = _e1208;
    } else {
        let _e1209 = u_xlat3_;
        local_11 = _e1209;
    }
    let _e1211 = local_11;
    u_xlat0_ = _e1211;
    let _e1215 = _f_buffer1_.f_cb1_[28];
    let _e1220 = _f_buffer1_.f_cb1_[28];
    u_xlat3_ = (_e1215.wwww * _e1220);
    let _e1222 = u_xlat3_;
    let _e1223 = u_xlat5_;
    u_xlat6_ = (_e1222 * _e1223);
    let _e1225 = u_xlatb32_;
    let _e1235 = _f_buffer1_.f_cb1_[32];
    let _e1238 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1235.wzwz).xy;
    u_xlatb32_.x = _e1238.x;
    u_xlatb32_.y = _e1238.y;
    let _e1243 = u_xlat6_;
    let _e1248 = _f_buffer1_.f_cb1_[32];
    u_xlat34_ = (_e1243.w * _e1248.w);
    let _e1251 = u_xlat34_;
    u_xlat34_ = clamp(_e1251, 0f, 1f);
    let _e1255 = u_xlat5_;
    let _e1256 = u_xlat3_;
    let _e1258 = u_xlat0_;
    u_xlat7_ = ((_e1255 * _e1256) + -(_e1258));
    let _e1261 = u_xlat34_;
    let _e1263 = u_xlat7_;
    let _e1265 = u_xlat0_;
    u_xlat7_ = ((vec4(_e1261) * _e1263) + _e1265);
    let _e1267 = u_xlatb32_;
    if _e1267.x {
        let _e1269 = u_xlat7_;
        local_12 = _e1269;
    } else {
        let _e1270 = u_xlat0_;
        local_12 = _e1270;
    }
    let _e1272 = local_12;
    u_xlat7_ = _e1272;
    let _e1273 = u_xlat6_;
    let _e1274 = u_xlat7_;
    u_xlat8_ = (_e1273 * _e1274);
    let _e1276 = u_xlat8_;
    let _e1280 = _f_buffer1_.f_cb1_[32];
    let _e1283 = u_xlat7_;
    u_xlat7_ = ((_e1276 * _e1280.yyyy) + _e1283);
    let _e1285 = u_xlat6_;
    let _e1289 = _f_buffer1_.f_cb1_[32];
    let _e1292 = u_xlat7_;
    u_xlat7_ = ((_e1285 * _e1289.xxxx) + _e1292);
    let _e1294 = u_xlat7_;
    let _e1295 = u_xlat7_;
    u_xlat8_ = (_e1294 + _e1295);
    let _e1297 = u_xlat6_;
    let _e1298 = u_xlat8_;
    u_xlat9_ = (_e1297 * _e1298);
    let _e1300 = u_xlat7_;
    u_xlat10_ = (-(_e1300) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1308 = u_xlat10_;
    let _e1309 = u_xlat10_;
    u_xlat10_ = (_e1308 + _e1309);
    let _e1311 = u_xlat5_;
    let _e1313 = u_xlat3_;
    u_xlat3_ = ((-(_e1311) * _e1313) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1321 = u_xlat10_;
    let _e1323 = u_xlat3_;
    u_xlat3_ = ((-(_e1321) * _e1323) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1331 = u_xlat8_;
    u_xlat5_ = floor(_e1331);
    let _e1333 = u_xlat5_;
    u_xlat5_ = min(_e1333, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1340 = u_xlat8_;
    let _e1342 = u_xlat6_;
    let _e1344 = u_xlat3_;
    u_xlat3_ = ((-(_e1340) * _e1342) + _e1344);
    let _e1346 = u_xlat5_;
    let _e1347 = u_xlat3_;
    let _e1349 = u_xlat9_;
    u_xlat3_ = ((_e1346 * _e1347) + _e1349);
    let _e1351 = u_xlat0_;
    let _e1353 = u_xlat3_;
    u_xlat3_ = (-(_e1351) + _e1353);
    let _e1358 = _f_buffer1_.f_cb1_[32];
    let _e1360 = u_xlat3_;
    let _e1362 = u_xlat0_;
    u_xlat3_ = ((_e1358.zzzz * _e1360) + _e1362);
    let _e1364 = u_xlatb32_;
    if _e1364.y {
        let _e1366 = u_xlat3_;
        local_13 = _e1366;
    } else {
        let _e1367 = u_xlat7_;
        local_13 = _e1367;
    }
    let _e1369 = local_13;
    u_xlat3_ = _e1369;
    let _e1370 = u_xlat0_;
    let _e1372 = u_xlat3_;
    u_xlat3_ = (-(_e1370) + _e1372);
    let _e1374 = u_xlat17_;
    let _e1376 = u_xlat3_;
    let _e1378 = u_xlat0_;
    u_xlat3_ = ((_e1374.xxxx * _e1376) + _e1378);
    let _e1380 = u_xlatb4_;
    if _e1380.y {
        let _e1382 = u_xlat0_;
        local_14 = _e1382;
    } else {
        let _e1383 = u_xlat3_;
        local_14 = _e1383;
    }
    let _e1385 = local_14;
    u_xlat0_ = _e1385;
    let _e1389 = _f_buffer1_.f_cb1_[41];
    let _e1394 = _f_buffer1_.f_cb1_[41];
    u_xlat3_ = (_e1389.wwww * _e1394);
    let _e1396 = u_xlat1_;
    let _e1397 = u_xlat3_;
    u_xlat5_ = (_e1396 * _e1397);
    let _e1399 = u_xlatb17_;
    let _e1409 = _f_buffer1_.f_cb1_[45];
    let _e1412 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1409.wzww).xy;
    u_xlatb17_.x = _e1412.x;
    u_xlatb17_.y = _e1412.y;
    let _e1417 = u_xlat5_;
    let _e1422 = _f_buffer1_.f_cb1_[45];
    u_xlat47_ = (_e1417.w * _e1422.w);
    let _e1425 = u_xlat47_;
    u_xlat47_ = clamp(_e1425, 0f, 1f);
    let _e1429 = u_xlat1_;
    let _e1430 = u_xlat3_;
    let _e1432 = u_xlat0_;
    u_xlat6_ = ((_e1429 * _e1430) + -(_e1432));
    let _e1435 = u_xlat47_;
    let _e1437 = u_xlat6_;
    let _e1439 = u_xlat0_;
    u_xlat6_ = ((vec4(_e1435) * _e1437) + _e1439);
    let _e1441 = u_xlatb17_;
    if _e1441.x {
        let _e1443 = u_xlat6_;
        local_15 = _e1443;
    } else {
        let _e1444 = u_xlat0_;
        local_15 = _e1444;
    }
    let _e1446 = local_15;
    u_xlat6_ = _e1446;
    let _e1447 = u_xlat5_;
    let _e1448 = u_xlat6_;
    u_xlat7_ = (_e1447 * _e1448);
    let _e1450 = u_xlat7_;
    let _e1454 = _f_buffer1_.f_cb1_[45];
    let _e1457 = u_xlat6_;
    u_xlat6_ = ((_e1450 * _e1454.yyyy) + _e1457);
    let _e1459 = u_xlat5_;
    let _e1463 = _f_buffer1_.f_cb1_[45];
    let _e1466 = u_xlat6_;
    u_xlat6_ = ((_e1459 * _e1463.xxxx) + _e1466);
    let _e1468 = u_xlat6_;
    let _e1469 = u_xlat6_;
    u_xlat7_ = (_e1468 + _e1469);
    let _e1471 = u_xlat5_;
    let _e1472 = u_xlat7_;
    u_xlat8_ = (_e1471 * _e1472);
    let _e1474 = u_xlat6_;
    u_xlat9_ = (-(_e1474) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1482 = u_xlat9_;
    let _e1483 = u_xlat9_;
    u_xlat9_ = (_e1482 + _e1483);
    let _e1485 = u_xlat1_;
    let _e1487 = u_xlat3_;
    u_xlat1_ = ((-(_e1485) * _e1487) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1495 = u_xlat9_;
    let _e1497 = u_xlat1_;
    u_xlat1_ = ((-(_e1495) * _e1497) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1505 = u_xlat7_;
    u_xlat3_ = floor(_e1505);
    let _e1507 = u_xlat3_;
    u_xlat3_ = min(_e1507, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1514 = u_xlat7_;
    let _e1516 = u_xlat5_;
    let _e1518 = u_xlat1_;
    u_xlat1_ = ((-(_e1514) * _e1516) + _e1518);
    let _e1520 = u_xlat3_;
    let _e1521 = u_xlat1_;
    let _e1523 = u_xlat8_;
    u_xlat1_ = ((_e1520 * _e1521) + _e1523);
    let _e1525 = u_xlat0_;
    let _e1527 = u_xlat1_;
    u_xlat1_ = (-(_e1525) + _e1527);
    let _e1532 = _f_buffer1_.f_cb1_[45];
    let _e1534 = u_xlat1_;
    let _e1536 = u_xlat0_;
    u_xlat1_ = ((_e1532.zzzz * _e1534) + _e1536);
    let _e1538 = u_xlatb17_;
    if _e1538.y {
        let _e1540 = u_xlat1_;
        local_16 = _e1540;
    } else {
        let _e1541 = u_xlat6_;
        local_16 = _e1541;
    }
    let _e1543 = local_16;
    u_xlat1_ = _e1543;
    let _e1544 = u_xlat0_;
    let _e1546 = u_xlat1_;
    u_xlat1_ = (-(_e1544) + _e1546);
    let _e1548 = u_xlat2_;
    let _e1550 = u_xlat1_;
    let _e1552 = u_xlat0_;
    u_xlat1_ = ((vec4(_e1548) * _e1550) + _e1552);
    let _e1554 = u_xlatb4_;
    if _e1554.x {
        let _e1556 = u_xlat0_;
        local_17 = _e1556;
    } else {
        let _e1557 = u_xlat1_;
        local_17 = _e1557;
    }
    let _e1559 = local_17;
    u_xlat0_ = _e1559;
    let _e1560 = u_xlat0_;
    u_xlat0_ = clamp(_e1560, vec4(0f), vec4(1f));
    let _e1566 = u_xlat0_;
    let _e1567 = vs_COLOR0_1;
    u_xlat1_ = (_e1566 * _e1567);
    let _e1569 = u_xlat0_;
    let _e1570 = u_xlat1_;
    SV_Target0_ = min(_e1569, _e1570);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e56 = SV_Target0_;
    return FragmentOutput(_e56);
}
