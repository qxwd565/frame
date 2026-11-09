struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 10>,
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

    let _e27 = vs_TEXCOORD1_1;
    let _e32 = _f_buffer0_.f_cb0_[4];
    let _e37 = hscard_bias.values[1];
    let _e40 = textureSampleBias(f_t1_, samplerf_s1_, _e27.xy, (_e32.x + _e37.x));
    u_xlat0_ = _e40;
    let _e41 = u_xlat0_;
    let _e43 = u_xlat0_;
    let _e50 = (_e43.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat0_.x = _e50.x;
    u_xlat0_.y = _e50.y;
    let _e55 = u_xlat0_;
    let _e57 = u_xlat0_;
    let _e62 = _f_buffer1_.f_cb1_[9];
    let _e64 = (_e57.xy * _e62.xy);
    u_xlat0_.x = _e64.x;
    u_xlat0_.y = _e64.y;
    let _e69 = u_xlat0_;
    let _e71 = u_xlat0_;
    let _e76 = _f_buffer1_.f_cb1_[8];
    let _e79 = vs_TEXCOORD0_1;
    let _e81 = ((_e71.xy * _e76.ww) + _e79.xy);
    u_xlat0_.x = _e81.x;
    u_xlat0_.y = _e81.y;
    let _e86 = u_xlat0_;
    let _e91 = _f_buffer0_.f_cb0_[4];
    let _e96 = hscard_bias.values[0];
    let _e99 = textureSampleBias(f_t0_, samplerf_s0_, _e86.xy, (_e91.x + _e96.x));
    u_xlat0_ = _e99;
    let _e101 = u_xlat0_;
    let _e107 = _f_buffer1_.f_cb1_[6];
    u_xlat1_.x = (-(_e101.w) + _e107.w);
    let _e111 = u_xlat0_;
    let _e113 = u_xlat1_;
    u_xlat1_.w = (_e111.w * _e113.x);
    let _e116 = u_xlat1_;
    let _e118 = u_xlat0_;
    let _e123 = _f_buffer1_.f_cb1_[6];
    let _e125 = (_e118.xyz * _e123.xyz);
    u_xlat1_.x = _e125.x;
    u_xlat1_.y = _e125.y;
    u_xlat1_.z = _e125.z;
    let _e132 = vs_TEXCOORD1_1;
    let _e137 = _f_buffer0_.f_cb0_[4];
    let _e142 = hscard_bias.values[2];
    let _e145 = textureSampleBias(f_t2_, samplerf_s2_, _e132.zw, (_e137.x + _e142.x));
    u_xlat0_ = _e145;
    let _e146 = u_xlat0_;
    let _e147 = u_xlat1_;
    u_xlat0_ = (_e146 * _e147);
    let _e149 = u_xlat0_;
    let _e150 = vs_COLOR0_1;
    SV_TARGET0_ = (_e149 * _e150);
    let _e152 = SV_TARGET0_;
    SV_TARGET0_ = clamp(_e152, vec4(0f), vec4(1f));
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
