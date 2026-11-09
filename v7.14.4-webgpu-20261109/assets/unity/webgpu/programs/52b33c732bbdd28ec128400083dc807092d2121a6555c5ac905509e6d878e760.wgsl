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
    var u_xlat4_: vec3<f32> = vec3(0f);
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
    let _e348 = u_xlat4_;
    let _e350 = u_xlat1_;
    let _e353 = u_xlat2_;
    let _e355 = (-(_e350.xyz) + _e353.xyz);
    u_xlat4_.x = _e355.x;
    u_xlat4_.y = _e355.y;
    u_xlat4_.z = _e355.z;
    let _e362 = u_xlat0_;
    let _e364 = u_xlat0_;
    let _e367 = u_xlat4_;
    let _e370 = u_xlat1_;
    let _e372 = ((abs(_e364.xxx) * _e367.yzx) + _e370.yzx);
    u_xlat0_.x = _e372.x;
    u_xlat0_.y = _e372.y;
    u_xlat0_.w = _e372.z;
    let _e379 = u_xlat1_;
    let _e381 = u_xlat0_;
    let _e386 = _f_buffer1_.f_cb1_[2];
    let _e388 = (_e381.wxy + _e386.yyy);
    u_xlat1_.x = _e388.x;
    u_xlat1_.y = _e388.y;
    u_xlat1_.z = _e388.z;
    let _e395 = u_xlat0_;
    let _e400 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e395.w, _e400.y);
    let _e404 = u_xlat1_;
    let _e406 = u_xlat13_;
    let _e411 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e404.y * _e406) + -(_e411.w));
    let _e415 = u_xlat1_;
    let _e417 = u_xlat13_;
    let _e419 = u_xlat1_;
    let _e421 = (vec3(_e417) * _e419.xyz);
    u_xlat1_.x = _e421.x;
    u_xlat1_.y = _e421.y;
    u_xlat1_.z = _e421.z;
    let _e431 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e431.w) + 1f);
    let _e436 = u_xlat2_;
    let _e438 = u_xlat13_;
    u_xlat13_ = (_e436.x / _e438);
    let _e441 = u_xlat2_;
    u_xlat2_.x = (_e441.x * 5f);
    let _e446 = u_xlat2_;
    u_xlat2_.x = clamp(_e446.x, 0f, 1f);
    let _e451 = u_xlat6_;
    let _e456 = _f_buffer1_.f_cb1_[8];
    let _e461 = _f_buffer1_.f_cb1_[9];
    let _e464 = (_e456.yzw + -(_e461.xyz));
    u_xlat6_.x = _e464.x;
    u_xlat6_.y = _e464.y;
    u_xlat6_.z = _e464.z;
    let _e471 = u_xlat6_;
    let _e473 = u_xlat13_;
    let _e475 = u_xlat6_;
    let _e481 = _f_buffer1_.f_cb1_[9];
    let _e483 = ((vec3(_e473) * _e475.xyz) + _e481.xyz);
    u_xlat6_.x = _e483.x;
    u_xlat6_.y = _e483.y;
    u_xlat6_.z = _e483.z;
    let _e495 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e495.w);
    let _e498 = u_xlat13_;
    let _e499 = u_xlat1_;
    u_xlat13_ = (_e498 * _e499.y);
    let _e502 = u_xlat3_;
    let _e507 = _f_buffer1_.f_cb1_[9];
    let _e512 = _f_buffer1_.f_cb1_[10];
    let _e515 = (_e507.xyz + -(_e512.xyz));
    u_xlat3_.x = _e515.x;
    u_xlat3_.y = _e515.y;
    u_xlat3_.z = _e515.z;
    let _e522 = u_xlat3_;
    let _e524 = u_xlat13_;
    let _e526 = u_xlat3_;
    let _e532 = _f_buffer1_.f_cb1_[10];
    let _e534 = ((vec3(_e524) * _e526.xyz) + _e532.xyz);
    u_xlat3_.x = _e534.x;
    u_xlat3_.y = _e534.y;
    u_xlat3_.z = _e534.z;
    let _e541 = u_xlat6_;
    let _e543 = u_xlat6_;
    let _e545 = u_xlat3_;
    let _e548 = (_e543.xyz + -(_e545.xyz));
    u_xlat6_.x = _e548.x;
    u_xlat6_.y = _e548.y;
    u_xlat6_.z = _e548.z;
    let _e555 = u_xlat2_;
    let _e557 = u_xlat2_;
    let _e559 = u_xlat6_;
    let _e562 = u_xlat3_;
    let _e564 = ((_e557.xxx * _e559.xyz) + _e562.xyz);
    u_xlat2_.x = _e564.x;
    u_xlat2_.y = _e564.y;
    u_xlat2_.z = _e564.z;
    let _e571 = u_xlat1_;
    let _e573 = u_xlat1_;
    let _e575 = u_xlat2_;
    let _e577 = (_e573.xyz * _e575.xyz);
    u_xlat1_.x = _e577.x;
    u_xlat1_.y = _e577.y;
    u_xlat1_.z = _e577.z;
    let _e584 = u_xlat0_;
    let _e586 = u_xlat1_;
    let _e591 = _f_buffer1_.f_cb1_[2];
    let _e593 = (_e586.xyz * _e591.xxx);
    u_xlat0_.x = _e593.x;
    u_xlat0_.y = _e593.y;
    u_xlat0_.z = _e593.z;
    let _e600 = u_xlat0_;
    let _e601 = vs_COLOR0_1;
    SV_Target0_ = (_e600 * _e601);
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
