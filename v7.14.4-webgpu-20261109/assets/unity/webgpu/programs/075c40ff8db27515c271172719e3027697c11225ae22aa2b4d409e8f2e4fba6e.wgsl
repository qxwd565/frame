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
    u_xlat1_ = _e113;
    let _e115 = u_xlat1_;
    u_xlat1_.y = dot(_e115.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e122 = u_xlat3_;
    let _e127 = _f_buffer0_.f_cb0_[4];
    let _e132 = hscard_bias.values[1];
    let _e135 = textureSampleBias(f_t1_, samplerf_s1_, _e122.xy, (_e127.x + _e132.x));
    u_xlat2_ = _e135;
    let _e137 = u_xlat0_;
    let _e140 = u_xlat2_;
    u_xlat0_.x = (-(_e137.x) + _e140.x);
    let _e144 = u_xlat0_;
    u_xlat0_.x = clamp(_e144.x, 0f, 1f);
    let _e150 = u_xlat0_;
    u_xlat0_.x = log2(_e150.x);
    let _e157 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e157.z * 10f);
    let _e162 = u_xlat0_;
    let _e164 = u_xlat3_;
    u_xlat0_.x = (_e162.x * _e164.x);
    let _e168 = u_xlat0_;
    u_xlat0_.x = exp2(_e168.x);
    let _e172 = u_xlat1_;
    let _e177 = _f_buffer1_.f_cb1_[2];
    u_xlat3_.x = (_e172.y + _e177.y);
    let _e180 = u_xlat1_;
    let _e185 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = max(_e180.y, _e185.y);
    let _e189 = u_xlat6_;
    let _e190 = u_xlat3_;
    u_xlat3_.x = (_e189 * _e190.x);
    let _e194 = u_xlat3_;
    let _e199 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e194.x * _e199.x);
    let _e202 = u_xlat2_;
    let _e204 = u_xlat0_;
    let _e206 = u_xlat1_;
    let _e208 = (_e204.xx * _e206.xy);
    u_xlat2_.x = _e208.x;
    u_xlat2_.w = _e208.y;
    let _e214 = u_xlat0_;
    u_xlat0_.x = (-(_e214.x) + 1f);
    let _e220 = u_xlat0_;
    u_xlat0_.x = log2(_e220.x);
    let _e224 = u_xlat0_;
    u_xlat0_.x = (_e224.x * 10f);
    let _e229 = u_xlat0_;
    u_xlat0_.x = exp2(_e229.x);
    let _e233 = u_xlat2_;
    u_xlat3_.x = (_e233.w * 1000000f);
    let _e238 = u_xlat3_;
    u_xlat3_.x = clamp(_e238.x, 0f, 1f);
    let _e244 = u_xlat1_;
    let _e246 = u_xlat3_;
    u_xlat3_.x = (_e244.y * _e246.x);
    let _e250 = u_xlat3_;
    let _e252 = u_xlat0_;
    u_xlat0_.x = (_e250.x * _e252.x);
    let _e255 = u_xlat3_;
    let _e260 = _f_buffer1_.f_cb1_[7];
    let _e265 = _f_buffer1_.f_cb1_[8];
    let _e267 = (_e260.xyz * _e265.xxx);
    u_xlat3_.x = _e267.x;
    u_xlat3_.y = _e267.y;
    u_xlat3_.z = _e267.z;
    let _e274 = u_xlat0_;
    let _e276 = u_xlat0_;
    let _e278 = u_xlat3_;
    let _e280 = (_e276.xxx * _e278.xyz);
    u_xlat0_.x = _e280.x;
    u_xlat0_.y = _e280.y;
    u_xlat0_.z = _e280.z;
    let _e287 = u_xlat2_;
    let _e289 = u_xlat0_;
    let _e291 = vs_COLOR1_1;
    let _e294 = u_xlat2_;
    let _e296 = ((_e289.xyz * _e291.www) + _e294.xxx);
    u_xlat2_.x = _e296.x;
    u_xlat2_.y = _e296.y;
    u_xlat2_.z = _e296.z;
    let _e303 = u_xlat2_;
    let _e304 = vs_COLOR0_1;
    SV_Target0_ = (_e303 * _e304);
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
