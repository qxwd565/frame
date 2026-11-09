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
    var u_xlat9_: f32 = 0f;

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
    let _e280 = u_xlat2_;
    u_xlat0_.x = dot(_e280.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e290 = _f_buffer0_.f_cb0_[15];
    u_xlat9_ = ((_e290.y * 0.5f) + 0.5f);
    let _e296 = u_xlat9_;
    u_xlat9_ = fract(_e296);
    let _e298 = u_xlat3_;
    let _e300 = u_xlat9_;
    let _e302 = u_xlat3_;
    let _e304 = (vec2(_e300) * _e302.xy);
    u_xlat3_.x = _e304.x;
    u_xlat3_.y = _e304.y;
    let _e309 = u_xlat9_;
    u_xlat9_ = (-(_e309) + 0.5f);
    let _e313 = u_xlat9_;
    let _e314 = u_xlat9_;
    u_xlat9_ = (_e313 + _e314);
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
    let _e345 = u_xlat1_;
    u_xlat3_.x = dot(_e345.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e353 = u_xlat3_;
    let _e356 = u_xlat0_;
    u_xlat0_.x = (-(_e353.x) + _e356.x);
    let _e360 = u_xlat9_;
    let _e362 = u_xlat0_;
    let _e365 = u_xlat3_;
    u_xlat0_.w = ((abs(_e360) * _e362.x) + _e365.x);
    let _e369 = u_xlat0_;
    let _e374 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e369.w + _e374.y);
    let _e377 = u_xlat0_;
    let _e382 = _f_buffer1_.f_cb1_[3];
    u_xlat4_ = max(_e377.w, _e382.y);
    let _e386 = u_xlat4_;
    let _e387 = u_xlat1_;
    u_xlat1_.x = (_e386 * _e387.x);
    let _e390 = u_xlat0_;
    let _e392 = u_xlat1_;
    let _e397 = _f_buffer1_.f_cb1_[2];
    let _e399 = (_e392.xxx * _e397.xxx);
    u_xlat0_.x = _e399.x;
    u_xlat0_.y = _e399.y;
    u_xlat0_.z = _e399.z;
    let _e407 = vs_TEXCOORD1_1;
    let _e411 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e407 + -(_e411.z));
    let _e416 = u_xlat1_;
    u_xlat1_.x = clamp(_e416.x, 0f, 1f);
    let _e422 = u_xlat1_;
    u_xlat1_.x = (_e422.x + -0.00001f);
    let _e427 = u_xlat0_;
    let _e429 = u_xlat1_;
    u_xlat4_ = (_e427.w + -(_e429.x));
    let _e434 = vs_TEXCOORD1_1;
    let _e438 = _f_buffer1_.f_cb1_[12];
    u_xlat7_.x = (_e434 + _e438.z);
    let _e442 = u_xlat7_;
    u_xlat7_.x = clamp(_e442.x, 0f, 1f);
    let _e448 = u_xlat1_;
    let _e451 = u_xlat7_;
    u_xlat1_.x = (-(_e448.x) + _e451.x);
    let _e457 = u_xlat1_;
    u_xlat1_.x = (1f / _e457.x);
    let _e461 = u_xlat1_;
    let _e463 = u_xlat4_;
    u_xlat1_.x = (_e461.x * _e463);
    let _e466 = u_xlat1_;
    u_xlat1_.x = clamp(_e466.x, 0f, 1f);
    let _e471 = u_xlat1_;
    u_xlat4_ = ((_e471.x * -2f) + 3f);
    let _e479 = u_xlat1_;
    let _e481 = u_xlat1_;
    u_xlat1_.x = (_e479.x * _e481.x);
    let _e485 = u_xlat1_;
    let _e487 = u_xlat4_;
    u_xlat1_.x = (_e485.x * _e487);
    let _e489 = u_xlat0_;
    let _e490 = u_xlat1_;
    u_xlat0_ = (_e489 * _e490.xxxx);
    let _e493 = u_xlat0_;
    let _e494 = vs_COLOR0_1;
    SV_Target0_ = (_e493 * _e494);
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
