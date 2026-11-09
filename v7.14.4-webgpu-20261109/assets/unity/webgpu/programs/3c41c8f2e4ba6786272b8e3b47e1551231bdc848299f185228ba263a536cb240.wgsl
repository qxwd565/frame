struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 7>,
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
    let _e119 = u_xlat3_;
    let _e121 = u_xlat1_;
    let _e126 = _f_buffer1_.f_cb1_[2];
    let _e128 = (_e121.xyz + _e126.yyy);
    u_xlat3_.x = _e128.x;
    u_xlat3_.y = _e128.y;
    u_xlat3_.z = _e128.z;
    let _e135 = u_xlat1_;
    let _e140 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e135.w, _e140.y);
    let _e143 = u_xlat3_;
    let _e145 = u_xlat3_;
    let _e147 = u_xlat2_;
    let _e149 = (_e145.xyz * vec3(_e147));
    u_xlat3_.x = _e149.x;
    u_xlat3_.y = _e149.y;
    u_xlat3_.z = _e149.z;
    let _e156 = u_xlat1_;
    let _e158 = u_xlat3_;
    let _e163 = _f_buffer1_.f_cb1_[2];
    let _e165 = (_e158.xyz * _e163.xxx);
    u_xlat1_.x = _e165.x;
    u_xlat1_.y = _e165.y;
    u_xlat1_.z = _e165.z;
    let _e172 = u_xlat0_;
    let _e174 = vs_COLOR1_1;
    let _e176 = u_xlat1_;
    u_xlat0_ = ((_e172.xxxx * _e174) + _e176);
    let _e178 = u_xlat0_;
    let _e179 = vs_COLOR0_1;
    SV_Target0_ = (_e178 * _e179);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
