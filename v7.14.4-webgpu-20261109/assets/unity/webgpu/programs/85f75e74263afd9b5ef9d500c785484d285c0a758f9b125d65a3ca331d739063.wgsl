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
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat5_: f32 = 0f;

    let _e37 = u_xlat0_;
    let _e39 = vs_TEXCOORD0_1;
    let _e40 = _e39.zw;
    u_xlat0_.x = _e40.x;
    u_xlat0_.y = _e40.y;
    let _e45 = u_xlat0_;
    let _e47 = u_xlat0_;
    let _e53 = clamp(_e47.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e53.x;
    u_xlat0_.y = _e53.y;
    let _e58 = u_xlat0_;
    let _e60 = u_xlat0_;
    let _e62 = vs_TEXCOORD0_1;
    let _e65 = (_e60.xy + -(_e62.zw));
    u_xlat0_.x = _e65.x;
    u_xlat0_.y = _e65.y;
    let _e70 = u_xlat0_;
    let _e75 = _f_buffer1_.f_cb1_[6];
    let _e77 = u_xlat0_;
    let _e80 = vs_TEXCOORD0_1;
    let _e82 = ((_e75.xx * _e77.xy) + _e80.zw);
    u_xlat0_.x = _e82.x;
    u_xlat0_.y = _e82.y;
    let _e87 = u_xlat0_;
    let _e92 = _f_buffer0_.f_cb0_[4];
    let _e97 = hscard_bias.values[1];
    let _e100 = textureSampleBias(f_t1_, samplerf_s1_, _e87.xy, (_e92.x + _e97.x));
    u_xlat0_ = _e100;
    let _e101 = u_xlat0_;
    let _e103 = u_xlat0_;
    let _e114 = ((_e103.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e114.x;
    u_xlat0_.y = _e114.y;
    let _e119 = u_xlat0_;
    let _e121 = u_xlat0_;
    let _e126 = _f_buffer1_.f_cb1_[5];
    let _e129 = vs_TEXCOORD0_1;
    let _e131 = ((_e121.xy * _e126.zw) + _e129.xy);
    u_xlat0_.x = _e131.x;
    u_xlat0_.y = _e131.y;
    let _e136 = u_xlat4_;
    let _e138 = u_xlat0_;
    let _e139 = _e138.xy;
    u_xlat4_.x = _e139.x;
    u_xlat4_.y = _e139.y;
    let _e144 = u_xlat4_;
    let _e146 = u_xlat4_;
    let _e152 = clamp(_e146.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e152.x;
    u_xlat4_.y = _e152.y;
    let _e157 = u_xlat4_;
    let _e159 = u_xlat0_;
    let _e162 = u_xlat4_;
    let _e164 = (-(_e159.xy) + _e162.xy);
    u_xlat4_.x = _e164.x;
    u_xlat4_.y = _e164.y;
    let _e169 = u_xlat0_;
    let _e174 = _f_buffer1_.f_cb1_[3];
    let _e176 = u_xlat4_;
    let _e179 = u_xlat0_;
    let _e181 = ((_e174.zz * _e176.xy) + _e179.xy);
    u_xlat0_.x = _e181.x;
    u_xlat0_.y = _e181.y;
    let _e186 = u_xlat0_;
    let _e191 = _f_buffer0_.f_cb0_[4];
    let _e196 = hscard_bias.values[0];
    let _e199 = textureSampleBias(f_t0_, samplerf_s0_, _e186.xy, (_e191.x + _e196.x));
    u_xlat0_ = _e199;
    let _e201 = u_xlat0_;
    u_xlat0_.w = dot(_e201.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e209 = u_xlat0_;
    let _e214 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e209.w + _e214.y);
    let _e217 = u_xlat0_;
    let _e222 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e217.w, _e222.y);
    let _e226 = u_xlat3_;
    let _e227 = u_xlat1_;
    u_xlat1_.x = (_e226 * _e227.x);
    let _e234 = _f_buffer1_.f_cb1_[11];
    u_xlat1_.y = ((_e234.x * 0.03125f) + 0.015625f);
    let _e240 = u_xlat1_;
    let _e245 = _f_buffer0_.f_cb0_[4];
    let _e250 = hscard_bias.values[2];
    let _e253 = textureSampleBias(f_t2_, samplerf_s2_, _e240.xy, (_e245.x + _e250.x));
    u_xlat1_ = _e253;
    let _e254 = u_xlat0_;
    let _e256 = u_xlat1_;
    let _e261 = _f_buffer1_.f_cb1_[2];
    let _e263 = (_e256.xyz * _e261.xxx);
    u_xlat0_.x = _e263.x;
    u_xlat0_.y = _e263.y;
    u_xlat0_.z = _e263.z;
    let _e271 = vs_TEXCOORD1_1;
    let _e275 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e271 + -(_e275.z));
    let _e280 = u_xlat1_;
    u_xlat1_.x = clamp(_e280.x, 0f, 1f);
    let _e286 = u_xlat1_;
    u_xlat1_.x = (_e286.x + -0.00001f);
    let _e291 = u_xlat0_;
    let _e293 = u_xlat1_;
    u_xlat3_ = (_e291.w + -(_e293.x));
    let _e297 = vs_TEXCOORD1_1;
    let _e301 = _f_buffer1_.f_cb1_[12];
    u_xlat5_ = (_e297 + _e301.z);
    let _e304 = u_xlat5_;
    u_xlat5_ = clamp(_e304, 0f, 1f);
    let _e309 = u_xlat1_;
    let _e312 = u_xlat5_;
    u_xlat1_.x = (-(_e309.x) + _e312);
    let _e317 = u_xlat1_;
    u_xlat1_.x = (1f / _e317.x);
    let _e321 = u_xlat1_;
    let _e323 = u_xlat3_;
    u_xlat1_.x = (_e321.x * _e323);
    let _e326 = u_xlat1_;
    u_xlat1_.x = clamp(_e326.x, 0f, 1f);
    let _e331 = u_xlat1_;
    u_xlat3_ = ((_e331.x * -2f) + 3f);
    let _e339 = u_xlat1_;
    let _e341 = u_xlat1_;
    u_xlat1_.x = (_e339.x * _e341.x);
    let _e345 = u_xlat1_;
    let _e347 = u_xlat3_;
    u_xlat1_.x = (_e345.x * _e347);
    let _e349 = u_xlat0_;
    let _e350 = u_xlat1_;
    u_xlat0_ = (_e349 * _e350.xxxx);
    let _e353 = u_xlat0_;
    let _e354 = vs_COLOR0_1;
    SV_Target0_ = (_e353 * _e354);
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
