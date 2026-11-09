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
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat7_: vec2<f32> = vec2(0f);
    var u_xlat10_: f32 = 0f;

    let _e47 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = (_e47.y * 0.5f);
    let _e52 = u_xlat0_;
    u_xlat0_.x = fract(_e52.x);
    let _e55 = vs_TEXCOORD0_1;
    let _e60 = _f_buffer0_.f_cb0_[4];
    let _e65 = hscard_bias.values[1];
    let _e68 = textureSampleBias(f_t1_, samplerf_s1_, _e55.zw, (_e60.x + _e65.x));
    u_xlat1_ = _e68;
    let _e69 = u_xlat3_;
    let _e71 = u_xlat1_;
    let _e82 = ((_e71.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e82.x;
    u_xlat3_.y = _e82.y;
    let _e87 = u_xlat3_;
    let _e89 = u_xlat3_;
    let _e94 = _f_buffer1_.f_cb1_[5];
    let _e96 = (_e89.xy * _e94.zw);
    u_xlat3_.x = _e96.x;
    u_xlat3_.y = _e96.y;
    let _e101 = u_xlat0_;
    let _e103 = u_xlat0_;
    let _e105 = u_xlat3_;
    let _e107 = (_e103.xx * _e105.xy);
    u_xlat0_.x = _e107.x;
    u_xlat0_.w = _e107.y;
    let _e112 = u_xlat1_;
    let _e114 = vs_TEXCOORD0_1;
    let _e115 = _e114.xy;
    u_xlat1_.x = _e115.x;
    u_xlat1_.y = _e115.y;
    let _e120 = u_xlat1_;
    let _e122 = u_xlat1_;
    let _e128 = clamp(_e122.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e128.x;
    u_xlat1_.y = _e128.y;
    let _e133 = u_xlat1_;
    let _e135 = u_xlat1_;
    let _e137 = vs_TEXCOORD0_1;
    let _e140 = (_e135.xy + -(_e137.xy));
    u_xlat1_.x = _e140.x;
    u_xlat1_.y = _e140.y;
    let _e145 = u_xlat1_;
    let _e150 = _f_buffer1_.f_cb1_[3];
    let _e152 = u_xlat1_;
    let _e155 = vs_TEXCOORD0_1;
    let _e157 = ((_e150.zz * _e152.xy) + _e155.xy);
    u_xlat1_.x = _e157.x;
    u_xlat1_.y = _e157.y;
    let _e162 = u_xlat7_;
    let _e164 = u_xlat1_;
    let _e175 = ((_e164.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat7_.x = _e175.x;
    u_xlat7_.y = _e175.y;
    let _e180 = u_xlat7_;
    let _e182 = u_xlat7_;
    let _e189 = (-(abs(_e182.xy)) + vec2<f32>(1f, 1f));
    u_xlat7_.x = _e189.x;
    u_xlat7_.y = _e189.y;
    let _e194 = u_xlat7_;
    let _e196 = u_xlat7_;
    let _e201 = (_e196.xy * vec2<f32>(3f, 3f));
    u_xlat7_.x = _e201.x;
    u_xlat7_.y = _e201.y;
    let _e206 = u_xlat7_;
    let _e208 = u_xlat7_;
    let _e214 = clamp(_e208.xy, vec2(0f), vec2(1f));
    u_xlat7_.x = _e214.x;
    u_xlat7_.y = _e214.y;
    let _e219 = u_xlat7_;
    let _e221 = u_xlat7_;
    let _e228 = (_e221.xy + vec2<f32>(-1f, -1f));
    u_xlat7_.x = _e228.x;
    u_xlat7_.y = _e228.y;
    let _e233 = u_xlat7_;
    let _e238 = _f_buffer1_.f_cb1_[3];
    let _e240 = u_xlat7_;
    let _e246 = ((_e238.zz * _e240.xy) + vec2<f32>(1f, 1f));
    u_xlat7_.x = _e246.x;
    u_xlat7_.y = _e246.y;
    let _e251 = u_xlat0_;
    let _e253 = u_xlat0_;
    let _e255 = u_xlat7_;
    let _e258 = u_xlat1_;
    let _e260 = ((_e253.xw * _e255.xy) + _e258.xy);
    u_xlat0_.x = _e260.x;
    u_xlat0_.w = _e260.y;
    let _e265 = u_xlat0_;
    let _e270 = _f_buffer0_.f_cb0_[4];
    let _e275 = hscard_bias.values[0];
    let _e278 = textureSampleBias(f_t0_, samplerf_s0_, _e265.xw, (_e270.x + _e275.x));
    u_xlat2_ = _e278;
    let _e283 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = ((_e283.y * 0.5f) + 0.5f);
    let _e290 = u_xlat0_;
    u_xlat0_.x = fract(_e290.x);
    let _e293 = u_xlat3_;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat3_;
    let _e299 = (_e295.xx * _e297.xy);
    u_xlat3_.x = _e299.x;
    u_xlat3_.y = _e299.y;
    let _e305 = u_xlat0_;
    u_xlat0_.x = (-(_e305.x) + 0.5f);
    let _e311 = u_xlat0_;
    let _e313 = u_xlat0_;
    u_xlat0_.x = (_e311.x + _e313.x);
    let _e316 = u_xlat3_;
    let _e318 = u_xlat3_;
    let _e320 = u_xlat7_;
    let _e323 = u_xlat1_;
    let _e325 = ((_e318.xy * _e320.xy) + _e323.xy);
    u_xlat3_.x = _e325.x;
    u_xlat3_.y = _e325.y;
    let _e330 = u_xlat3_;
    let _e335 = _f_buffer0_.f_cb0_[4];
    let _e340 = hscard_bias.values[0];
    let _e343 = textureSampleBias(f_t0_, samplerf_s0_, _e330.xy, (_e335.x + _e340.x));
    u_xlat1_ = _e343;
    let _e344 = u_xlat1_;
    let _e346 = u_xlat2_;
    u_xlat2_ = (-(_e344) + _e346);
    let _e348 = u_xlat0_;
    let _e351 = u_xlat2_;
    let _e353 = u_xlat1_;
    u_xlat0_ = ((abs(_e348.xxxx) * _e351) + _e353);
    let _e355 = u_xlat1_;
    let _e357 = u_xlat0_;
    let _e362 = _f_buffer1_.f_cb1_[2];
    let _e364 = (_e357.xyz + _e362.yyy);
    u_xlat1_.x = _e364.x;
    u_xlat1_.y = _e364.y;
    u_xlat1_.z = _e364.z;
    let _e371 = u_xlat0_;
    let _e376 = _f_buffer1_.f_cb1_[3];
    u_xlat10_ = max(_e371.w, _e376.y);
    let _e379 = u_xlat1_;
    let _e381 = u_xlat10_;
    let _e383 = u_xlat1_;
    let _e385 = (vec3(_e381) * _e383.xyz);
    u_xlat1_.x = _e385.x;
    u_xlat1_.y = _e385.y;
    u_xlat1_.z = _e385.z;
    let _e392 = u_xlat0_;
    let _e394 = u_xlat1_;
    let _e399 = _f_buffer1_.f_cb1_[2];
    let _e401 = (_e394.xyz * _e399.xxx);
    u_xlat0_.x = _e401.x;
    u_xlat0_.y = _e401.y;
    u_xlat0_.z = _e401.z;
    let _e409 = vs_TEXCOORD1_1;
    let _e413 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e409 + -(_e413.z));
    let _e418 = u_xlat1_;
    u_xlat1_.x = clamp(_e418.x, 0f, 1f);
    let _e424 = u_xlat1_;
    u_xlat1_.x = (_e424.x + -0.00001f);
    let _e429 = u_xlat0_;
    let _e431 = u_xlat1_;
    u_xlat4_ = (_e429.w + -(_e431.x));
    let _e436 = vs_TEXCOORD1_1;
    let _e440 = _f_buffer1_.f_cb1_[12];
    u_xlat7_.x = (_e436 + _e440.z);
    let _e444 = u_xlat7_;
    u_xlat7_.x = clamp(_e444.x, 0f, 1f);
    let _e450 = u_xlat1_;
    let _e453 = u_xlat7_;
    u_xlat1_.x = (-(_e450.x) + _e453.x);
    let _e459 = u_xlat1_;
    u_xlat1_.x = (1f / _e459.x);
    let _e463 = u_xlat1_;
    let _e465 = u_xlat4_;
    u_xlat1_.x = (_e463.x * _e465);
    let _e468 = u_xlat1_;
    u_xlat1_.x = clamp(_e468.x, 0f, 1f);
    let _e473 = u_xlat1_;
    u_xlat4_ = ((_e473.x * -2f) + 3f);
    let _e481 = u_xlat1_;
    let _e483 = u_xlat1_;
    u_xlat1_.x = (_e481.x * _e483.x);
    let _e487 = u_xlat1_;
    let _e489 = u_xlat4_;
    u_xlat1_.x = (_e487.x * _e489);
    let _e491 = u_xlat0_;
    let _e492 = u_xlat1_;
    u_xlat0_ = (_e491 * _e492.xxxx);
    let _e495 = u_xlat0_;
    let _e496 = vs_COLOR0_1;
    SV_Target0_ = (_e495 * _e496);
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
