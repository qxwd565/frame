struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 2>,
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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec2<f32> = vec2(0f);

    let _e30 = _f_buffer1_.f_cb1_[0];
    u_xlat0_.x = (_e30.x * 0.3f);
    let _e34 = vs_TEXCOORD0_1;
    let _e39 = _f_buffer0_.f_cb0_[4];
    let _e44 = hscard_bias.values[0];
    let _e47 = textureSampleBias(f_t0_, samplerf_s0_, _e34.xy, (_e39.x + _e44.x));
    u_xlat1_ = _e47;
    let _e48 = u_xlat2_;
    let _e50 = u_xlat0_;
    let _e52 = u_xlat1_;
    let _e54 = (_e50.xx * _e52.xy);
    u_xlat2_.x = _e54.x;
    u_xlat2_.y = _e54.y;
    let _e60 = u_xlat2_;
    let _e62 = u_xlat2_;
    u_xlat2_.x = (_e60.y + _e62.x);
    let _e66 = u_xlat1_;
    let _e68 = u_xlat0_;
    let _e71 = u_xlat2_;
    u_xlat0_.x = ((_e66.z * _e68.x) + _e71.x);
    let _e77 = _f_buffer1_.f_cb1_[1];
    let _e78 = u_xlat0_;
    let _e81 = u_xlat1_;
    u_xlat0_ = ((_e77 * _e78.xxxx) + -(_e81));
    let _e87 = _f_buffer1_.f_cb1_[0];
    let _e89 = u_xlat0_;
    let _e91 = u_xlat1_;
    u_xlat0_ = ((_e87.yyyy * _e89) + _e91);
    let _e93 = u_xlat0_;
    let _e94 = vs_COLOR0_1;
    SV_Target0_ = (_e93 * _e94);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_Target0_;
    return FragmentOutput(_e24);
}
