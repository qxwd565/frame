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
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: f32 = 0f;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e40 = vs_TEXCOORD0_1;
    u_xlat0_ = _e40.zwxy;
    let _e42 = u_xlat0_;
    u_xlat0_ = clamp(_e42, vec4(0f), vec4(1f));
    let _e48 = u_xlat0_;
    let _e49 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e48 + -(_e49.zwxy));
    let _e53 = u_xlat0_;
    let _e58 = _f_buffer1_.f_cb1_[6];
    let _e60 = u_xlat0_;
    let _e63 = vs_TEXCOORD0_1;
    let _e65 = ((_e58.xx * _e60.xy) + _e63.zw);
    u_xlat0_.x = _e65.x;
    u_xlat0_.y = _e65.y;
    let _e70 = u_xlat8_;
    let _e75 = _f_buffer1_.f_cb1_[3];
    let _e77 = u_xlat0_;
    let _e80 = vs_TEXCOORD0_1;
    let _e82 = ((_e75.zz * _e77.zw) + _e80.xy);
    u_xlat8_.x = _e82.x;
    u_xlat8_.y = _e82.y;
    let _e87 = u_xlat8_;
    let _e92 = _f_buffer0_.f_cb0_[4];
    let _e97 = hscard_bias.values[0];
    let _e100 = textureSampleBias(f_t0_, samplerf_s0_, _e87.xy, (_e92.x + _e97.x));
    u_xlat1_ = _e100.yzwx;
    let _e102 = u_xlat0_;
    let _e107 = _f_buffer0_.f_cb0_[4];
    let _e112 = hscard_bias.values[1];
    let _e115 = textureSampleBias(f_t1_, samplerf_s1_, _e102.xy, (_e107.x + _e112.x));
    u_xlat0_ = _e115;
    let _e117 = u_xlat0_;
    u_xlat0_.x = dot(_e117.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e124 = u_xlat0_;
    let _e126 = vs_COLOR1_1;
    u_xlat0_ = (_e124.xxxx * _e126);
    let _e128 = vs_TEXCOORD1_1;
    let _e132 = _f_buffer1_.f_cb1_[12];
    u_xlat2_ = (_e128 + _e132.z);
    let _e135 = u_xlat2_;
    u_xlat2_ = clamp(_e135, 0f, 1f);
    let _e140 = vs_TEXCOORD1_1;
    let _e144 = _f_buffer1_.f_cb1_[12];
    u_xlat6_.x = (_e140 + -(_e144.z));
    let _e149 = u_xlat6_;
    u_xlat6_.x = clamp(_e149.x, 0f, 1f);
    let _e155 = u_xlat6_;
    u_xlat6_.x = (_e155.x + -0.00001f);
    let _e160 = u_xlat6_;
    let _e163 = u_xlat2_;
    u_xlat2_ = (-(_e160.x) + _e163);
    let _e166 = u_xlat1_;
    let _e168 = u_xlat6_;
    u_xlat6_.x = (_e166.w + -(_e168.x));
    let _e174 = u_xlat2_;
    u_xlat2_ = (1f / _e174);
    let _e176 = u_xlat2_;
    let _e177 = u_xlat6_;
    u_xlat2_ = (_e176 * _e177.x);
    let _e180 = u_xlat2_;
    u_xlat2_ = clamp(_e180, 0f, 1f);
    let _e185 = u_xlat2_;
    u_xlat6_.x = ((_e185 * -2f) + 3f);
    let _e191 = u_xlat2_;
    let _e192 = u_xlat2_;
    u_xlat2_ = (_e191 * _e192);
    let _e194 = u_xlat2_;
    let _e195 = u_xlat6_;
    u_xlat2_ = (_e194 * _e195.x);
    let _e198 = u_xlat6_;
    let _e200 = u_xlat1_;
    let _e205 = _f_buffer1_.f_cb1_[2];
    let _e207 = (_e200.wxy + _e205.yyy);
    u_xlat6_.x = _e207.x;
    u_xlat6_.y = _e207.y;
    u_xlat6_.z = _e207.z;
    let _e214 = u_xlat1_;
    let _e219 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e214.w, _e219.y);
    let _e222 = u_xlat6_;
    let _e224 = u_xlat6_;
    let _e226 = u_xlat3_;
    let _e228 = (_e224.xyz * vec3(_e226));
    u_xlat6_.x = _e228.x;
    u_xlat6_.y = _e228.y;
    u_xlat6_.z = _e228.z;
    let _e235 = u_xlat1_;
    let _e237 = u_xlat6_;
    let _e242 = _f_buffer1_.f_cb1_[2];
    let _e244 = (_e237.xyz * _e242.xxx);
    u_xlat1_.x = _e244.x;
    u_xlat1_.y = _e244.y;
    u_xlat1_.z = _e244.z;
    let _e251 = u_xlat1_;
    let _e252 = u_xlat2_;
    let _e255 = u_xlat0_;
    u_xlat0_ = ((_e251 * vec4(_e252)) + _e255);
    let _e257 = u_xlat0_;
    let _e258 = vs_COLOR0_1;
    SV_Target0_ = (_e257 * _e258);
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
