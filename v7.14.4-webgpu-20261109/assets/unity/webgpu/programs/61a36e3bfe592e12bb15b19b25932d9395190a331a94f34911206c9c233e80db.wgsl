struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 13>,
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
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat10_: f32 = 0f;
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlat18_: f32 = 0f;

    let _e54 = u_xlat0_;
    let _e59 = _f_buffer1_.f_cb1_[8];
    let _e64 = _f_buffer1_.f_cb1_[9];
    let _e67 = (_e59.yzw + -(_e64.xyz));
    u_xlat0_.x = _e67.x;
    u_xlat0_.y = _e67.y;
    u_xlat0_.z = _e67.z;
    let _e77 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e77.w) + 1f);
    let _e82 = vs_TEXCOORD0_1;
    u_xlat1_ = _e82.zwxy;
    let _e84 = u_xlat1_;
    u_xlat1_ = clamp(_e84, vec4(0f), vec4(1f));
    let _e90 = u_xlat1_;
    let _e91 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e90 + -(_e91.zwxy));
    let _e95 = u_xlat11_;
    let _e100 = _f_buffer1_.f_cb1_[3];
    let _e102 = u_xlat1_;
    let _e105 = vs_TEXCOORD0_1;
    let _e107 = ((_e100.zz * _e102.zw) + _e105.xy);
    u_xlat11_.x = _e107.x;
    u_xlat11_.y = _e107.y;
    let _e112 = u_xlat1_;
    let _e117 = _f_buffer1_.f_cb1_[6];
    let _e119 = u_xlat1_;
    let _e122 = vs_TEXCOORD0_1;
    let _e124 = ((_e117.xx * _e119.xy) + _e122.zw);
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer0_.f_cb0_[4];
    let _e139 = hscard_bias.values[1];
    let _e142 = textureSampleBias(f_t1_, samplerf_s1_, _e129.xy, (_e134.x + _e139.x));
    u_xlat2_ = _e142;
    let _e143 = u_xlat2_;
    let _e145 = vs_COLOR1_1;
    u_xlat2_ = (_e143.xyzx * _e145);
    let _e147 = u_xlat11_;
    let _e152 = _f_buffer0_.f_cb0_[4];
    let _e157 = hscard_bias.values[0];
    let _e160 = textureSampleBias(f_t0_, samplerf_s0_, _e147.xy, (_e152.x + _e157.x));
    u_xlat1_ = _e160.yzwx;
    let _e162 = u_xlat3_;
    let _e164 = u_xlat1_;
    let _e169 = _f_buffer1_.f_cb1_[2];
    let _e171 = (_e164.wxy + _e169.yyy);
    u_xlat3_.x = _e171.x;
    u_xlat3_.y = _e171.y;
    u_xlat3_.z = _e171.z;
    let _e178 = u_xlat1_;
    let _e183 = _f_buffer1_.f_cb1_[3];
    u_xlat18_ = max(_e178.w, _e183.y);
    let _e187 = u_xlat3_;
    let _e189 = u_xlat18_;
    let _e194 = _f_buffer1_.f_cb1_[10];
    u_xlat4_.x = ((_e187.y * _e189) + -(_e194.w));
    let _e198 = u_xlat3_;
    let _e200 = u_xlat18_;
    let _e202 = u_xlat3_;
    let _e204 = (vec3(_e200) * _e202.xyz);
    u_xlat3_.x = _e204.x;
    u_xlat3_.y = _e204.y;
    u_xlat3_.z = _e204.z;
    let _e211 = u_xlat4_;
    let _e213 = u_xlat15_;
    u_xlat15_ = (_e211.x / _e213);
    let _e215 = u_xlat4_;
    u_xlat18_ = (_e215.x * 5f);
    let _e219 = u_xlat18_;
    u_xlat18_ = clamp(_e219, 0f, 1f);
    let _e223 = u_xlat0_;
    let _e225 = u_xlat15_;
    let _e227 = u_xlat0_;
    let _e233 = _f_buffer1_.f_cb1_[9];
    let _e235 = ((vec3(_e225) * _e227.xyz) + _e233.xyz);
    u_xlat0_.x = _e235.x;
    u_xlat0_.y = _e235.y;
    u_xlat0_.z = _e235.z;
    let _e247 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e247.w);
    let _e250 = u_xlat15_;
    let _e251 = u_xlat3_;
    u_xlat15_ = (_e250 * _e251.y);
    let _e254 = u_xlat4_;
    let _e259 = _f_buffer1_.f_cb1_[9];
    let _e264 = _f_buffer1_.f_cb1_[10];
    let _e267 = (_e259.xyz + -(_e264.xyz));
    u_xlat4_.x = _e267.x;
    u_xlat4_.y = _e267.y;
    u_xlat4_.z = _e267.z;
    let _e274 = u_xlat4_;
    let _e276 = u_xlat15_;
    let _e278 = u_xlat4_;
    let _e284 = _f_buffer1_.f_cb1_[10];
    let _e286 = ((vec3(_e276) * _e278.xyz) + _e284.xyz);
    u_xlat4_.x = _e286.x;
    u_xlat4_.y = _e286.y;
    u_xlat4_.z = _e286.z;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat4_;
    let _e300 = (_e295.xyz + -(_e297.xyz));
    u_xlat0_.x = _e300.x;
    u_xlat0_.y = _e300.y;
    u_xlat0_.z = _e300.z;
    let _e307 = u_xlat0_;
    let _e309 = u_xlat18_;
    let _e311 = u_xlat0_;
    let _e314 = u_xlat4_;
    let _e316 = ((vec3(_e309) * _e311.xyz) + _e314.xyz);
    u_xlat0_.x = _e316.x;
    u_xlat0_.y = _e316.y;
    u_xlat0_.z = _e316.z;
    let _e323 = u_xlat0_;
    let _e325 = u_xlat0_;
    let _e327 = u_xlat3_;
    let _e329 = (_e325.xyz * _e327.xyz);
    u_xlat0_.x = _e329.x;
    u_xlat0_.y = _e329.y;
    u_xlat0_.z = _e329.z;
    let _e336 = u_xlat1_;
    let _e338 = u_xlat0_;
    let _e343 = _f_buffer1_.f_cb1_[2];
    let _e345 = (_e338.xyz * _e343.xxx);
    u_xlat1_.x = _e345.x;
    u_xlat1_.y = _e345.y;
    u_xlat1_.z = _e345.z;
    let _e353 = vs_TEXCOORD1_1;
    let _e357 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e353 + -(_e357.z));
    let _e362 = u_xlat0_;
    u_xlat0_.x = clamp(_e362.x, 0f, 1f);
    let _e368 = u_xlat0_;
    u_xlat0_.x = (_e368.x + -0.00001f);
    let _e373 = u_xlat0_;
    let _e376 = u_xlat1_;
    u_xlat5_ = (-(_e373.x) + _e376.w);
    let _e379 = vs_TEXCOORD1_1;
    let _e383 = _f_buffer1_.f_cb1_[12];
    u_xlat10_ = (_e379 + _e383.z);
    let _e386 = u_xlat10_;
    u_xlat10_ = clamp(_e386, 0f, 1f);
    let _e391 = u_xlat0_;
    let _e394 = u_xlat10_;
    u_xlat0_.x = (-(_e391.x) + _e394);
    let _e399 = u_xlat0_;
    u_xlat0_.x = (1f / _e399.x);
    let _e403 = u_xlat0_;
    let _e405 = u_xlat5_;
    u_xlat0_.x = (_e403.x * _e405);
    let _e408 = u_xlat0_;
    u_xlat0_.x = clamp(_e408.x, 0f, 1f);
    let _e413 = u_xlat0_;
    u_xlat5_ = ((_e413.x * -2f) + 3f);
    let _e421 = u_xlat0_;
    let _e423 = u_xlat0_;
    u_xlat0_.x = (_e421.x * _e423.x);
    let _e427 = u_xlat0_;
    let _e429 = u_xlat5_;
    u_xlat0_.x = (_e427.x * _e429);
    let _e431 = u_xlat1_;
    let _e432 = u_xlat0_;
    let _e435 = u_xlat2_;
    u_xlat0_ = ((_e431 * _e432.xxxx) + _e435);
    let _e437 = u_xlat0_;
    let _e438 = vs_COLOR0_1;
    SV_Target0_ = (_e437 * _e438);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
