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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: f32 = 0f;

    let _e30 = vs_TEXCOORD1_1;
    let _e35 = _f_buffer0_.f_cb0_[4];
    let _e40 = hscard_bias.values[1];
    let _e43 = textureSampleBias(f_t1_, samplerf_s1_, _e30.xy, (_e35.x + _e40.x));
    u_xlat0_ = _e43;
    let _e44 = u_xlat0_;
    let _e46 = u_xlat0_;
    let _e51 = _f_buffer1_.f_cb1_[5];
    let _e53 = (_e46.xy * _e51.xy);
    u_xlat0_.x = _e53.x;
    u_xlat0_.y = _e53.y;
    let _e58 = u_xlat0_;
    let _e60 = u_xlat0_;
    let _e65 = _f_buffer1_.f_cb1_[3];
    let _e67 = (_e60.xy * _e65.yy);
    u_xlat0_.x = _e67.x;
    u_xlat0_.y = _e67.y;
    let _e72 = vs_TEXCOORD1_1;
    let _e77 = _f_buffer0_.f_cb0_[4];
    let _e82 = hscard_bias.values[2];
    let _e85 = textureSampleBias(f_t2_, samplerf_s2_, _e72.zw, (_e77.x + _e82.x));
    u_xlat1_ = _e85;
    let _e86 = u_xlat1_;
    let _e91 = _f_buffer1_.f_cb1_[7];
    u_xlat4_ = (_e86.x * _e91.x);
    let _e94 = u_xlat0_;
    let _e96 = u_xlat0_;
    let _e98 = u_xlat4_;
    let _e101 = vs_TEXCOORD0_1;
    let _e103 = ((_e96.xy * vec2(_e98)) + _e101.xy);
    u_xlat0_.x = _e103.x;
    u_xlat0_.y = _e103.y;
    let _e108 = u_xlat0_;
    let _e113 = _f_buffer0_.f_cb0_[4];
    let _e118 = hscard_bias.values[0];
    let _e121 = textureSampleBias(f_t0_, samplerf_s0_, _e108.xy, (_e113.x + _e118.x));
    u_xlat0_ = _e121;
    let _e122 = u_xlat0_;
    let _e124 = u_xlat0_;
    let _e129 = _f_buffer1_.f_cb1_[4];
    let _e131 = (_e124.xyz * _e129.xyz);
    u_xlat0_.x = _e131.x;
    u_xlat0_.y = _e131.y;
    u_xlat0_.z = _e131.z;
    let _e138 = u_xlat0_;
    let _e139 = vs_COLOR0_1;
    SV_TARGET0_ = (_e138 * _e139);
    let _e141 = SV_TARGET0_;
    SV_TARGET0_ = clamp(_e141, vec4(0f), vec4(1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e36 = SV_TARGET0_;
    return FragmentOutput(_e36);
}
