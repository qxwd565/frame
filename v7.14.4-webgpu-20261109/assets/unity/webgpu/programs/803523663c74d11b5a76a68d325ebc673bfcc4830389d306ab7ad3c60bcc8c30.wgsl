struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 16>,
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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e52 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = (_e52.y * 0.5f);
    let _e57 = u_xlat0_;
    u_xlat0_.x = fract(_e57.x);
    let _e60 = vs_TEXCOORD0_1;
    let _e65 = _f_buffer0_.f_cb0_[4];
    let _e70 = hscard_bias.values[1];
    let _e73 = textureSampleBias(f_t1_, samplerf_s1_, _e60.zw, (_e65.x + _e70.x));
    u_xlat1_ = _e73;
    let _e74 = u_xlat4_;
    let _e76 = u_xlat1_;
    let _e87 = ((_e76.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e87.x;
    u_xlat4_.y = _e87.y;
    let _e92 = u_xlat4_;
    let _e94 = u_xlat4_;
    let _e99 = _f_buffer1_.f_cb1_[5];
    let _e101 = (_e94.xy * _e99.zw);
    u_xlat4_.x = _e101.x;
    u_xlat4_.y = _e101.y;
    let _e106 = u_xlat0_;
    let _e108 = u_xlat0_;
    let _e110 = u_xlat4_;
    let _e112 = (_e108.xx * _e110.xy);
    u_xlat0_.x = _e112.x;
    u_xlat0_.w = _e112.y;
    let _e117 = u_xlat1_;
    let _e119 = vs_TEXCOORD0_1;
    let _e120 = _e119.xy;
    u_xlat1_.x = _e120.x;
    u_xlat1_.y = _e120.y;
    let _e125 = u_xlat1_;
    let _e127 = u_xlat1_;
    let _e133 = clamp(_e127.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e133.x;
    u_xlat1_.y = _e133.y;
    let _e138 = u_xlat1_;
    let _e140 = u_xlat1_;
    let _e142 = vs_TEXCOORD0_1;
    let _e145 = (_e140.xy + -(_e142.xy));
    u_xlat1_.x = _e145.x;
    u_xlat1_.y = _e145.y;
    let _e150 = u_xlat1_;
    let _e155 = _f_buffer1_.f_cb1_[3];
    let _e157 = u_xlat1_;
    let _e160 = vs_TEXCOORD0_1;
    let _e162 = ((_e155.zz * _e157.xy) + _e160.xy);
    u_xlat1_.x = _e162.x;
    u_xlat1_.y = _e162.y;
    let _e167 = u_xlat9_;
    let _e169 = u_xlat1_;
    let _e180 = ((_e169.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat9_.x = _e180.x;
    u_xlat9_.y = _e180.y;
    let _e185 = u_xlat9_;
    let _e187 = u_xlat9_;
    let _e194 = (-(abs(_e187.xy)) + vec2<f32>(1f, 1f));
    u_xlat9_.x = _e194.x;
    u_xlat9_.y = _e194.y;
    let _e199 = u_xlat9_;
    let _e201 = u_xlat9_;
    let _e206 = (_e201.xy * vec2<f32>(3f, 3f));
    u_xlat9_.x = _e206.x;
    u_xlat9_.y = _e206.y;
    let _e211 = u_xlat9_;
    let _e213 = u_xlat9_;
    let _e219 = clamp(_e213.xy, vec2(0f), vec2(1f));
    u_xlat9_.x = _e219.x;
    u_xlat9_.y = _e219.y;
    let _e224 = u_xlat9_;
    let _e226 = u_xlat9_;
    let _e233 = (_e226.xy + vec2<f32>(-1f, -1f));
    u_xlat9_.x = _e233.x;
    u_xlat9_.y = _e233.y;
    let _e238 = u_xlat9_;
    let _e243 = _f_buffer1_.f_cb1_[3];
    let _e245 = u_xlat9_;
    let _e251 = ((_e243.zz * _e245.xy) + vec2<f32>(1f, 1f));
    u_xlat9_.x = _e251.x;
    u_xlat9_.y = _e251.y;
    let _e256 = u_xlat0_;
    let _e258 = u_xlat0_;
    let _e260 = u_xlat9_;
    let _e263 = u_xlat1_;
    let _e265 = ((_e258.xw * _e260.xy) + _e263.xy);
    u_xlat0_.x = _e265.x;
    u_xlat0_.w = _e265.y;
    let _e270 = u_xlat0_;
    let _e275 = _f_buffer0_.f_cb0_[4];
    let _e280 = hscard_bias.values[0];
    let _e283 = textureSampleBias(f_t0_, samplerf_s0_, _e270.xw, (_e275.x + _e280.x));
    u_xlat2_ = _e283;
    let _e285 = u_xlat2_;
    u_xlat0_.x = dot(_e285.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e295 = _f_buffer0_.f_cb0_[15];
    u_xlat12_ = ((_e295.y * 0.5f) + 0.5f);
    let _e301 = u_xlat12_;
    u_xlat12_ = fract(_e301);
    let _e303 = u_xlat4_;
    let _e305 = u_xlat12_;
    let _e307 = u_xlat4_;
    let _e309 = (vec2(_e305) * _e307.xy);
    u_xlat4_.x = _e309.x;
    u_xlat4_.y = _e309.y;
    let _e314 = u_xlat12_;
    u_xlat12_ = (-(_e314) + 0.5f);
    let _e318 = u_xlat12_;
    let _e319 = u_xlat12_;
    u_xlat12_ = (_e318 + _e319);
    let _e321 = u_xlat4_;
    let _e323 = u_xlat4_;
    let _e325 = u_xlat9_;
    let _e328 = u_xlat1_;
    let _e330 = ((_e323.xy * _e325.xy) + _e328.xy);
    u_xlat4_.x = _e330.x;
    u_xlat4_.y = _e330.y;
    let _e335 = u_xlat4_;
    let _e340 = _f_buffer0_.f_cb0_[4];
    let _e345 = hscard_bias.values[0];
    let _e348 = textureSampleBias(f_t0_, samplerf_s0_, _e335.xy, (_e340.x + _e345.x));
    u_xlat1_ = _e348;
    let _e350 = u_xlat1_;
    u_xlat4_.x = dot(_e350.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e358 = u_xlat4_;
    let _e361 = u_xlat0_;
    u_xlat0_.x = (-(_e358.x) + _e361.x);
    let _e365 = u_xlat12_;
    let _e367 = u_xlat0_;
    let _e370 = u_xlat4_;
    u_xlat0_.w = ((abs(_e365) * _e367.x) + _e370.x);
    let _e374 = u_xlat0_;
    let _e379 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e374.w + _e379.y);
    let _e383 = u_xlat0_;
    let _e388 = _f_buffer1_.f_cb1_[3];
    u_xlat5_.x = max(_e383.w, _e388.y);
    let _e392 = u_xlat1_;
    let _e394 = u_xlat5_;
    let _e400 = _f_buffer1_.f_cb1_[10];
    u_xlat9_.x = ((_e392.x * _e394.x) + -(_e400.w));
    let _e405 = u_xlat5_;
    let _e407 = u_xlat1_;
    u_xlat1_.x = (_e405.x * _e407.x);
    let _e414 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (-(_e414.w) + 1f);
    let _e420 = u_xlat9_;
    let _e422 = u_xlat5_;
    u_xlat5_.x = (_e420.x / _e422.x);
    let _e426 = u_xlat9_;
    u_xlat9_.x = (_e426.x * 5f);
    let _e431 = u_xlat9_;
    u_xlat9_.x = clamp(_e431.x, 0f, 1f);
    let _e436 = u_xlat2_;
    let _e441 = _f_buffer1_.f_cb1_[8];
    let _e446 = _f_buffer1_.f_cb1_[9];
    let _e449 = (_e441.yzw + -(_e446.xyz));
    u_xlat2_.x = _e449.x;
    u_xlat2_.y = _e449.y;
    u_xlat2_.z = _e449.z;
    let _e456 = u_xlat2_;
    let _e458 = u_xlat5_;
    let _e460 = u_xlat2_;
    let _e466 = _f_buffer1_.f_cb1_[9];
    let _e468 = ((_e458.xxx * _e460.xyz) + _e466.xyz);
    u_xlat2_.x = _e468.x;
    u_xlat2_.y = _e468.y;
    u_xlat2_.z = _e468.z;
    let _e481 = _f_buffer1_.f_cb1_[10];
    u_xlat5_.x = (1f / _e481.w);
    let _e485 = u_xlat5_;
    let _e487 = u_xlat1_;
    u_xlat5_.x = (_e485.x * _e487.x);
    let _e490 = u_xlat3_;
    let _e495 = _f_buffer1_.f_cb1_[9];
    let _e500 = _f_buffer1_.f_cb1_[10];
    let _e503 = (_e495.xyz + -(_e500.xyz));
    u_xlat3_.x = _e503.x;
    u_xlat3_.y = _e503.y;
    u_xlat3_.z = _e503.z;
    let _e510 = u_xlat3_;
    let _e512 = u_xlat5_;
    let _e514 = u_xlat3_;
    let _e520 = _f_buffer1_.f_cb1_[10];
    let _e522 = ((_e512.xxx * _e514.xyz) + _e520.xyz);
    u_xlat3_.x = _e522.x;
    u_xlat3_.y = _e522.y;
    u_xlat3_.z = _e522.z;
    let _e529 = u_xlat2_;
    let _e531 = u_xlat2_;
    let _e533 = u_xlat3_;
    let _e536 = (_e531.xyz + -(_e533.xyz));
    u_xlat2_.x = _e536.x;
    u_xlat2_.y = _e536.y;
    u_xlat2_.z = _e536.z;
    let _e543 = u_xlat5_;
    let _e545 = u_xlat9_;
    let _e547 = u_xlat2_;
    let _e550 = u_xlat3_;
    let _e552 = ((_e545.xxx * _e547.xyz) + _e550.xyz);
    u_xlat5_.x = _e552.x;
    u_xlat5_.y = _e552.y;
    u_xlat5_.z = _e552.z;
    let _e559 = u_xlat1_;
    let _e561 = u_xlat5_;
    let _e563 = u_xlat1_;
    let _e565 = (_e561.xyz * _e563.xxx);
    u_xlat1_.x = _e565.x;
    u_xlat1_.y = _e565.y;
    u_xlat1_.z = _e565.z;
    let _e572 = u_xlat0_;
    let _e574 = u_xlat1_;
    let _e579 = _f_buffer1_.f_cb1_[2];
    let _e581 = (_e574.xyz * _e579.xxx);
    u_xlat0_.x = _e581.x;
    u_xlat0_.y = _e581.y;
    u_xlat0_.z = _e581.z;
    let _e589 = vs_TEXCOORD1_1;
    let _e593 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e589 + -(_e593.z));
    let _e598 = u_xlat1_;
    u_xlat1_.x = clamp(_e598.x, 0f, 1f);
    let _e604 = u_xlat1_;
    u_xlat1_.x = (_e604.x + -0.00001f);
    let _e610 = u_xlat0_;
    let _e612 = u_xlat1_;
    u_xlat5_.x = (_e610.w + -(_e612.x));
    let _e617 = vs_TEXCOORD1_1;
    let _e621 = _f_buffer1_.f_cb1_[12];
    u_xlat9_.x = (_e617 + _e621.z);
    let _e625 = u_xlat9_;
    u_xlat9_.x = clamp(_e625.x, 0f, 1f);
    let _e631 = u_xlat1_;
    let _e634 = u_xlat9_;
    u_xlat1_.x = (-(_e631.x) + _e634.x);
    let _e640 = u_xlat1_;
    u_xlat1_.x = (1f / _e640.x);
    let _e644 = u_xlat1_;
    let _e646 = u_xlat5_;
    u_xlat1_.x = (_e644.x * _e646.x);
    let _e650 = u_xlat1_;
    u_xlat1_.x = clamp(_e650.x, 0f, 1f);
    let _e656 = u_xlat1_;
    u_xlat5_.x = ((_e656.x * -2f) + 3f);
    let _e664 = u_xlat1_;
    let _e666 = u_xlat1_;
    u_xlat1_.x = (_e664.x * _e666.x);
    let _e670 = u_xlat1_;
    let _e672 = u_xlat5_;
    u_xlat1_.x = (_e670.x * _e672.x);
    let _e675 = u_xlat0_;
    let _e676 = u_xlat1_;
    u_xlat0_ = (_e675 * _e676.xxxx);
    let _e679 = u_xlat0_;
    let _e680 = vs_COLOR0_1;
    SV_Target0_ = (_e679 * _e680);
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
