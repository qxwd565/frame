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

    let _e35 = vs_TEXCOORD1_1;
    let _e39 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e35 + _e39.y);
    let _e43 = u_xlat0_;
    u_xlat0_.x = ((_e43.x * 2f) + -1f);
    let _e50 = vs_TEXCOORD0_1;
    u_xlat1_ = _e50.zwxy;
    let _e52 = u_xlat1_;
    u_xlat1_ = clamp(_e52, vec4(0f), vec4(1f));
    let _e58 = u_xlat1_;
    let _e59 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e58 + -(_e59.zwxy));
    let _e63 = u_xlat3_;
    let _e68 = _f_buffer1_.f_cb1_[6];
    let _e70 = u_xlat1_;
    let _e73 = vs_TEXCOORD0_1;
    let _e75 = ((_e68.xx * _e70.xy) + _e73.zw);
    u_xlat3_.x = _e75.x;
    u_xlat3_.y = _e75.y;
    let _e80 = u_xlat1_;
    let _e85 = _f_buffer1_.f_cb1_[3];
    let _e87 = u_xlat1_;
    let _e90 = vs_TEXCOORD0_1;
    let _e92 = ((_e85.zz * _e87.zw) + _e90.xy);
    u_xlat1_.x = _e92.x;
    u_xlat1_.y = _e92.y;
    let _e97 = u_xlat1_;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[0];
    let _e110 = textureSampleBias(f_t0_, samplerf_s0_, _e97.xy, (_e102.x + _e107.x));
    u_xlat1_ = _e110;
    let _e111 = u_xlat3_;
    let _e116 = _f_buffer0_.f_cb0_[4];
    let _e121 = hscard_bias.values[1];
    let _e124 = textureSampleBias(f_t1_, samplerf_s1_, _e111.xy, (_e116.x + _e121.x));
    u_xlat2_ = _e124;
    let _e126 = u_xlat0_;
    let _e129 = u_xlat2_;
    u_xlat0_.x = (-(_e126.x) + _e129.w);
    let _e133 = u_xlat0_;
    u_xlat0_.x = clamp(_e133.x, 0f, 1f);
    let _e139 = u_xlat0_;
    u_xlat0_.x = log2(_e139.x);
    let _e146 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e146.z * 10f);
    let _e151 = u_xlat0_;
    let _e153 = u_xlat3_;
    u_xlat0_.x = (_e151.x * _e153.x);
    let _e157 = u_xlat0_;
    u_xlat0_.x = exp2(_e157.x);
    let _e160 = u_xlat3_;
    let _e162 = u_xlat1_;
    let _e167 = _f_buffer1_.f_cb1_[2];
    let _e169 = (_e162.xyz + _e167.yyy);
    u_xlat3_.x = _e169.x;
    u_xlat3_.y = _e169.y;
    u_xlat3_.z = _e169.z;
    let _e177 = u_xlat1_;
    let _e182 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e177.w, _e182.y);
    let _e185 = u_xlat3_;
    let _e187 = u_xlat3_;
    let _e189 = u_xlat2_;
    let _e191 = (_e187.xyz * _e189.xxx);
    u_xlat3_.x = _e191.x;
    u_xlat3_.y = _e191.y;
    u_xlat3_.z = _e191.z;
    let _e198 = u_xlat1_;
    let _e200 = u_xlat3_;
    let _e205 = _f_buffer1_.f_cb1_[2];
    let _e207 = (_e200.xyz * _e205.xxx);
    u_xlat1_.x = _e207.x;
    u_xlat1_.y = _e207.y;
    u_xlat1_.z = _e207.z;
    let _e214 = u_xlat0_;
    let _e216 = u_xlat1_;
    u_xlat2_ = (_e214.xxxx * _e216);
    let _e219 = u_xlat0_;
    u_xlat0_.x = (-(_e219.x) + 1f);
    let _e225 = u_xlat0_;
    u_xlat0_.x = log2(_e225.x);
    let _e229 = u_xlat0_;
    u_xlat0_.x = (_e229.x * 10f);
    let _e234 = u_xlat0_;
    u_xlat0_.x = exp2(_e234.x);
    let _e238 = u_xlat2_;
    u_xlat3_.x = (_e238.w * 1000000f);
    let _e243 = u_xlat3_;
    u_xlat3_.x = clamp(_e243.x, 0f, 1f);
    let _e249 = u_xlat1_;
    let _e251 = u_xlat3_;
    u_xlat3_.x = (_e249.w * _e251.x);
    let _e255 = u_xlat3_;
    let _e257 = u_xlat0_;
    u_xlat0_.x = (_e255.x * _e257.x);
    let _e260 = u_xlat3_;
    let _e265 = _f_buffer1_.f_cb1_[7];
    let _e270 = _f_buffer1_.f_cb1_[8];
    let _e272 = (_e265.xyz * _e270.xxx);
    u_xlat3_.x = _e272.x;
    u_xlat3_.y = _e272.y;
    u_xlat3_.z = _e272.z;
    let _e279 = u_xlat0_;
    let _e281 = u_xlat0_;
    let _e283 = u_xlat3_;
    let _e285 = (_e281.xxx * _e283.xyz);
    u_xlat0_.x = _e285.x;
    u_xlat0_.y = _e285.y;
    u_xlat0_.z = _e285.z;
    let _e292 = u_xlat2_;
    let _e294 = u_xlat0_;
    let _e296 = vs_COLOR1_1;
    let _e299 = u_xlat2_;
    let _e301 = ((_e294.xyz * _e296.www) + _e299.xyz);
    u_xlat2_.x = _e301.x;
    u_xlat2_.y = _e301.y;
    u_xlat2_.z = _e301.z;
    let _e308 = u_xlat2_;
    let _e309 = vs_COLOR0_1;
    SV_Target0_ = (_e308 * _e309);
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
