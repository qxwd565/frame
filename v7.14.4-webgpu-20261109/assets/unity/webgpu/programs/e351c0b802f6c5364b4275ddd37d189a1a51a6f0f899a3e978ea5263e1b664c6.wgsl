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
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat10_: f32 = 0f;

    let _e36 = vs_TEXCOORD0_1;
    u_xlat0_ = _e36.zwxy;
    let _e38 = u_xlat0_;
    u_xlat0_ = clamp(_e38, vec4(0f), vec4(1f));
    let _e44 = u_xlat0_;
    let _e45 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e44 + -(_e45.zwxy));
    let _e49 = u_xlat6_;
    let _e54 = _f_buffer1_.f_cb1_[3];
    let _e56 = u_xlat0_;
    let _e59 = vs_TEXCOORD0_1;
    let _e61 = ((_e54.zz * _e56.zw) + _e59.xy);
    u_xlat6_.x = _e61.x;
    u_xlat6_.y = _e61.y;
    let _e66 = u_xlat0_;
    let _e71 = _f_buffer1_.f_cb1_[6];
    let _e73 = u_xlat0_;
    let _e76 = vs_TEXCOORD0_1;
    let _e78 = ((_e71.xx * _e73.xy) + _e76.zw);
    u_xlat0_.x = _e78.x;
    u_xlat0_.y = _e78.y;
    let _e83 = u_xlat0_;
    let _e88 = _f_buffer0_.f_cb0_[4];
    let _e93 = hscard_bias.values[1];
    let _e96 = textureSampleBias(f_t1_, samplerf_s1_, _e83.xy, (_e88.x + _e93.x));
    u_xlat1_ = _e96;
    let _e97 = u_xlat6_;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[0];
    let _e110 = textureSampleBias(f_t0_, samplerf_s0_, _e97.xy, (_e102.x + _e107.x));
    u_xlat0_ = _e110;
    let _e111 = u_xlat2_;
    let _e113 = u_xlat0_;
    let _e118 = _f_buffer1_.f_cb1_[2];
    let _e120 = (_e113.xyz + _e118.yyy);
    u_xlat2_.x = _e120.x;
    u_xlat2_.y = _e120.y;
    u_xlat2_.z = _e120.z;
    let _e127 = u_xlat0_;
    let _e132 = _f_buffer1_.f_cb1_[3];
    u_xlat10_ = max(_e127.w, _e132.y);
    let _e135 = u_xlat2_;
    let _e137 = u_xlat10_;
    let _e139 = u_xlat2_;
    let _e141 = (vec3(_e137) * _e139.xyz);
    u_xlat2_.x = _e141.x;
    u_xlat2_.y = _e141.y;
    u_xlat2_.z = _e141.z;
    let _e148 = u_xlat0_;
    let _e150 = u_xlat2_;
    let _e155 = _f_buffer1_.f_cb1_[2];
    let _e157 = (_e150.xyz * _e155.xxx);
    u_xlat0_.x = _e157.x;
    u_xlat0_.y = _e157.y;
    u_xlat0_.z = _e157.z;
    let _e164 = u_xlat1_;
    let _e166 = vs_COLOR1_1;
    let _e168 = u_xlat0_;
    u_xlat0_ = ((_e164.xyzx * _e166) + _e168);
    let _e170 = u_xlat0_;
    let _e171 = vs_COLOR0_1;
    SV_Target0_ = (_e170 * _e171);
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
