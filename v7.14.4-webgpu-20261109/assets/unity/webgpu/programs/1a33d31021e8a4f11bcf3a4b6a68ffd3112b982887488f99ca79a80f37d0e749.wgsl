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
    let _e344 = u_xlat3_;
    let _e346 = u_xlat1_;
    let _e349 = u_xlat2_;
    let _e351 = (-(_e346.xyz) + _e349.xyz);
    u_xlat3_.x = _e351.x;
    u_xlat3_.y = _e351.y;
    u_xlat3_.z = _e351.z;
    let _e358 = u_xlat0_;
    let _e360 = u_xlat0_;
    let _e363 = u_xlat3_;
    let _e366 = u_xlat1_;
    let _e368 = ((abs(_e360.xxx) * _e363.yzx) + _e366.yzx);
    u_xlat0_.x = _e368.x;
    u_xlat0_.y = _e368.y;
    u_xlat0_.w = _e368.z;
    let _e375 = u_xlat1_;
    let _e377 = u_xlat0_;
    let _e382 = _f_buffer1_.f_cb1_[2];
    let _e384 = (_e377.wxy + _e382.yyy);
    u_xlat1_.x = _e384.x;
    u_xlat1_.y = _e384.y;
    u_xlat1_.z = _e384.z;
    let _e391 = u_xlat0_;
    let _e396 = _f_buffer1_.f_cb1_[3];
    u_xlat10_ = max(_e391.w, _e396.y);
    let _e399 = u_xlat1_;
    let _e401 = u_xlat10_;
    let _e403 = u_xlat1_;
    let _e405 = (vec3(_e401) * _e403.xyz);
    u_xlat1_.x = _e405.x;
    u_xlat1_.y = _e405.y;
    u_xlat1_.z = _e405.z;
    let _e412 = u_xlat0_;
    let _e414 = u_xlat1_;
    let _e419 = _f_buffer1_.f_cb1_[2];
    let _e421 = (_e414.xyz * _e419.xxx);
    u_xlat0_.x = _e421.x;
    u_xlat0_.y = _e421.y;
    u_xlat0_.z = _e421.z;
    let _e429 = vs_TEXCOORD1_1;
    let _e433 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e429 + -(_e433.z));
    let _e438 = u_xlat1_;
    u_xlat1_.x = clamp(_e438.x, 0f, 1f);
    let _e444 = u_xlat1_;
    u_xlat1_.x = (_e444.x + -0.00001f);
    let _e449 = u_xlat0_;
    let _e451 = u_xlat1_;
    u_xlat4_ = (_e449.w + -(_e451.x));
    let _e456 = vs_TEXCOORD1_1;
    let _e460 = _f_buffer1_.f_cb1_[12];
    u_xlat7_.x = (_e456 + _e460.z);
    let _e464 = u_xlat7_;
    u_xlat7_.x = clamp(_e464.x, 0f, 1f);
    let _e470 = u_xlat1_;
    let _e473 = u_xlat7_;
    u_xlat1_.x = (-(_e470.x) + _e473.x);
    let _e479 = u_xlat1_;
    u_xlat1_.x = (1f / _e479.x);
    let _e483 = u_xlat1_;
    let _e485 = u_xlat4_;
    u_xlat1_.x = (_e483.x * _e485);
    let _e488 = u_xlat1_;
    u_xlat1_.x = clamp(_e488.x, 0f, 1f);
    let _e493 = u_xlat1_;
    u_xlat4_ = ((_e493.x * -2f) + 3f);
    let _e501 = u_xlat1_;
    let _e503 = u_xlat1_;
    u_xlat1_.x = (_e501.x * _e503.x);
    let _e507 = u_xlat1_;
    let _e509 = u_xlat4_;
    u_xlat1_.x = (_e507.x * _e509);
    let _e511 = u_xlat0_;
    let _e512 = u_xlat1_;
    u_xlat0_ = (_e511 * _e512.xxxx);
    let _e515 = u_xlat0_;
    let _e516 = vs_COLOR0_1;
    SV_Target0_ = (_e515 * _e516);
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
