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
    let _e137 = u_xlat1_;
    u_xlat1_.w = dot(_e137.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e144 = u_xlat2_;
    let _e146 = u_xlat1_;
    u_xlat2_ = (-(_e144) + _e146.w);
    let _e150 = u_xlat0_;
    let _e152 = u_xlat2_;
    u_xlat0_.x = (_e150.x * _e152);
    let _e155 = u_xlat0_;
    u_xlat0_.x = clamp(_e155.x, 0f, 1f);
    let _e160 = u_xlat0_;
    u_xlat2_ = ((_e160.x * -2f) + 3f);
    let _e168 = u_xlat0_;
    let _e170 = u_xlat0_;
    u_xlat0_.x = (_e168.x * _e170.x);
    let _e174 = u_xlat0_;
    let _e176 = u_xlat2_;
    u_xlat0_.x = (_e174.x * _e176);
    let _e178 = u_xlat1_;
    let _e183 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e178.w + _e183.y);
    let _e187 = u_xlat1_;
    let _e192 = _f_buffer1_.f_cb1_[3];
    u_xlat4_.x = max(_e187.w, _e192.y);
    let _e195 = u_xlat4_;
    let _e197 = u_xlat2_;
    u_xlat2_ = (_e195.x * _e197);
    let _e199 = u_xlat1_;
    let _e201 = u_xlat2_;
    let _e206 = _f_buffer1_.f_cb1_[2];
    let _e208 = (vec3(_e201) * _e206.xxx);
    u_xlat1_.x = _e208.x;
    u_xlat1_.y = _e208.y;
    u_xlat1_.z = _e208.z;
    let _e215 = u_xlat0_;
    let _e217 = u_xlat1_;
    u_xlat0_ = (_e215.xxxx * _e217);
    let _e219 = u_xlat0_;
    let _e220 = vs_COLOR0_1;
    SV_Target0_ = (_e219 * _e220);
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
