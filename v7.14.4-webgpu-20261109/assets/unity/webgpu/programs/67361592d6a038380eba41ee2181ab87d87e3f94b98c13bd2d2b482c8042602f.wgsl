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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: vec2<bool> = vec2(false);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlat27_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e78 = u_xlat0_;
    let _e83 = _f_buffer1_.f_cb1_[11];
    let _e88 = _f_buffer1_.f_cb1_[11];
    let _e90 = (_e83.zw + _e88.xy);
    u_xlat0_.x = _e90.x;
    u_xlat0_.y = _e90.y;
    let _e95 = vs_TEXCOORD1_1;
    let _e100 = _f_buffer0_.f_cb0_[4];
    let _e105 = hscard_bias.values[6];
    let _e108 = textureSampleBias(f_t6_, samplerf_s6_, _e95.zw, (_e100.x + _e105.x));
    u_xlat1_ = _e108;
    let _e109 = u_xlat18_;
    let _e114 = _f_buffer1_.f_cb1_[37];
    let _e120 = _f_buffer1_.f_cb1_[38];
    let _e122 = (-(_e114.xy) + _e120.zw);
    u_xlat18_.x = _e122.x;
    u_xlat18_.y = _e122.y;
    let _e127 = u_xlat1_;
    let _e129 = u_xlat18_;
    let _e132 = u_xlat1_;
    let _e134 = (-(_e129.xy) + _e132.xy);
    u_xlat1_.x = _e134.x;
    u_xlat1_.y = _e134.y;
    let _e139 = u_xlat18_;
    let _e141 = u_xlat1_;
    let _e146 = _f_buffer1_.f_cb1_[38];
    let _e149 = u_xlat18_;
    let _e151 = ((_e141.xy * _e146.xy) + _e149.xy);
    u_xlat18_.x = _e151.x;
    u_xlat18_.y = _e151.y;
    let _e156 = u_xlat1_;
    let _e161 = _f_buffer1_.f_cb1_[37];
    let _e166 = _f_buffer1_.f_cb1_[37];
    let _e168 = (_e161.zw + _e166.xy);
    u_xlat1_.x = _e168.x;
    u_xlat1_.y = _e168.y;
    let _e173 = u_xlat18_;
    let _e175 = u_xlat18_;
    let _e177 = u_xlat1_;
    let _e179 = (_e175.xy + _e177.xy);
    u_xlat18_.x = _e179.x;
    u_xlat18_.y = _e179.y;
    let _e184 = u_xlat18_;
    let _e189 = _f_buffer0_.f_cb0_[4];
    let _e194 = hscard_bias.values[5];
    let _e197 = textureSampleBias(f_t5_, samplerf_s5_, _e184.xy, (_e189.x + _e194.x));
    u_xlat2_ = _e197;
    let _e199 = u_xlat1_;
    let _e201 = u_xlat2_;
    u_xlat2_.w = (_e199.z * _e201.w);
    let _e204 = vs_TEXCOORD0_1;
    let _e209 = _f_buffer0_.f_cb0_[4];
    let _e214 = hscard_bias.values[1];
    let _e217 = textureSampleBias(f_t1_, samplerf_s1_, _e204.xy, (_e209.x + _e214.x));
    u_xlat1_ = _e217;
    let _e219 = u_xlat1_;
    let _e223 = _f_buffer1_.f_cb1_[27];
    u_xlat18_.x = dot(_e219, _e223);
    let _e226 = u_xlat18_;
    u_xlat18_.x = min(_e226.x, 1f);
    let _e231 = u_xlat18_;
    let _e233 = u_xlat2_;
    u_xlat18_.x = (_e231.x * _e233.w);
    let _e236 = u_xlat18_;
    let _e238 = u_xlat2_;
    u_xlat3_ = (_e236.xxxx * _e238.xyxy);
    let _e241 = u_xlat3_;
    let _e245 = _f_buffer1_.f_cb1_[33];
    u_xlat3_ = (_e241 * _e245.zwxy);
    let _e248 = u_xlat3_;
    let _e250 = u_xlat18_;
    let _e252 = u_xlat3_;
    let _e254 = (_e250.xx * _e252.xy);
    u_xlat3_.x = _e254.x;
    u_xlat3_.y = _e254.y;
    let _e259 = u_xlat4_;
    let _e261 = u_xlat3_;
    let _e267 = vs_TEXCOORD1_1;
    let _e269 = ((_e261.xy * vec2<f32>(0.001f, 0.001f)) + _e267.xy);
    u_xlat4_.x = _e269.x;
    u_xlat4_.y = _e269.y;
    let _e274 = u_xlat4_;
    let _e279 = _f_buffer0_.f_cb0_[4];
    let _e284 = hscard_bias.values[4];
    let _e287 = textureSampleBias(f_t4_, samplerf_s4_, _e274.xy, (_e279.x + _e284.x));
    u_xlat4_ = _e287;
    let _e288 = u_xlat5_;
    let _e290 = u_xlat4_;
    let _e295 = _f_buffer1_.f_cb1_[20];
    let _e297 = (_e290.xy * _e295.zw);
    u_xlat5_.x = _e297.x;
    u_xlat5_.y = _e297.y;
    let _e302 = u_xlat1_;
    let _e306 = _f_buffer1_.f_cb1_[14];
    u_xlat27_ = dot(_e302, _e306);
    let _e309 = u_xlat1_;
    let _e313 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = dot(_e309, _e313);
    let _e316 = u_xlat1_;
    u_xlat1_.x = min(_e316.x, 1f);
    let _e320 = u_xlat27_;
    u_xlat27_ = min(_e320, 1f);
    let _e323 = u_xlat27_;
    let _e324 = u_xlat4_;
    u_xlat27_ = (_e323 * _e324.w);
    let _e327 = u_xlat10_;
    let _e329 = u_xlat5_;
    let _e331 = u_xlat27_;
    let _e334 = u_xlat3_;
    let _e336 = ((_e329.xy * vec2(_e331)) + _e334.xy);
    u_xlat10_.x = _e336.x;
    u_xlat10_.y = _e336.y;
    let _e341 = u_xlat10_;
    let _e343 = u_xlat10_;
    let _e349 = vs_TEXCOORD0_1;
    let _e351 = ((_e343.xy * vec2<f32>(0.001f, 0.001f)) + _e349.zw);
    u_xlat10_.x = _e351.x;
    u_xlat10_.y = _e351.y;
    let _e356 = u_xlat10_;
    let _e361 = _f_buffer0_.f_cb0_[4];
    let _e366 = hscard_bias.values[3];
    let _e369 = textureSampleBias(f_t3_, samplerf_s3_, _e356.xy, (_e361.x + _e366.x));
    u_xlat5_ = _e369;
    let _e370 = u_xlat10_;
    let _e375 = _f_buffer1_.f_cb1_[11];
    let _e381 = _f_buffer1_.f_cb1_[12];
    let _e383 = (-(_e375.xy) + _e381.zw);
    u_xlat10_.x = _e383.x;
    u_xlat10_.y = _e383.y;
    let _e388 = u_xlat3_;
    let _e390 = u_xlat10_;
    let _e393 = u_xlat5_;
    let _e395 = (-(_e390.xy) + _e393.xy);
    u_xlat3_.x = _e395.x;
    u_xlat3_.y = _e395.y;
    let _e400 = u_xlat10_;
    let _e402 = u_xlat3_;
    let _e407 = _f_buffer1_.f_cb1_[12];
    let _e410 = u_xlat10_;
    let _e412 = ((_e402.xy * _e407.xy) + _e410.xy);
    u_xlat10_.x = _e412.x;
    u_xlat10_.y = _e412.y;
    let _e417 = u_xlat0_;
    let _e419 = u_xlat0_;
    let _e421 = u_xlat10_;
    let _e423 = (_e419.xy + _e421.xy);
    u_xlat0_.x = _e423.x;
    u_xlat0_.y = _e423.y;
    let _e428 = u_xlat0_;
    let _e433 = _f_buffer0_.f_cb0_[4];
    let _e438 = hscard_bias.values[2];
    let _e441 = textureSampleBias(f_t2_, samplerf_s2_, _e428.xy, (_e433.x + _e438.x));
    u_xlat6_ = _e441;
    let _e442 = u_xlat0_;
    let _e444 = u_xlat6_;
    let _e449 = _f_buffer1_.f_cb1_[8];
    let _e451 = (_e444.xy * _e449.xy);
    u_xlat0_.x = _e451.x;
    u_xlat0_.y = _e451.y;
    let _e457 = u_xlat5_;
    let _e459 = u_xlat6_;
    u_xlat6_.w = (_e457.z * _e459.w);
    let _e463 = u_xlat1_;
    let _e465 = u_xlat6_;
    u_xlat1_.x = (_e463.x * _e465.w);
    let _e468 = u_xlat10_;
    let _e470 = u_xlat27_;
    let _e472 = u_xlat4_;
    let _e474 = (vec2(_e470) * _e472.xy);
    u_xlat10_.x = _e474.x;
    u_xlat10_.y = _e474.y;
    let _e479 = u_xlat10_;
    let _e481 = u_xlat10_;
    let _e486 = _f_buffer1_.f_cb1_[20];
    let _e488 = (_e481.xy * _e486.xy);
    u_xlat10_.x = _e488.x;
    u_xlat10_.y = _e488.y;
    let _e493 = u_xlat10_;
    let _e495 = u_xlat27_;
    let _e497 = u_xlat10_;
    let _e499 = (vec2(_e495) * _e497.xy);
    u_xlat10_.x = _e499.x;
    u_xlat10_.y = _e499.y;
    let _e504 = u_xlat0_;
    let _e506 = u_xlat0_;
    let _e508 = u_xlat1_;
    let _e511 = u_xlat10_;
    let _e513 = ((_e506.xy * _e508.xx) + _e511.xy);
    u_xlat0_.x = _e513.x;
    u_xlat0_.y = _e513.y;
    let _e518 = u_xlat0_;
    let _e520 = u_xlat3_;
    let _e522 = u_xlat18_;
    let _e525 = u_xlat0_;
    let _e527 = ((_e520.zw * _e522.xx) + _e525.xy);
    u_xlat0_.x = _e527.x;
    u_xlat0_.y = _e527.y;
    let _e532 = u_xlat0_;
    let _e534 = u_xlat0_;
    let _e540 = vs_TEXCOORD0_1;
    let _e542 = ((_e534.xy * vec2<f32>(0.001f, 0.001f)) + _e540.xy);
    u_xlat0_.x = _e542.x;
    u_xlat0_.y = _e542.y;
    let _e547 = u_xlat0_;
    let _e552 = _f_buffer0_.f_cb0_[4];
    let _e557 = hscard_bias.values[0];
    let _e560 = textureSampleBias(f_t0_, samplerf_s0_, _e547.xy, (_e552.x + _e557.x));
    u_xlat3_ = _e560;
    let _e564 = _f_buffer1_.f_cb1_[3];
    let _e569 = _f_buffer1_.f_cb1_[3];
    u_xlat5_ = (_e564.wwww * _e569);
    let _e571 = u_xlat6_;
    let _e572 = u_xlat5_;
    let _e574 = u_xlat3_;
    u_xlat7_ = ((_e571 * _e572) + -(_e574));
    let _e577 = u_xlat5_;
    let _e578 = u_xlat6_;
    u_xlat8_ = (_e577 * _e578);
    let _e580 = u_xlat6_;
    let _e582 = u_xlat5_;
    u_xlat5_ = ((-(_e580) * _e582) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e591 = u_xlat8_;
    let _e596 = _f_buffer1_.f_cb1_[7];
    u_xlat0_.x = (_e591.w * _e596.w);
    let _e600 = u_xlat0_;
    u_xlat0_.x = clamp(_e600.x, 0f, 1f);
    let _e605 = u_xlat0_;
    let _e607 = u_xlat7_;
    let _e609 = u_xlat3_;
    u_xlat6_ = ((_e605.xxxx * _e607) + _e609);
    let _e611 = u_xlatb0_;
    let _e621 = _f_buffer1_.f_cb1_[7];
    let _e624 = (vec4<f32>(0f, 0f, 0f, 0f) < _e621.wzww).xy;
    u_xlatb0_.x = _e624.x;
    u_xlatb0_.y = _e624.y;
    let _e629 = u_xlatb0_;
    if _e629.x {
        let _e631 = u_xlat6_;
        local = _e631;
    } else {
        let _e632 = u_xlat3_;
        local = _e632;
    }
    let _e634 = local;
    u_xlat6_ = _e634;
    let _e635 = u_xlat8_;
    let _e636 = u_xlat6_;
    u_xlat7_ = (_e635 * _e636);
    let _e638 = u_xlat7_;
    let _e642 = _f_buffer1_.f_cb1_[7];
    let _e645 = u_xlat6_;
    u_xlat6_ = ((_e638 * _e642.yyyy) + _e645);
    let _e647 = u_xlat8_;
    let _e651 = _f_buffer1_.f_cb1_[7];
    let _e654 = u_xlat6_;
    u_xlat6_ = ((_e647 * _e651.xxxx) + _e654);
    let _e656 = u_xlat6_;
    u_xlat7_ = (-(_e656) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e664 = u_xlat7_;
    let _e665 = u_xlat7_;
    u_xlat7_ = (_e664 + _e665);
    let _e667 = u_xlat7_;
    let _e669 = u_xlat5_;
    u_xlat5_ = ((-(_e667) * _e669) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e677 = u_xlat6_;
    let _e678 = u_xlat6_;
    u_xlat7_ = (_e677 + _e678);
    let _e680 = u_xlat7_;
    let _e682 = u_xlat8_;
    let _e684 = u_xlat5_;
    u_xlat5_ = ((-(_e680) * _e682) + _e684);
    let _e686 = u_xlat8_;
    let _e687 = u_xlat7_;
    u_xlat8_ = (_e686 * _e687);
    let _e689 = u_xlat7_;
    u_xlat7_ = floor(_e689);
    let _e691 = u_xlat7_;
    u_xlat7_ = min(_e691, vec4<f32>(1f, 1f, 1f, 1f));
    let _e698 = u_xlat7_;
    let _e699 = u_xlat5_;
    let _e701 = u_xlat8_;
    u_xlat5_ = ((_e698 * _e699) + _e701);
    let _e703 = u_xlat3_;
    let _e705 = u_xlat5_;
    u_xlat5_ = (-(_e703) + _e705);
    let _e710 = _f_buffer1_.f_cb1_[7];
    let _e712 = u_xlat5_;
    let _e714 = u_xlat3_;
    u_xlat5_ = ((_e710.zzzz * _e712) + _e714);
    let _e716 = u_xlatb0_;
    if _e716.y {
        let _e718 = u_xlat5_;
        local_1 = _e718;
    } else {
        let _e719 = u_xlat6_;
        local_1 = _e719;
    }
    let _e721 = local_1;
    u_xlat5_ = _e721;
    let _e722 = u_xlat3_;
    let _e724 = u_xlat5_;
    u_xlat5_ = (-(_e722) + _e724);
    let _e726 = u_xlat1_;
    let _e728 = u_xlat5_;
    let _e730 = u_xlat3_;
    u_xlat1_ = ((_e726.xxxx * _e728) + _e730);
    let _e735 = _f_buffer1_.f_cb1_[15];
    let _e740 = _f_buffer1_.f_cb1_[15];
    u_xlat3_ = (_e735.wwww * _e740);
    let _e742 = u_xlat4_;
    let _e743 = u_xlat3_;
    let _e745 = u_xlat1_;
    u_xlat5_ = ((_e742 * _e743) + -(_e745));
    let _e748 = u_xlat3_;
    let _e749 = u_xlat4_;
    u_xlat6_ = (_e748 * _e749);
    let _e751 = u_xlat4_;
    let _e753 = u_xlat3_;
    u_xlat3_ = ((-(_e751) * _e753) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e762 = u_xlat6_;
    let _e767 = _f_buffer1_.f_cb1_[19];
    u_xlat0_.x = (_e762.w * _e767.w);
    let _e771 = u_xlat0_;
    u_xlat0_.x = clamp(_e771.x, 0f, 1f);
    let _e776 = u_xlat0_;
    let _e778 = u_xlat5_;
    let _e780 = u_xlat1_;
    u_xlat4_ = ((_e776.xxxx * _e778) + _e780);
    let _e782 = u_xlatb0_;
    let _e792 = _f_buffer1_.f_cb1_[19];
    let _e795 = (vec4<f32>(0f, 0f, 0f, 0f) < _e792.wzww).xy;
    u_xlatb0_.x = _e795.x;
    u_xlatb0_.y = _e795.y;
    let _e800 = u_xlatb0_;
    if _e800.x {
        let _e802 = u_xlat4_;
        local_2 = _e802;
    } else {
        let _e803 = u_xlat1_;
        local_2 = _e803;
    }
    let _e805 = local_2;
    u_xlat4_ = _e805;
    let _e806 = u_xlat6_;
    let _e807 = u_xlat4_;
    u_xlat5_ = (_e806 * _e807);
    let _e809 = u_xlat5_;
    let _e813 = _f_buffer1_.f_cb1_[19];
    let _e816 = u_xlat4_;
    u_xlat4_ = ((_e809 * _e813.yyyy) + _e816);
    let _e818 = u_xlat6_;
    let _e822 = _f_buffer1_.f_cb1_[19];
    let _e825 = u_xlat4_;
    u_xlat4_ = ((_e818 * _e822.xxxx) + _e825);
    let _e827 = u_xlat4_;
    u_xlat5_ = (-(_e827) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e835 = u_xlat5_;
    let _e836 = u_xlat5_;
    u_xlat5_ = (_e835 + _e836);
    let _e838 = u_xlat5_;
    let _e840 = u_xlat3_;
    u_xlat3_ = ((-(_e838) * _e840) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e848 = u_xlat4_;
    let _e849 = u_xlat4_;
    u_xlat5_ = (_e848 + _e849);
    let _e851 = u_xlat5_;
    let _e853 = u_xlat6_;
    let _e855 = u_xlat3_;
    u_xlat3_ = ((-(_e851) * _e853) + _e855);
    let _e857 = u_xlat6_;
    let _e858 = u_xlat5_;
    u_xlat6_ = (_e857 * _e858);
    let _e860 = u_xlat5_;
    u_xlat5_ = floor(_e860);
    let _e862 = u_xlat5_;
    u_xlat5_ = min(_e862, vec4<f32>(1f, 1f, 1f, 1f));
    let _e869 = u_xlat5_;
    let _e870 = u_xlat3_;
    let _e872 = u_xlat6_;
    u_xlat3_ = ((_e869 * _e870) + _e872);
    let _e874 = u_xlat1_;
    let _e876 = u_xlat3_;
    u_xlat3_ = (-(_e874) + _e876);
    let _e881 = _f_buffer1_.f_cb1_[19];
    let _e883 = u_xlat3_;
    let _e885 = u_xlat1_;
    u_xlat3_ = ((_e881.zzzz * _e883) + _e885);
    let _e887 = u_xlatb0_;
    if _e887.y {
        let _e889 = u_xlat3_;
        local_3 = _e889;
    } else {
        let _e890 = u_xlat4_;
        local_3 = _e890;
    }
    let _e892 = local_3;
    u_xlat3_ = _e892;
    let _e893 = u_xlat1_;
    let _e895 = u_xlat3_;
    u_xlat3_ = (-(_e893) + _e895);
    let _e897 = u_xlat27_;
    let _e899 = u_xlat3_;
    let _e901 = u_xlat1_;
    u_xlat1_ = ((vec4(_e897) * _e899) + _e901);
    let _e906 = _f_buffer1_.f_cb1_[28];
    let _e911 = _f_buffer1_.f_cb1_[28];
    u_xlat3_ = (_e906.wwww * _e911);
    let _e913 = u_xlat2_;
    let _e914 = u_xlat3_;
    let _e916 = u_xlat1_;
    u_xlat4_ = ((_e913 * _e914) + -(_e916));
    let _e919 = u_xlat2_;
    let _e920 = u_xlat3_;
    u_xlat5_ = (_e919 * _e920);
    let _e922 = u_xlat2_;
    let _e924 = u_xlat3_;
    u_xlat2_ = ((-(_e922) * _e924) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e933 = u_xlat5_;
    let _e938 = _f_buffer1_.f_cb1_[32];
    u_xlat0_.x = (_e933.w * _e938.w);
    let _e942 = u_xlat0_;
    u_xlat0_.x = clamp(_e942.x, 0f, 1f);
    let _e947 = u_xlat0_;
    let _e949 = u_xlat4_;
    let _e951 = u_xlat1_;
    u_xlat3_ = ((_e947.xxxx * _e949) + _e951);
    let _e953 = u_xlatb0_;
    let _e963 = _f_buffer1_.f_cb1_[32];
    let _e966 = (vec4<f32>(0f, 0f, 0f, 0f) < _e963.wzww).xy;
    u_xlatb0_.x = _e966.x;
    u_xlatb0_.y = _e966.y;
    let _e971 = u_xlatb0_;
    if _e971.x {
        let _e973 = u_xlat3_;
        local_4 = _e973;
    } else {
        let _e974 = u_xlat1_;
        local_4 = _e974;
    }
    let _e976 = local_4;
    u_xlat3_ = _e976;
    let _e977 = u_xlat5_;
    let _e978 = u_xlat3_;
    u_xlat4_ = (_e977 * _e978);
    let _e980 = u_xlat4_;
    let _e984 = _f_buffer1_.f_cb1_[32];
    let _e987 = u_xlat3_;
    u_xlat3_ = ((_e980 * _e984.yyyy) + _e987);
    let _e989 = u_xlat5_;
    let _e993 = _f_buffer1_.f_cb1_[32];
    let _e996 = u_xlat3_;
    u_xlat3_ = ((_e989 * _e993.xxxx) + _e996);
    let _e998 = u_xlat3_;
    u_xlat4_ = (-(_e998) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1006 = u_xlat4_;
    let _e1007 = u_xlat4_;
    u_xlat4_ = (_e1006 + _e1007);
    let _e1009 = u_xlat4_;
    let _e1011 = u_xlat2_;
    u_xlat2_ = ((-(_e1009) * _e1011) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e1019 = u_xlat3_;
    let _e1020 = u_xlat3_;
    u_xlat4_ = (_e1019 + _e1020);
    let _e1022 = u_xlat4_;
    let _e1024 = u_xlat5_;
    let _e1026 = u_xlat2_;
    u_xlat2_ = ((-(_e1022) * _e1024) + _e1026);
    let _e1028 = u_xlat5_;
    let _e1029 = u_xlat4_;
    u_xlat5_ = (_e1028 * _e1029);
    let _e1031 = u_xlat4_;
    u_xlat4_ = floor(_e1031);
    let _e1033 = u_xlat4_;
    u_xlat4_ = min(_e1033, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1040 = u_xlat4_;
    let _e1041 = u_xlat2_;
    let _e1043 = u_xlat5_;
    u_xlat2_ = ((_e1040 * _e1041) + _e1043);
    let _e1045 = u_xlat1_;
    let _e1047 = u_xlat2_;
    u_xlat2_ = (-(_e1045) + _e1047);
    let _e1052 = _f_buffer1_.f_cb1_[32];
    let _e1054 = u_xlat2_;
    let _e1056 = u_xlat1_;
    u_xlat2_ = ((_e1052.zzzz * _e1054) + _e1056);
    let _e1058 = u_xlatb0_;
    if _e1058.y {
        let _e1060 = u_xlat2_;
        local_5 = _e1060;
    } else {
        let _e1061 = u_xlat3_;
        local_5 = _e1061;
    }
    let _e1063 = local_5;
    u_xlat2_ = _e1063;
    let _e1064 = u_xlat1_;
    let _e1066 = u_xlat2_;
    u_xlat2_ = (-(_e1064) + _e1066);
    let _e1068 = u_xlat18_;
    let _e1070 = u_xlat2_;
    let _e1072 = u_xlat1_;
    u_xlat0_ = ((_e1068.xxxx * _e1070) + _e1072);
    let _e1074 = u_xlat0_;
    u_xlat0_ = clamp(_e1074, vec4(0f), vec4(1f));
    let _e1080 = u_xlat0_;
    let _e1081 = vs_COLOR0_1;
    u_xlat1_ = (_e1080 * _e1081);
    let _e1083 = u_xlat0_;
    let _e1084 = u_xlat1_;
    SV_Target0_ = min(_e1083, _e1084);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e52 = SV_Target0_;
    return FragmentOutput(_e52);
}
