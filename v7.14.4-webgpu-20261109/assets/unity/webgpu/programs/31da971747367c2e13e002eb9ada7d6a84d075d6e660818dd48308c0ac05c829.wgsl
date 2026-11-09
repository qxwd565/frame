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
    let _e144 = vs_COLOR1_1;
    u_xlat2_ = (_e143 * _e144);
    let _e146 = u_xlat11_;
    let _e151 = _f_buffer0_.f_cb0_[4];
    let _e156 = hscard_bias.values[0];
    let _e159 = textureSampleBias(f_t0_, samplerf_s0_, _e146.xy, (_e151.x + _e156.x));
    u_xlat1_ = _e159;
    let _e160 = u_xlat3_;
    let _e162 = u_xlat1_;
    let _e167 = _f_buffer1_.f_cb1_[2];
    let _e169 = (_e162.xyz + _e167.yyy);
    u_xlat3_.x = _e169.x;
    u_xlat3_.y = _e169.y;
    u_xlat3_.z = _e169.z;
    let _e176 = u_xlat1_;
    let _e181 = _f_buffer1_.f_cb1_[3];
    u_xlat18_ = max(_e176.w, _e181.y);
    let _e185 = u_xlat3_;
    let _e187 = u_xlat18_;
    let _e192 = _f_buffer1_.f_cb1_[10];
    u_xlat4_.x = ((_e185.y * _e187) + -(_e192.w));
    let _e196 = u_xlat3_;
    let _e198 = u_xlat18_;
    let _e200 = u_xlat3_;
    let _e202 = (vec3(_e198) * _e200.xyz);
    u_xlat3_.x = _e202.x;
    u_xlat3_.y = _e202.y;
    u_xlat3_.z = _e202.z;
    let _e209 = u_xlat4_;
    let _e211 = u_xlat15_;
    u_xlat15_ = (_e209.x / _e211);
    let _e213 = u_xlat4_;
    u_xlat18_ = (_e213.x * 5f);
    let _e217 = u_xlat18_;
    u_xlat18_ = clamp(_e217, 0f, 1f);
    let _e221 = u_xlat0_;
    let _e223 = u_xlat15_;
    let _e225 = u_xlat0_;
    let _e231 = _f_buffer1_.f_cb1_[9];
    let _e233 = ((vec3(_e223) * _e225.xyz) + _e231.xyz);
    u_xlat0_.x = _e233.x;
    u_xlat0_.y = _e233.y;
    u_xlat0_.z = _e233.z;
    let _e245 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e245.w);
    let _e248 = u_xlat15_;
    let _e249 = u_xlat3_;
    u_xlat15_ = (_e248 * _e249.y);
    let _e252 = u_xlat4_;
    let _e257 = _f_buffer1_.f_cb1_[9];
    let _e262 = _f_buffer1_.f_cb1_[10];
    let _e265 = (_e257.xyz + -(_e262.xyz));
    u_xlat4_.x = _e265.x;
    u_xlat4_.y = _e265.y;
    u_xlat4_.z = _e265.z;
    let _e272 = u_xlat4_;
    let _e274 = u_xlat15_;
    let _e276 = u_xlat4_;
    let _e282 = _f_buffer1_.f_cb1_[10];
    let _e284 = ((vec3(_e274) * _e276.xyz) + _e282.xyz);
    u_xlat4_.x = _e284.x;
    u_xlat4_.y = _e284.y;
    u_xlat4_.z = _e284.z;
    let _e291 = u_xlat0_;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat4_;
    let _e298 = (_e293.xyz + -(_e295.xyz));
    u_xlat0_.x = _e298.x;
    u_xlat0_.y = _e298.y;
    u_xlat0_.z = _e298.z;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat18_;
    let _e309 = u_xlat0_;
    let _e312 = u_xlat4_;
    let _e314 = ((vec3(_e307) * _e309.xyz) + _e312.xyz);
    u_xlat0_.x = _e314.x;
    u_xlat0_.y = _e314.y;
    u_xlat0_.z = _e314.z;
    let _e321 = u_xlat0_;
    let _e323 = u_xlat0_;
    let _e325 = u_xlat3_;
    let _e327 = (_e323.xyz * _e325.xyz);
    u_xlat0_.x = _e327.x;
    u_xlat0_.y = _e327.y;
    u_xlat0_.z = _e327.z;
    let _e334 = u_xlat1_;
    let _e336 = u_xlat0_;
    let _e341 = _f_buffer1_.f_cb1_[2];
    let _e343 = (_e336.xyz * _e341.xxx);
    u_xlat1_.x = _e343.x;
    u_xlat1_.y = _e343.y;
    u_xlat1_.z = _e343.z;
    let _e351 = vs_TEXCOORD1_1;
    let _e355 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e351 + -(_e355.z));
    let _e360 = u_xlat0_;
    u_xlat0_.x = clamp(_e360.x, 0f, 1f);
    let _e366 = u_xlat0_;
    u_xlat0_.x = (_e366.x + -0.00001f);
    let _e371 = u_xlat0_;
    let _e374 = u_xlat1_;
    u_xlat5_ = (-(_e371.x) + _e374.w);
    let _e377 = vs_TEXCOORD1_1;
    let _e381 = _f_buffer1_.f_cb1_[12];
    u_xlat10_ = (_e377 + _e381.z);
    let _e384 = u_xlat10_;
    u_xlat10_ = clamp(_e384, 0f, 1f);
    let _e389 = u_xlat0_;
    let _e392 = u_xlat10_;
    u_xlat0_.x = (-(_e389.x) + _e392);
    let _e397 = u_xlat0_;
    u_xlat0_.x = (1f / _e397.x);
    let _e401 = u_xlat0_;
    let _e403 = u_xlat5_;
    u_xlat0_.x = (_e401.x * _e403);
    let _e406 = u_xlat0_;
    u_xlat0_.x = clamp(_e406.x, 0f, 1f);
    let _e411 = u_xlat0_;
    u_xlat5_ = ((_e411.x * -2f) + 3f);
    let _e419 = u_xlat0_;
    let _e421 = u_xlat0_;
    u_xlat0_.x = (_e419.x * _e421.x);
    let _e425 = u_xlat0_;
    let _e427 = u_xlat5_;
    u_xlat0_.x = (_e425.x * _e427);
    let _e429 = u_xlat1_;
    let _e430 = u_xlat0_;
    let _e433 = u_xlat2_;
    u_xlat0_ = ((_e429 * _e430.xxxx) + _e433);
    let _e435 = u_xlat0_;
    let _e436 = vs_COLOR0_1;
    SV_Target0_ = (_e435 * _e436);
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
