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
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e31 = vs_TEXCOORD0_1;
    u_xlat0_ = _e31.zwxy;
    let _e33 = u_xlat0_;
    u_xlat0_ = clamp(_e33, vec4(0f), vec4(1f));
    let _e39 = u_xlat0_;
    let _e40 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e39 + -(_e40.zwxy));
    let _e44 = u_xlat0_;
    let _e49 = _f_buffer1_.f_cb1_[6];
    let _e51 = u_xlat0_;
    let _e54 = vs_TEXCOORD0_1;
    let _e56 = ((_e49.xx * _e51.xy) + _e54.zw);
    u_xlat0_.x = _e56.x;
    u_xlat0_.y = _e56.y;
    let _e61 = u_xlat4_;
    let _e66 = _f_buffer1_.f_cb1_[3];
    let _e68 = u_xlat0_;
    let _e71 = vs_TEXCOORD0_1;
    let _e73 = ((_e66.zz * _e68.zw) + _e71.xy);
    u_xlat4_.x = _e73.x;
    u_xlat4_.y = _e73.y;
    let _e78 = u_xlat4_;
    let _e83 = _f_buffer0_.f_cb0_[4];
    let _e88 = hscard_bias.values[0];
    let _e91 = textureSampleBias(f_t0_, samplerf_s0_, _e78.xy, (_e83.x + _e88.x));
    u_xlat1_ = _e91;
    let _e93 = u_xlat1_;
    u_xlat1_.w = dot(_e93.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e100 = u_xlat0_;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[1];
    let _e113 = textureSampleBias(f_t1_, samplerf_s1_, _e100.xy, (_e105.x + _e110.x));
    u_xlat0_ = _e113;
    let _e115 = u_xlat0_;
    u_xlat0_.x = dot(_e115.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e123 = u_xlat0_;
    u_xlat0_.x = (_e123.x + -1f);
    let _e132 = _f_buffer1_.f_cb1_[7];
    let _e134 = u_xlat0_;
    u_xlat0_.x = ((_e132.w * _e134.x) + 1f);
    let _e139 = u_xlat1_;
    let _e144 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e139.w + _e144.y);
    let _e148 = u_xlat1_;
    let _e153 = _f_buffer1_.f_cb1_[3];
    u_xlat4_.x = max(_e148.w, _e153.y);
    let _e156 = u_xlat4_;
    let _e158 = u_xlat2_;
    u_xlat2_ = (_e156.x * _e158);
    let _e160 = u_xlat1_;
    let _e162 = u_xlat2_;
    let _e167 = _f_buffer1_.f_cb1_[2];
    let _e169 = (vec3(_e162) * _e167.xxx);
    u_xlat1_.x = _e169.x;
    u_xlat1_.y = _e169.y;
    u_xlat1_.z = _e169.z;
    let _e176 = u_xlat0_;
    let _e178 = u_xlat1_;
    u_xlat0_ = (_e176.xxxx * _e178);
    let _e180 = u_xlat0_;
    let _e181 = vs_COLOR0_1;
    SV_Target0_ = (_e180 * _e181);
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
