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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: f32 = 0f;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e53 = u_xlat0_;
    let _e58 = _f_buffer1_.f_cb1_[8];
    let _e63 = _f_buffer1_.f_cb1_[9];
    let _e66 = (_e58.yzw + -(_e63.xyz));
    u_xlat0_.x = _e66.x;
    u_xlat0_.y = _e66.y;
    u_xlat0_.z = _e66.z;
    let _e76 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e76.w) + 1f);
    let _e81 = vs_TEXCOORD0_1;
    u_xlat1_ = _e81.zwxy;
    let _e83 = u_xlat1_;
    u_xlat1_ = clamp(_e83, vec4(0f), vec4(1f));
    let _e89 = u_xlat1_;
    let _e90 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e89 + -(_e90.zwxy));
    let _e94 = u_xlat9_;
    let _e99 = _f_buffer1_.f_cb1_[3];
    let _e101 = u_xlat1_;
    let _e104 = vs_TEXCOORD0_1;
    let _e106 = ((_e99.zz * _e101.zw) + _e104.xy);
    u_xlat9_.x = _e106.x;
    u_xlat9_.y = _e106.y;
    let _e111 = u_xlat1_;
    let _e116 = _f_buffer1_.f_cb1_[6];
    let _e118 = u_xlat1_;
    let _e121 = vs_TEXCOORD0_1;
    let _e123 = ((_e116.xx * _e118.xy) + _e121.zw);
    u_xlat1_.x = _e123.x;
    u_xlat1_.y = _e123.y;
    let _e128 = u_xlat1_;
    let _e133 = _f_buffer0_.f_cb0_[4];
    let _e138 = hscard_bias.values[1];
    let _e141 = textureSampleBias(f_t1_, samplerf_s1_, _e128.xy, (_e133.x + _e138.x));
    u_xlat2_ = _e141;
    let _e143 = u_xlat2_;
    u_xlat1_.x = (_e143.w + -1f);
    let _e152 = _f_buffer1_.f_cb1_[7];
    let _e154 = u_xlat1_;
    u_xlat1_.x = ((_e152.w * _e154.x) + 1f);
    let _e159 = u_xlat9_;
    let _e164 = _f_buffer0_.f_cb0_[4];
    let _e169 = hscard_bias.values[0];
    let _e172 = textureSampleBias(f_t0_, samplerf_s0_, _e159.xy, (_e164.x + _e169.x));
    u_xlat2_ = _e172;
    let _e173 = u_xlat5_;
    let _e175 = u_xlat2_;
    let _e180 = _f_buffer1_.f_cb1_[2];
    let _e182 = (_e175.xyz + _e180.yyy);
    u_xlat5_.x = _e182.x;
    u_xlat5_.y = _e182.y;
    u_xlat5_.z = _e182.z;
    let _e189 = u_xlat2_;
    let _e194 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e189.w, _e194.y);
    let _e198 = u_xlat5_;
    let _e200 = u_xlat3_;
    let _e205 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e198.y * _e200) + -(_e205.w));
    let _e209 = u_xlat5_;
    let _e211 = u_xlat5_;
    let _e213 = u_xlat3_;
    let _e215 = (_e211.xyz * vec3(_e213));
    u_xlat5_.x = _e215.x;
    u_xlat5_.y = _e215.y;
    u_xlat5_.z = _e215.z;
    let _e222 = u_xlat7_;
    let _e224 = u_xlat12_;
    u_xlat12_ = (_e222.x / _e224);
    let _e226 = u_xlat7_;
    u_xlat3_ = (_e226.x * 5f);
    let _e230 = u_xlat3_;
    u_xlat3_ = clamp(_e230, 0f, 1f);
    let _e234 = u_xlat0_;
    let _e236 = u_xlat12_;
    let _e238 = u_xlat0_;
    let _e244 = _f_buffer1_.f_cb1_[9];
    let _e246 = ((vec3(_e236) * _e238.xyz) + _e244.xyz);
    u_xlat0_.x = _e246.x;
    u_xlat0_.y = _e246.y;
    u_xlat0_.z = _e246.z;
    let _e258 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e258.w);
    let _e261 = u_xlat12_;
    let _e262 = u_xlat5_;
    u_xlat12_ = (_e261 * _e262.y);
    let _e265 = u_xlat7_;
    let _e270 = _f_buffer1_.f_cb1_[9];
    let _e275 = _f_buffer1_.f_cb1_[10];
    let _e278 = (_e270.xyz + -(_e275.xyz));
    u_xlat7_.x = _e278.x;
    u_xlat7_.y = _e278.y;
    u_xlat7_.z = _e278.z;
    let _e285 = u_xlat7_;
    let _e287 = u_xlat12_;
    let _e289 = u_xlat7_;
    let _e295 = _f_buffer1_.f_cb1_[10];
    let _e297 = ((vec3(_e287) * _e289.xyz) + _e295.xyz);
    u_xlat7_.x = _e297.x;
    u_xlat7_.y = _e297.y;
    u_xlat7_.z = _e297.z;
    let _e304 = u_xlat0_;
    let _e306 = u_xlat0_;
    let _e308 = u_xlat7_;
    let _e311 = (_e306.xyz + -(_e308.xyz));
    u_xlat0_.x = _e311.x;
    u_xlat0_.y = _e311.y;
    u_xlat0_.z = _e311.z;
    let _e318 = u_xlat0_;
    let _e320 = u_xlat3_;
    let _e322 = u_xlat0_;
    let _e325 = u_xlat7_;
    let _e327 = ((vec3(_e320) * _e322.xyz) + _e325.xyz);
    u_xlat0_.x = _e327.x;
    u_xlat0_.y = _e327.y;
    u_xlat0_.z = _e327.z;
    let _e334 = u_xlat0_;
    let _e336 = u_xlat0_;
    let _e338 = u_xlat5_;
    let _e340 = (_e336.xyz * _e338.xyz);
    u_xlat0_.x = _e340.x;
    u_xlat0_.y = _e340.y;
    u_xlat0_.z = _e340.z;
    let _e347 = u_xlat2_;
    let _e349 = u_xlat0_;
    let _e354 = _f_buffer1_.f_cb1_[2];
    let _e356 = (_e349.xyz * _e354.xxx);
    u_xlat2_.x = _e356.x;
    u_xlat2_.y = _e356.y;
    u_xlat2_.z = _e356.z;
    let _e364 = vs_TEXCOORD1_1;
    let _e368 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e364 + -(_e368.z));
    let _e373 = u_xlat0_;
    u_xlat0_.x = clamp(_e373.x, 0f, 1f);
    let _e379 = u_xlat0_;
    u_xlat0_.x = (_e379.x + -0.00001f);
    let _e384 = u_xlat0_;
    let _e387 = u_xlat2_;
    u_xlat4_ = (-(_e384.x) + _e387.w);
    let _e390 = vs_TEXCOORD1_1;
    let _e394 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e390 + _e394.z);
    let _e397 = u_xlat8_;
    u_xlat8_ = clamp(_e397, 0f, 1f);
    let _e402 = u_xlat0_;
    let _e405 = u_xlat8_;
    u_xlat0_.x = (-(_e402.x) + _e405);
    let _e410 = u_xlat0_;
    u_xlat0_.x = (1f / _e410.x);
    let _e414 = u_xlat0_;
    let _e416 = u_xlat4_;
    u_xlat0_.x = (_e414.x * _e416);
    let _e419 = u_xlat0_;
    u_xlat0_.x = clamp(_e419.x, 0f, 1f);
    let _e424 = u_xlat0_;
    u_xlat4_ = ((_e424.x * -2f) + 3f);
    let _e432 = u_xlat0_;
    let _e434 = u_xlat0_;
    u_xlat0_.x = (_e432.x * _e434.x);
    let _e438 = u_xlat0_;
    let _e440 = u_xlat4_;
    u_xlat0_.x = (_e438.x * _e440);
    let _e443 = u_xlat1_;
    let _e445 = u_xlat0_;
    u_xlat0_.x = (_e443.x * _e445.x);
    let _e448 = u_xlat0_;
    let _e450 = u_xlat2_;
    u_xlat0_ = (_e448.xxxx * _e450);
    let _e452 = u_xlat0_;
    let _e453 = vs_COLOR0_1;
    SV_Target0_ = (_e452 * _e453);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
