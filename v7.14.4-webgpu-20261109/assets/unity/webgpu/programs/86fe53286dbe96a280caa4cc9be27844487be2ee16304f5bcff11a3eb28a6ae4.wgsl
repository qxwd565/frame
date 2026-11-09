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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat6_: f32 = 0f;
    var u_xlat8_: f32 = 0f;
    var u_xlat10_: f32 = 0f;
    var u_xlat12_: f32 = 0f;

    let _e45 = u_xlat0_;
    let _e50 = _f_buffer1_.f_cb1_[8];
    let _e55 = _f_buffer1_.f_cb1_[9];
    let _e58 = (_e50.yzw + -(_e55.xyz));
    u_xlat0_.x = _e58.x;
    u_xlat0_.y = _e58.y;
    u_xlat0_.z = _e58.z;
    let _e68 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e68.w) + 1f);
    let _e73 = u_xlat1_;
    let _e75 = vs_TEXCOORD0_1;
    let _e76 = _e75.xy;
    u_xlat1_.x = _e76.x;
    u_xlat1_.y = _e76.y;
    let _e81 = u_xlat1_;
    let _e83 = u_xlat1_;
    let _e89 = clamp(_e83.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e89.x;
    u_xlat1_.y = _e89.y;
    let _e94 = u_xlat1_;
    let _e96 = u_xlat1_;
    let _e98 = vs_TEXCOORD0_1;
    let _e101 = (_e96.xy + -(_e98.xy));
    u_xlat1_.x = _e101.x;
    u_xlat1_.y = _e101.y;
    let _e106 = u_xlat1_;
    let _e111 = _f_buffer1_.f_cb1_[3];
    let _e113 = u_xlat1_;
    let _e116 = vs_TEXCOORD0_1;
    let _e118 = ((_e111.zz * _e113.xy) + _e116.xy);
    u_xlat1_.x = _e118.x;
    u_xlat1_.y = _e118.y;
    let _e123 = u_xlat1_;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[0];
    let _e136 = textureSampleBias(f_t0_, samplerf_s0_, _e123.xy, (_e128.x + _e133.x));
    u_xlat1_ = _e136;
    let _e138 = u_xlat1_;
    u_xlat1_.w = dot(_e138.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e145 = u_xlat1_;
    let _e150 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e145.w + _e150.y);
    let _e153 = u_xlat1_;
    let _e158 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = max(_e153.w, _e158.y);
    let _e161 = u_xlat2_;
    let _e162 = u_xlat6_;
    let _e167 = _f_buffer1_.f_cb1_[10];
    u_xlat10_ = ((_e161 * _e162) + -(_e167.w));
    let _e171 = u_xlat6_;
    let _e172 = u_xlat2_;
    u_xlat2_ = (_e171 * _e172);
    let _e174 = u_xlat10_;
    let _e175 = u_xlat12_;
    u_xlat12_ = (_e174 / _e175);
    let _e177 = u_xlat10_;
    u_xlat6_ = (_e177 * 5f);
    let _e180 = u_xlat6_;
    u_xlat6_ = clamp(_e180, 0f, 1f);
    let _e184 = u_xlat0_;
    let _e186 = u_xlat12_;
    let _e188 = u_xlat0_;
    let _e194 = _f_buffer1_.f_cb1_[9];
    let _e196 = ((vec3(_e186) * _e188.xyz) + _e194.xyz);
    u_xlat0_.x = _e196.x;
    u_xlat0_.y = _e196.y;
    u_xlat0_.z = _e196.z;
    let _e208 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e208.w);
    let _e211 = u_xlat12_;
    let _e212 = u_xlat2_;
    u_xlat12_ = (_e211 * _e212);
    let _e214 = u_xlat3_;
    let _e219 = _f_buffer1_.f_cb1_[9];
    let _e224 = _f_buffer1_.f_cb1_[10];
    let _e227 = (_e219.xyz + -(_e224.xyz));
    u_xlat3_.x = _e227.x;
    u_xlat3_.y = _e227.y;
    u_xlat3_.z = _e227.z;
    let _e234 = u_xlat3_;
    let _e236 = u_xlat12_;
    let _e238 = u_xlat3_;
    let _e244 = _f_buffer1_.f_cb1_[10];
    let _e246 = ((vec3(_e236) * _e238.xyz) + _e244.xyz);
    u_xlat3_.x = _e246.x;
    u_xlat3_.y = _e246.y;
    u_xlat3_.z = _e246.z;
    let _e253 = u_xlat0_;
    let _e255 = u_xlat0_;
    let _e257 = u_xlat3_;
    let _e260 = (_e255.xyz + -(_e257.xyz));
    u_xlat0_.x = _e260.x;
    u_xlat0_.y = _e260.y;
    u_xlat0_.z = _e260.z;
    let _e267 = u_xlat0_;
    let _e269 = u_xlat6_;
    let _e271 = u_xlat0_;
    let _e274 = u_xlat3_;
    let _e276 = ((vec3(_e269) * _e271.xyz) + _e274.xyz);
    u_xlat0_.x = _e276.x;
    u_xlat0_.y = _e276.y;
    u_xlat0_.z = _e276.z;
    let _e283 = u_xlat0_;
    let _e285 = u_xlat0_;
    let _e287 = u_xlat2_;
    let _e289 = (_e285.xyz * vec3(_e287));
    u_xlat0_.x = _e289.x;
    u_xlat0_.y = _e289.y;
    u_xlat0_.z = _e289.z;
    let _e296 = u_xlat1_;
    let _e298 = u_xlat0_;
    let _e303 = _f_buffer1_.f_cb1_[2];
    let _e305 = (_e298.xyz * _e303.xxx);
    u_xlat1_.x = _e305.x;
    u_xlat1_.y = _e305.y;
    u_xlat1_.z = _e305.z;
    let _e313 = vs_TEXCOORD1_1;
    let _e317 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e313 + -(_e317.z));
    let _e322 = u_xlat0_;
    u_xlat0_.x = clamp(_e322.x, 0f, 1f);
    let _e328 = u_xlat0_;
    u_xlat0_.x = (_e328.x + -0.00001f);
    let _e333 = u_xlat0_;
    let _e336 = u_xlat1_;
    u_xlat4_ = (-(_e333.x) + _e336.w);
    let _e339 = vs_TEXCOORD1_1;
    let _e343 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e339 + _e343.z);
    let _e346 = u_xlat8_;
    u_xlat8_ = clamp(_e346, 0f, 1f);
    let _e351 = u_xlat0_;
    let _e354 = u_xlat8_;
    u_xlat0_.x = (-(_e351.x) + _e354);
    let _e359 = u_xlat0_;
    u_xlat0_.x = (1f / _e359.x);
    let _e363 = u_xlat0_;
    let _e365 = u_xlat4_;
    u_xlat0_.x = (_e363.x * _e365);
    let _e368 = u_xlat0_;
    u_xlat0_.x = clamp(_e368.x, 0f, 1f);
    let _e373 = u_xlat0_;
    u_xlat4_ = ((_e373.x * -2f) + 3f);
    let _e381 = u_xlat0_;
    let _e383 = u_xlat0_;
    u_xlat0_.x = (_e381.x * _e383.x);
    let _e387 = u_xlat0_;
    let _e389 = u_xlat4_;
    u_xlat0_.x = (_e387.x * _e389);
    let _e391 = u_xlat0_;
    let _e393 = u_xlat1_;
    u_xlat0_ = (_e391.xxxx * _e393);
    let _e395 = u_xlat0_;
    let _e396 = vs_COLOR0_1;
    SV_Target0_ = (_e395 * _e396);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
