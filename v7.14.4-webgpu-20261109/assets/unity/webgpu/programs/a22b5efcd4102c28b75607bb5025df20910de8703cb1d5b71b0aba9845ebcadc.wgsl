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
    let _e100 = u_xlat1_;
    u_xlat1_.y = dot(_e100.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e107 = u_xlat0_;
    let _e112 = _f_buffer0_.f_cb0_[4];
    let _e117 = hscard_bias.values[1];
    let _e120 = textureSampleBias(f_t1_, samplerf_s1_, _e107.xy, (_e112.x + _e117.x));
    u_xlat0_ = _e120;
    let _e122 = u_xlat0_;
    u_xlat0_.x = dot(_e122.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e130 = vs_TEXCOORD1_1;
    let _e134 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e130 + _e134.y);
    let _e138 = u_xlat3_;
    u_xlat3_.x = ((_e138.x * 2f) + -1f);
    let _e146 = u_xlat3_;
    let _e149 = u_xlat0_;
    u_xlat0_.x = (-(_e146.x) + _e149.x);
    let _e153 = u_xlat0_;
    u_xlat0_.x = clamp(_e153.x, 0f, 1f);
    let _e159 = u_xlat0_;
    u_xlat0_.x = log2(_e159.x);
    let _e166 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e166.z * 10f);
    let _e171 = u_xlat0_;
    let _e173 = u_xlat3_;
    u_xlat0_.x = (_e171.x * _e173.x);
    let _e177 = u_xlat0_;
    u_xlat0_.x = exp2(_e177.x);
    let _e181 = u_xlat1_;
    let _e186 = _f_buffer1_.f_cb1_[2];
    u_xlat3_.x = (_e181.y + _e186.y);
    let _e190 = u_xlat1_;
    let _e195 = _f_buffer1_.f_cb1_[3];
    u_xlat6_.x = max(_e190.y, _e195.y);
    let _e199 = u_xlat6_;
    let _e201 = u_xlat3_;
    u_xlat3_.x = (_e199.x * _e201.x);
    let _e205 = u_xlat3_;
    let _e210 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e205.x * _e210.x);
    let _e213 = u_xlat2_;
    let _e215 = u_xlat0_;
    let _e217 = u_xlat1_;
    let _e219 = (_e215.xx * _e217.xy);
    u_xlat2_.x = _e219.x;
    u_xlat2_.w = _e219.y;
    let _e225 = u_xlat0_;
    u_xlat0_.x = (-(_e225.x) + 1f);
    let _e231 = u_xlat0_;
    u_xlat0_.x = log2(_e231.x);
    let _e235 = u_xlat0_;
    u_xlat0_.x = (_e235.x * 10f);
    let _e240 = u_xlat0_;
    u_xlat0_.x = exp2(_e240.x);
    let _e244 = u_xlat2_;
    u_xlat3_.x = (_e244.w * 1000000f);
    let _e249 = u_xlat3_;
    u_xlat3_.x = clamp(_e249.x, 0f, 1f);
    let _e255 = u_xlat1_;
    let _e257 = u_xlat3_;
    u_xlat3_.x = (_e255.y * _e257.x);
    let _e261 = u_xlat3_;
    let _e263 = u_xlat0_;
    u_xlat0_.x = (_e261.x * _e263.x);
    let _e266 = u_xlat3_;
    let _e271 = _f_buffer1_.f_cb1_[7];
    let _e276 = _f_buffer1_.f_cb1_[8];
    let _e278 = (_e271.xyz * _e276.xxx);
    u_xlat3_.x = _e278.x;
    u_xlat3_.y = _e278.y;
    u_xlat3_.z = _e278.z;
    let _e285 = u_xlat0_;
    let _e287 = u_xlat0_;
    let _e289 = u_xlat3_;
    let _e291 = (_e287.xxx * _e289.xyz);
    u_xlat0_.x = _e291.x;
    u_xlat0_.y = _e291.y;
    u_xlat0_.z = _e291.z;
    let _e298 = u_xlat2_;
    let _e300 = u_xlat0_;
    let _e302 = vs_COLOR1_1;
    let _e305 = u_xlat2_;
    let _e307 = ((_e300.xyz * _e302.www) + _e305.xxx);
    u_xlat2_.x = _e307.x;
    u_xlat2_.y = _e307.y;
    u_xlat2_.z = _e307.z;
    let _e314 = u_xlat2_;
    let _e315 = vs_COLOR0_1;
    SV_Target0_ = (_e314 * _e315);
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
