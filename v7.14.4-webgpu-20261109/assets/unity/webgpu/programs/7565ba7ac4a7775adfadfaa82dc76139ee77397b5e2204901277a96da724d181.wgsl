struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 16>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 11>,
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
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat13_: f32 = 0f;

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
    let _e288 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = ((_e288.y * 0.5f) + 0.5f);
    let _e295 = u_xlat0_;
    u_xlat0_.x = fract(_e295.x);
    let _e298 = u_xlat4_;
    let _e300 = u_xlat0_;
    let _e302 = u_xlat4_;
    let _e304 = (_e300.xx * _e302.xy);
    u_xlat4_.x = _e304.x;
    u_xlat4_.y = _e304.y;
    let _e310 = u_xlat0_;
    u_xlat0_.x = (-(_e310.x) + 0.5f);
    let _e316 = u_xlat0_;
    let _e318 = u_xlat0_;
    u_xlat0_.x = (_e316.x + _e318.x);
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
    let _e349 = u_xlat4_;
    let _e351 = u_xlat1_;
    let _e354 = u_xlat2_;
    let _e356 = (-(_e351.xyz) + _e354.xyz);
    u_xlat4_.x = _e356.x;
    u_xlat4_.y = _e356.y;
    u_xlat4_.z = _e356.z;
    let _e363 = u_xlat0_;
    let _e365 = u_xlat0_;
    let _e368 = u_xlat4_;
    let _e371 = u_xlat1_;
    let _e373 = ((abs(_e365.xxx) * _e368.yzx) + _e371.yzx);
    u_xlat0_.x = _e373.x;
    u_xlat0_.y = _e373.y;
    u_xlat0_.w = _e373.z;
    let _e380 = u_xlat1_;
    let _e382 = u_xlat0_;
    let _e387 = _f_buffer1_.f_cb1_[2];
    let _e389 = (_e382.wxy + _e387.yyy);
    u_xlat1_.x = _e389.x;
    u_xlat1_.y = _e389.y;
    u_xlat1_.z = _e389.z;
    let _e396 = u_xlat0_;
    let _e401 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e396.w, _e401.y);
    let _e405 = u_xlat1_;
    let _e407 = u_xlat13_;
    let _e412 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e405.y * _e407) + -(_e412.w));
    let _e416 = u_xlat1_;
    let _e418 = u_xlat13_;
    let _e420 = u_xlat1_;
    let _e422 = (vec3(_e418) * _e420.xyz);
    u_xlat1_.x = _e422.x;
    u_xlat1_.y = _e422.y;
    u_xlat1_.z = _e422.z;
    let _e432 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e432.w) + 1f);
    let _e437 = u_xlat2_;
    let _e439 = u_xlat13_;
    u_xlat13_ = (_e437.x / _e439);
    let _e442 = u_xlat2_;
    u_xlat2_.x = (_e442.x * 5f);
    let _e447 = u_xlat2_;
    u_xlat2_.x = clamp(_e447.x, 0f, 1f);
    let _e452 = u_xlat6_;
    let _e457 = _f_buffer1_.f_cb1_[8];
    let _e462 = _f_buffer1_.f_cb1_[9];
    let _e465 = (_e457.yzw + -(_e462.xyz));
    u_xlat6_.x = _e465.x;
    u_xlat6_.y = _e465.y;
    u_xlat6_.z = _e465.z;
    let _e472 = u_xlat6_;
    let _e474 = u_xlat13_;
    let _e476 = u_xlat6_;
    let _e482 = _f_buffer1_.f_cb1_[9];
    let _e484 = ((vec3(_e474) * _e476.xyz) + _e482.xyz);
    u_xlat6_.x = _e484.x;
    u_xlat6_.y = _e484.y;
    u_xlat6_.z = _e484.z;
    let _e496 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e496.w);
    let _e499 = u_xlat13_;
    let _e500 = u_xlat1_;
    u_xlat13_ = (_e499 * _e500.y);
    let _e503 = u_xlat3_;
    let _e508 = _f_buffer1_.f_cb1_[9];
    let _e513 = _f_buffer1_.f_cb1_[10];
    let _e516 = (_e508.xyz + -(_e513.xyz));
    u_xlat3_.x = _e516.x;
    u_xlat3_.y = _e516.y;
    u_xlat3_.z = _e516.z;
    let _e523 = u_xlat3_;
    let _e525 = u_xlat13_;
    let _e527 = u_xlat3_;
    let _e533 = _f_buffer1_.f_cb1_[10];
    let _e535 = ((vec3(_e525) * _e527.xyz) + _e533.xyz);
    u_xlat3_.x = _e535.x;
    u_xlat3_.y = _e535.y;
    u_xlat3_.z = _e535.z;
    let _e542 = u_xlat6_;
    let _e544 = u_xlat6_;
    let _e546 = u_xlat3_;
    let _e549 = (_e544.xyz + -(_e546.xyz));
    u_xlat6_.x = _e549.x;
    u_xlat6_.y = _e549.y;
    u_xlat6_.z = _e549.z;
    let _e556 = u_xlat2_;
    let _e558 = u_xlat2_;
    let _e560 = u_xlat6_;
    let _e563 = u_xlat3_;
    let _e565 = ((_e558.xxx * _e560.xyz) + _e563.xyz);
    u_xlat2_.x = _e565.x;
    u_xlat2_.y = _e565.y;
    u_xlat2_.z = _e565.z;
    let _e572 = u_xlat1_;
    let _e574 = u_xlat1_;
    let _e576 = u_xlat2_;
    let _e578 = (_e574.xyz * _e576.xyz);
    u_xlat1_.x = _e578.x;
    u_xlat1_.y = _e578.y;
    u_xlat1_.z = _e578.z;
    let _e585 = u_xlat0_;
    let _e587 = u_xlat1_;
    let _e592 = _f_buffer1_.f_cb1_[2];
    let _e594 = (_e587.xyz * _e592.xxx);
    u_xlat0_.x = _e594.x;
    u_xlat0_.y = _e594.y;
    u_xlat0_.z = _e594.z;
    let _e602 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e602;
    let _e604 = u_xlat1_;
    u_xlat1_.x = clamp(_e604.x, 0f, 1f);
    let _e609 = u_xlat1_;
    let _e611 = vs_COLOR0_1;
    u_xlat1_ = (_e609.xxxx * _e611);
    let _e613 = u_xlat0_;
    let _e614 = u_xlat1_;
    SV_Target0_ = (_e613 * _e614);
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
