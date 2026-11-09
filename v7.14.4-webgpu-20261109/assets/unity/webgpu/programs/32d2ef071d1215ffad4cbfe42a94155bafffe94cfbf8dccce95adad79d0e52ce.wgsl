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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e24 = vs_TEXCOORD1_1;
    let _e29 = _f_buffer0_.f_cb0_[4];
    let _e34 = hscard_bias.values[1];
    let _e37 = textureSampleBias(f_t1_, samplerf_s1_, _e24.zw, (_e29.x + _e34.x));
    u_xlat0_ = _e37;
    let _e38 = u_xlat0_;
    let _e40 = u_xlat0_;
    let _e45 = _f_buffer1_.f_cb1_[2];
    let _e47 = (_e40.xyz * _e45.xyz);
    u_xlat0_.x = _e47.x;
    u_xlat0_.y = _e47.y;
    u_xlat0_.z = _e47.z;
    let _e54 = u_xlat0_;
    let _e56 = u_xlat0_;
    let _e61 = _f_buffer1_.f_cb1_[3];
    let _e63 = (_e56.xyz * _e61.xxx);
    u_xlat0_.x = _e63.x;
    u_xlat0_.y = _e63.y;
    u_xlat0_.z = _e63.z;
    let _e70 = u_xlat0_;
    let _e72 = u_xlat0_;
    let _e77 = _f_buffer1_.f_cb1_[2];
    let _e79 = (_e72.xyz * _e77.www);
    u_xlat0_.x = _e79.x;
    u_xlat0_.y = _e79.y;
    u_xlat0_.z = _e79.z;
    let _e86 = vs_TEXCOORD1_1;
    let _e91 = _f_buffer0_.f_cb0_[4];
    let _e96 = hscard_bias.values[0];
    let _e99 = textureSampleBias(f_t0_, samplerf_s0_, _e86.xy, (_e91.x + _e96.x));
    u_xlat1_ = _e99;
    let _e100 = u_xlat1_;
    let _e104 = _f_buffer1_.f_cb1_[0];
    u_xlat1_ = (_e100 * _e104);
    let _e106 = u_xlat1_;
    let _e108 = u_xlat1_;
    let _e113 = _f_buffer1_.f_cb1_[1];
    let _e115 = (_e108.xyz * _e113.xxx);
    u_xlat1_.x = _e115.x;
    u_xlat1_.y = _e115.y;
    u_xlat1_.z = _e115.z;
    let _e122 = u_xlat0_;
    let _e124 = u_xlat1_;
    let _e129 = _f_buffer1_.f_cb1_[0];
    let _e132 = u_xlat0_;
    let _e134 = ((_e124.xyz * _e129.www) + _e132.xyz);
    u_xlat0_.x = _e134.x;
    u_xlat0_.y = _e134.y;
    u_xlat0_.z = _e134.z;
    let _e141 = u_xlat0_;
    let _e143 = u_xlat0_;
    let _e145 = vs_COLOR0_1;
    let _e147 = (_e143.xyz * _e145.www);
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    u_xlat0_.z = _e147.z;
    let _e158 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = _e158.x;
    let _e161 = u_xlat1_;
    u_xlat1_.x = clamp(_e161.x, 0f, 1f);
    let _e167 = u_xlat1_;
    let _e169 = u_xlat1_;
    u_xlat0_.w = (_e167.x * _e169.w);
    let _e172 = u_xlat0_;
    let _e173 = vs_COLOR0_1;
    SV_TARGET0_ = (_e172 * _e173);
    let _e175 = SV_TARGET0_;
    SV_TARGET0_ = clamp(_e175, vec4(0f), vec4(1f));
    return;
}

@fragment 
fn main(@location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>) -> FragmentOutput {
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e28 = SV_TARGET0_;
    return FragmentOutput(_e28);
}
