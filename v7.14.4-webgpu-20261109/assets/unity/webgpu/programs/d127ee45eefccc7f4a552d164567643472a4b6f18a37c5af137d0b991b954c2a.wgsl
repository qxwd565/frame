struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 3>,
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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e23 = vs_TEXCOORD0_1;
    let _e28 = _f_buffer0_.f_cb0_[4];
    let _e33 = hscard_bias.values[1];
    let _e36 = textureSampleBias(f_t1_, samplerf_s1_, _e23.xy, (_e28.x + _e33.x));
    u_xlat0_ = _e36;
    let _e37 = u_xlat0_;
    let _e41 = _f_buffer1_.f_cb1_[1];
    u_xlat0_ = (_e37 * _e41);
    let _e43 = u_xlat0_;
    u_xlat0_ = max(_e43, vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
    let _e50 = u_xlat0_;
    u_xlat0_ = (_e50 + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
    let _e61 = vs_TEXCOORD0_1;
    let _e66 = _f_buffer0_.f_cb0_[4];
    let _e71 = hscard_bias.values[0];
    let _e74 = textureSampleBias(f_t0_, samplerf_s0_, _e61.zw, (_e66.x + _e71.x));
    u_xlat1_ = _e74;
    let _e75 = u_xlat0_;
    let _e79 = _f_buffer1_.f_cb1_[2];
    let _e82 = u_xlat1_;
    u_xlat0_ = ((_e75 * _e79.yyyy) + _e82);
    let _e84 = u_xlat0_;
    let _e88 = _f_buffer1_.f_cb1_[2];
    SV_TARGET0_ = (_e84 * _e88.xxxx);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e24 = SV_TARGET0_;
    return FragmentOutput(_e24);
}
