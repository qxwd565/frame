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
    var u_xlat17_: f32 = 0f;
    var u_xlat18_: f32 = 0f;

    let _e50 = u_xlat0_;
    let _e55 = _f_buffer1_.f_cb1_[8];
    let _e60 = _f_buffer1_.f_cb1_[9];
    let _e63 = (_e55.yzw + -(_e60.xyz));
    u_xlat0_.x = _e63.x;
    u_xlat0_.y = _e63.y;
    u_xlat0_.z = _e63.z;
    let _e73 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e73.w) + 1f);
    let _e78 = vs_TEXCOORD0_1;
    u_xlat1_ = _e78.zwxy;
    let _e80 = u_xlat1_;
    u_xlat1_ = clamp(_e80, vec4(0f), vec4(1f));
    let _e86 = u_xlat1_;
    let _e87 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e86 + -(_e87.zwxy));
    let _e91 = u_xlat11_;
    let _e96 = _f_buffer1_.f_cb1_[3];
    let _e98 = u_xlat1_;
    let _e101 = vs_TEXCOORD0_1;
    let _e103 = ((_e96.zz * _e98.zw) + _e101.xy);
    u_xlat11_.x = _e103.x;
    u_xlat11_.y = _e103.y;
    let _e108 = u_xlat1_;
    let _e113 = _f_buffer1_.f_cb1_[6];
    let _e115 = u_xlat1_;
    let _e118 = vs_TEXCOORD0_1;
    let _e120 = ((_e113.xx * _e115.xy) + _e118.zw);
    u_xlat1_.x = _e120.x;
    u_xlat1_.y = _e120.y;
    let _e125 = u_xlat1_;
    let _e130 = _f_buffer0_.f_cb0_[4];
    let _e135 = hscard_bias.values[1];
    let _e138 = textureSampleBias(f_t1_, samplerf_s1_, _e125.xy, (_e130.x + _e135.x));
    u_xlat2_ = _e138;
    let _e139 = u_xlat11_;
    let _e144 = _f_buffer0_.f_cb0_[4];
    let _e149 = hscard_bias.values[0];
    let _e152 = textureSampleBias(f_t0_, samplerf_s0_, _e139.xy, (_e144.x + _e149.x));
    u_xlat1_ = _e152.yzwx;
    let _e154 = u_xlat3_;
    let _e156 = u_xlat1_;
    let _e161 = _f_buffer1_.f_cb1_[2];
    let _e163 = (_e156.wxy + _e161.yyy);
    u_xlat3_.x = _e163.x;
    u_xlat3_.y = _e163.y;
    u_xlat3_.z = _e163.z;
    let _e170 = u_xlat1_;
    let _e175 = _f_buffer1_.f_cb1_[3];
    u_xlat17_ = max(_e170.w, _e175.y);
    let _e178 = u_xlat3_;
    let _e180 = u_xlat17_;
    let _e185 = _f_buffer1_.f_cb1_[10];
    u_xlat18_ = ((_e178.y * _e180) + -(_e185.w));
    let _e189 = u_xlat3_;
    let _e191 = u_xlat17_;
    let _e193 = u_xlat3_;
    let _e195 = (vec3(_e191) * _e193.xyz);
    u_xlat3_.x = _e195.x;
    u_xlat3_.y = _e195.y;
    u_xlat3_.z = _e195.z;
    let _e202 = u_xlat18_;
    let _e203 = u_xlat15_;
    u_xlat15_ = (_e202 / _e203);
    let _e205 = u_xlat18_;
    u_xlat17_ = (_e205 * 5f);
    let _e208 = u_xlat17_;
    u_xlat17_ = clamp(_e208, 0f, 1f);
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
    let _e298 = u_xlat17_;
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
    let _e343 = vs_COLOR1_1;
    let _e345 = u_xlat1_;
    u_xlat0_ = ((_e341.xyzx * _e343) + _e345);
    let _e347 = u_xlat0_;
    let _e348 = vs_COLOR0_1;
    SV_Target0_ = (_e347 * _e348);
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
