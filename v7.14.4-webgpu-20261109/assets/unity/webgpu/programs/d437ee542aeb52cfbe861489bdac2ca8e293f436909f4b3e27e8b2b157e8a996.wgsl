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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);

    let _e18 = vs_TEXCOORD0_1;
    let _e23 = _f_buffer0_.f_cb0_[4];
    let _e28 = hscard_bias.values[0];
    let _e31 = textureSampleBias(f_t0_, samplerf_s0_, _e18.xy, (_e23.x + _e28.x));
    u_xlat0_ = _e31;
    let _e37 = u_xlat0_;
    u_xlat0_.x = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e37.xyz);
    let _e41 = u_xlat0_;
    let _e46 = _f_buffer1_.f_cb1_[4];
    u_xlat0_.x = (_e41.x * _e46.y);
    let _e50 = u_xlat0_;
    u_xlat0_.x = clamp(_e50.x, 0f, 1f);
    let _e56 = u_xlat0_;
    let _e58 = vs_COLOR0_1;
    SV_Target0_.w = (_e56.x * _e58.w);
    let _e61 = SV_Target0_;
    let _e63 = vs_COLOR0_1;
    let _e65 = vs_COLOR0_1;
    let _e67 = (_e63.xyz + _e65.xyz);
    SV_Target0_.x = _e67.x;
    SV_Target0_.y = _e67.y;
    SV_Target0_.z = _e67.z;
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
