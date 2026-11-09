struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 26>,
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
    var u_xlat13_: vec2<f32> = vec2(0f);
    var u_xlatb18_: bool = false;
    var local: vec3<f32>;
    var local_1: vec2<f32>;

    let _e70 = vs_TEXCOORD2_1;
    let _e75 = _f_buffer0_.f_cb0_[4];
    let _e80 = hscard_bias.values[4];
    let _e83 = textureSampleBias(f_t4_, samplerf_s4_, _e70.xy, (_e75.x + _e80.x));
    u_xlat0_ = _e83;
    let _e88 = _f_buffer1_.f_cb1_[5];
    u_xlatb18_ = (1f < _e88.x);
    let _e91 = u_xlat0_;
    let _e93 = u_xlatb18_;
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
    let _e115 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = (_e110.x * _e115.w);
    let _e119 = u_xlat0_;
    let _e124 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.y = (_e119.y * _e124.x);
    let _e127 = u_xlat0_;
    let _e129 = u_xlat1_;
    let _e131 = vs_TEXCOORD5_1;
    let _e133 = (_e129.xy + _e131.xy);
    u_xlat0_.x = _e133.x;
    u_xlat0_.y = _e133.y;
    let _e138 = u_xlat0_;
    let _e140 = u_xlatb18_;
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
    let _e166 = u_xlat1_;
    let _e171 = _f_buffer1_.f_cb1_[1];
    u_xlat1_ = (-(_e166) + _e171.yyyy);
    let _e174 = u_xlat0_;
    let _e176 = u_xlat1_;
    u_xlat0_ = (_e174.zzzz * abs(_e176));
    let _e180 = u_xlat1_;
    u_xlat1_.x = (abs(_e180.x) + -0.5f);
    let _e186 = u_xlat2_;
    let _e188 = u_xlat0_;
    let _e189 = _e188.xyz;
    u_xlat2_.x = _e189.x;
    u_xlat2_.y = _e189.y;
    u_xlat2_.z = _e189.z;
    let _e200 = _f_buffer1_.f_cb1_[0];
    u_xlat2_.w = _e200.w;
    let _e202 = u_xlat2_;
    let _e206 = _f_buffer1_.f_cb1_[0];
    u_xlat2_ = (_e202 * _e206);
    let _e212 = _f_buffer1_.f_cb1_[0];
    u_xlat0_.x = _e212.w;
    let _e214 = u_xlat0_;
    let _e216 = u_xlat2_;
    u_xlat0_ = (_e214.xxxw * _e216);
    let _e218 = u_xlat0_;
    let _e222 = _f_buffer1_.f_cb1_[1];
    u_xlat0_ = (_e218 * _e222.xxxx);
    let _e225 = vs_TEXCOORD0_1;
    let _e230 = _f_buffer0_.f_cb0_[4];
    let _e235 = hscard_bias.values[2];
    let _e238 = textureSampleBias(f_t2_, samplerf_s2_, _e225.xy, (_e230.x + _e235.x));
    u_xlat2_ = _e238;
    let _e239 = u_xlat0_;
    let _e240 = u_xlat2_;
    u_xlat0_ = (_e239 * _e240.xxxx);
    let _e247 = _f_buffer1_.f_cb1_[9];
    u_xlat3_.w = _e247.w;
    let _e249 = vs_TEXCOORD4_1;
    let _e254 = _f_buffer0_.f_cb0_[4];
    let _e259 = hscard_bias.values[5];
    let _e262 = textureSampleBias(f_t5_, samplerf_s5_, _e249.xy, (_e254.x + _e259.x));
    u_xlat4_ = _e262;
    let _e263 = u_xlat4_;
    let _e268 = _f_buffer1_.f_cb1_[10];
    u_xlat4_ = (-(_e263) + _e268.yyyy);
    let _e271 = u_xlat3_;
    let _e273 = u_xlat4_;
    let _e275 = abs(_e273.xyz);
    u_xlat3_.x = _e275.x;
    u_xlat3_.y = _e275.y;
    u_xlat3_.z = _e275.z;
    let _e282 = u_xlat3_;
    let _e286 = _f_buffer1_.f_cb1_[9];
    u_xlat5_ = (_e282 * _e286);
    let _e292 = _f_buffer1_.f_cb1_[9];
    u_xlat4_.x = _e292.w;
    let _e295 = u_xlat4_;
    u_xlat4_.w = abs(_e295.w);
    let _e299 = u_xlat3_;
    u_xlat1_.y = (_e299.x + -0.5f);
    let _e304 = u_xlat1_;
    let _e306 = u_xlat1_;
    let _e308 = u_xlat2_;
    let _e310 = (_e306.xy * _e308.xy);
    u_xlat1_.x = _e310.x;
    u_xlat1_.y = _e310.y;
    let _e315 = u_xlat1_;
    let _e320 = _f_buffer1_.f_cb1_[10];
    u_xlat7_ = (_e315.y * _e320.w);
    let _e323 = u_xlat4_;
    let _e325 = u_xlat5_;
    u_xlat3_ = (_e323.xxxw * _e325);
    let _e327 = u_xlat3_;
    let _e331 = _f_buffer1_.f_cb1_[10];
    u_xlat3_ = (_e327 * _e331.xxxx);
    let _e334 = u_xlat2_;
    let _e336 = u_xlat3_;
    u_xlat3_ = (_e334.yyyy * _e336);
    let _e338 = u_xlat3_;
    let _e339 = vs_TEXCOORD3_1;
    u_xlat3_ = (_e338 * _e339.yyyy);
    let _e342 = u_xlat0_;
    let _e343 = vs_TEXCOORD3_1;
    let _e346 = u_xlat3_;
    u_xlat4_ = ((_e342 * _e343.xxxx) + _e346);
    let _e348 = u_xlat0_;
    let _e349 = vs_TEXCOORD3_1;
    u_xlat0_ = (_e348 * _e349.xxxx);
    let _e352 = u_xlat4_;
    u_xlat4_ = (_e352 * vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
    let _e359 = u_xlat0_;
    let _e360 = u_xlat3_;
    let _e362 = u_xlat4_;
    u_xlat0_ = ((_e359 * _e360) + -(_e362));
    let _e368 = _f_buffer1_.f_cb1_[10];
    let _e370 = u_xlat0_;
    let _e372 = u_xlat4_;
    u_xlat0_ = ((_e368.zzzz * _e370) + _e372);
    let _e374 = vs_TEXCOORD4_1;
    let _e379 = _f_buffer0_.f_cb0_[4];
    let _e384 = hscard_bias.values[7];
    let _e387 = textureSampleBias(f_t7_, samplerf_s7_, _e374.zw, (_e379.x + _e384.x));
    u_xlat3_ = _e387;
    let _e388 = u_xlat13_;
    let _e390 = u_xlat3_;
    let _e395 = _f_buffer1_.f_cb1_[18];
    let _e398 = vs_TEXCOORD5_1;
    let _e400 = ((_e390.xy * _e395.yz) + _e398.zw);
    u_xlat13_.x = _e400.x;
    u_xlat13_.y = _e400.y;
    let _e405 = u_xlat13_;
    let _e410 = _f_buffer0_.f_cb0_[4];
    let _e415 = hscard_bias.values[6];
    let _e418 = textureSampleBias(f_t6_, samplerf_s6_, _e405.xy, (_e410.x + _e415.x));
    u_xlat4_ = _e418;
    let _e419 = u_xlat4_;
    let _e424 = _f_buffer1_.f_cb1_[17];
    u_xlat4_ = (-(_e419) + _e424.zzzz);
    let _e428 = u_xlat4_;
    u_xlat13_.x = (abs(_e428.x) + -0.5f);
    let _e434 = u_xlat3_;
    let _e436 = u_xlat4_;
    u_xlat3_ = (_e434.zzzz * abs(_e436));
    let _e439 = u_xlat3_;
    let _e443 = _f_buffer1_.f_cb1_[16];
    u_xlat3_ = (_e439 * _e443);
    let _e446 = u_xlat2_;
    let _e448 = u_xlat13_;
    u_xlat13_.x = (_e446.z * _e448.x);
    let _e451 = u_xlat13_;
    let _e456 = _f_buffer1_.f_cb1_[18];
    let _e459 = u_xlat7_;
    u_xlat7_ = ((_e451.x * _e456.x) + _e459);
    let _e462 = u_xlat1_;
    let _e467 = _f_buffer1_.f_cb1_[1];
    let _e470 = u_xlat7_;
    u_xlat1_.x = ((_e462.x * _e467.z) + _e470);
    let _e472 = u_xlat1_;
    let _e477 = _f_buffer1_.f_cb1_[25];
    let _e479 = u_xlat1_;
    let _e482 = vs_TEXCOORD0_1;
    let _e484 = ((_e477.xy * _e479.xx) + _e482.xy);
    u_xlat1_.x = _e484.x;
    u_xlat1_.y = _e484.y;
    let _e489 = u_xlat1_;
    let _e494 = _f_buffer0_.f_cb0_[4];
    let _e499 = hscard_bias.values[0];
    let _e502 = textureSampleBias(f_t0_, samplerf_s0_, _e489.xy, (_e494.x + _e499.x));
    u_xlat1_ = _e502;
    let _e503 = u_xlat0_;
    let _e504 = u_xlat1_;
    u_xlat0_ = (_e503 + _e504);
    let _e509 = _f_buffer1_.f_cb1_[24];
    let _e514 = _f_buffer1_.f_cb1_[24];
    let _e517 = u_xlat0_;
    u_xlat0_ = ((_e509.yyyy * _e514.zzzz) + _e517);
    let _e519 = u_xlat1_;
    let _e521 = u_xlat0_;
    u_xlat0_ = (-(_e519) + _e521);
    let _e524 = u_xlat2_;
    let _e526 = u_xlat2_;
    u_xlat2_.x = (_e524.y + _e526.x);
    let _e530 = u_xlat2_;
    u_xlat2_.x = clamp(_e530.x, 0f, 1f);
    let _e535 = u_xlat2_;
    let _e537 = u_xlat3_;
    u_xlat8_ = (_e535.z * _e537.w);
    let _e540 = u_xlat8_;
    let _e541 = vs_TEXCOORD3_1;
    u_xlat8_ = (_e540 * _e541.z);
    let _e544 = u_xlat8_;
    let _e548 = _f_buffer1_.f_cb1_[17];
    u_xlat8_ = (_e544 * _e548.x);
    let _e551 = u_xlat2_;
    let _e553 = u_xlat0_;
    let _e555 = u_xlat1_;
    u_xlat0_ = ((_e551.xxxx * _e553) + _e555);
    let _e557 = u_xlat3_;
    let _e561 = _f_buffer1_.f_cb1_[17];
    let _e564 = u_xlat0_;
    u_xlat1_ = ((_e557 * _e561.yyyy) + -(_e564));
    let _e567 = u_xlat8_;
    let _e569 = u_xlat1_;
    let _e571 = u_xlat0_;
    u_xlat0_ = ((vec4(_e567) * _e569) + _e571);
    let _e573 = u_xlat0_;
    u_xlat0_ = clamp(_e573, vec4(0f), vec4(1f));
    let _e579 = u_xlat0_;
    u_xlat1_ = (_e579 + vec4<f32>(0.15f, 0.15f, 0.15f, 0.15f));
    let _e586 = u_xlat1_;
    let _e587 = vs_COLOR0_1;
    u_xlat1_ = (_e586 * _e587);
    let _e589 = u_xlat0_;
    let _e590 = u_xlat1_;
    u_xlat0_ = min(_e589, _e590);
    let _e592 = vs_TEXCOORD1_1;
    let _e597 = _f_buffer0_.f_cb0_[4];
    let _e602 = hscard_bias.values[1];
    let _e605 = textureSampleBias(f_t1_, samplerf_s1_, _e592.xy, (_e597.x + _e602.x));
    u_xlat1_ = _e605;
    let _e606 = u_xlat0_;
    let _e607 = u_xlat1_;
    SV_TARGET0_ = (_e606 * _e607);
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
