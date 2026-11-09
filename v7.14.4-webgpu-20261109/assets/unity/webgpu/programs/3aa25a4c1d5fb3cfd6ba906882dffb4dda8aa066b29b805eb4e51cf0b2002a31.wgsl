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
    f_cb2_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat9_: f32 = 0f;

    let _e40 = _f_buffer1_.f_cb1_[27];
    u_xlat0_.x = abs(_e40.w);
    let _e47 = _f_buffer1_.f_cb1_[28];
    u_xlat0_.y = abs(_e47.w);
    let _e54 = _f_buffer1_.f_cb1_[29];
    u_xlat0_.z = abs(_e54.w);
    let _e57 = u_xlat0_;
    let _e59 = u_xlat0_;
    let _e61 = log2(_e59.xyz);
    u_xlat0_.x = _e61.x;
    u_xlat0_.y = _e61.y;
    u_xlat0_.z = _e61.z;
    let _e68 = u_xlat0_;
    let _e70 = u_xlat0_;
    let _e76 = (_e70.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e76.x;
    u_xlat0_.y = _e76.y;
    u_xlat0_.z = _e76.z;
    let _e83 = u_xlat0_;
    let _e85 = u_xlat0_;
    let _e87 = exp2(_e85.xyz);
    u_xlat0_.x = _e87.x;
    u_xlat0_.y = _e87.y;
    u_xlat0_.z = _e87.z;
    let _e94 = u_xlat0_;
    let _e96 = u_xlat0_;
    let _e110 = ((_e96.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e110.x;
    u_xlat0_.y = _e110.y;
    u_xlat0_.z = _e110.z;
    let _e117 = u_xlat0_;
    let _e119 = u_xlat0_;
    let _e125 = clamp(_e119.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e125.x;
    u_xlat0_.y = _e125.y;
    u_xlat0_.z = _e125.z;
    let _e132 = u_xlat0_;
    let _e134 = u_xlat0_;
    let _e143 = (_e134.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e143.x;
    u_xlat0_.y = _e143.y;
    u_xlat0_.z = _e143.z;
    let _e150 = u_xlat0_;
    let _e155 = _f_buffer2_.f_cb2_[3];
    let _e157 = u_xlat0_;
    let _e164 = ((_e155.xxx * _e157.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat0_.x = _e164.x;
    u_xlat0_.y = _e164.y;
    u_xlat0_.z = _e164.z;
    let _e174 = _f_buffer2_.f_cb2_[3];
    let _e179 = _f_buffer2_.f_cb2_[3];
    u_xlat9_ = (_e174.z + _e179.y);
    let _e186 = _f_buffer2_.f_cb2_[3];
    let _e192 = _f_buffer2_.f_cb2_[3];
    u_xlat1_.x = (-(_e186.z) + _e192.y);
    let _e195 = u_xlat9_;
    let _e196 = u_xlat1_;
    u_xlat9_ = (_e195 + -(_e196.x));
    let _e201 = u_xlat1_;
    let _e204 = vs_TEXCOORD0_1;
    u_xlat1_.x = (-(_e201.x) + _e204.x);
    let _e209 = u_xlat9_;
    u_xlat9_ = (1f / _e209);
    let _e211 = u_xlat9_;
    let _e212 = u_xlat1_;
    u_xlat9_ = (_e211 * _e212.x);
    let _e215 = u_xlat9_;
    u_xlat9_ = clamp(_e215, 0f, 1f);
    let _e220 = u_xlat9_;
    u_xlat1_.x = ((_e220 * -2f) + 3f);
    let _e226 = u_xlat9_;
    let _e227 = u_xlat9_;
    u_xlat9_ = (_e226 * _e227);
    let _e229 = u_xlat1_;
    let _e232 = u_xlat9_;
    u_xlat9_ = ((-(_e229.x) * _e232) + 1f);
    let _e236 = vs_TEXCOORD1_1;
    let _e241 = _f_buffer0_.f_cb0_[4];
    let _e246 = hscard_bias.values[1];
    let _e249 = textureSampleBias(f_t1_, samplerf_s1_, _e236.xy, (_e241.x + _e246.x));
    u_xlat1_ = _e249;
    let _e250 = vs_TEXCOORD0_1;
    let _e255 = _f_buffer0_.f_cb0_[4];
    let _e260 = hscard_bias.values[0];
    let _e263 = textureSampleBias(f_t0_, samplerf_s0_, _e250.xy, (_e255.x + _e260.x));
    u_xlat2_ = _e263;
    let _e264 = u_xlat1_;
    let _e266 = u_xlat1_;
    let _e268 = u_xlat2_;
    let _e271 = (_e266.xyz + -(_e268.xyz));
    u_xlat1_.x = _e271.x;
    u_xlat1_.y = _e271.y;
    u_xlat1_.z = _e271.z;
    let _e278 = u_xlat1_;
    let _e280 = u_xlat9_;
    let _e282 = u_xlat1_;
    let _e285 = u_xlat2_;
    let _e287 = ((vec3(_e280) * _e282.xyz) + _e285.xyz);
    u_xlat1_.x = _e287.x;
    u_xlat1_.y = _e287.y;
    u_xlat1_.z = _e287.z;
    let _e294 = u_xlat1_;
    let _e296 = u_xlat1_;
    let _e301 = _f_buffer2_.f_cb2_[2];
    let _e303 = (_e296.xyz * _e301.xyz);
    u_xlat1_.x = _e303.x;
    u_xlat1_.y = _e303.y;
    u_xlat1_.z = _e303.z;
    let _e310 = u_xlat0_;
    let _e312 = u_xlat0_;
    let _e314 = u_xlat1_;
    let _e316 = (_e312.xyz * _e314.xyz);
    u_xlat0_.x = _e316.x;
    u_xlat0_.y = _e316.y;
    u_xlat0_.z = _e316.z;
    let _e323 = vs_NORMAL0_1;
    let _e325 = vs_NORMAL0_1;
    u_xlat9_ = dot(_e323.xyz, _e325.xyz);
    let _e328 = u_xlat9_;
    u_xlat9_ = inverseSqrt(_e328);
    let _e330 = u_xlat2_;
    let _e332 = u_xlat9_;
    let _e334 = vs_NORMAL0_1;
    let _e336 = (vec3(_e332) * _e334.xyz);
    u_xlat2_.x = _e336.x;
    u_xlat2_.y = _e336.y;
    u_xlat2_.z = _e336.z;
    let _e343 = u_xlat2_;
    let _e348 = _f_buffer0_.f_cb0_[5];
    u_xlat9_ = dot(_e343.xyz, _e348.xyz);
    let _e351 = u_xlat9_;
    u_xlat9_ = clamp(_e351, 0f, 1f);
    let _e355 = u_xlat2_;
    let _e360 = _f_buffer0_.f_cb0_[6];
    let _e365 = _f_buffer1_.f_cb1_[11];
    let _e367 = (_e360.xyz * _e365.zzz);
    u_xlat2_.x = _e367.x;
    u_xlat2_.y = _e367.y;
    u_xlat2_.z = _e367.z;
    let _e374 = u_xlat2_;
    let _e376 = u_xlat2_;
    let _e378 = u_xlat9_;
    let _e381 = vs_TEXCOORD3_1;
    let _e383 = ((_e376.xyz * vec3(_e378)) + _e381.xyz);
    u_xlat2_.x = _e383.x;
    u_xlat2_.y = _e383.y;
    u_xlat2_.z = _e383.z;
    let _e390 = SV_Target0_;
    let _e392 = u_xlat2_;
    let _e394 = u_xlat1_;
    let _e397 = u_xlat0_;
    let _e399 = ((_e392.xyz * _e394.xyz) + _e397.xyz);
    SV_Target0_.x = _e399.x;
    SV_Target0_.y = _e399.y;
    SV_Target0_.z = _e399.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(3) vs_TEXCOORD3_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e39 = SV_Target0_;
    return FragmentOutput(_e39);
}
