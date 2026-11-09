struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 16>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 13>,
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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat13_: f32 = 0f;

    let _e55 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = (_e55.y * 0.5f);
    let _e60 = u_xlat0_;
    u_xlat0_.x = fract(_e60.x);
    let _e63 = vs_TEXCOORD0_1;
    let _e68 = _f_buffer0_.f_cb0_[4];
    let _e73 = hscard_bias.values[1];
    let _e76 = textureSampleBias(f_t1_, samplerf_s1_, _e63.zw, (_e68.x + _e73.x));
    u_xlat1_ = _e76;
    let _e77 = u_xlat4_;
    let _e79 = u_xlat1_;
    let _e90 = ((_e79.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e90.x;
    u_xlat4_.y = _e90.y;
    let _e95 = u_xlat4_;
    let _e97 = u_xlat4_;
    let _e102 = _f_buffer1_.f_cb1_[5];
    let _e104 = (_e97.xy * _e102.zw);
    u_xlat4_.x = _e104.x;
    u_xlat4_.y = _e104.y;
    let _e109 = u_xlat0_;
    let _e111 = u_xlat0_;
    let _e113 = u_xlat4_;
    let _e115 = (_e111.xx * _e113.xy);
    u_xlat0_.x = _e115.x;
    u_xlat0_.w = _e115.y;
    let _e120 = u_xlat1_;
    let _e122 = vs_TEXCOORD0_1;
    let _e123 = _e122.xy;
    u_xlat1_.x = _e123.x;
    u_xlat1_.y = _e123.y;
    let _e128 = u_xlat1_;
    let _e130 = u_xlat1_;
    let _e136 = clamp(_e130.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e136.x;
    u_xlat1_.y = _e136.y;
    let _e141 = u_xlat1_;
    let _e143 = u_xlat1_;
    let _e145 = vs_TEXCOORD0_1;
    let _e148 = (_e143.xy + -(_e145.xy));
    u_xlat1_.x = _e148.x;
    u_xlat1_.y = _e148.y;
    let _e153 = u_xlat1_;
    let _e158 = _f_buffer1_.f_cb1_[3];
    let _e160 = u_xlat1_;
    let _e163 = vs_TEXCOORD0_1;
    let _e165 = ((_e158.zz * _e160.xy) + _e163.xy);
    u_xlat1_.x = _e165.x;
    u_xlat1_.y = _e165.y;
    let _e170 = u_xlat9_;
    let _e172 = u_xlat1_;
    let _e183 = ((_e172.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat9_.x = _e183.x;
    u_xlat9_.y = _e183.y;
    let _e188 = u_xlat9_;
    let _e190 = u_xlat9_;
    let _e197 = (-(abs(_e190.xy)) + vec2<f32>(1f, 1f));
    u_xlat9_.x = _e197.x;
    u_xlat9_.y = _e197.y;
    let _e202 = u_xlat9_;
    let _e204 = u_xlat9_;
    let _e209 = (_e204.xy * vec2<f32>(3f, 3f));
    u_xlat9_.x = _e209.x;
    u_xlat9_.y = _e209.y;
    let _e214 = u_xlat9_;
    let _e216 = u_xlat9_;
    let _e222 = clamp(_e216.xy, vec2(0f), vec2(1f));
    u_xlat9_.x = _e222.x;
    u_xlat9_.y = _e222.y;
    let _e227 = u_xlat9_;
    let _e229 = u_xlat9_;
    let _e236 = (_e229.xy + vec2<f32>(-1f, -1f));
    u_xlat9_.x = _e236.x;
    u_xlat9_.y = _e236.y;
    let _e241 = u_xlat9_;
    let _e246 = _f_buffer1_.f_cb1_[3];
    let _e248 = u_xlat9_;
    let _e254 = ((_e246.zz * _e248.xy) + vec2<f32>(1f, 1f));
    u_xlat9_.x = _e254.x;
    u_xlat9_.y = _e254.y;
    let _e259 = u_xlat0_;
    let _e261 = u_xlat0_;
    let _e263 = u_xlat9_;
    let _e266 = u_xlat1_;
    let _e268 = ((_e261.xw * _e263.xy) + _e266.xy);
    u_xlat0_.x = _e268.x;
    u_xlat0_.w = _e268.y;
    let _e273 = u_xlat0_;
    let _e278 = _f_buffer0_.f_cb0_[4];
    let _e283 = hscard_bias.values[0];
    let _e286 = textureSampleBias(f_t0_, samplerf_s0_, _e273.xw, (_e278.x + _e283.x));
    u_xlat2_ = _e286;
    let _e291 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = ((_e291.y * 0.5f) + 0.5f);
    let _e298 = u_xlat0_;
    u_xlat0_.x = fract(_e298.x);
    let _e301 = u_xlat4_;
    let _e303 = u_xlat0_;
    let _e305 = u_xlat4_;
    let _e307 = (_e303.xx * _e305.xy);
    u_xlat4_.x = _e307.x;
    u_xlat4_.y = _e307.y;
    let _e313 = u_xlat0_;
    u_xlat0_.x = (-(_e313.x) + 0.5f);
    let _e319 = u_xlat0_;
    let _e321 = u_xlat0_;
    u_xlat0_.x = (_e319.x + _e321.x);
    let _e324 = u_xlat4_;
    let _e326 = u_xlat4_;
    let _e328 = u_xlat9_;
    let _e331 = u_xlat1_;
    let _e333 = ((_e326.xy * _e328.xy) + _e331.xy);
    u_xlat4_.x = _e333.x;
    u_xlat4_.y = _e333.y;
    let _e338 = u_xlat4_;
    let _e343 = _f_buffer0_.f_cb0_[4];
    let _e348 = hscard_bias.values[0];
    let _e351 = textureSampleBias(f_t0_, samplerf_s0_, _e338.xy, (_e343.x + _e348.x));
    u_xlat1_ = _e351;
    let _e352 = u_xlat1_;
    let _e354 = u_xlat2_;
    u_xlat2_ = (-(_e352) + _e354);
    let _e356 = u_xlat0_;
    let _e359 = u_xlat2_;
    let _e361 = u_xlat1_;
    u_xlat0_ = ((abs(_e356.xxxx) * _e359) + _e361);
    let _e363 = u_xlat1_;
    let _e365 = u_xlat0_;
    let _e370 = _f_buffer1_.f_cb1_[2];
    let _e372 = (_e365.xyz + _e370.yyy);
    u_xlat1_.x = _e372.x;
    u_xlat1_.y = _e372.y;
    u_xlat1_.z = _e372.z;
    let _e379 = u_xlat0_;
    let _e384 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e379.w, _e384.y);
    let _e388 = u_xlat1_;
    let _e390 = u_xlat13_;
    let _e395 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e388.y * _e390) + -(_e395.w));
    let _e399 = u_xlat1_;
    let _e401 = u_xlat13_;
    let _e403 = u_xlat1_;
    let _e405 = (vec3(_e401) * _e403.xyz);
    u_xlat1_.x = _e405.x;
    u_xlat1_.y = _e405.y;
    u_xlat1_.z = _e405.z;
    let _e415 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e415.w) + 1f);
    let _e420 = u_xlat2_;
    let _e422 = u_xlat13_;
    u_xlat13_ = (_e420.x / _e422);
    let _e425 = u_xlat2_;
    u_xlat2_.x = (_e425.x * 5f);
    let _e430 = u_xlat2_;
    u_xlat2_.x = clamp(_e430.x, 0f, 1f);
    let _e435 = u_xlat6_;
    let _e440 = _f_buffer1_.f_cb1_[8];
    let _e445 = _f_buffer1_.f_cb1_[9];
    let _e448 = (_e440.yzw + -(_e445.xyz));
    u_xlat6_.x = _e448.x;
    u_xlat6_.y = _e448.y;
    u_xlat6_.z = _e448.z;
    let _e455 = u_xlat6_;
    let _e457 = u_xlat13_;
    let _e459 = u_xlat6_;
    let _e465 = _f_buffer1_.f_cb1_[9];
    let _e467 = ((vec3(_e457) * _e459.xyz) + _e465.xyz);
    u_xlat6_.x = _e467.x;
    u_xlat6_.y = _e467.y;
    u_xlat6_.z = _e467.z;
    let _e479 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e479.w);
    let _e482 = u_xlat13_;
    let _e483 = u_xlat1_;
    u_xlat13_ = (_e482 * _e483.y);
    let _e486 = u_xlat3_;
    let _e491 = _f_buffer1_.f_cb1_[9];
    let _e496 = _f_buffer1_.f_cb1_[10];
    let _e499 = (_e491.xyz + -(_e496.xyz));
    u_xlat3_.x = _e499.x;
    u_xlat3_.y = _e499.y;
    u_xlat3_.z = _e499.z;
    let _e506 = u_xlat3_;
    let _e508 = u_xlat13_;
    let _e510 = u_xlat3_;
    let _e516 = _f_buffer1_.f_cb1_[10];
    let _e518 = ((vec3(_e508) * _e510.xyz) + _e516.xyz);
    u_xlat3_.x = _e518.x;
    u_xlat3_.y = _e518.y;
    u_xlat3_.z = _e518.z;
    let _e525 = u_xlat6_;
    let _e527 = u_xlat6_;
    let _e529 = u_xlat3_;
    let _e532 = (_e527.xyz + -(_e529.xyz));
    u_xlat6_.x = _e532.x;
    u_xlat6_.y = _e532.y;
    u_xlat6_.z = _e532.z;
    let _e539 = u_xlat2_;
    let _e541 = u_xlat2_;
    let _e543 = u_xlat6_;
    let _e546 = u_xlat3_;
    let _e548 = ((_e541.xxx * _e543.xyz) + _e546.xyz);
    u_xlat2_.x = _e548.x;
    u_xlat2_.y = _e548.y;
    u_xlat2_.z = _e548.z;
    let _e555 = u_xlat1_;
    let _e557 = u_xlat1_;
    let _e559 = u_xlat2_;
    let _e561 = (_e557.xyz * _e559.xyz);
    u_xlat1_.x = _e561.x;
    u_xlat1_.y = _e561.y;
    u_xlat1_.z = _e561.z;
    let _e568 = u_xlat0_;
    let _e570 = u_xlat1_;
    let _e575 = _f_buffer1_.f_cb1_[2];
    let _e577 = (_e570.xyz * _e575.xxx);
    u_xlat0_.x = _e577.x;
    u_xlat0_.y = _e577.y;
    u_xlat0_.z = _e577.z;
    let _e585 = vs_TEXCOORD1_1;
    let _e589 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e585 + -(_e589.z));
    let _e594 = u_xlat1_;
    u_xlat1_.x = clamp(_e594.x, 0f, 1f);
    let _e600 = u_xlat1_;
    u_xlat1_.x = (_e600.x + -0.00001f);
    let _e605 = u_xlat0_;
    let _e607 = u_xlat1_;
    u_xlat5_ = (_e605.w + -(_e607.x));
    let _e612 = vs_TEXCOORD1_1;
    let _e616 = _f_buffer1_.f_cb1_[12];
    u_xlat9_.x = (_e612 + _e616.z);
    let _e620 = u_xlat9_;
    u_xlat9_.x = clamp(_e620.x, 0f, 1f);
    let _e626 = u_xlat1_;
    let _e629 = u_xlat9_;
    u_xlat1_.x = (-(_e626.x) + _e629.x);
    let _e635 = u_xlat1_;
    u_xlat1_.x = (1f / _e635.x);
    let _e639 = u_xlat1_;
    let _e641 = u_xlat5_;
    u_xlat1_.x = (_e639.x * _e641);
    let _e644 = u_xlat1_;
    u_xlat1_.x = clamp(_e644.x, 0f, 1f);
    let _e649 = u_xlat1_;
    u_xlat5_ = ((_e649.x * -2f) + 3f);
    let _e657 = u_xlat1_;
    let _e659 = u_xlat1_;
    u_xlat1_.x = (_e657.x * _e659.x);
    let _e663 = u_xlat1_;
    let _e665 = u_xlat5_;
    u_xlat1_.x = (_e663.x * _e665);
    let _e667 = u_xlat0_;
    let _e668 = u_xlat1_;
    u_xlat0_ = (_e667 * _e668.xxxx);
    let _e671 = u_xlat0_;
    let _e672 = vs_COLOR0_1;
    SV_Target0_ = (_e671 * _e672);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
