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
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

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
    let _e196 = u_xlat0_;
    u_xlat0_.w = dot(_e196.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e204 = u_xlat0_;
    let _e209 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e204.w + _e209.y);
    let _e212 = u_xlat0_;
    let _e217 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e212.w, _e217.y);
    let _e221 = u_xlat3_;
    let _e222 = u_xlat1_;
    u_xlat1_.x = (_e221 * _e222.x);
    let _e225 = u_xlat0_;
    let _e227 = u_xlat1_;
    let _e232 = _f_buffer1_.f_cb1_[2];
    let _e234 = (_e227.xxx * _e232.xxx);
    u_xlat0_.x = _e234.x;
    u_xlat0_.y = _e234.y;
    u_xlat0_.z = _e234.z;
    let _e242 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e242;
    let _e244 = u_xlat1_;
    u_xlat1_.x = clamp(_e244.x, 0f, 1f);
    let _e249 = u_xlat1_;
    let _e251 = vs_COLOR0_1;
    u_xlat1_ = (_e249.xxxx * _e251);
    let _e253 = u_xlat0_;
    let _e254 = u_xlat1_;
    SV_Target0_ = (_e253 * _e254);
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
