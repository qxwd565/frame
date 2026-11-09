struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 30>,
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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);

    let _e35 = vs_NORMAL0_1;
    let _e37 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e35.xyz, _e37.xyz);
    let _e41 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e41.x);
    let _e44 = u_xlat0_;
    let _e46 = u_xlat0_;
    let _e48 = vs_NORMAL0_1;
    let _e50 = (_e46.xxx * _e48.xyz);
    u_xlat0_.x = _e50.x;
    u_xlat0_.y = _e50.y;
    u_xlat0_.z = _e50.z;
    let _e58 = u_xlat0_;
    let _e63 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e58.xyz, _e63.xyz);
    let _e67 = u_xlat0_;
    u_xlat0_.x = clamp(_e67.x, 0f, 1f);
    let _e72 = u_xlat3_;
    let _e77 = _f_buffer0_.f_cb0_[6];
    let _e82 = _f_buffer1_.f_cb1_[11];
    let _e84 = (_e77.xyz * _e82.zzz);
    u_xlat3_.x = _e84.x;
    u_xlat3_.y = _e84.y;
    u_xlat3_.z = _e84.z;
    let _e91 = u_xlat0_;
    let _e93 = u_xlat3_;
    let _e95 = u_xlat0_;
    let _e98 = vs_TEXCOORD2_1;
    let _e100 = ((_e93.xyz * _e95.xxx) + _e98.xyz);
    u_xlat0_.x = _e100.x;
    u_xlat0_.y = _e100.y;
    u_xlat0_.z = _e100.z;
    let _e111 = _f_buffer1_.f_cb1_[27];
    u_xlat1_.x = abs(_e111.w);
    let _e118 = _f_buffer1_.f_cb1_[28];
    u_xlat1_.y = abs(_e118.w);
    let _e125 = _f_buffer1_.f_cb1_[29];
    u_xlat1_.z = abs(_e125.w);
    let _e128 = u_xlat1_;
    let _e130 = u_xlat1_;
    let _e132 = log2(_e130.xyz);
    u_xlat1_.x = _e132.x;
    u_xlat1_.y = _e132.y;
    u_xlat1_.z = _e132.z;
    let _e139 = u_xlat1_;
    let _e141 = u_xlat1_;
    let _e147 = (_e141.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat1_.x = _e147.x;
    u_xlat1_.y = _e147.y;
    u_xlat1_.z = _e147.z;
    let _e154 = u_xlat1_;
    let _e156 = u_xlat1_;
    let _e158 = exp2(_e156.xyz);
    u_xlat1_.x = _e158.x;
    u_xlat1_.y = _e158.y;
    u_xlat1_.z = _e158.z;
    let _e165 = u_xlat1_;
    let _e167 = u_xlat1_;
    let _e181 = ((_e167.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat1_.x = _e181.x;
    u_xlat1_.y = _e181.y;
    u_xlat1_.z = _e181.z;
    let _e188 = u_xlat1_;
    let _e190 = u_xlat1_;
    let _e196 = clamp(_e190.xyz, vec3(0f), vec3(1f));
    u_xlat1_.x = _e196.x;
    u_xlat1_.y = _e196.y;
    u_xlat1_.z = _e196.z;
    let _e203 = u_xlat1_;
    let _e205 = u_xlat1_;
    let _e214 = (_e205.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat1_.x = _e214.x;
    u_xlat1_.y = _e214.y;
    u_xlat1_.z = _e214.z;
    let _e221 = u_xlat1_;
    let _e226 = _f_buffer2_.f_cb2_[2];
    let _e228 = u_xlat1_;
    let _e235 = ((_e226.xxx * _e228.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat1_.x = _e235.x;
    u_xlat1_.y = _e235.y;
    u_xlat1_.z = _e235.z;
    let _e242 = vs_TEXCOORD0_1;
    let _e247 = _f_buffer0_.f_cb0_[4];
    let _e252 = hscard_bias.values[0];
    let _e255 = textureSampleBias(f_t0_, samplerf_s0_, _e242.xy, (_e247.x + _e252.x));
    u_xlat2_ = _e255;
    let _e256 = u_xlat2_;
    let _e258 = u_xlat2_;
    let _e263 = _f_buffer2_.f_cb2_[1];
    let _e265 = (_e258.xyz * _e263.xyz);
    u_xlat2_.x = _e265.x;
    u_xlat2_.y = _e265.y;
    u_xlat2_.z = _e265.z;
    let _e272 = u_xlat1_;
    let _e274 = u_xlat1_;
    let _e276 = u_xlat2_;
    let _e278 = (_e274.xyz * _e276.xyz);
    u_xlat1_.x = _e278.x;
    u_xlat1_.y = _e278.y;
    u_xlat1_.z = _e278.z;
    let _e285 = SV_Target0_;
    let _e287 = u_xlat0_;
    let _e289 = u_xlat2_;
    let _e292 = u_xlat1_;
    let _e294 = ((_e287.xyz * _e289.xyz) + _e292.xyz);
    SV_Target0_.x = _e294.x;
    SV_Target0_.y = _e294.y;
    SV_Target0_.z = _e294.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e31 = SV_Target0_;
    return FragmentOutput(_e31);
}
