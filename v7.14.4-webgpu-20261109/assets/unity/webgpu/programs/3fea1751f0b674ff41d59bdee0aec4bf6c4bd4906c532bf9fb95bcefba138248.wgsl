struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 5>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;

    let _e42 = vs_TEXCOORD0_1;
    let _e47 = _f_buffer0_.f_cb0_[4];
    let _e52 = hscard_bias.values[0];
    let _e55 = textureSampleBias(f_t0_, samplerf_s0_, _e42.xy, (_e47.x + _e52.x));
    u_xlat0_ = _e55;
    let _e56 = u_xlat0_;
    let _e58 = u_xlat0_;
    let _e63 = _f_buffer1_.f_cb1_[1];
    let _e69 = _f_buffer1_.f_cb1_[4];
    let _e71 = ((_e58.xyz * _e63.xyz) + _e69.xxx);
    u_xlat0_.x = _e71.x;
    u_xlat0_.y = _e71.y;
    u_xlat0_.z = _e71.z;
    let _e78 = u_xlat0_;
    let _e83 = _f_buffer1_.f_cb1_[1];
    u_xlat12_ = (_e78.w * _e83.w);
    let _e86 = vs_TEXCOORD0_1;
    let _e91 = _f_buffer0_.f_cb0_[4];
    let _e96 = hscard_bias.values[1];
    let _e99 = textureSampleBias(f_t1_, samplerf_s1_, _e86.xy, (_e91.x + _e96.x));
    u_xlat1_ = _e99;
    let _e101 = u_xlat1_;
    let _e106 = _f_buffer1_.f_cb1_[3];
    u_xlat5_.x = (_e101.x + -(_e106.y));
    let _e111 = u_xlat1_;
    u_xlat1_.x = (-(_e111.x) + 1f);
    let _e117 = u_xlat1_;
    let _e122 = _f_buffer1_.f_cb1_[3];
    u_xlat1_.x = (_e117.x + _e122.y);
    let _e126 = u_xlat1_;
    u_xlat1_.x = clamp(_e126.x, 0f, 1f);
    let _e132 = u_xlat1_;
    u_xlat1_.x = log2(_e132.x);
    let _e136 = u_xlat1_;
    let _e141 = _f_buffer1_.f_cb1_[4];
    u_xlat1_.x = (_e136.x * _e141.y);
    let _e145 = u_xlat1_;
    u_xlat1_.x = exp2(_e145.x);
    let _e149 = u_xlat1_;
    u_xlat1_.x = (-(_e149.x) + 1f);
    let _e155 = u_xlat12_;
    let _e156 = u_xlat1_;
    u_xlat2_.w = (_e155 * _e156.x);
    let _e162 = _f_buffer1_.f_cb1_[3];
    let _e167 = _f_buffer1_.f_cb1_[3];
    let _e170 = u_xlat5_;
    u_xlat12_ = ((_e162.z * _e167.w) + _e170.x);
    let _e173 = u_xlat12_;
    u_xlat12_ = clamp(_e173, 0f, 1f);
    let _e181 = _f_buffer1_.f_cb1_[3];
    let _e185 = u_xlat5_;
    u_xlat1_.x = ((_e181.z * 2f) + _e185.x);
    let _e189 = u_xlat1_;
    u_xlat1_.x = clamp(_e189.x, 0f, 1f);
    let _e194 = u_xlat0_;
    let _e196 = u_xlat12_;
    let _e198 = u_xlat0_;
    let _e204 = _f_buffer1_.f_cb1_[4];
    let _e207 = ((vec3(_e196) * _e198.xyz) + -(_e204.xxx));
    u_xlat0_.x = _e207.x;
    u_xlat0_.y = _e207.y;
    u_xlat0_.z = _e207.z;
    let _e214 = vs_TEXCOORD1_1;
    let _e219 = _f_buffer0_.f_cb0_[4];
    let _e224 = hscard_bias.values[2];
    let _e227 = textureSampleBias(f_t2_, samplerf_s2_, _e214.xy, (_e219.x + _e224.x));
    u_xlat3_ = _e227;
    let _e228 = u_xlat5_;
    let _e233 = _f_buffer1_.f_cb1_[2];
    let _e238 = _f_buffer1_.f_cb1_[3];
    let _e240 = (_e233.xyz * _e238.xxx);
    u_xlat5_.x = _e240.x;
    u_xlat5_.y = _e240.y;
    u_xlat5_.z = _e240.z;
    let _e247 = u_xlat0_;
    let _e249 = u_xlat5_;
    let _e252 = u_xlat3_;
    let _e255 = u_xlat0_;
    let _e257 = ((-(_e249.xyz) * _e252.xxx) + _e255.xyz);
    u_xlat0_.x = _e257.x;
    u_xlat0_.y = _e257.y;
    u_xlat0_.z = _e257.z;
    let _e264 = u_xlat5_;
    let _e266 = u_xlat3_;
    let _e268 = u_xlat5_;
    let _e270 = (_e266.xxx * _e268.xyz);
    u_xlat5_.x = _e270.x;
    u_xlat5_.y = _e270.y;
    u_xlat5_.z = _e270.z;
    let _e277 = u_xlat2_;
    let _e279 = u_xlat1_;
    let _e281 = u_xlat0_;
    let _e284 = u_xlat5_;
    let _e286 = ((_e279.xxx * _e281.xyz) + _e284.xyz);
    u_xlat2_.x = _e286.x;
    u_xlat2_.y = _e286.y;
    u_xlat2_.z = _e286.z;
    let _e293 = u_xlat2_;
    let _e294 = vs_COLOR0_1;
    SV_TARGET0_ = (_e293 * _e294);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e36 = SV_TARGET0_;
    return FragmentOutput(_e36);
}
