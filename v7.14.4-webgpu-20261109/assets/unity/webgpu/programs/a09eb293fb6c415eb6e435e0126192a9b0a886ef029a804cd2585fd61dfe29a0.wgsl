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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e24 = vs_TEXCOORD0_1;
    let _e29 = _f_buffer0_.f_cb0_[4];
    let _e34 = hscard_bias.values[0];
    let _e37 = textureSampleBias(f_t0_, samplerf_s0_, _e24.xy, (_e29.x + _e34.x));
    u_xlat0_ = _e37;
    let _e42 = u_xlat0_;
    u_xlat6_ = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e42.xyz);
    let _e45 = u_xlat1_;
    let _e47 = u_xlat0_;
    let _e52 = _f_buffer1_.f_cb1_[1];
    let _e54 = (_e47.xyz * _e52.xyz);
    u_xlat1_.x = _e54.x;
    u_xlat1_.y = _e54.y;
    u_xlat1_.z = _e54.z;
    let _e62 = u_xlat6_;
    let _e66 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.w = (_e62 * _e66.y);
    let _e69 = u_xlat1_;
    let _e73 = _f_buffer1_.f_cb1_[2];
    SV_Target0_ = (_e69 * _e73.xxxx);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e20 = SV_Target0_;
    return FragmentOutput(_e20);
}
