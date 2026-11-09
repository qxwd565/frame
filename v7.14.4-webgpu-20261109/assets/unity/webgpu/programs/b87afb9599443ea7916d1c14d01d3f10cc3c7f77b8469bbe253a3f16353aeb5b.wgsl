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
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat10_: f32 = 0f;
    var u_xlat12_: f32 = 0f;

    let _e51 = u_xlat0_;
    let _e56 = _f_buffer1_.f_cb1_[8];
    let _e61 = _f_buffer1_.f_cb1_[9];
    let _e64 = (_e56.yzw + -(_e61.xyz));
    u_xlat0_.x = _e64.x;
    u_xlat0_.y = _e64.y;
    u_xlat0_.z = _e64.z;
    let _e74 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e74.w) + 1f);
    let _e79 = vs_TEXCOORD0_1;
    u_xlat1_ = _e79.zwxy;
    let _e81 = u_xlat1_;
    u_xlat1_ = clamp(_e81, vec4(0f), vec4(1f));
    let _e87 = u_xlat1_;
    let _e88 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e87 + -(_e88.zwxy));
    let _e92 = u_xlat9_;
    let _e97 = _f_buffer1_.f_cb1_[3];
    let _e99 = u_xlat1_;
    let _e102 = vs_TEXCOORD0_1;
    let _e104 = ((_e97.zz * _e99.zw) + _e102.xy);
    u_xlat9_.x = _e104.x;
    u_xlat9_.y = _e104.y;
    let _e109 = u_xlat1_;
    let _e114 = _f_buffer1_.f_cb1_[6];
    let _e116 = u_xlat1_;
    let _e119 = vs_TEXCOORD0_1;
    let _e121 = ((_e114.xx * _e116.xy) + _e119.zw);
    u_xlat1_.x = _e121.x;
    u_xlat1_.y = _e121.y;
    let _e126 = u_xlat1_;
    let _e131 = _f_buffer0_.f_cb0_[4];
    let _e136 = hscard_bias.values[1];
    let _e139 = textureSampleBias(f_t1_, samplerf_s1_, _e126.xy, (_e131.x + _e136.x));
    u_xlat2_ = _e139;
    let _e140 = u_xlat9_;
    let _e145 = _f_buffer0_.f_cb0_[4];
    let _e150 = hscard_bias.values[0];
    let _e153 = textureSampleBias(f_t0_, samplerf_s0_, _e140.xy, (_e145.x + _e150.x));
    u_xlat1_ = _e153;
    let _e155 = u_xlat1_;
    u_xlat1_.w = dot(_e155.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e163 = u_xlat1_;
    let _e168 = _f_buffer1_.f_cb1_[2];
    u_xlat2_.x = (_e163.w + _e168.y);
    let _e171 = u_xlat1_;
    let _e176 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = max(_e171.w, _e176.y);
    let _e179 = u_xlat2_;
    let _e181 = u_xlat6_;
    let _e186 = _f_buffer1_.f_cb1_[10];
    u_xlat10_ = ((_e179.x * _e181) + -(_e186.w));
    let _e191 = u_xlat6_;
    let _e192 = u_xlat2_;
    u_xlat2_.x = (_e191 * _e192.x);
    let _e195 = u_xlat10_;
    let _e196 = u_xlat12_;
    u_xlat12_ = (_e195 / _e196);
    let _e198 = u_xlat10_;
    u_xlat6_ = (_e198 * 5f);
    let _e201 = u_xlat6_;
    u_xlat6_ = clamp(_e201, 0f, 1f);
    let _e205 = u_xlat0_;
    let _e207 = u_xlat12_;
    let _e209 = u_xlat0_;
    let _e215 = _f_buffer1_.f_cb1_[9];
    let _e217 = ((vec3(_e207) * _e209.xyz) + _e215.xyz);
    u_xlat0_.x = _e217.x;
    u_xlat0_.y = _e217.y;
    u_xlat0_.z = _e217.z;
    let _e229 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e229.w);
    let _e232 = u_xlat12_;
    let _e233 = u_xlat2_;
    u_xlat12_ = (_e232 * _e233.x);
    let _e236 = u_xlat3_;
    let _e241 = _f_buffer1_.f_cb1_[9];
    let _e246 = _f_buffer1_.f_cb1_[10];
    let _e249 = (_e241.xyz + -(_e246.xyz));
    u_xlat3_.x = _e249.x;
    u_xlat3_.y = _e249.y;
    u_xlat3_.z = _e249.z;
    let _e256 = u_xlat3_;
    let _e258 = u_xlat12_;
    let _e260 = u_xlat3_;
    let _e266 = _f_buffer1_.f_cb1_[10];
    let _e268 = ((vec3(_e258) * _e260.xyz) + _e266.xyz);
    u_xlat3_.x = _e268.x;
    u_xlat3_.y = _e268.y;
    u_xlat3_.z = _e268.z;
    let _e275 = u_xlat0_;
    let _e277 = u_xlat0_;
    let _e279 = u_xlat3_;
    let _e282 = (_e277.xyz + -(_e279.xyz));
    u_xlat0_.x = _e282.x;
    u_xlat0_.y = _e282.y;
    u_xlat0_.z = _e282.z;
    let _e289 = u_xlat0_;
    let _e291 = u_xlat6_;
    let _e293 = u_xlat0_;
    let _e296 = u_xlat3_;
    let _e298 = ((vec3(_e291) * _e293.xyz) + _e296.xyz);
    u_xlat0_.x = _e298.x;
    u_xlat0_.y = _e298.y;
    u_xlat0_.z = _e298.z;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat0_;
    let _e309 = u_xlat2_;
    let _e311 = (_e307.xyz * _e309.xxx);
    u_xlat0_.x = _e311.x;
    u_xlat0_.y = _e311.y;
    u_xlat0_.z = _e311.z;
    let _e318 = u_xlat1_;
    let _e320 = u_xlat0_;
    let _e325 = _f_buffer1_.f_cb1_[2];
    let _e327 = (_e320.xyz * _e325.xxx);
    u_xlat1_.x = _e327.x;
    u_xlat1_.y = _e327.y;
    u_xlat1_.z = _e327.z;
    let _e335 = vs_TEXCOORD1_1;
    let _e339 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e335 + _e339.y);
    let _e343 = u_xlat0_;
    u_xlat0_.x = ((_e343.x * 2f) + -1f);
    let _e351 = u_xlat0_;
    let _e354 = u_xlat2_;
    u_xlat0_.x = (-(_e351.x) + _e354.w);
    let _e358 = u_xlat0_;
    u_xlat0_.x = clamp(_e358.x, 0f, 1f);
    let _e364 = u_xlat0_;
    u_xlat0_.x = log2(_e364.x);
    let _e371 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e371.z * 10f);
    let _e376 = u_xlat0_;
    let _e378 = u_xlat4_;
    u_xlat0_.x = (_e376.x * _e378.x);
    let _e382 = u_xlat0_;
    u_xlat0_.x = exp2(_e382.x);
    let _e385 = u_xlat0_;
    let _e387 = u_xlat1_;
    u_xlat2_ = (_e385.xxxx * _e387);
    let _e390 = u_xlat0_;
    u_xlat0_.x = (-(_e390.x) + 1f);
    let _e396 = u_xlat0_;
    u_xlat0_.x = log2(_e396.x);
    let _e400 = u_xlat0_;
    u_xlat0_.x = (_e400.x * 10f);
    let _e405 = u_xlat0_;
    u_xlat0_.x = exp2(_e405.x);
    let _e409 = u_xlat2_;
    u_xlat4_.x = (_e409.w * 1000000f);
    let _e414 = u_xlat4_;
    u_xlat4_.x = clamp(_e414.x, 0f, 1f);
    let _e420 = u_xlat1_;
    let _e422 = u_xlat4_;
    u_xlat4_.x = (_e420.w * _e422.x);
    let _e426 = u_xlat4_;
    let _e428 = u_xlat0_;
    u_xlat0_.x = (_e426.x * _e428.x);
    let _e431 = u_xlat4_;
    let _e436 = _f_buffer1_.f_cb1_[7];
    let _e441 = _f_buffer1_.f_cb1_[8];
    let _e443 = (_e436.xyz * _e441.xxx);
    u_xlat4_.x = _e443.x;
    u_xlat4_.y = _e443.y;
    u_xlat4_.z = _e443.z;
    let _e450 = u_xlat0_;
    let _e452 = u_xlat0_;
    let _e454 = u_xlat4_;
    let _e456 = (_e452.xxx * _e454.xyz);
    u_xlat0_.x = _e456.x;
    u_xlat0_.y = _e456.y;
    u_xlat0_.z = _e456.z;
    let _e463 = u_xlat2_;
    let _e465 = u_xlat0_;
    let _e467 = vs_COLOR1_1;
    let _e470 = u_xlat2_;
    let _e472 = ((_e465.xyz * _e467.www) + _e470.xyz);
    u_xlat2_.x = _e472.x;
    u_xlat2_.y = _e472.y;
    u_xlat2_.z = _e472.z;
    let _e479 = u_xlat2_;
    let _e480 = vs_COLOR0_1;
    SV_Target0_ = (_e479 * _e480);
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
