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
    f_cb2_: array<vec4<f32>, 2>,
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
    var u_xlat4_: vec3<f32> = vec3(0f);

    let _e39 = vs_NORMAL0_1;
    let _e41 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e39.xyz, _e41.xyz);
    let _e45 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e45.x);
    let _e48 = u_xlat0_;
    let _e50 = u_xlat0_;
    let _e52 = vs_NORMAL0_1;
    let _e54 = (_e50.xxx * _e52.xyz);
    u_xlat0_.x = _e54.x;
    u_xlat0_.y = _e54.y;
    u_xlat0_.z = _e54.z;
    let _e62 = u_xlat0_;
    let _e67 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e62.xyz, _e67.xyz);
    let _e71 = u_xlat0_;
    u_xlat0_.x = clamp(_e71.x, 0f, 1f);
    let _e76 = u_xlat4_;
    let _e81 = _f_buffer0_.f_cb0_[6];
    let _e86 = _f_buffer1_.f_cb1_[11];
    let _e88 = (_e81.xyz * _e86.zzz);
    u_xlat4_.x = _e88.x;
    u_xlat4_.y = _e88.y;
    u_xlat4_.z = _e88.z;
    let _e95 = u_xlat0_;
    let _e97 = u_xlat4_;
    let _e99 = u_xlat0_;
    let _e102 = vs_TEXCOORD2_1;
    let _e104 = ((_e97.xyz * _e99.xxx) + _e102.xyz);
    u_xlat0_.x = _e104.x;
    u_xlat0_.y = _e104.y;
    u_xlat0_.z = _e104.z;
    let _e115 = _f_buffer1_.f_cb1_[27];
    u_xlat1_.x = abs(_e115.w);
    let _e122 = _f_buffer1_.f_cb1_[28];
    u_xlat1_.y = abs(_e122.w);
    let _e129 = _f_buffer1_.f_cb1_[29];
    u_xlat1_.z = abs(_e129.w);
    let _e132 = u_xlat1_;
    let _e134 = u_xlat1_;
    let _e136 = log2(_e134.xyz);
    u_xlat1_.x = _e136.x;
    u_xlat1_.y = _e136.y;
    u_xlat1_.z = _e136.z;
    let _e143 = u_xlat1_;
    let _e145 = u_xlat1_;
    let _e151 = (_e145.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat1_.x = _e151.x;
    u_xlat1_.y = _e151.y;
    u_xlat1_.z = _e151.z;
    let _e158 = u_xlat1_;
    let _e160 = u_xlat1_;
    let _e162 = exp2(_e160.xyz);
    u_xlat1_.x = _e162.x;
    u_xlat1_.y = _e162.y;
    u_xlat1_.z = _e162.z;
    let _e169 = u_xlat1_;
    let _e171 = u_xlat1_;
    let _e185 = ((_e171.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat1_.x = _e185.x;
    u_xlat1_.y = _e185.y;
    u_xlat1_.z = _e185.z;
    let _e192 = u_xlat1_;
    let _e194 = u_xlat1_;
    let _e200 = clamp(_e194.xyz, vec3(0f), vec3(1f));
    u_xlat1_.x = _e200.x;
    u_xlat1_.y = _e200.y;
    u_xlat1_.z = _e200.z;
    let _e207 = u_xlat1_;
    let _e209 = u_xlat1_;
    let _e218 = (_e209.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat1_.x = _e218.x;
    u_xlat1_.y = _e218.y;
    u_xlat1_.z = _e218.z;
    let _e225 = u_xlat1_;
    let _e230 = _f_buffer2_.f_cb2_[1];
    let _e232 = u_xlat1_;
    let _e239 = ((_e230.xxx * _e232.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat1_.x = _e239.x;
    u_xlat1_.y = _e239.y;
    u_xlat1_.z = _e239.z;
    let _e246 = vs_TEXCOORD0_1;
    let _e251 = _f_buffer0_.f_cb0_[4];
    let _e256 = hscard_bias.values[0];
    let _e259 = textureSampleBias(f_t0_, samplerf_s0_, _e246.xy, (_e251.x + _e256.x));
    u_xlat2_ = _e259;
    let _e260 = u_xlat3_;
    let _e262 = u_xlat2_;
    let _e264 = u_xlat2_;
    let _e266 = (_e262.www * _e264.xyz);
    u_xlat3_.x = _e266.x;
    u_xlat3_.y = _e266.y;
    u_xlat3_.z = _e266.z;
    let _e273 = u_xlat3_;
    let _e275 = u_xlat3_;
    let _e281 = (_e275.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat3_.x = _e281.x;
    u_xlat3_.y = _e281.y;
    u_xlat3_.z = _e281.z;
    let _e288 = u_xlat1_;
    let _e290 = u_xlat1_;
    let _e292 = u_xlat3_;
    let _e294 = (_e290.xyz * _e292.xyz);
    u_xlat1_.x = _e294.x;
    u_xlat1_.y = _e294.y;
    u_xlat1_.z = _e294.z;
    let _e301 = u_xlat2_;
    let _e303 = u_xlat2_;
    let _e308 = _f_buffer2_.f_cb2_[0];
    let _e310 = (_e303.xyz * _e308.xyz);
    u_xlat2_.x = _e310.x;
    u_xlat2_.y = _e310.y;
    u_xlat2_.z = _e310.z;
    let _e317 = u_xlat2_;
    let _e319 = u_xlat2_;
    let _e321 = u_xlat2_;
    let _e323 = (_e319.www * _e321.xyz);
    u_xlat2_.x = _e323.x;
    u_xlat2_.y = _e323.y;
    u_xlat2_.z = _e323.z;
    let _e331 = u_xlat2_;
    SV_Target0_.w = _e331.w;
    let _e333 = SV_Target0_;
    let _e335 = u_xlat2_;
    let _e337 = u_xlat0_;
    let _e340 = u_xlat1_;
    let _e342 = ((_e335.xyz * _e337.xyz) + _e340.xyz);
    SV_Target0_.x = _e342.x;
    SV_Target0_.y = _e342.y;
    SV_Target0_.z = _e342.z;
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
