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
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e36 = vs_TEXCOORD0_1;
    u_xlat0_ = _e36.zwxy;
    let _e38 = u_xlat0_;
    u_xlat0_ = clamp(_e38, vec4(0f), vec4(1f));
    let _e44 = u_xlat0_;
    let _e45 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e44 + -(_e45.zwxy));
    let _e49 = u_xlat0_;
    let _e54 = _f_buffer1_.f_cb1_[6];
    let _e56 = u_xlat0_;
    let _e59 = vs_TEXCOORD0_1;
    let _e61 = ((_e54.xx * _e56.xy) + _e59.zw);
    u_xlat0_.x = _e61.x;
    u_xlat0_.y = _e61.y;
    let _e66 = u_xlat6_;
    let _e71 = _f_buffer1_.f_cb1_[3];
    let _e73 = u_xlat0_;
    let _e76 = vs_TEXCOORD0_1;
    let _e78 = ((_e71.zz * _e73.zw) + _e76.xy);
    u_xlat6_.x = _e78.x;
    u_xlat6_.y = _e78.y;
    let _e83 = u_xlat6_;
    let _e88 = _f_buffer0_.f_cb0_[4];
    let _e93 = hscard_bias.values[0];
    let _e96 = textureSampleBias(f_t0_, samplerf_s0_, _e83.xy, (_e88.x + _e93.x));
    u_xlat1_ = _e96;
    let _e97 = u_xlat0_;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[1];
    let _e110 = textureSampleBias(f_t1_, samplerf_s1_, _e97.xy, (_e102.x + _e107.x));
    u_xlat0_ = _e110;
    let _e112 = u_xlat0_;
    u_xlat0_.x = dot(_e112.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e120 = u_xlat0_;
    u_xlat0_.x = (_e120.x + -1f);
    let _e129 = _f_buffer1_.f_cb1_[7];
    let _e131 = u_xlat0_;
    u_xlat0_.x = ((_e129.w * _e131.x) + 1f);
    let _e137 = vs_TEXCOORD1_1;
    let _e141 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e137 + _e141.z);
    let _e145 = u_xlat3_;
    u_xlat3_.x = clamp(_e145.x, 0f, 1f);
    let _e151 = vs_TEXCOORD1_1;
    let _e155 = _f_buffer1_.f_cb1_[12];
    u_xlat6_.x = (_e151 + -(_e155.z));
    let _e160 = u_xlat6_;
    u_xlat6_.x = clamp(_e160.x, 0f, 1f);
    let _e166 = u_xlat6_;
    u_xlat6_.x = (_e166.x + -0.00001f);
    let _e172 = u_xlat6_;
    let _e175 = u_xlat3_;
    u_xlat3_.x = (-(_e172.x) + _e175.x);
    let _e179 = u_xlat6_;
    let _e182 = u_xlat1_;
    u_xlat6_.x = (-(_e179.x) + _e182.w);
    let _e188 = u_xlat3_;
    u_xlat3_.x = (1f / _e188.x);
    let _e192 = u_xlat3_;
    let _e194 = u_xlat6_;
    u_xlat3_.x = (_e192.x * _e194.x);
    let _e198 = u_xlat3_;
    u_xlat3_.x = clamp(_e198.x, 0f, 1f);
    let _e204 = u_xlat3_;
    u_xlat6_.x = ((_e204.x * -2f) + 3f);
    let _e212 = u_xlat3_;
    let _e214 = u_xlat3_;
    u_xlat3_.x = (_e212.x * _e214.x);
    let _e218 = u_xlat3_;
    let _e220 = u_xlat6_;
    u_xlat3_.x = (_e218.x * _e220.x);
    let _e224 = u_xlat0_;
    let _e226 = u_xlat3_;
    u_xlat0_.x = (_e224.x * _e226.x);
    let _e229 = u_xlat3_;
    let _e231 = u_xlat1_;
    let _e236 = _f_buffer1_.f_cb1_[2];
    let _e238 = (_e231.xyz + _e236.yyy);
    u_xlat3_.x = _e238.x;
    u_xlat3_.y = _e238.y;
    u_xlat3_.z = _e238.z;
    let _e245 = u_xlat1_;
    let _e250 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e245.w, _e250.y);
    let _e253 = u_xlat3_;
    let _e255 = u_xlat3_;
    let _e257 = u_xlat2_;
    let _e259 = (_e255.xyz * vec3(_e257));
    u_xlat3_.x = _e259.x;
    u_xlat3_.y = _e259.y;
    u_xlat3_.z = _e259.z;
    let _e266 = u_xlat1_;
    let _e268 = u_xlat3_;
    let _e273 = _f_buffer1_.f_cb1_[2];
    let _e275 = (_e268.xyz * _e273.xxx);
    u_xlat1_.x = _e275.x;
    u_xlat1_.y = _e275.y;
    u_xlat1_.z = _e275.z;
    let _e282 = u_xlat0_;
    let _e284 = u_xlat1_;
    u_xlat0_ = (_e282.xxxx * _e284);
    let _e286 = u_xlat0_;
    let _e287 = vs_COLOR0_1;
    SV_Target0_ = (_e286 * _e287);
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
