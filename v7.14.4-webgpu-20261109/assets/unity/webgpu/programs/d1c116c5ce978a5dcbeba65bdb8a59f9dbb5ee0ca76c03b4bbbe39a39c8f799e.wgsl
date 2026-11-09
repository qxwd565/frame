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
    u_xlat2_ = _e180.yzwx;
    let _e182 = u_xlat5_;
    let _e184 = u_xlat2_;
    let _e189 = _f_buffer1_.f_cb1_[2];
    let _e191 = (_e184.wxy + _e189.yyy);
    u_xlat5_.x = _e191.x;
    u_xlat5_.y = _e191.y;
    u_xlat5_.z = _e191.z;
    let _e198 = u_xlat2_;
    let _e203 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e198.w, _e203.y);
    let _e207 = u_xlat5_;
    let _e209 = u_xlat3_;
    let _e214 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e207.y * _e209) + -(_e214.w));
    let _e218 = u_xlat5_;
    let _e220 = u_xlat5_;
    let _e222 = u_xlat3_;
    let _e224 = (_e220.xyz * vec3(_e222));
    u_xlat5_.x = _e224.x;
    u_xlat5_.y = _e224.y;
    u_xlat5_.z = _e224.z;
    let _e231 = u_xlat7_;
    let _e233 = u_xlat12_;
    u_xlat12_ = (_e231.x / _e233);
    let _e235 = u_xlat7_;
    u_xlat3_ = (_e235.x * 5f);
    let _e239 = u_xlat3_;
    u_xlat3_ = clamp(_e239, 0f, 1f);
    let _e243 = u_xlat0_;
    let _e245 = u_xlat12_;
    let _e247 = u_xlat0_;
    let _e253 = _f_buffer1_.f_cb1_[9];
    let _e255 = ((vec3(_e245) * _e247.xyz) + _e253.xyz);
    u_xlat0_.x = _e255.x;
    u_xlat0_.y = _e255.y;
    u_xlat0_.z = _e255.z;
    let _e267 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e267.w);
    let _e270 = u_xlat12_;
    let _e271 = u_xlat5_;
    u_xlat12_ = (_e270 * _e271.y);
    let _e274 = u_xlat7_;
    let _e279 = _f_buffer1_.f_cb1_[9];
    let _e284 = _f_buffer1_.f_cb1_[10];
    let _e287 = (_e279.xyz + -(_e284.xyz));
    u_xlat7_.x = _e287.x;
    u_xlat7_.y = _e287.y;
    u_xlat7_.z = _e287.z;
    let _e294 = u_xlat7_;
    let _e296 = u_xlat12_;
    let _e298 = u_xlat7_;
    let _e304 = _f_buffer1_.f_cb1_[10];
    let _e306 = ((vec3(_e296) * _e298.xyz) + _e304.xyz);
    u_xlat7_.x = _e306.x;
    u_xlat7_.y = _e306.y;
    u_xlat7_.z = _e306.z;
    let _e313 = u_xlat0_;
    let _e315 = u_xlat0_;
    let _e317 = u_xlat7_;
    let _e320 = (_e315.xyz + -(_e317.xyz));
    u_xlat0_.x = _e320.x;
    u_xlat0_.y = _e320.y;
    u_xlat0_.z = _e320.z;
    let _e327 = u_xlat0_;
    let _e329 = u_xlat3_;
    let _e331 = u_xlat0_;
    let _e334 = u_xlat7_;
    let _e336 = ((vec3(_e329) * _e331.xyz) + _e334.xyz);
    u_xlat0_.x = _e336.x;
    u_xlat0_.y = _e336.y;
    u_xlat0_.z = _e336.z;
    let _e343 = u_xlat0_;
    let _e345 = u_xlat0_;
    let _e347 = u_xlat5_;
    let _e349 = (_e345.xyz * _e347.xyz);
    u_xlat0_.x = _e349.x;
    u_xlat0_.y = _e349.y;
    u_xlat0_.z = _e349.z;
    let _e356 = u_xlat2_;
    let _e358 = u_xlat0_;
    let _e363 = _f_buffer1_.f_cb1_[2];
    let _e365 = (_e358.xyz * _e363.xxx);
    u_xlat2_.x = _e365.x;
    u_xlat2_.y = _e365.y;
    u_xlat2_.z = _e365.z;
    let _e373 = vs_TEXCOORD1_1;
    let _e377 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e373 + -(_e377.z));
    let _e382 = u_xlat0_;
    u_xlat0_.x = clamp(_e382.x, 0f, 1f);
    let _e388 = u_xlat0_;
    u_xlat0_.x = (_e388.x + -0.00001f);
    let _e393 = u_xlat0_;
    let _e396 = u_xlat2_;
    u_xlat4_ = (-(_e393.x) + _e396.w);
    let _e399 = vs_TEXCOORD1_1;
    let _e403 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e399 + _e403.z);
    let _e406 = u_xlat8_;
    u_xlat8_ = clamp(_e406, 0f, 1f);
    let _e411 = u_xlat0_;
    let _e414 = u_xlat8_;
    u_xlat0_.x = (-(_e411.x) + _e414);
    let _e419 = u_xlat0_;
    u_xlat0_.x = (1f / _e419.x);
    let _e423 = u_xlat0_;
    let _e425 = u_xlat4_;
    u_xlat0_.x = (_e423.x * _e425);
    let _e428 = u_xlat0_;
    u_xlat0_.x = clamp(_e428.x, 0f, 1f);
    let _e433 = u_xlat0_;
    u_xlat4_ = ((_e433.x * -2f) + 3f);
    let _e441 = u_xlat0_;
    let _e443 = u_xlat0_;
    u_xlat0_.x = (_e441.x * _e443.x);
    let _e447 = u_xlat0_;
    let _e449 = u_xlat4_;
    u_xlat0_.x = (_e447.x * _e449);
    let _e452 = u_xlat1_;
    let _e454 = u_xlat0_;
    u_xlat0_.x = (_e452.x * _e454.x);
    let _e457 = u_xlat0_;
    let _e459 = u_xlat2_;
    u_xlat0_ = (_e457.xxxx * _e459);
    let _e461 = u_xlat0_;
    let _e462 = vs_COLOR0_1;
    SV_Target0_ = (_e461 * _e462);
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
