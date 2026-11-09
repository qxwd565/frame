struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 7>,
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
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat7_: f32 = 0f;

    let _e32 = u_xlat0_;
    let _e34 = vs_TEXCOORD0_1;
    let _e35 = _e34.zw;
    u_xlat0_.x = _e35.x;
    u_xlat0_.y = _e35.y;
    let _e40 = u_xlat0_;
    let _e42 = u_xlat0_;
    let _e48 = clamp(_e42.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e48.x;
    u_xlat0_.y = _e48.y;
    let _e53 = u_xlat0_;
    let _e55 = u_xlat0_;
    let _e57 = vs_TEXCOORD0_1;
    let _e60 = (_e55.xy + -(_e57.zw));
    u_xlat0_.x = _e60.x;
    u_xlat0_.y = _e60.y;
    let _e65 = u_xlat0_;
    let _e70 = _f_buffer1_.f_cb1_[6];
    let _e72 = u_xlat0_;
    let _e75 = vs_TEXCOORD0_1;
    let _e77 = ((_e70.xx * _e72.xy) + _e75.zw);
    u_xlat0_.x = _e77.x;
    u_xlat0_.y = _e77.y;
    let _e82 = u_xlat0_;
    let _e87 = _f_buffer0_.f_cb0_[4];
    let _e92 = hscard_bias.values[1];
    let _e95 = textureSampleBias(f_t1_, samplerf_s1_, _e82.xy, (_e87.x + _e92.x));
    u_xlat0_ = _e95;
    let _e96 = u_xlat0_;
    let _e98 = u_xlat0_;
    let _e109 = ((_e98.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e109.x;
    u_xlat0_.y = _e109.y;
    let _e114 = u_xlat0_;
    let _e116 = u_xlat0_;
    let _e121 = _f_buffer1_.f_cb1_[5];
    let _e124 = vs_TEXCOORD0_1;
    let _e126 = ((_e116.xy * _e121.zw) + _e124.xy);
    u_xlat0_.x = _e126.x;
    u_xlat0_.y = _e126.y;
    let _e131 = u_xlat4_;
    let _e133 = u_xlat0_;
    let _e134 = _e133.xy;
    u_xlat4_.x = _e134.x;
    u_xlat4_.y = _e134.y;
    let _e139 = u_xlat4_;
    let _e141 = u_xlat4_;
    let _e147 = clamp(_e141.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e147.x;
    u_xlat4_.y = _e147.y;
    let _e152 = u_xlat4_;
    let _e154 = u_xlat0_;
    let _e157 = u_xlat4_;
    let _e159 = (-(_e154.xy) + _e157.xy);
    u_xlat4_.x = _e159.x;
    u_xlat4_.y = _e159.y;
    let _e164 = u_xlat0_;
    let _e169 = _f_buffer1_.f_cb1_[3];
    let _e171 = u_xlat4_;
    let _e174 = u_xlat0_;
    let _e176 = ((_e169.zz * _e171.xy) + _e174.xy);
    u_xlat0_.x = _e176.x;
    u_xlat0_.y = _e176.y;
    let _e181 = u_xlat0_;
    let _e186 = _f_buffer0_.f_cb0_[4];
    let _e191 = hscard_bias.values[0];
    let _e194 = textureSampleBias(f_t0_, samplerf_s0_, _e181.xy, (_e186.x + _e191.x));
    u_xlat0_ = _e194;
    let _e195 = u_xlat1_;
    let _e197 = u_xlat0_;
    let _e202 = _f_buffer1_.f_cb1_[2];
    let _e204 = (_e197.xyz + _e202.yyy);
    u_xlat1_.x = _e204.x;
    u_xlat1_.y = _e204.y;
    u_xlat1_.z = _e204.z;
    let _e211 = u_xlat0_;
    let _e216 = _f_buffer1_.f_cb1_[3];
    u_xlat7_ = max(_e211.w, _e216.y);
    let _e219 = u_xlat1_;
    let _e221 = u_xlat7_;
    let _e223 = u_xlat1_;
    let _e225 = (vec3(_e221) * _e223.xyz);
    u_xlat1_.x = _e225.x;
    u_xlat1_.y = _e225.y;
    u_xlat1_.z = _e225.z;
    let _e232 = u_xlat0_;
    let _e234 = u_xlat1_;
    let _e239 = _f_buffer1_.f_cb1_[2];
    let _e241 = (_e234.xyz * _e239.xxx);
    u_xlat0_.x = _e241.x;
    u_xlat0_.y = _e241.y;
    u_xlat0_.z = _e241.z;
    let _e249 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e249;
    let _e251 = u_xlat1_;
    u_xlat1_.x = clamp(_e251.x, 0f, 1f);
    let _e256 = u_xlat1_;
    let _e258 = vs_COLOR0_1;
    u_xlat1_ = (_e256.xxxx * _e258);
    let _e260 = u_xlat0_;
    let _e261 = u_xlat1_;
    SV_Target0_ = (_e260 * _e261);
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
