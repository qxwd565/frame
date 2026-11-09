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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e33 = u_xlat0_;
    let _e35 = vs_TEXCOORD0_1;
    let _e46 = ((_e35.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e46.x;
    u_xlat0_.y = _e46.y;
    let _e51 = u_xlat6_;
    let _e56 = _f_buffer1_.f_cb1_[2];
    let _e61 = _f_buffer1_.f_cb1_[2];
    let _e63 = (_e56.yz * _e61.xx);
    u_xlat6_.x = _e63.x;
    u_xlat6_.y = _e63.y;
    let _e68 = u_xlat0_;
    let _e70 = u_xlat0_;
    let _e72 = u_xlat6_;
    let _e74 = (_e70.xy / _e72.xy);
    u_xlat0_.x = _e74.x;
    u_xlat0_.y = _e74.y;
    let _e80 = u_xlat0_;
    let _e82 = u_xlat0_;
    u_xlat0_.x = dot(_e80.xy, _e82.xy);
    let _e86 = u_xlat0_;
    u_xlat0_.x = sqrt(_e86.x);
    let _e89 = u_xlat0_;
    let _e91 = dpdx(_e89.x);
    u_xlat3_ = _e91;
    let _e93 = u_xlat0_;
    let _e95 = dpdy(_e93.x);
    u_xlat6_.x = _e95;
    let _e97 = u_xlat6_;
    let _e100 = u_xlat3_;
    u_xlat0_.y = (abs(_e97.x) + abs(_e100));
    let _e103 = u_xlat0_;
    let _e105 = u_xlat0_;
    let _e111 = (-(_e105.xy) + vec2<f32>(1f, 1f));
    u_xlat0_.x = _e111.x;
    u_xlat0_.z = _e111.y;
    let _e119 = _f_buffer1_.f_cb1_[2];
    let _e121 = u_xlat0_;
    let _e124 = u_xlat0_;
    u_xlat3_ = ((_e119.w * _e121.z) + _e124.y);
    let _e128 = u_xlat0_;
    let _e130 = u_xlat3_;
    u_xlat0_.w = (_e128.x / _e130);
    let _e133 = u_xlat0_;
    u_xlat0_.w = clamp(_e133.w, 0f, 1f);
    let _e138 = u_xlat0_;
    let _e140 = u_xlat0_;
    let _e145 = _f_buffer1_.f_cb1_[1];
    let _e147 = (_e140.www * _e145.xyz);
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    u_xlat0_.z = _e147.z;
    let _e154 = vs_TEXCOORD0_1;
    let _e159 = _f_buffer0_.f_cb0_[4];
    let _e164 = hscard_bias.values[0];
    let _e167 = textureSampleBias(f_t0_, samplerf_s0_, _e154.xy, (_e159.x + _e164.x));
    u_xlat1_ = _e167;
    let _e168 = u_xlat0_;
    let _e169 = u_xlat1_;
    u_xlat2_ = ((_e168 * _e169.xxxx) + vec4<f32>(0.15f, 0.15f, 0.15f, 0.15f));
    let _e178 = u_xlat0_;
    let _e179 = u_xlat1_;
    u_xlat0_ = (_e178 * _e179.xxxx);
    let _e182 = u_xlat2_;
    let _e183 = vs_COLOR0_1;
    u_xlat1_ = (_e182 * _e183);
    let _e185 = u_xlat0_;
    let _e186 = u_xlat1_;
    u_xlat0_ = min(_e185, _e186);
    let _e189 = u_xlat0_;
    let _e194 = _f_buffer1_.f_cb1_[3];
    SV_Target0_.w = (_e189.w * _e194.x);
    let _e197 = SV_Target0_;
    let _e199 = u_xlat0_;
    let _e200 = _e199.xyz;
    SV_Target0_.x = _e200.x;
    SV_Target0_.y = _e200.y;
    SV_Target0_.z = _e200.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_Target0_;
    return FragmentOutput(_e24);
}
