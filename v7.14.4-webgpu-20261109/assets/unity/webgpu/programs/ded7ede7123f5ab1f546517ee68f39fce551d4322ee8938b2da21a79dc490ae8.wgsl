struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat4_: f32 = 0f;
    var local: f32;
    var local_1: f32;

    let _e34 = vs_TEXCOORD0_1;
    let _e39 = _f_buffer0_.f_cb0_[4];
    let _e44 = hscard_bias.values[1];
    let _e47 = textureSampleBias(f_t1_, samplerf_s1_, _e34.xy, (_e39.x + _e44.x));
    u_xlat0_ = _e47;
    let _e48 = u_xlat0_;
    let _e52 = _f_buffer1_.f_cb1_[1];
    u_xlat0_ = (_e48 * _e52.xxxx);
    let _e59 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = (-(_e59.x) + 1f);
    let _e64 = vs_TEXCOORD0_1;
    let _e69 = _f_buffer0_.f_cb0_[4];
    let _e74 = hscard_bias.values[0];
    let _e77 = textureSampleBias(f_t0_, samplerf_s0_, _e64.xy, (_e69.x + _e74.x));
    u_xlat2_ = _e77;
    let _e78 = u_xlat2_;
    let _e79 = vs_COLOR0_1;
    u_xlat2_ = (_e78 * _e79);
    let _e81 = u_xlat1_;
    let _e83 = u_xlat2_;
    u_xlat1_ = (_e81.xxxx * _e83);
    let _e85 = u_xlat0_;
    let _e86 = vs_COLOR0_1;
    let _e88 = u_xlat1_;
    u_xlat0_ = ((_e85 * _e86) + _e88);
    let _e93 = _f_buffer1_.f_cb1_[3];
    let _e95 = vs_TEXCOORD0_1;
    u_xlatb1_ = (_e93.x >= _e95.x);
    let _e98 = u_xlatb1_;
    if _e98 {
        local = 0f;
    } else {
        local = 1f;
    }
    let _e102 = local;
    u_xlat4_ = _e102;
    let _e104 = u_xlatb1_;
    if _e104 {
        local_1 = 1f;
    } else {
        local_1 = 0f;
    }
    let _e109 = local_1;
    u_xlat1_.x = _e109;
    let _e110 = u_xlat0_;
    let _e111 = u_xlat4_;
    u_xlat0_ = (_e110 * vec4(_e111));
    let _e114 = u_xlat2_;
    let _e115 = u_xlat1_;
    let _e118 = u_xlat0_;
    SV_Target0_ = ((_e114 * _e115.xxxx) + _e118);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
