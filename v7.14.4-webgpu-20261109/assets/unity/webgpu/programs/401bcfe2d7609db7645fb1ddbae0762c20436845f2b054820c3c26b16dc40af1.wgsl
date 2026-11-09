struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat5_: vec2<f32> = vec2(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlat12_: f32 = 0f;

    let _e47 = u_xlat0_;
    let _e49 = vs_TEXCOORD0_1;
    let _e60 = ((_e49.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e60.x;
    u_xlat0_.y = _e60.y;
    let _e65 = u_xlat8_;
    let _e67 = u_xlat0_;
    let _e72 = _f_buffer1_.f_cb1_[5];
    let _e74 = (_e67.xy / _e72.yy);
    u_xlat8_.x = _e74.x;
    u_xlat8_.y = _e74.y;
    let _e80 = u_xlat8_;
    let _e82 = u_xlat8_;
    u_xlat8_.x = dot(_e80.xy, _e82.xy);
    let _e86 = u_xlat8_;
    u_xlat8_.x = sqrt(_e86.x);
    let _e89 = u_xlat8_;
    let _e91 = dpdx(_e89.x);
    u_xlat12_ = _e91;
    let _e93 = u_xlat8_;
    let _e95 = dpdy(_e93.x);
    u_xlat1_.x = _e95;
    let _e96 = u_xlat12_;
    let _e98 = u_xlat1_;
    u_xlat12_ = (abs(_e96) + abs(_e98.x));
    let _e103 = u_xlat12_;
    u_xlat1_.x = (-(_e103) + 1f);
    let _e110 = _f_buffer1_.f_cb1_[5];
    let _e112 = u_xlat1_;
    let _e115 = u_xlat12_;
    u_xlat12_ = ((_e110.z * _e112.x) + _e115);
    let _e118 = u_xlat8_;
    u_xlat1_.x = (-(_e118.x) + 1f);
    let _e123 = u_xlat5_;
    let _e125 = u_xlat8_;
    let _e132 = (_e125.xx + vec2<f32>(-0.75f, -1.25f));
    u_xlat5_.x = _e132.x;
    u_xlat5_.y = _e132.y;
    let _e137 = u_xlat5_;
    let _e139 = u_xlat5_;
    let _e145 = (_e139.xy * vec2<f32>(4f, -1.3333334f));
    u_xlat5_.x = _e145.x;
    u_xlat5_.y = _e145.y;
    let _e150 = u_xlat5_;
    let _e152 = u_xlat5_;
    let _e158 = clamp(_e152.xy, vec2(0f), vec2(1f));
    u_xlat5_.x = _e158.x;
    u_xlat5_.y = _e158.y;
    let _e164 = u_xlat1_;
    let _e166 = u_xlat12_;
    u_xlat8_.x = (_e164.x / _e166);
    let _e169 = u_xlat8_;
    u_xlat8_.x = clamp(_e169.x, 0f, 1f);
    let _e175 = u_xlat8_;
    let _e180 = _f_buffer1_.f_cb1_[1];
    u_xlat8_.x = (_e175.x * _e180.x);
    let _e183 = u_xlat1_;
    let _e185 = u_xlat5_;
    let _e196 = ((_e185.xy * vec2<f32>(-2f, -2f)) + vec2<f32>(3f, 3f));
    u_xlat1_.x = _e196.x;
    u_xlat1_.w = _e196.y;
    let _e201 = u_xlat5_;
    let _e203 = u_xlat5_;
    let _e205 = u_xlat5_;
    let _e207 = (_e203.xy * _e205.xy);
    u_xlat5_.x = _e207.x;
    u_xlat5_.y = _e207.y;
    let _e212 = u_xlat1_;
    let _e214 = u_xlat5_;
    let _e216 = u_xlat1_;
    let _e218 = (_e214.xy * _e216.xw);
    u_xlat1_.x = _e218.x;
    u_xlat1_.y = _e218.y;
    let _e223 = vs_TEXCOORD0_1;
    u_xlat12_ = (_e223.y + -0.35f);
    let _e228 = u_xlat12_;
    u_xlat12_ = (_e228 * 3.3333335f);
    let _e231 = u_xlat12_;
    u_xlat12_ = clamp(_e231, 0f, 1f);
    let _e235 = u_xlat12_;
    u_xlat9_ = ((_e235 * -2f) + 3f);
    let _e241 = u_xlat12_;
    let _e242 = u_xlat12_;
    u_xlat12_ = (_e241 * _e242);
    let _e244 = u_xlat12_;
    let _e245 = u_xlat9_;
    u_xlat12_ = (_e244 * _e245);
    let _e250 = _f_buffer1_.f_cb1_[2];
    let _e254 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = (_e250 + -(_e254));
    let _e257 = u_xlat12_;
    let _e259 = u_xlat2_;
    let _e264 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = ((vec4(_e257) * _e259) + _e264);
    let _e269 = _f_buffer1_.f_cb1_[2];
    let _e273 = _f_buffer1_.f_cb1_[5];
    let _e276 = u_xlat2_;
    u_xlat3_ = ((_e269 * _e273.xxxx) + -(_e276));
    let _e279 = u_xlat1_;
    let _e281 = u_xlat3_;
    let _e283 = u_xlat2_;
    u_xlat2_ = ((_e279.xxxx * _e281) + _e283);
    let _e285 = u_xlat1_;
    let _e290 = _f_buffer1_.f_cb1_[1];
    u_xlat12_ = (_e285.y * _e290.x);
    let _e296 = _f_buffer1_.f_cb1_[0];
    let _e301 = _f_buffer1_.f_cb1_[4];
    u_xlat1_ = (-(_e296) + _e301);
    let _e303 = u_xlat12_;
    let _e305 = u_xlat1_;
    let _e310 = _f_buffer1_.f_cb1_[0];
    u_xlat1_ = ((vec4(_e303) * _e305) + _e310);
    let _e312 = u_xlat1_;
    let _e314 = u_xlat2_;
    u_xlat2_ = (-(_e312) + _e314);
    let _e316 = u_xlat8_;
    let _e318 = u_xlat2_;
    let _e320 = u_xlat1_;
    u_xlat1_ = ((_e316.xxxx * _e318) + _e320);
    let _e322 = u_xlat1_;
    let _e327 = _f_buffer1_.f_cb1_[8];
    u_xlat2_ = (-(_e322) + _e327);
    let _e329 = u_xlat8_;
    let _e334 = _f_buffer1_.f_cb1_[5];
    let _e339 = _f_buffer1_.f_cb1_[9];
    let _e341 = (_e334.yy * _e339.xy);
    u_xlat8_.x = _e341.x;
    u_xlat8_.y = _e341.y;
    let _e346 = u_xlat0_;
    let _e348 = u_xlat0_;
    let _e350 = u_xlat8_;
    let _e352 = (_e348.xy / _e350.xy);
    u_xlat0_.x = _e352.x;
    u_xlat0_.y = _e352.y;
    let _e358 = u_xlat0_;
    let _e360 = u_xlat0_;
    u_xlat0_.x = dot(_e358.xy, _e360.xy);
    let _e364 = u_xlat0_;
    u_xlat0_.x = sqrt(_e364.x);
    let _e367 = u_xlat0_;
    u_xlat4_ = (_e367.x + -1.5f);
    let _e372 = u_xlat4_;
    u_xlat4_ = (_e372 * -0.8f);
    let _e376 = u_xlat4_;
    u_xlat4_ = clamp(_e376, 0f, 1f);
    let _e381 = u_xlat4_;
    u_xlat8_.x = ((_e381 * -2f) + 3f);
    let _e387 = u_xlat4_;
    let _e388 = u_xlat4_;
    u_xlat4_ = (_e387 * _e388);
    let _e390 = u_xlat4_;
    let _e391 = u_xlat8_;
    u_xlat4_ = (_e390 * _e391.x);
    let _e394 = u_xlat4_;
    let _e396 = u_xlat2_;
    let _e398 = u_xlat1_;
    u_xlat1_ = ((vec4(_e394) * _e396) + _e398);
    let _e400 = u_xlat0_;
    u_xlat4_ = (-(_e400.x) + 1f);
    let _e406 = u_xlat4_;
    u_xlat8_.x = max(_e406, 0f);
    let _e412 = _f_buffer1_.f_cb1_[6];
    let _e417 = _f_buffer1_.f_cb1_[7];
    u_xlat2_ = (-(_e412) + _e417);
    let _e419 = u_xlat8_;
    let _e421 = u_xlat2_;
    let _e426 = _f_buffer1_.f_cb1_[6];
    u_xlat2_ = ((_e419.xxxx * _e421) + _e426);
    let _e428 = u_xlat1_;
    let _e430 = u_xlat2_;
    u_xlat2_ = (-(_e428) + _e430);
    let _e433 = u_xlat0_;
    let _e435 = dpdx(_e433.x);
    u_xlat8_.x = _e435;
    let _e437 = u_xlat0_;
    let _e439 = dpdy(_e437.x);
    u_xlat0_.x = _e439;
    let _e441 = u_xlat0_;
    let _e444 = u_xlat8_;
    u_xlat0_.x = (abs(_e441.x) + abs(_e444.x));
    let _e449 = u_xlat4_;
    let _e450 = u_xlat0_;
    u_xlat0_.x = (_e449 / _e450.x);
    let _e454 = u_xlat0_;
    u_xlat0_.x = clamp(_e454.x, 0f, 1f);
    let _e459 = u_xlat0_;
    let _e461 = u_xlat2_;
    let _e463 = u_xlat1_;
    u_xlat0_ = ((_e459.xxxx * _e461) + _e463);
    let _e465 = vs_TEXCOORD0_1;
    let _e470 = _f_buffer0_.f_cb0_[4];
    let _e475 = hscard_bias.values[0];
    let _e478 = textureSampleBias(f_t0_, samplerf_s0_, _e465.zw, (_e470.x + _e475.x));
    u_xlat1_ = _e478;
    let _e480 = u_xlat1_;
    let _e485 = _f_buffer1_.f_cb1_[11];
    u_xlat1_.x = (_e480.x * _e485.x);
    let _e488 = u_xlat2_;
    let _e490 = u_xlat1_;
    let _e495 = _f_buffer1_.f_cb1_[10];
    let _e497 = (_e490.zzz * _e495.xyz);
    u_xlat2_.x = _e497.x;
    u_xlat2_.y = _e497.y;
    u_xlat2_.z = _e497.z;
    let _e504 = u_xlat1_;
    let _e506 = u_xlat0_;
    let _e508 = u_xlat1_;
    let _e511 = u_xlat2_;
    let _e513 = ((_e506.xyz * _e508.xxx) + _e511.xyz);
    u_xlat1_.x = _e513.x;
    u_xlat1_.z = _e513.y;
    u_xlat1_.w = _e513.z;
    let _e520 = u_xlat0_;
    let _e522 = u_xlat1_;
    let _e527 = _f_buffer1_.f_cb1_[11];
    let _e530 = u_xlat1_;
    let _e532 = ((_e522.yyy * _e527.yyy) + _e530.xzw);
    u_xlat0_.x = _e532.x;
    u_xlat0_.y = _e532.y;
    u_xlat0_.z = _e532.z;
    let _e539 = u_xlat0_;
    u_xlat1_ = (_e539 + vec4<f32>(0.15f, 0.15f, 0.15f, 0.15f));
    let _e546 = u_xlat1_;
    let _e547 = vs_COLOR0_1;
    u_xlat1_ = (_e546 * _e547);
    let _e549 = u_xlat0_;
    let _e550 = u_xlat1_;
    SV_Target0_ = min(_e549, _e550);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_Target0_;
    return FragmentOutput(_e24);
}
