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
    u_xlat0_.x = (_e112.x + -1f);
    let _e121 = _f_buffer1_.f_cb1_[7];
    let _e123 = u_xlat0_;
    u_xlat0_.x = ((_e121.w * _e123.x) + 1f);
    let _e128 = u_xlat3_;
    let _e130 = u_xlat1_;
    let _e135 = _f_buffer1_.f_cb1_[2];
    let _e137 = (_e130.xyz + _e135.yyy);
    u_xlat3_.x = _e137.x;
    u_xlat3_.y = _e137.y;
    u_xlat3_.z = _e137.z;
    let _e144 = u_xlat1_;
    let _e149 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e144.w, _e149.y);
    let _e152 = u_xlat3_;
    let _e154 = u_xlat3_;
    let _e156 = u_xlat2_;
    let _e158 = (_e154.xyz * vec3(_e156));
    u_xlat3_.x = _e158.x;
    u_xlat3_.y = _e158.y;
    u_xlat3_.z = _e158.z;
    let _e165 = u_xlat1_;
    let _e167 = u_xlat3_;
    let _e172 = _f_buffer1_.f_cb1_[2];
    let _e174 = (_e167.xyz * _e172.xxx);
    u_xlat1_.x = _e174.x;
    u_xlat1_.y = _e174.y;
    u_xlat1_.z = _e174.z;
    let _e181 = u_xlat0_;
    let _e183 = u_xlat1_;
    u_xlat0_ = (_e181.xxxx * _e183);
    let _e186 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e186;
    let _e188 = u_xlat1_;
    u_xlat1_.x = clamp(_e188.x, 0f, 1f);
    let _e193 = u_xlat1_;
    let _e195 = vs_COLOR0_1;
    u_xlat1_ = (_e193.xxxx * _e195);
    let _e197 = u_xlat0_;
    let _e198 = u_xlat1_;
    SV_Target0_ = (_e197 * _e198);
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
