struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 8>,
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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat13_: f32 = 0f;
    var u_xlat19_: f32 = 0f;

    let _e47 = vs_TEXCOORD0_1;
    let _e52 = _f_buffer0_.f_cb0_[4];
    let _e57 = hscard_bias.values[0];
    let _e60 = textureSampleBias(f_t0_, samplerf_s0_, _e47.xy, (_e52.x + _e57.x));
    u_xlat0_ = _e60;
    u_xlat1_.y = 0f;
    let _e63 = vs_TEXCOORD0_1;
    let _e65 = dpdx(_e63.x);
    u_xlat13_ = _e65;
    let _e66 = vs_TEXCOORD0_1;
    let _e68 = dpdy(_e66.x);
    u_xlat19_ = _e68;
    let _e70 = u_xlat19_;
    let _e72 = u_xlat13_;
    u_xlat2_.x = (abs(_e70) + abs(_e72));
    let _e76 = u_xlat2_;
    u_xlat1_.x = (_e76.x * 0.5f);
    let _e80 = u_xlat1_;
    let _e82 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e80.xyxx + _e82.xyxy);
    let _e85 = u_xlat1_;
    let _e90 = _f_buffer0_.f_cb0_[4];
    let _e95 = hscard_bias.values[0];
    let _e98 = textureSampleBias(f_t0_, samplerf_s0_, _e85.xy, (_e90.x + _e95.x));
    u_xlat3_ = _e98;
    let _e99 = u_xlat1_;
    let _e104 = _f_buffer0_.f_cb0_[4];
    let _e109 = hscard_bias.values[0];
    let _e112 = textureSampleBias(f_t0_, samplerf_s0_, _e99.zw, (_e104.x + _e109.x));
    u_xlat1_ = _e112;
    let _e113 = u_xlat0_;
    let _e114 = u_xlat3_;
    u_xlat0_ = (_e113 + _e114);
    u_xlat2_.y = 0f;
    let _e118 = u_xlat2_;
    let _e120 = vs_TEXCOORD0_1;
    u_xlat3_ = (_e118.xyyx + _e120.xyxy);
    let _e123 = u_xlat3_;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[0];
    let _e136 = textureSampleBias(f_t0_, samplerf_s0_, _e123.xy, (_e128.x + _e133.x));
    u_xlat4_ = _e136;
    let _e137 = u_xlat3_;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[0];
    let _e150 = textureSampleBias(f_t0_, samplerf_s0_, _e137.zw, (_e142.x + _e147.x));
    u_xlat3_ = _e150;
    let _e151 = u_xlat0_;
    let _e152 = u_xlat4_;
    u_xlat0_ = (_e151 + _e152);
    let _e154 = u_xlat2_;
    let _e156 = u_xlat2_;
    let _e161 = (_e156.xx * vec2<f32>(0.5f, 0.5f));
    u_xlat2_.z = _e161.x;
    u_xlat2_.w = _e161.y;
    let _e166 = u_xlat2_;
    let _e168 = vs_TEXCOORD0_1;
    u_xlat4_ = (_e166.yzxz + _e168.xyxy);
    let _e171 = u_xlat2_;
    let _e173 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e171.wxxx + _e173.xyxy);
    let _e176 = u_xlat4_;
    let _e181 = _f_buffer0_.f_cb0_[4];
    let _e186 = hscard_bias.values[0];
    let _e189 = textureSampleBias(f_t0_, samplerf_s0_, _e176.xy, (_e181.x + _e186.x));
    u_xlat5_ = _e189;
    let _e190 = u_xlat4_;
    let _e195 = _f_buffer0_.f_cb0_[4];
    let _e200 = hscard_bias.values[0];
    let _e203 = textureSampleBias(f_t0_, samplerf_s0_, _e190.zw, (_e195.x + _e200.x));
    u_xlat4_ = _e203;
    let _e204 = u_xlat0_;
    let _e205 = u_xlat5_;
    u_xlat0_ = (_e204 + _e205);
    let _e207 = u_xlat1_;
    let _e208 = u_xlat0_;
    u_xlat0_ = (_e207 + _e208);
    let _e210 = u_xlat4_;
    let _e211 = u_xlat0_;
    u_xlat0_ = (_e210 + _e211);
    let _e213 = u_xlat3_;
    let _e214 = u_xlat0_;
    u_xlat0_ = (_e213 + _e214);
    let _e216 = u_xlat2_;
    let _e221 = _f_buffer0_.f_cb0_[4];
    let _e226 = hscard_bias.values[0];
    let _e229 = textureSampleBias(f_t0_, samplerf_s0_, _e216.xy, (_e221.x + _e226.x));
    u_xlat1_ = _e229;
    let _e230 = u_xlat2_;
    let _e235 = _f_buffer0_.f_cb0_[4];
    let _e240 = hscard_bias.values[0];
    let _e243 = textureSampleBias(f_t0_, samplerf_s0_, _e230.zw, (_e235.x + _e240.x));
    u_xlat2_ = _e243;
    let _e244 = u_xlat0_;
    let _e245 = u_xlat1_;
    u_xlat0_ = (_e244 + _e245);
    let _e247 = u_xlat2_;
    let _e248 = u_xlat0_;
    u_xlat0_ = (_e247 + _e248);
    let _e250 = u_xlat0_;
    u_xlat0_ = (_e250 * vec4<f32>(0.11111111f, 0.11111111f, 0.11111111f, 0.11111111f));
    let _e257 = vs_TEXCOORD1_1;
    let _e262 = _f_buffer0_.f_cb0_[4];
    let _e267 = hscard_bias.values[1];
    let _e270 = textureSampleBias(f_t1_, samplerf_s1_, _e257.xy, (_e262.x + _e267.x));
    u_xlat1_ = _e270;
    let _e271 = u_xlat1_;
    let _e275 = _f_buffer1_.f_cb1_[3];
    u_xlat1_ = (_e271 * _e275);
    let _e277 = u_xlat1_;
    let _e281 = _f_buffer1_.f_cb1_[4];
    u_xlat1_ = (_e277 * _e281.xxxx);
    let _e284 = u_xlat0_;
    let _e285 = u_xlat1_;
    let _e287 = u_xlat0_;
    u_xlat2_ = ((_e284 * _e285) + -(_e287));
    let _e290 = u_xlat1_;
    let _e292 = u_xlat2_;
    let _e294 = u_xlat0_;
    u_xlat0_ = ((_e290.wwww * _e292) + _e294);
    let _e301 = u_xlat0_;
    u_xlat1_.x = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e301.xyz);
    let _e307 = _f_buffer1_.f_cb1_[2];
    let _e311 = _f_buffer1_.f_cb1_[5];
    u_xlat2_ = (_e307 + -(_e311));
    let _e314 = u_xlat1_;
    let _e316 = u_xlat2_;
    let _e321 = _f_buffer1_.f_cb1_[5];
    u_xlat1_ = ((_e314.xxxx * _e316) + _e321);
    let _e323 = u_xlat0_;
    let _e325 = u_xlat1_;
    u_xlat1_ = (-(_e323) + _e325);
    let _e330 = _f_buffer1_.f_cb1_[6];
    let _e332 = u_xlat1_;
    let _e334 = u_xlat0_;
    u_xlat0_ = ((_e330.xxxx * _e332) + _e334);
    let _e336 = u_xlat0_;
    let _e341 = _f_buffer1_.f_cb1_[7];
    u_xlat1_ = (-(_e336) + _e341);
    let _e346 = _f_buffer1_.f_cb1_[6];
    let _e348 = u_xlat1_;
    let _e350 = u_xlat0_;
    u_xlat0_ = ((_e346.yyyy * _e348) + _e350);
    let _e352 = u_xlat0_;
    u_xlat1_ = (_e352 + vec4<f32>(0.15f, 0.15f, 0.15f, 0.15f));
    let _e359 = u_xlat1_;
    let _e360 = vs_COLOR0_1;
    u_xlat1_ = (_e359 * _e360);
    let _e362 = u_xlat0_;
    let _e363 = u_xlat1_;
    u_xlat0_ = min(_e362, _e363);
    let _e365 = u_xlat0_;
    let _e369 = _f_buffer1_.f_cb1_[6];
    SV_TARGET0_ = (_e365 * _e369.zzzz);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_TARGET0_;
    return FragmentOutput(_e32);
}
