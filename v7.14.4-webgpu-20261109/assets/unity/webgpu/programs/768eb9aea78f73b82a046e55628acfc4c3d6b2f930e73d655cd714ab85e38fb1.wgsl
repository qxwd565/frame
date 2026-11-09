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
    let _e212 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e207.w + _e212.y);
    let _e216 = u_xlat0_;
    let _e221 = _f_buffer1_.f_cb1_[3];
    u_xlat5_.x = max(_e216.w, _e221.y);
    let _e224 = u_xlat1_;
    let _e226 = u_xlat5_;
    let _e232 = _f_buffer1_.f_cb1_[10];
    u_xlat9_ = ((_e224.x * _e226.x) + -(_e232.w));
    let _e237 = u_xlat5_;
    let _e239 = u_xlat1_;
    u_xlat1_.x = (_e237.x * _e239.x);
    let _e246 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (-(_e246.w) + 1f);
    let _e252 = u_xlat9_;
    let _e253 = u_xlat5_;
    u_xlat5_.x = (_e252 / _e253.x);
    let _e256 = u_xlat9_;
    u_xlat9_ = (_e256 * 5f);
    let _e259 = u_xlat9_;
    u_xlat9_ = clamp(_e259, 0f, 1f);
    let _e263 = u_xlat2_;
    let _e268 = _f_buffer1_.f_cb1_[8];
    let _e273 = _f_buffer1_.f_cb1_[9];
    let _e276 = (_e268.yzw + -(_e273.xyz));
    u_xlat2_.x = _e276.x;
    u_xlat2_.y = _e276.y;
    u_xlat2_.z = _e276.z;
    let _e283 = u_xlat2_;
    let _e285 = u_xlat5_;
    let _e287 = u_xlat2_;
    let _e293 = _f_buffer1_.f_cb1_[9];
    let _e295 = ((_e285.xxx * _e287.xyz) + _e293.xyz);
    u_xlat2_.x = _e295.x;
    u_xlat2_.y = _e295.y;
    u_xlat2_.z = _e295.z;
    let _e308 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (1f / _e308.w);
    let _e312 = u_xlat5_;
    let _e314 = u_xlat1_;
    u_xlat5_.x = (_e312.x * _e314.x);
    let _e317 = u_xlat3_;
    let _e322 = _f_buffer1_.f_cb1_[9];
    let _e327 = _f_buffer1_.f_cb1_[10];
    let _e330 = (_e322.xyz + -(_e327.xyz));
    u_xlat3_.x = _e330.x;
    u_xlat3_.y = _e330.y;
    u_xlat3_.z = _e330.z;
    let _e337 = u_xlat3_;
    let _e339 = u_xlat5_;
    let _e341 = u_xlat3_;
    let _e347 = _f_buffer1_.f_cb1_[10];
    let _e349 = ((_e339.xxx * _e341.xyz) + _e347.xyz);
    u_xlat3_.x = _e349.x;
    u_xlat3_.y = _e349.y;
    u_xlat3_.z = _e349.z;
    let _e356 = u_xlat2_;
    let _e358 = u_xlat2_;
    let _e360 = u_xlat3_;
    let _e363 = (_e358.xyz + -(_e360.xyz));
    u_xlat2_.x = _e363.x;
    u_xlat2_.y = _e363.y;
    u_xlat2_.z = _e363.z;
    let _e370 = u_xlat5_;
    let _e372 = u_xlat9_;
    let _e374 = u_xlat2_;
    let _e377 = u_xlat3_;
    let _e379 = ((vec3(_e372) * _e374.xyz) + _e377.xyz);
    u_xlat5_.x = _e379.x;
    u_xlat5_.y = _e379.y;
    u_xlat5_.z = _e379.z;
    let _e386 = u_xlat1_;
    let _e388 = u_xlat5_;
    let _e390 = u_xlat1_;
    let _e392 = (_e388.xyz * _e390.xxx);
    u_xlat1_.x = _e392.x;
    u_xlat1_.y = _e392.y;
    u_xlat1_.z = _e392.z;
    let _e399 = u_xlat0_;
    let _e401 = u_xlat1_;
    let _e406 = _f_buffer1_.f_cb1_[2];
    let _e408 = (_e401.xyz * _e406.xxx);
    u_xlat0_.x = _e408.x;
    u_xlat0_.y = _e408.y;
    u_xlat0_.z = _e408.z;
    let _e415 = u_xlat0_;
    let _e416 = vs_COLOR0_1;
    SV_Target0_ = (_e415 * _e416);
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
