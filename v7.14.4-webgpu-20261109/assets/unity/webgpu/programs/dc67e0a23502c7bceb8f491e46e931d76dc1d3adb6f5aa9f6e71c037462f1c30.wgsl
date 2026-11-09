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
    u_xlat0_ = _e199.yzwx;
    let _e202 = u_xlat0_;
    let _e207 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e202.w + _e207.y);
    let _e210 = u_xlat0_;
    let _e215 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e210.w, _e215.y);
    let _e219 = u_xlat3_;
    let _e220 = u_xlat1_;
    u_xlat1_.x = (_e219 * _e220.x);
    let _e227 = _f_buffer1_.f_cb1_[11];
    u_xlat1_.y = ((_e227.x * 0.03125f) + 0.015625f);
    let _e233 = u_xlat1_;
    let _e238 = _f_buffer0_.f_cb0_[4];
    let _e243 = hscard_bias.values[2];
    let _e246 = textureSampleBias(f_t2_, samplerf_s2_, _e233.xy, (_e238.x + _e243.x));
    u_xlat1_ = _e246;
    let _e247 = u_xlat0_;
    let _e249 = u_xlat1_;
    let _e254 = _f_buffer1_.f_cb1_[2];
    let _e256 = (_e249.xyz * _e254.xxx);
    u_xlat0_.x = _e256.x;
    u_xlat0_.y = _e256.y;
    u_xlat0_.z = _e256.z;
    let _e264 = vs_TEXCOORD1_1;
    let _e268 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e264 + -(_e268.z));
    let _e273 = u_xlat1_;
    u_xlat1_.x = clamp(_e273.x, 0f, 1f);
    let _e279 = u_xlat1_;
    u_xlat1_.x = (_e279.x + -0.00001f);
    let _e284 = u_xlat0_;
    let _e286 = u_xlat1_;
    u_xlat3_ = (_e284.w + -(_e286.x));
    let _e290 = vs_TEXCOORD1_1;
    let _e294 = _f_buffer1_.f_cb1_[12];
    u_xlat5_ = (_e290 + _e294.z);
    let _e297 = u_xlat5_;
    u_xlat5_ = clamp(_e297, 0f, 1f);
    let _e302 = u_xlat1_;
    let _e305 = u_xlat5_;
    u_xlat1_.x = (-(_e302.x) + _e305);
    let _e310 = u_xlat1_;
    u_xlat1_.x = (1f / _e310.x);
    let _e314 = u_xlat1_;
    let _e316 = u_xlat3_;
    u_xlat1_.x = (_e314.x * _e316);
    let _e319 = u_xlat1_;
    u_xlat1_.x = clamp(_e319.x, 0f, 1f);
    let _e324 = u_xlat1_;
    u_xlat3_ = ((_e324.x * -2f) + 3f);
    let _e332 = u_xlat1_;
    let _e334 = u_xlat1_;
    u_xlat1_.x = (_e332.x * _e334.x);
    let _e338 = u_xlat1_;
    let _e340 = u_xlat3_;
    u_xlat1_.x = (_e338.x * _e340);
    let _e342 = u_xlat0_;
    let _e343 = u_xlat1_;
    u_xlat0_ = (_e342 * _e343.xxxx);
    let _e346 = u_xlat0_;
    let _e347 = vs_COLOR0_1;
    SV_Target0_ = (_e346 * _e347);
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
