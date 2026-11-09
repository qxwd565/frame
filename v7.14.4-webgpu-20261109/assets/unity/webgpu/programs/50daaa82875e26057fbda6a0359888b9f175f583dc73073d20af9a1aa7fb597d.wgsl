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
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlat18_: f32 = 0f;

    let _e47 = u_xlat0_;
    let _e52 = _f_buffer1_.f_cb1_[8];
    let _e57 = _f_buffer1_.f_cb1_[9];
    let _e60 = (_e52.yzw + -(_e57.xyz));
    u_xlat0_.x = _e60.x;
    u_xlat0_.y = _e60.y;
    u_xlat0_.z = _e60.z;
    let _e70 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e70.w) + 1f);
    let _e75 = vs_TEXCOORD0_1;
    u_xlat1_ = _e75.zwxy;
    let _e77 = u_xlat1_;
    u_xlat1_ = clamp(_e77, vec4(0f), vec4(1f));
    let _e83 = u_xlat1_;
    let _e84 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e83 + -(_e84.zwxy));
    let _e88 = u_xlat11_;
    let _e93 = _f_buffer1_.f_cb1_[3];
    let _e95 = u_xlat1_;
    let _e98 = vs_TEXCOORD0_1;
    let _e100 = ((_e93.zz * _e95.zw) + _e98.xy);
    u_xlat11_.x = _e100.x;
    u_xlat11_.y = _e100.y;
    let _e105 = u_xlat1_;
    let _e110 = _f_buffer1_.f_cb1_[6];
    let _e112 = u_xlat1_;
    let _e115 = vs_TEXCOORD0_1;
    let _e117 = ((_e110.xx * _e112.xy) + _e115.zw);
    u_xlat1_.x = _e117.x;
    u_xlat1_.y = _e117.y;
    let _e122 = u_xlat1_;
    let _e127 = _f_buffer0_.f_cb0_[4];
    let _e132 = hscard_bias.values[1];
    let _e135 = textureSampleBias(f_t1_, samplerf_s1_, _e122.xy, (_e127.x + _e132.x));
    u_xlat2_ = _e135;
    let _e136 = u_xlat11_;
    let _e141 = _f_buffer0_.f_cb0_[4];
    let _e146 = hscard_bias.values[0];
    let _e149 = textureSampleBias(f_t0_, samplerf_s0_, _e136.xy, (_e141.x + _e146.x));
    u_xlat1_ = _e149.yzwx;
    let _e151 = u_xlat3_;
    let _e153 = u_xlat1_;
    let _e158 = _f_buffer1_.f_cb1_[2];
    let _e160 = (_e153.wxy + _e158.yyy);
    u_xlat3_.x = _e160.x;
    u_xlat3_.y = _e160.y;
    u_xlat3_.z = _e160.z;
    let _e167 = u_xlat1_;
    let _e172 = _f_buffer1_.f_cb1_[3];
    u_xlat18_ = max(_e167.w, _e172.y);
    let _e176 = u_xlat3_;
    let _e178 = u_xlat18_;
    let _e183 = _f_buffer1_.f_cb1_[10];
    u_xlat4_.x = ((_e176.y * _e178) + -(_e183.w));
    let _e187 = u_xlat3_;
    let _e189 = u_xlat18_;
    let _e191 = u_xlat3_;
    let _e193 = (vec3(_e189) * _e191.xyz);
    u_xlat3_.x = _e193.x;
    u_xlat3_.y = _e193.y;
    u_xlat3_.z = _e193.z;
    let _e200 = u_xlat4_;
    let _e202 = u_xlat15_;
    u_xlat15_ = (_e200.x / _e202);
    let _e204 = u_xlat4_;
    u_xlat18_ = (_e204.x * 5f);
    let _e208 = u_xlat18_;
    u_xlat18_ = clamp(_e208, 0f, 1f);
    let _e212 = u_xlat0_;
    let _e214 = u_xlat15_;
    let _e216 = u_xlat0_;
    let _e222 = _f_buffer1_.f_cb1_[9];
    let _e224 = ((vec3(_e214) * _e216.xyz) + _e222.xyz);
    u_xlat0_.x = _e224.x;
    u_xlat0_.y = _e224.y;
    u_xlat0_.z = _e224.z;
    let _e236 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e236.w);
    let _e239 = u_xlat15_;
    let _e240 = u_xlat3_;
    u_xlat15_ = (_e239 * _e240.y);
    let _e243 = u_xlat4_;
    let _e248 = _f_buffer1_.f_cb1_[9];
    let _e253 = _f_buffer1_.f_cb1_[10];
    let _e256 = (_e248.xyz + -(_e253.xyz));
    u_xlat4_.x = _e256.x;
    u_xlat4_.y = _e256.y;
    u_xlat4_.z = _e256.z;
    let _e263 = u_xlat4_;
    let _e265 = u_xlat15_;
    let _e267 = u_xlat4_;
    let _e273 = _f_buffer1_.f_cb1_[10];
    let _e275 = ((vec3(_e265) * _e267.xyz) + _e273.xyz);
    u_xlat4_.x = _e275.x;
    u_xlat4_.y = _e275.y;
    u_xlat4_.z = _e275.z;
    let _e282 = u_xlat0_;
    let _e284 = u_xlat0_;
    let _e286 = u_xlat4_;
    let _e289 = (_e284.xyz + -(_e286.xyz));
    u_xlat0_.x = _e289.x;
    u_xlat0_.y = _e289.y;
    u_xlat0_.z = _e289.z;
    let _e296 = u_xlat0_;
    let _e298 = u_xlat18_;
    let _e300 = u_xlat0_;
    let _e303 = u_xlat4_;
    let _e305 = ((vec3(_e298) * _e300.xyz) + _e303.xyz);
    u_xlat0_.x = _e305.x;
    u_xlat0_.y = _e305.y;
    u_xlat0_.z = _e305.z;
    let _e312 = u_xlat0_;
    let _e314 = u_xlat0_;
    let _e316 = u_xlat3_;
    let _e318 = (_e314.xyz * _e316.xyz);
    u_xlat0_.x = _e318.x;
    u_xlat0_.y = _e318.y;
    u_xlat0_.z = _e318.z;
    let _e325 = u_xlat1_;
    let _e327 = u_xlat0_;
    let _e332 = _f_buffer1_.f_cb1_[2];
    let _e334 = (_e327.xyz * _e332.xxx);
    u_xlat1_.x = _e334.x;
    u_xlat1_.y = _e334.y;
    u_xlat1_.z = _e334.z;
    let _e341 = u_xlat2_;
    let _e342 = vs_COLOR1_1;
    let _e344 = u_xlat1_;
    u_xlat0_ = ((_e341 * _e342) + _e344);
    let _e346 = u_xlat0_;
    let _e347 = vs_COLOR0_1;
    SV_Target0_ = (_e346 * _e347);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
