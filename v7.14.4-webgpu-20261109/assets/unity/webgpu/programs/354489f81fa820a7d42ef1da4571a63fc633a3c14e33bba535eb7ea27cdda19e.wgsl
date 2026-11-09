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

    let _e67 = vs_TEXCOORD2_1;
    let _e72 = _f_buffer0_.f_cb0_[4];
    let _e77 = hscard_bias.values[4];
    let _e80 = textureSampleBias(f_t4_, samplerf_s4_, _e67.xy, (_e72.x + _e77.x));
    u_xlat0_ = _e80;
    let _e85 = _f_buffer1_.f_cb1_[5];
    u_xlatb18_ = (1f < _e85.x);
    let _e88 = u_xlat0_;
    let _e90 = u_xlatb18_;
    if bool(_e90) {
        let _e92 = u_xlat0_;
        local = _e92.xyz;
    } else {
        local = vec3<f32>(1f, 1f, 1f);
    }
    let _e99 = local;
    u_xlat0_.x = _e99.x;
    u_xlat0_.y = _e99.y;
    u_xlat0_.z = _e99.z;
    let _e107 = u_xlat0_;
    let _e112 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = (_e107.x * _e112.w);
    let _e116 = u_xlat0_;
    let _e121 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.y = (_e116.y * _e121.x);
    let _e124 = u_xlat0_;
    let _e126 = u_xlat1_;
    let _e128 = vs_TEXCOORD5_1;
    let _e130 = (_e126.xy + _e128.xy);
    u_xlat0_.x = _e130.x;
    u_xlat0_.y = _e130.y;
    let _e135 = u_xlat0_;
    let _e137 = u_xlatb18_;
    if bool(_e137) {
        let _e139 = u_xlat0_;
        local_1 = _e139.xy;
    } else {
        let _e141 = vs_TEXCOORD2_1;
        local_1 = _e141.xy;
    }
    let _e144 = local_1;
    u_xlat0_.x = _e144.x;
    u_xlat0_.y = _e144.y;
    let _e149 = u_xlat0_;
    let _e154 = _f_buffer0_.f_cb0_[4];
    let _e159 = hscard_bias.values[3];
    let _e162 = textureSampleBias(f_t3_, samplerf_s3_, _e149.xy, (_e154.x + _e159.x));
    u_xlat1_ = _e162;
    let _e163 = u_xlat1_;
    let _e168 = _f_buffer1_.f_cb1_[1];
    u_xlat1_ = (-(_e163) + _e168.yyyy);
    let _e171 = u_xlat0_;
    let _e173 = u_xlat1_;
    u_xlat0_ = (_e171.zzzz * abs(_e173));
    let _e177 = u_xlat1_;
    u_xlat1_.x = (abs(_e177.x) + -0.5f);
    let _e183 = u_xlat2_;
    let _e185 = u_xlat0_;
    let _e186 = _e185.xyz;
    u_xlat2_.x = _e186.x;
    u_xlat2_.y = _e186.y;
    u_xlat2_.z = _e186.z;
    let _e197 = _f_buffer1_.f_cb1_[0];
    u_xlat2_.w = _e197.w;
    let _e199 = u_xlat2_;
    let _e203 = _f_buffer1_.f_cb1_[0];
    u_xlat2_ = (_e199 * _e203);
    let _e209 = _f_buffer1_.f_cb1_[0];
    u_xlat0_.x = _e209.w;
    let _e211 = u_xlat0_;
    let _e213 = u_xlat2_;
    u_xlat0_ = (_e211.xxxw * _e213);
    let _e215 = u_xlat0_;
    let _e219 = _f_buffer1_.f_cb1_[1];
    u_xlat0_ = (_e215 * _e219.xxxx);
    let _e222 = vs_TEXCOORD0_1;
    let _e227 = _f_buffer0_.f_cb0_[4];
    let _e232 = hscard_bias.values[2];
    let _e235 = textureSampleBias(f_t2_, samplerf_s2_, _e222.xy, (_e227.x + _e232.x));
    u_xlat2_ = _e235;
    let _e236 = u_xlat0_;
    let _e237 = u_xlat2_;
    u_xlat0_ = (_e236 * _e237.xxxx);
    let _e244 = _f_buffer1_.f_cb1_[9];
    u_xlat3_.w = _e244.w;
    let _e246 = vs_TEXCOORD4_1;
    let _e251 = _f_buffer0_.f_cb0_[4];
    let _e256 = hscard_bias.values[5];
    let _e259 = textureSampleBias(f_t5_, samplerf_s5_, _e246.xy, (_e251.x + _e256.x));
    u_xlat4_ = _e259;
    let _e260 = u_xlat4_;
    let _e265 = _f_buffer1_.f_cb1_[10];
    u_xlat4_ = (-(_e260) + _e265.yyyy);
    let _e268 = u_xlat3_;
    let _e270 = u_xlat4_;
    let _e272 = abs(_e270.xyz);
    u_xlat3_.x = _e272.x;
    u_xlat3_.y = _e272.y;
    u_xlat3_.z = _e272.z;
    let _e279 = u_xlat3_;
    let _e283 = _f_buffer1_.f_cb1_[9];
    u_xlat5_ = (_e279 * _e283);
    let _e289 = _f_buffer1_.f_cb1_[9];
    u_xlat4_.x = _e289.w;
    let _e292 = u_xlat4_;
    u_xlat4_.w = abs(_e292.w);
    let _e296 = u_xlat3_;
    u_xlat1_.y = (_e296.x + -0.5f);
    let _e301 = u_xlat1_;
    let _e303 = u_xlat1_;
    let _e305 = u_xlat2_;
    let _e307 = (_e303.xy * _e305.xy);
    u_xlat1_.x = _e307.x;
    u_xlat1_.y = _e307.y;
    let _e312 = u_xlat1_;
    let _e317 = _f_buffer1_.f_cb1_[10];
    u_xlat7_ = (_e312.y * _e317.w);
    let _e320 = u_xlat4_;
    let _e322 = u_xlat5_;
    u_xlat3_ = (_e320.xxxw * _e322);
    let _e324 = u_xlat3_;
    let _e328 = _f_buffer1_.f_cb1_[10];
    u_xlat3_ = (_e324 * _e328.xxxx);
    let _e331 = u_xlat2_;
    let _e333 = u_xlat3_;
    u_xlat3_ = (_e331.yyyy * _e333);
    let _e335 = u_xlat3_;
    let _e336 = vs_TEXCOORD3_1;
    u_xlat3_ = (_e335 * _e336.yyyy);
    let _e339 = u_xlat0_;
    let _e340 = vs_TEXCOORD3_1;
    let _e343 = u_xlat3_;
    u_xlat4_ = ((_e339 * _e340.xxxx) + _e343);
    let _e345 = u_xlat0_;
    let _e346 = vs_TEXCOORD3_1;
    u_xlat0_ = (_e345 * _e346.xxxx);
    let _e349 = u_xlat4_;
    u_xlat4_ = (_e349 * vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
    let _e356 = u_xlat0_;
    let _e357 = u_xlat3_;
    let _e359 = u_xlat4_;
    u_xlat0_ = ((_e356 * _e357) + -(_e359));
    let _e365 = _f_buffer1_.f_cb1_[10];
    let _e367 = u_xlat0_;
    let _e369 = u_xlat4_;
    u_xlat0_ = ((_e365.zzzz * _e367) + _e369);
    let _e371 = vs_TEXCOORD4_1;
    let _e376 = _f_buffer0_.f_cb0_[4];
    let _e381 = hscard_bias.values[6];
    let _e384 = textureSampleBias(f_t6_, samplerf_s6_, _e371.zw, (_e376.x + _e381.x));
    u_xlat3_ = _e384;
    let _e385 = u_xlat3_;
    let _e390 = _f_buffer1_.f_cb1_[17];
    u_xlat3_ = (-(_e385) + _e390.zzzz);
    let _e393 = u_xlat3_;
    u_xlat13_ = (abs(_e393.x) + -0.5f);
    let _e399 = u_xlat3_;
    let _e404 = _f_buffer1_.f_cb1_[16];
    u_xlat3_ = (abs(_e399) * _e404);
    let _e406 = u_xlat2_;
    let _e408 = u_xlat13_;
    u_xlat13_ = (_e406.z * _e408);
    let _e410 = u_xlat13_;
    let _e414 = _f_buffer1_.f_cb1_[18];
    let _e417 = u_xlat7_;
    u_xlat7_ = ((_e410 * _e414.x) + _e417);
    let _e420 = u_xlat1_;
    let _e425 = _f_buffer1_.f_cb1_[1];
    let _e428 = u_xlat7_;
    u_xlat1_.x = ((_e420.x * _e425.z) + _e428);
    let _e430 = u_xlat1_;
    let _e435 = _f_buffer1_.f_cb1_[25];
    let _e437 = u_xlat1_;
    let _e440 = vs_TEXCOORD0_1;
    let _e442 = ((_e435.xy * _e437.xx) + _e440.xy);
    u_xlat1_.x = _e442.x;
    u_xlat1_.y = _e442.y;
    let _e447 = u_xlat1_;
    let _e452 = _f_buffer0_.f_cb0_[4];
    let _e457 = hscard_bias.values[0];
    let _e460 = textureSampleBias(f_t0_, samplerf_s0_, _e447.xy, (_e452.x + _e457.x));
    u_xlat1_ = _e460;
    let _e461 = u_xlat0_;
    let _e462 = u_xlat1_;
    u_xlat0_ = (_e461 + _e462);
    let _e467 = _f_buffer1_.f_cb1_[24];
    let _e472 = _f_buffer1_.f_cb1_[24];
    let _e475 = u_xlat0_;
    u_xlat0_ = ((_e467.yyyy * _e472.zzzz) + _e475);
    let _e477 = u_xlat1_;
    let _e479 = u_xlat0_;
    u_xlat0_ = (-(_e477) + _e479);
    let _e482 = u_xlat2_;
    let _e484 = u_xlat2_;
    u_xlat2_.x = (_e482.y + _e484.x);
    let _e488 = u_xlat2_;
    u_xlat2_.x = clamp(_e488.x, 0f, 1f);
    let _e493 = u_xlat2_;
    let _e495 = u_xlat3_;
    u_xlat8_ = (_e493.z * _e495.w);
    let _e498 = u_xlat8_;
    let _e499 = vs_TEXCOORD3_1;
    u_xlat8_ = (_e498 * _e499.z);
    let _e502 = u_xlat8_;
    let _e506 = _f_buffer1_.f_cb1_[17];
    u_xlat8_ = (_e502 * _e506.x);
    let _e509 = u_xlat2_;
    let _e511 = u_xlat0_;
    let _e513 = u_xlat1_;
    u_xlat0_ = ((_e509.xxxx * _e511) + _e513);
    let _e515 = u_xlat3_;
    let _e519 = _f_buffer1_.f_cb1_[17];
    let _e522 = u_xlat0_;
    u_xlat1_ = ((_e515 * _e519.yyyy) + -(_e522));
    let _e525 = u_xlat8_;
    let _e527 = u_xlat1_;
    let _e529 = u_xlat0_;
    u_xlat0_ = ((vec4(_e525) * _e527) + _e529);
    let _e531 = u_xlat0_;
    u_xlat0_ = clamp(_e531, vec4(0f), vec4(1f));
    let _e537 = u_xlat0_;
    u_xlat1_ = (_e537 + vec4<f32>(0.15f, 0.15f, 0.15f, 0.15f));
    let _e544 = u_xlat1_;
    let _e545 = vs_COLOR0_1;
    u_xlat1_ = (_e544 * _e545);
    let _e547 = u_xlat0_;
    let _e548 = u_xlat1_;
    u_xlat0_ = min(_e547, _e548);
    let _e550 = vs_TEXCOORD1_1;
    let _e555 = _f_buffer0_.f_cb0_[4];
    let _e560 = hscard_bias.values[1];
    let _e563 = textureSampleBias(f_t1_, samplerf_s1_, _e550.xy, (_e555.x + _e560.x));
    u_xlat1_ = _e563;
    let _e564 = u_xlat0_;
    let _e565 = u_xlat1_;
    SV_TARGET0_ = (_e564 * _e565);
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
    let _e68 = SV_TARGET0_;
    return FragmentOutput(_e68);
}
