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
    let _e137 = u_xlat1_;
    let _e142 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e137.w + _e142.y);
    let _e145 = u_xlat1_;
    let _e150 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = max(_e145.w, _e150.y);
    let _e153 = u_xlat2_;
    let _e154 = u_xlat6_;
    let _e159 = _f_buffer1_.f_cb1_[10];
    u_xlat10_ = ((_e153 * _e154) + -(_e159.w));
    let _e163 = u_xlat6_;
    let _e164 = u_xlat2_;
    u_xlat2_ = (_e163 * _e164);
    let _e166 = u_xlat10_;
    let _e167 = u_xlat12_;
    u_xlat12_ = (_e166 / _e167);
    let _e169 = u_xlat10_;
    u_xlat6_ = (_e169 * 5f);
    let _e172 = u_xlat6_;
    u_xlat6_ = clamp(_e172, 0f, 1f);
    let _e176 = u_xlat0_;
    let _e178 = u_xlat12_;
    let _e180 = u_xlat0_;
    let _e186 = _f_buffer1_.f_cb1_[9];
    let _e188 = ((vec3(_e178) * _e180.xyz) + _e186.xyz);
    u_xlat0_.x = _e188.x;
    u_xlat0_.y = _e188.y;
    u_xlat0_.z = _e188.z;
    let _e200 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e200.w);
    let _e203 = u_xlat12_;
    let _e204 = u_xlat2_;
    u_xlat12_ = (_e203 * _e204);
    let _e206 = u_xlat3_;
    let _e211 = _f_buffer1_.f_cb1_[9];
    let _e216 = _f_buffer1_.f_cb1_[10];
    let _e219 = (_e211.xyz + -(_e216.xyz));
    u_xlat3_.x = _e219.x;
    u_xlat3_.y = _e219.y;
    u_xlat3_.z = _e219.z;
    let _e226 = u_xlat3_;
    let _e228 = u_xlat12_;
    let _e230 = u_xlat3_;
    let _e236 = _f_buffer1_.f_cb1_[10];
    let _e238 = ((vec3(_e228) * _e230.xyz) + _e236.xyz);
    u_xlat3_.x = _e238.x;
    u_xlat3_.y = _e238.y;
    u_xlat3_.z = _e238.z;
    let _e245 = u_xlat0_;
    let _e247 = u_xlat0_;
    let _e249 = u_xlat3_;
    let _e252 = (_e247.xyz + -(_e249.xyz));
    u_xlat0_.x = _e252.x;
    u_xlat0_.y = _e252.y;
    u_xlat0_.z = _e252.z;
    let _e259 = u_xlat0_;
    let _e261 = u_xlat6_;
    let _e263 = u_xlat0_;
    let _e266 = u_xlat3_;
    let _e268 = ((vec3(_e261) * _e263.xyz) + _e266.xyz);
    u_xlat0_.x = _e268.x;
    u_xlat0_.y = _e268.y;
    u_xlat0_.z = _e268.z;
    let _e275 = u_xlat0_;
    let _e277 = u_xlat0_;
    let _e279 = u_xlat2_;
    let _e281 = (_e277.xyz * vec3(_e279));
    u_xlat0_.x = _e281.x;
    u_xlat0_.y = _e281.y;
    u_xlat0_.z = _e281.z;
    let _e288 = u_xlat1_;
    let _e290 = u_xlat0_;
    let _e295 = _f_buffer1_.f_cb1_[2];
    let _e297 = (_e290.xyz * _e295.xxx);
    u_xlat1_.x = _e297.x;
    u_xlat1_.y = _e297.y;
    u_xlat1_.z = _e297.z;
    let _e305 = vs_TEXCOORD1_1;
    let _e309 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e305 + -(_e309.z));
    let _e314 = u_xlat0_;
    u_xlat0_.x = clamp(_e314.x, 0f, 1f);
    let _e320 = u_xlat0_;
    u_xlat0_.x = (_e320.x + -0.00001f);
    let _e325 = u_xlat0_;
    let _e328 = u_xlat1_;
    u_xlat4_ = (-(_e325.x) + _e328.w);
    let _e331 = vs_TEXCOORD1_1;
    let _e335 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e331 + _e335.z);
    let _e338 = u_xlat8_;
    u_xlat8_ = clamp(_e338, 0f, 1f);
    let _e343 = u_xlat0_;
    let _e346 = u_xlat8_;
    u_xlat0_.x = (-(_e343.x) + _e346);
    let _e351 = u_xlat0_;
    u_xlat0_.x = (1f / _e351.x);
    let _e355 = u_xlat0_;
    let _e357 = u_xlat4_;
    u_xlat0_.x = (_e355.x * _e357);
    let _e360 = u_xlat0_;
    u_xlat0_.x = clamp(_e360.x, 0f, 1f);
    let _e365 = u_xlat0_;
    u_xlat4_ = ((_e365.x * -2f) + 3f);
    let _e373 = u_xlat0_;
    let _e375 = u_xlat0_;
    u_xlat0_.x = (_e373.x * _e375.x);
    let _e379 = u_xlat0_;
    let _e381 = u_xlat4_;
    u_xlat0_.x = (_e379.x * _e381);
    let _e383 = u_xlat0_;
    let _e385 = u_xlat1_;
    u_xlat0_ = (_e383.xxxx * _e385);
    let _e387 = u_xlat0_;
    let _e388 = vs_COLOR0_1;
    SV_Target0_ = (_e387 * _e388);
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
