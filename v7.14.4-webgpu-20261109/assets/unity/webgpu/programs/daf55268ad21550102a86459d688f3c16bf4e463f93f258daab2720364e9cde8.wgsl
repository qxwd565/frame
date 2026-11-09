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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e25 = vs_TEXCOORD1_1;
    let _e30 = _f_buffer0_.f_cb0_[4];
    let _e35 = hscard_bias.values[1];
    let _e38 = textureSampleBias(f_t1_, samplerf_s1_, _e25.xy, (_e30.x + _e35.x));
    u_xlat0_ = _e38;
    let _e39 = u_xlat0_;
    let _e43 = _f_buffer1_.f_cb1_[2];
    u_xlat0_ = (_e39 * _e43);
    let _e45 = u_xlat0_;
    let _e49 = _f_buffer1_.f_cb1_[4];
    u_xlat0_ = (_e45 * _e49.xxxx);
    let _e52 = vs_TEXCOORD0_1;
    let _e57 = _f_buffer0_.f_cb0_[4];
    let _e62 = hscard_bias.values[0];
    let _e65 = textureSampleBias(f_t0_, samplerf_s0_, _e52.xy, (_e57.x + _e62.x));
    u_xlat1_ = _e65;
    let _e66 = u_xlat0_;
    let _e68 = u_xlat1_;
    let _e70 = u_xlat0_;
    let _e73 = u_xlat1_;
    let _e76 = ((_e68.xyz * _e70.xyz) + -(_e73.xyz));
    u_xlat0_.x = _e76.x;
    u_xlat0_.y = _e76.y;
    u_xlat0_.z = _e76.z;
    let _e83 = u_xlat0_;
    let _e85 = u_xlat0_;
    let _e87 = u_xlat0_;
    let _e90 = u_xlat1_;
    let _e92 = ((_e85.www * _e87.xyz) + _e90.xyz);
    u_xlat0_.x = _e92.x;
    u_xlat0_.y = _e92.y;
    u_xlat0_.z = _e92.z;
    let _e99 = u_xlat1_;
    let _e101 = u_xlat0_;
    let _e107 = (_e101.xyz + vec3<f32>(0.15f, 0.15f, 0.15f));
    u_xlat1_.x = _e107.x;
    u_xlat1_.y = _e107.y;
    u_xlat1_.z = _e107.z;
    u_xlat1_.w = 1.15f;
    let _e116 = u_xlat1_;
    let _e117 = vs_COLOR0_1;
    u_xlat1_ = (_e116 * _e117);
    u_xlat0_.w = 1f;
    let _e121 = u_xlat0_;
    let _e122 = u_xlat1_;
    SV_Target0_ = min(_e121, _e122);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
