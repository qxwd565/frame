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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
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
    u_xlat0_.x = (_e114.x + -1f);
    let _e123 = _f_buffer1_.f_cb1_[7];
    let _e125 = u_xlat0_;
    u_xlat0_.x = ((_e123.w * _e125.x) + 1f);
    let _e130 = vs_TEXCOORD1_1;
    let _e134 = _f_buffer1_.f_cb1_[12];
    u_xlat3_ = (_e130 + _e134.z);
    let _e137 = u_xlat3_;
    u_xlat3_ = clamp(_e137, 0f, 1f);
    let _e142 = vs_TEXCOORD1_1;
    let _e146 = _f_buffer1_.f_cb1_[12];
    u_xlat6_.x = (_e142 + -(_e146.z));
    let _e151 = u_xlat6_;
    u_xlat6_.x = clamp(_e151.x, 0f, 1f);
    let _e157 = u_xlat6_;
    u_xlat6_.x = (_e157.x + -0.00001f);
    let _e162 = u_xlat6_;
    let _e165 = u_xlat3_;
    u_xlat3_ = (-(_e162.x) + _e165);
    let _e168 = u_xlat6_;
    let _e171 = u_xlat1_;
    u_xlat6_.x = (-(_e168.x) + _e171.w);
    let _e176 = u_xlat3_;
    u_xlat3_ = (1f / _e176);
    let _e178 = u_xlat3_;
    let _e179 = u_xlat6_;
    u_xlat3_ = (_e178 * _e179.x);
    let _e182 = u_xlat3_;
    u_xlat3_ = clamp(_e182, 0f, 1f);
    let _e187 = u_xlat3_;
    u_xlat6_.x = ((_e187 * -2f) + 3f);
    let _e193 = u_xlat3_;
    let _e194 = u_xlat3_;
    u_xlat3_ = (_e193 * _e194);
    let _e196 = u_xlat3_;
    let _e197 = u_xlat6_;
    u_xlat3_ = (_e196 * _e197.x);
    let _e201 = u_xlat0_;
    let _e203 = u_xlat3_;
    u_xlat0_.x = (_e201.x * _e203);
    let _e205 = u_xlat1_;
    let _e210 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e205.x + _e210.y);
    let _e214 = u_xlat1_;
    let _e219 = _f_buffer1_.f_cb1_[3];
    u_xlat6_.x = max(_e214.w, _e219.y);
    let _e223 = u_xlat6_;
    let _e225 = u_xlat3_;
    u_xlat2_.x = (_e223.x * _e225);
    let _e231 = _f_buffer1_.f_cb1_[11];
    u_xlat2_.y = ((_e231.x * 0.03125f) + 0.015625f);
    let _e237 = u_xlat2_;
    let _e242 = _f_buffer0_.f_cb0_[4];
    let _e247 = hscard_bias.values[2];
    let _e250 = textureSampleBias(f_t2_, samplerf_s2_, _e237.xy, (_e242.x + _e247.x));
    u_xlat2_ = _e250;
    let _e251 = u_xlat1_;
    let _e253 = u_xlat2_;
    let _e258 = _f_buffer1_.f_cb1_[2];
    let _e260 = (_e253.xyz * _e258.xxx);
    u_xlat1_.x = _e260.x;
    u_xlat1_.y = _e260.y;
    u_xlat1_.z = _e260.z;
    let _e267 = u_xlat0_;
    let _e269 = u_xlat1_;
    u_xlat0_ = (_e267.xxxx * _e269);
    let _e271 = u_xlat0_;
    let _e272 = vs_COLOR0_1;
    SV_Target0_ = (_e271 * _e272);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
