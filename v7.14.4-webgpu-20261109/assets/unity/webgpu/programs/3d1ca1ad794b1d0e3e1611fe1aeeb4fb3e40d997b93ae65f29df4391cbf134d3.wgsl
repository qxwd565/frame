struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 13>,
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
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e31 = vs_TEXCOORD1_1;
    let _e35 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e31 + _e35.z);
    let _e39 = u_xlat0_;
    u_xlat0_.x = clamp(_e39.x, 0f, 1f);
    let _e44 = vs_TEXCOORD1_1;
    let _e48 = _f_buffer1_.f_cb1_[12];
    u_xlat2_ = (_e44 + -(_e48.z));
    let _e52 = u_xlat2_;
    u_xlat2_ = clamp(_e52, 0f, 1f);
    let _e56 = u_xlat2_;
    u_xlat2_ = (_e56 + -0.00001f);
    let _e61 = u_xlat2_;
    let _e63 = u_xlat0_;
    u_xlat0_.x = (-(_e61) + _e63.x);
    let _e69 = u_xlat0_;
    u_xlat0_.x = (1f / _e69.x);
    let _e72 = u_xlat4_;
    let _e74 = vs_TEXCOORD0_1;
    let _e75 = _e74.xy;
    u_xlat4_.x = _e75.x;
    u_xlat4_.y = _e75.y;
    let _e80 = u_xlat4_;
    let _e82 = u_xlat4_;
    let _e88 = clamp(_e82.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e88.x;
    u_xlat4_.y = _e88.y;
    let _e93 = u_xlat4_;
    let _e95 = u_xlat4_;
    let _e97 = vs_TEXCOORD0_1;
    let _e100 = (_e95.xy + -(_e97.xy));
    u_xlat4_.x = _e100.x;
    u_xlat4_.y = _e100.y;
    let _e105 = u_xlat4_;
    let _e110 = _f_buffer1_.f_cb1_[3];
    let _e112 = u_xlat4_;
    let _e115 = vs_TEXCOORD0_1;
    let _e117 = ((_e110.zz * _e112.xy) + _e115.xy);
    u_xlat4_.x = _e117.x;
    u_xlat4_.y = _e117.y;
    let _e122 = u_xlat4_;
    let _e127 = _f_buffer0_.f_cb0_[4];
    let _e132 = hscard_bias.values[0];
    let _e135 = textureSampleBias(f_t0_, samplerf_s0_, _e122.xy, (_e127.x + _e132.x));
    u_xlat1_ = _e135;
    let _e136 = u_xlat2_;
    let _e138 = u_xlat1_;
    u_xlat2_ = (-(_e136) + _e138.w);
    let _e142 = u_xlat0_;
    let _e144 = u_xlat2_;
    u_xlat0_.x = (_e142.x * _e144);
    let _e147 = u_xlat0_;
    u_xlat0_.x = clamp(_e147.x, 0f, 1f);
    let _e152 = u_xlat0_;
    u_xlat2_ = ((_e152.x * -2f) + 3f);
    let _e160 = u_xlat0_;
    let _e162 = u_xlat0_;
    u_xlat0_.x = (_e160.x * _e162.x);
    let _e166 = u_xlat0_;
    let _e168 = u_xlat2_;
    u_xlat0_.x = (_e166.x * _e168);
    let _e170 = u_xlat1_;
    let _e175 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e170.w + _e175.y);
    let _e179 = u_xlat1_;
    let _e184 = _f_buffer1_.f_cb1_[3];
    u_xlat4_.x = max(_e179.w, _e184.y);
    let _e187 = u_xlat4_;
    let _e189 = u_xlat2_;
    u_xlat2_ = (_e187.x * _e189);
    let _e191 = u_xlat1_;
    let _e193 = u_xlat2_;
    let _e198 = _f_buffer1_.f_cb1_[2];
    let _e200 = (vec3(_e193) * _e198.xxx);
    u_xlat1_.x = _e200.x;
    u_xlat1_.y = _e200.y;
    u_xlat1_.z = _e200.z;
    let _e207 = u_xlat0_;
    let _e209 = u_xlat1_;
    u_xlat0_ = (_e207.xxxx * _e209);
    let _e211 = u_xlat0_;
    let _e212 = vs_COLOR0_1;
    SV_Target0_ = (_e211 * _e212);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
