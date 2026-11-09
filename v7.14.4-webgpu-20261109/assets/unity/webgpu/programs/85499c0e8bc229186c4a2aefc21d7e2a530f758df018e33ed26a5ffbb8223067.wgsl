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
var<private> vs_TEXCOORD0_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlatb2_: bool = false;
    var u_xlat4_: f32 = 0f;
    var local: f32;
    var local_1: f32;

    let _e35 = vs_TEXCOORD0_1;
    let _e40 = _f_buffer1_.f_cb1_[3];
    u_xlat0_.x = (_e35.z + -(_e40.z));
    let _e44 = u_xlat0_;
    let _e49 = _f_buffer1_.f_cb1_[4];
    u_xlatb0_ = (_e44.x >= _e49.x);
    let _e53 = u_xlatb0_;
    if _e53 {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e58 = local;
    u_xlat0_.x = _e58;
    let _e62 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = (-(_e62.y) + 1f);
    let _e68 = u_xlat0_;
    let _e70 = u_xlat2_;
    u_xlat0_.x = max(_e68.x, _e70);
    let _e72 = vs_TEXCOORD0_1;
    let _e77 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = (_e72.z + _e77.w);
    let _e80 = u_xlat2_;
    let _e84 = _f_buffer1_.f_cb1_[4];
    u_xlatb2_ = (_e80 >= _e84.x);
    let _e87 = u_xlatb2_;
    if _e87 {
        local_1 = 0f;
    } else {
        let _e92 = _f_buffer1_.f_cb1_[3];
        local_1 = _e92.y;
    }
    let _e95 = local_1;
    u_xlat2_ = _e95;
    let _e96 = u_xlat2_;
    let _e97 = u_xlat0_;
    u_xlat4_ = (_e96 + _e97.x);
    let _e100 = u_xlat2_;
    let _e105 = _f_buffer1_.f_cb1_[2];
    u_xlat1_ = (vec4(_e100) * _e105);
    let _e110 = _f_buffer1_.f_cb1_[1];
    let _e111 = u_xlat0_;
    let _e114 = u_xlat1_;
    u_xlat1_ = ((_e110 * _e111.xxxx) + _e114);
    let _e117 = u_xlat4_;
    u_xlat0_.x = (-(_e117) + 1f);
    let _e121 = u_xlat0_;
    let _e123 = u_xlat1_;
    u_xlat0_ = (_e121.xxxx + _e123);
    let _e125 = vs_TEXCOORD0_1;
    let _e130 = _f_buffer0_.f_cb0_[4];
    let _e135 = hscard_bias.values[0];
    let _e138 = textureSampleBias(f_t0_, samplerf_s0_, _e125.xy, (_e130.x + _e135.x));
    u_xlat1_ = _e138;
    let _e139 = u_xlat0_;
    let _e140 = u_xlat1_;
    u_xlat0_ = (_e139 * _e140);
    let _e142 = u_xlat0_;
    let _e143 = vs_COLOR0_1;
    SV_TARGET0_ = (_e142 * _e143);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_TARGET0_;
    return FragmentOutput(_e24);
}
