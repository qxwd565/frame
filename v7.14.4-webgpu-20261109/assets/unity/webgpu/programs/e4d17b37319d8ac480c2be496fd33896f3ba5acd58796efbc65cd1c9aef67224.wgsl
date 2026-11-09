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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e46 = u_xlat0_;
    let _e51 = _f_buffer1_.f_cb1_[8];
    let _e56 = _f_buffer1_.f_cb1_[9];
    let _e59 = (_e51.yzw + -(_e56.xyz));
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    u_xlat0_.z = _e59.z;
    let _e69 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e69.w) + 1f);
    let _e74 = vs_TEXCOORD0_1;
    u_xlat1_ = _e74.zwxy;
    let _e76 = u_xlat1_;
    u_xlat1_ = clamp(_e76, vec4(0f), vec4(1f));
    let _e82 = u_xlat1_;
    let _e83 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e82 + -(_e83.zwxy));
    let _e87 = u_xlat9_;
    let _e92 = _f_buffer1_.f_cb1_[3];
    let _e94 = u_xlat1_;
    let _e97 = vs_TEXCOORD0_1;
    let _e99 = ((_e92.zz * _e94.zw) + _e97.xy);
    u_xlat9_.x = _e99.x;
    u_xlat9_.y = _e99.y;
    let _e104 = u_xlat1_;
    let _e109 = _f_buffer1_.f_cb1_[6];
    let _e111 = u_xlat1_;
    let _e114 = vs_TEXCOORD0_1;
    let _e116 = ((_e109.xx * _e111.xy) + _e114.zw);
    u_xlat1_.x = _e116.x;
    u_xlat1_.y = _e116.y;
    let _e121 = u_xlat1_;
    let _e126 = _f_buffer0_.f_cb0_[4];
    let _e131 = hscard_bias.values[1];
    let _e134 = textureSampleBias(f_t1_, samplerf_s1_, _e121.xy, (_e126.x + _e131.x));
    u_xlat2_ = _e134;
    let _e136 = u_xlat2_;
    u_xlat1_.x = dot(_e136.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e144 = u_xlat1_;
    u_xlat1_.x = (_e144.x + -1f);
    let _e153 = _f_buffer1_.f_cb1_[7];
    let _e155 = u_xlat1_;
    u_xlat1_.x = ((_e153.w * _e155.x) + 1f);
    let _e160 = u_xlat9_;
    let _e165 = _f_buffer0_.f_cb0_[4];
    let _e170 = hscard_bias.values[0];
    let _e173 = textureSampleBias(f_t0_, samplerf_s0_, _e160.xy, (_e165.x + _e170.x));
    u_xlat2_ = _e173.yzwx;
    let _e175 = u_xlat5_;
    let _e177 = u_xlat2_;
    let _e182 = _f_buffer1_.f_cb1_[2];
    let _e184 = (_e177.wxy + _e182.yyy);
    u_xlat5_.x = _e184.x;
    u_xlat5_.y = _e184.y;
    u_xlat5_.z = _e184.z;
    let _e191 = u_xlat2_;
    let _e196 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e191.w, _e196.y);
    let _e200 = u_xlat5_;
    let _e202 = u_xlat3_;
    let _e207 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e200.y * _e202) + -(_e207.w));
    let _e211 = u_xlat5_;
    let _e213 = u_xlat5_;
    let _e215 = u_xlat3_;
    let _e217 = (_e213.xyz * vec3(_e215));
    u_xlat5_.x = _e217.x;
    u_xlat5_.y = _e217.y;
    u_xlat5_.z = _e217.z;
    let _e224 = u_xlat7_;
    let _e226 = u_xlat12_;
    u_xlat12_ = (_e224.x / _e226);
    let _e228 = u_xlat7_;
    u_xlat3_ = (_e228.x * 5f);
    let _e232 = u_xlat3_;
    u_xlat3_ = clamp(_e232, 0f, 1f);
    let _e236 = u_xlat0_;
    let _e238 = u_xlat12_;
    let _e240 = u_xlat0_;
    let _e246 = _f_buffer1_.f_cb1_[9];
    let _e248 = ((vec3(_e238) * _e240.xyz) + _e246.xyz);
    u_xlat0_.x = _e248.x;
    u_xlat0_.y = _e248.y;
    u_xlat0_.z = _e248.z;
    let _e260 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e260.w);
    let _e263 = u_xlat12_;
    let _e264 = u_xlat5_;
    u_xlat12_ = (_e263 * _e264.y);
    let _e267 = u_xlat7_;
    let _e272 = _f_buffer1_.f_cb1_[9];
    let _e277 = _f_buffer1_.f_cb1_[10];
    let _e280 = (_e272.xyz + -(_e277.xyz));
    u_xlat7_.x = _e280.x;
    u_xlat7_.y = _e280.y;
    u_xlat7_.z = _e280.z;
    let _e287 = u_xlat7_;
    let _e289 = u_xlat12_;
    let _e291 = u_xlat7_;
    let _e297 = _f_buffer1_.f_cb1_[10];
    let _e299 = ((vec3(_e289) * _e291.xyz) + _e297.xyz);
    u_xlat7_.x = _e299.x;
    u_xlat7_.y = _e299.y;
    u_xlat7_.z = _e299.z;
    let _e306 = u_xlat0_;
    let _e308 = u_xlat0_;
    let _e310 = u_xlat7_;
    let _e313 = (_e308.xyz + -(_e310.xyz));
    u_xlat0_.x = _e313.x;
    u_xlat0_.y = _e313.y;
    u_xlat0_.z = _e313.z;
    let _e320 = u_xlat0_;
    let _e322 = u_xlat3_;
    let _e324 = u_xlat0_;
    let _e327 = u_xlat7_;
    let _e329 = ((vec3(_e322) * _e324.xyz) + _e327.xyz);
    u_xlat0_.x = _e329.x;
    u_xlat0_.y = _e329.y;
    u_xlat0_.z = _e329.z;
    let _e336 = u_xlat0_;
    let _e338 = u_xlat0_;
    let _e340 = u_xlat5_;
    let _e342 = (_e338.xyz * _e340.xyz);
    u_xlat0_.x = _e342.x;
    u_xlat0_.y = _e342.y;
    u_xlat0_.z = _e342.z;
    let _e349 = u_xlat2_;
    let _e351 = u_xlat0_;
    let _e356 = _f_buffer1_.f_cb1_[2];
    let _e358 = (_e351.xyz * _e356.xxx);
    u_xlat2_.x = _e358.x;
    u_xlat2_.y = _e358.y;
    u_xlat2_.z = _e358.z;
    let _e365 = u_xlat1_;
    let _e367 = u_xlat2_;
    u_xlat0_ = (_e365.xxxx * _e367);
    let _e369 = u_xlat0_;
    let _e370 = vs_COLOR0_1;
    SV_Target0_ = (_e369 * _e370);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
