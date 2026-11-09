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
    let _e152 = vs_COLOR1_1;
    u_xlat1_ = (_e150.xyzx * _e152);
    let _e154 = u_xlat8_;
    let _e159 = _f_buffer0_.f_cb0_[4];
    let _e164 = hscard_bias.values[0];
    let _e167 = textureSampleBias(f_t0_, samplerf_s0_, _e154.xy, (_e159.x + _e164.x));
    u_xlat2_ = _e167;
    let _e169 = u_xlat4_;
    let _e172 = u_xlat2_;
    u_xlat4_.x = (-(_e169.x) + _e172.w);
    let _e176 = u_xlat0_;
    let _e178 = u_xlat4_;
    u_xlat0_.x = (_e176.x * _e178.x);
    let _e182 = u_xlat0_;
    u_xlat0_.x = clamp(_e182.x, 0f, 1f);
    let _e188 = u_xlat0_;
    u_xlat4_.x = ((_e188.x * -2f) + 3f);
    let _e196 = u_xlat0_;
    let _e198 = u_xlat0_;
    u_xlat0_.x = (_e196.x * _e198.x);
    let _e202 = u_xlat0_;
    let _e204 = u_xlat4_;
    u_xlat0_.x = (_e202.x * _e204.x);
    let _e207 = u_xlat4_;
    let _e209 = u_xlat2_;
    let _e214 = _f_buffer1_.f_cb1_[2];
    let _e216 = (_e209.xyz + _e214.yyy);
    u_xlat4_.x = _e216.x;
    u_xlat4_.y = _e216.y;
    u_xlat4_.z = _e216.z;
    let _e223 = u_xlat2_;
    let _e228 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e223.w, _e228.y);
    let _e231 = u_xlat4_;
    let _e233 = u_xlat4_;
    let _e235 = u_xlat3_;
    let _e237 = (_e233.xyz * vec3(_e235));
    u_xlat4_.x = _e237.x;
    u_xlat4_.y = _e237.y;
    u_xlat4_.z = _e237.z;
    let _e244 = u_xlat2_;
    let _e246 = u_xlat4_;
    let _e251 = _f_buffer1_.f_cb1_[2];
    let _e253 = (_e246.xyz * _e251.xxx);
    u_xlat2_.x = _e253.x;
    u_xlat2_.y = _e253.y;
    u_xlat2_.z = _e253.z;
    let _e260 = u_xlat2_;
    let _e261 = u_xlat0_;
    let _e264 = u_xlat1_;
    u_xlat0_ = ((_e260 * _e261.xxxx) + _e264);
    let _e266 = u_xlat0_;
    let _e267 = vs_COLOR0_1;
    SV_Target0_ = (_e266 * _e267);
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
