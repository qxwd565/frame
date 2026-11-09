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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD5_1: vec2<f32>;
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
    var u_xlat18_: f32 = 0f;
    var u_xlat19_: f32 = 0f;

    let _e53 = vs_TEXCOORD0_1;
    let _e58 = _f_buffer0_.f_cb0_[4];
    let _e63 = hscard_bias.values[0];
    let _e66 = textureSampleBias(f_t0_, samplerf_s0_, _e53.xy, (_e58.x + _e63.x));
    u_xlat0_ = _e66;
    u_xlat1_.y = 0f;
    let _e69 = vs_TEXCOORD0_1;
    let _e71 = dpdx(_e69.x);
    u_xlat13_ = _e71;
    let _e72 = vs_TEXCOORD0_1;
    let _e74 = dpdy(_e72.x);
    u_xlat19_ = _e74;
    let _e76 = u_xlat19_;
    let _e78 = u_xlat13_;
    u_xlat2_.x = (abs(_e76) + abs(_e78));
    let _e82 = u_xlat2_;
    u_xlat1_.x = (_e82.x * 0.5f);
    let _e86 = u_xlat1_;
    let _e88 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e86.xyxx + _e88.xyxy);
    let _e91 = u_xlat1_;
    let _e96 = _f_buffer0_.f_cb0_[4];
    let _e101 = hscard_bias.values[0];
    let _e104 = textureSampleBias(f_t0_, samplerf_s0_, _e91.xy, (_e96.x + _e101.x));
    u_xlat3_ = _e104;
    let _e105 = u_xlat1_;
    let _e110 = _f_buffer0_.f_cb0_[4];
    let _e115 = hscard_bias.values[0];
    let _e118 = textureSampleBias(f_t0_, samplerf_s0_, _e105.zw, (_e110.x + _e115.x));
    u_xlat1_ = _e118;
    let _e119 = u_xlat0_;
    let _e120 = u_xlat3_;
    u_xlat0_ = (_e119 + _e120);
    u_xlat2_.y = 0f;
    let _e124 = u_xlat2_;
    let _e126 = vs_TEXCOORD0_1;
    u_xlat3_ = (_e124.xyyx + _e126.xyxy);
    let _e129 = u_xlat3_;
    let _e134 = _f_buffer0_.f_cb0_[4];
    let _e139 = hscard_bias.values[0];
    let _e142 = textureSampleBias(f_t0_, samplerf_s0_, _e129.xy, (_e134.x + _e139.x));
    u_xlat4_ = _e142;
    let _e143 = u_xlat3_;
    let _e148 = _f_buffer0_.f_cb0_[4];
    let _e153 = hscard_bias.values[0];
    let _e156 = textureSampleBias(f_t0_, samplerf_s0_, _e143.zw, (_e148.x + _e153.x));
    u_xlat3_ = _e156;
    let _e157 = u_xlat0_;
    let _e158 = u_xlat4_;
    u_xlat0_ = (_e157 + _e158);
    let _e160 = u_xlat2_;
    let _e162 = u_xlat2_;
    let _e167 = (_e162.xx * vec2<f32>(0.5f, 0.5f));
    u_xlat2_.z = _e167.x;
    u_xlat2_.w = _e167.y;
    let _e172 = u_xlat2_;
    let _e174 = vs_TEXCOORD0_1;
    u_xlat4_ = (_e172.yzxz + _e174.xyxy);
    let _e177 = u_xlat2_;
    let _e179 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e177.wxxx + _e179.xyxy);
    let _e182 = u_xlat4_;
    let _e187 = _f_buffer0_.f_cb0_[4];
    let _e192 = hscard_bias.values[0];
    let _e195 = textureSampleBias(f_t0_, samplerf_s0_, _e182.xy, (_e187.x + _e192.x));
    u_xlat5_ = _e195;
    let _e196 = u_xlat4_;
    let _e201 = _f_buffer0_.f_cb0_[4];
    let _e206 = hscard_bias.values[0];
    let _e209 = textureSampleBias(f_t0_, samplerf_s0_, _e196.zw, (_e201.x + _e206.x));
    u_xlat4_ = _e209;
    let _e210 = u_xlat0_;
    let _e211 = u_xlat5_;
    u_xlat0_ = (_e210 + _e211);
    let _e213 = u_xlat1_;
    let _e214 = u_xlat0_;
    u_xlat0_ = (_e213 + _e214);
    let _e216 = u_xlat4_;
    let _e217 = u_xlat0_;
    u_xlat0_ = (_e216 + _e217);
    let _e219 = u_xlat3_;
    let _e220 = u_xlat0_;
    u_xlat0_ = (_e219 + _e220);
    let _e222 = u_xlat2_;
    let _e227 = _f_buffer0_.f_cb0_[4];
    let _e232 = hscard_bias.values[0];
    let _e235 = textureSampleBias(f_t0_, samplerf_s0_, _e222.xy, (_e227.x + _e232.x));
    u_xlat1_ = _e235;
    let _e236 = u_xlat2_;
    let _e241 = _f_buffer0_.f_cb0_[4];
    let _e246 = hscard_bias.values[0];
    let _e249 = textureSampleBias(f_t0_, samplerf_s0_, _e236.zw, (_e241.x + _e246.x));
    u_xlat2_ = _e249;
    let _e250 = u_xlat0_;
    let _e251 = u_xlat1_;
    u_xlat0_ = (_e250 + _e251);
    let _e253 = u_xlat2_;
    let _e254 = u_xlat0_;
    u_xlat0_ = (_e253 + _e254);
    let _e256 = vs_TEXCOORD5_1;
    let _e261 = _f_buffer0_.f_cb0_[4];
    let _e266 = hscard_bias.values[1];
    let _e269 = textureSampleBias(f_t1_, samplerf_s1_, _e256.xy, (_e261.x + _e266.x));
    u_xlat1_ = _e269;
    let _e270 = u_xlat0_;
    let _e272 = u_xlat0_;
    let _e279 = u_xlat1_;
    let _e282 = ((_e272.xyz * vec3<f32>(0.11111111f, 0.11111111f, 0.11111111f)) + -(_e279.xyz));
    u_xlat0_.x = _e282.x;
    u_xlat0_.y = _e282.y;
    u_xlat0_.z = _e282.z;
    let _e289 = u_xlat0_;
    u_xlat18_ = (_e289.w * 0.11111111f);
    let _e293 = u_xlat0_;
    let _e295 = u_xlat18_;
    let _e297 = u_xlat0_;
    let _e300 = u_xlat1_;
    let _e302 = ((vec3(_e295) * _e297.xyz) + _e300.xyz);
    u_xlat0_.x = _e302.x;
    u_xlat0_.y = _e302.y;
    u_xlat0_.z = _e302.z;
    let _e310 = u_xlat18_;
    SV_Target0_.w = _e310;
    let _e311 = vs_TEXCOORD6_1;
    let _e316 = _f_buffer0_.f_cb0_[4];
    let _e321 = hscard_bias.values[2];
    let _e324 = textureSampleBias(f_t2_, samplerf_s2_, _e311.xy, (_e316.x + _e321.x));
    u_xlat1_ = _e324;
    let _e325 = u_xlat1_;
    u_xlat18_ = (_e325.x + -1f);
    let _e333 = _f_buffer1_.f_cb1_[3];
    let _e335 = u_xlat18_;
    u_xlat18_ = ((_e333.x * _e335) + 1f);
    let _e339 = u_xlat0_;
    let _e341 = u_xlat18_;
    let _e343 = u_xlat0_;
    let _e345 = (vec3(_e341) * _e343.xyz);
    u_xlat0_.x = _e345.x;
    u_xlat0_.y = _e345.y;
    u_xlat0_.z = _e345.z;
    let _e352 = SV_Target0_;
    let _e354 = u_xlat0_;
    let _e356 = vs_COLOR0_1;
    let _e358 = (_e354.xyz * _e356.xyz);
    SV_Target0_.x = _e358.x;
    SV_Target0_.y = _e358.y;
    SV_Target0_.z = _e358.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(6) vs_TEXCOORD6_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
