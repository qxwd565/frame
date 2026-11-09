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
    @location(0) SV_TARGET0_: vec4<f32>,
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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e25 = vs_COLOR0_1;
    let _e26 = vs_COLOR0_1;
    u_xlat0_ = (_e25 + _e26);
    let _e28 = vs_TEXCOORD0_1;
    let _e33 = _f_buffer0_.f_cb0_[4];
    let _e38 = hscard_bias.values[0];
    let _e41 = textureSampleBias(f_t0_, samplerf_s0_, _e28.xy, (_e33.x + _e38.x));
    u_xlat1_ = _e41;
    let _e42 = u_xlat0_;
    let _e43 = u_xlat1_;
    u_xlat0_ = (_e42 * _e43);
    let _e46 = vs_COLOR0_1;
    let _e48 = u_xlat0_;
    let _e54 = _f_buffer1_.f_cb1_[3];
    u_xlat1_.x = ((_e46.w * _e48.w) + -(_e54.z));
    let _e59 = u_xlat1_;
    u_xlat1_.x = ceil(_e59.x);
    let _e62 = u_xlat0_;
    let _e64 = u_xlat1_;
    u_xlat6_ = (_e62.w * _e64.x);
    let _e67 = u_xlat0_;
    let _e69 = u_xlat0_;
    let _e74 = _f_buffer1_.f_cb1_[2];
    let _e76 = (_e69.xyz * _e74.xyz);
    u_xlat0_.x = _e76.x;
    u_xlat0_.y = _e76.y;
    u_xlat0_.z = _e76.z;
    let _e84 = u_xlat6_;
    let _e88 = _f_buffer1_.f_cb1_[3];
    u_xlat0_.w = (_e84 * _e88.y);
    let _e91 = u_xlat0_;
    let _e95 = _f_buffer1_.f_cb1_[4];
    u_xlat0_ = (_e91 * _e95.xxxx);
    let _e98 = SV_TARGET0_;
    let _e100 = u_xlat0_;
    let _e102 = u_xlat0_;
    let _e104 = (_e100.www * _e102.xyz);
    SV_TARGET0_.x = _e104.x;
    SV_TARGET0_.y = _e104.y;
    SV_TARGET0_.z = _e104.z;
    let _e111 = SV_TARGET0_;
    let _e113 = SV_TARGET0_;
    let _e119 = clamp(_e113.xyz, vec3(0f), vec3(1f));
    SV_TARGET0_.x = _e119.x;
    SV_TARGET0_.y = _e119.y;
    SV_TARGET0_.z = _e119.z;
    let _e127 = u_xlat0_;
    let _e132 = _f_buffer1_.f_cb1_[4];
    SV_TARGET0_.w = (_e127.w * _e132.y);
    let _e136 = SV_TARGET0_;
    SV_TARGET0_.w = clamp(_e136.w, 0f, 1f);
    return;
}

@fragment 
fn main(@location(10) vs_COLOR0_: vec4<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>) -> FragmentOutput {
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    main_1();
    let _e24 = SV_TARGET0_;
    return FragmentOutput(_e24);
}
