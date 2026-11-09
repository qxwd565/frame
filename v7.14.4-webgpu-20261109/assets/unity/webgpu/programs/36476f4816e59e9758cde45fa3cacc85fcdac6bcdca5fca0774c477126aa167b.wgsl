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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> phase0_Input0_1_: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat13_: f32 = 0f;
    var u_xlat15_: f32 = 0f;

    let _e48 = vs_TEXCOORD0_1;
    let _e49 = vs_TEXCOORD1_1;
    phase0_Input0_1_ = vec4<f32>(_e48.x, _e48.y, _e49, 0f);
    let _e55 = u_xlat0_;
    let _e60 = _f_buffer1_.f_cb1_[8];
    let _e65 = _f_buffer1_.f_cb1_[9];
    let _e68 = (_e60.yzw + -(_e65.xyz));
    u_xlat0_.x = _e68.x;
    u_xlat0_.y = _e68.y;
    u_xlat0_.z = _e68.z;
    let _e78 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e78.w) + 1f);
    let _e83 = u_xlat1_;
    let _e85 = phase0_Input0_1_;
    let _e86 = _e85.zxy;
    u_xlat1_.x = _e86.x;
    u_xlat1_.y = _e86.y;
    u_xlat1_.z = _e86.z;
    let _e93 = u_xlat1_;
    let _e95 = u_xlat1_;
    let _e101 = clamp(_e95.xyz, vec3(0f), vec3(1f));
    u_xlat1_.x = _e101.x;
    u_xlat1_.y = _e101.y;
    u_xlat1_.z = _e101.z;
    let _e108 = u_xlat6_;
    let _e110 = u_xlat1_;
    let _e112 = phase0_Input0_1_;
    let _e115 = (_e110.yz + -(_e112.xy));
    u_xlat6_.x = _e115.x;
    u_xlat6_.y = _e115.y;
    let _e120 = u_xlat1_;
    let _e122 = vs_COLOR0_1;
    u_xlat2_ = (_e120.xxxx * _e122);
    let _e124 = u_xlat1_;
    let _e129 = _f_buffer1_.f_cb1_[3];
    let _e131 = u_xlat6_;
    let _e134 = phase0_Input0_1_;
    let _e136 = ((_e129.zz * _e131.xy) + _e134.xy);
    u_xlat1_.x = _e136.x;
    u_xlat1_.y = _e136.y;
    let _e141 = u_xlat1_;
    let _e146 = _f_buffer0_.f_cb0_[4];
    let _e151 = hscard_bias.values[0];
    let _e154 = textureSampleBias(f_t0_, samplerf_s0_, _e141.xy, (_e146.x + _e151.x));
    u_xlat1_ = _e154;
    let _e155 = u_xlat1_;
    let _e160 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e155.w + _e160.y);
    let _e163 = u_xlat1_;
    let _e168 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = max(_e163.w, _e168.y);
    let _e171 = u_xlat3_;
    let _e172 = u_xlat8_;
    let _e177 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e171 * _e172) + -(_e177.w));
    let _e181 = u_xlat8_;
    let _e182 = u_xlat3_;
    u_xlat3_ = (_e181 * _e182);
    let _e184 = u_xlat13_;
    let _e185 = u_xlat15_;
    u_xlat15_ = (_e184 / _e185);
    let _e187 = u_xlat13_;
    u_xlat8_ = (_e187 * 5f);
    let _e190 = u_xlat8_;
    u_xlat8_ = clamp(_e190, 0f, 1f);
    let _e194 = u_xlat0_;
    let _e196 = u_xlat15_;
    let _e198 = u_xlat0_;
    let _e204 = _f_buffer1_.f_cb1_[9];
    let _e206 = ((vec3(_e196) * _e198.xyz) + _e204.xyz);
    u_xlat0_.x = _e206.x;
    u_xlat0_.y = _e206.y;
    u_xlat0_.z = _e206.z;
    let _e218 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e218.w);
    let _e221 = u_xlat15_;
    let _e222 = u_xlat3_;
    u_xlat15_ = (_e221 * _e222);
    let _e224 = u_xlat4_;
    let _e229 = _f_buffer1_.f_cb1_[9];
    let _e234 = _f_buffer1_.f_cb1_[10];
    let _e237 = (_e229.xyz + -(_e234.xyz));
    u_xlat4_.x = _e237.x;
    u_xlat4_.y = _e237.y;
    u_xlat4_.z = _e237.z;
    let _e244 = u_xlat4_;
    let _e246 = u_xlat15_;
    let _e248 = u_xlat4_;
    let _e254 = _f_buffer1_.f_cb1_[10];
    let _e256 = ((vec3(_e246) * _e248.xyz) + _e254.xyz);
    u_xlat4_.x = _e256.x;
    u_xlat4_.y = _e256.y;
    u_xlat4_.z = _e256.z;
    let _e263 = u_xlat0_;
    let _e265 = u_xlat0_;
    let _e267 = u_xlat4_;
    let _e270 = (_e265.xyz + -(_e267.xyz));
    u_xlat0_.x = _e270.x;
    u_xlat0_.y = _e270.y;
    u_xlat0_.z = _e270.z;
    let _e277 = u_xlat0_;
    let _e279 = u_xlat8_;
    let _e281 = u_xlat0_;
    let _e284 = u_xlat4_;
    let _e286 = ((vec3(_e279) * _e281.xyz) + _e284.xyz);
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    u_xlat0_.z = _e286.z;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat3_;
    let _e299 = (_e295.xyz * vec3(_e297));
    u_xlat0_.x = _e299.x;
    u_xlat0_.y = _e299.y;
    u_xlat0_.z = _e299.z;
    let _e306 = u_xlat1_;
    let _e308 = u_xlat0_;
    let _e313 = _f_buffer1_.f_cb1_[2];
    let _e315 = (_e308.xyz * _e313.xxx);
    u_xlat1_.x = _e315.x;
    u_xlat1_.y = _e315.y;
    u_xlat1_.z = _e315.z;
    let _e322 = u_xlat2_;
    let _e323 = u_xlat1_;
    SV_Target0_ = (_e322 * _e323);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e30 = SV_Target0_;
    return FragmentOutput(_e30);
}
