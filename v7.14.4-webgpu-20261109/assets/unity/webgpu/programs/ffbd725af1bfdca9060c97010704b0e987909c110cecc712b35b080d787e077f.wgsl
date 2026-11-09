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

    let _e134 = _f_buffer1_.f_cb1_[67];
    u_xlatb0_ = (_e134.z == 10f);
    let _e138 = u_xlatb0_;
    if _e138 {
        {
            let _e139 = vs_COLOR0_1;
            SV_Target0_ = _e139;
            return;
        }
    }
    let _e140 = vs_TEXCOORD0_1;
    let _e145 = _f_buffer0_.f_cb0_[4];
    let _e150 = hscard_bias.values[1];
    let _e153 = textureSampleBias(f_t1_, samplerf_s1_, _e140.xy, (_e145.x + _e150.x));
    u_xlat0_ = _e153;
    let _e154 = vs_TEXCOORD2_1;
    let _e159 = _f_buffer0_.f_cb0_[4];
    let _e164 = hscard_bias.values[7];
    let _e167 = textureSampleBias(f_t7_, samplerf_s7_, _e154.xy, (_e159.x + _e164.x));
    u_xlat1_ = _e167;
    let _e168 = u_xlat0_;
    let _e172 = _f_buffer1_.f_cb1_[40];
    u_xlat2_ = dot(_e168, _e172);
    let _e174 = u_xlat2_;
    u_xlat2_ = min(_e174, 1f);
    let _e177 = u_xlat1_;
    let _e179 = u_xlat2_;
    u_xlat2_ = (_e177.w * _e179);
    let _e181 = u_xlat1_;
    let _e183 = u_xlat2_;
    u_xlat3_ = (_e181.xyxy * vec4(_e183));
    let _e186 = u_xlat3_;
    let _e190 = _f_buffer1_.f_cb1_[46];
    u_xlat3_ = (_e186 * _e190.zwxy);
    let _e193 = u_xlat2_;
    let _e195 = u_xlat3_;
    u_xlat3_ = (vec4(_e193) * _e195);
    let _e200 = _f_buffer1_.f_cb1_[67];
    u_xlatb4_ = (_e200.zzzz == vec4<f32>(14f, 13f, 12f, 11f));
    let _e208 = u_xlatb4_;
    if _e208.x {
        local = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e215 = u_xlat3_;
        local = _e215;
    }
    let _e217 = local;
    u_xlat3_ = _e217;
    let _e218 = u_xlat17_;
    let _e220 = u_xlat3_;
    let _e226 = vs_TEXCOORD1_1;
    let _e228 = ((_e220.xy * vec2<f32>(0.001f, 0.001f)) + _e226.zw);
    u_xlat17_.x = _e228.x;
    u_xlat17_.y = _e228.y;
    let _e233 = u_xlat17_;
    let _e238 = _f_buffer0_.f_cb0_[4];
    let _e243 = hscard_bias.values[6];
    let _e246 = textureSampleBias(f_t6_, samplerf_s6_, _e233.xy, (_e238.x + _e243.x));
    u_xlat5_ = _e246;
    let _e251 = _f_buffer1_.f_cb1_[39];
    let _e256 = _f_buffer1_.f_cb1_[39];
    u_xlat17_.x = (_e251.y + _e256.x);
    let _e260 = u_xlat17_;
    u_xlat6_.x = sin(_e260.x);
    let _e264 = u_xlat17_;
    u_xlat7_.x = cos(_e264.x);
    let _e268 = u_xlat6_;
    u_xlat8_.x = -(_e268.x);
    let _e271 = u_xlat17_;
    let _e276 = _f_buffer1_.f_cb1_[37];
    let _e282 = _f_buffer1_.f_cb1_[39];
    let _e284 = (-(_e276.xy) + _e282.zw);
    u_xlat17_.x = _e284.x;
    u_xlat17_.y = _e284.y;
    let _e289 = u_xlat5_;
    let _e291 = u_xlat17_;
    let _e294 = u_xlat5_;
    let _e296 = (-(_e291.xy) + _e294.xy);
    u_xlat5_.x = _e296.x;
    u_xlat5_.y = _e296.y;
    let _e302 = u_xlat7_;
    u_xlat8_.y = _e302.x;
    let _e305 = u_xlat6_;
    u_xlat8_.z = _e305.x;
    let _e308 = u_xlat5_;
    let _e310 = u_xlat8_;
    u_xlat6_.x = dot(_e308.xy, _e310.yz);
    let _e314 = u_xlat5_;
    let _e316 = u_xlat8_;
    u_xlat6_.y = dot(_e314.xy, _e316.xy);
    let _e319 = u_xlat17_;
    let _e321 = u_xlat17_;
    let _e323 = u_xlat6_;
    let _e325 = (_e321.xy + _e323.xy);
    u_xlat17_.x = _e325.x;
    u_xlat17_.y = _e325.y;
    let _e330 = u_xlat5_;
    let _e335 = _f_buffer1_.f_cb1_[37];
    let _e341 = _f_buffer1_.f_cb1_[38];
    let _e343 = (-(_e335.xy) + _e341.zw);
    u_xlat5_.x = _e343.x;
    u_xlat5_.y = _e343.y;
    let _e348 = u_xlat17_;
    let _e350 = u_xlat17_;
    let _e352 = u_xlat5_;
    let _e355 = (_e350.xy + -(_e352.xy));
    u_xlat17_.x = _e355.x;
    u_xlat17_.y = _e355.y;
    let _e360 = u_xlat17_;
    let _e362 = u_xlat17_;
    let _e367 = _f_buffer1_.f_cb1_[38];
    let _e370 = u_xlat5_;
    let _e372 = ((_e362.xy * _e367.xy) + _e370.xy);
    u_xlat17_.x = _e372.x;
    u_xlat17_.y = _e372.y;
    let _e377 = u_xlat5_;
    let _e382 = _f_buffer1_.f_cb1_[37];
    let _e387 = _f_buffer1_.f_cb1_[37];
    let _e389 = (_e382.zw + _e387.xy);
    u_xlat5_.x = _e389.x;
    u_xlat5_.y = _e389.y;
    let _e394 = u_xlat17_;
    let _e396 = u_xlat17_;
    let _e398 = u_xlat5_;
    let _e400 = (_e396.xy + _e398.xy);
    u_xlat17_.x = _e400.x;
    u_xlat17_.y = _e400.y;
    let _e405 = u_xlat17_;
    let _e410 = _f_buffer0_.f_cb0_[4];
    let _e415 = hscard_bias.values[5];
    let _e418 = textureSampleBias(f_t5_, samplerf_s5_, _e405.xy, (_e410.x + _e415.x));
    u_xlat6_ = _e418;
    let _e420 = u_xlat5_;
    let _e422 = u_xlat6_;
    u_xlat6_.w = (_e420.z * _e422.w);
    let _e426 = u_xlat0_;
    let _e430 = _f_buffer1_.f_cb1_[27];
    u_xlat17_.x = dot(_e426, _e430);
    let _e433 = u_xlat17_;
    u_xlat17_.x = min(_e433.x, 1f);
    let _e438 = u_xlat17_;
    let _e440 = u_xlat6_;
    u_xlat17_.x = (_e438.x * _e440.w);
    let _e443 = u_xlat17_;
    let _e445 = u_xlat6_;
    u_xlat5_ = (_e443.xxxx * _e445.xyxy);
    let _e448 = u_xlat5_;
    let _e452 = _f_buffer1_.f_cb1_[33];
    u_xlat5_ = (_e448 * _e452.zwxy);
    let _e455 = u_xlat17_;
    let _e457 = u_xlat5_;
    u_xlat5_ = (_e455.xxxx * _e457);
    let _e459 = u_xlatb4_;
    if _e459.y {
        local_1 = vec4<f32>(0f, 0f, 0f, 0f);
    } else {
        let _e466 = u_xlat5_;
        local_1 = _e466;
    }
    let _e468 = local_1;
    u_xlat5_ = _e468;
    let _e469 = u_xlat32_;
    let _e471 = u_xlat3_;
    let _e473 = u_xlat5_;
    let _e475 = (_e471.xy + _e473.xy);
    u_xlat32_.x = _e475.x;
    u_xlat32_.y = _e475.y;
    let _e480 = u_xlat3_;
    let _e482 = u_xlat32_;
    let _e488 = vs_TEXCOORD1_1;
    let _e490 = ((_e482.xy * vec2<f32>(0.001f, 0.001f)) + _e488.xy);
    u_xlat3_.x = _e490.x;
    u_xlat3_.y = _e490.y;
    let _e495 = u_xlat3_;
    let _e500 = _f_buffer0_.f_cb0_[4];
    let _e505 = hscard_bias.values[4];
    let _e508 = textureSampleBias(f_t4_, samplerf_s4_, _e495.xy, (_e500.x + _e505.x));
    u_xlat7_ = _e508;
    let _e510 = u_xlat0_;
    let _e514 = _f_buffer1_.f_cb1_[14];
    u_xlat3_.x = dot(_e510, _e514);
    let _e517 = u_xlat3_;
    u_xlat3_.x = min(_e517.x, 1f);
    let _e522 = u_xlat3_;
    let _e524 = u_xlat7_;
    u_xlat3_.x = (_e522.x * _e524.w);
    let _e527 = u_xlat5_;
    let _e529 = u_xlat3_;
    let _e531 = u_xlat7_;
    let _e533 = (_e529.xx * _e531.xy);
    u_xlat5_.x = _e533.x;
    u_xlat5_.y = _e533.y;
    let _e538 = u_xlat8_;
    let _e540 = u_xlat7_;
    let _e545 = _f_buffer1_.f_cb1_[20];
    let _e547 = (_e540.xy * _e545.zw);
    u_xlat8_.x = _e547.x;
    u_xlat8_.y = _e547.y;
    let _e552 = u_xlat8_;
    let _e554 = u_xlat3_;
    let _e556 = u_xlat8_;
    let _e558 = (_e554.xx * _e556.xy);
    u_xlat8_.x = _e558.x;
    u_xlat8_.y = _e558.y;
    let _e563 = u_xlat8_;
    let _e565 = u_xlatb4_;
    if _e565.z {
        local_2 = vec2<f32>(0f, 0f);
    } else {
        let _e570 = u_xlat8_;
        local_2 = _e570.xy;
    }
    let _e573 = local_2;
    u_xlat8_.x = _e573.x;
    u_xlat8_.y = _e573.y;
    let _e578 = u_xlat32_;
    let _e580 = u_xlat32_;
    let _e582 = u_xlat8_;
    let _e584 = (_e580.xy + _e582.xy);
    u_xlat32_.x = _e584.x;
    u_xlat32_.y = _e584.y;
    let _e589 = u_xlat32_;
    let _e591 = u_xlat32_;
    let _e597 = vs_TEXCOORD0_1;
    let _e599 = ((_e591.xy * vec2<f32>(0.001f, 0.001f)) + _e597.zw);
    u_xlat32_.x = _e599.x;
    u_xlat32_.y = _e599.y;
    let _e604 = u_xlat32_;
    let _e609 = _f_buffer0_.f_cb0_[4];
    let _e614 = hscard_bias.values[3];
    let _e617 = textureSampleBias(f_t3_, samplerf_s3_, _e604.xy, (_e609.x + _e614.x));
    u_xlat8_ = _e617;
    let _e618 = u_xlat32_;
    let _e623 = _f_buffer1_.f_cb1_[11];
    let _e629 = _f_buffer1_.f_cb1_[12];
    let _e631 = (-(_e623.xy) + _e629.zw);
    u_xlat32_.x = _e631.x;
    u_xlat32_.y = _e631.y;
    let _e636 = u_xlat8_;
    let _e638 = u_xlat32_;
    let _e641 = u_xlat8_;
    let _e643 = (-(_e638.xy) + _e641.xy);
    u_xlat8_.x = _e643.x;
    u_xlat8_.y = _e643.y;
    let _e648 = u_xlat32_;
    let _e650 = u_xlat8_;
    let _e655 = _f_buffer1_.f_cb1_[12];
    let _e658 = u_xlat32_;
    let _e660 = ((_e650.xy * _e655.xy) + _e658.xy);
    u_xlat32_.x = _e660.x;
    u_xlat32_.y = _e660.y;
    let _e665 = u_xlat8_;
    let _e670 = _f_buffer1_.f_cb1_[11];
    let _e675 = _f_buffer1_.f_cb1_[11];
    let _e677 = (_e670.zw + _e675.xy);
    u_xlat8_.x = _e677.x;
    u_xlat8_.y = _e677.y;
    let _e682 = u_xlat32_;
    let _e684 = u_xlat32_;
    let _e686 = u_xlat8_;
    let _e688 = (_e684.xy + _e686.xy);
    u_xlat32_.x = _e688.x;
    u_xlat32_.y = _e688.y;
    let _e693 = u_xlat32_;
    let _e698 = _f_buffer0_.f_cb0_[4];
    let _e703 = hscard_bias.values[2];
    let _e706 = textureSampleBias(f_t2_, samplerf_s2_, _e693.xy, (_e698.x + _e703.x));
    u_xlat9_ = _e706;
    let _e708 = u_xlat8_;
    let _e710 = u_xlat9_;
    u_xlat9_.w = (_e708.z * _e710.w);
    let _e714 = u_xlat0_;
    let _e718 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = dot(_e714, _e718);
    let _e721 = u_xlat0_;
    u_xlat0_.x = min(_e721.x, 1f);
    let _e726 = u_xlat0_;
    let _e728 = u_xlat9_;
    u_xlat0_.x = (_e726.x * _e728.w);
    let _e731 = u_xlat15_;
    let _e733 = u_xlat9_;
    let _e738 = _f_buffer1_.f_cb1_[8];
    let _e740 = (_e733.xy * _e738.xy);
    u_xlat15_.x = _e740.x;
    u_xlat15_.y = _e740.y;
    let _e745 = u_xlat15_;
    let _e747 = u_xlat0_;
    let _e749 = u_xlat15_;
    let _e751 = (_e747.xx * _e749.xy);
    u_xlat15_.x = _e751.x;
    u_xlat15_.y = _e751.y;
    let _e756 = u_xlat32_;
    let _e758 = u_xlat5_;
    let _e763 = _f_buffer1_.f_cb1_[20];
    let _e765 = (_e758.xy * _e763.xy);
    u_xlat32_.x = _e765.x;
    u_xlat32_.y = _e765.y;
    let _e770 = u_xlat32_;
    let _e772 = u_xlat3_;
    let _e774 = u_xlat32_;
    let _e776 = (_e772.xx * _e774.xy);
    u_xlat32_.x = _e776.x;
    u_xlat32_.y = _e776.y;
    let _e781 = u_xlat15_;
    let _e783 = u_xlatb4_;
    if _e783.w {
        local_3 = vec2<f32>(0f, 0f);
    } else {
        let _e788 = u_xlat15_;
        local_3 = _e788.xy;
    }
    let _e791 = local_3;
    u_xlat15_.x = _e791.x;
    u_xlat15_.y = _e791.y;
    let _e796 = u_xlat32_;
    let _e798 = u_xlatb4_;
    if _e798.z {
        local_4 = vec2<f32>(0f, 0f);
    } else {
        let _e803 = u_xlat32_;
        local_4 = _e803.xy;
    }
    let _e806 = local_4;
    u_xlat32_.x = _e806.x;
    u_xlat32_.y = _e806.y;
    let _e811 = u_xlat15_;
    let _e813 = u_xlat15_;
    let _e815 = u_xlat32_;
    let _e817 = (_e813.xy + _e815.xy);
    u_xlat15_.x = _e817.x;
    u_xlat15_.y = _e817.y;
    let _e822 = u_xlat15_;
    let _e824 = u_xlat5_;
    let _e826 = u_xlat15_;
    let _e828 = (_e824.zw + _e826.xy);
    u_xlat15_.x = _e828.x;
    u_xlat15_.y = _e828.y;
    let _e833 = u_xlat15_;
    let _e835 = u_xlat3_;
    let _e837 = u_xlat15_;
    let _e839 = (_e835.zw + _e837.xy);
    u_xlat15_.x = _e839.x;
    u_xlat15_.y = _e839.y;
    let _e844 = u_xlat15_;
    let _e846 = u_xlat15_;
    let _e852 = vs_TEXCOORD0_1;
    let _e854 = ((_e846.xy * vec2<f32>(0.001f, 0.001f)) + _e852.xy);
    u_xlat15_.x = _e854.x;
    u_xlat15_.y = _e854.y;
    let _e859 = u_xlat15_;
    let _e864 = _f_buffer0_.f_cb0_[4];
    let _e869 = hscard_bias.values[0];
    let _e872 = textureSampleBias(f_t0_, samplerf_s0_, _e859.xy, (_e864.x + _e869.x));
    u_xlat5_ = _e872;
    let _e878 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (0f < _e878.z);
    let _e881 = u_xlat5_;
    u_xlat30_ = dot(_e881, vec4<f32>(0.1f, 0.1f, 0.1f, 0.1f));
    let _e889 = u_xlatb15_;
    if _e889.x {
        let _e891 = u_xlat30_;
        local_5 = _e891;
    } else {
        local_5 = 0f;
    }
    let _e895 = local_5;
    u_xlat8_.x = _e895;
    let _e900 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (_e900.z == 1f);
    let _e904 = u_xlatb15_;
    if _e904.x {
        {
            let _e906 = u_xlat9_;
            let _e907 = u_xlat0_;
            let _e910 = u_xlat9_;
            u_xlat10_ = ((_e906 * _e907.xxxx) + -(_e910));
            let _e916 = _f_buffer1_.f_cb1_[67];
            let _e918 = u_xlat10_;
            let _e920 = u_xlat9_;
            u_xlat10_ = ((_e916.wwww * _e918) + _e920);
            u_xlat8_.y = 1f;
            let _e924 = u_xlat10_;
            let _e928 = _f_buffer1_.f_cb1_[3];
            let _e930 = u_xlat8_;
            SV_Target0_ = ((_e924 * _e928) + _e930.xxxy);
            return;
        }
    }
    let _e937 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (_e937.z == 2f);
    let _e941 = u_xlatb15_;
    if _e941.x {
        {
            let _e943 = u_xlat7_;
            let _e944 = u_xlat3_;
            let _e947 = u_xlat7_;
            u_xlat10_ = ((_e943 * _e944.xxxx) + -(_e947));
            let _e953 = _f_buffer1_.f_cb1_[67];
            let _e955 = u_xlat10_;
            let _e957 = u_xlat7_;
            u_xlat10_ = ((_e953.wwww * _e955) + _e957);
            u_xlat8_.z = 1f;
            let _e961 = u_xlat10_;
            let _e965 = _f_buffer1_.f_cb1_[15];
            let _e967 = u_xlat8_;
            SV_Target0_ = ((_e961 * _e965) + _e967.xxxz);
            return;
        }
    }
    let _e974 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (_e974.z == 3f);
    let _e978 = u_xlatb15_;
    if _e978.x {
        {
            let _e980 = u_xlat6_;
            let _e981 = u_xlat17_;
            let _e984 = u_xlat6_;
            u_xlat10_ = ((_e980 * _e981.xxxx) + -(_e984));
            let _e990 = _f_buffer1_.f_cb1_[67];
            let _e992 = u_xlat10_;
            let _e994 = u_xlat6_;
            u_xlat10_ = ((_e990.wwww * _e992) + _e994);
            u_xlat8_.w = 1f;
            let _e998 = u_xlat10_;
            let _e1002 = _f_buffer1_.f_cb1_[28];
            let _e1004 = u_xlat8_;
            SV_Target0_ = ((_e998 * _e1002) + _e1004.xxxw);
            return;
        }
    }
    let _e1011 = _f_buffer1_.f_cb1_[67];
    u_xlatb15_.x = (_e1011.z == 4f);
    let _e1015 = u_xlatb15_;
    if _e1015.x {
        {
            let _e1017 = u_xlat1_;
            let _e1018 = u_xlat2_;
            let _e1021 = u_xlat1_;
            u_xlat10_ = ((_e1017 * vec4(_e1018)) + -(_e1021));
            let _e1027 = _f_buffer1_.f_cb1_[67];
            let _e1029 = u_xlat10_;
            let _e1031 = u_xlat1_;
            u_xlat10_ = ((_e1027.wwww * _e1029) + _e1031);
            u_xlat8_.w = 1f;
            let _e1035 = u_xlat10_;
            let _e1039 = _f_buffer1_.f_cb1_[41];
            let _e1041 = u_xlat8_;
            SV_Target0_ = ((_e1035 * _e1039) + _e1041.xxxw);
            return;
        }
    }
    let _e1047 = _f_buffer1_.f_cb1_[3];
    let _e1052 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = (_e1047.wwww * _e1052);
    let _e1054 = u_xlat8_;
    let _e1055 = u_xlat9_;
    u_xlat10_ = (_e1054 * _e1055);
    let _e1057 = u_xlatb15_;
    let _e1067 = _f_buffer1_.f_cb1_[7];
    let _e1070 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1067.wzww).xy;
    u_xlatb15_.x = _e1070.x;
    u_xlatb15_.y = _e1070.y;
    let _e1075 = u_xlat10_;
    let _e1080 = _f_buffer1_.f_cb1_[7];
    u_xlat45_ = (_e1075.w * _e1080.w);
    let _e1083 = u_xlat45_;
    u_xlat45_ = clamp(_e1083, 0f, 1f);
    let _e1087 = u_xlat9_;
    let _e1088 = u_xlat8_;
    let _e1090 = u_xlat5_;
    u_xlat11_ = ((_e1087 * _e1088) + -(_e1090));
    let _e1093 = u_xlat45_;
    let _e1095 = u_xlat11_;
    let _e1097 = u_xlat5_;
    u_xlat11_ = ((vec4(_e1093) * _e1095) + _e1097);
    let _e1099 = u_xlatb15_;
    if _e1099.x {
        let _e1101 = u_xlat11_;
        local_6 = _e1101;
    } else {
        let _e1102 = u_xlat5_;
        local_6 = _e1102;
    }
    let _e1104 = local_6;
    u_xlat11_ = _e1104;
    let _e1105 = u_xlat10_;
    let _e1106 = u_xlat11_;
    u_xlat12_ = (_e1105 * _e1106);
    let _e1108 = u_xlat12_;
    let _e1112 = _f_buffer1_.f_cb1_[7];
    let _e1115 = u_xlat11_;
    u_xlat11_ = ((_e1108 * _e1112.yyyy) + _e1115);
    let _e1117 = u_xlat10_;
    let _e1121 = _f_buffer1_.f_cb1_[7];
    let _e1124 = u_xlat11_;
    u_xlat11_ = ((_e1117 * _e1121.xxxx) + _e1124);
    let _e1126 = u_xlat11_;
    let _e1127 = u_xlat11_;
    u_xlat12_ = (_e1126 + _e1127);
    let _e1129 = u_xlat10_;
    let _e1130 = u_xlat12_;
    u_xlat13_ = (_e1129 * _e1130);
    let _e1132 = u_xlat11_;
    u_xlat14_ = (-(_e1132) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1140 = u_xlat14_;
    let _e1141 = u_xlat14_;
    u_xlat14_ = (_e1140 + _e1141);
    let _e1143 = u_xlat9_;
    let _e1145 = u_xlat8_;
    u_xlat8_ = ((-(_e1143) * _e1145) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1153 = u_xlat14_;
    let _e1155 = u_xlat8_;
    u_xlat8_ = ((-(_e1153) * _e1155) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1163 = u_xlat12_;
    u_xlat9_ = floor(_e1163);
    let _e1165 = u_xlat9_;
    u_xlat9_ = min(_e1165, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1172 = u_xlat12_;
    let _e1174 = u_xlat10_;
    let _e1176 = u_xlat8_;
    u_xlat8_ = ((-(_e1172) * _e1174) + _e1176);
    let _e1178 = u_xlat9_;
    let _e1179 = u_xlat8_;
    let _e1181 = u_xlat13_;
    u_xlat8_ = ((_e1178 * _e1179) + _e1181);
    let _e1183 = u_xlat5_;
    let _e1185 = u_xlat8_;
    u_xlat8_ = (-(_e1183) + _e1185);
    let _e1190 = _f_buffer1_.f_cb1_[7];
    let _e1192 = u_xlat8_;
    let _e1194 = u_xlat5_;
    u_xlat8_ = ((_e1190.zzzz * _e1192) + _e1194);
    let _e1196 = u_xlatb15_;
    if _e1196.y {
        let _e1198 = u_xlat8_;
        local_7 = _e1198;
    } else {
        let _e1199 = u_xlat11_;
        local_7 = _e1199;
    }
    let _e1201 = local_7;
    u_xlat8_ = _e1201;
    let _e1202 = u_xlat5_;
    let _e1204 = u_xlat8_;
    u_xlat8_ = (-(_e1202) + _e1204);
    let _e1206 = u_xlat0_;
    let _e1208 = u_xlat8_;
    let _e1210 = u_xlat5_;
    u_xlat0_ = ((_e1206.xxxx * _e1208) + _e1210);
    let _e1212 = u_xlatb4_;
    if _e1212.w {
        let _e1214 = u_xlat5_;
        local_8 = _e1214;
    } else {
        let _e1215 = u_xlat0_;
        local_8 = _e1215;
    }
    let _e1217 = local_8;
    u_xlat0_ = _e1217;
    let _e1221 = _f_buffer1_.f_cb1_[15];
    let _e1226 = _f_buffer1_.f_cb1_[15];
    u_xlat5_ = (_e1221.wwww * _e1226);
    let _e1228 = u_xlat5_;
    let _e1229 = u_xlat7_;
    u_xlat8_ = (_e1228 * _e1229);
    let _e1231 = u_xlatb32_;
    let _e1241 = _f_buffer1_.f_cb1_[19];
    let _e1244 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1241.wzwz).xy;
    u_xlatb32_.x = _e1244.x;
    u_xlatb32_.y = _e1244.y;
    let _e1249 = u_xlat8_;
    let _e1254 = _f_buffer1_.f_cb1_[19];
    u_xlat18_ = (_e1249.w * _e1254.w);
    let _e1257 = u_xlat18_;
    u_xlat18_ = clamp(_e1257, 0f, 1f);
    let _e1261 = u_xlat7_;
    let _e1262 = u_xlat5_;
    let _e1264 = u_xlat0_;
    u_xlat9_ = ((_e1261 * _e1262) + -(_e1264));
    let _e1267 = u_xlat18_;
    let _e1269 = u_xlat9_;
    let _e1271 = u_xlat0_;
    u_xlat9_ = ((vec4(_e1267) * _e1269) + _e1271);
    let _e1273 = u_xlatb32_;
    if _e1273.x {
        let _e1275 = u_xlat9_;
        local_9 = _e1275;
    } else {
        let _e1276 = u_xlat0_;
        local_9 = _e1276;
    }
    let _e1278 = local_9;
    u_xlat9_ = _e1278;
    let _e1279 = u_xlat8_;
    let _e1280 = u_xlat9_;
    u_xlat10_ = (_e1279 * _e1280);
    let _e1282 = u_xlat10_;
    let _e1286 = _f_buffer1_.f_cb1_[19];
    let _e1289 = u_xlat9_;
    u_xlat9_ = ((_e1282 * _e1286.yyyy) + _e1289);
    let _e1291 = u_xlat8_;
    let _e1295 = _f_buffer1_.f_cb1_[19];
    let _e1298 = u_xlat9_;
    u_xlat9_ = ((_e1291 * _e1295.xxxx) + _e1298);
    let _e1300 = u_xlat9_;
    let _e1301 = u_xlat9_;
    u_xlat10_ = (_e1300 + _e1301);
    let _e1303 = u_xlat8_;
    let _e1304 = u_xlat10_;
    u_xlat11_ = (_e1303 * _e1304);
    let _e1306 = u_xlat9_;
    u_xlat12_ = (-(_e1306) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1314 = u_xlat12_;
    let _e1315 = u_xlat12_;
    u_xlat12_ = (_e1314 + _e1315);
    let _e1317 = u_xlat7_;
    let _e1319 = u_xlat5_;
    u_xlat5_ = ((-(_e1317) * _e1319) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1327 = u_xlat12_;
    let _e1329 = u_xlat5_;
    u_xlat5_ = ((-(_e1327) * _e1329) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1337 = u_xlat10_;
    u_xlat7_ = floor(_e1337);
    let _e1339 = u_xlat7_;
    u_xlat7_ = min(_e1339, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1346 = u_xlat10_;
    let _e1348 = u_xlat8_;
    let _e1350 = u_xlat5_;
    u_xlat5_ = ((-(_e1346) * _e1348) + _e1350);
    let _e1352 = u_xlat7_;
    let _e1353 = u_xlat5_;
    let _e1355 = u_xlat11_;
    u_xlat5_ = ((_e1352 * _e1353) + _e1355);
    let _e1357 = u_xlat0_;
    let _e1359 = u_xlat5_;
    u_xlat5_ = (-(_e1357) + _e1359);
    let _e1364 = _f_buffer1_.f_cb1_[19];
    let _e1366 = u_xlat5_;
    let _e1368 = u_xlat0_;
    u_xlat5_ = ((_e1364.zzzz * _e1366) + _e1368);
    let _e1370 = u_xlatb32_;
    if _e1370.y {
        let _e1372 = u_xlat5_;
        local_10 = _e1372;
    } else {
        let _e1373 = u_xlat9_;
        local_10 = _e1373;
    }
    let _e1375 = local_10;
    u_xlat5_ = _e1375;
    let _e1376 = u_xlat0_;
    let _e1378 = u_xlat5_;
    u_xlat5_ = (-(_e1376) + _e1378);
    let _e1380 = u_xlat3_;
    let _e1382 = u_xlat5_;
    let _e1384 = u_xlat0_;
    u_xlat3_ = ((_e1380.xxxx * _e1382) + _e1384);
    let _e1386 = u_xlatb4_;
    if _e1386.z {
        let _e1388 = u_xlat0_;
        local_11 = _e1388;
    } else {
        let _e1389 = u_xlat3_;
        local_11 = _e1389;
    }
    let _e1391 = local_11;
    u_xlat0_ = _e1391;
    let _e1395 = _f_buffer1_.f_cb1_[28];
    let _e1400 = _f_buffer1_.f_cb1_[28];
    u_xlat3_ = (_e1395.wwww * _e1400);
    let _e1402 = u_xlat3_;
    let _e1403 = u_xlat6_;
    u_xlat5_ = (_e1402 * _e1403);
    let _e1405 = u_xlatb32_;
    let _e1415 = _f_buffer1_.f_cb1_[32];
    let _e1418 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1415.wzwz).xy;
    u_xlatb32_.x = _e1418.x;
    u_xlatb32_.y = _e1418.y;
    let _e1423 = u_xlat5_;
    let _e1428 = _f_buffer1_.f_cb1_[32];
    u_xlat34_ = (_e1423.w * _e1428.w);
    let _e1431 = u_xlat34_;
    u_xlat34_ = clamp(_e1431, 0f, 1f);
    let _e1435 = u_xlat6_;
    let _e1436 = u_xlat3_;
    let _e1438 = u_xlat0_;
    u_xlat7_ = ((_e1435 * _e1436) + -(_e1438));
    let _e1441 = u_xlat34_;
    let _e1443 = u_xlat7_;
    let _e1445 = u_xlat0_;
    u_xlat7_ = ((vec4(_e1441) * _e1443) + _e1445);
    let _e1447 = u_xlatb32_;
    if _e1447.x {
        let _e1449 = u_xlat7_;
        local_12 = _e1449;
    } else {
        let _e1450 = u_xlat0_;
        local_12 = _e1450;
    }
    let _e1452 = local_12;
    u_xlat7_ = _e1452;
    let _e1453 = u_xlat5_;
    let _e1454 = u_xlat7_;
    u_xlat8_ = (_e1453 * _e1454);
    let _e1456 = u_xlat8_;
    let _e1460 = _f_buffer1_.f_cb1_[32];
    let _e1463 = u_xlat7_;
    u_xlat7_ = ((_e1456 * _e1460.yyyy) + _e1463);
    let _e1465 = u_xlat5_;
    let _e1469 = _f_buffer1_.f_cb1_[32];
    let _e1472 = u_xlat7_;
    u_xlat7_ = ((_e1465 * _e1469.xxxx) + _e1472);
    let _e1474 = u_xlat7_;
    let _e1475 = u_xlat7_;
    u_xlat8_ = (_e1474 + _e1475);
    let _e1477 = u_xlat5_;
    let _e1478 = u_xlat8_;
    u_xlat9_ = (_e1477 * _e1478);
    let _e1480 = u_xlat7_;
    u_xlat10_ = (-(_e1480) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1488 = u_xlat10_;
    let _e1489 = u_xlat10_;
    u_xlat10_ = (_e1488 + _e1489);
    let _e1491 = u_xlat6_;
    let _e1493 = u_xlat3_;
    u_xlat3_ = ((-(_e1491) * _e1493) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1501 = u_xlat10_;
    let _e1503 = u_xlat3_;
    u_xlat3_ = ((-(_e1501) * _e1503) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1511 = u_xlat8_;
    u_xlat6_ = floor(_e1511);
    let _e1513 = u_xlat6_;
    u_xlat6_ = min(_e1513, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1520 = u_xlat8_;
    let _e1522 = u_xlat5_;
    let _e1524 = u_xlat3_;
    u_xlat3_ = ((-(_e1520) * _e1522) + _e1524);
    let _e1526 = u_xlat6_;
    let _e1527 = u_xlat3_;
    let _e1529 = u_xlat9_;
    u_xlat3_ = ((_e1526 * _e1527) + _e1529);
    let _e1531 = u_xlat0_;
    let _e1533 = u_xlat3_;
    u_xlat3_ = (-(_e1531) + _e1533);
    let _e1538 = _f_buffer1_.f_cb1_[32];
    let _e1540 = u_xlat3_;
    let _e1542 = u_xlat0_;
    u_xlat3_ = ((_e1538.zzzz * _e1540) + _e1542);
    let _e1544 = u_xlatb32_;
    if _e1544.y {
        let _e1546 = u_xlat3_;
        local_13 = _e1546;
    } else {
        let _e1547 = u_xlat7_;
        local_13 = _e1547;
    }
    let _e1549 = local_13;
    u_xlat3_ = _e1549;
    let _e1550 = u_xlat0_;
    let _e1552 = u_xlat3_;
    u_xlat3_ = (-(_e1550) + _e1552);
    let _e1554 = u_xlat17_;
    let _e1556 = u_xlat3_;
    let _e1558 = u_xlat0_;
    u_xlat3_ = ((_e1554.xxxx * _e1556) + _e1558);
    let _e1560 = u_xlatb4_;
    if _e1560.y {
        let _e1562 = u_xlat0_;
        local_14 = _e1562;
    } else {
        let _e1563 = u_xlat3_;
        local_14 = _e1563;
    }
    let _e1565 = local_14;
    u_xlat0_ = _e1565;
    let _e1569 = _f_buffer1_.f_cb1_[41];
    let _e1574 = _f_buffer1_.f_cb1_[41];
    u_xlat3_ = (_e1569.wwww * _e1574);
    let _e1576 = u_xlat1_;
    let _e1577 = u_xlat3_;
    u_xlat5_ = (_e1576 * _e1577);
    let _e1579 = u_xlatb17_;
    let _e1589 = _f_buffer1_.f_cb1_[45];
    let _e1592 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1589.wzww).xy;
    u_xlatb17_.x = _e1592.x;
    u_xlatb17_.y = _e1592.y;
    let _e1597 = u_xlat5_;
    let _e1602 = _f_buffer1_.f_cb1_[45];
    u_xlat47_ = (_e1597.w * _e1602.w);
    let _e1605 = u_xlat47_;
    u_xlat47_ = clamp(_e1605, 0f, 1f);
    let _e1609 = u_xlat1_;
    let _e1610 = u_xlat3_;
    let _e1612 = u_xlat0_;
    u_xlat6_ = ((_e1609 * _e1610) + -(_e1612));
    let _e1615 = u_xlat47_;
    let _e1617 = u_xlat6_;
    let _e1619 = u_xlat0_;
    u_xlat6_ = ((vec4(_e1615) * _e1617) + _e1619);
    let _e1621 = u_xlatb17_;
    if _e1621.x {
        let _e1623 = u_xlat6_;
        local_15 = _e1623;
    } else {
        let _e1624 = u_xlat0_;
        local_15 = _e1624;
    }
    let _e1626 = local_15;
    u_xlat6_ = _e1626;
    let _e1627 = u_xlat5_;
    let _e1628 = u_xlat6_;
    u_xlat7_ = (_e1627 * _e1628);
    let _e1630 = u_xlat7_;
    let _e1634 = _f_buffer1_.f_cb1_[45];
    let _e1637 = u_xlat6_;
    u_xlat6_ = ((_e1630 * _e1634.yyyy) + _e1637);
    let _e1639 = u_xlat5_;
    let _e1643 = _f_buffer1_.f_cb1_[45];
    let _e1646 = u_xlat6_;
    u_xlat6_ = ((_e1639 * _e1643.xxxx) + _e1646);
    let _e1648 = u_xlat6_;
    let _e1649 = u_xlat6_;
    u_xlat7_ = (_e1648 + _e1649);
    let _e1651 = u_xlat5_;
    let _e1652 = u_xlat7_;
    u_xlat8_ = (_e1651 * _e1652);
    let _e1654 = u_xlat6_;
    u_xlat9_ = (-(_e1654) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1662 = u_xlat9_;
    let _e1663 = u_xlat9_;
    u_xlat9_ = (_e1662 + _e1663);
    let _e1665 = u_xlat1_;
    let _e1667 = u_xlat3_;
    u_xlat1_ = ((-(_e1665) * _e1667) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1675 = u_xlat9_;
    let _e1677 = u_xlat1_;
    u_xlat1_ = ((-(_e1675) * _e1677) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1685 = u_xlat7_;
    u_xlat3_ = floor(_e1685);
    let _e1687 = u_xlat3_;
    u_xlat3_ = min(_e1687, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1694 = u_xlat7_;
    let _e1696 = u_xlat5_;
    let _e1698 = u_xlat1_;
    u_xlat1_ = ((-(_e1694) * _e1696) + _e1698);
    let _e1700 = u_xlat3_;
    let _e1701 = u_xlat1_;
    let _e1703 = u_xlat8_;
    u_xlat1_ = ((_e1700 * _e1701) + _e1703);
    let _e1705 = u_xlat0_;
    let _e1707 = u_xlat1_;
    u_xlat1_ = (-(_e1705) + _e1707);
    let _e1712 = _f_buffer1_.f_cb1_[45];
    let _e1714 = u_xlat1_;
    let _e1716 = u_xlat0_;
    u_xlat1_ = ((_e1712.zzzz * _e1714) + _e1716);
    let _e1718 = u_xlatb17_;
    if _e1718.y {
        let _e1720 = u_xlat1_;
        local_16 = _e1720;
    } else {
        let _e1721 = u_xlat6_;
        local_16 = _e1721;
    }
    let _e1723 = local_16;
    u_xlat1_ = _e1723;
    let _e1724 = u_xlat0_;
    let _e1726 = u_xlat1_;
    u_xlat1_ = (-(_e1724) + _e1726);
    let _e1728 = u_xlat2_;
    let _e1730 = u_xlat1_;
    let _e1732 = u_xlat0_;
    u_xlat1_ = ((vec4(_e1728) * _e1730) + _e1732);
    let _e1734 = u_xlatb4_;
    if _e1734.x {
        let _e1736 = u_xlat0_;
        local_17 = _e1736;
    } else {
        let _e1737 = u_xlat1_;
        local_17 = _e1737;
    }
    let _e1739 = local_17;
    u_xlat0_ = _e1739;
    let _e1740 = u_xlat0_;
    u_xlat0_ = clamp(_e1740, vec4(0f), vec4(1f));
    let _e1746 = u_xlat0_;
    let _e1747 = vs_COLOR0_1;
    u_xlat1_ = (_e1746 * _e1747);
    let _e1749 = u_xlat0_;
    let _e1750 = u_xlat1_;
    SV_Target0_ = min(_e1749, _e1750);
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
