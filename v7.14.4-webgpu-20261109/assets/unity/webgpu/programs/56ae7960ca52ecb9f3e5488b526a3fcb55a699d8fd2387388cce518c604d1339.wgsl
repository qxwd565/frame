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
    u_xlat1_.x = dot(_e143.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e151 = u_xlat1_;
    u_xlat1_.x = (_e151.x + -1f);
    let _e160 = _f_buffer1_.f_cb1_[7];
    let _e162 = u_xlat1_;
    u_xlat1_.x = ((_e160.w * _e162.x) + 1f);
    let _e167 = u_xlat9_;
    let _e172 = _f_buffer0_.f_cb0_[4];
    let _e177 = hscard_bias.values[0];
    let _e180 = textureSampleBias(f_t0_, samplerf_s0_, _e167.xy, (_e172.x + _e177.x));
    u_xlat2_ = _e180;
    let _e181 = u_xlat5_;
    let _e183 = u_xlat2_;
    let _e188 = _f_buffer1_.f_cb1_[2];
    let _e190 = (_e183.xyz + _e188.yyy);
    u_xlat5_.x = _e190.x;
    u_xlat5_.y = _e190.y;
    u_xlat5_.z = _e190.z;
    let _e197 = u_xlat2_;
    let _e202 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e197.w, _e202.y);
    let _e206 = u_xlat5_;
    let _e208 = u_xlat3_;
    let _e213 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e206.y * _e208) + -(_e213.w));
    let _e217 = u_xlat5_;
    let _e219 = u_xlat5_;
    let _e221 = u_xlat3_;
    let _e223 = (_e219.xyz * vec3(_e221));
    u_xlat5_.x = _e223.x;
    u_xlat5_.y = _e223.y;
    u_xlat5_.z = _e223.z;
    let _e230 = u_xlat7_;
    let _e232 = u_xlat12_;
    u_xlat12_ = (_e230.x / _e232);
    let _e234 = u_xlat7_;
    u_xlat3_ = (_e234.x * 5f);
    let _e238 = u_xlat3_;
    u_xlat3_ = clamp(_e238, 0f, 1f);
    let _e242 = u_xlat0_;
    let _e244 = u_xlat12_;
    let _e246 = u_xlat0_;
    let _e252 = _f_buffer1_.f_cb1_[9];
    let _e254 = ((vec3(_e244) * _e246.xyz) + _e252.xyz);
    u_xlat0_.x = _e254.x;
    u_xlat0_.y = _e254.y;
    u_xlat0_.z = _e254.z;
    let _e266 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e266.w);
    let _e269 = u_xlat12_;
    let _e270 = u_xlat5_;
    u_xlat12_ = (_e269 * _e270.y);
    let _e273 = u_xlat7_;
    let _e278 = _f_buffer1_.f_cb1_[9];
    let _e283 = _f_buffer1_.f_cb1_[10];
    let _e286 = (_e278.xyz + -(_e283.xyz));
    u_xlat7_.x = _e286.x;
    u_xlat7_.y = _e286.y;
    u_xlat7_.z = _e286.z;
    let _e293 = u_xlat7_;
    let _e295 = u_xlat12_;
    let _e297 = u_xlat7_;
    let _e303 = _f_buffer1_.f_cb1_[10];
    let _e305 = ((vec3(_e295) * _e297.xyz) + _e303.xyz);
    u_xlat7_.x = _e305.x;
    u_xlat7_.y = _e305.y;
    u_xlat7_.z = _e305.z;
    let _e312 = u_xlat0_;
    let _e314 = u_xlat0_;
    let _e316 = u_xlat7_;
    let _e319 = (_e314.xyz + -(_e316.xyz));
    u_xlat0_.x = _e319.x;
    u_xlat0_.y = _e319.y;
    u_xlat0_.z = _e319.z;
    let _e326 = u_xlat0_;
    let _e328 = u_xlat3_;
    let _e330 = u_xlat0_;
    let _e333 = u_xlat7_;
    let _e335 = ((vec3(_e328) * _e330.xyz) + _e333.xyz);
    u_xlat0_.x = _e335.x;
    u_xlat0_.y = _e335.y;
    u_xlat0_.z = _e335.z;
    let _e342 = u_xlat0_;
    let _e344 = u_xlat0_;
    let _e346 = u_xlat5_;
    let _e348 = (_e344.xyz * _e346.xyz);
    u_xlat0_.x = _e348.x;
    u_xlat0_.y = _e348.y;
    u_xlat0_.z = _e348.z;
    let _e355 = u_xlat2_;
    let _e357 = u_xlat0_;
    let _e362 = _f_buffer1_.f_cb1_[2];
    let _e364 = (_e357.xyz * _e362.xxx);
    u_xlat2_.x = _e364.x;
    u_xlat2_.y = _e364.y;
    u_xlat2_.z = _e364.z;
    let _e372 = vs_TEXCOORD1_1;
    let _e376 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e372 + -(_e376.z));
    let _e381 = u_xlat0_;
    u_xlat0_.x = clamp(_e381.x, 0f, 1f);
    let _e387 = u_xlat0_;
    u_xlat0_.x = (_e387.x + -0.00001f);
    let _e392 = u_xlat0_;
    let _e395 = u_xlat2_;
    u_xlat4_ = (-(_e392.x) + _e395.w);
    let _e398 = vs_TEXCOORD1_1;
    let _e402 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e398 + _e402.z);
    let _e405 = u_xlat8_;
    u_xlat8_ = clamp(_e405, 0f, 1f);
    let _e410 = u_xlat0_;
    let _e413 = u_xlat8_;
    u_xlat0_.x = (-(_e410.x) + _e413);
    let _e418 = u_xlat0_;
    u_xlat0_.x = (1f / _e418.x);
    let _e422 = u_xlat0_;
    let _e424 = u_xlat4_;
    u_xlat0_.x = (_e422.x * _e424);
    let _e427 = u_xlat0_;
    u_xlat0_.x = clamp(_e427.x, 0f, 1f);
    let _e432 = u_xlat0_;
    u_xlat4_ = ((_e432.x * -2f) + 3f);
    let _e440 = u_xlat0_;
    let _e442 = u_xlat0_;
    u_xlat0_.x = (_e440.x * _e442.x);
    let _e446 = u_xlat0_;
    let _e448 = u_xlat4_;
    u_xlat0_.x = (_e446.x * _e448);
    let _e451 = u_xlat1_;
    let _e453 = u_xlat0_;
    u_xlat0_.x = (_e451.x * _e453.x);
    let _e456 = u_xlat0_;
    let _e458 = u_xlat2_;
    u_xlat0_ = (_e456.xxxx * _e458);
    let _e460 = u_xlat0_;
    let _e461 = vs_COLOR0_1;
    SV_Target0_ = (_e460 * _e461);
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
