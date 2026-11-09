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
    var u_xlat13_: f32 = 0f;
    var local: vec3<f32>;
    var local_1: vec2<f32>;

    let _e70 = vs_TEXCOORD2_1;
    let _e75 = _f_buffer0_.f_cb0_[4];
    let _e80 = hscard_bias.values[4];
    let _e83 = textureSampleBias(f_t4_, samplerf_s4_, _e70.xy, (_e75.x + _e80.x));
    u_xlat0_ = _e83;
    let _e88 = _f_buffer1_.f_cb1_[8];
    u_xlatb12_ = (1f < _e88.x);
    let _e91 = u_xlat0_;
    let _e93 = u_xlatb12_;
    if bool(_e93) {
        let _e95 = u_xlat0_;
        local = _e95.xyz;
    } else {
        local = vec3<f32>(1f, 1f, 1f);
    }
    let _e102 = local;
    u_xlat0_.x = _e102.x;
    u_xlat0_.y = _e102.y;
    u_xlat0_.z = _e102.z;
    let _e110 = u_xlat0_;
    let _e115 = _f_buffer1_.f_cb1_[4];
    u_xlat1_.x = (_e110.x * _e115.w);
    let _e119 = u_xlat0_;
    let _e124 = _f_buffer1_.f_cb1_[5];
    u_xlat1_.y = (_e119.y * _e124.x);
    let _e127 = u_xlat0_;
    let _e129 = u_xlat1_;
    let _e131 = vs_TEXCOORD5_1;
    let _e133 = (_e129.xy + _e131.xy);
    u_xlat0_.x = _e133.x;
    u_xlat0_.y = _e133.y;
    let _e138 = u_xlat0_;
    let _e140 = u_xlatb12_;
    if bool(_e140) {
        let _e142 = u_xlat0_;
        local_1 = _e142.xy;
    } else {
        let _e144 = vs_TEXCOORD2_1;
        local_1 = _e144.xy;
    }
    let _e147 = local_1;
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    let _e152 = u_xlat0_;
    let _e157 = _f_buffer0_.f_cb0_[4];
    let _e162 = hscard_bias.values[3];
    let _e165 = textureSampleBias(f_t3_, samplerf_s3_, _e152.xy, (_e157.x + _e162.x));
    u_xlat1_ = _e165;
    let _e166 = u_xlat0_;
    let _e168 = u_xlat1_;
    let _e174 = _f_buffer1_.f_cb1_[4];
    let _e176 = (-(_e168.xyz) + _e174.yyy);
    u_xlat0_.x = _e176.x;
    u_xlat0_.y = _e176.y;
    u_xlat0_.w = _e176.z;
    let _e183 = u_xlat4_;
    let _e185 = u_xlat0_;
    let _e187 = u_xlat0_;
    let _e190 = (_e185.zzz * abs(_e187.xyw));
    u_xlat4_.x = _e190.x;
    u_xlat4_.y = _e190.y;
    u_xlat4_.z = _e190.z;
    let _e198 = u_xlat0_;
    u_xlat0_.x = (abs(_e198.x) + -0.5f);
    let _e204 = u_xlat4_;
    let _e206 = u_xlat4_;
    let _e211 = _f_buffer1_.f_cb1_[3];
    let _e213 = (_e206.xyz * _e211.xyz);
    u_xlat4_.x = _e213.x;
    u_xlat4_.y = _e213.y;
    u_xlat4_.z = _e213.z;
    let _e220 = u_xlat4_;
    let _e222 = u_xlat4_;
    let _e227 = _f_buffer1_.f_cb1_[3];
    let _e229 = (_e222.xyz * _e227.www);
    u_xlat4_.x = _e229.x;
    u_xlat4_.y = _e229.y;
    u_xlat4_.z = _e229.z;
    let _e236 = u_xlat0_;
    let _e238 = u_xlat4_;
    let _e243 = _f_buffer1_.f_cb1_[4];
    let _e245 = (_e238.xyz * _e243.xxx);
    u_xlat0_.y = _e245.x;
    u_xlat0_.z = _e245.y;
    u_xlat0_.w = _e245.z;
    let _e252 = vs_TEXCOORD0_1;
    let _e257 = _f_buffer0_.f_cb0_[4];
    let _e262 = hscard_bias.values[2];
    let _e265 = textureSampleBias(f_t2_, samplerf_s2_, _e252.xy, (_e257.x + _e262.x));
    u_xlat1_ = _e265;
    let _e266 = u_xlat0_;
    let _e267 = u_xlat1_;
    u_xlat0_ = (_e266 * _e267.xxxx);
    let _e270 = vs_TEXCOORD4_1;
    let _e275 = _f_buffer0_.f_cb0_[4];
    let _e280 = hscard_bias.values[5];
    let _e283 = textureSampleBias(f_t5_, samplerf_s5_, _e270.xy, (_e275.x + _e280.x));
    u_xlat2_ = _e283;
    let _e284 = u_xlat2_;
    let _e286 = u_xlat2_;
    let _e292 = _f_buffer1_.f_cb1_[13];
    let _e294 = (-(_e286.xyz) + _e292.yyy);
    u_xlat2_.x = _e294.x;
    u_xlat2_.y = _e294.y;
    u_xlat2_.z = _e294.z;
    let _e301 = u_xlat6_;
    let _e303 = u_xlat2_;
    let _e309 = _f_buffer1_.f_cb1_[12];
    let _e311 = (abs(_e303.xyz) * _e309.xyz);
    u_xlat6_.x = _e311.x;
    u_xlat6_.y = _e311.y;
    u_xlat6_.z = _e311.z;
    let _e318 = u_xlat2_;
    u_xlat13_ = (abs(_e318.x) + -0.5f);
    let _e324 = u_xlat1_;
    let _e326 = u_xlat13_;
    u_xlat13_ = (_e324.y * _e326);
    let _e328 = u_xlat13_;
    let _e332 = _f_buffer1_.f_cb1_[13];
    u_xlat13_ = (_e328 * _e332.w);
    let _e335 = u_xlat2_;
    let _e337 = u_xlat6_;
    let _e342 = _f_buffer1_.f_cb1_[12];
    let _e344 = (_e337.xyz * _e342.www);
    u_xlat2_.x = _e344.x;
    u_xlat2_.y = _e344.y;
    u_xlat2_.z = _e344.z;
    let _e351 = u_xlat2_;
    let _e353 = u_xlat2_;
    let _e358 = _f_buffer1_.f_cb1_[13];
    let _e360 = (_e353.xyz * _e358.xxx);
    u_xlat2_.x = _e360.x;
    u_xlat2_.y = _e360.y;
    u_xlat2_.z = _e360.z;
    let _e367 = u_xlat2_;
    let _e369 = u_xlat1_;
    let _e371 = u_xlat2_;
    let _e373 = (_e369.yyy * _e371.xyz);
    u_xlat2_.x = _e373.x;
    u_xlat2_.y = _e373.y;
    u_xlat2_.z = _e373.z;
    let _e380 = u_xlat2_;
    let _e382 = u_xlat2_;
    let _e384 = vs_TEXCOORD3_1;
    let _e386 = (_e382.xyz * _e384.yyy);
    u_xlat2_.x = _e386.x;
    u_xlat2_.y = _e386.y;
    u_xlat2_.z = _e386.z;
    let _e393 = u_xlat3_;
    let _e395 = u_xlat0_;
    let _e397 = vs_TEXCOORD3_1;
    let _e400 = u_xlat2_;
    let _e402 = ((_e395.yzw * _e397.xxx) + _e400.xyz);
    u_xlat3_.x = _e402.x;
    u_xlat3_.y = _e402.y;
    u_xlat3_.z = _e402.z;
    let _e409 = u_xlat4_;
    let _e411 = u_xlat0_;
    let _e413 = vs_TEXCOORD3_1;
    let _e415 = (_e411.yzw * _e413.xxx);
    u_xlat4_.x = _e415.x;
    u_xlat4_.y = _e415.y;
    u_xlat4_.z = _e415.z;
    let _e422 = u_xlat3_;
    let _e424 = u_xlat3_;
    let _e430 = (_e424.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat3_.x = _e430.x;
    u_xlat3_.y = _e430.y;
    u_xlat3_.z = _e430.z;
    let _e437 = u_xlat4_;
    let _e439 = u_xlat4_;
    let _e441 = u_xlat2_;
    let _e444 = u_xlat3_;
    let _e447 = ((_e439.xyz * _e441.xyz) + -(_e444.xyz));
    u_xlat4_.x = _e447.x;
    u_xlat4_.y = _e447.y;
    u_xlat4_.z = _e447.z;
    let _e454 = u_xlat4_;
    let _e459 = _f_buffer1_.f_cb1_[13];
    let _e461 = u_xlat4_;
    let _e464 = u_xlat3_;
    let _e466 = ((_e459.zzz * _e461.xyz) + _e464.xyz);
    u_xlat4_.x = _e466.x;
    u_xlat4_.y = _e466.y;
    u_xlat4_.z = _e466.z;
    let _e473 = vs_TEXCOORD4_1;
    let _e478 = _f_buffer0_.f_cb0_[4];
    let _e483 = hscard_bias.values[7];
    let _e486 = textureSampleBias(f_t7_, samplerf_s7_, _e473.zw, (_e478.x + _e483.x));
    u_xlat2_ = _e486;
    let _e487 = u_xlat2_;
    let _e489 = u_xlat2_;
    let _e494 = _f_buffer1_.f_cb1_[21];
    let _e497 = vs_TEXCOORD5_1;
    let _e499 = ((_e489.xy * _e494.yz) + _e497.zw);
    u_xlat2_.x = _e499.x;
    u_xlat2_.y = _e499.y;
    let _e504 = u_xlat2_;
    let _e509 = _f_buffer0_.f_cb0_[4];
    let _e514 = hscard_bias.values[6];
    let _e517 = textureSampleBias(f_t6_, samplerf_s6_, _e504.xy, (_e509.x + _e514.x));
    u_xlat3_ = _e517;
    let _e518 = u_xlat3_;
    let _e523 = _f_buffer1_.f_cb1_[20];
    u_xlat3_ = (-(_e518) + _e523.zzzz);
    let _e527 = u_xlat3_;
    u_xlat2_.x = (abs(_e527.x) + -0.5f);
    let _e533 = u_xlat2_;
    let _e535 = u_xlat3_;
    u_xlat3_ = (_e533.zzzz * abs(_e535));
    let _e538 = u_xlat3_;
    let _e542 = _f_buffer1_.f_cb1_[19];
    u_xlat3_ = (_e538 * _e542);
    let _e545 = u_xlat1_;
    let _e547 = u_xlat2_;
    u_xlat2_.x = (_e545.z * _e547.x);
    let _e550 = u_xlat2_;
    let _e555 = _f_buffer1_.f_cb1_[21];
    let _e558 = u_xlat13_;
    u_xlat13_ = ((_e550.x * _e555.x) + _e558);
    let _e561 = u_xlat0_;
    let _e566 = _f_buffer1_.f_cb1_[4];
    let _e569 = u_xlat13_;
    u_xlat0_.x = ((_e561.x * _e566.z) + _e569);
    let _e571 = u_xlat2_;
    let _e576 = _f_buffer1_.f_cb1_[34];
    let _e578 = u_xlat0_;
    let _e581 = vs_TEXCOORD0_1;
    let _e583 = ((_e576.zw * _e578.xx) + _e581.xy);
    u_xlat2_.x = _e583.x;
    u_xlat2_.y = _e583.y;
    let _e588 = u_xlat2_;
    let _e593 = _f_buffer0_.f_cb0_[4];
    let _e598 = hscard_bias.values[0];
    let _e601 = textureSampleBias(f_t0_, samplerf_s0_, _e588.xy, (_e593.x + _e598.x));
    u_xlat2_ = _e601;
    let _e602 = u_xlat0_;
    let _e604 = u_xlat4_;
    let _e606 = u_xlat2_;
    let _e608 = (_e604.xyz + _e606.xyz);
    u_xlat0_.x = _e608.x;
    u_xlat0_.y = _e608.y;
    u_xlat0_.z = _e608.z;
    let _e615 = u_xlat0_;
    let _e620 = _f_buffer1_.f_cb1_[33];
    let _e625 = _f_buffer1_.f_cb1_[34];
    let _e628 = u_xlat0_;
    let _e630 = ((_e620.www * _e625.xxx) + _e628.xyz);
    u_xlat0_.x = _e630.x;
    u_xlat0_.y = _e630.y;
    u_xlat0_.z = _e630.z;
    let _e637 = u_xlat0_;
    let _e639 = u_xlat2_;
    let _e642 = u_xlat0_;
    let _e644 = (-(_e639.xyz) + _e642.xyz);
    u_xlat0_.x = _e644.x;
    u_xlat0_.y = _e644.y;
    u_xlat0_.z = _e644.z;
    let _e651 = u_xlat1_;
    let _e653 = u_xlat1_;
    u_xlat12_ = (_e651.y + _e653.x);
    let _e656 = u_xlat12_;
    u_xlat12_ = clamp(_e656, 0f, 1f);
    let _e661 = u_xlat1_;
    let _e663 = u_xlat3_;
    u_xlat1_.x = (_e661.z * _e663.w);
    let _e667 = u_xlat1_;
    let _e669 = vs_TEXCOORD3_1;
    u_xlat1_.x = (_e667.x * _e669.z);
    let _e673 = u_xlat1_;
    let _e678 = _f_buffer1_.f_cb1_[20];
    u_xlat1_.x = (_e673.x * _e678.x);
    let _e681 = u_xlat0_;
    let _e683 = u_xlat12_;
    let _e685 = u_xlat0_;
    let _e688 = u_xlat2_;
    let _e690 = ((vec3(_e683) * _e685.xyz) + _e688.xyz);
    u_xlat0_.x = _e690.x;
    u_xlat0_.y = _e690.y;
    u_xlat0_.z = _e690.z;
    let _e697 = u_xlat5_;
    let _e699 = u_xlat3_;
    let _e704 = _f_buffer1_.f_cb1_[20];
    let _e707 = u_xlat0_;
    let _e710 = ((_e699.xyz * _e704.yyy) + -(_e707.xyz));
    u_xlat5_.x = _e710.x;
    u_xlat5_.y = _e710.y;
    u_xlat5_.z = _e710.z;
    let _e717 = u_xlat0_;
    let _e719 = u_xlat1_;
    let _e721 = u_xlat5_;
    let _e724 = u_xlat0_;
    let _e726 = ((_e719.xxx * _e721.xyz) + _e724.xyz);
    u_xlat0_.x = _e726.x;
    u_xlat0_.y = _e726.y;
    u_xlat0_.z = _e726.z;
    let _e733 = u_xlat0_;
    let _e735 = u_xlat0_;
    let _e741 = clamp(_e735.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e741.x;
    u_xlat0_.y = _e741.y;
    u_xlat0_.z = _e741.z;
    let _e748 = u_xlat1_;
    let _e750 = u_xlat0_;
    let _e756 = (_e750.xyz + vec3<f32>(0.15f, 0.15f, 0.15f));
    u_xlat1_.x = _e756.x;
    u_xlat1_.y = _e756.y;
    u_xlat1_.z = _e756.z;
    let _e763 = u_xlat1_;
    let _e765 = u_xlat1_;
    let _e767 = vs_COLOR0_1;
    let _e769 = (_e765.xyz * _e767.xyz);
    u_xlat1_.x = _e769.x;
    u_xlat1_.y = _e769.y;
    u_xlat1_.z = _e769.z;
    let _e776 = u_xlat0_;
    let _e778 = u_xlat0_;
    let _e780 = u_xlat1_;
    let _e782 = min(_e778.xyz, _e780.xyz);
    u_xlat0_.x = _e782.x;
    u_xlat0_.y = _e782.y;
    u_xlat0_.z = _e782.z;
    let _e789 = vs_TEXCOORD1_1;
    let _e794 = _f_buffer0_.f_cb0_[4];
    let _e799 = hscard_bias.values[1];
    let _e802 = textureSampleBias(f_t1_, samplerf_s1_, _e789.xy, (_e794.x + _e799.x));
    u_xlat1_ = _e802;
    let _e803 = SV_Target0_;
    let _e805 = u_xlat0_;
    let _e807 = u_xlat1_;
    let _e809 = (_e805.xyz * _e807.xyz);
    SV_Target0_.x = _e809.x;
    SV_Target0_.y = _e809.y;
    SV_Target0_.z = _e809.z;
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
