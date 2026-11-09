struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 4>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD6_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat12_: f32 = 0f;

    let _e42 = vs_TEXCOORD0_1;
    let _e47 = _f_buffer0_.f_cb0_[4];
    let _e52 = hscard_bias.values[0];
    let _e55 = textureSampleBias(f_t0_, samplerf_s0_, _e42.xy, (_e47.x + _e52.x));
    u_xlat0_ = _e55;
    let _e57 = vs_TEXCOORD0_1;
    let _e59 = dpdx(_e57.x);
    u_xlat1_.x = _e59;
    let _e60 = vs_TEXCOORD0_1;
    let _e62 = dpdy(_e60.x);
    u_xlat5_ = _e62;
    let _e64 = u_xlat5_;
    let _e66 = u_xlat1_;
    u_xlat1_.x = (abs(_e64) + abs(_e66.x));
    let _e70 = u_xlat1_;
    let _e72 = u_xlat1_;
    let _e78 = (_e72.xx * vec2<f32>(0.5f, -0.5f));
    u_xlat1_.x = _e78.x;
    u_xlat1_.y = _e78.y;
    u_xlat1_.z = 0f;
    let _e85 = u_xlat1_;
    let _e87 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e85.xzyz + _e87.xyxy);
    let _e90 = u_xlat1_;
    let _e92 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e90.zxzy + _e92.xyxy);
    let _e95 = u_xlat2_;
    let _e100 = _f_buffer0_.f_cb0_[4];
    let _e105 = hscard_bias.values[0];
    let _e108 = textureSampleBias(f_t0_, samplerf_s0_, _e95.xy, (_e100.x + _e105.x));
    u_xlat3_ = _e108;
    let _e109 = u_xlat2_;
    let _e114 = _f_buffer0_.f_cb0_[4];
    let _e119 = hscard_bias.values[0];
    let _e122 = textureSampleBias(f_t0_, samplerf_s0_, _e109.zw, (_e114.x + _e119.x));
    u_xlat2_ = _e122;
    let _e123 = u_xlat0_;
    let _e124 = u_xlat3_;
    u_xlat0_ = (_e123 + _e124);
    let _e126 = u_xlat2_;
    let _e127 = u_xlat0_;
    u_xlat0_ = (_e126 + _e127);
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer0_.f_cb0_[4];
    let _e139 = hscard_bias.values[0];
    let _e142 = textureSampleBias(f_t0_, samplerf_s0_, _e129.xy, (_e134.x + _e139.x));
    u_xlat2_ = _e142;
    let _e143 = u_xlat1_;
    let _e148 = _f_buffer0_.f_cb0_[4];
    let _e153 = hscard_bias.values[0];
    let _e156 = textureSampleBias(f_t0_, samplerf_s0_, _e143.zw, (_e148.x + _e153.x));
    u_xlat1_ = _e156;
    let _e157 = u_xlat0_;
    let _e158 = u_xlat2_;
    u_xlat0_ = (_e157 + _e158);
    let _e160 = u_xlat1_;
    let _e161 = u_xlat0_;
    u_xlat0_ = (_e160 + _e161);
    let _e163 = vs_TEXCOORD5_1;
    let _e168 = _f_buffer0_.f_cb0_[4];
    let _e173 = hscard_bias.values[1];
    let _e176 = textureSampleBias(f_t1_, samplerf_s1_, _e163.xy, (_e168.x + _e173.x));
    u_xlat1_ = _e176;
    let _e177 = u_xlat0_;
    let _e179 = u_xlat0_;
    let _e186 = u_xlat1_;
    let _e189 = ((_e179.xyz * vec3<f32>(0.2f, 0.2f, 0.2f)) + -(_e186.xyz));
    u_xlat0_.x = _e189.x;
    u_xlat0_.y = _e189.y;
    u_xlat0_.z = _e189.z;
    let _e196 = u_xlat0_;
    u_xlat12_ = (_e196.w * 0.2f);
    let _e200 = u_xlat0_;
    let _e202 = u_xlat12_;
    let _e204 = u_xlat0_;
    let _e207 = u_xlat1_;
    let _e209 = ((vec3(_e202) * _e204.xyz) + _e207.xyz);
    u_xlat0_.x = _e209.x;
    u_xlat0_.y = _e209.y;
    u_xlat0_.z = _e209.z;
    let _e217 = u_xlat12_;
    SV_Target0_.w = _e217;
    let _e218 = vs_TEXCOORD6_1;
    let _e223 = _f_buffer0_.f_cb0_[4];
    let _e228 = hscard_bias.values[2];
    let _e231 = textureSampleBias(f_t2_, samplerf_s2_, _e218.xy, (_e223.x + _e228.x));
    u_xlat1_ = _e231;
    let _e232 = u_xlat1_;
    u_xlat12_ = (_e232.x + -1f);
    let _e240 = _f_buffer1_.f_cb1_[3];
    let _e242 = u_xlat12_;
    u_xlat12_ = ((_e240.x * _e242) + 1f);
    let _e246 = u_xlat0_;
    let _e248 = u_xlat12_;
    let _e250 = u_xlat0_;
    let _e252 = (vec3(_e248) * _e250.xyz);
    u_xlat0_.x = _e252.x;
    u_xlat0_.y = _e252.y;
    u_xlat0_.z = _e252.z;
    let _e259 = SV_Target0_;
    let _e261 = u_xlat0_;
    let _e263 = vs_COLOR0_1;
    let _e265 = (_e261.xyz * _e263.xyz);
    SV_Target0_.x = _e265.x;
    SV_Target0_.y = _e265.y;
    SV_Target0_.z = _e265.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(6) vs_TEXCOORD6_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
