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
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat13_: f32 = 0f;

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
    u_xlat0_ = _e205.yzwx;
    let _e207 = u_xlat1_;
    let _e209 = u_xlat0_;
    let _e214 = _f_buffer1_.f_cb1_[2];
    let _e216 = (_e209.wxy + _e214.yyy);
    u_xlat1_.x = _e216.x;
    u_xlat1_.y = _e216.y;
    u_xlat1_.z = _e216.z;
    let _e223 = u_xlat0_;
    let _e228 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e223.w, _e228.y);
    let _e232 = u_xlat1_;
    let _e234 = u_xlat13_;
    let _e239 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e232.y * _e234) + -(_e239.w));
    let _e243 = u_xlat1_;
    let _e245 = u_xlat13_;
    let _e247 = u_xlat1_;
    let _e249 = (vec3(_e245) * _e247.xyz);
    u_xlat1_.x = _e249.x;
    u_xlat1_.y = _e249.y;
    u_xlat1_.z = _e249.z;
    let _e259 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e259.w) + 1f);
    let _e264 = u_xlat2_;
    let _e266 = u_xlat13_;
    u_xlat13_ = (_e264.x / _e266);
    let _e269 = u_xlat2_;
    u_xlat2_.x = (_e269.x * 5f);
    let _e274 = u_xlat2_;
    u_xlat2_.x = clamp(_e274.x, 0f, 1f);
    let _e279 = u_xlat6_;
    let _e284 = _f_buffer1_.f_cb1_[8];
    let _e289 = _f_buffer1_.f_cb1_[9];
    let _e292 = (_e284.yzw + -(_e289.xyz));
    u_xlat6_.x = _e292.x;
    u_xlat6_.y = _e292.y;
    u_xlat6_.z = _e292.z;
    let _e299 = u_xlat6_;
    let _e301 = u_xlat13_;
    let _e303 = u_xlat6_;
    let _e309 = _f_buffer1_.f_cb1_[9];
    let _e311 = ((vec3(_e301) * _e303.xyz) + _e309.xyz);
    u_xlat6_.x = _e311.x;
    u_xlat6_.y = _e311.y;
    u_xlat6_.z = _e311.z;
    let _e323 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e323.w);
    let _e326 = u_xlat13_;
    let _e327 = u_xlat1_;
    u_xlat13_ = (_e326 * _e327.y);
    let _e330 = u_xlat3_;
    let _e335 = _f_buffer1_.f_cb1_[9];
    let _e340 = _f_buffer1_.f_cb1_[10];
    let _e343 = (_e335.xyz + -(_e340.xyz));
    u_xlat3_.x = _e343.x;
    u_xlat3_.y = _e343.y;
    u_xlat3_.z = _e343.z;
    let _e350 = u_xlat3_;
    let _e352 = u_xlat13_;
    let _e354 = u_xlat3_;
    let _e360 = _f_buffer1_.f_cb1_[10];
    let _e362 = ((vec3(_e352) * _e354.xyz) + _e360.xyz);
    u_xlat3_.x = _e362.x;
    u_xlat3_.y = _e362.y;
    u_xlat3_.z = _e362.z;
    let _e369 = u_xlat6_;
    let _e371 = u_xlat6_;
    let _e373 = u_xlat3_;
    let _e376 = (_e371.xyz + -(_e373.xyz));
    u_xlat6_.x = _e376.x;
    u_xlat6_.y = _e376.y;
    u_xlat6_.z = _e376.z;
    let _e383 = u_xlat2_;
    let _e385 = u_xlat2_;
    let _e387 = u_xlat6_;
    let _e390 = u_xlat3_;
    let _e392 = ((_e385.xxx * _e387.xyz) + _e390.xyz);
    u_xlat2_.x = _e392.x;
    u_xlat2_.y = _e392.y;
    u_xlat2_.z = _e392.z;
    let _e399 = u_xlat1_;
    let _e401 = u_xlat1_;
    let _e403 = u_xlat2_;
    let _e405 = (_e401.xyz * _e403.xyz);
    u_xlat1_.x = _e405.x;
    u_xlat1_.y = _e405.y;
    u_xlat1_.z = _e405.z;
    let _e412 = u_xlat0_;
    let _e414 = u_xlat1_;
    let _e419 = _f_buffer1_.f_cb1_[2];
    let _e421 = (_e414.xyz * _e419.xxx);
    u_xlat0_.x = _e421.x;
    u_xlat0_.y = _e421.y;
    u_xlat0_.z = _e421.z;
    let _e428 = u_xlat0_;
    let _e429 = vs_COLOR0_1;
    SV_Target0_ = (_e428 * _e429);
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
