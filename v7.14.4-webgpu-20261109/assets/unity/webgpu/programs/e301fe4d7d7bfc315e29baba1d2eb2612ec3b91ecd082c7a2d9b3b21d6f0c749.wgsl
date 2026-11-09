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
    u_xlat1_ = _e96.yzwx;
    let _e98 = u_xlat0_;
    let _e103 = _f_buffer0_.f_cb0_[4];
    let _e108 = hscard_bias.values[1];
    let _e111 = textureSampleBias(f_t1_, samplerf_s1_, _e98.xy, (_e103.x + _e108.x));
    u_xlat0_ = _e111;
    let _e113 = u_xlat0_;
    u_xlat0_.x = (_e113.x + -1f);
    let _e122 = _f_buffer1_.f_cb1_[7];
    let _e124 = u_xlat0_;
    u_xlat0_.x = ((_e122.w * _e124.x) + 1f);
    let _e129 = u_xlat3_;
    let _e131 = u_xlat1_;
    let _e136 = _f_buffer1_.f_cb1_[2];
    let _e138 = (_e131.wxy + _e136.yyy);
    u_xlat3_.x = _e138.x;
    u_xlat3_.y = _e138.y;
    u_xlat3_.z = _e138.z;
    let _e145 = u_xlat1_;
    let _e150 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e145.w, _e150.y);
    let _e153 = u_xlat3_;
    let _e155 = u_xlat3_;
    let _e157 = u_xlat2_;
    let _e159 = (_e155.xyz * vec3(_e157));
    u_xlat3_.x = _e159.x;
    u_xlat3_.y = _e159.y;
    u_xlat3_.z = _e159.z;
    let _e166 = u_xlat1_;
    let _e168 = u_xlat3_;
    let _e173 = _f_buffer1_.f_cb1_[2];
    let _e175 = (_e168.xyz * _e173.xxx);
    u_xlat1_.x = _e175.x;
    u_xlat1_.y = _e175.y;
    u_xlat1_.z = _e175.z;
    let _e182 = u_xlat0_;
    let _e184 = u_xlat1_;
    u_xlat0_ = (_e182.xxxx * _e184);
    let _e187 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e187;
    let _e189 = u_xlat1_;
    u_xlat1_.x = clamp(_e189.x, 0f, 1f);
    let _e194 = u_xlat1_;
    let _e196 = vs_COLOR0_1;
    u_xlat1_ = (_e194.xxxx * _e196);
    let _e198 = u_xlat0_;
    let _e199 = u_xlat1_;
    SV_Target0_ = (_e198 * _e199);
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
