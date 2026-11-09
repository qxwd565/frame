struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 8>,
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
    u_xlat0_.x = dot(_e112.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e120 = u_xlat0_;
    u_xlat0_.x = (_e120.x + -1f);
    let _e129 = _f_buffer1_.f_cb1_[7];
    let _e131 = u_xlat0_;
    u_xlat0_.x = ((_e129.w * _e131.x) + 1f);
    let _e136 = u_xlat3_;
    let _e138 = u_xlat1_;
    let _e143 = _f_buffer1_.f_cb1_[2];
    let _e145 = (_e138.xyz + _e143.yyy);
    u_xlat3_.x = _e145.x;
    u_xlat3_.y = _e145.y;
    u_xlat3_.z = _e145.z;
    let _e152 = u_xlat1_;
    let _e157 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e152.w, _e157.y);
    let _e160 = u_xlat3_;
    let _e162 = u_xlat3_;
    let _e164 = u_xlat2_;
    let _e166 = (_e162.xyz * vec3(_e164));
    u_xlat3_.x = _e166.x;
    u_xlat3_.y = _e166.y;
    u_xlat3_.z = _e166.z;
    let _e173 = u_xlat1_;
    let _e175 = u_xlat3_;
    let _e180 = _f_buffer1_.f_cb1_[2];
    let _e182 = (_e175.xyz * _e180.xxx);
    u_xlat1_.x = _e182.x;
    u_xlat1_.y = _e182.y;
    u_xlat1_.z = _e182.z;
    let _e189 = u_xlat0_;
    let _e191 = u_xlat1_;
    u_xlat0_ = (_e189.xxxx * _e191);
    let _e194 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e194;
    let _e196 = u_xlat1_;
    u_xlat1_.x = clamp(_e196.x, 0f, 1f);
    let _e201 = u_xlat1_;
    let _e203 = vs_COLOR0_1;
    u_xlat1_ = (_e201.xxxx * _e203);
    let _e205 = u_xlat0_;
    let _e206 = u_xlat1_;
    SV_Target0_ = (_e205 * _e206);
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
