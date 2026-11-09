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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e35 = vs_TEXCOORD0_1;
    u_xlat0_ = _e35.zwxy;
    let _e37 = u_xlat0_;
    u_xlat0_ = clamp(_e37, vec4(0f), vec4(1f));
    let _e43 = u_xlat0_;
    let _e44 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e43 + -(_e44.zwxy));
    let _e48 = u_xlat0_;
    let _e53 = _f_buffer1_.f_cb1_[6];
    let _e55 = u_xlat0_;
    let _e58 = vs_TEXCOORD0_1;
    let _e60 = ((_e53.xx * _e55.xy) + _e58.zw);
    u_xlat0_.x = _e60.x;
    u_xlat0_.y = _e60.y;
    let _e65 = u_xlat6_;
    let _e70 = _f_buffer1_.f_cb1_[3];
    let _e72 = u_xlat0_;
    let _e75 = vs_TEXCOORD0_1;
    let _e77 = ((_e70.zz * _e72.zw) + _e75.xy);
    u_xlat6_.x = _e77.x;
    u_xlat6_.y = _e77.y;
    let _e82 = u_xlat6_;
    let _e87 = _f_buffer0_.f_cb0_[4];
    let _e92 = hscard_bias.values[0];
    let _e95 = textureSampleBias(f_t0_, samplerf_s0_, _e82.xy, (_e87.x + _e92.x));
    u_xlat1_ = _e95;
    let _e96 = u_xlat0_;
    let _e101 = _f_buffer0_.f_cb0_[4];
    let _e106 = hscard_bias.values[1];
    let _e109 = textureSampleBias(f_t1_, samplerf_s1_, _e96.xy, (_e101.x + _e106.x));
    u_xlat0_ = _e109;
    let _e111 = u_xlat0_;
    u_xlat0_.x = (_e111.x + -1f);
    let _e120 = _f_buffer1_.f_cb1_[7];
    let _e122 = u_xlat0_;
    u_xlat0_.x = ((_e120.w * _e122.x) + 1f);
    let _e127 = u_xlat3_;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer1_.f_cb1_[2];
    let _e136 = (_e129.xyz + _e134.yyy);
    u_xlat3_.x = _e136.x;
    u_xlat3_.y = _e136.y;
    u_xlat3_.z = _e136.z;
    let _e143 = u_xlat1_;
    let _e148 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e143.w, _e148.y);
    let _e151 = u_xlat3_;
    let _e153 = u_xlat3_;
    let _e155 = u_xlat2_;
    let _e157 = (_e153.xyz * vec3(_e155));
    u_xlat3_.x = _e157.x;
    u_xlat3_.y = _e157.y;
    u_xlat3_.z = _e157.z;
    let _e164 = u_xlat1_;
    let _e166 = u_xlat3_;
    let _e171 = _f_buffer1_.f_cb1_[2];
    let _e173 = (_e166.xyz * _e171.xxx);
    u_xlat1_.x = _e173.x;
    u_xlat1_.y = _e173.y;
    u_xlat1_.z = _e173.z;
    let _e180 = u_xlat0_;
    let _e182 = u_xlat1_;
    u_xlat0_ = (_e180.xxxx * _e182);
    let _e184 = u_xlat0_;
    let _e185 = vs_COLOR0_1;
    SV_Target0_ = (_e184 * _e185);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
