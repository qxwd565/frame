struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 10>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> phase0_Input0_1_: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec2<f32>;
var<private> vs_TEXCOORD3_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);

    let _e33 = vs_TEXCOORD0_1;
    let _e34 = vs_TEXCOORD1_1;
    phase0_Input0_1_ = vec4<f32>(_e33.x, _e33.y, _e34.x, _e34.y);
    let _e40 = phase0_Input0_1_;
    let _e45 = hscard_bias.values[0];
    let _e47 = textureSampleBias(f_t0_, samplerf_s0_, _e40.xy, _e45.x);
    u_xlat0_ = _e47;
    let _e49 = u_xlat0_;
    u_xlat0_.x = (-(_e49.w) + 1f);
    let _e54 = vs_TEXCOORD2_1;
    let _e59 = hscard_bias.values[3];
    let _e61 = textureSampleBias(f_t1_, samplerf_s3_, _e54.xy, _e59.x);
    u_xlat1_ = _e61;
    let _e62 = u_xlat1_;
    u_xlat1_ = (_e62.xyxy + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
    let _e74 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat0_ = (_e74.xxxx * _e76);
    let _e78 = u_xlat0_;
    let _e82 = _f_buffer0_.f_cb0_[6];
    u_xlat0_ = (_e78 * _e82.yyyy);
    let _e85 = u_xlat0_;
    let _e92 = phase0_Input0_1_;
    u_xlat0_ = ((_e85 * vec4<f32>(0.01f, 0.01f, 0.01f, 0.01f)) + _e92);
    let _e94 = u_xlat0_;
    let _e99 = hscard_bias.values[2];
    let _e101 = textureSampleBias(f_t2_, samplerf_s2_, _e94.zw, _e99.x);
    u_xlat1_ = _e101;
    let _e102 = u_xlat0_;
    let _e107 = hscard_bias.values[0];
    let _e109 = textureSampleBias(f_t0_, samplerf_s0_, _e102.xy, _e107.x);
    u_xlat0_ = _e109;
    let _e110 = u_xlat1_;
    let _e112 = u_xlat1_;
    let _e118 = _f_buffer0_.f_cb0_[9];
    let _e120 = (-(_e112.xyz) + _e118.xxx);
    u_xlat1_.x = _e120.x;
    u_xlat1_.y = _e120.y;
    u_xlat1_.z = _e120.z;
    let _e127 = u_xlat1_;
    let _e129 = u_xlat1_;
    let _e132 = u_xlat1_;
    let _e135 = u_xlat0_;
    let _e137 = ((-(_e129.xyz) * _e132.xyz) + _e135.xyz);
    u_xlat1_.x = _e137.x;
    u_xlat1_.y = _e137.y;
    u_xlat1_.z = _e137.z;
    let _e144 = u_xlat1_;
    let _e146 = u_xlat1_;
    let _e151 = _f_buffer0_.f_cb0_[7];
    let _e153 = (_e146.xyz + _e151.zzz);
    u_xlat1_.x = _e153.x;
    u_xlat1_.y = _e153.y;
    u_xlat1_.z = _e153.z;
    let _e160 = u_xlat1_;
    let _e162 = u_xlat1_;
    let _e167 = _f_buffer0_.f_cb0_[8];
    let _e169 = (_e162.xyz * _e167.xyz);
    u_xlat1_.x = _e169.x;
    u_xlat1_.y = _e169.y;
    u_xlat1_.z = _e169.z;
    let _e176 = u_xlat0_;
    let _e178 = u_xlat1_;
    let _e184 = _f_buffer0_.f_cb0_[7];
    let _e187 = u_xlat0_;
    let _e189 = ((-(_e178.xyz) * _e184.yyy) + _e187.xyz);
    u_xlat0_.x = _e189.x;
    u_xlat0_.y = _e189.y;
    u_xlat0_.z = _e189.z;
    let _e196 = u_xlat1_;
    let _e198 = u_xlat1_;
    let _e203 = _f_buffer0_.f_cb0_[7];
    let _e205 = (_e198.xyz * _e203.yyy);
    u_xlat1_.x = _e205.x;
    u_xlat1_.y = _e205.y;
    u_xlat1_.z = _e205.z;
    let _e212 = u_xlat0_;
    let _e214 = u_xlat0_;
    let _e216 = u_xlat0_;
    let _e219 = u_xlat1_;
    let _e221 = ((_e214.www * _e216.xyz) + _e219.xyz);
    u_xlat0_.x = _e221.x;
    u_xlat0_.y = _e221.y;
    u_xlat0_.z = _e221.z;
    let _e228 = vs_TEXCOORD3_1;
    let _e233 = hscard_bias.values[1];
    let _e235 = textureSampleBias(f_t3_, samplerf_s1_, _e228.xy, _e233.x);
    u_xlat1_ = _e235;
    let _e236 = u_xlat2_;
    let _e238 = u_xlat0_;
    let _e240 = u_xlat1_;
    let _e247 = ((_e238.xyz * _e240.xyz) + vec3<f32>(0.15f, 0.15f, 0.15f));
    u_xlat2_.x = _e247.x;
    u_xlat2_.y = _e247.y;
    u_xlat2_.z = _e247.z;
    let _e254 = u_xlat0_;
    let _e256 = u_xlat0_;
    let _e258 = u_xlat1_;
    let _e260 = (_e256.xyz * _e258.xyz);
    u_xlat0_.x = _e260.x;
    u_xlat0_.y = _e260.y;
    u_xlat0_.z = _e260.z;
    let _e267 = u_xlat1_;
    let _e269 = u_xlat2_;
    let _e271 = vs_COLOR0_1;
    let _e273 = (_e269.xyz * _e271.xyz);
    u_xlat1_.x = _e273.x;
    u_xlat1_.y = _e273.y;
    u_xlat1_.z = _e273.z;
    let _e280 = SV_Target0_;
    let _e282 = u_xlat0_;
    let _e284 = u_xlat1_;
    let _e286 = min(_e282.xyz, _e284.xyz);
    SV_Target0_.x = _e286.x;
    SV_Target0_.y = _e286.y;
    SV_Target0_.z = _e286.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(3) vs_TEXCOORD3_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e47 = SV_Target0_;
    return FragmentOutput(_e47);
}
