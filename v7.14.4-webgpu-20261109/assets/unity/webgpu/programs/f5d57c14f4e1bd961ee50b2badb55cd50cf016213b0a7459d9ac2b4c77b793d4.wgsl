struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 5>,
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

    let _e28 = vs_TEXCOORD0_1;
    let _e33 = _f_buffer0_.f_cb0_[4];
    let _e38 = hscard_bias.values[1];
    let _e41 = textureSampleBias(f_t1_, samplerf_s1_, _e28.zw, (_e33.x + _e38.x));
    u_xlat0_ = _e41;
    let _e42 = u_xlat0_;
    let _e46 = _f_buffer1_.f_cb1_[3];
    u_xlat0_ = (_e42 * _e46);
    let _e48 = u_xlat0_;
    let _e52 = _f_buffer1_.f_cb1_[4];
    u_xlat0_ = (_e48 * _e52.xxxx);
    let _e55 = vs_TEXCOORD0_1;
    let _e60 = _f_buffer0_.f_cb0_[4];
    let _e65 = hscard_bias.values[0];
    let _e68 = textureSampleBias(f_t0_, samplerf_s0_, _e55.xy, (_e60.x + _e65.x));
    u_xlat1_ = _e68;
    let _e69 = u_xlat1_;
    let _e70 = u_xlat0_;
    let _e72 = u_xlat1_;
    u_xlat2_ = ((_e69 * _e70) + -(_e72));
    let _e75 = u_xlat0_;
    let _e77 = u_xlat2_;
    let _e79 = u_xlat1_;
    u_xlat0_ = ((_e75.wwww * _e77) + _e79);
    let _e81 = u_xlat0_;
    let _e82 = vs_COLOR0_1;
    SV_Target0_ = (_e81 * _e82);
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
