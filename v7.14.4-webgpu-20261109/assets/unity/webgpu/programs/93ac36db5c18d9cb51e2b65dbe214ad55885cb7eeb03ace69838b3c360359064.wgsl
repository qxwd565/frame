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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e24 = u_xlat0_;
    let _e26 = vs_TEXCOORD0_1;
    let _e28 = vs_COLOR0_1;
    let _e30 = (_e26.xy + _e28.xx);
    u_xlat0_.x = _e30.x;
    u_xlat0_.y = _e30.y;
    let _e35 = u_xlat0_;
    let _e37 = vs_COLOR0_1;
    let _e43 = _f_buffer1_.f_cb1_[2];
    let _e46 = u_xlat0_;
    let _e48 = ((-(_e37.ww) * _e43.xy) + _e46.xy);
    u_xlat0_.x = _e48.x;
    u_xlat0_.y = _e48.y;
    let _e53 = u_xlat0_;
    let _e55 = u_xlat0_;
    let _e60 = _f_buffer1_.f_cb1_[2];
    let _e62 = (_e55.xy * _e60.zz);
    u_xlat0_.x = _e62.x;
    u_xlat0_.y = _e62.y;
    let _e67 = u_xlat0_;
    let _e72 = _f_buffer0_.f_cb0_[4];
    let _e77 = hscard_bias.values[1];
    let _e80 = textureSampleBias(f_t1_, samplerf_s1_, _e67.xy, (_e72.x + _e77.x));
    u_xlat0_ = _e80;
    let _e81 = vs_TEXCOORD0_1;
    let _e86 = _f_buffer0_.f_cb0_[4];
    let _e91 = hscard_bias.values[0];
    let _e94 = textureSampleBias(f_t0_, samplerf_s0_, _e81.xy, (_e86.x + _e91.x));
    u_xlat1_ = _e94;
    let _e96 = u_xlat0_;
    let _e98 = u_xlat1_;
    u_xlat0_.x = (_e96.x * _e98.w);
    let _e102 = u_xlat0_;
    let _e107 = _f_buffer1_.f_cb1_[2];
    u_xlat0_.x = (_e102.x * _e107.w);
    let _e111 = u_xlat0_;
    let _e113 = vs_COLOR0_1;
    SV_TARGET0_.w = (_e111.x * _e113.w);
    let _e116 = SV_TARGET0_;
    let _e121 = _f_buffer1_.f_cb1_[1];
    let _e122 = _e121.xyz;
    SV_TARGET0_.x = _e122.x;
    SV_TARGET0_.y = _e122.y;
    SV_TARGET0_.z = _e122.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_TARGET0_;
    return FragmentOutput(_e28);
}
