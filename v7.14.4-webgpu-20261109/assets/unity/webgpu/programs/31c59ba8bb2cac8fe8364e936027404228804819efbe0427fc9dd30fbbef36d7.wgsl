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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat13_: f32 = 0f;

    let _e51 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = (_e51.y * 0.5f);
    let _e56 = u_xlat0_;
    u_xlat0_.x = fract(_e56.x);
    let _e59 = vs_TEXCOORD0_1;
    let _e64 = _f_buffer0_.f_cb0_[4];
    let _e69 = hscard_bias.values[1];
    let _e72 = textureSampleBias(f_t1_, samplerf_s1_, _e59.zw, (_e64.x + _e69.x));
    u_xlat1_ = _e72;
    let _e73 = u_xlat4_;
    let _e75 = u_xlat1_;
    let _e86 = ((_e75.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e86.x;
    u_xlat4_.y = _e86.y;
    let _e91 = u_xlat4_;
    let _e93 = u_xlat4_;
    let _e98 = _f_buffer1_.f_cb1_[5];
    let _e100 = (_e93.xy * _e98.zw);
    u_xlat4_.x = _e100.x;
    u_xlat4_.y = _e100.y;
    let _e105 = u_xlat0_;
    let _e107 = u_xlat0_;
    let _e109 = u_xlat4_;
    let _e111 = (_e107.xx * _e109.xy);
    u_xlat0_.x = _e111.x;
    u_xlat0_.w = _e111.y;
    let _e116 = u_xlat1_;
    let _e118 = vs_TEXCOORD0_1;
    let _e119 = _e118.xy;
    u_xlat1_.x = _e119.x;
    u_xlat1_.y = _e119.y;
    let _e124 = u_xlat1_;
    let _e126 = u_xlat1_;
    let _e132 = clamp(_e126.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e132.x;
    u_xlat1_.y = _e132.y;
    let _e137 = u_xlat1_;
    let _e139 = u_xlat1_;
    let _e141 = vs_TEXCOORD0_1;
    let _e144 = (_e139.xy + -(_e141.xy));
    u_xlat1_.x = _e144.x;
    u_xlat1_.y = _e144.y;
    let _e149 = u_xlat1_;
    let _e154 = _f_buffer1_.f_cb1_[3];
    let _e156 = u_xlat1_;
    let _e159 = vs_TEXCOORD0_1;
    let _e161 = ((_e154.zz * _e156.xy) + _e159.xy);
    u_xlat1_.x = _e161.x;
    u_xlat1_.y = _e161.y;
    let _e166 = u_xlat9_;
    let _e168 = u_xlat1_;
    let _e179 = ((_e168.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat9_.x = _e179.x;
    u_xlat9_.y = _e179.y;
    let _e184 = u_xlat9_;
    let _e186 = u_xlat9_;
    let _e193 = (-(abs(_e186.xy)) + vec2<f32>(1f, 1f));
    u_xlat9_.x = _e193.x;
    u_xlat9_.y = _e193.y;
    let _e198 = u_xlat9_;
    let _e200 = u_xlat9_;
    let _e205 = (_e200.xy * vec2<f32>(3f, 3f));
    u_xlat9_.x = _e205.x;
    u_xlat9_.y = _e205.y;
    let _e210 = u_xlat9_;
    let _e212 = u_xlat9_;
    let _e218 = clamp(_e212.xy, vec2(0f), vec2(1f));
    u_xlat9_.x = _e218.x;
    u_xlat9_.y = _e218.y;
    let _e223 = u_xlat9_;
    let _e225 = u_xlat9_;
    let _e232 = (_e225.xy + vec2<f32>(-1f, -1f));
    u_xlat9_.x = _e232.x;
    u_xlat9_.y = _e232.y;
    let _e237 = u_xlat9_;
    let _e242 = _f_buffer1_.f_cb1_[3];
    let _e244 = u_xlat9_;
    let _e250 = ((_e242.zz * _e244.xy) + vec2<f32>(1f, 1f));
    u_xlat9_.x = _e250.x;
    u_xlat9_.y = _e250.y;
    let _e255 = u_xlat0_;
    let _e257 = u_xlat0_;
    let _e259 = u_xlat9_;
    let _e262 = u_xlat1_;
    let _e264 = ((_e257.xw * _e259.xy) + _e262.xy);
    u_xlat0_.x = _e264.x;
    u_xlat0_.w = _e264.y;
    let _e269 = u_xlat0_;
    let _e274 = _f_buffer0_.f_cb0_[4];
    let _e279 = hscard_bias.values[0];
    let _e282 = textureSampleBias(f_t0_, samplerf_s0_, _e269.xw, (_e274.x + _e279.x));
    u_xlat2_ = _e282;
    let _e287 = _f_buffer0_.f_cb0_[15];
    u_xlat0_.x = ((_e287.y * 0.5f) + 0.5f);
    let _e294 = u_xlat0_;
    u_xlat0_.x = fract(_e294.x);
    let _e297 = u_xlat4_;
    let _e299 = u_xlat0_;
    let _e301 = u_xlat4_;
    let _e303 = (_e299.xx * _e301.xy);
    u_xlat4_.x = _e303.x;
    u_xlat4_.y = _e303.y;
    let _e309 = u_xlat0_;
    u_xlat0_.x = (-(_e309.x) + 0.5f);
    let _e315 = u_xlat0_;
    let _e317 = u_xlat0_;
    u_xlat0_.x = (_e315.x + _e317.x);
    let _e320 = u_xlat4_;
    let _e322 = u_xlat4_;
    let _e324 = u_xlat9_;
    let _e327 = u_xlat1_;
    let _e329 = ((_e322.xy * _e324.xy) + _e327.xy);
    u_xlat4_.x = _e329.x;
    u_xlat4_.y = _e329.y;
    let _e334 = u_xlat4_;
    let _e339 = _f_buffer0_.f_cb0_[4];
    let _e344 = hscard_bias.values[0];
    let _e347 = textureSampleBias(f_t0_, samplerf_s0_, _e334.xy, (_e339.x + _e344.x));
    u_xlat1_ = _e347;
    let _e348 = u_xlat1_;
    let _e350 = u_xlat2_;
    u_xlat2_ = (-(_e348) + _e350);
    let _e352 = u_xlat0_;
    let _e355 = u_xlat2_;
    let _e357 = u_xlat1_;
    u_xlat0_ = ((abs(_e352.xxxx) * _e355) + _e357);
    let _e359 = u_xlat1_;
    let _e361 = u_xlat0_;
    let _e366 = _f_buffer1_.f_cb1_[2];
    let _e368 = (_e361.xyz + _e366.yyy);
    u_xlat1_.x = _e368.x;
    u_xlat1_.y = _e368.y;
    u_xlat1_.z = _e368.z;
    let _e375 = u_xlat0_;
    let _e380 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e375.w, _e380.y);
    let _e384 = u_xlat1_;
    let _e386 = u_xlat13_;
    let _e391 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e384.y * _e386) + -(_e391.w));
    let _e395 = u_xlat1_;
    let _e397 = u_xlat13_;
    let _e399 = u_xlat1_;
    let _e401 = (vec3(_e397) * _e399.xyz);
    u_xlat1_.x = _e401.x;
    u_xlat1_.y = _e401.y;
    u_xlat1_.z = _e401.z;
    let _e411 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e411.w) + 1f);
    let _e416 = u_xlat2_;
    let _e418 = u_xlat13_;
    u_xlat13_ = (_e416.x / _e418);
    let _e421 = u_xlat2_;
    u_xlat2_.x = (_e421.x * 5f);
    let _e426 = u_xlat2_;
    u_xlat2_.x = clamp(_e426.x, 0f, 1f);
    let _e431 = u_xlat6_;
    let _e436 = _f_buffer1_.f_cb1_[8];
    let _e441 = _f_buffer1_.f_cb1_[9];
    let _e444 = (_e436.yzw + -(_e441.xyz));
    u_xlat6_.x = _e444.x;
    u_xlat6_.y = _e444.y;
    u_xlat6_.z = _e444.z;
    let _e451 = u_xlat6_;
    let _e453 = u_xlat13_;
    let _e455 = u_xlat6_;
    let _e461 = _f_buffer1_.f_cb1_[9];
    let _e463 = ((vec3(_e453) * _e455.xyz) + _e461.xyz);
    u_xlat6_.x = _e463.x;
    u_xlat6_.y = _e463.y;
    u_xlat6_.z = _e463.z;
    let _e475 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e475.w);
    let _e478 = u_xlat13_;
    let _e479 = u_xlat1_;
    u_xlat13_ = (_e478 * _e479.y);
    let _e482 = u_xlat3_;
    let _e487 = _f_buffer1_.f_cb1_[9];
    let _e492 = _f_buffer1_.f_cb1_[10];
    let _e495 = (_e487.xyz + -(_e492.xyz));
    u_xlat3_.x = _e495.x;
    u_xlat3_.y = _e495.y;
    u_xlat3_.z = _e495.z;
    let _e502 = u_xlat3_;
    let _e504 = u_xlat13_;
    let _e506 = u_xlat3_;
    let _e512 = _f_buffer1_.f_cb1_[10];
    let _e514 = ((vec3(_e504) * _e506.xyz) + _e512.xyz);
    u_xlat3_.x = _e514.x;
    u_xlat3_.y = _e514.y;
    u_xlat3_.z = _e514.z;
    let _e521 = u_xlat6_;
    let _e523 = u_xlat6_;
    let _e525 = u_xlat3_;
    let _e528 = (_e523.xyz + -(_e525.xyz));
    u_xlat6_.x = _e528.x;
    u_xlat6_.y = _e528.y;
    u_xlat6_.z = _e528.z;
    let _e535 = u_xlat2_;
    let _e537 = u_xlat2_;
    let _e539 = u_xlat6_;
    let _e542 = u_xlat3_;
    let _e544 = ((_e537.xxx * _e539.xyz) + _e542.xyz);
    u_xlat2_.x = _e544.x;
    u_xlat2_.y = _e544.y;
    u_xlat2_.z = _e544.z;
    let _e551 = u_xlat1_;
    let _e553 = u_xlat1_;
    let _e555 = u_xlat2_;
    let _e557 = (_e553.xyz * _e555.xyz);
    u_xlat1_.x = _e557.x;
    u_xlat1_.y = _e557.y;
    u_xlat1_.z = _e557.z;
    let _e564 = u_xlat0_;
    let _e566 = u_xlat1_;
    let _e571 = _f_buffer1_.f_cb1_[2];
    let _e573 = (_e566.xyz * _e571.xxx);
    u_xlat0_.x = _e573.x;
    u_xlat0_.y = _e573.y;
    u_xlat0_.z = _e573.z;
    let _e580 = u_xlat0_;
    let _e581 = vs_COLOR0_1;
    SV_Target0_ = (_e580 * _e581);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
