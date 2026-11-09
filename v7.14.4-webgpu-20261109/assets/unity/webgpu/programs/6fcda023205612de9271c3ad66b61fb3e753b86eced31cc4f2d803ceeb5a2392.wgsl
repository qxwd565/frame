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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat7_: f32 = 0f;

    let _e28 = u_xlat0_;
    let _e30 = vs_TEXCOORD0_1;
    let _e31 = _e30.xy;
    u_xlat0_.x = _e31.x;
    u_xlat0_.y = _e31.y;
    let _e36 = u_xlat0_;
    let _e38 = u_xlat0_;
    let _e44 = clamp(_e38.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e44.x;
    u_xlat0_.y = _e44.y;
    let _e49 = u_xlat0_;
    let _e51 = u_xlat0_;
    let _e53 = vs_TEXCOORD0_1;
    let _e56 = (_e51.xy + -(_e53.xy));
    u_xlat0_.x = _e56.x;
    u_xlat0_.y = _e56.y;
    let _e61 = u_xlat0_;
    let _e66 = _f_buffer1_.f_cb1_[3];
    let _e68 = u_xlat0_;
    let _e71 = vs_TEXCOORD0_1;
    let _e73 = ((_e66.zz * _e68.xy) + _e71.xy);
    u_xlat0_.x = _e73.x;
    u_xlat0_.y = _e73.y;
    let _e78 = u_xlat0_;
    let _e83 = _f_buffer0_.f_cb0_[4];
    let _e88 = hscard_bias.values[0];
    let _e91 = textureSampleBias(f_t0_, samplerf_s0_, _e78.xy, (_e83.x + _e88.x));
    u_xlat0_ = _e91;
    let _e92 = u_xlat1_;
    let _e94 = u_xlat0_;
    let _e99 = _f_buffer1_.f_cb1_[2];
    let _e101 = (_e94.xyz + _e99.yyy);
    u_xlat1_.x = _e101.x;
    u_xlat1_.y = _e101.y;
    u_xlat1_.z = _e101.z;
    let _e108 = u_xlat0_;
    let _e113 = _f_buffer1_.f_cb1_[3];
    u_xlat7_ = max(_e108.w, _e113.y);
    let _e116 = u_xlat1_;
    let _e118 = u_xlat7_;
    let _e120 = u_xlat1_;
    let _e122 = (vec3(_e118) * _e120.xyz);
    u_xlat1_.x = _e122.x;
    u_xlat1_.y = _e122.y;
    u_xlat1_.z = _e122.z;
    let _e129 = u_xlat0_;
    let _e131 = u_xlat1_;
    let _e136 = _f_buffer1_.f_cb1_[2];
    let _e138 = (_e131.xyz * _e136.xxx);
    u_xlat0_.x = _e138.x;
    u_xlat0_.y = _e138.y;
    u_xlat0_.z = _e138.z;
    let _e145 = vs_TEXCOORD0_1;
    let _e150 = _f_buffer0_.f_cb0_[4];
    let _e155 = hscard_bias.values[1];
    let _e158 = textureSampleBias(f_t1_, samplerf_s1_, _e145.zw, (_e150.x + _e155.x));
    u_xlat1_ = _e158;
    let _e159 = u_xlat1_;
    let _e161 = vs_COLOR1_1;
    let _e163 = u_xlat0_;
    u_xlat0_ = ((_e159.xyzx * _e161) + _e163);
    let _e165 = u_xlat0_;
    let _e166 = vs_COLOR0_1;
    SV_Target0_ = (_e165 * _e166);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
