struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat9_: f32 = 0f;

    let _e33 = vs_TEXCOORD0_1;
    let _e38 = hscard_bias.values[0];
    let _e40 = textureSampleBias(f_t0_, samplerf_s0_, _e33.xy, _e38.x);
    u_xlat0_ = _e40;
    let _e46 = u_xlat0_;
    u_xlat1_.x = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e46.xyz);
    let _e49 = u_xlat4_;
    let _e51 = u_xlat0_;
    let _e54 = u_xlat1_;
    let _e56 = (-(_e51.xyz) + _e54.xxx);
    u_xlat4_.x = _e56.x;
    u_xlat4_.y = _e56.y;
    u_xlat4_.z = _e56.z;
    let _e64 = u_xlat1_;
    u_xlat1_.x = (-(_e64.x) + 1f);
    let _e69 = u_xlat0_;
    let _e71 = u_xlat1_;
    u_xlat9_ = (_e69.w * _e71.x);
    let _e74 = u_xlat0_;
    let _e79 = _f_buffer0_.f_cb0_[3];
    let _e81 = u_xlat4_;
    let _e84 = u_xlat0_;
    let _e86 = ((_e79.xxx * _e81.xyz) + _e84.xyz);
    u_xlat0_.x = _e86.x;
    u_xlat0_.y = _e86.y;
    u_xlat0_.z = _e86.z;
    let _e93 = u_xlat1_;
    let _e95 = u_xlat0_;
    let _e101 = _f_buffer0_.f_cb0_[4];
    let _e103 = (-(_e95.xyz) + _e101.xyz);
    u_xlat1_.x = _e103.x;
    u_xlat1_.y = _e103.y;
    u_xlat1_.z = _e103.z;
    let _e110 = u_xlat1_;
    let _e115 = _f_buffer0_.f_cb0_[3];
    let _e117 = u_xlat1_;
    let _e120 = u_xlat0_;
    let _e122 = ((_e115.yyy * _e117.xyz) + _e120.xyz);
    u_xlat1_.x = _e122.x;
    u_xlat1_.y = _e122.y;
    u_xlat1_.z = _e122.z;
    let _e129 = vs_TEXCOORD1_1;
    let _e134 = hscard_bias.values[1];
    let _e136 = textureSampleBias(f_t1_, samplerf_s1_, _e129.xy, _e134.x);
    u_xlat2_ = _e136;
    let _e138 = u_xlat2_;
    let _e143 = _f_buffer0_.f_cb0_[1];
    u_xlat0_.x = (_e138.x * _e143.y);
    let _e147 = u_xlat0_;
    u_xlat0_.x = clamp(_e147.x, 0f, 1f);
    let _e153 = u_xlat0_;
    let _e155 = u_xlat9_;
    u_xlat1_.w = (_e153.x * _e155);
    let _e157 = u_xlat1_;
    let _e161 = _f_buffer0_.f_cb0_[2];
    u_xlat0_ = (_e157 * _e161);
    let _e163 = u_xlat0_;
    let _e167 = _f_buffer0_.f_cb0_[3];
    u_xlat0_ = (_e163 * _e167.zzzz);
    let _e170 = u_xlat0_;
    let _e171 = vs_COLOR0_1;
    SV_Target0_ = (_e170 * _e171);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e29 = SV_Target0_;
    return FragmentOutput(_e29);
}
