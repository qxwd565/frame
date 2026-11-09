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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e23 = vs_TEXCOORD0_1;
    let _e28 = _f_buffer0_.f_cb0_[4];
    let _e33 = hscard_bias.values[0];
    let _e36 = textureSampleBias(f_t1_, samplerf_s0_, _e23.zw, (_e28.x + _e33.x));
    u_xlat0_ = _e36;
    let _e37 = u_xlat0_;
    let _e39 = u_xlat0_;
    let _e44 = _f_buffer1_.f_cb1_[2];
    let _e46 = (_e39.xxx * _e44.xyz);
    u_xlat0_.x = _e46.x;
    u_xlat0_.y = _e46.y;
    u_xlat0_.z = _e46.z;
    let _e53 = vs_TEXCOORD0_1;
    let _e58 = _f_buffer0_.f_cb0_[4];
    let _e63 = hscard_bias.values[0];
    let _e66 = textureSampleBias(f_t0_, samplerf_s0_, _e53.xy, (_e58.x + _e63.x));
    u_xlat1_ = _e66;
    let _e67 = u_xlat0_;
    let _e69 = u_xlat0_;
    let _e71 = u_xlat1_;
    let _e73 = (_e69.xyz * _e71.www);
    u_xlat0_.x = _e73.x;
    u_xlat0_.y = _e73.y;
    u_xlat0_.z = _e73.z;
    let _e80 = u_xlat0_;
    let _e82 = u_xlat0_;
    let _e88 = (_e82.xyz * vec3<f32>(1.5f, 1.5f, 1.5f));
    u_xlat0_.x = _e88.x;
    u_xlat0_.y = _e88.y;
    u_xlat0_.z = _e88.z;
    let _e95 = u_xlat0_;
    let _e97 = u_xlat0_;
    let _e102 = _f_buffer1_.f_cb1_[0];
    let _e105 = u_xlat1_;
    let _e107 = ((_e97.xyz * _e102.xxx) + _e105.xyz);
    u_xlat0_.x = _e107.x;
    u_xlat0_.y = _e107.y;
    u_xlat0_.z = _e107.z;
    let _e114 = u_xlat0_;
    let _e116 = u_xlat0_;
    let _e121 = _f_buffer1_.f_cb1_[3];
    let _e123 = (_e116.xyz * _e121.xyz);
    u_xlat0_.x = _e123.x;
    u_xlat0_.y = _e123.y;
    u_xlat0_.z = _e123.z;
    u_xlat0_.w = 1f;
    let _e132 = u_xlat0_;
    let _e133 = vs_COLOR0_1;
    SV_Target0_ = (_e132 * _e133);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e26 = SV_Target0_;
    return FragmentOutput(_e26);
}
