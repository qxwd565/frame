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
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat13_: f32 = 0f;
    var u_xlat15_: f32 = 0f;

    let _e49 = u_xlat0_;
    let _e54 = _f_buffer1_.f_cb1_[8];
    let _e59 = _f_buffer1_.f_cb1_[9];
    let _e62 = (_e54.yzw + -(_e59.xyz));
    u_xlat0_.x = _e62.x;
    u_xlat0_.y = _e62.y;
    u_xlat0_.z = _e62.z;
    let _e72 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e72.w) + 1f);
    let _e77 = vs_TEXCOORD0_1;
    u_xlat1_ = _e77.zwxy;
    let _e79 = u_xlat1_;
    u_xlat1_ = clamp(_e79, vec4(0f), vec4(1f));
    let _e85 = u_xlat1_;
    let _e86 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e85 + -(_e86.zwxy));
    let _e90 = u_xlat11_;
    let _e95 = _f_buffer1_.f_cb1_[3];
    let _e97 = u_xlat1_;
    let _e100 = vs_TEXCOORD0_1;
    let _e102 = ((_e95.zz * _e97.zw) + _e100.xy);
    u_xlat11_.x = _e102.x;
    u_xlat11_.y = _e102.y;
    let _e107 = u_xlat1_;
    let _e112 = _f_buffer1_.f_cb1_[6];
    let _e114 = u_xlat1_;
    let _e117 = vs_TEXCOORD0_1;
    let _e119 = ((_e112.xx * _e114.xy) + _e117.zw);
    u_xlat1_.x = _e119.x;
    u_xlat1_.y = _e119.y;
    let _e124 = u_xlat1_;
    let _e129 = _f_buffer0_.f_cb0_[4];
    let _e134 = hscard_bias.values[1];
    let _e137 = textureSampleBias(f_t1_, samplerf_s1_, _e124.xy, (_e129.x + _e134.x));
    u_xlat2_ = _e137;
    let _e138 = u_xlat11_;
    let _e143 = _f_buffer0_.f_cb0_[4];
    let _e148 = hscard_bias.values[0];
    let _e151 = textureSampleBias(f_t0_, samplerf_s0_, _e138.xy, (_e143.x + _e148.x));
    u_xlat1_ = _e151;
    let _e153 = u_xlat1_;
    u_xlat1_.w = dot(_e153.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e160 = u_xlat1_;
    let _e165 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e160.w + _e165.y);
    let _e168 = u_xlat1_;
    let _e173 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = max(_e168.w, _e173.y);
    let _e176 = u_xlat3_;
    let _e177 = u_xlat8_;
    let _e182 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e176 * _e177) + -(_e182.w));
    let _e186 = u_xlat8_;
    let _e187 = u_xlat3_;
    u_xlat3_ = (_e186 * _e187);
    let _e189 = u_xlat13_;
    let _e190 = u_xlat15_;
    u_xlat15_ = (_e189 / _e190);
    let _e192 = u_xlat13_;
    u_xlat8_ = (_e192 * 5f);
    let _e195 = u_xlat8_;
    u_xlat8_ = clamp(_e195, 0f, 1f);
    let _e199 = u_xlat0_;
    let _e201 = u_xlat15_;
    let _e203 = u_xlat0_;
    let _e209 = _f_buffer1_.f_cb1_[9];
    let _e211 = ((vec3(_e201) * _e203.xyz) + _e209.xyz);
    u_xlat0_.x = _e211.x;
    u_xlat0_.y = _e211.y;
    u_xlat0_.z = _e211.z;
    let _e223 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e223.w);
    let _e226 = u_xlat15_;
    let _e227 = u_xlat3_;
    u_xlat15_ = (_e226 * _e227);
    let _e229 = u_xlat4_;
    let _e234 = _f_buffer1_.f_cb1_[9];
    let _e239 = _f_buffer1_.f_cb1_[10];
    let _e242 = (_e234.xyz + -(_e239.xyz));
    u_xlat4_.x = _e242.x;
    u_xlat4_.y = _e242.y;
    u_xlat4_.z = _e242.z;
    let _e249 = u_xlat4_;
    let _e251 = u_xlat15_;
    let _e253 = u_xlat4_;
    let _e259 = _f_buffer1_.f_cb1_[10];
    let _e261 = ((vec3(_e251) * _e253.xyz) + _e259.xyz);
    u_xlat4_.x = _e261.x;
    u_xlat4_.y = _e261.y;
    u_xlat4_.z = _e261.z;
    let _e268 = u_xlat0_;
    let _e270 = u_xlat0_;
    let _e272 = u_xlat4_;
    let _e275 = (_e270.xyz + -(_e272.xyz));
    u_xlat0_.x = _e275.x;
    u_xlat0_.y = _e275.y;
    u_xlat0_.z = _e275.z;
    let _e282 = u_xlat0_;
    let _e284 = u_xlat8_;
    let _e286 = u_xlat0_;
    let _e289 = u_xlat4_;
    let _e291 = ((vec3(_e284) * _e286.xyz) + _e289.xyz);
    u_xlat0_.x = _e291.x;
    u_xlat0_.y = _e291.y;
    u_xlat0_.z = _e291.z;
    let _e298 = u_xlat0_;
    let _e300 = u_xlat0_;
    let _e302 = u_xlat3_;
    let _e304 = (_e300.xyz * vec3(_e302));
    u_xlat0_.x = _e304.x;
    u_xlat0_.y = _e304.y;
    u_xlat0_.z = _e304.z;
    let _e311 = u_xlat1_;
    let _e313 = u_xlat0_;
    let _e318 = _f_buffer1_.f_cb1_[2];
    let _e320 = (_e313.xyz * _e318.xxx);
    u_xlat1_.x = _e320.x;
    u_xlat1_.y = _e320.y;
    u_xlat1_.z = _e320.z;
    let _e327 = u_xlat2_;
    let _e328 = vs_COLOR1_1;
    let _e330 = u_xlat1_;
    u_xlat0_ = ((_e327 * _e328) + _e330);
    let _e332 = u_xlat0_;
    let _e333 = vs_COLOR0_1;
    SV_Target0_ = (_e332 * _e333);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
