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
    u_xlat1_ = _e96.yzwx;
    let _e98 = u_xlat0_;
    let _e103 = _f_buffer0_.f_cb0_[4];
    let _e108 = hscard_bias.values[1];
    let _e111 = textureSampleBias(f_t1_, samplerf_s1_, _e98.xy, (_e103.x + _e108.x));
    u_xlat0_ = _e111;
    let _e113 = u_xlat0_;
    u_xlat0_.x = (_e113.x + -1f);
    let _e122 = _f_buffer1_.f_cb1_[7];
    let _e124 = u_xlat0_;
    u_xlat0_.x = ((_e122.w * _e124.x) + 1f);
    let _e130 = vs_TEXCOORD1_1;
    let _e134 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e130 + _e134.z);
    let _e138 = u_xlat3_;
    u_xlat3_.x = clamp(_e138.x, 0f, 1f);
    let _e144 = vs_TEXCOORD1_1;
    let _e148 = _f_buffer1_.f_cb1_[12];
    u_xlat6_.x = (_e144 + -(_e148.z));
    let _e153 = u_xlat6_;
    u_xlat6_.x = clamp(_e153.x, 0f, 1f);
    let _e159 = u_xlat6_;
    u_xlat6_.x = (_e159.x + -0.00001f);
    let _e165 = u_xlat6_;
    let _e168 = u_xlat3_;
    u_xlat3_.x = (-(_e165.x) + _e168.x);
    let _e172 = u_xlat6_;
    let _e175 = u_xlat1_;
    u_xlat6_.x = (-(_e172.x) + _e175.w);
    let _e181 = u_xlat3_;
    u_xlat3_.x = (1f / _e181.x);
    let _e185 = u_xlat3_;
    let _e187 = u_xlat6_;
    u_xlat3_.x = (_e185.x * _e187.x);
    let _e191 = u_xlat3_;
    u_xlat3_.x = clamp(_e191.x, 0f, 1f);
    let _e197 = u_xlat3_;
    u_xlat6_.x = ((_e197.x * -2f) + 3f);
    let _e205 = u_xlat3_;
    let _e207 = u_xlat3_;
    u_xlat3_.x = (_e205.x * _e207.x);
    let _e211 = u_xlat3_;
    let _e213 = u_xlat6_;
    u_xlat3_.x = (_e211.x * _e213.x);
    let _e217 = u_xlat0_;
    let _e219 = u_xlat3_;
    u_xlat0_.x = (_e217.x * _e219.x);
    let _e222 = u_xlat3_;
    let _e224 = u_xlat1_;
    let _e229 = _f_buffer1_.f_cb1_[2];
    let _e231 = (_e224.wxy + _e229.yyy);
    u_xlat3_.x = _e231.x;
    u_xlat3_.y = _e231.y;
    u_xlat3_.z = _e231.z;
    let _e238 = u_xlat1_;
    let _e243 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e238.w, _e243.y);
    let _e246 = u_xlat3_;
    let _e248 = u_xlat3_;
    let _e250 = u_xlat2_;
    let _e252 = (_e248.xyz * vec3(_e250));
    u_xlat3_.x = _e252.x;
    u_xlat3_.y = _e252.y;
    u_xlat3_.z = _e252.z;
    let _e259 = u_xlat1_;
    let _e261 = u_xlat3_;
    let _e266 = _f_buffer1_.f_cb1_[2];
    let _e268 = (_e261.xyz * _e266.xxx);
    u_xlat1_.x = _e268.x;
    u_xlat1_.y = _e268.y;
    u_xlat1_.z = _e268.z;
    let _e275 = u_xlat0_;
    let _e277 = u_xlat1_;
    u_xlat0_ = (_e275.xxxx * _e277);
    let _e279 = u_xlat0_;
    let _e280 = vs_COLOR0_1;
    SV_Target0_ = (_e279 * _e280);
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
