struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 41>,
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
var<private> vs_TEXCOORD2_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlatb8_: vec2<bool> = vec2(false);
    var u_xlat9_: vec4<f32> = vec4(0f);
    var u_xlat10_: vec4<f32> = vec4(0f);
    var u_xlat11_: vec4<f32> = vec4(0f);
    var u_xlat12_: vec4<f32> = vec4(0f);
    var u_xlatb13_: bool = false;
    var u_xlat14_: vec2<f32> = vec2(0f);
    var u_xlatb14_: vec2<bool> = vec2(false);
    var u_xlat27_: vec2<f32> = vec2(0f);
    var u_xlatb27_: vec2<bool> = vec2(false);
    var u_xlat29_: vec2<f32> = vec2(0f);
    var u_xlat40_: f32 = 0f;
    var u_xlatb40_: bool = false;
    var local: f32;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;
    var local_6: vec4<f32>;

    let _e121 = _f_buffer1_.f_cb1_[40];
    u_xlatb0_ = (_e121.y == 10f);
    let _e125 = u_xlatb0_;
    if _e125 {
        {
            let _e126 = vs_COLOR0_1;
            SV_Target0_ = _e126;
            return;
        }
    }
    let _e127 = vs_TEXCOORD0_1;
    let _e132 = _f_buffer0_.f_cb0_[4];
    let _e137 = hscard_bias.values[1];
    let _e140 = textureSampleBias(f_t1_, samplerf_s1_, _e127.xy, (_e132.x + _e137.x));
    u_xlat0_ = _e140;
    let _e141 = vs_TEXCOORD1_1;
    let _e146 = _f_buffer0_.f_cb0_[4];
    let _e151 = hscard_bias.values[7];
    let _e154 = textureSampleBias(f_t7_, samplerf_s7_, _e141.zw, (_e146.x + _e151.x));
    u_xlat1_ = _e154;
    let _e155 = u_xlat2_;
    let _e160 = _f_buffer1_.f_cb1_[35];
    let _e166 = _f_buffer1_.f_cb1_[36];
    let _e168 = (-(_e160.xy) + _e166.zw);
    u_xlat2_.x = _e168.x;
    u_xlat2_.y = _e168.y;
    let _e173 = u_xlat1_;
    let _e175 = u_xlat1_;
    let _e177 = u_xlat2_;
    let _e180 = (_e175.xy + -(_e177.xy));
    u_xlat1_.x = _e180.x;
    u_xlat1_.y = _e180.y;
    let _e185 = u_xlat1_;
    let _e187 = u_xlat1_;
    let _e192 = _f_buffer1_.f_cb1_[36];
    let _e195 = u_xlat2_;
    let _e197 = ((_e187.xy * _e192.xy) + _e195.xy);
    u_xlat1_.x = _e197.x;
    u_xlat1_.y = _e197.y;
    let _e202 = u_xlat2_;
    let _e207 = _f_buffer1_.f_cb1_[35];
    let _e209 = vs_TEXCOORD2_1;
    let _e215 = _f_buffer1_.f_cb1_[35];
    let _e217 = ((_e207.zw * _e209.xx) + _e215.xy);
    u_xlat2_.x = _e217.x;
    u_xlat2_.y = _e217.y;
    let _e222 = u_xlat1_;
    let _e224 = u_xlat1_;
    let _e226 = u_xlat2_;
    let _e228 = (_e224.xy + _e226.xy);
    u_xlat1_.x = _e228.x;
    u_xlat1_.y = _e228.y;
    let _e233 = u_xlat1_;
    let _e238 = _f_buffer0_.f_cb0_[4];
    let _e243 = hscard_bias.values[6];
    let _e246 = textureSampleBias(f_t6_, samplerf_s6_, _e233.xy, (_e238.x + _e243.x));
    u_xlat2_ = _e246;
    let _e248 = u_xlat1_;
    let _e250 = u_xlat2_;
    u_xlat2_.w = (_e248.z * _e250.w);
    let _e254 = u_xlat0_;
    let _e258 = _f_buffer1_.f_cb1_[28];
    u_xlat1_.x = dot(_e254, _e258);
    let _e261 = u_xlat1_;
    u_xlat1_.x = min(_e261.x, 1f);
    let _e266 = u_xlat1_;
    let _e268 = u_xlat2_;
    u_xlat1_.x = (_e266.x * _e268.w);
    let _e271 = u_xlat2_;
    let _e276 = _f_buffer1_.f_cb1_[34];
    u_xlat3_ = (_e271.xyxy * _e276);
    let _e278 = u_xlat1_;
    let _e280 = u_xlat3_;
    u_xlat4_ = (_e278.xxxx * _e280);
    let _e282 = u_xlat14_;
    let _e284 = u_xlat3_;
    let _e286 = u_xlat1_;
    let _e289 = vs_TEXCOORD1_1;
    let _e291 = ((_e284.zw * _e286.xx) + _e289.xy);
    u_xlat14_.x = _e291.x;
    u_xlat14_.y = _e291.y;
    let _e296 = u_xlat14_;
    let _e301 = _f_buffer0_.f_cb0_[4];
    let _e306 = hscard_bias.values[5];
    let _e309 = textureSampleBias(f_t5_, samplerf_s5_, _e296.xy, (_e301.x + _e306.x));
    u_xlat3_ = _e309;
    let _e310 = u_xlat14_;
    let _e315 = _f_buffer1_.f_cb1_[26];
    let _e321 = _f_buffer1_.f_cb1_[27];
    let _e323 = (-(_e315.xy) + _e321.zw);
    u_xlat14_.x = _e323.x;
    u_xlat14_.y = _e323.y;
    let _e328 = u_xlat3_;
    let _e330 = u_xlat14_;
    let _e333 = u_xlat3_;
    let _e335 = (-(_e330.xy) + _e333.xy);
    u_xlat3_.x = _e335.x;
    u_xlat3_.y = _e335.y;
    let _e340 = u_xlat14_;
    let _e342 = u_xlat3_;
    let _e347 = _f_buffer1_.f_cb1_[27];
    let _e350 = u_xlat14_;
    let _e352 = ((_e342.xy * _e347.xy) + _e350.xy);
    u_xlat14_.x = _e352.x;
    u_xlat14_.y = _e352.y;
    let _e357 = u_xlat3_;
    let _e362 = _f_buffer1_.f_cb1_[26];
    let _e364 = vs_TEXCOORD2_1;
    let _e370 = _f_buffer1_.f_cb1_[26];
    let _e372 = ((_e362.zw * _e364.xx) + _e370.xy);
    u_xlat3_.x = _e372.x;
    u_xlat3_.y = _e372.y;
    let _e377 = u_xlat14_;
    let _e379 = u_xlat14_;
    let _e381 = u_xlat3_;
    let _e383 = (_e379.xy + _e381.xy);
    u_xlat14_.x = _e383.x;
    u_xlat14_.y = _e383.y;
    let _e388 = u_xlat14_;
    let _e393 = _f_buffer0_.f_cb0_[4];
    let _e398 = hscard_bias.values[4];
    let _e401 = textureSampleBias(f_t4_, samplerf_s4_, _e388.xy, (_e393.x + _e398.x));
    u_xlat5_ = _e401;
    let _e403 = u_xlat3_;
    let _e405 = u_xlat5_;
    u_xlat5_.w = (_e403.z * _e405.w);
    let _e409 = u_xlat0_;
    let _e413 = _f_buffer1_.f_cb1_[19];
    u_xlat14_.x = dot(_e409, _e413);
    let _e416 = u_xlat14_;
    u_xlat14_.x = min(_e416.x, 1f);
    let _e421 = u_xlat14_;
    let _e423 = u_xlat5_;
    u_xlat14_.x = (_e421.x * _e423.w);
    let _e426 = u_xlat5_;
    let _e431 = _f_buffer1_.f_cb1_[25];
    u_xlat3_ = (_e426.xyxy * _e431);
    let _e433 = u_xlat3_;
    let _e434 = u_xlat14_;
    let _e437 = u_xlat4_;
    u_xlat3_ = ((_e433 * _e434.xxxx) + _e437);
    let _e439 = u_xlat27_;
    let _e441 = u_xlat3_;
    let _e443 = vs_TEXCOORD0_1;
    let _e445 = (_e441.zw + _e443.zw);
    u_xlat27_.x = _e445.x;
    u_xlat27_.y = _e445.y;
    let _e450 = u_xlat27_;
    let _e455 = _f_buffer0_.f_cb0_[4];
    let _e460 = hscard_bias.values[3];
    let _e463 = textureSampleBias(f_t3_, samplerf_s3_, _e450.xy, (_e455.x + _e460.x));
    u_xlat4_ = _e463;
    let _e464 = u_xlat27_;
    let _e469 = _f_buffer1_.f_cb1_[17];
    let _e475 = _f_buffer1_.f_cb1_[18];
    let _e477 = (-(_e469.xy) + _e475.zw);
    u_xlat27_.x = _e477.x;
    u_xlat27_.y = _e477.y;
    let _e482 = u_xlat29_;
    let _e484 = u_xlat27_;
    let _e487 = u_xlat4_;
    let _e489 = (-(_e484.xy) + _e487.xy);
    u_xlat29_.x = _e489.x;
    u_xlat29_.y = _e489.y;
    let _e494 = u_xlat27_;
    let _e496 = u_xlat29_;
    let _e501 = _f_buffer1_.f_cb1_[18];
    let _e504 = u_xlat27_;
    let _e506 = ((_e496.xy * _e501.xy) + _e504.xy);
    u_xlat27_.x = _e506.x;
    u_xlat27_.y = _e506.y;
    let _e511 = u_xlat29_;
    let _e516 = _f_buffer1_.f_cb1_[17];
    let _e518 = vs_TEXCOORD2_1;
    let _e524 = _f_buffer1_.f_cb1_[17];
    let _e526 = ((_e516.zw * _e518.xx) + _e524.xy);
    u_xlat29_.x = _e526.x;
    u_xlat29_.y = _e526.y;
    let _e531 = u_xlat27_;
    let _e533 = u_xlat27_;
    let _e535 = u_xlat29_;
    let _e537 = (_e533.xy + _e535.xy);
    u_xlat27_.x = _e537.x;
    u_xlat27_.y = _e537.y;
    let _e542 = u_xlat27_;
    let _e547 = _f_buffer0_.f_cb0_[4];
    let _e552 = hscard_bias.values[2];
    let _e555 = textureSampleBias(f_t2_, samplerf_s2_, _e542.xy, (_e547.x + _e552.x));
    u_xlat6_ = _e555;
    let _e557 = u_xlat4_;
    let _e559 = u_xlat6_;
    u_xlat6_.w = (_e557.z * _e559.w);
    let _e563 = u_xlat0_;
    let _e567 = _f_buffer1_.f_cb1_[10];
    u_xlat27_.x = dot(_e563, _e567);
    let _e570 = u_xlat27_;
    u_xlat27_.x = min(_e570.x, 1f);
    let _e575 = u_xlat27_;
    let _e577 = u_xlat6_;
    u_xlat27_.x = (_e575.x * _e577.w);
    let _e580 = u_xlat29_;
    let _e582 = u_xlat6_;
    let _e587 = _f_buffer1_.f_cb1_[16];
    let _e589 = (_e582.xy * _e587.xy);
    u_xlat29_.x = _e589.x;
    u_xlat29_.y = _e589.y;
    let _e594 = u_xlat3_;
    let _e596 = u_xlat29_;
    let _e598 = u_xlat27_;
    let _e601 = u_xlat3_;
    let _e603 = ((_e596.xy * _e598.xx) + _e601.xy);
    u_xlat3_.x = _e603.x;
    u_xlat3_.y = _e603.y;
    let _e608 = u_xlat3_;
    let _e610 = u_xlat3_;
    let _e612 = vs_TEXCOORD0_1;
    let _e614 = (_e610.xy + _e612.xy);
    u_xlat3_.x = _e614.x;
    u_xlat3_.y = _e614.y;
    let _e619 = u_xlat3_;
    let _e624 = _f_buffer0_.f_cb0_[4];
    let _e629 = hscard_bias.values[0];
    let _e632 = textureSampleBias(f_t0_, samplerf_s0_, _e619.xy, (_e624.x + _e629.x));
    u_xlat3_ = _e632;
    let _e637 = _f_buffer1_.f_cb1_[40];
    u_xlatb40_ = (0f < _e637.y);
    let _e641 = u_xlat3_;
    u_xlat4_.x = dot(_e641, vec4<f32>(0.1f, 0.1f, 0.1f, 0.1f));
    let _e649 = u_xlatb40_;
    if _e649 {
        let _e650 = u_xlat4_;
        local = _e650.x;
    } else {
        local = 0f;
    }
    let _e655 = local;
    u_xlat4_.x = _e655;
    let _e659 = _f_buffer1_.f_cb1_[40];
    u_xlatb40_ = (_e659.y == 1f);
    let _e663 = u_xlatb40_;
    if _e663 {
        {
            let _e664 = u_xlat6_;
            let _e665 = u_xlat27_;
            let _e668 = u_xlat6_;
            u_xlat7_ = ((_e664 * _e665.xxxx) + -(_e668));
            let _e674 = _f_buffer1_.f_cb1_[40];
            let _e676 = u_xlat7_;
            let _e678 = u_xlat6_;
            u_xlat7_ = ((_e674.zzzz * _e676) + _e678);
            u_xlat4_.y = 1f;
            let _e682 = u_xlat7_;
            let _e686 = _f_buffer1_.f_cb1_[11];
            let _e688 = u_xlat4_;
            SV_Target0_ = ((_e682 * _e686) + _e688.xxxy);
            return;
        }
    }
    let _e694 = _f_buffer1_.f_cb1_[40];
    u_xlatb40_ = (_e694.y == 2f);
    let _e698 = u_xlatb40_;
    if _e698 {
        {
            let _e699 = u_xlat5_;
            let _e700 = u_xlat14_;
            let _e703 = u_xlat5_;
            u_xlat7_ = ((_e699 * _e700.xxxx) + -(_e703));
            let _e709 = _f_buffer1_.f_cb1_[40];
            let _e711 = u_xlat7_;
            let _e713 = u_xlat5_;
            u_xlat7_ = ((_e709.zzzz * _e711) + _e713);
            u_xlat4_.z = 1f;
            let _e717 = u_xlat7_;
            let _e721 = _f_buffer1_.f_cb1_[20];
            let _e723 = u_xlat4_;
            SV_Target0_ = ((_e717 * _e721) + _e723.xxxz);
            return;
        }
    }
    let _e729 = _f_buffer1_.f_cb1_[40];
    u_xlatb40_ = (_e729.y == 3f);
    let _e733 = u_xlatb40_;
    if _e733 {
        {
            let _e734 = u_xlat2_;
            let _e735 = u_xlat1_;
            let _e738 = u_xlat2_;
            u_xlat7_ = ((_e734 * _e735.xxxx) + -(_e738));
            let _e744 = _f_buffer1_.f_cb1_[40];
            let _e746 = u_xlat7_;
            let _e748 = u_xlat2_;
            u_xlat7_ = ((_e744.zzzz * _e746) + _e748);
            u_xlat4_.w = 1f;
            let _e752 = u_xlat7_;
            let _e756 = _f_buffer1_.f_cb1_[29];
            let _e758 = u_xlat4_;
            SV_Target0_ = ((_e752 * _e756) + _e758.xxxw);
            return;
        }
    }
    let _e764 = _f_buffer1_.f_cb1_[11];
    let _e769 = _f_buffer1_.f_cb1_[11];
    u_xlat4_ = (_e764.wwww * _e769);
    let _e771 = u_xlat4_;
    let _e772 = u_xlat6_;
    u_xlat7_ = (_e771 * _e772);
    let _e774 = u_xlatb8_;
    let _e784 = _f_buffer1_.f_cb1_[15];
    let _e787 = (vec4<f32>(0f, 0f, 0f, 0f) < _e784.wzww).xy;
    u_xlatb8_.x = _e787.x;
    u_xlatb8_.y = _e787.y;
    let _e792 = u_xlat7_;
    let _e797 = _f_buffer1_.f_cb1_[15];
    u_xlat40_ = (_e792.w * _e797.w);
    let _e800 = u_xlat40_;
    u_xlat40_ = clamp(_e800, 0f, 1f);
    let _e804 = u_xlat6_;
    let _e805 = u_xlat4_;
    let _e807 = u_xlat3_;
    u_xlat9_ = ((_e804 * _e805) + -(_e807));
    let _e810 = u_xlat40_;
    let _e812 = u_xlat9_;
    let _e814 = u_xlat3_;
    u_xlat9_ = ((vec4(_e810) * _e812) + _e814);
    let _e816 = u_xlatb8_;
    if _e816.x {
        let _e818 = u_xlat9_;
        local_1 = _e818;
    } else {
        let _e819 = u_xlat3_;
        local_1 = _e819;
    }
    let _e821 = local_1;
    u_xlat9_ = _e821;
    let _e822 = u_xlat7_;
    let _e823 = u_xlat9_;
    u_xlat10_ = (_e822 * _e823);
    let _e825 = u_xlat10_;
    let _e829 = _f_buffer1_.f_cb1_[15];
    let _e832 = u_xlat9_;
    u_xlat9_ = ((_e825 * _e829.yyyy) + _e832);
    let _e834 = u_xlat7_;
    let _e838 = _f_buffer1_.f_cb1_[15];
    let _e841 = u_xlat9_;
    u_xlat9_ = ((_e834 * _e838.xxxx) + _e841);
    let _e843 = u_xlat9_;
    let _e844 = u_xlat9_;
    u_xlat10_ = (_e843 + _e844);
    let _e846 = u_xlat7_;
    let _e847 = u_xlat10_;
    u_xlat11_ = (_e846 * _e847);
    let _e849 = u_xlat9_;
    u_xlat12_ = (-(_e849) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e857 = u_xlat12_;
    let _e858 = u_xlat12_;
    u_xlat12_ = (_e857 + _e858);
    let _e860 = u_xlat6_;
    let _e862 = u_xlat4_;
    u_xlat4_ = ((-(_e860) * _e862) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e870 = u_xlat12_;
    let _e872 = u_xlat4_;
    u_xlat4_ = ((-(_e870) * _e872) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e880 = u_xlat10_;
    u_xlat6_ = floor(_e880);
    let _e882 = u_xlat6_;
    u_xlat6_ = min(_e882, vec4<f32>(1f, 1f, 1f, 1f));
    let _e889 = u_xlat10_;
    let _e891 = u_xlat7_;
    let _e893 = u_xlat4_;
    u_xlat4_ = ((-(_e889) * _e891) + _e893);
    let _e895 = u_xlat6_;
    let _e896 = u_xlat4_;
    let _e898 = u_xlat11_;
    u_xlat4_ = ((_e895 * _e896) + _e898);
    let _e900 = u_xlat3_;
    let _e902 = u_xlat4_;
    u_xlat4_ = (-(_e900) + _e902);
    let _e907 = _f_buffer1_.f_cb1_[15];
    let _e909 = u_xlat4_;
    let _e911 = u_xlat3_;
    u_xlat4_ = ((_e907.zzzz * _e909) + _e911);
    let _e913 = u_xlatb8_;
    if _e913.y {
        let _e915 = u_xlat4_;
        local_2 = _e915;
    } else {
        let _e916 = u_xlat9_;
        local_2 = _e916;
    }
    let _e918 = local_2;
    u_xlat4_ = _e918;
    let _e919 = u_xlat3_;
    let _e921 = u_xlat4_;
    u_xlat4_ = (-(_e919) + _e921);
    let _e923 = u_xlat27_;
    let _e925 = u_xlat4_;
    let _e927 = u_xlat3_;
    u_xlat3_ = ((_e923.xxxx * _e925) + _e927);
    let _e929 = u_xlat14_;
    let _e934 = _f_buffer1_.f_cb1_[20];
    u_xlat4_ = (_e929.xxxx * _e934);
    let _e936 = u_xlat4_;
    let _e940 = _f_buffer1_.f_cb1_[20];
    u_xlat4_ = (_e936 * _e940.wwww);
    let _e943 = u_xlat4_;
    let _e944 = u_xlat5_;
    u_xlat6_ = (_e943 * _e944);
    let _e946 = u_xlatb27_;
    let _e956 = _f_buffer1_.f_cb1_[24];
    let _e959 = (vec4<f32>(0f, 0f, 0f, 0f) < _e956.wzwz).xy;
    u_xlatb27_.x = _e959.x;
    u_xlatb27_.y = _e959.y;
    let _e965 = u_xlat6_;
    let _e970 = _f_buffer1_.f_cb1_[24];
    u_xlat7_.x = (_e965.w * _e970.w);
    let _e974 = u_xlat7_;
    u_xlat7_.x = clamp(_e974.x, 0f, 1f);
    let _e979 = u_xlat5_;
    let _e980 = u_xlat4_;
    let _e982 = u_xlat3_;
    u_xlat8_ = ((_e979 * _e980) + -(_e982));
    let _e985 = u_xlat7_;
    let _e987 = u_xlat8_;
    let _e989 = u_xlat3_;
    u_xlat7_ = ((_e985.xxxx * _e987) + _e989);
    let _e991 = u_xlatb27_;
    if _e991.x {
        let _e993 = u_xlat7_;
        local_3 = _e993;
    } else {
        let _e994 = u_xlat3_;
        local_3 = _e994;
    }
    let _e996 = local_3;
    u_xlat7_ = _e996;
    let _e997 = u_xlat6_;
    let _e998 = u_xlat7_;
    u_xlat8_ = (_e997 * _e998);
    let _e1000 = u_xlat8_;
    let _e1004 = _f_buffer1_.f_cb1_[24];
    let _e1007 = u_xlat7_;
    u_xlat7_ = ((_e1000 * _e1004.yyyy) + _e1007);
    let _e1009 = u_xlat6_;
    let _e1013 = _f_buffer1_.f_cb1_[24];
    let _e1016 = u_xlat7_;
    u_xlat7_ = ((_e1009 * _e1013.xxxx) + _e1016);
    let _e1018 = u_xlat7_;
    let _e1019 = u_xlat7_;
    u_xlat8_ = (_e1018 + _e1019);
    let _e1021 = u_xlat6_;
    let _e1022 = u_xlat8_;
    u_xlat9_ = (_e1021 * _e1022);
    let _e1024 = u_xlat7_;
    u_xlat10_ = (-(_e1024) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1032 = u_xlat10_;
    let _e1033 = u_xlat10_;
    u_xlat10_ = (_e1032 + _e1033);
    let _e1035 = u_xlat5_;
    let _e1037 = u_xlat4_;
    u_xlat4_ = ((-(_e1035) * _e1037) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1045 = u_xlat10_;
    let _e1047 = u_xlat4_;
    u_xlat4_ = ((-(_e1045) * _e1047) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1055 = u_xlat8_;
    u_xlat5_ = floor(_e1055);
    let _e1057 = u_xlat5_;
    u_xlat5_ = min(_e1057, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1064 = u_xlat8_;
    let _e1066 = u_xlat6_;
    let _e1068 = u_xlat4_;
    u_xlat4_ = ((-(_e1064) * _e1066) + _e1068);
    let _e1070 = u_xlat5_;
    let _e1071 = u_xlat4_;
    let _e1073 = u_xlat9_;
    u_xlat4_ = ((_e1070 * _e1071) + _e1073);
    let _e1075 = u_xlat3_;
    let _e1077 = u_xlat4_;
    u_xlat4_ = (-(_e1075) + _e1077);
    let _e1082 = _f_buffer1_.f_cb1_[24];
    let _e1084 = u_xlat4_;
    let _e1086 = u_xlat3_;
    u_xlat4_ = ((_e1082.zzzz * _e1084) + _e1086);
    let _e1088 = u_xlatb27_;
    if _e1088.y {
        let _e1090 = u_xlat4_;
        local_4 = _e1090;
    } else {
        let _e1091 = u_xlat7_;
        local_4 = _e1091;
    }
    let _e1093 = local_4;
    u_xlat4_ = _e1093;
    let _e1094 = u_xlat3_;
    let _e1096 = u_xlat4_;
    u_xlat4_ = (-(_e1094) + _e1096);
    let _e1098 = u_xlat14_;
    let _e1100 = u_xlat4_;
    let _e1102 = u_xlat3_;
    u_xlat3_ = ((_e1098.xxxx * _e1100) + _e1102);
    let _e1104 = u_xlat1_;
    let _e1109 = _f_buffer1_.f_cb1_[29];
    u_xlat4_ = (_e1104.xxxx * _e1109);
    let _e1111 = u_xlat4_;
    let _e1115 = _f_buffer1_.f_cb1_[29];
    u_xlat4_ = (_e1111 * _e1115.wwww);
    let _e1118 = u_xlat4_;
    let _e1119 = u_xlat2_;
    u_xlat5_ = (_e1118 * _e1119);
    let _e1121 = u_xlatb14_;
    let _e1131 = _f_buffer1_.f_cb1_[33];
    let _e1134 = (vec4<f32>(0f, 0f, 0f, 0f) < _e1131.wzww).xy;
    u_xlatb14_.x = _e1134.x;
    u_xlatb14_.y = _e1134.y;
    let _e1139 = u_xlat5_;
    let _e1144 = _f_buffer1_.f_cb1_[33];
    u_xlat40_ = (_e1139.w * _e1144.w);
    let _e1147 = u_xlat40_;
    u_xlat40_ = clamp(_e1147, 0f, 1f);
    let _e1151 = u_xlat2_;
    let _e1152 = u_xlat4_;
    let _e1154 = u_xlat3_;
    u_xlat6_ = ((_e1151 * _e1152) + -(_e1154));
    let _e1157 = u_xlat40_;
    let _e1159 = u_xlat6_;
    let _e1161 = u_xlat3_;
    u_xlat6_ = ((vec4(_e1157) * _e1159) + _e1161);
    let _e1163 = u_xlatb14_;
    if _e1163.x {
        let _e1165 = u_xlat6_;
        local_5 = _e1165;
    } else {
        let _e1166 = u_xlat3_;
        local_5 = _e1166;
    }
    let _e1168 = local_5;
    u_xlat6_ = _e1168;
    let _e1169 = u_xlat5_;
    let _e1170 = u_xlat6_;
    u_xlat7_ = (_e1169 * _e1170);
    let _e1172 = u_xlat7_;
    let _e1176 = _f_buffer1_.f_cb1_[33];
    let _e1179 = u_xlat6_;
    u_xlat6_ = ((_e1172 * _e1176.yyyy) + _e1179);
    let _e1181 = u_xlat5_;
    let _e1185 = _f_buffer1_.f_cb1_[33];
    let _e1188 = u_xlat6_;
    u_xlat6_ = ((_e1181 * _e1185.xxxx) + _e1188);
    let _e1190 = u_xlat6_;
    let _e1191 = u_xlat6_;
    u_xlat7_ = (_e1190 + _e1191);
    let _e1193 = u_xlat5_;
    let _e1194 = u_xlat7_;
    u_xlat8_ = (_e1193 * _e1194);
    let _e1196 = u_xlat6_;
    u_xlat9_ = (-(_e1196) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1204 = u_xlat9_;
    let _e1205 = u_xlat9_;
    u_xlat9_ = (_e1204 + _e1205);
    let _e1207 = u_xlat2_;
    let _e1209 = u_xlat4_;
    u_xlat2_ = ((-(_e1207) * _e1209) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1217 = u_xlat9_;
    let _e1219 = u_xlat2_;
    u_xlat2_ = ((-(_e1217) * _e1219) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1227 = u_xlat7_;
    u_xlat4_ = floor(_e1227);
    let _e1229 = u_xlat4_;
    u_xlat4_ = min(_e1229, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1236 = u_xlat7_;
    let _e1238 = u_xlat5_;
    let _e1240 = u_xlat2_;
    u_xlat2_ = ((-(_e1236) * _e1238) + _e1240);
    let _e1242 = u_xlat4_;
    let _e1243 = u_xlat2_;
    let _e1245 = u_xlat8_;
    u_xlat2_ = ((_e1242 * _e1243) + _e1245);
    let _e1247 = u_xlat3_;
    let _e1249 = u_xlat2_;
    u_xlat2_ = (-(_e1247) + _e1249);
    let _e1254 = _f_buffer1_.f_cb1_[33];
    let _e1256 = u_xlat2_;
    let _e1258 = u_xlat3_;
    u_xlat2_ = ((_e1254.zzzz * _e1256) + _e1258);
    let _e1260 = u_xlatb14_;
    if _e1260.y {
        let _e1262 = u_xlat2_;
        local_6 = _e1262;
    } else {
        let _e1263 = u_xlat6_;
        local_6 = _e1263;
    }
    let _e1265 = local_6;
    u_xlat2_ = _e1265;
    let _e1266 = u_xlat3_;
    let _e1268 = u_xlat2_;
    u_xlat2_ = (-(_e1266) + _e1268);
    let _e1270 = u_xlat1_;
    let _e1272 = u_xlat2_;
    let _e1274 = u_xlat3_;
    u_xlat1_ = ((_e1270.xxxx * _e1272) + _e1274);
    let _e1276 = u_xlat1_;
    u_xlat1_ = clamp(_e1276, vec4(0f), vec4(1f));
    let _e1283 = u_xlat0_;
    let _e1287 = _f_buffer1_.f_cb1_[39];
    u_xlat0_.x = dot(_e1283, _e1287);
    let _e1290 = u_xlat0_;
    u_xlat0_.x = min(_e1290.x, 1f);
    let _e1295 = u_xlat0_;
    let _e1297 = vs_TEXCOORD2_1;
    u_xlat0_.x = (_e1295.x * _e1297.y);
    let _e1300 = u_xlat1_;
    u_xlat2_ = log2(_e1300);
    let _e1302 = u_xlat2_;
    let _e1306 = _f_buffer1_.f_cb1_[38];
    u_xlat2_ = (_e1302 * _e1306.zzzz);
    let _e1309 = u_xlat2_;
    u_xlat2_ = exp2(_e1309);
    let _e1311 = u_xlat0_;
    let _e1313 = u_xlat2_;
    u_xlat3_ = (_e1311.xxxx * _e1313);
    let _e1318 = _f_buffer1_.f_cb1_[40];
    u_xlatb13_ = (_e1318.y == 9f);
    let _e1322 = u_xlatb13_;
    if _e1322 {
        {
            let _e1323 = u_xlat3_;
            SV_Target0_ = _e1323;
            return;
        }
    }
    let _e1324 = u_xlat0_;
    let _e1326 = u_xlat2_;
    let _e1328 = u_xlat1_;
    u_xlat0_ = ((_e1324.xxxx * _e1326) + _e1328);
    let _e1330 = u_xlat0_;
    let _e1331 = vs_COLOR0_1;
    SV_Target0_ = (_e1330 * _e1331);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e60 = SV_Target0_;
    return FragmentOutput(_e60);
}
