struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 11>,
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
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);

    let _e45 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (-(_e45.w) + 1f);
    let _e50 = u_xlat4_;
    let _e52 = vs_TEXCOORD0_1;
    let _e53 = _e52.xy;
    u_xlat4_.x = _e53.x;
    u_xlat4_.y = _e53.y;
    let _e58 = u_xlat4_;
    let _e60 = u_xlat4_;
    let _e66 = clamp(_e60.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e66.x;
    u_xlat4_.y = _e66.y;
    let _e71 = u_xlat4_;
    let _e73 = u_xlat4_;
    let _e75 = vs_TEXCOORD0_1;
    let _e78 = (_e73.xy + -(_e75.xy));
    u_xlat4_.x = _e78.x;
    u_xlat4_.y = _e78.y;
    let _e83 = u_xlat4_;
    let _e88 = _f_buffer1_.f_cb1_[3];
    let _e90 = u_xlat4_;
    let _e93 = vs_TEXCOORD0_1;
    let _e95 = ((_e88.zz * _e90.xy) + _e93.xy);
    u_xlat4_.x = _e95.x;
    u_xlat4_.y = _e95.y;
    let _e100 = u_xlat4_;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[0];
    let _e113 = textureSampleBias(f_t0_, samplerf_s0_, _e100.xy, (_e105.x + _e110.x));
    u_xlat1_ = _e113.yzwx;
    let _e115 = u_xlat4_;
    let _e117 = u_xlat1_;
    let _e122 = _f_buffer1_.f_cb1_[2];
    let _e124 = (_e117.wxy + _e122.yyy);
    u_xlat4_.x = _e124.x;
    u_xlat4_.y = _e124.y;
    u_xlat4_.z = _e124.z;
    let _e132 = u_xlat1_;
    let _e137 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e132.w, _e137.y);
    let _e141 = u_xlat4_;
    let _e143 = u_xlat2_;
    let _e149 = _f_buffer1_.f_cb1_[10];
    u_xlat6_.x = ((_e141.y * _e143.x) + -(_e149.w));
    let _e153 = u_xlat4_;
    let _e155 = u_xlat4_;
    let _e157 = u_xlat2_;
    let _e159 = (_e155.xyz * _e157.xxx);
    u_xlat4_.x = _e159.x;
    u_xlat4_.y = _e159.y;
    u_xlat4_.z = _e159.z;
    let _e167 = u_xlat6_;
    let _e169 = u_xlat0_;
    u_xlat0_.x = (_e167.x / _e169.x);
    let _e173 = u_xlat6_;
    u_xlat2_.x = (_e173.x * 5f);
    let _e178 = u_xlat2_;
    u_xlat2_.x = clamp(_e178.x, 0f, 1f);
    let _e183 = u_xlat6_;
    let _e188 = _f_buffer1_.f_cb1_[8];
    let _e193 = _f_buffer1_.f_cb1_[9];
    let _e196 = (_e188.yzw + -(_e193.xyz));
    u_xlat6_.x = _e196.x;
    u_xlat6_.y = _e196.y;
    u_xlat6_.z = _e196.z;
    let _e203 = u_xlat6_;
    let _e205 = u_xlat0_;
    let _e207 = u_xlat6_;
    let _e213 = _f_buffer1_.f_cb1_[9];
    let _e215 = ((_e205.xxx * _e207.xyz) + _e213.xyz);
    u_xlat6_.x = _e215.x;
    u_xlat6_.y = _e215.y;
    u_xlat6_.z = _e215.z;
    let _e228 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (1f / _e228.w);
    let _e232 = u_xlat0_;
    let _e234 = u_xlat4_;
    u_xlat0_.x = (_e232.x * _e234.y);
    let _e237 = u_xlat3_;
    let _e242 = _f_buffer1_.f_cb1_[9];
    let _e247 = _f_buffer1_.f_cb1_[10];
    let _e250 = (_e242.xyz + -(_e247.xyz));
    u_xlat3_.x = _e250.x;
    u_xlat3_.y = _e250.y;
    u_xlat3_.z = _e250.z;
    let _e257 = u_xlat3_;
    let _e259 = u_xlat0_;
    let _e261 = u_xlat3_;
    let _e267 = _f_buffer1_.f_cb1_[10];
    let _e269 = ((_e259.xxx * _e261.xyz) + _e267.xyz);
    u_xlat3_.x = _e269.x;
    u_xlat3_.y = _e269.y;
    u_xlat3_.z = _e269.z;
    let _e276 = u_xlat6_;
    let _e278 = u_xlat6_;
    let _e280 = u_xlat3_;
    let _e283 = (_e278.xyz + -(_e280.xyz));
    u_xlat6_.x = _e283.x;
    u_xlat6_.y = _e283.y;
    u_xlat6_.z = _e283.z;
    let _e290 = u_xlat2_;
    let _e292 = u_xlat2_;
    let _e294 = u_xlat6_;
    let _e297 = u_xlat3_;
    let _e299 = ((_e292.xxx * _e294.xyz) + _e297.xyz);
    u_xlat2_.x = _e299.x;
    u_xlat2_.y = _e299.y;
    u_xlat2_.z = _e299.z;
    let _e306 = u_xlat0_;
    let _e308 = u_xlat4_;
    let _e310 = u_xlat2_;
    let _e312 = (_e308.xyz * _e310.xyz);
    u_xlat0_.x = _e312.x;
    u_xlat0_.y = _e312.y;
    u_xlat0_.z = _e312.z;
    let _e319 = u_xlat1_;
    let _e321 = u_xlat0_;
    let _e326 = _f_buffer1_.f_cb1_[2];
    let _e328 = (_e321.xyz * _e326.xxx);
    u_xlat1_.x = _e328.x;
    u_xlat1_.y = _e328.y;
    u_xlat1_.z = _e328.z;
    let _e335 = vs_TEXCOORD0_1;
    let _e340 = _f_buffer0_.f_cb0_[4];
    let _e345 = hscard_bias.values[1];
    let _e348 = textureSampleBias(f_t1_, samplerf_s1_, _e335.zw, (_e340.x + _e345.x));
    u_xlat0_ = _e348;
    let _e349 = u_xlat0_;
    let _e350 = vs_COLOR1_1;
    let _e352 = u_xlat1_;
    u_xlat0_ = ((_e349 * _e350) + _e352);
    let _e354 = u_xlat0_;
    let _e355 = vs_COLOR0_1;
    SV_Target0_ = (_e354 * _e355);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
