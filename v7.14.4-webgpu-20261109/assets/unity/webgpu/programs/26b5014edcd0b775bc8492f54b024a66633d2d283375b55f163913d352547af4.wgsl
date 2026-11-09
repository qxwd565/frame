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
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: f32 = 0f;

    let _e38 = vs_TEXCOORD1_1;
    let _e42 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e38 + _e42.y);
    let _e46 = u_xlat0_;
    u_xlat0_.x = ((_e46.x * 2f) + -1f);
    let _e53 = vs_TEXCOORD0_1;
    u_xlat1_ = _e53.zwxy;
    let _e55 = u_xlat1_;
    u_xlat1_ = clamp(_e55, vec4(0f), vec4(1f));
    let _e61 = u_xlat1_;
    let _e62 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e61 + -(_e62.zwxy));
    let _e66 = u_xlat3_;
    let _e71 = _f_buffer1_.f_cb1_[6];
    let _e73 = u_xlat1_;
    let _e76 = vs_TEXCOORD0_1;
    let _e78 = ((_e71.xx * _e73.xy) + _e76.zw);
    u_xlat3_.x = _e78.x;
    u_xlat3_.y = _e78.y;
    let _e83 = u_xlat1_;
    let _e88 = _f_buffer1_.f_cb1_[3];
    let _e90 = u_xlat1_;
    let _e93 = vs_TEXCOORD0_1;
    let _e95 = ((_e88.zz * _e90.zw) + _e93.xy);
    u_xlat1_.x = _e95.x;
    u_xlat1_.y = _e95.y;
    let _e100 = u_xlat1_;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[0];
    let _e113 = textureSampleBias(f_t0_, samplerf_s0_, _e100.xy, (_e105.x + _e110.x));
    u_xlat1_ = _e113.xwyz;
    let _e115 = u_xlat3_;
    let _e120 = _f_buffer0_.f_cb0_[4];
    let _e125 = hscard_bias.values[1];
    let _e128 = textureSampleBias(f_t1_, samplerf_s1_, _e115.xy, (_e120.x + _e125.x));
    u_xlat2_ = _e128;
    let _e130 = u_xlat0_;
    let _e133 = u_xlat2_;
    u_xlat0_.x = (-(_e130.x) + _e133.w);
    let _e137 = u_xlat0_;
    u_xlat0_.x = clamp(_e137.x, 0f, 1f);
    let _e143 = u_xlat0_;
    u_xlat0_.x = log2(_e143.x);
    let _e150 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e150.z * 10f);
    let _e155 = u_xlat0_;
    let _e157 = u_xlat3_;
    u_xlat0_.x = (_e155.x * _e157.x);
    let _e161 = u_xlat0_;
    u_xlat0_.x = exp2(_e161.x);
    let _e165 = u_xlat1_;
    let _e170 = _f_buffer1_.f_cb1_[2];
    u_xlat3_.x = (_e165.y + _e170.y);
    let _e173 = u_xlat1_;
    let _e178 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = max(_e173.y, _e178.y);
    let _e182 = u_xlat6_;
    let _e183 = u_xlat3_;
    u_xlat3_.x = (_e182 * _e183.x);
    let _e187 = u_xlat3_;
    let _e192 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e187.x * _e192.x);
    let _e195 = u_xlat2_;
    let _e197 = u_xlat0_;
    let _e199 = u_xlat1_;
    let _e201 = (_e197.xx * _e199.xy);
    u_xlat2_.x = _e201.x;
    u_xlat2_.w = _e201.y;
    let _e207 = u_xlat0_;
    u_xlat0_.x = (-(_e207.x) + 1f);
    let _e213 = u_xlat0_;
    u_xlat0_.x = log2(_e213.x);
    let _e217 = u_xlat0_;
    u_xlat0_.x = (_e217.x * 10f);
    let _e222 = u_xlat0_;
    u_xlat0_.x = exp2(_e222.x);
    let _e226 = u_xlat2_;
    u_xlat3_.x = (_e226.w * 1000000f);
    let _e231 = u_xlat3_;
    u_xlat3_.x = clamp(_e231.x, 0f, 1f);
    let _e237 = u_xlat1_;
    let _e239 = u_xlat3_;
    u_xlat3_.x = (_e237.y * _e239.x);
    let _e243 = u_xlat3_;
    let _e245 = u_xlat0_;
    u_xlat0_.x = (_e243.x * _e245.x);
    let _e248 = u_xlat3_;
    let _e253 = _f_buffer1_.f_cb1_[7];
    let _e258 = _f_buffer1_.f_cb1_[8];
    let _e260 = (_e253.xyz * _e258.xxx);
    u_xlat3_.x = _e260.x;
    u_xlat3_.y = _e260.y;
    u_xlat3_.z = _e260.z;
    let _e267 = u_xlat0_;
    let _e269 = u_xlat0_;
    let _e271 = u_xlat3_;
    let _e273 = (_e269.xxx * _e271.xyz);
    u_xlat0_.x = _e273.x;
    u_xlat0_.y = _e273.y;
    u_xlat0_.z = _e273.z;
    let _e280 = u_xlat2_;
    let _e282 = u_xlat0_;
    let _e284 = vs_COLOR1_1;
    let _e287 = u_xlat2_;
    let _e289 = ((_e282.xyz * _e284.www) + _e287.xxx);
    u_xlat2_.x = _e289.x;
    u_xlat2_.y = _e289.y;
    u_xlat2_.z = _e289.z;
    let _e296 = u_xlat2_;
    let _e297 = vs_COLOR0_1;
    SV_Target0_ = (_e296 * _e297);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
