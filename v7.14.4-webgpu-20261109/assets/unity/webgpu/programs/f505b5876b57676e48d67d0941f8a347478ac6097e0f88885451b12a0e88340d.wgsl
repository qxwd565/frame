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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e23 = vs_TEXCOORD0_1;
    let _e28 = _f_buffer0_.f_cb0_[4];
    let _e33 = hscard_bias.values[1];
    let _e36 = textureSampleBias(f_t1_, samplerf_s1_, _e23.xy, (_e28.x + _e33.x));
    u_xlat0_ = _e36;
    let _e37 = vs_TEXCOORD0_1;
    let _e42 = _f_buffer0_.f_cb0_[4];
    let _e47 = hscard_bias.values[0];
    let _e50 = textureSampleBias(f_t0_, samplerf_s0_, _e37.xy, (_e42.x + _e47.x));
    u_xlat1_ = _e50;
    let _e51 = u_xlat0_;
    let _e52 = u_xlat1_;
    u_xlat0_ = (_e51 + -(_e52));
    let _e58 = _f_buffer1_.f_cb1_[1];
    let _e60 = u_xlat0_;
    let _e62 = u_xlat1_;
    u_xlat0_ = ((_e58.xxxx * _e60) + _e62);
    let _e65 = u_xlat0_;
    let _e70 = _f_buffer1_.f_cb1_[1];
    SV_TARGET0_.w = (_e65.w * _e70.y);
    let _e74 = SV_TARGET0_;
    SV_TARGET0_.w = clamp(_e74.w, 0f, 1f);
    let _e79 = SV_TARGET0_;
    let _e81 = u_xlat0_;
    let _e82 = _e81.xyz;
    SV_TARGET0_.x = _e82.x;
    SV_TARGET0_.y = _e82.y;
    SV_TARGET0_.z = _e82.z;
    let _e89 = SV_TARGET0_;
    let _e91 = SV_TARGET0_;
    let _e97 = clamp(_e91.xyz, vec3(0f), vec3(1f));
    SV_TARGET0_.x = _e97.x;
    SV_TARGET0_.y = _e97.y;
    SV_TARGET0_.z = _e97.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e24 = SV_TARGET0_;
    return FragmentOutput(_e24);
}
