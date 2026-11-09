struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 11>,
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
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat9_: f32 = 0f;

    let _e43 = u_xlat0_;
    let _e45 = vs_TEXCOORD0_1;
    let _e46 = _e45.zw;
    u_xlat0_.x = _e46.x;
    u_xlat0_.y = _e46.y;
    let _e51 = u_xlat0_;
    let _e53 = u_xlat0_;
    let _e59 = clamp(_e53.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    let _e64 = u_xlat0_;
    let _e66 = u_xlat0_;
    let _e68 = vs_TEXCOORD0_1;
    let _e71 = (_e66.xy + -(_e68.zw));
    u_xlat0_.x = _e71.x;
    u_xlat0_.y = _e71.y;
    let _e76 = u_xlat0_;
    let _e81 = _f_buffer1_.f_cb1_[6];
    let _e83 = u_xlat0_;
    let _e86 = vs_TEXCOORD0_1;
    let _e88 = ((_e81.xx * _e83.xy) + _e86.zw);
    u_xlat0_.x = _e88.x;
    u_xlat0_.y = _e88.y;
    let _e93 = u_xlat0_;
    let _e98 = _f_buffer0_.f_cb0_[4];
    let _e103 = hscard_bias.values[1];
    let _e106 = textureSampleBias(f_t1_, samplerf_s1_, _e93.xy, (_e98.x + _e103.x));
    u_xlat0_ = _e106;
    let _e107 = u_xlat0_;
    let _e109 = u_xlat0_;
    let _e120 = ((_e109.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e120.x;
    u_xlat0_.y = _e120.y;
    let _e125 = u_xlat0_;
    let _e127 = u_xlat0_;
    let _e132 = _f_buffer1_.f_cb1_[5];
    let _e135 = vs_TEXCOORD0_1;
    let _e137 = ((_e127.xy * _e132.zw) + _e135.xy);
    u_xlat0_.x = _e137.x;
    u_xlat0_.y = _e137.y;
    let _e142 = u_xlat8_;
    let _e144 = u_xlat0_;
    let _e145 = _e144.xy;
    u_xlat8_.x = _e145.x;
    u_xlat8_.y = _e145.y;
    let _e150 = u_xlat8_;
    let _e152 = u_xlat8_;
    let _e158 = clamp(_e152.xy, vec2(0f), vec2(1f));
    u_xlat8_.x = _e158.x;
    u_xlat8_.y = _e158.y;
    let _e163 = u_xlat8_;
    let _e165 = u_xlat0_;
    let _e168 = u_xlat8_;
    let _e170 = (-(_e165.xy) + _e168.xy);
    u_xlat8_.x = _e170.x;
    u_xlat8_.y = _e170.y;
    let _e175 = u_xlat0_;
    let _e180 = _f_buffer1_.f_cb1_[3];
    let _e182 = u_xlat8_;
    let _e185 = u_xlat0_;
    let _e187 = ((_e180.zz * _e182.xy) + _e185.xy);
    u_xlat0_.x = _e187.x;
    u_xlat0_.y = _e187.y;
    let _e192 = u_xlat0_;
    let _e197 = _f_buffer0_.f_cb0_[4];
    let _e202 = hscard_bias.values[0];
    let _e205 = textureSampleBias(f_t0_, samplerf_s0_, _e192.xy, (_e197.x + _e202.x));
    u_xlat0_ = _e205;
    let _e207 = u_xlat0_;
    u_xlat0_.w = dot(_e207.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e215 = u_xlat0_;
    let _e220 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e215.w + _e220.y);
    let _e224 = u_xlat0_;
    let _e229 = _f_buffer1_.f_cb1_[3];
    u_xlat5_.x = max(_e224.w, _e229.y);
    let _e232 = u_xlat1_;
    let _e234 = u_xlat5_;
    let _e240 = _f_buffer1_.f_cb1_[10];
    u_xlat9_ = ((_e232.x * _e234.x) + -(_e240.w));
    let _e245 = u_xlat5_;
    let _e247 = u_xlat1_;
    u_xlat1_.x = (_e245.x * _e247.x);
    let _e254 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (-(_e254.w) + 1f);
    let _e260 = u_xlat9_;
    let _e261 = u_xlat5_;
    u_xlat5_.x = (_e260 / _e261.x);
    let _e264 = u_xlat9_;
    u_xlat9_ = (_e264 * 5f);
    let _e267 = u_xlat9_;
    u_xlat9_ = clamp(_e267, 0f, 1f);
    let _e271 = u_xlat2_;
    let _e276 = _f_buffer1_.f_cb1_[8];
    let _e281 = _f_buffer1_.f_cb1_[9];
    let _e284 = (_e276.yzw + -(_e281.xyz));
    u_xlat2_.x = _e284.x;
    u_xlat2_.y = _e284.y;
    u_xlat2_.z = _e284.z;
    let _e291 = u_xlat2_;
    let _e293 = u_xlat5_;
    let _e295 = u_xlat2_;
    let _e301 = _f_buffer1_.f_cb1_[9];
    let _e303 = ((_e293.xxx * _e295.xyz) + _e301.xyz);
    u_xlat2_.x = _e303.x;
    u_xlat2_.y = _e303.y;
    u_xlat2_.z = _e303.z;
    let _e316 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (1f / _e316.w);
    let _e320 = u_xlat5_;
    let _e322 = u_xlat1_;
    u_xlat5_.x = (_e320.x * _e322.x);
    let _e325 = u_xlat3_;
    let _e330 = _f_buffer1_.f_cb1_[9];
    let _e335 = _f_buffer1_.f_cb1_[10];
    let _e338 = (_e330.xyz + -(_e335.xyz));
    u_xlat3_.x = _e338.x;
    u_xlat3_.y = _e338.y;
    u_xlat3_.z = _e338.z;
    let _e345 = u_xlat3_;
    let _e347 = u_xlat5_;
    let _e349 = u_xlat3_;
    let _e355 = _f_buffer1_.f_cb1_[10];
    let _e357 = ((_e347.xxx * _e349.xyz) + _e355.xyz);
    u_xlat3_.x = _e357.x;
    u_xlat3_.y = _e357.y;
    u_xlat3_.z = _e357.z;
    let _e364 = u_xlat2_;
    let _e366 = u_xlat2_;
    let _e368 = u_xlat3_;
    let _e371 = (_e366.xyz + -(_e368.xyz));
    u_xlat2_.x = _e371.x;
    u_xlat2_.y = _e371.y;
    u_xlat2_.z = _e371.z;
    let _e378 = u_xlat5_;
    let _e380 = u_xlat9_;
    let _e382 = u_xlat2_;
    let _e385 = u_xlat3_;
    let _e387 = ((vec3(_e380) * _e382.xyz) + _e385.xyz);
    u_xlat5_.x = _e387.x;
    u_xlat5_.y = _e387.y;
    u_xlat5_.z = _e387.z;
    let _e394 = u_xlat1_;
    let _e396 = u_xlat5_;
    let _e398 = u_xlat1_;
    let _e400 = (_e396.xyz * _e398.xxx);
    u_xlat1_.x = _e400.x;
    u_xlat1_.y = _e400.y;
    u_xlat1_.z = _e400.z;
    let _e407 = u_xlat0_;
    let _e409 = u_xlat1_;
    let _e414 = _f_buffer1_.f_cb1_[2];
    let _e416 = (_e409.xyz * _e414.xxx);
    u_xlat0_.x = _e416.x;
    u_xlat0_.y = _e416.y;
    u_xlat0_.z = _e416.z;
    let _e423 = u_xlat0_;
    let _e424 = vs_COLOR0_1;
    SV_Target0_ = (_e423 * _e424);
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
