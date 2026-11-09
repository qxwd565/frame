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
    u_xlat1_ = _e98.yzwx;
    let _e100 = u_xlat0_;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[1];
    let _e113 = textureSampleBias(f_t1_, samplerf_s1_, _e100.xy, (_e105.x + _e110.x));
    u_xlat0_ = _e113;
    let _e115 = u_xlat0_;
    u_xlat0_.x = (_e115.x + -1f);
    let _e124 = _f_buffer1_.f_cb1_[7];
    let _e126 = u_xlat0_;
    u_xlat0_.x = ((_e124.w * _e126.x) + 1f);
    let _e131 = vs_TEXCOORD1_1;
    let _e135 = _f_buffer1_.f_cb1_[12];
    u_xlat3_ = (_e131 + _e135.z);
    let _e138 = u_xlat3_;
    u_xlat3_ = clamp(_e138, 0f, 1f);
    let _e143 = vs_TEXCOORD1_1;
    let _e147 = _f_buffer1_.f_cb1_[12];
    u_xlat6_.x = (_e143 + -(_e147.z));
    let _e152 = u_xlat6_;
    u_xlat6_.x = clamp(_e152.x, 0f, 1f);
    let _e158 = u_xlat6_;
    u_xlat6_.x = (_e158.x + -0.00001f);
    let _e163 = u_xlat6_;
    let _e166 = u_xlat3_;
    u_xlat3_ = (-(_e163.x) + _e166);
    let _e169 = u_xlat6_;
    let _e172 = u_xlat1_;
    u_xlat6_.x = (-(_e169.x) + _e172.w);
    let _e177 = u_xlat3_;
    u_xlat3_ = (1f / _e177);
    let _e179 = u_xlat3_;
    let _e180 = u_xlat6_;
    u_xlat3_ = (_e179 * _e180.x);
    let _e183 = u_xlat3_;
    u_xlat3_ = clamp(_e183, 0f, 1f);
    let _e188 = u_xlat3_;
    u_xlat6_.x = ((_e188 * -2f) + 3f);
    let _e194 = u_xlat3_;
    let _e195 = u_xlat3_;
    u_xlat3_ = (_e194 * _e195);
    let _e197 = u_xlat3_;
    let _e198 = u_xlat6_;
    u_xlat3_ = (_e197 * _e198.x);
    let _e202 = u_xlat0_;
    let _e204 = u_xlat3_;
    u_xlat0_.x = (_e202.x * _e204);
    let _e206 = u_xlat1_;
    let _e211 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e206.w + _e211.y);
    let _e215 = u_xlat1_;
    let _e220 = _f_buffer1_.f_cb1_[3];
    u_xlat6_.x = max(_e215.w, _e220.y);
    let _e224 = u_xlat6_;
    let _e226 = u_xlat3_;
    u_xlat2_.x = (_e224.x * _e226);
    let _e232 = _f_buffer1_.f_cb1_[11];
    u_xlat2_.y = ((_e232.x * 0.03125f) + 0.015625f);
    let _e238 = u_xlat2_;
    let _e243 = _f_buffer0_.f_cb0_[4];
    let _e248 = hscard_bias.values[2];
    let _e251 = textureSampleBias(f_t2_, samplerf_s2_, _e238.xy, (_e243.x + _e248.x));
    u_xlat2_ = _e251;
    let _e252 = u_xlat1_;
    let _e254 = u_xlat2_;
    let _e259 = _f_buffer1_.f_cb1_[2];
    let _e261 = (_e254.xyz * _e259.xxx);
    u_xlat1_.x = _e261.x;
    u_xlat1_.y = _e261.y;
    u_xlat1_.z = _e261.z;
    let _e268 = u_xlat0_;
    let _e270 = u_xlat1_;
    u_xlat0_ = (_e268.xxxx * _e270);
    let _e272 = u_xlat0_;
    let _e273 = vs_COLOR0_1;
    SV_Target0_ = (_e272 * _e273);
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
