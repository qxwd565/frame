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
    u_xlat0_ = _e91.yzwx;
    let _e93 = u_xlat1_;
    let _e95 = u_xlat0_;
    let _e100 = _f_buffer1_.f_cb1_[2];
    let _e102 = (_e95.wxy + _e100.yyy);
    u_xlat1_.x = _e102.x;
    u_xlat1_.y = _e102.y;
    u_xlat1_.z = _e102.z;
    let _e109 = u_xlat0_;
    let _e114 = _f_buffer1_.f_cb1_[3];
    u_xlat7_ = max(_e109.w, _e114.y);
    let _e117 = u_xlat1_;
    let _e119 = u_xlat7_;
    let _e121 = u_xlat1_;
    let _e123 = (vec3(_e119) * _e121.xyz);
    u_xlat1_.x = _e123.x;
    u_xlat1_.y = _e123.y;
    u_xlat1_.z = _e123.z;
    let _e130 = u_xlat0_;
    let _e132 = u_xlat1_;
    let _e137 = _f_buffer1_.f_cb1_[2];
    let _e139 = (_e132.xyz * _e137.xxx);
    u_xlat0_.x = _e139.x;
    u_xlat0_.y = _e139.y;
    u_xlat0_.z = _e139.z;
    let _e146 = vs_TEXCOORD0_1;
    let _e151 = _f_buffer0_.f_cb0_[4];
    let _e156 = hscard_bias.values[1];
    let _e159 = textureSampleBias(f_t1_, samplerf_s1_, _e146.zw, (_e151.x + _e156.x));
    u_xlat1_ = _e159;
    let _e160 = u_xlat1_;
    let _e162 = vs_COLOR1_1;
    let _e164 = u_xlat0_;
    u_xlat0_ = ((_e160.xyzx * _e162) + _e164);
    let _e166 = u_xlat0_;
    let _e167 = vs_COLOR0_1;
    SV_Target0_ = (_e166 * _e167);
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
