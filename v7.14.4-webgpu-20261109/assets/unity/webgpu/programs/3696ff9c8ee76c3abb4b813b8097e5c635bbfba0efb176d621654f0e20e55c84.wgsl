struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 40>,
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
var<private> vs_TEXCOORD2_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: vec2<bool> = vec2(false);
    var u_xlat1_: vec2<f32> = vec2(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat10_: f32 = 0f;
    var u_xlatb10_: vec3<bool> = vec3(false);
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlat19_: f32 = 0f;
    var u_xlat22_: vec2<f32> = vec2(0f);
    var u_xlat27_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e89 = u_xlat0_;
    let _e94 = _f_buffer1_.f_cb1_[17];
    let _e96 = vs_TEXCOORD2_1;
    let _e102 = _f_buffer1_.f_cb1_[17];
    let _e104 = ((_e94.zw * _e96.xx) + _e102.xy);
    u_xlat0_.x = _e104.x;
    u_xlat0_.y = _e104.y;
    let _e109 = u_xlat18_;
    let _e114 = _f_buffer1_.f_cb1_[26];
    let _e116 = vs_TEXCOORD2_1;
    let _e122 = _f_buffer1_.f_cb1_[26];
    let _e124 = ((_e114.zw * _e116.xx) + _e122.xy);
    u_xlat18_.x = _e124.x;
    u_xlat18_.y = _e124.y;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer1_.f_cb1_[26];
    let _e140 = _f_buffer1_.f_cb1_[27];
    let _e142 = (-(_e134.xy) + _e140.zw);
    u_xlat1_.x = _e142.x;
    u_xlat1_.y = _e142.y;
    let _e147 = vs_TEXCOORD0_1;
    let _e152 = _f_buffer0_.f_cb0_[4];
    let _e157 = hscard_bias.values[1];
    let _e160 = textureSampleBias(f_t1_, samplerf_s1_, _e147.xy, (_e152.x + _e157.x));
    u_xlat2_ = _e160;
    let _e161 = u_xlat2_;
    let _e165 = _f_buffer1_.f_cb1_[28];
    u_xlat19_ = dot(_e161, _e165);
    let _e167 = u_xlat19_;
    u_xlat19_ = min(_e167, 1f);
    let _e170 = vs_TEXCOORD1_1;
    let _e175 = _f_buffer0_.f_cb0_[4];
    let _e180 = hscard_bias.values[6];
    let _e183 = textureSampleBias(f_t6_, samplerf_s6_, _e170.zw, (_e175.x + _e180.x));
    u_xlat3_ = _e183;
    let _e184 = u_xlat19_;
    let _e185 = u_xlat3_;
    u_xlat19_ = (_e184 * _e185.w);
    let _e188 = u_xlat3_;
    let _e193 = _f_buffer1_.f_cb1_[34];
    u_xlat4_ = (_e188.xyxy * _e193);
    let _e195 = u_xlat5_;
    let _e197 = u_xlat4_;
    let _e199 = u_xlat19_;
    let _e202 = vs_TEXCOORD1_1;
    let _e204 = ((_e197.zw * vec2(_e199)) + _e202.xy);
    u_xlat5_.x = _e204.x;
    u_xlat5_.y = _e204.y;
    let _e209 = u_xlat19_;
    let _e211 = u_xlat4_;
    u_xlat4_ = (vec4(_e209) * _e211);
    let _e213 = u_xlat5_;
    let _e218 = _f_buffer0_.f_cb0_[4];
    let _e223 = hscard_bias.values[5];
    let _e226 = textureSampleBias(f_t5_, samplerf_s5_, _e213.xy, (_e218.x + _e223.x));
    u_xlat5_ = _e226;
    let _e227 = u_xlat5_;
    let _e229 = u_xlat1_;
    let _e232 = u_xlat5_;
    let _e234 = (-(_e229.xy) + _e232.xy);
    u_xlat5_.x = _e234.x;
    u_xlat5_.y = _e234.y;
    let _e239 = u_xlat1_;
    let _e241 = u_xlat5_;
    let _e246 = _f_buffer1_.f_cb1_[27];
    let _e249 = u_xlat1_;
    let _e251 = ((_e241.xy * _e246.xy) + _e249.xy);
    u_xlat1_.x = _e251.x;
    u_xlat1_.y = _e251.y;
    let _e256 = u_xlat18_;
    let _e258 = u_xlat18_;
    let _e260 = u_xlat1_;
    let _e262 = (_e258.xy + _e260.xy);
    u_xlat18_.x = _e262.x;
    u_xlat18_.y = _e262.y;
    let _e267 = u_xlat18_;
    let _e272 = _f_buffer0_.f_cb0_[4];
    let _e277 = hscard_bias.values[4];
    let _e280 = textureSampleBias(f_t4_, samplerf_s4_, _e267.xy, (_e272.x + _e277.x));
    u_xlat6_ = _e280;
    let _e282 = u_xlat5_;
    let _e284 = u_xlat6_;
    u_xlat6_.w = (_e282.z * _e284.w);
    let _e287 = u_xlat6_;
    let _e292 = _f_buffer1_.f_cb1_[25];
    u_xlat5_ = (_e287.xyxy * _e292);
    let _e295 = u_xlat2_;
    let _e299 = _f_buffer1_.f_cb1_[19];
    u_xlat18_.x = dot(_e295, _e299);
    let _e302 = u_xlat18_;
    u_xlat18_.x = min(_e302.x, 1f);
    let _e307 = u_xlat18_;
    let _e309 = u_xlat6_;
    u_xlat18_.x = (_e307.x * _e309.w);
    let _e312 = u_xlat5_;
    let _e313 = u_xlat18_;
    let _e316 = u_xlat4_;
    u_xlat4_ = ((_e312 * _e313.xxxx) + _e316);
    let _e318 = u_xlat1_;
    let _e320 = u_xlat4_;
    let _e322 = vs_TEXCOORD0_1;
    let _e324 = (_e320.zw + _e322.zw);
    u_xlat1_.x = _e324.x;
    u_xlat1_.y = _e324.y;
    let _e329 = u_xlat1_;
    let _e334 = _f_buffer0_.f_cb0_[4];
    let _e339 = hscard_bias.values[3];
    let _e342 = textureSampleBias(f_t3_, samplerf_s3_, _e329.xy, (_e334.x + _e339.x));
    u_xlat5_ = _e342;
    let _e343 = u_xlat1_;
    let _e348 = _f_buffer1_.f_cb1_[17];
    let _e354 = _f_buffer1_.f_cb1_[18];
    let _e356 = (-(_e348.xy) + _e354.zw);
    u_xlat1_.x = _e356.x;
    u_xlat1_.y = _e356.y;
    let _e361 = u_xlat22_;
    let _e363 = u_xlat1_;
    let _e366 = u_xlat5_;
    let _e368 = (-(_e363.xy) + _e366.xy);
    u_xlat22_.x = _e368.x;
    u_xlat22_.y = _e368.y;
    let _e373 = u_xlat1_;
    let _e375 = u_xlat22_;
    let _e380 = _f_buffer1_.f_cb1_[18];
    let _e383 = u_xlat1_;
    let _e385 = ((_e375.xy * _e380.xy) + _e383.xy);
    u_xlat1_.x = _e385.x;
    u_xlat1_.y = _e385.y;
    let _e390 = u_xlat0_;
    let _e392 = u_xlat0_;
    let _e394 = u_xlat1_;
    let _e396 = (_e392.xy + _e394.xy);
    u_xlat0_.x = _e396.x;
    u_xlat0_.y = _e396.y;
    let _e401 = u_xlat0_;
    let _e406 = _f_buffer0_.f_cb0_[4];
    let _e411 = hscard_bias.values[2];
    let _e414 = textureSampleBias(f_t2_, samplerf_s2_, _e401.xy, (_e406.x + _e411.x));
    u_xlat7_ = _e414;
    let _e415 = u_xlat0_;
    let _e417 = u_xlat7_;
    let _e422 = _f_buffer1_.f_cb1_[16];
    let _e424 = (_e417.xy * _e422.xy);
    u_xlat0_.x = _e424.x;
    u_xlat0_.y = _e424.y;
    let _e429 = u_xlat2_;
    let _e433 = _f_buffer1_.f_cb1_[10];
    u_xlat27_ = dot(_e429, _e433);
    let _e436 = u_xlat2_;
    let _e440 = _f_buffer1_.f_cb1_[39];
    u_xlat1_.x = dot(_e436, _e440);
    let _e443 = u_xlat1_;
    u_xlat1_.x = min(_e443.x, 1f);
    let _e448 = u_xlat1_;
    let _e450 = vs_TEXCOORD2_1;
    u_xlat1_.x = (_e448.x * _e450.y);
    let _e453 = u_xlat27_;
    u_xlat27_ = min(_e453, 1f);
    let _e457 = u_xlat5_;
    let _e459 = u_xlat7_;
    u_xlat7_.w = (_e457.z * _e459.w);
    let _e462 = u_xlat27_;
    let _e463 = u_xlat7_;
    u_xlat27_ = (_e462 * _e463.w);
    let _e466 = u_xlat0_;
    let _e468 = u_xlat0_;
    let _e470 = u_xlat27_;
    let _e473 = u_xlat4_;
    let _e475 = ((_e468.xy * vec2(_e470)) + _e473.xy);
    u_xlat0_.x = _e475.x;
    u_xlat0_.y = _e475.y;
    let _e480 = u_xlat0_;
    let _e482 = u_xlat0_;
    let _e484 = vs_TEXCOORD0_1;
    let _e486 = (_e482.xy + _e484.xy);
    u_xlat0_.x = _e486.x;
    u_xlat0_.y = _e486.y;
    let _e491 = u_xlat0_;
    let _e496 = _f_buffer0_.f_cb0_[4];
    let _e501 = hscard_bias.values[0];
    let _e504 = textureSampleBias(f_t0_, samplerf_s0_, _e491.xy, (_e496.x + _e501.x));
    u_xlat2_ = _e504;
    let _e508 = _f_buffer1_.f_cb1_[11];
    let _e513 = _f_buffer1_.f_cb1_[11];
    u_xlat4_ = (_e508.wwww * _e513);
    let _e515 = u_xlat7_;
    let _e516 = u_xlat4_;
    let _e518 = u_xlat2_;
    u_xlat5_ = ((_e515 * _e516) + -(_e518));
    let _e521 = u_xlat4_;
    let _e522 = u_xlat7_;
    u_xlat8_ = (_e521 * _e522);
    let _e524 = u_xlat7_;
    let _e526 = u_xlat4_;
    u_xlat4_ = ((-(_e524) * _e526) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e535 = u_xlat8_;
    let _e540 = _f_buffer1_.f_cb1_[15];
    u_xlat0_.x = (_e535.w * _e540.w);
    let _e544 = u_xlat0_;
    u_xlat0_.x = clamp(_e544.x, 0f, 1f);
    let _e549 = u_xlat0_;
    let _e551 = u_xlat5_;
    let _e553 = u_xlat2_;
    u_xlat5_ = ((_e549.xxxx * _e551) + _e553);
    let _e555 = u_xlatb0_;
    let _e565 = _f_buffer1_.f_cb1_[15];
    let _e568 = (vec4<f32>(0f, 0f, 0f, 0f) < _e565.wzww).xy;
    u_xlatb0_.x = _e568.x;
    u_xlatb0_.y = _e568.y;
    let _e573 = u_xlatb0_;
    if _e573.x {
        let _e575 = u_xlat5_;
        local = _e575;
    } else {
        let _e576 = u_xlat2_;
        local = _e576;
    }
    let _e578 = local;
    u_xlat5_ = _e578;
    let _e579 = u_xlat8_;
    let _e580 = u_xlat5_;
    u_xlat7_ = (_e579 * _e580);
    let _e582 = u_xlat7_;
    let _e586 = _f_buffer1_.f_cb1_[15];
    let _e589 = u_xlat5_;
    u_xlat5_ = ((_e582 * _e586.yyyy) + _e589);
    let _e591 = u_xlat8_;
    let _e595 = _f_buffer1_.f_cb1_[15];
    let _e598 = u_xlat5_;
    u_xlat5_ = ((_e591 * _e595.xxxx) + _e598);
    let _e600 = u_xlat5_;
    u_xlat7_ = (-(_e600) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e608 = u_xlat7_;
    let _e609 = u_xlat7_;
    u_xlat7_ = (_e608 + _e609);
    let _e611 = u_xlat7_;
    let _e613 = u_xlat4_;
    u_xlat4_ = ((-(_e611) * _e613) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e621 = u_xlat5_;
    let _e622 = u_xlat5_;
    u_xlat7_ = (_e621 + _e622);
    let _e624 = u_xlat7_;
    let _e626 = u_xlat8_;
    let _e628 = u_xlat4_;
    u_xlat4_ = ((-(_e624) * _e626) + _e628);
    let _e630 = u_xlat8_;
    let _e631 = u_xlat7_;
    u_xlat8_ = (_e630 * _e631);
    let _e633 = u_xlat7_;
    u_xlat7_ = floor(_e633);
    let _e635 = u_xlat7_;
    u_xlat7_ = min(_e635, vec4<f32>(1f, 1f, 1f, 1f));
    let _e642 = u_xlat7_;
    let _e643 = u_xlat4_;
    let _e645 = u_xlat8_;
    u_xlat4_ = ((_e642 * _e643) + _e645);
    let _e647 = u_xlat2_;
    let _e649 = u_xlat4_;
    u_xlat4_ = (-(_e647) + _e649);
    let _e654 = _f_buffer1_.f_cb1_[15];
    let _e656 = u_xlat4_;
    let _e658 = u_xlat2_;
    u_xlat4_ = ((_e654.zzzz * _e656) + _e658);
    let _e660 = u_xlatb0_;
    if _e660.y {
        let _e662 = u_xlat4_;
        local_1 = _e662;
    } else {
        let _e663 = u_xlat5_;
        local_1 = _e663;
    }
    let _e665 = local_1;
    u_xlat4_ = _e665;
    let _e666 = u_xlat2_;
    let _e668 = u_xlat4_;
    u_xlat4_ = (-(_e666) + _e668);
    let _e670 = u_xlat27_;
    let _e672 = u_xlat4_;
    let _e674 = u_xlat2_;
    u_xlat2_ = ((vec4(_e670) * _e672) + _e674);
    let _e676 = u_xlat18_;
    let _e681 = _f_buffer1_.f_cb1_[20];
    u_xlat4_ = (_e676.xxxx * _e681);
    let _e683 = u_xlat4_;
    let _e687 = _f_buffer1_.f_cb1_[20];
    u_xlat4_ = (_e683 * _e687.wwww);
    let _e690 = u_xlat6_;
    let _e691 = u_xlat4_;
    let _e693 = u_xlat2_;
    u_xlat5_ = ((_e690 * _e691) + -(_e693));
    let _e696 = u_xlat4_;
    let _e697 = u_xlat6_;
    u_xlat7_ = (_e696 * _e697);
    let _e699 = u_xlat6_;
    let _e701 = u_xlat4_;
    u_xlat4_ = ((-(_e699) * _e701) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e710 = u_xlat7_;
    let _e715 = _f_buffer1_.f_cb1_[24];
    u_xlat0_.x = (_e710.w * _e715.w);
    let _e719 = u_xlat0_;
    u_xlat0_.x = clamp(_e719.x, 0f, 1f);
    let _e724 = u_xlat0_;
    let _e726 = u_xlat5_;
    let _e728 = u_xlat2_;
    u_xlat5_ = ((_e724.xxxx * _e726) + _e728);
    let _e730 = u_xlatb0_;
    let _e740 = _f_buffer1_.f_cb1_[24];
    let _e743 = (vec4<f32>(0f, 0f, 0f, 0f) < _e740.wzww).xy;
    u_xlatb0_.x = _e743.x;
    u_xlatb0_.y = _e743.y;
    let _e748 = u_xlatb0_;
    if _e748.x {
        let _e750 = u_xlat5_;
        local_2 = _e750;
    } else {
        let _e751 = u_xlat2_;
        local_2 = _e751;
    }
    let _e753 = local_2;
    u_xlat5_ = _e753;
    let _e754 = u_xlat7_;
    let _e755 = u_xlat5_;
    u_xlat6_ = (_e754 * _e755);
    let _e757 = u_xlat6_;
    let _e761 = _f_buffer1_.f_cb1_[24];
    let _e764 = u_xlat5_;
    u_xlat5_ = ((_e757 * _e761.yyyy) + _e764);
    let _e766 = u_xlat7_;
    let _e770 = _f_buffer1_.f_cb1_[24];
    let _e773 = u_xlat5_;
    u_xlat5_ = ((_e766 * _e770.xxxx) + _e773);
    let _e775 = u_xlat5_;
    u_xlat6_ = (-(_e775) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e783 = u_xlat6_;
    let _e784 = u_xlat6_;
    u_xlat6_ = (_e783 + _e784);
    let _e786 = u_xlat6_;
    let _e788 = u_xlat4_;
    u_xlat4_ = ((-(_e786) * _e788) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e796 = u_xlat5_;
    let _e797 = u_xlat5_;
    u_xlat6_ = (_e796 + _e797);
    let _e799 = u_xlat6_;
    let _e801 = u_xlat7_;
    let _e803 = u_xlat4_;
    u_xlat4_ = ((-(_e799) * _e801) + _e803);
    let _e805 = u_xlat7_;
    let _e806 = u_xlat6_;
    u_xlat7_ = (_e805 * _e806);
    let _e808 = u_xlat6_;
    u_xlat6_ = floor(_e808);
    let _e810 = u_xlat6_;
    u_xlat6_ = min(_e810, vec4<f32>(1f, 1f, 1f, 1f));
    let _e817 = u_xlat6_;
    let _e818 = u_xlat4_;
    let _e820 = u_xlat7_;
    u_xlat4_ = ((_e817 * _e818) + _e820);
    let _e822 = u_xlat2_;
    let _e824 = u_xlat4_;
    u_xlat4_ = (-(_e822) + _e824);
    let _e829 = _f_buffer1_.f_cb1_[24];
    let _e831 = u_xlat4_;
    let _e833 = u_xlat2_;
    u_xlat4_ = ((_e829.zzzz * _e831) + _e833);
    let _e835 = u_xlatb0_;
    if _e835.y {
        let _e837 = u_xlat4_;
        local_3 = _e837;
    } else {
        let _e838 = u_xlat5_;
        local_3 = _e838;
    }
    let _e840 = local_3;
    u_xlat4_ = _e840;
    let _e841 = u_xlat2_;
    let _e843 = u_xlat4_;
    u_xlat4_ = (-(_e841) + _e843);
    let _e845 = u_xlat18_;
    let _e847 = u_xlat4_;
    let _e849 = u_xlat2_;
    u_xlat0_ = ((_e845.xxxx * _e847) + _e849);
    let _e851 = u_xlat19_;
    let _e856 = _f_buffer1_.f_cb1_[29];
    u_xlat2_ = (vec4(_e851) * _e856);
    let _e858 = u_xlat2_;
    let _e862 = _f_buffer1_.f_cb1_[29];
    u_xlat2_ = (_e858 * _e862.wwww);
    let _e865 = u_xlat3_;
    let _e866 = u_xlat2_;
    let _e868 = u_xlat0_;
    u_xlat4_ = ((_e865 * _e866) + -(_e868));
    let _e871 = u_xlat2_;
    let _e872 = u_xlat3_;
    u_xlat5_ = (_e871 * _e872);
    let _e874 = u_xlat3_;
    let _e876 = u_xlat2_;
    u_xlat2_ = ((-(_e874) * _e876) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e884 = u_xlat5_;
    let _e889 = _f_buffer1_.f_cb1_[33];
    u_xlat10_ = (_e884.w * _e889.w);
    let _e892 = u_xlat10_;
    u_xlat10_ = clamp(_e892, 0f, 1f);
    let _e896 = u_xlat10_;
    let _e898 = u_xlat4_;
    let _e900 = u_xlat0_;
    u_xlat3_ = ((vec4(_e896) * _e898) + _e900);
    let _e902 = u_xlatb10_;
    let _e912 = _f_buffer1_.f_cb1_[33];
    let _e915 = (vec4<f32>(0f, 0f, 0f, 0f) < _e912.wwzz).xz;
    u_xlatb10_.x = _e915.x;
    u_xlatb10_.z = _e915.y;
    let _e920 = u_xlatb10_;
    if _e920.x {
        let _e922 = u_xlat3_;
        local_4 = _e922;
    } else {
        let _e923 = u_xlat0_;
        local_4 = _e923;
    }
    let _e925 = local_4;
    u_xlat3_ = _e925;
    let _e926 = u_xlat5_;
    let _e927 = u_xlat3_;
    u_xlat4_ = (_e926 * _e927);
    let _e929 = u_xlat4_;
    let _e933 = _f_buffer1_.f_cb1_[33];
    let _e936 = u_xlat3_;
    u_xlat3_ = ((_e929 * _e933.yyyy) + _e936);
    let _e938 = u_xlat5_;
    let _e942 = _f_buffer1_.f_cb1_[33];
    let _e945 = u_xlat3_;
    u_xlat3_ = ((_e938 * _e942.xxxx) + _e945);
    let _e947 = u_xlat3_;
    u_xlat4_ = (-(_e947) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e955 = u_xlat4_;
    let _e956 = u_xlat4_;
    u_xlat4_ = (_e955 + _e956);
    let _e958 = u_xlat4_;
    let _e960 = u_xlat2_;
    u_xlat2_ = ((-(_e958) * _e960) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e968 = u_xlat3_;
    let _e969 = u_xlat3_;
    u_xlat4_ = (_e968 + _e969);
    let _e971 = u_xlat4_;
    let _e973 = u_xlat5_;
    let _e975 = u_xlat2_;
    u_xlat2_ = ((-(_e971) * _e973) + _e975);
    let _e977 = u_xlat5_;
    let _e978 = u_xlat4_;
    u_xlat5_ = (_e977 * _e978);
    let _e980 = u_xlat4_;
    u_xlat4_ = floor(_e980);
    let _e982 = u_xlat4_;
    u_xlat4_ = min(_e982, vec4<f32>(1f, 1f, 1f, 1f));
    let _e989 = u_xlat4_;
    let _e990 = u_xlat2_;
    let _e992 = u_xlat5_;
    u_xlat2_ = ((_e989 * _e990) + _e992);
    let _e994 = u_xlat0_;
    let _e996 = u_xlat2_;
    u_xlat2_ = (-(_e994) + _e996);
    let _e1001 = _f_buffer1_.f_cb1_[33];
    let _e1003 = u_xlat2_;
    let _e1005 = u_xlat0_;
    u_xlat2_ = ((_e1001.zzzz * _e1003) + _e1005);
    let _e1007 = u_xlatb10_;
    if _e1007.z {
        let _e1009 = u_xlat2_;
        local_5 = _e1009;
    } else {
        let _e1010 = u_xlat3_;
        local_5 = _e1010;
    }
    let _e1012 = local_5;
    u_xlat2_ = _e1012;
    let _e1013 = u_xlat0_;
    let _e1015 = u_xlat2_;
    u_xlat2_ = (-(_e1013) + _e1015);
    let _e1017 = u_xlat19_;
    let _e1019 = u_xlat2_;
    let _e1021 = u_xlat0_;
    u_xlat0_ = ((vec4(_e1017) * _e1019) + _e1021);
    let _e1023 = u_xlat0_;
    u_xlat0_ = clamp(_e1023, vec4(0f), vec4(1f));
    let _e1029 = u_xlat0_;
    u_xlat2_ = log2(_e1029);
    let _e1031 = u_xlat2_;
    let _e1035 = _f_buffer1_.f_cb1_[38];
    u_xlat2_ = (_e1031 * _e1035.zzzz);
    let _e1038 = u_xlat2_;
    u_xlat2_ = exp2(_e1038);
    let _e1040 = u_xlat1_;
    let _e1042 = u_xlat2_;
    let _e1044 = u_xlat0_;
    u_xlat0_ = ((_e1040.xxxx * _e1042) + _e1044);
    let _e1046 = u_xlat0_;
    let _e1047 = vs_COLOR0_1;
    SV_Target0_ = (_e1046 * _e1047);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e56 = SV_Target0_;
    return FragmentOutput(_e56);
}
