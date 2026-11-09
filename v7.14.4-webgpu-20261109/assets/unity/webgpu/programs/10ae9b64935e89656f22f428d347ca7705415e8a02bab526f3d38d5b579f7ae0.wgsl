struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 3>,
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
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat9_: f32 = 0f;

    let _e41 = vs_NORMAL0_1;
    let _e43 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e41.xyz, _e43.xyz);
    let _e47 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e47.x);
    let _e50 = u_xlat0_;
    let _e52 = u_xlat0_;
    let _e54 = vs_NORMAL0_1;
    let _e56 = (_e52.xxx * _e54.xyz);
    u_xlat0_.x = _e56.x;
    u_xlat0_.y = _e56.y;
    u_xlat0_.z = _e56.z;
    let _e64 = u_xlat0_;
    let _e69 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e64.xyz, _e69.xyz);
    let _e73 = u_xlat0_;
    u_xlat0_.x = clamp(_e73.x, 0f, 1f);
    let _e78 = u_xlat3_;
    let _e83 = _f_buffer0_.f_cb0_[6];
    let _e88 = _f_buffer1_.f_cb1_[11];
    let _e90 = (_e83.xyz * _e88.zzz);
    u_xlat3_.x = _e90.x;
    u_xlat3_.y = _e90.y;
    u_xlat3_.z = _e90.z;
    let _e97 = u_xlat0_;
    let _e99 = u_xlat3_;
    let _e101 = u_xlat0_;
    let _e104 = vs_TEXCOORD2_1;
    let _e106 = ((_e99.xyz * _e101.xxx) + _e104.xyz);
    u_xlat0_.x = _e106.x;
    u_xlat0_.y = _e106.y;
    u_xlat0_.z = _e106.z;
    let _e113 = vs_TEXCOORD4_1;
    let _e118 = _f_buffer2_.f_cb2_[2];
    u_xlat9_ = (_e113.z + _e118.x);
    let _e121 = u_xlat9_;
    let _e125 = _f_buffer2_.f_cb2_[2];
    u_xlat9_ = (_e121 + _e125.y);
    let _e132 = _f_buffer2_.f_cb2_[2];
    let _e137 = _f_buffer2_.f_cb2_[2];
    u_xlat1_.x = (_e132.y + _e137.y);
    let _e140 = u_xlat9_;
    let _e141 = u_xlat1_;
    u_xlat9_ = (_e140 / _e141.x);
    let _e144 = u_xlat9_;
    u_xlat9_ = clamp(_e144, 0f, 1f);
    let _e148 = vs_TEXCOORD0_1;
    let _e153 = _f_buffer0_.f_cb0_[4];
    let _e158 = hscard_bias.values[1];
    let _e161 = textureSampleBias(f_t1_, samplerf_s1_, _e148.xy, (_e153.x + _e158.x));
    u_xlat1_ = _e161;
    let _e162 = u_xlat9_;
    let _e164 = u_xlat1_;
    u_xlat1_ = (vec4(_e162) * _e164);
    let _e166 = u_xlat9_;
    u_xlat9_ = (-(_e166) + 1f);
    let _e170 = vs_TEXCOORD0_1;
    let _e175 = _f_buffer0_.f_cb0_[4];
    let _e180 = hscard_bias.values[0];
    let _e183 = textureSampleBias(f_t0_, samplerf_s0_, _e170.xy, (_e175.x + _e180.x));
    u_xlat2_ = _e183;
    let _e184 = u_xlat2_;
    let _e185 = u_xlat9_;
    let _e188 = u_xlat1_;
    u_xlat1_ = ((_e184 * vec4(_e185)) + _e188);
    let _e190 = SV_Target0_;
    let _e192 = u_xlat0_;
    let _e194 = u_xlat1_;
    let _e196 = (_e192.xyz * _e194.xyz);
    SV_Target0_.x = _e196.x;
    SV_Target0_.y = _e196.y;
    SV_Target0_.z = _e196.z;
    let _e204 = u_xlat1_;
    SV_Target0_.w = _e204.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e39 = SV_Target0_;
    return FragmentOutput(_e39);
}
