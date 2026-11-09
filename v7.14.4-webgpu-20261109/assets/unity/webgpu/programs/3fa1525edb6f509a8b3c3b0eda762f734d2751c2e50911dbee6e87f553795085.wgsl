struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 6>,
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
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR2_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;
    var u_xlatb6_: bool = false;
    var local: f32;

    let _e33 = vs_TEXCOORD1_1;
    let _e38 = _f_buffer0_.f_cb0_[4];
    let _e43 = hscard_bias.values[1];
    let _e46 = textureSampleBias(f_t1_, samplerf_s1_, _e33.xy, (_e38.x + _e43.x));
    u_xlat0_ = _e46;
    let _e47 = u_xlat0_;
    let _e49 = u_xlat0_;
    let _e51 = vs_COLOR1_1;
    let _e53 = (_e49.xyz * _e51.xyz);
    u_xlat0_.x = _e53.x;
    u_xlat0_.y = _e53.y;
    u_xlat0_.z = _e53.z;
    let _e64 = _f_buffer1_.f_cb1_[5];
    u_xlatb6_ = (0f < _e64.y);
    let _e67 = vs_TEXCOORD0_1;
    let _e72 = _f_buffer0_.f_cb0_[4];
    let _e77 = hscard_bias.values[0];
    let _e80 = textureSampleBias(f_t0_, samplerf_s0_, _e67.xy, (_e72.x + _e77.x));
    u_xlat1_ = _e80;
    let _e81 = u_xlatb6_;
    if _e81 {
        let _e82 = u_xlat1_;
        local = _e82.w;
    } else {
        local = 1f;
    }
    let _e86 = local;
    u_xlat6_ = _e86;
    let _e87 = u_xlat0_;
    let _e89 = u_xlat6_;
    let _e91 = u_xlat0_;
    let _e93 = (vec3(_e89) * _e91.xyz);
    u_xlat0_.x = _e93.x;
    u_xlat0_.y = _e93.y;
    u_xlat0_.z = _e93.z;
    let _e100 = u_xlat0_;
    let _e102 = u_xlat1_;
    let _e104 = vs_COLOR0_1;
    let _e107 = u_xlat0_;
    let _e109 = ((_e102.xyz * _e104.xyz) + _e107.xyz);
    u_xlat0_.x = _e109.x;
    u_xlat0_.y = _e109.y;
    u_xlat0_.z = _e109.z;
    let _e116 = u_xlat1_;
    let _e121 = _f_buffer1_.f_cb1_[2];
    u_xlat6_ = (_e116.w * _e121.w);
    let _e124 = u_xlat1_;
    let _e126 = u_xlat0_;
    let _e128 = vs_COLOR2_1;
    let _e130 = (_e126.xyz * _e128.www);
    u_xlat1_.x = _e130.x;
    u_xlat1_.y = _e130.y;
    u_xlat1_.z = _e130.z;
    let _e141 = _f_buffer1_.f_cb1_[3];
    u_xlat0_.x = _e141.x;
    let _e144 = u_xlat0_;
    u_xlat0_.x = clamp(_e144.x, 0f, 1f);
    let _e150 = u_xlat0_;
    let _e152 = u_xlat6_;
    u_xlat1_.w = (_e150.x * _e152);
    let _e154 = u_xlat1_;
    let _e155 = vs_COLOR2_1;
    SV_Target0_ = (_e154 * _e155);
    let _e157 = SV_Target0_;
    SV_Target0_ = clamp(_e157, vec4(0f), vec4(1f));
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(12) vs_COLOR2_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR2_1 = vs_COLOR2_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
