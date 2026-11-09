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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e36 = vs_TEXCOORD0_1;
    u_xlat0_ = _e36.zwxy;
    let _e38 = u_xlat0_;
    u_xlat0_ = clamp(_e38, vec4(0f), vec4(1f));
    let _e44 = u_xlat0_;
    let _e45 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e44 + -(_e45.zwxy));
    let _e49 = u_xlat0_;
    let _e54 = _f_buffer1_.f_cb1_[6];
    let _e56 = u_xlat0_;
    let _e59 = vs_TEXCOORD0_1;
    let _e61 = ((_e54.xx * _e56.xy) + _e59.zw);
    u_xlat0_.x = _e61.x;
    u_xlat0_.y = _e61.y;
    let _e66 = u_xlat6_;
    let _e71 = _f_buffer1_.f_cb1_[3];
    let _e73 = u_xlat0_;
    let _e76 = vs_TEXCOORD0_1;
    let _e78 = ((_e71.zz * _e73.zw) + _e76.xy);
    u_xlat6_.x = _e78.x;
    u_xlat6_.y = _e78.y;
    let _e83 = u_xlat6_;
    let _e88 = _f_buffer0_.f_cb0_[4];
    let _e93 = hscard_bias.values[0];
    let _e96 = textureSampleBias(f_t0_, samplerf_s0_, _e83.xy, (_e88.x + _e93.x));
    u_xlat1_ = _e96;
    let _e97 = u_xlat0_;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[1];
    let _e110 = textureSampleBias(f_t1_, samplerf_s1_, _e97.xy, (_e102.x + _e107.x));
    u_xlat0_ = _e110;
    let _e112 = u_xlat0_;
    u_xlat0_.x = (_e112.w + -1f);
    let _e121 = _f_buffer1_.f_cb1_[7];
    let _e123 = u_xlat0_;
    u_xlat0_.x = ((_e121.w * _e123.x) + 1f);
    let _e129 = vs_TEXCOORD1_1;
    let _e133 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e129 + _e133.z);
    let _e137 = u_xlat3_;
    u_xlat3_.x = clamp(_e137.x, 0f, 1f);
    let _e143 = vs_TEXCOORD1_1;
    let _e147 = _f_buffer1_.f_cb1_[12];
    u_xlat6_.x = (_e143 + -(_e147.z));
    let _e152 = u_xlat6_;
    u_xlat6_.x = clamp(_e152.x, 0f, 1f);
    let _e158 = u_xlat6_;
    u_xlat6_.x = (_e158.x + -0.00001f);
    let _e164 = u_xlat6_;
    let _e167 = u_xlat3_;
    u_xlat3_.x = (-(_e164.x) + _e167.x);
    let _e171 = u_xlat6_;
    let _e174 = u_xlat1_;
    u_xlat6_.x = (-(_e171.x) + _e174.w);
    let _e180 = u_xlat3_;
    u_xlat3_.x = (1f / _e180.x);
    let _e184 = u_xlat3_;
    let _e186 = u_xlat6_;
    u_xlat3_.x = (_e184.x * _e186.x);
    let _e190 = u_xlat3_;
    u_xlat3_.x = clamp(_e190.x, 0f, 1f);
    let _e196 = u_xlat3_;
    u_xlat6_.x = ((_e196.x * -2f) + 3f);
    let _e204 = u_xlat3_;
    let _e206 = u_xlat3_;
    u_xlat3_.x = (_e204.x * _e206.x);
    let _e210 = u_xlat3_;
    let _e212 = u_xlat6_;
    u_xlat3_.x = (_e210.x * _e212.x);
    let _e216 = u_xlat0_;
    let _e218 = u_xlat3_;
    u_xlat0_.x = (_e216.x * _e218.x);
    let _e221 = u_xlat3_;
    let _e223 = u_xlat1_;
    let _e228 = _f_buffer1_.f_cb1_[2];
    let _e230 = (_e223.xyz + _e228.yyy);
    u_xlat3_.x = _e230.x;
    u_xlat3_.y = _e230.y;
    u_xlat3_.z = _e230.z;
    let _e237 = u_xlat1_;
    let _e242 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e237.w, _e242.y);
    let _e245 = u_xlat3_;
    let _e247 = u_xlat3_;
    let _e249 = u_xlat2_;
    let _e251 = (_e247.xyz * vec3(_e249));
    u_xlat3_.x = _e251.x;
    u_xlat3_.y = _e251.y;
    u_xlat3_.z = _e251.z;
    let _e258 = u_xlat1_;
    let _e260 = u_xlat3_;
    let _e265 = _f_buffer1_.f_cb1_[2];
    let _e267 = (_e260.xyz * _e265.xxx);
    u_xlat1_.x = _e267.x;
    u_xlat1_.y = _e267.y;
    u_xlat1_.z = _e267.z;
    let _e274 = u_xlat0_;
    let _e276 = u_xlat1_;
    u_xlat0_ = (_e274.xxxx * _e276);
    let _e278 = u_xlat0_;
    let _e279 = vs_COLOR0_1;
    SV_Target0_ = (_e278 * _e279);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
