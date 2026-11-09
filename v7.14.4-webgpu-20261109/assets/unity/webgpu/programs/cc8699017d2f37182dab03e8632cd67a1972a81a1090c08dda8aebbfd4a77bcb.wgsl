struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 35>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_TEXCOORD3_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_TEXCOORD5_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlatb12_: bool = false;
    var local: vec3<f32>;
    var local_1: vec2<f32>;

    let _e67 = vs_TEXCOORD2_1;
    let _e72 = _f_buffer0_.f_cb0_[4];
    let _e77 = hscard_bias.values[4];
    let _e80 = textureSampleBias(f_t4_, samplerf_s4_, _e67.xy, (_e72.x + _e77.x));
    u_xlat0_ = _e80;
    let _e85 = _f_buffer1_.f_cb1_[8];
    u_xlatb12_ = (1f < _e85.x);
    let _e88 = u_xlat0_;
    let _e90 = u_xlatb12_;
    if bool(_e90) {
        let _e92 = u_xlat0_;
        local = _e92.xyz;
    } else {
        local = vec3<f32>(1f, 1f, 1f);
    }
    let _e99 = local;
    u_xlat0_.x = _e99.x;
    u_xlat0_.y = _e99.y;
    u_xlat0_.z = _e99.z;
    let _e107 = u_xlat0_;
    let _e112 = _f_buffer1_.f_cb1_[4];
    u_xlat1_.x = (_e107.x * _e112.w);
    let _e116 = u_xlat0_;
    let _e121 = _f_buffer1_.f_cb1_[5];
    u_xlat1_.y = (_e116.y * _e121.x);
    let _e124 = u_xlat0_;
    let _e126 = u_xlat1_;
    let _e128 = vs_TEXCOORD5_1;
    let _e130 = (_e126.xy + _e128.xy);
    u_xlat0_.x = _e130.x;
    u_xlat0_.y = _e130.y;
    let _e135 = u_xlat0_;
    let _e137 = u_xlatb12_;
    if bool(_e137) {
        let _e139 = u_xlat0_;
        local_1 = _e139.xy;
    } else {
        let _e141 = vs_TEXCOORD2_1;
        local_1 = _e141.xy;
    }
    let _e144 = local_1;
    u_xlat0_.x = _e144.x;
    u_xlat0_.y = _e144.y;
    let _e149 = u_xlat0_;
    let _e154 = _f_buffer0_.f_cb0_[4];
    let _e159 = hscard_bias.values[3];
    let _e162 = textureSampleBias(f_t3_, samplerf_s3_, _e149.xy, (_e154.x + _e159.x));
    u_xlat1_ = _e162;
    let _e163 = u_xlat0_;
    let _e165 = u_xlat1_;
    let _e171 = _f_buffer1_.f_cb1_[4];
    let _e173 = (-(_e165.xyz) + _e171.yyy);
    u_xlat0_.x = _e173.x;
    u_xlat0_.y = _e173.y;
    u_xlat0_.w = _e173.z;
    let _e180 = u_xlat4_;
    let _e182 = u_xlat0_;
    let _e184 = u_xlat0_;
    let _e187 = (_e182.zzz * abs(_e184.xyw));
    u_xlat4_.x = _e187.x;
    u_xlat4_.y = _e187.y;
    u_xlat4_.z = _e187.z;
    let _e195 = u_xlat0_;
    u_xlat0_.x = (abs(_e195.x) + -0.5f);
    let _e201 = u_xlat4_;
    let _e203 = u_xlat4_;
    let _e208 = _f_buffer1_.f_cb1_[3];
    let _e210 = (_e203.xyz * _e208.xyz);
    u_xlat4_.x = _e210.x;
    u_xlat4_.y = _e210.y;
    u_xlat4_.z = _e210.z;
    let _e217 = u_xlat4_;
    let _e219 = u_xlat4_;
    let _e224 = _f_buffer1_.f_cb1_[3];
    let _e226 = (_e219.xyz * _e224.www);
    u_xlat4_.x = _e226.x;
    u_xlat4_.y = _e226.y;
    u_xlat4_.z = _e226.z;
    let _e233 = u_xlat0_;
    let _e235 = u_xlat4_;
    let _e240 = _f_buffer1_.f_cb1_[4];
    let _e242 = (_e235.xyz * _e240.xxx);
    u_xlat0_.y = _e242.x;
    u_xlat0_.z = _e242.y;
    u_xlat0_.w = _e242.z;
    let _e249 = vs_TEXCOORD0_1;
    let _e254 = _f_buffer0_.f_cb0_[4];
    let _e259 = hscard_bias.values[2];
    let _e262 = textureSampleBias(f_t2_, samplerf_s2_, _e249.xy, (_e254.x + _e259.x));
    u_xlat1_ = _e262;
    let _e263 = u_xlat0_;
    let _e264 = u_xlat1_;
    u_xlat0_ = (_e263 * _e264.xxxx);
    let _e267 = vs_TEXCOORD4_1;
    let _e272 = _f_buffer0_.f_cb0_[4];
    let _e277 = hscard_bias.values[5];
    let _e280 = textureSampleBias(f_t5_, samplerf_s5_, _e267.xy, (_e272.x + _e277.x));
    u_xlat2_ = _e280;
    let _e281 = u_xlat2_;
    let _e283 = u_xlat2_;
    let _e289 = _f_buffer1_.f_cb1_[13];
    let _e291 = (-(_e283.xyz) + _e289.yyy);
    u_xlat2_.x = _e291.x;
    u_xlat2_.y = _e291.y;
    u_xlat2_.z = _e291.z;
    let _e298 = u_xlat6_;
    let _e300 = u_xlat2_;
    let _e306 = _f_buffer1_.f_cb1_[12];
    let _e308 = (abs(_e300.xyz) * _e306.xyz);
    u_xlat6_.x = _e308.x;
    u_xlat6_.y = _e308.y;
    u_xlat6_.z = _e308.z;
    let _e316 = u_xlat2_;
    u_xlat2_.x = (abs(_e316.x) + -0.5f);
    let _e323 = u_xlat1_;
    let _e325 = u_xlat2_;
    u_xlat2_.x = (_e323.y * _e325.x);
    let _e328 = u_xlat2_;
    let _e330 = u_xlat6_;
    let _e335 = _f_buffer1_.f_cb1_[12];
    let _e337 = (_e330.xyz * _e335.www);
    u_xlat2_.y = _e337.x;
    u_xlat2_.z = _e337.y;
    u_xlat2_.w = _e337.z;
    let _e344 = u_xlat2_;
    let _e348 = _f_buffer1_.f_cb1_[13];
    u_xlat2_ = (_e344 * _e348.wxxx);
    let _e351 = u_xlat6_;
    let _e353 = u_xlat1_;
    let _e355 = u_xlat2_;
    let _e357 = (_e353.yyy * _e355.yzw);
    u_xlat6_.x = _e357.x;
    u_xlat6_.y = _e357.y;
    u_xlat6_.z = _e357.z;
    let _e364 = u_xlat6_;
    let _e366 = u_xlat6_;
    let _e368 = vs_TEXCOORD3_1;
    let _e370 = (_e366.xyz * _e368.yyy);
    u_xlat6_.x = _e370.x;
    u_xlat6_.y = _e370.y;
    u_xlat6_.z = _e370.z;
    let _e377 = u_xlat3_;
    let _e379 = u_xlat0_;
    let _e381 = vs_TEXCOORD3_1;
    let _e384 = u_xlat6_;
    let _e386 = ((_e379.yzw * _e381.xxx) + _e384.xyz);
    u_xlat3_.x = _e386.x;
    u_xlat3_.y = _e386.y;
    u_xlat3_.z = _e386.z;
    let _e393 = u_xlat4_;
    let _e395 = u_xlat0_;
    let _e397 = vs_TEXCOORD3_1;
    let _e399 = (_e395.yzw * _e397.xxx);
    u_xlat4_.x = _e399.x;
    u_xlat4_.y = _e399.y;
    u_xlat4_.z = _e399.z;
    let _e406 = u_xlat3_;
    let _e408 = u_xlat3_;
    let _e414 = (_e408.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat3_.x = _e414.x;
    u_xlat3_.y = _e414.y;
    u_xlat3_.z = _e414.z;
    let _e421 = u_xlat4_;
    let _e423 = u_xlat4_;
    let _e425 = u_xlat6_;
    let _e428 = u_xlat3_;
    let _e431 = ((_e423.xyz * _e425.xyz) + -(_e428.xyz));
    u_xlat4_.x = _e431.x;
    u_xlat4_.y = _e431.y;
    u_xlat4_.z = _e431.z;
    let _e438 = u_xlat4_;
    let _e443 = _f_buffer1_.f_cb1_[13];
    let _e445 = u_xlat4_;
    let _e448 = u_xlat3_;
    let _e450 = ((_e443.zzz * _e445.xyz) + _e448.xyz);
    u_xlat4_.x = _e450.x;
    u_xlat4_.y = _e450.y;
    u_xlat4_.z = _e450.z;
    let _e457 = vs_TEXCOORD4_1;
    let _e462 = _f_buffer0_.f_cb0_[4];
    let _e467 = hscard_bias.values[6];
    let _e470 = textureSampleBias(f_t6_, samplerf_s6_, _e457.zw, (_e462.x + _e467.x));
    u_xlat3_ = _e470;
    let _e471 = u_xlat3_;
    let _e476 = _f_buffer1_.f_cb1_[20];
    u_xlat3_ = (-(_e471) + _e476.zzzz);
    let _e480 = u_xlat3_;
    u_xlat6_.x = (abs(_e480.x) + -0.5f);
    let _e486 = u_xlat3_;
    let _e491 = _f_buffer1_.f_cb1_[19];
    u_xlat3_ = (abs(_e486) * _e491);
    let _e494 = u_xlat1_;
    let _e496 = u_xlat6_;
    u_xlat6_.x = (_e494.z * _e496.x);
    let _e500 = u_xlat6_;
    let _e505 = _f_buffer1_.f_cb1_[21];
    let _e508 = u_xlat2_;
    u_xlat2_.x = ((_e500.x * _e505.x) + _e508.x);
    let _e512 = u_xlat0_;
    let _e517 = _f_buffer1_.f_cb1_[4];
    let _e520 = u_xlat2_;
    u_xlat0_.x = ((_e512.x * _e517.z) + _e520.x);
    let _e523 = u_xlat2_;
    let _e528 = _f_buffer1_.f_cb1_[34];
    let _e530 = u_xlat0_;
    let _e533 = vs_TEXCOORD0_1;
    let _e535 = ((_e528.zw * _e530.xx) + _e533.xy);
    u_xlat2_.x = _e535.x;
    u_xlat2_.y = _e535.y;
    let _e540 = u_xlat2_;
    let _e545 = _f_buffer0_.f_cb0_[4];
    let _e550 = hscard_bias.values[0];
    let _e553 = textureSampleBias(f_t0_, samplerf_s0_, _e540.xy, (_e545.x + _e550.x));
    u_xlat2_ = _e553;
    let _e554 = u_xlat0_;
    let _e556 = u_xlat4_;
    let _e558 = u_xlat2_;
    let _e560 = (_e556.xyz + _e558.xyz);
    u_xlat0_.x = _e560.x;
    u_xlat0_.y = _e560.y;
    u_xlat0_.z = _e560.z;
    let _e567 = u_xlat0_;
    let _e572 = _f_buffer1_.f_cb1_[33];
    let _e577 = _f_buffer1_.f_cb1_[34];
    let _e580 = u_xlat0_;
    let _e582 = ((_e572.www * _e577.xxx) + _e580.xyz);
    u_xlat0_.x = _e582.x;
    u_xlat0_.y = _e582.y;
    u_xlat0_.z = _e582.z;
    let _e589 = u_xlat0_;
    let _e591 = u_xlat2_;
    let _e594 = u_xlat0_;
    let _e596 = (-(_e591.xyz) + _e594.xyz);
    u_xlat0_.x = _e596.x;
    u_xlat0_.y = _e596.y;
    u_xlat0_.z = _e596.z;
    let _e603 = u_xlat1_;
    let _e605 = u_xlat1_;
    u_xlat12_ = (_e603.y + _e605.x);
    let _e608 = u_xlat12_;
    u_xlat12_ = clamp(_e608, 0f, 1f);
    let _e612 = u_xlat0_;
    let _e614 = u_xlat12_;
    let _e616 = u_xlat0_;
    let _e619 = u_xlat2_;
    let _e621 = ((vec3(_e614) * _e616.xyz) + _e619.xyz);
    u_xlat0_.x = _e621.x;
    u_xlat0_.y = _e621.y;
    u_xlat0_.z = _e621.z;
    let _e628 = u_xlat2_;
    let _e630 = u_xlat3_;
    let _e635 = _f_buffer1_.f_cb1_[20];
    let _e638 = u_xlat0_;
    let _e641 = ((_e630.xyz * _e635.yyy) + -(_e638.xyz));
    u_xlat2_.x = _e641.x;
    u_xlat2_.y = _e641.y;
    u_xlat2_.z = _e641.z;
    let _e648 = u_xlat1_;
    let _e650 = u_xlat3_;
    u_xlat12_ = (_e648.z * _e650.w);
    let _e654 = u_xlat1_;
    let _e656 = vs_TEXCOORD3_1;
    u_xlat1_.x = (_e654.w * _e656.w);
    let _e660 = u_xlat1_;
    let _e665 = _f_buffer1_.f_cb1_[29];
    u_xlat1_.x = (_e660.x * _e665.x);
    let _e668 = u_xlat12_;
    let _e669 = vs_TEXCOORD3_1;
    u_xlat12_ = (_e668 * _e669.z);
    let _e672 = u_xlat12_;
    let _e676 = _f_buffer1_.f_cb1_[20];
    u_xlat12_ = (_e672 * _e676.x);
    let _e679 = u_xlat0_;
    let _e681 = u_xlat12_;
    let _e683 = u_xlat2_;
    let _e686 = u_xlat0_;
    let _e688 = ((vec3(_e681) * _e683.xyz) + _e686.xyz);
    u_xlat0_.x = _e688.x;
    u_xlat0_.y = _e688.y;
    u_xlat0_.z = _e688.z;
    let _e695 = vs_TEXCOORD2_1;
    let _e700 = _f_buffer0_.f_cb0_[4];
    let _e705 = hscard_bias.values[7];
    let _e708 = textureSampleBias(f_t7_, samplerf_s7_, _e695.zw, (_e700.x + _e705.x));
    u_xlat2_ = _e708;
    let _e709 = u_xlat2_;
    let _e713 = _f_buffer1_.f_cb1_[28];
    u_xlat2_ = (_e709 * _e713);
    let _e715 = u_xlat5_;
    let _e717 = u_xlat2_;
    let _e722 = _f_buffer1_.f_cb1_[29];
    let _e725 = u_xlat0_;
    let _e728 = ((_e717.xyz * _e722.yyy) + -(_e725.xyz));
    u_xlat5_.x = _e728.x;
    u_xlat5_.y = _e728.y;
    u_xlat5_.z = _e728.z;
    let _e735 = u_xlat5_;
    let _e737 = u_xlat2_;
    let _e739 = u_xlat5_;
    let _e742 = u_xlat0_;
    let _e744 = ((_e737.www * _e739.xyz) + _e742.xyz);
    u_xlat5_.x = _e744.x;
    u_xlat5_.y = _e744.y;
    u_xlat5_.z = _e744.z;
    let _e751 = u_xlat5_;
    let _e753 = u_xlat5_;
    let _e759 = clamp(_e753.xyz, vec3(0f), vec3(1f));
    u_xlat5_.x = _e759.x;
    u_xlat5_.y = _e759.y;
    u_xlat5_.z = _e759.z;
    let _e766 = u_xlat2_;
    let _e768 = u_xlat2_;
    let _e773 = _f_buffer1_.f_cb1_[29];
    let _e776 = u_xlat0_;
    let _e778 = ((_e768.xyz * _e773.yyy) + _e776.xyz);
    u_xlat2_.x = _e778.x;
    u_xlat2_.y = _e778.y;
    u_xlat2_.z = _e778.z;
    let _e785 = u_xlat0_;
    let _e787 = u_xlat0_;
    let _e788 = _e787.xyz;
    u_xlat0_.x = _e788.x;
    u_xlat0_.y = _e788.y;
    u_xlat0_.z = _e788.z;
    let _e795 = u_xlat0_;
    let _e797 = u_xlat0_;
    let _e803 = clamp(_e797.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e803.x;
    u_xlat0_.y = _e803.y;
    u_xlat0_.z = _e803.z;
    let _e810 = u_xlat5_;
    let _e812 = u_xlat5_;
    let _e814 = u_xlat2_;
    let _e817 = (_e812.xyz + -(_e814.xyz));
    u_xlat5_.x = _e817.x;
    u_xlat5_.y = _e817.y;
    u_xlat5_.z = _e817.z;
    let _e824 = u_xlat5_;
    let _e829 = _f_buffer1_.f_cb1_[27];
    let _e831 = u_xlat5_;
    let _e834 = u_xlat2_;
    let _e836 = ((_e829.yyy * _e831.xyz) + _e834.xyz);
    u_xlat5_.x = _e836.x;
    u_xlat5_.y = _e836.y;
    u_xlat5_.z = _e836.z;
    let _e843 = u_xlat5_;
    let _e845 = u_xlat0_;
    let _e848 = u_xlat5_;
    let _e850 = (-(_e845.xyz) + _e848.xyz);
    u_xlat5_.x = _e850.x;
    u_xlat5_.y = _e850.y;
    u_xlat5_.z = _e850.z;
    let _e857 = u_xlat0_;
    let _e859 = u_xlat1_;
    let _e861 = u_xlat5_;
    let _e864 = u_xlat0_;
    let _e866 = ((_e859.xxx * _e861.xyz) + _e864.xyz);
    u_xlat0_.x = _e866.x;
    u_xlat0_.y = _e866.y;
    u_xlat0_.z = _e866.z;
    let _e873 = u_xlat1_;
    let _e875 = u_xlat0_;
    let _e881 = (_e875.xyz + vec3<f32>(0.15f, 0.15f, 0.15f));
    u_xlat1_.x = _e881.x;
    u_xlat1_.y = _e881.y;
    u_xlat1_.z = _e881.z;
    let _e888 = u_xlat1_;
    let _e890 = u_xlat1_;
    let _e892 = vs_COLOR0_1;
    let _e894 = (_e890.xyz * _e892.xyz);
    u_xlat1_.x = _e894.x;
    u_xlat1_.y = _e894.y;
    u_xlat1_.z = _e894.z;
    let _e901 = u_xlat0_;
    let _e903 = u_xlat0_;
    let _e905 = u_xlat1_;
    let _e907 = min(_e903.xyz, _e905.xyz);
    u_xlat0_.x = _e907.x;
    u_xlat0_.y = _e907.y;
    u_xlat0_.z = _e907.z;
    let _e914 = vs_TEXCOORD1_1;
    let _e919 = _f_buffer0_.f_cb0_[4];
    let _e924 = hscard_bias.values[1];
    let _e927 = textureSampleBias(f_t1_, samplerf_s1_, _e914.xy, (_e919.x + _e924.x));
    u_xlat1_ = _e927;
    let _e928 = SV_Target0_;
    let _e930 = u_xlat0_;
    let _e932 = u_xlat1_;
    let _e934 = (_e930.xyz * _e932.xyz);
    SV_Target0_.x = _e934.x;
    SV_Target0_.y = _e934.y;
    SV_Target0_.z = _e934.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(5) vs_TEXCOORD5_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e72 = SV_Target0_;
    return FragmentOutput(_e72);
}
