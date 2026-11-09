struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 16>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 6>,
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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat7_: vec2<f32> = vec2(0f);
    var u_xlat10_: f32 = 0f;

    let _e43 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = (_e43.y * 0.5f);
    let _e48 = u_xlat0_;
    u_xlat0_.x = fract(_e48.x);
    let _e51 = vs_TEXCOORD0_1;
    let _e56 = _f_buffer0_.f_cb0_[4];
    let _e61 = hscard_bias.values[1];
    let _e64 = textureSampleBias(f_t1_, samplerf_s1_, _e51.zw, (_e56.x + _e61.x));
    u_xlat1_ = _e64;
    let _e65 = u_xlat3_;
    let _e67 = u_xlat1_;
    let _e78 = ((_e67.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e78.x;
    u_xlat3_.y = _e78.y;
    let _e83 = u_xlat3_;
    let _e85 = u_xlat3_;
    let _e90 = _f_buffer1_.f_cb1_[5];
    let _e92 = (_e85.xy * _e90.zw);
    u_xlat3_.x = _e92.x;
    u_xlat3_.y = _e92.y;
    let _e97 = u_xlat0_;
    let _e99 = u_xlat0_;
    let _e101 = u_xlat3_;
    let _e103 = (_e99.xx * _e101.xy);
    u_xlat0_.x = _e103.x;
    u_xlat0_.w = _e103.y;
    let _e108 = u_xlat1_;
    let _e110 = vs_TEXCOORD0_1;
    let _e111 = _e110.xy;
    u_xlat1_.x = _e111.x;
    u_xlat1_.y = _e111.y;
    let _e116 = u_xlat1_;
    let _e118 = u_xlat1_;
    let _e124 = clamp(_e118.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    let _e129 = u_xlat1_;
    let _e131 = u_xlat1_;
    let _e133 = vs_TEXCOORD0_1;
    let _e136 = (_e131.xy + -(_e133.xy));
    u_xlat1_.x = _e136.x;
    u_xlat1_.y = _e136.y;
    let _e141 = u_xlat1_;
    let _e146 = _f_buffer1_.f_cb1_[3];
    let _e148 = u_xlat1_;
    let _e151 = vs_TEXCOORD0_1;
    let _e153 = ((_e146.zz * _e148.xy) + _e151.xy);
    u_xlat1_.x = _e153.x;
    u_xlat1_.y = _e153.y;
    let _e158 = u_xlat7_;
    let _e160 = u_xlat1_;
    let _e171 = ((_e160.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat7_.x = _e171.x;
    u_xlat7_.y = _e171.y;
    let _e176 = u_xlat7_;
    let _e178 = u_xlat7_;
    let _e185 = (-(abs(_e178.xy)) + vec2<f32>(1f, 1f));
    u_xlat7_.x = _e185.x;
    u_xlat7_.y = _e185.y;
    let _e190 = u_xlat7_;
    let _e192 = u_xlat7_;
    let _e197 = (_e192.xy * vec2<f32>(3f, 3f));
    u_xlat7_.x = _e197.x;
    u_xlat7_.y = _e197.y;
    let _e202 = u_xlat7_;
    let _e204 = u_xlat7_;
    let _e210 = clamp(_e204.xy, vec2(0f), vec2(1f));
    u_xlat7_.x = _e210.x;
    u_xlat7_.y = _e210.y;
    let _e215 = u_xlat7_;
    let _e217 = u_xlat7_;
    let _e224 = (_e217.xy + vec2<f32>(-1f, -1f));
    u_xlat7_.x = _e224.x;
    u_xlat7_.y = _e224.y;
    let _e229 = u_xlat7_;
    let _e234 = _f_buffer1_.f_cb1_[3];
    let _e236 = u_xlat7_;
    let _e242 = ((_e234.zz * _e236.xy) + vec2<f32>(1f, 1f));
    u_xlat7_.x = _e242.x;
    u_xlat7_.y = _e242.y;
    let _e247 = u_xlat0_;
    let _e249 = u_xlat0_;
    let _e251 = u_xlat7_;
    let _e254 = u_xlat1_;
    let _e256 = ((_e249.xw * _e251.xy) + _e254.xy);
    u_xlat0_.x = _e256.x;
    u_xlat0_.w = _e256.y;
    let _e261 = u_xlat0_;
    let _e266 = _f_buffer0_.f_cb0_[4];
    let _e271 = hscard_bias.values[0];
    let _e274 = textureSampleBias(f_t0_, samplerf_s0_, _e261.xw, (_e266.x + _e271.x));
    u_xlat2_ = _e274;
    let _e279 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = ((_e279.y * 0.5f) + 0.5f);
    let _e286 = u_xlat0_;
    u_xlat0_.x = fract(_e286.x);
    let _e289 = u_xlat3_;
    let _e291 = u_xlat0_;
    let _e293 = u_xlat3_;
    let _e295 = (_e291.xx * _e293.xy);
    u_xlat3_.x = _e295.x;
    u_xlat3_.y = _e295.y;
    let _e301 = u_xlat0_;
    u_xlat0_.x = (-(_e301.x) + 0.5f);
    let _e307 = u_xlat0_;
    let _e309 = u_xlat0_;
    u_xlat0_.x = (_e307.x + _e309.x);
    let _e312 = u_xlat3_;
    let _e314 = u_xlat3_;
    let _e316 = u_xlat7_;
    let _e319 = u_xlat1_;
    let _e321 = ((_e314.xy * _e316.xy) + _e319.xy);
    u_xlat3_.x = _e321.x;
    u_xlat3_.y = _e321.y;
    let _e326 = u_xlat3_;
    let _e331 = _f_buffer0_.f_cb0_[4];
    let _e336 = hscard_bias.values[0];
    let _e339 = textureSampleBias(f_t0_, samplerf_s0_, _e326.xy, (_e331.x + _e336.x));
    u_xlat1_ = _e339;
    let _e340 = u_xlat1_;
    let _e342 = u_xlat2_;
    u_xlat2_ = (-(_e340) + _e342);
    let _e344 = u_xlat0_;
    let _e347 = u_xlat2_;
    let _e349 = u_xlat1_;
    u_xlat0_ = ((abs(_e344.xxxx) * _e347) + _e349);
    let _e351 = u_xlat1_;
    let _e353 = u_xlat0_;
    let _e358 = _f_buffer1_.f_cb1_[2];
    let _e360 = (_e353.xyz + _e358.yyy);
    u_xlat1_.x = _e360.x;
    u_xlat1_.y = _e360.y;
    u_xlat1_.z = _e360.z;
    let _e367 = u_xlat0_;
    let _e372 = _f_buffer1_.f_cb1_[3];
    u_xlat10_ = max(_e367.w, _e372.y);
    let _e375 = u_xlat1_;
    let _e377 = u_xlat10_;
    let _e379 = u_xlat1_;
    let _e381 = (vec3(_e377) * _e379.xyz);
    u_xlat1_.x = _e381.x;
    u_xlat1_.y = _e381.y;
    u_xlat1_.z = _e381.z;
    let _e388 = u_xlat0_;
    let _e390 = u_xlat1_;
    let _e395 = _f_buffer1_.f_cb1_[2];
    let _e397 = (_e390.xyz * _e395.xxx);
    u_xlat0_.x = _e397.x;
    u_xlat0_.y = _e397.y;
    u_xlat0_.z = _e397.z;
    let _e404 = u_xlat0_;
    let _e405 = vs_COLOR0_1;
    SV_Target0_ = (_e404 * _e405);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
