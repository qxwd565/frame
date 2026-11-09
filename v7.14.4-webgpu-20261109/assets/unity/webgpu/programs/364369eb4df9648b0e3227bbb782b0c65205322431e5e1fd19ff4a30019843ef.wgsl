struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 8>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;

    let _e42 = vs_TEXCOORD0_1;
    let _e47 = _f_buffer0_.f_cb0_[4];
    let _e52 = hscard_bias.values[1];
    let _e55 = textureSampleBias(f_t1_, samplerf_s1_, _e42.xy, (_e47.x + _e52.x));
    u_xlat0_ = _e55;
    let _e57 = u_xlat0_;
    u_xlat0_.y = (-(_e57.x) + 1f);
    let _e63 = u_xlat0_;
    let _e68 = _f_buffer1_.f_cb1_[6];
    u_xlat0_.x = (_e63.x + -(_e68.z));
    let _e72 = u_xlat0_;
    let _e74 = u_xlat0_;
    let _e79 = _f_buffer1_.f_cb1_[6];
    let _e81 = (_e74.xy + _e79.wz);
    u_xlat0_.x = _e81.x;
    u_xlat0_.y = _e81.y;
    let _e86 = u_xlat0_;
    let _e88 = u_xlat0_;
    let _e94 = clamp(_e88.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e94.x;
    u_xlat0_.y = _e94.y;
    let _e100 = u_xlat0_;
    u_xlat4_.x = log2(_e100.y);
    let _e104 = u_xlat4_;
    let _e109 = _f_buffer1_.f_cb1_[7];
    u_xlat4_.x = (_e104.x * _e109.x);
    let _e113 = u_xlat4_;
    u_xlat4_.x = exp2(_e113.x);
    let _e117 = u_xlat4_;
    u_xlat4_.x = (-(_e117.x) + 1f);
    let _e122 = vs_TEXCOORD0_1;
    let _e127 = _f_buffer0_.f_cb0_[4];
    let _e132 = hscard_bias.values[0];
    let _e135 = textureSampleBias(f_t0_, samplerf_s0_, _e122.zw, (_e127.x + _e132.x));
    u_xlat1_ = _e135;
    let _e136 = u_xlat1_;
    let _e141 = _f_buffer1_.f_cb1_[2];
    u_xlat8_ = (_e136.w * _e141.w);
    let _e145 = u_xlat8_;
    let _e146 = u_xlat4_;
    u_xlat2_.w = (_e145 * _e146.x);
    let _e149 = vs_TEXCOORD1_1;
    let _e154 = _f_buffer0_.f_cb0_[4];
    let _e159 = hscard_bias.values[2];
    let _e162 = textureSampleBias(f_t2_, samplerf_s2_, _e149.xy, (_e154.x + _e159.x));
    u_xlat3_ = _e162;
    let _e163 = u_xlat4_;
    let _e168 = _f_buffer1_.f_cb1_[3];
    let _e173 = _f_buffer1_.f_cb1_[6];
    let _e175 = (_e168.xyz * _e173.yyy);
    u_xlat4_.x = _e175.x;
    u_xlat4_.y = _e175.y;
    u_xlat4_.z = _e175.z;
    let _e182 = u_xlat4_;
    let _e184 = u_xlat3_;
    let _e186 = u_xlat4_;
    let _e188 = (_e184.xxx * _e186.xyz);
    u_xlat4_.x = _e188.x;
    u_xlat4_.y = _e188.y;
    u_xlat4_.z = _e188.z;
    let _e195 = u_xlat1_;
    let _e197 = u_xlat1_;
    let _e202 = _f_buffer1_.f_cb1_[2];
    let _e205 = u_xlat4_;
    let _e208 = ((_e197.xyz * _e202.xyz) + -(_e205.xyz));
    u_xlat1_.x = _e208.x;
    u_xlat1_.y = _e208.y;
    u_xlat1_.z = _e208.z;
    let _e215 = u_xlat2_;
    let _e217 = u_xlat0_;
    let _e219 = u_xlat1_;
    let _e222 = u_xlat4_;
    let _e224 = ((_e217.xxx * _e219.xyz) + _e222.xyz);
    u_xlat2_.x = _e224.x;
    u_xlat2_.y = _e224.y;
    u_xlat2_.z = _e224.z;
    let _e231 = u_xlat2_;
    let _e232 = vs_COLOR0_1;
    SV_TARGET0_ = (_e231 * _e232);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e36 = SV_TARGET0_;
    return FragmentOutput(_e36);
}
