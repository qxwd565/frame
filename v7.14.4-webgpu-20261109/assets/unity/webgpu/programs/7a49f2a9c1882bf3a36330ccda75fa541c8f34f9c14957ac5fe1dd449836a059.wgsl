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
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e48 = u_xlat0_;
    let _e53 = _f_buffer1_.f_cb1_[8];
    let _e58 = _f_buffer1_.f_cb1_[9];
    let _e61 = (_e53.yzw + -(_e58.xyz));
    u_xlat0_.x = _e61.x;
    u_xlat0_.y = _e61.y;
    u_xlat0_.z = _e61.z;
    let _e71 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e71.w) + 1f);
    let _e76 = vs_TEXCOORD0_1;
    u_xlat1_ = _e76.zwxy;
    let _e78 = u_xlat1_;
    u_xlat1_ = clamp(_e78, vec4(0f), vec4(1f));
    let _e84 = u_xlat1_;
    let _e85 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e84 + -(_e85.zwxy));
    let _e89 = u_xlat9_;
    let _e94 = _f_buffer1_.f_cb1_[3];
    let _e96 = u_xlat1_;
    let _e99 = vs_TEXCOORD0_1;
    let _e101 = ((_e94.zz * _e96.zw) + _e99.xy);
    u_xlat9_.x = _e101.x;
    u_xlat9_.y = _e101.y;
    let _e106 = u_xlat1_;
    let _e111 = _f_buffer1_.f_cb1_[6];
    let _e113 = u_xlat1_;
    let _e116 = vs_TEXCOORD0_1;
    let _e118 = ((_e111.xx * _e113.xy) + _e116.zw);
    u_xlat1_.x = _e118.x;
    u_xlat1_.y = _e118.y;
    let _e123 = u_xlat1_;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[1];
    let _e136 = textureSampleBias(f_t1_, samplerf_s1_, _e123.xy, (_e128.x + _e133.x));
    u_xlat2_ = _e136;
    let _e137 = u_xlat9_;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[0];
    let _e150 = textureSampleBias(f_t0_, samplerf_s0_, _e137.xy, (_e142.x + _e147.x));
    u_xlat1_ = _e150;
    let _e151 = u_xlat2_;
    let _e153 = u_xlat1_;
    let _e158 = _f_buffer1_.f_cb1_[2];
    let _e160 = (_e153.xyz + _e158.yyy);
    u_xlat2_.x = _e160.x;
    u_xlat2_.y = _e160.y;
    u_xlat2_.z = _e160.z;
    let _e167 = u_xlat1_;
    let _e172 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e167.w, _e172.y);
    let _e176 = u_xlat2_;
    let _e178 = u_xlat3_;
    let _e183 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e176.y * _e178) + -(_e183.w));
    let _e187 = u_xlat2_;
    let _e189 = u_xlat2_;
    let _e191 = u_xlat3_;
    let _e193 = (_e189.xyz * vec3(_e191));
    u_xlat2_.x = _e193.x;
    u_xlat2_.y = _e193.y;
    u_xlat2_.z = _e193.z;
    let _e200 = u_xlat7_;
    let _e202 = u_xlat12_;
    u_xlat12_ = (_e200.x / _e202);
    let _e204 = u_xlat7_;
    u_xlat3_ = (_e204.x * 5f);
    let _e208 = u_xlat3_;
    u_xlat3_ = clamp(_e208, 0f, 1f);
    let _e212 = u_xlat0_;
    let _e214 = u_xlat12_;
    let _e216 = u_xlat0_;
    let _e222 = _f_buffer1_.f_cb1_[9];
    let _e224 = ((vec3(_e214) * _e216.xyz) + _e222.xyz);
    u_xlat0_.x = _e224.x;
    u_xlat0_.y = _e224.y;
    u_xlat0_.z = _e224.z;
    let _e236 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e236.w);
    let _e239 = u_xlat12_;
    let _e240 = u_xlat2_;
    u_xlat12_ = (_e239 * _e240.y);
    let _e243 = u_xlat7_;
    let _e248 = _f_buffer1_.f_cb1_[9];
    let _e253 = _f_buffer1_.f_cb1_[10];
    let _e256 = (_e248.xyz + -(_e253.xyz));
    u_xlat7_.x = _e256.x;
    u_xlat7_.y = _e256.y;
    u_xlat7_.z = _e256.z;
    let _e263 = u_xlat7_;
    let _e265 = u_xlat12_;
    let _e267 = u_xlat7_;
    let _e273 = _f_buffer1_.f_cb1_[10];
    let _e275 = ((vec3(_e265) * _e267.xyz) + _e273.xyz);
    u_xlat7_.x = _e275.x;
    u_xlat7_.y = _e275.y;
    u_xlat7_.z = _e275.z;
    let _e282 = u_xlat0_;
    let _e284 = u_xlat0_;
    let _e286 = u_xlat7_;
    let _e289 = (_e284.xyz + -(_e286.xyz));
    u_xlat0_.x = _e289.x;
    u_xlat0_.y = _e289.y;
    u_xlat0_.z = _e289.z;
    let _e296 = u_xlat0_;
    let _e298 = u_xlat3_;
    let _e300 = u_xlat0_;
    let _e303 = u_xlat7_;
    let _e305 = ((vec3(_e298) * _e300.xyz) + _e303.xyz);
    u_xlat0_.x = _e305.x;
    u_xlat0_.y = _e305.y;
    u_xlat0_.z = _e305.z;
    let _e312 = u_xlat0_;
    let _e314 = u_xlat0_;
    let _e316 = u_xlat2_;
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
    let _e342 = vs_TEXCOORD1_1;
    let _e346 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e342 + _e346.y);
    let _e350 = u_xlat0_;
    u_xlat0_.x = ((_e350.x * 2f) + -1f);
    let _e358 = u_xlat0_;
    let _e361 = u_xlat2_;
    u_xlat0_.x = (-(_e358.x) + _e361.w);
    let _e365 = u_xlat0_;
    u_xlat0_.x = clamp(_e365.x, 0f, 1f);
    let _e371 = u_xlat0_;
    u_xlat0_.x = log2(_e371.x);
    let _e378 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e378.z * 10f);
    let _e383 = u_xlat0_;
    let _e385 = u_xlat4_;
    u_xlat0_.x = (_e383.x * _e385.x);
    let _e389 = u_xlat0_;
    u_xlat0_.x = exp2(_e389.x);
    let _e392 = u_xlat0_;
    let _e394 = u_xlat1_;
    u_xlat2_ = (_e392.xxxx * _e394);
    let _e397 = u_xlat0_;
    u_xlat0_.x = (-(_e397.x) + 1f);
    let _e403 = u_xlat0_;
    u_xlat0_.x = log2(_e403.x);
    let _e407 = u_xlat0_;
    u_xlat0_.x = (_e407.x * 10f);
    let _e412 = u_xlat0_;
    u_xlat0_.x = exp2(_e412.x);
    let _e416 = u_xlat2_;
    u_xlat4_.x = (_e416.w * 1000000f);
    let _e421 = u_xlat4_;
    u_xlat4_.x = clamp(_e421.x, 0f, 1f);
    let _e427 = u_xlat1_;
    let _e429 = u_xlat4_;
    u_xlat4_.x = (_e427.w * _e429.x);
    let _e433 = u_xlat4_;
    let _e435 = u_xlat0_;
    u_xlat0_.x = (_e433.x * _e435.x);
    let _e438 = u_xlat4_;
    let _e443 = _f_buffer1_.f_cb1_[7];
    let _e448 = _f_buffer1_.f_cb1_[8];
    let _e450 = (_e443.xyz * _e448.xxx);
    u_xlat4_.x = _e450.x;
    u_xlat4_.y = _e450.y;
    u_xlat4_.z = _e450.z;
    let _e457 = u_xlat0_;
    let _e459 = u_xlat0_;
    let _e461 = u_xlat4_;
    let _e463 = (_e459.xxx * _e461.xyz);
    u_xlat0_.x = _e463.x;
    u_xlat0_.y = _e463.y;
    u_xlat0_.z = _e463.z;
    let _e470 = u_xlat2_;
    let _e472 = u_xlat0_;
    let _e474 = vs_COLOR1_1;
    let _e477 = u_xlat2_;
    let _e479 = ((_e472.xyz * _e474.www) + _e477.xyz);
    u_xlat2_.x = _e479.x;
    u_xlat2_.y = _e479.y;
    u_xlat2_.z = _e479.z;
    let _e486 = u_xlat2_;
    let _e487 = vs_COLOR0_1;
    SV_Target0_ = (_e486 * _e487);
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
