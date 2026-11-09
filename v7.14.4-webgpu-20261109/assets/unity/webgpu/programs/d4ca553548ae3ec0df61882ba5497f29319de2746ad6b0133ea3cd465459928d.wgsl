struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 6>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
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

    u_xlat0_.y = 1f;
    let _e23 = vs_TEXCOORD0_1;
    let _e28 = hscard_bias.values[0];
    let _e30 = textureSampleBias(f_t0_, samplerf_s0_, _e23.xy, _e28.x);
    u_xlat1_ = _e30;
    let _e36 = u_xlat1_;
    u_xlat0_.x = dot(vec3<f32>(0.3f, 0.59f, 0.11f), _e36.xyz);
    let _e39 = u_xlat0_;
    let _e41 = u_xlat1_;
    u_xlat0_ = (_e39.xxxy + -(_e41));
    let _e47 = _f_buffer0_.f_cb0_[5];
    let _e49 = u_xlat0_;
    let _e51 = u_xlat1_;
    u_xlat0_ = ((_e47.xxxx * _e49) + _e51);
    let _e57 = _f_buffer0_.f_cb0_[5];
    u_xlat1_.x = _e57.w;
    u_xlat1_.w = 1f;
    let _e61 = u_xlat0_;
    let _e63 = u_xlat1_;
    u_xlat1_ = (-(_e61) + _e63.xxxw);
    let _e69 = _f_buffer0_.f_cb0_[5];
    let _e71 = u_xlat1_;
    let _e73 = u_xlat0_;
    u_xlat0_ = ((_e69.yyyy * _e71) + _e73);
    let _e75 = u_xlat0_;
    let _e79 = _f_buffer0_.f_cb0_[5];
    u_xlat0_ = (_e75 * _e79.zzzz);
    let _e82 = vs_TEXCOORD0_1;
    let _e87 = hscard_bias.values[1];
    let _e89 = textureSampleBias(f_t1_, samplerf_s1_, _e82.xy, _e87.x);
    u_xlat1_ = _e89;
    let _e90 = u_xlat1_;
    let _e92 = u_xlat0_;
    let _e95 = vs_COLOR0_1;
    let _e98 = u_xlat1_;
    let _e100 = ((-(_e92.xyz) * _e95.xyz) + _e98.xyz);
    u_xlat1_.x = _e100.x;
    u_xlat1_.y = _e100.y;
    u_xlat1_.z = _e100.z;
    let _e107 = u_xlat0_;
    let _e108 = vs_COLOR0_1;
    u_xlat0_ = (_e107 * _e108);
    let _e110 = SV_Target0_;
    let _e112 = u_xlat1_;
    let _e114 = u_xlat1_;
    let _e117 = u_xlat0_;
    let _e119 = ((_e112.www * _e114.xyz) + _e117.xyz);
    SV_Target0_.x = _e119.x;
    SV_Target0_.y = _e119.y;
    SV_Target0_.z = _e119.z;
    let _e127 = u_xlat0_;
    SV_Target0_.w = _e127.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e25 = SV_Target0_;
    return FragmentOutput(_e25);
}
