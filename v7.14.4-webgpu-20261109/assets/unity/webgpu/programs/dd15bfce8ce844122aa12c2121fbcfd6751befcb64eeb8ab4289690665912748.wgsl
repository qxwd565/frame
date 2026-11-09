struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
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
    var u_xlat3_: f32 = 0f;

    let _e27 = u_xlat0_;
    let _e29 = vs_TEXCOORD0_1;
    let _e30 = _e29.xy;
    u_xlat0_.x = _e30.x;
    u_xlat0_.y = _e30.y;
    let _e35 = u_xlat0_;
    let _e37 = u_xlat0_;
    let _e43 = clamp(_e37.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e43.x;
    u_xlat0_.y = _e43.y;
    let _e48 = u_xlat0_;
    let _e50 = u_xlat0_;
    let _e52 = vs_TEXCOORD0_1;
    let _e55 = (_e50.xy + -(_e52.xy));
    u_xlat0_.x = _e55.x;
    u_xlat0_.y = _e55.y;
    let _e60 = u_xlat0_;
    let _e65 = _f_buffer1_.f_cb1_[3];
    let _e67 = u_xlat0_;
    let _e70 = vs_TEXCOORD0_1;
    let _e72 = ((_e65.zz * _e67.xy) + _e70.xy);
    u_xlat0_.x = _e72.x;
    u_xlat0_.y = _e72.y;
    let _e77 = u_xlat0_;
    let _e82 = _f_buffer0_.f_cb0_[4];
    let _e87 = hscard_bias.values[0];
    let _e90 = textureSampleBias(f_t0_, samplerf_s0_, _e77.xy, (_e82.x + _e87.x));
    u_xlat0_ = _e90.yzwx;
    let _e93 = u_xlat0_;
    let _e98 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e93.w + _e98.y);
    let _e101 = u_xlat0_;
    let _e106 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e101.w, _e106.y);
    let _e110 = u_xlat3_;
    let _e111 = u_xlat1_;
    u_xlat1_.x = (_e110 * _e111.x);
    let _e118 = _f_buffer1_.f_cb1_[11];
    u_xlat1_.y = ((_e118.x * 0.03125f) + 0.015625f);
    let _e124 = u_xlat1_;
    let _e129 = _f_buffer0_.f_cb0_[4];
    let _e134 = hscard_bias.values[1];
    let _e137 = textureSampleBias(f_t1_, samplerf_s1_, _e124.xy, (_e129.x + _e134.x));
    u_xlat1_ = _e137;
    let _e138 = u_xlat0_;
    let _e140 = u_xlat1_;
    let _e145 = _f_buffer1_.f_cb1_[2];
    let _e147 = (_e140.xyz * _e145.xxx);
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    u_xlat0_.z = _e147.z;
    let _e154 = u_xlat0_;
    let _e155 = vs_COLOR0_1;
    SV_Target0_ = (_e154 * _e155);
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
