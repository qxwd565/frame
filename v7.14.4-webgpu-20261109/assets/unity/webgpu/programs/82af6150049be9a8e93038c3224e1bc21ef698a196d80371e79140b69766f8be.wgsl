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
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);

    let _e31 = vs_TEXCOORD1_1;
    let _e36 = _f_buffer0_.f_cb0_[4];
    let _e41 = hscard_bias.values[1];
    let _e44 = textureSampleBias(f_t1_, samplerf_s1_, _e31.xy, (_e36.x + _e41.x));
    u_xlat0_ = _e44;
    let _e45 = vs_TEXCOORD0_1;
    let _e50 = _f_buffer0_.f_cb0_[4];
    let _e55 = hscard_bias.values[0];
    let _e58 = textureSampleBias(f_t0_, samplerf_s0_, _e45.xy, (_e50.x + _e55.x));
    u_xlat1_ = _e58;
    let _e60 = u_xlat1_;
    let _e66 = _f_buffer1_.f_cb1_[1];
    u_xlat2_.x = (-(_e60.w) + _e66.w);
    let _e70 = u_xlat1_;
    let _e72 = u_xlat2_;
    u_xlat2_.w = (_e70.w * _e72.x);
    let _e75 = u_xlat2_;
    let _e77 = u_xlat1_;
    let _e82 = _f_buffer1_.f_cb1_[1];
    let _e84 = (_e77.xyz * _e82.xyz);
    u_xlat2_.x = _e84.x;
    u_xlat2_.y = _e84.y;
    u_xlat2_.z = _e84.z;
    let _e91 = u_xlat0_;
    let _e92 = u_xlat2_;
    u_xlat0_ = (_e91 * _e92);
    let _e94 = vs_TEXCOORD1_1;
    let _e99 = _f_buffer0_.f_cb0_[4];
    let _e104 = hscard_bias.values[2];
    let _e107 = textureSampleBias(f_t2_, samplerf_s2_, _e94.yz, (_e99.x + _e104.x));
    u_xlat1_ = _e107;
    let _e108 = u_xlat0_;
    let _e109 = u_xlat1_;
    u_xlat0_ = (_e108 * _e109);
    let _e111 = u_xlat0_;
    let _e112 = vs_COLOR0_1;
    SV_Target0_ = (_e111 * _e112);
    let _e114 = SV_Target0_;
    SV_Target0_ = clamp(_e114, vec4(0f), vec4(1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
