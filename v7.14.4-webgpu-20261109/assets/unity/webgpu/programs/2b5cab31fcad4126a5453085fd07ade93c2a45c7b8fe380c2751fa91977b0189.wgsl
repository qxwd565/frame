struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 6>,
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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);

    let _e26 = vs_COLOR0_1;
    let _e27 = vs_COLOR0_1;
    u_xlat0_ = (_e26 + _e27);
    let _e29 = vs_TEXCOORD0_1;
    let _e34 = _f_buffer0_.f_cb0_[4];
    let _e39 = hscard_bias.values[0];
    let _e42 = textureSampleBias(f_t0_, samplerf_s0_, _e29.xy, (_e34.x + _e39.x));
    u_xlat1_ = _e42;
    let _e43 = u_xlat0_;
    let _e44 = u_xlat1_;
    u_xlat0_ = (_e43 * _e44);
    let _e46 = u_xlat0_;
    let _e48 = u_xlat0_;
    u_xlat1_ = (_e46.wwww * _e48);
    let _e51 = u_xlat0_;
    u_xlat0_.x = dot(_e51.xyz, vec3<f32>(0.333f, 0.333f, 0.333f));
    let _e58 = u_xlat1_;
    let _e62 = _f_buffer1_.f_cb1_[3];
    u_xlat1_ = (_e58 * _e62.wwww);
    let _e65 = u_xlat2_;
    let _e67 = u_xlat1_;
    let _e72 = _f_buffer1_.f_cb1_[4];
    let _e74 = (_e67.xyz * _e72.xyz);
    u_xlat2_.x = _e74.x;
    u_xlat2_.y = _e74.y;
    u_xlat2_.z = _e74.z;
    let _e82 = u_xlat1_;
    let _e87 = _f_buffer1_.f_cb1_[5];
    u_xlat2_.w = (_e82.w * _e87.z);
    let _e90 = u_xlat2_;
    let _e94 = _f_buffer1_.f_cb1_[5];
    u_xlat1_ = (_e90 * _e94.yyyy);
    let _e97 = u_xlat0_;
    let _e99 = u_xlat1_;
    u_xlat0_ = (_e97.xxxx * _e99);
    let _e101 = u_xlat0_;
    SV_TARGET0_ = (_e101 * vec4<f32>(0.25f, 0.25f, 0.25f, 0.25f));
    return;
}

@fragment 
fn main(@location(10) vs_COLOR0_: vec4<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e24 = SV_TARGET0_;
    return FragmentOutput(_e24);
}
