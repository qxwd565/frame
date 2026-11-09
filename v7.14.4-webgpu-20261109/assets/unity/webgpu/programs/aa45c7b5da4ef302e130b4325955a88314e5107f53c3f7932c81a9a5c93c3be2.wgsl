struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD6_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

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
    let _e257 = vs_TEXCOORD6_1;
    let _e262 = _f_buffer0_.f_cb0_[4];
    let _e267 = hscard_bias.values[1];
    let _e270 = textureSampleBias(f_t1_, samplerf_s1_, _e257.xy, (_e262.x + _e267.x));
    u_xlat1_ = _e270;
    let _e272 = u_xlat1_;
    u_xlat1_.x = (_e272.x + -1f);
    let _e281 = _f_buffer1_.f_cb1_[3];
    let _e283 = u_xlat1_;
    u_xlat1_.x = ((_e281.x * _e283.x) + 1f);
    let _e288 = u_xlat0_;
    let _e290 = u_xlat0_;
    let _e292 = u_xlat1_;
    let _e294 = (_e290.xyz * _e292.xxx);
    u_xlat0_.x = _e294.x;
    u_xlat0_.y = _e294.y;
    u_xlat0_.z = _e294.z;
    let _e302 = u_xlat0_;
    SV_Target0_.w = _e302.w;
    let _e304 = SV_Target0_;
    let _e306 = u_xlat0_;
    let _e308 = vs_COLOR0_1;
    let _e310 = (_e306.xyz * _e308.xyz);
    SV_Target0_.x = _e310.x;
    SV_Target0_.y = _e310.y;
    SV_Target0_.z = _e310.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(6) vs_TEXCOORD6_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
