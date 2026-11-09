struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 16>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat7_: vec2<f32> = vec2(0f);

    let _e45 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = (_e45.y * 0.5f);
    let _e50 = u_xlat0_;
    u_xlat0_.x = fract(_e50.x);
    let _e53 = vs_TEXCOORD0_1;
    let _e58 = _f_buffer0_.f_cb0_[4];
    let _e63 = hscard_bias.values[1];
    let _e66 = textureSampleBias(f_t1_, samplerf_s1_, _e53.zw, (_e58.x + _e63.x));
    u_xlat1_ = _e66;
    let _e67 = u_xlat3_;
    let _e69 = u_xlat1_;
    let _e80 = ((_e69.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e80.x;
    u_xlat3_.y = _e80.y;
    let _e85 = u_xlat3_;
    let _e87 = u_xlat3_;
    let _e92 = _f_buffer1_.f_cb1_[5];
    let _e94 = (_e87.xy * _e92.zw);
    u_xlat3_.x = _e94.x;
    u_xlat3_.y = _e94.y;
    let _e99 = u_xlat0_;
    let _e101 = u_xlat0_;
    let _e103 = u_xlat3_;
    let _e105 = (_e101.xx * _e103.xy);
    u_xlat0_.x = _e105.x;
    u_xlat0_.w = _e105.y;
    let _e110 = u_xlat1_;
    let _e112 = vs_TEXCOORD0_1;
    let _e113 = _e112.xy;
    u_xlat1_.x = _e113.x;
    u_xlat1_.y = _e113.y;
    let _e118 = u_xlat1_;
    let _e120 = u_xlat1_;
    let _e126 = clamp(_e120.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e126.x;
    u_xlat1_.y = _e126.y;
    let _e131 = u_xlat1_;
    let _e133 = u_xlat1_;
    let _e135 = vs_TEXCOORD0_1;
    let _e138 = (_e133.xy + -(_e135.xy));
    u_xlat1_.x = _e138.x;
    u_xlat1_.y = _e138.y;
    let _e143 = u_xlat1_;
    let _e148 = _f_buffer1_.f_cb1_[3];
    let _e150 = u_xlat1_;
    let _e153 = vs_TEXCOORD0_1;
    let _e155 = ((_e148.zz * _e150.xy) + _e153.xy);
    u_xlat1_.x = _e155.x;
    u_xlat1_.y = _e155.y;
    let _e160 = u_xlat7_;
    let _e162 = u_xlat1_;
    let _e173 = ((_e162.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat7_.x = _e173.x;
    u_xlat7_.y = _e173.y;
    let _e178 = u_xlat7_;
    let _e180 = u_xlat7_;
    let _e187 = (-(abs(_e180.xy)) + vec2<f32>(1f, 1f));
    u_xlat7_.x = _e187.x;
    u_xlat7_.y = _e187.y;
    let _e192 = u_xlat7_;
    let _e194 = u_xlat7_;
    let _e199 = (_e194.xy * vec2<f32>(3f, 3f));
    u_xlat7_.x = _e199.x;
    u_xlat7_.y = _e199.y;
    let _e204 = u_xlat7_;
    let _e206 = u_xlat7_;
    let _e212 = clamp(_e206.xy, vec2(0f), vec2(1f));
    u_xlat7_.x = _e212.x;
    u_xlat7_.y = _e212.y;
    let _e217 = u_xlat7_;
    let _e219 = u_xlat7_;
    let _e226 = (_e219.xy + vec2<f32>(-1f, -1f));
    u_xlat7_.x = _e226.x;
    u_xlat7_.y = _e226.y;
    let _e231 = u_xlat7_;
    let _e236 = _f_buffer1_.f_cb1_[3];
    let _e238 = u_xlat7_;
    let _e244 = ((_e236.zz * _e238.xy) + vec2<f32>(1f, 1f));
    u_xlat7_.x = _e244.x;
    u_xlat7_.y = _e244.y;
    let _e249 = u_xlat0_;
    let _e251 = u_xlat0_;
    let _e253 = u_xlat7_;
    let _e256 = u_xlat1_;
    let _e258 = ((_e251.xw * _e253.xy) + _e256.xy);
    u_xlat0_.x = _e258.x;
    u_xlat0_.w = _e258.y;
    let _e263 = u_xlat0_;
    let _e268 = _f_buffer0_.f_cb0_[4];
    let _e273 = hscard_bias.values[0];
    let _e276 = textureSampleBias(f_t0_, samplerf_s0_, _e263.xw, (_e268.x + _e273.x));
    u_xlat2_ = _e276;
    let _e281 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = ((_e281.y * 0.5f) + 0.5f);
    let _e288 = u_xlat0_;
    u_xlat0_.x = fract(_e288.x);
    let _e291 = u_xlat3_;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat3_;
    let _e297 = (_e293.xx * _e295.xy);
    u_xlat3_.x = _e297.x;
    u_xlat3_.y = _e297.y;
    let _e303 = u_xlat0_;
    u_xlat0_.x = (-(_e303.x) + 0.5f);
    let _e309 = u_xlat0_;
    let _e311 = u_xlat0_;
    u_xlat0_.x = (_e309.x + _e311.x);
    let _e314 = u_xlat3_;
    let _e316 = u_xlat3_;
    let _e318 = u_xlat7_;
    let _e321 = u_xlat1_;
    let _e323 = ((_e316.xy * _e318.xy) + _e321.xy);
    u_xlat3_.x = _e323.x;
    u_xlat3_.y = _e323.y;
    let _e328 = u_xlat3_;
    let _e333 = _f_buffer0_.f_cb0_[4];
    let _e338 = hscard_bias.values[0];
    let _e341 = textureSampleBias(f_t0_, samplerf_s0_, _e328.xy, (_e333.x + _e338.x));
    u_xlat1_ = _e341;
    let _e342 = u_xlat3_;
    let _e344 = u_xlat1_;
    let _e347 = u_xlat2_;
    let _e349 = (-(_e344.xw) + _e347.xw);
    u_xlat3_.x = _e349.x;
    u_xlat3_.y = _e349.y;
    let _e354 = u_xlat0_;
    let _e356 = u_xlat0_;
    let _e359 = u_xlat3_;
    let _e362 = u_xlat1_;
    let _e364 = ((abs(_e356.xx) * _e359.xy) + _e362.xw);
    u_xlat0_.x = _e364.x;
    u_xlat0_.w = _e364.y;
    let _e370 = u_xlat0_;
    let _e375 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e370.x + _e375.y);
    let _e378 = u_xlat0_;
    let _e383 = _f_buffer1_.f_cb1_[3];
    u_xlat4_ = max(_e378.w, _e383.y);
    let _e387 = u_xlat4_;
    let _e388 = u_xlat1_;
    u_xlat1_.x = (_e387 * _e388.x);
    let _e395 = _f_buffer1_.f_cb1_[11];
    u_xlat1_.y = ((_e395.x * 0.03125f) + 0.015625f);
    let _e401 = u_xlat1_;
    let _e406 = _f_buffer0_.f_cb0_[4];
    let _e411 = hscard_bias.values[2];
    let _e414 = textureSampleBias(f_t2_, samplerf_s2_, _e401.xy, (_e406.x + _e411.x));
    u_xlat1_ = _e414;
    let _e415 = u_xlat0_;
    let _e417 = u_xlat1_;
    let _e422 = _f_buffer1_.f_cb1_[2];
    let _e424 = (_e417.xyz * _e422.xxx);
    u_xlat0_.x = _e424.x;
    u_xlat0_.y = _e424.y;
    u_xlat0_.z = _e424.z;
    let _e431 = u_xlat0_;
    let _e432 = vs_COLOR0_1;
    SV_Target0_ = (_e431 * _e432);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
