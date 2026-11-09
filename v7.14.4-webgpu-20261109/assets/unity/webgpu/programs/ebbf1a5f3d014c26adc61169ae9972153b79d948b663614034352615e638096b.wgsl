struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 7>,
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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e32 = vs_TEXCOORD1_1;
    let _e37 = _f_buffer0_.f_cb0_[4];
    let _e42 = hscard_bias.values[1];
    let _e45 = textureSampleBias(f_t1_, samplerf_s1_, _e32.xy, (_e37.x + _e42.x));
    u_xlat0_ = _e45;
    let _e46 = u_xlat4_;
    let _e51 = _f_buffer1_.f_cb1_[3];
    let _e56 = _f_buffer1_.f_cb1_[6];
    let _e58 = (_e51.ww * _e56.xy);
    u_xlat4_.x = _e58.x;
    u_xlat4_.y = _e58.y;
    let _e63 = u_xlat0_;
    let _e65 = u_xlat0_;
    let _e67 = u_xlat4_;
    let _e70 = vs_TEXCOORD0_1;
    let _e72 = ((_e65.xy * _e67.xy) + _e70.xy);
    u_xlat0_.x = _e72.x;
    u_xlat0_.y = _e72.y;
    let _e77 = u_xlat0_;
    let _e82 = _f_buffer0_.f_cb0_[4];
    let _e87 = hscard_bias.values[0];
    let _e90 = textureSampleBias(f_t0_, samplerf_s0_, _e77.xy, (_e82.x + _e87.x));
    u_xlat0_ = _e90;
    let _e91 = u_xlat0_;
    let _e95 = _f_buffer1_.f_cb1_[5];
    u_xlat0_ = (_e91 * _e95);
    let _e97 = vs_TEXCOORD2_1;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[2];
    let _e110 = textureSampleBias(f_t2_, samplerf_s2_, _e97.xy, (_e102.x + _e107.x));
    u_xlat1_ = _e110;
    let _e112 = u_xlat0_;
    let _e114 = u_xlat1_;
    u_xlat0_.w = (_e112.w * _e114.x);
    let _e117 = u_xlat0_;
    let _e118 = vs_COLOR0_1;
    SV_TARGET0_ = (_e117 * _e118);
    let _e120 = SV_TARGET0_;
    SV_TARGET0_ = clamp(_e120, vec4(0f), vec4(1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e40 = SV_TARGET0_;
    return FragmentOutput(_e40);
}
