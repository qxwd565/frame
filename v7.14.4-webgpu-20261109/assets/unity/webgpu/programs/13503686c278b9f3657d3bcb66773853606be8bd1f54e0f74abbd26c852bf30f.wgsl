struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 9>,
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
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat12_: f32 = 0f;
    var u_xlat13_: f32 = 0f;

    let _e55 = vs_TEXCOORD0_1;
    let _e60 = _f_buffer0_.f_cb0_[4];
    let _e65 = hscard_bias.values[1];
    let _e68 = textureSampleBias(f_t1_, samplerf_s1_, _e55.xy, (_e60.x + _e65.x));
    u_xlat0_ = _e68;
    let _e70 = u_xlat0_;
    let _e75 = _f_buffer1_.f_cb1_[7];
    u_xlat0_.y = (_e70.x + -(_e75.z));
    let _e80 = u_xlat0_;
    u_xlat0_.x = (-(_e80.x) + 1f);
    let _e85 = u_xlat0_;
    let _e87 = u_xlat0_;
    let _e92 = _f_buffer1_.f_cb1_[7];
    let _e94 = (_e87.xy + _e92.zw);
    u_xlat0_.x = _e94.x;
    u_xlat0_.y = _e94.y;
    let _e99 = u_xlat0_;
    let _e101 = u_xlat0_;
    let _e107 = clamp(_e101.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e107.x;
    u_xlat0_.y = _e107.y;
    let _e113 = u_xlat0_;
    u_xlat0_.x = log2(_e113.x);
    let _e117 = u_xlat0_;
    let _e122 = _f_buffer1_.f_cb1_[8];
    u_xlat0_.x = (_e117.x * _e122.x);
    let _e126 = u_xlat0_;
    u_xlat0_.x = exp2(_e126.x);
    let _e130 = u_xlat0_;
    u_xlat0_.x = (-(_e130.x) + 1f);
    let _e135 = u_xlat0_;
    let _e140 = _f_buffer1_.f_cb1_[7];
    u_xlat8_ = (_e135.y + -(_e140.z));
    let _e144 = u_xlat8_;
    let _e148 = _f_buffer1_.f_cb1_[7];
    u_xlat8_ = (_e144 + _e148.w);
    let _e151 = u_xlat8_;
    u_xlat8_ = clamp(_e151, 0f, 1f);
    let _e155 = vs_TEXCOORD0_1;
    let _e160 = _f_buffer0_.f_cb0_[4];
    let _e165 = hscard_bias.values[0];
    let _e168 = textureSampleBias(f_t0_, samplerf_s0_, _e155.zw, (_e160.x + _e165.x));
    u_xlat1_ = _e168;
    let _e169 = u_xlat1_;
    let _e174 = _f_buffer1_.f_cb1_[4];
    u_xlat12_ = (_e169.w * _e174.w);
    let _e177 = u_xlat12_;
    let _e178 = u_xlat0_;
    u_xlat13_ = (_e177 * _e178.x);
    let _e182 = u_xlat8_;
    let _e183 = u_xlat13_;
    u_xlat2_.x = (_e182 * _e183);
    let _e185 = u_xlat8_;
    let _e187 = u_xlat13_;
    u_xlat8_ = ((-(_e185) * _e187) + 1f);
    let _e191 = u_xlat6_;
    let _e196 = _f_buffer1_.f_cb1_[5];
    let _e201 = _f_buffer1_.f_cb1_[7];
    let _e203 = (_e196.xyz * _e201.xxx);
    u_xlat6_.x = _e203.x;
    u_xlat6_.y = _e203.y;
    u_xlat6_.z = _e203.z;
    let _e210 = vs_TEXCOORD1_1;
    let _e215 = _f_buffer0_.f_cb0_[4];
    let _e220 = hscard_bias.values[2];
    let _e223 = textureSampleBias(f_t2_, samplerf_s2_, _e210.xy, (_e215.x + _e220.x));
    u_xlat3_ = _e223;
    let _e224 = u_xlat7_;
    let _e226 = u_xlat6_;
    let _e228 = u_xlat3_;
    let _e230 = (_e226.xyz * _e228.xxx);
    u_xlat7_.x = _e230.x;
    u_xlat7_.y = _e230.y;
    u_xlat7_.z = _e230.z;
    let _e237 = u_xlat1_;
    let _e239 = u_xlat1_;
    let _e244 = _f_buffer1_.f_cb1_[4];
    let _e247 = u_xlat7_;
    let _e250 = ((_e239.xyz * _e244.xyz) + -(_e247.xyz));
    u_xlat1_.x = _e250.x;
    u_xlat1_.y = _e250.y;
    u_xlat1_.z = _e250.z;
    let _e257 = u_xlat1_;
    let _e259 = u_xlat0_;
    let _e261 = u_xlat1_;
    let _e263 = (_e259.yyy * _e261.xyz);
    u_xlat1_.x = _e263.x;
    u_xlat1_.y = _e263.y;
    u_xlat1_.z = _e263.z;
    let _e270 = u_xlat7_;
    let _e272 = u_xlat2_;
    let _e274 = u_xlat1_;
    let _e277 = u_xlat7_;
    let _e279 = ((_e272.xxx * _e274.xyz) + _e277.xyz);
    u_xlat7_.x = _e279.x;
    u_xlat7_.y = _e279.y;
    u_xlat7_.z = _e279.z;
    let _e286 = u_xlat1_;
    let _e288 = u_xlat6_;
    let _e290 = u_xlat3_;
    let _e293 = u_xlat1_;
    let _e295 = ((_e288.xyz * _e290.xxx) + _e293.xyz);
    u_xlat1_.x = _e295.x;
    u_xlat1_.y = _e295.y;
    u_xlat1_.z = _e295.z;
    let _e302 = u_xlat2_;
    let _e304 = u_xlat7_;
    let _e311 = u_xlat1_;
    let _e314 = ((_e304.xyz * vec3<f32>(1.5f, 1.5f, 1.5f)) + -(_e311.xyz));
    u_xlat2_.x = _e314.x;
    u_xlat2_.y = _e314.y;
    u_xlat2_.z = _e314.z;
    let _e321 = u_xlat1_;
    let _e323 = u_xlat8_;
    let _e325 = u_xlat2_;
    let _e328 = u_xlat1_;
    let _e330 = ((vec3(_e323) * _e325.xyz) + _e328.xyz);
    u_xlat1_.x = _e330.x;
    u_xlat1_.y = _e330.y;
    u_xlat1_.z = _e330.z;
    let _e337 = u_xlat0_;
    let _e339 = u_xlat12_;
    u_xlat4_ = ((_e337.x * _e339) + 0.2f);
    let _e343 = u_xlat4_;
    u_xlat4_ = clamp(_e343, 0f, 1f);
    let _e347 = u_xlat4_;
    u_xlat4_ = fract(_e347);
    let _e349 = u_xlat4_;
    u_xlat4_ = fract(_e349);
    let _e351 = u_xlat3_;
    let _e353 = u_xlat4_;
    u_xlat4_ = (_e351.x * _e353);
    let _e355 = u_xlat13_;
    let _e356 = u_xlat4_;
    u_xlat4_ = (_e355 * _e356);
    let _e358 = u_xlat4_;
    let _e362 = _f_buffer1_.f_cb1_[7];
    u_xlat4_ = (_e358 * _e362.y);
    let _e365 = u_xlat4_;
    u_xlat4_ = clamp(_e365, 0f, 1f);
    let _e369 = u_xlat2_;
    let _e371 = u_xlat1_;
    let _e374 = u_xlat4_;
    let _e376 = (-(_e371.xyz) + vec3(_e374));
    u_xlat2_.x = _e376.x;
    u_xlat2_.y = _e376.y;
    u_xlat2_.z = _e376.z;
    let _e383 = u_xlat1_;
    let _e385 = u_xlat4_;
    let _e387 = u_xlat2_;
    let _e390 = u_xlat1_;
    let _e392 = ((vec3(_e385) * _e387.xyz) + _e390.xyz);
    u_xlat1_.x = _e392.x;
    u_xlat1_.y = _e392.y;
    u_xlat1_.z = _e392.z;
    let _e400 = u_xlat0_;
    let _e402 = u_xlat12_;
    let _e404 = u_xlat4_;
    u_xlat1_.w = ((_e400.x * _e402) + _e404);
    let _e407 = u_xlat1_;
    u_xlat1_.w = clamp(_e407.w, 0f, 1f);
    let _e412 = u_xlat1_;
    let _e413 = vs_COLOR0_1;
    SV_TARGET0_ = (_e412 * _e413);
    let _e415 = SV_TARGET0_;
    SV_TARGET0_ = clamp(_e415, vec4(0f), vec4(1f));
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
