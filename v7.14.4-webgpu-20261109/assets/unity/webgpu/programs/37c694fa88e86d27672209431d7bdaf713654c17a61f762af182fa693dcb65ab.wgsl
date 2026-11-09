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
    u_xlat0_ = _e90;
    let _e92 = u_xlat0_;
    u_xlat0_.w = dot(_e92.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e100 = u_xlat0_;
    let _e105 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e100.w + _e105.y);
    let _e108 = u_xlat0_;
    let _e113 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e108.w, _e113.y);
    let _e117 = u_xlat3_;
    let _e118 = u_xlat1_;
    u_xlat1_.x = (_e117 * _e118.x);
    let _e125 = _f_buffer1_.f_cb1_[11];
    u_xlat1_.y = ((_e125.x * 0.03125f) + 0.015625f);
    let _e131 = u_xlat1_;
    let _e136 = _f_buffer0_.f_cb0_[4];
    let _e141 = hscard_bias.values[1];
    let _e144 = textureSampleBias(f_t1_, samplerf_s1_, _e131.xy, (_e136.x + _e141.x));
    u_xlat1_ = _e144;
    let _e145 = u_xlat0_;
    let _e147 = u_xlat1_;
    let _e152 = _f_buffer1_.f_cb1_[2];
    let _e154 = (_e147.xyz * _e152.xxx);
    u_xlat0_.x = _e154.x;
    u_xlat0_.y = _e154.y;
    u_xlat0_.z = _e154.z;
    let _e161 = u_xlat0_;
    let _e162 = vs_COLOR0_1;
    SV_Target0_ = (_e161 * _e162);
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
