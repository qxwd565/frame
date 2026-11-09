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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e42 = vs_TEXCOORD1_1;
    let _e46 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e42 + _e46.z);
    let _e50 = u_xlat0_;
    u_xlat0_.x = clamp(_e50.x, 0f, 1f);
    let _e56 = vs_TEXCOORD1_1;
    let _e60 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e56 + -(_e60.z));
    let _e65 = u_xlat4_;
    u_xlat4_.x = clamp(_e65.x, 0f, 1f);
    let _e71 = u_xlat4_;
    u_xlat4_.x = (_e71.x + -0.00001f);
    let _e77 = u_xlat4_;
    let _e80 = u_xlat0_;
    u_xlat0_.x = (-(_e77.x) + _e80.x);
    let _e86 = u_xlat0_;
    u_xlat0_.x = (1f / _e86.x);
    let _e89 = vs_TEXCOORD0_1;
    u_xlat1_ = _e89.zwxy;
    let _e91 = u_xlat1_;
    u_xlat1_ = clamp(_e91, vec4(0f), vec4(1f));
    let _e97 = u_xlat1_;
    let _e98 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e97 + -(_e98.zwxy));
    let _e102 = u_xlat8_;
    let _e107 = _f_buffer1_.f_cb1_[3];
    let _e109 = u_xlat1_;
    let _e112 = vs_TEXCOORD0_1;
    let _e114 = ((_e107.zz * _e109.zw) + _e112.xy);
    u_xlat8_.x = _e114.x;
    u_xlat8_.y = _e114.y;
    let _e119 = u_xlat1_;
    let _e124 = _f_buffer1_.f_cb1_[6];
    let _e126 = u_xlat1_;
    let _e129 = vs_TEXCOORD0_1;
    let _e131 = ((_e124.xx * _e126.xy) + _e129.zw);
    u_xlat1_.x = _e131.x;
    u_xlat1_.y = _e131.y;
    let _e136 = u_xlat1_;
    let _e141 = _f_buffer0_.f_cb0_[4];
    let _e146 = hscard_bias.values[1];
    let _e149 = textureSampleBias(f_t1_, samplerf_s1_, _e136.xy, (_e141.x + _e146.x));
    u_xlat1_ = _e149;
    let _e150 = u_xlat1_;
    let _e151 = vs_COLOR1_1;
    u_xlat1_ = (_e150 * _e151);
    let _e153 = u_xlat8_;
    let _e158 = _f_buffer0_.f_cb0_[4];
    let _e163 = hscard_bias.values[0];
    let _e166 = textureSampleBias(f_t0_, samplerf_s0_, _e153.xy, (_e158.x + _e163.x));
    u_xlat2_ = _e166;
    let _e168 = u_xlat4_;
    let _e171 = u_xlat2_;
    u_xlat4_.x = (-(_e168.x) + _e171.w);
    let _e175 = u_xlat0_;
    let _e177 = u_xlat4_;
    u_xlat0_.x = (_e175.x * _e177.x);
    let _e181 = u_xlat0_;
    u_xlat0_.x = clamp(_e181.x, 0f, 1f);
    let _e187 = u_xlat0_;
    u_xlat4_.x = ((_e187.x * -2f) + 3f);
    let _e195 = u_xlat0_;
    let _e197 = u_xlat0_;
    u_xlat0_.x = (_e195.x * _e197.x);
    let _e201 = u_xlat0_;
    let _e203 = u_xlat4_;
    u_xlat0_.x = (_e201.x * _e203.x);
    let _e206 = u_xlat4_;
    let _e208 = u_xlat2_;
    let _e213 = _f_buffer1_.f_cb1_[2];
    let _e215 = (_e208.xyz + _e213.yyy);
    u_xlat4_.x = _e215.x;
    u_xlat4_.y = _e215.y;
    u_xlat4_.z = _e215.z;
    let _e222 = u_xlat2_;
    let _e227 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e222.w, _e227.y);
    let _e230 = u_xlat4_;
    let _e232 = u_xlat4_;
    let _e234 = u_xlat3_;
    let _e236 = (_e232.xyz * vec3(_e234));
    u_xlat4_.x = _e236.x;
    u_xlat4_.y = _e236.y;
    u_xlat4_.z = _e236.z;
    let _e243 = u_xlat2_;
    let _e245 = u_xlat4_;
    let _e250 = _f_buffer1_.f_cb1_[2];
    let _e252 = (_e245.xyz * _e250.xxx);
    u_xlat2_.x = _e252.x;
    u_xlat2_.y = _e252.y;
    u_xlat2_.z = _e252.z;
    let _e259 = u_xlat2_;
    let _e260 = u_xlat0_;
    let _e263 = u_xlat1_;
    u_xlat0_ = ((_e259 * _e260.xxxx) + _e263);
    let _e265 = u_xlat0_;
    let _e266 = vs_COLOR0_1;
    SV_Target0_ = (_e265 * _e266);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
