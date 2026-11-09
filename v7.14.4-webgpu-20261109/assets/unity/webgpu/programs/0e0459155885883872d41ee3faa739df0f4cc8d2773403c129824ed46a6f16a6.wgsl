struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 32>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat7_: f32 = 0f;
    var u_xlat8_: f32 = 0f;
    var u_xlat13_: f32 = 0f;
    var u_xlatb18_: bool = false;
    var local: vec3<f32>;
    var local_1: vec2<f32>;

    let _e69 = vs_TEXCOORD2_1;
    let _e74 = _f_buffer0_.f_cb0_[4];
    let _e79 = hscard_bias.values[4];
    let _e82 = textureSampleBias(f_t4_, samplerf_s4_, _e69.xy, (_e74.x + _e79.x));
    u_xlat0_ = _e82;
    let _e87 = _f_buffer1_.f_cb1_[5];
    u_xlatb18_ = (1f < _e87.x);
    let _e90 = u_xlat0_;
    let _e92 = u_xlatb18_;
    if bool(_e92) {
        let _e94 = u_xlat0_;
        local = _e94.xyz;
    } else {
        local = vec3<f32>(1f, 1f, 1f);
    }
    let _e101 = local;
    u_xlat0_.x = _e101.x;
    u_xlat0_.y = _e101.y;
    u_xlat0_.z = _e101.z;
    let _e109 = u_xlat0_;
    let _e114 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = (_e109.x * _e114.w);
    let _e118 = u_xlat0_;
    let _e123 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.y = (_e118.y * _e123.x);
    let _e126 = u_xlat0_;
    let _e128 = u_xlat1_;
    let _e130 = vs_TEXCOORD5_1;
    let _e132 = (_e128.xy + _e130.xy);
    u_xlat0_.x = _e132.x;
    u_xlat0_.y = _e132.y;
    let _e137 = u_xlat0_;
    let _e139 = u_xlatb18_;
    if bool(_e139) {
        let _e141 = u_xlat0_;
        local_1 = _e141.xy;
    } else {
        let _e143 = vs_TEXCOORD2_1;
        local_1 = _e143.xy;
    }
    let _e146 = local_1;
    u_xlat0_.x = _e146.x;
    u_xlat0_.y = _e146.y;
    let _e151 = u_xlat0_;
    let _e156 = _f_buffer0_.f_cb0_[4];
    let _e161 = hscard_bias.values[3];
    let _e164 = textureSampleBias(f_t3_, samplerf_s3_, _e151.xy, (_e156.x + _e161.x));
    u_xlat1_ = _e164;
    let _e165 = u_xlat1_;
    let _e170 = _f_buffer1_.f_cb1_[1];
    u_xlat1_ = (-(_e165) + _e170.yyyy);
    let _e173 = u_xlat0_;
    let _e175 = u_xlat1_;
    u_xlat0_ = (_e173.zzzz * abs(_e175));
    let _e179 = u_xlat1_;
    u_xlat1_.x = (abs(_e179.x) + -0.5f);
    let _e185 = u_xlat2_;
    let _e187 = u_xlat0_;
    let _e188 = _e187.xyz;
    u_xlat2_.x = _e188.x;
    u_xlat2_.y = _e188.y;
    u_xlat2_.z = _e188.z;
    let _e199 = _f_buffer1_.f_cb1_[0];
    u_xlat2_.w = _e199.w;
    let _e201 = u_xlat2_;
    let _e205 = _f_buffer1_.f_cb1_[0];
    u_xlat2_ = (_e201 * _e205);
    let _e211 = _f_buffer1_.f_cb1_[0];
    u_xlat0_.x = _e211.w;
    let _e213 = u_xlat0_;
    let _e215 = u_xlat2_;
    u_xlat0_ = (_e213.xxxw * _e215);
    let _e217 = u_xlat0_;
    let _e221 = _f_buffer1_.f_cb1_[1];
    u_xlat0_ = (_e217 * _e221.xxxx);
    let _e224 = vs_TEXCOORD0_1;
    let _e229 = _f_buffer0_.f_cb0_[4];
    let _e234 = hscard_bias.values[2];
    let _e237 = textureSampleBias(f_t2_, samplerf_s2_, _e224.xy, (_e229.x + _e234.x));
    u_xlat2_ = _e237;
    let _e238 = u_xlat0_;
    let _e239 = u_xlat2_;
    u_xlat0_ = (_e238 * _e239.xxxx);
    let _e246 = _f_buffer1_.f_cb1_[9];
    u_xlat3_.w = _e246.w;
    let _e248 = vs_TEXCOORD4_1;
    let _e253 = _f_buffer0_.f_cb0_[4];
    let _e258 = hscard_bias.values[5];
    let _e261 = textureSampleBias(f_t5_, samplerf_s5_, _e248.xy, (_e253.x + _e258.x));
    u_xlat4_ = _e261;
    let _e262 = u_xlat4_;
    let _e267 = _f_buffer1_.f_cb1_[10];
    u_xlat4_ = (-(_e262) + _e267.yyyy);
    let _e270 = u_xlat3_;
    let _e272 = u_xlat4_;
    let _e274 = abs(_e272.xyz);
    u_xlat3_.x = _e274.x;
    u_xlat3_.y = _e274.y;
    u_xlat3_.z = _e274.z;
    let _e281 = u_xlat3_;
    let _e285 = _f_buffer1_.f_cb1_[9];
    u_xlat5_ = (_e281 * _e285);
    let _e291 = _f_buffer1_.f_cb1_[9];
    u_xlat4_.x = _e291.w;
    let _e294 = u_xlat4_;
    u_xlat4_.w = abs(_e294.w);
    let _e298 = u_xlat3_;
    u_xlat1_.y = (_e298.x + -0.5f);
    let _e303 = u_xlat1_;
    let _e305 = u_xlat1_;
    let _e307 = u_xlat2_;
    let _e309 = (_e305.xy * _e307.xy);
    u_xlat1_.x = _e309.x;
    u_xlat1_.y = _e309.y;
    let _e314 = u_xlat1_;
    let _e319 = _f_buffer1_.f_cb1_[10];
    u_xlat7_ = (_e314.y * _e319.w);
    let _e322 = u_xlat4_;
    let _e324 = u_xlat5_;
    u_xlat3_ = (_e322.xxxw * _e324);
    let _e326 = u_xlat3_;
    let _e330 = _f_buffer1_.f_cb1_[10];
    u_xlat3_ = (_e326 * _e330.xxxx);
    let _e333 = u_xlat2_;
    let _e335 = u_xlat3_;
    u_xlat3_ = (_e333.yyyy * _e335);
    let _e337 = u_xlat3_;
    let _e338 = vs_TEXCOORD3_1;
    u_xlat3_ = (_e337 * _e338.yyyy);
    let _e341 = u_xlat0_;
    let _e342 = vs_TEXCOORD3_1;
    let _e345 = u_xlat3_;
    u_xlat4_ = ((_e341 * _e342.xxxx) + _e345);
    let _e347 = u_xlat0_;
    let _e348 = vs_TEXCOORD3_1;
    u_xlat0_ = (_e347 * _e348.xxxx);
    let _e351 = u_xlat4_;
    u_xlat4_ = (_e351 * vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
    let _e358 = u_xlat0_;
    let _e359 = u_xlat3_;
    let _e361 = u_xlat4_;
    u_xlat0_ = ((_e358 * _e359) + -(_e361));
    let _e367 = _f_buffer1_.f_cb1_[10];
    let _e369 = u_xlat0_;
    let _e371 = u_xlat4_;
    u_xlat0_ = ((_e367.zzzz * _e369) + _e371);
    let _e373 = vs_TEXCOORD4_1;
    let _e378 = _f_buffer0_.f_cb0_[4];
    let _e383 = hscard_bias.values[6];
    let _e386 = textureSampleBias(f_t6_, samplerf_s6_, _e373.zw, (_e378.x + _e383.x));
    u_xlat3_ = _e386;
    let _e387 = u_xlat3_;
    let _e392 = _f_buffer1_.f_cb1_[17];
    u_xlat3_ = (-(_e387) + _e392.zzzz);
    let _e395 = u_xlat3_;
    u_xlat13_ = (abs(_e395.x) + -0.5f);
    let _e401 = u_xlat3_;
    let _e406 = _f_buffer1_.f_cb1_[16];
    u_xlat3_ = (abs(_e401) * _e406);
    let _e408 = u_xlat2_;
    let _e410 = u_xlat13_;
    u_xlat13_ = (_e408.z * _e410);
    let _e412 = u_xlat13_;
    let _e416 = _f_buffer1_.f_cb1_[18];
    let _e419 = u_xlat7_;
    u_xlat7_ = ((_e412 * _e416.x) + _e419);
    let _e422 = u_xlat1_;
    let _e427 = _f_buffer1_.f_cb1_[1];
    let _e430 = u_xlat7_;
    u_xlat1_.x = ((_e422.x * _e427.z) + _e430);
    let _e432 = u_xlat1_;
    let _e437 = _f_buffer1_.f_cb1_[31];
    let _e439 = u_xlat1_;
    let _e442 = vs_TEXCOORD0_1;
    let _e444 = ((_e437.zw * _e439.xx) + _e442.xy);
    u_xlat1_.x = _e444.x;
    u_xlat1_.y = _e444.y;
    let _e449 = u_xlat1_;
    let _e454 = _f_buffer0_.f_cb0_[4];
    let _e459 = hscard_bias.values[0];
    let _e462 = textureSampleBias(f_t0_, samplerf_s0_, _e449.xy, (_e454.x + _e459.x));
    u_xlat1_ = _e462;
    let _e463 = u_xlat0_;
    let _e464 = u_xlat1_;
    u_xlat0_ = (_e463 + _e464);
    let _e469 = _f_buffer1_.f_cb1_[30];
    let _e474 = _f_buffer1_.f_cb1_[31];
    let _e477 = u_xlat0_;
    u_xlat0_ = ((_e469.wwww * _e474.xxxx) + _e477);
    let _e479 = u_xlat1_;
    let _e481 = u_xlat0_;
    u_xlat0_ = (-(_e479) + _e481);
    let _e484 = u_xlat2_;
    let _e486 = u_xlat2_;
    u_xlat2_.x = (_e484.y + _e486.x);
    let _e490 = u_xlat2_;
    u_xlat2_.x = clamp(_e490.x, 0f, 1f);
    let _e495 = u_xlat2_;
    let _e497 = u_xlat0_;
    let _e499 = u_xlat1_;
    u_xlat0_ = ((_e495.xxxx * _e497) + _e499);
    let _e501 = u_xlat3_;
    let _e505 = _f_buffer1_.f_cb1_[17];
    let _e508 = u_xlat0_;
    u_xlat1_ = ((_e501 * _e505.yyyy) + -(_e508));
    let _e512 = u_xlat2_;
    let _e514 = u_xlat3_;
    u_xlat2_.x = (_e512.z * _e514.w);
    let _e517 = u_xlat2_;
    let _e519 = u_xlat2_;
    let _e521 = vs_TEXCOORD3_1;
    let _e523 = (_e519.xw * _e521.zw);
    u_xlat2_.x = _e523.x;
    u_xlat2_.y = _e523.y;
    let _e528 = u_xlat2_;
    let _e533 = _f_buffer1_.f_cb1_[26];
    u_xlat8_ = (_e528.y * _e533.x);
    let _e537 = u_xlat2_;
    let _e542 = _f_buffer1_.f_cb1_[17];
    u_xlat2_.x = (_e537.x * _e542.x);
    let _e545 = u_xlat2_;
    let _e547 = u_xlat1_;
    let _e549 = u_xlat0_;
    u_xlat0_ = ((_e545.xxxx * _e547) + _e549);
    let _e551 = vs_TEXCOORD2_1;
    let _e556 = _f_buffer0_.f_cb0_[4];
    let _e561 = hscard_bias.values[7];
    let _e564 = textureSampleBias(f_t7_, samplerf_s7_, _e551.zw, (_e556.x + _e561.x));
    u_xlat1_ = _e564;
    let _e565 = u_xlat1_;
    let _e569 = _f_buffer1_.f_cb1_[25];
    u_xlat1_ = (_e565 * _e569);
    let _e571 = u_xlat1_;
    let _e575 = _f_buffer1_.f_cb1_[26];
    let _e578 = u_xlat0_;
    u_xlat3_ = ((_e571 * _e575.yyyy) + -(_e578));
    let _e581 = u_xlat1_;
    let _e583 = u_xlat3_;
    let _e585 = u_xlat0_;
    u_xlat3_ = ((_e581.wwww * _e583) + _e585);
    let _e587 = u_xlat3_;
    u_xlat3_ = clamp(_e587, vec4(0f), vec4(1f));
    let _e593 = u_xlat1_;
    let _e597 = _f_buffer1_.f_cb1_[26];
    let _e600 = u_xlat0_;
    u_xlat1_ = ((_e593 * _e597.yyyy) + _e600);
    let _e602 = u_xlat0_;
    u_xlat0_ = _e602;
    let _e603 = u_xlat0_;
    u_xlat0_ = clamp(_e603, vec4(0f), vec4(1f));
    let _e609 = u_xlat1_;
    let _e611 = u_xlat3_;
    u_xlat3_ = (-(_e609) + _e611);
    let _e616 = _f_buffer1_.f_cb1_[24];
    let _e618 = u_xlat3_;
    let _e620 = u_xlat1_;
    u_xlat1_ = ((_e616.yyyy * _e618) + _e620);
    let _e622 = u_xlat0_;
    let _e624 = u_xlat1_;
    u_xlat1_ = (-(_e622) + _e624);
    let _e626 = u_xlat8_;
    let _e628 = u_xlat1_;
    let _e630 = u_xlat0_;
    u_xlat0_ = ((vec4(_e626) * _e628) + _e630);
    let _e632 = u_xlat0_;
    u_xlat1_ = (_e632 + vec4<f32>(0.15f, 0.15f, 0.15f, 0.15f));
    let _e639 = u_xlat1_;
    let _e640 = vs_COLOR0_1;
    u_xlat1_ = (_e639 * _e640);
    let _e642 = u_xlat0_;
    let _e643 = u_xlat1_;
    u_xlat0_ = min(_e642, _e643);
    let _e645 = vs_TEXCOORD1_1;
    let _e650 = _f_buffer0_.f_cb0_[4];
    let _e655 = hscard_bias.values[1];
    let _e658 = textureSampleBias(f_t1_, samplerf_s1_, _e645.xy, (_e650.x + _e655.x));
    u_xlat1_ = _e658;
    let _e659 = u_xlat0_;
    let _e660 = u_xlat1_;
    SV_TARGET0_ = (_e659 * _e660);
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
    let _e72 = SV_TARGET0_;
    return FragmentOutput(_e72);
}
