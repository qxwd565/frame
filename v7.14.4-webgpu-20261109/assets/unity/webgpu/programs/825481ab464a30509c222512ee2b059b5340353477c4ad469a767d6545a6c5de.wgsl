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
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e38 = vs_TEXCOORD0_1;
    u_xlat0_ = _e38.zwxy;
    let _e40 = u_xlat0_;
    u_xlat0_ = clamp(_e40, vec4(0f), vec4(1f));
    let _e46 = u_xlat0_;
    let _e47 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e46 + -(_e47.zwxy));
    let _e51 = u_xlat0_;
    let _e56 = _f_buffer1_.f_cb1_[6];
    let _e58 = u_xlat0_;
    let _e61 = vs_TEXCOORD0_1;
    let _e63 = ((_e56.xx * _e58.xy) + _e61.zw);
    u_xlat0_.x = _e63.x;
    u_xlat0_.y = _e63.y;
    let _e68 = u_xlat6_;
    let _e73 = _f_buffer1_.f_cb1_[3];
    let _e75 = u_xlat0_;
    let _e78 = vs_TEXCOORD0_1;
    let _e80 = ((_e73.zz * _e75.zw) + _e78.xy);
    u_xlat6_.x = _e80.x;
    u_xlat6_.y = _e80.y;
    let _e85 = u_xlat6_;
    let _e90 = _f_buffer0_.f_cb0_[4];
    let _e95 = hscard_bias.values[0];
    let _e98 = textureSampleBias(f_t0_, samplerf_s0_, _e85.xy, (_e90.x + _e95.x));
    u_xlat1_ = _e98;
    let _e99 = u_xlat0_;
    let _e104 = _f_buffer0_.f_cb0_[4];
    let _e109 = hscard_bias.values[1];
    let _e112 = textureSampleBias(f_t1_, samplerf_s1_, _e99.xy, (_e104.x + _e109.x));
    u_xlat0_ = _e112;
    let _e114 = u_xlat0_;
    u_xlat0_.x = dot(_e114.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e122 = vs_TEXCOORD1_1;
    let _e126 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e122 + _e126.y);
    let _e130 = u_xlat3_;
    u_xlat3_.x = ((_e130.x * 2f) + -1f);
    let _e138 = u_xlat3_;
    let _e141 = u_xlat0_;
    u_xlat0_.x = (-(_e138.x) + _e141.x);
    let _e145 = u_xlat0_;
    u_xlat0_.x = clamp(_e145.x, 0f, 1f);
    let _e151 = u_xlat0_;
    u_xlat0_.x = log2(_e151.x);
    let _e158 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e158.z * 10f);
    let _e163 = u_xlat0_;
    let _e165 = u_xlat3_;
    u_xlat0_.x = (_e163.x * _e165.x);
    let _e169 = u_xlat0_;
    u_xlat0_.x = exp2(_e169.x);
    let _e172 = u_xlat3_;
    let _e174 = u_xlat1_;
    let _e179 = _f_buffer1_.f_cb1_[2];
    let _e181 = (_e174.xyz + _e179.yyy);
    u_xlat3_.x = _e181.x;
    u_xlat3_.y = _e181.y;
    u_xlat3_.z = _e181.z;
    let _e189 = u_xlat1_;
    let _e194 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e189.w, _e194.y);
    let _e197 = u_xlat3_;
    let _e199 = u_xlat3_;
    let _e201 = u_xlat2_;
    let _e203 = (_e199.xyz * _e201.xxx);
    u_xlat3_.x = _e203.x;
    u_xlat3_.y = _e203.y;
    u_xlat3_.z = _e203.z;
    let _e210 = u_xlat1_;
    let _e212 = u_xlat3_;
    let _e217 = _f_buffer1_.f_cb1_[2];
    let _e219 = (_e212.xyz * _e217.xxx);
    u_xlat1_.x = _e219.x;
    u_xlat1_.y = _e219.y;
    u_xlat1_.z = _e219.z;
    let _e226 = u_xlat0_;
    let _e228 = u_xlat1_;
    u_xlat2_ = (_e226.xxxx * _e228);
    let _e231 = u_xlat0_;
    u_xlat0_.x = (-(_e231.x) + 1f);
    let _e237 = u_xlat0_;
    u_xlat0_.x = log2(_e237.x);
    let _e241 = u_xlat0_;
    u_xlat0_.x = (_e241.x * 10f);
    let _e246 = u_xlat0_;
    u_xlat0_.x = exp2(_e246.x);
    let _e250 = u_xlat2_;
    u_xlat3_.x = (_e250.w * 1000000f);
    let _e255 = u_xlat3_;
    u_xlat3_.x = clamp(_e255.x, 0f, 1f);
    let _e261 = u_xlat1_;
    let _e263 = u_xlat3_;
    u_xlat3_.x = (_e261.w * _e263.x);
    let _e267 = u_xlat3_;
    let _e269 = u_xlat0_;
    u_xlat0_.x = (_e267.x * _e269.x);
    let _e272 = u_xlat3_;
    let _e277 = _f_buffer1_.f_cb1_[7];
    let _e282 = _f_buffer1_.f_cb1_[8];
    let _e284 = (_e277.xyz * _e282.xxx);
    u_xlat3_.x = _e284.x;
    u_xlat3_.y = _e284.y;
    u_xlat3_.z = _e284.z;
    let _e291 = u_xlat0_;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat3_;
    let _e297 = (_e293.xxx * _e295.xyz);
    u_xlat0_.x = _e297.x;
    u_xlat0_.y = _e297.y;
    u_xlat0_.z = _e297.z;
    let _e304 = u_xlat2_;
    let _e306 = u_xlat0_;
    let _e308 = vs_COLOR1_1;
    let _e311 = u_xlat2_;
    let _e313 = ((_e306.xyz * _e308.www) + _e311.xyz);
    u_xlat2_.x = _e313.x;
    u_xlat2_.y = _e313.y;
    u_xlat2_.z = _e313.z;
    let _e320 = u_xlat2_;
    let _e321 = vs_COLOR0_1;
    SV_Target0_ = (_e320 * _e321);
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
