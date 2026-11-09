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
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);

    let _e29 = vs_TEXCOORD0_1;
    let _e34 = _f_buffer0_.f_cb0_[4];
    let _e39 = hscard_bias.values[0];
    let _e42 = textureSampleBias(f_t0_, samplerf_s0_, _e29.xy, (_e34.x + _e39.x));
    u_xlat0_ = _e42;
    let _e43 = vs_TEXCOORD5_1;
    let _e48 = _f_buffer0_.f_cb0_[4];
    let _e53 = hscard_bias.values[1];
    let _e56 = textureSampleBias(f_t1_, samplerf_s1_, _e43.xy, (_e48.x + _e53.x));
    u_xlat1_ = _e56;
    let _e58 = u_xlat1_;
    let _e63 = _f_buffer1_.f_cb1_[3];
    u_xlat1_.x = (_e58.x * _e63.x);
    let _e66 = u_xlat2_;
    let _e68 = u_xlat1_;
    let _e73 = _f_buffer1_.f_cb1_[2];
    let _e75 = (_e68.zzz * _e73.xyz);
    u_xlat2_.x = _e75.x;
    u_xlat2_.y = _e75.y;
    u_xlat2_.z = _e75.z;
    let _e82 = u_xlat0_;
    let _e84 = u_xlat0_;
    let _e86 = u_xlat1_;
    let _e89 = u_xlat2_;
    let _e91 = ((_e84.xyz * _e86.xxx) + _e89.xyz);
    u_xlat0_.x = _e91.x;
    u_xlat0_.y = _e91.y;
    u_xlat0_.z = _e91.z;
    let _e99 = u_xlat0_;
    SV_Target0_.w = _e99.w;
    let _e101 = u_xlat0_;
    let _e103 = u_xlat1_;
    let _e108 = _f_buffer1_.f_cb1_[3];
    let _e111 = u_xlat0_;
    let _e113 = ((_e103.yyy * _e108.yyy) + _e111.xyz);
    u_xlat0_.x = _e113.x;
    u_xlat0_.y = _e113.y;
    u_xlat0_.z = _e113.z;
    let _e120 = SV_Target0_;
    let _e122 = u_xlat0_;
    let _e124 = vs_COLOR0_1;
    let _e126 = (_e122.xyz * _e124.xyz);
    SV_Target0_.x = _e126.x;
    SV_Target0_.y = _e126.y;
    SV_Target0_.z = _e126.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
