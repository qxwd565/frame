struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 26>,
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
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler;
@group(3) @binding(11) 
var samplerf_s5_: sampler;
@group(3) @binding(13) 
var samplerf_s6_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
@group(3) @binding(8) 
var f_t4_: texture_2d<f32>;
@group(3) @binding(10) 
var f_t5_: texture_2d<f32>;
@group(3) @binding(12) 
var f_t6_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_TEXCOORD3_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_TEXCOORD5_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlat7_: f32 = 0f;
    var u_xlat13_: f32 = 0f;
    var u_xlatb18_: bool = false;
    var local: vec3<f32>;
    var local_1: vec2<f32>;

    let _e64 = vs_TEXCOORD2_1;
    let _e69 = _f_buffer0_.f_cb0_[4];
    let _e74 = hscard_bias.values[4];
    let _e77 = textureSampleBias(f_t4_, samplerf_s4_, _e64.xy, (_e69.x + _e74.x));
    u_xlat0_ = _e77;
    let _e82 = _f_buffer1_.f_cb1_[5];
    u_xlatb18_ = (1f < _e82.x);
    let _e85 = u_xlat0_;
    let _e87 = u_xlatb18_;
    if bool(_e87) {
        let _e89 = u_xlat0_;
        local = _e89.xyz;
    } else {
        local = vec3<f32>(1f, 1f, 1f);
    }
    let _e96 = local;
    u_xlat0_.x = _e96.x;
    u_xlat0_.y = _e96.y;
    u_xlat0_.z = _e96.z;
    let _e104 = u_xlat0_;
    let _e109 = _f_buffer1_.f_cb1_[1];
    u_xlat1_.x = (_e104.x * _e109.w);
    let _e113 = u_xlat0_;
    let _e118 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.y = (_e113.y * _e118.x);
    let _e121 = u_xlat0_;
    let _e123 = u_xlat1_;
    let _e125 = vs_TEXCOORD5_1;
    let _e127 = (_e123.xy + _e125.xy);
    u_xlat0_.x = _e127.x;
    u_xlat0_.y = _e127.y;
    let _e132 = u_xlat0_;
    let _e134 = u_xlatb18_;
    if bool(_e134) {
        let _e136 = u_xlat0_;
        local_1 = _e136.xy;
    } else {
        let _e138 = vs_TEXCOORD2_1;
        local_1 = _e138.xy;
    }
    let _e141 = local_1;
    u_xlat0_.x = _e141.x;
    u_xlat0_.y = _e141.y;
    let _e146 = u_xlat0_;
    let _e151 = _f_buffer0_.f_cb0_[4];
    let _e156 = hscard_bias.values[3];
    let _e159 = textureSampleBias(f_t3_, samplerf_s3_, _e146.xy, (_e151.x + _e156.x));
    u_xlat1_ = _e159;
    let _e160 = u_xlat1_;
    let _e165 = _f_buffer1_.f_cb1_[1];
    u_xlat1_ = (-(_e160) + _e165.yyyy);
    let _e168 = u_xlat0_;
    let _e170 = u_xlat1_;
    u_xlat0_ = (_e168.zzzz * abs(_e170));
    let _e174 = u_xlat1_;
    u_xlat1_.x = (abs(_e174.x) + -0.5f);
    let _e180 = u_xlat2_;
    let _e182 = u_xlat0_;
    let _e183 = _e182.xyz;
    u_xlat2_.x = _e183.x;
    u_xlat2_.y = _e183.y;
    u_xlat2_.z = _e183.z;
    let _e194 = _f_buffer1_.f_cb1_[0];
    u_xlat2_.w = _e194.w;
    let _e196 = u_xlat2_;
    let _e200 = _f_buffer1_.f_cb1_[0];
    u_xlat2_ = (_e196 * _e200);
    let _e206 = _f_buffer1_.f_cb1_[0];
    u_xlat0_.x = _e206.w;
    let _e208 = u_xlat0_;
    let _e210 = u_xlat2_;
    u_xlat0_ = (_e208.xxxw * _e210);
    let _e212 = u_xlat0_;
    let _e216 = _f_buffer1_.f_cb1_[1];
    u_xlat0_ = (_e212 * _e216.xxxx);
    let _e219 = vs_TEXCOORD0_1;
    let _e224 = _f_buffer0_.f_cb0_[4];
    let _e229 = hscard_bias.values[2];
    let _e232 = textureSampleBias(f_t2_, samplerf_s2_, _e219.xy, (_e224.x + _e229.x));
    u_xlat2_ = _e232;
    let _e233 = u_xlat0_;
    let _e234 = u_xlat2_;
    u_xlat0_ = (_e233 * _e234.xxxx);
    let _e241 = _f_buffer1_.f_cb1_[9];
    u_xlat3_.w = _e241.w;
    let _e243 = vs_TEXCOORD4_1;
    let _e248 = _f_buffer0_.f_cb0_[4];
    let _e253 = hscard_bias.values[5];
    let _e256 = textureSampleBias(f_t5_, samplerf_s5_, _e243.xy, (_e248.x + _e253.x));
    u_xlat4_ = _e256;
    let _e257 = u_xlat4_;
    let _e262 = _f_buffer1_.f_cb1_[10];
    u_xlat4_ = (-(_e257) + _e262.yyyy);
    let _e265 = u_xlat3_;
    let _e267 = u_xlat4_;
    let _e269 = abs(_e267.xyz);
    u_xlat3_.x = _e269.x;
    u_xlat3_.y = _e269.y;
    u_xlat3_.z = _e269.z;
    let _e276 = u_xlat3_;
    let _e280 = _f_buffer1_.f_cb1_[9];
    u_xlat5_ = (_e276 * _e280);
    let _e286 = _f_buffer1_.f_cb1_[9];
    u_xlat4_.x = _e286.w;
    let _e289 = u_xlat4_;
    u_xlat4_.w = abs(_e289.w);
    let _e293 = u_xlat3_;
    u_xlat1_.y = (_e293.x + -0.5f);
    let _e298 = u_xlat1_;
    let _e300 = u_xlat1_;
    let _e302 = u_xlat2_;
    let _e304 = (_e300.xy * _e302.xy);
    u_xlat1_.x = _e304.x;
    u_xlat1_.y = _e304.y;
    let _e309 = u_xlat1_;
    let _e314 = _f_buffer1_.f_cb1_[10];
    u_xlat7_ = (_e309.y * _e314.w);
    let _e317 = u_xlat4_;
    let _e319 = u_xlat5_;
    u_xlat3_ = (_e317.xxxw * _e319);
    let _e321 = u_xlat3_;
    let _e325 = _f_buffer1_.f_cb1_[10];
    u_xlat3_ = (_e321 * _e325.xxxx);
    let _e328 = u_xlat2_;
    let _e330 = u_xlat3_;
    u_xlat3_ = (_e328.yyyy * _e330);
    let _e332 = u_xlat3_;
    let _e333 = vs_TEXCOORD3_1;
    u_xlat3_ = (_e332 * _e333.yyyy);
    let _e336 = u_xlat0_;
    let _e337 = vs_TEXCOORD3_1;
    let _e340 = u_xlat3_;
    u_xlat4_ = ((_e336 * _e337.xxxx) + _e340);
    let _e342 = u_xlat0_;
    let _e343 = vs_TEXCOORD3_1;
    u_xlat0_ = (_e342 * _e343.xxxx);
    let _e346 = u_xlat4_;
    u_xlat4_ = (_e346 * vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
    let _e353 = u_xlat0_;
    let _e354 = u_xlat3_;
    let _e356 = u_xlat4_;
    u_xlat0_ = ((_e353 * _e354) + -(_e356));
    let _e362 = _f_buffer1_.f_cb1_[10];
    let _e364 = u_xlat0_;
    let _e366 = u_xlat4_;
    u_xlat0_ = ((_e362.zzzz * _e364) + _e366);
    let _e372 = _f_buffer1_.f_cb1_[16];
    u_xlat3_.w = _e372.w;
    let _e374 = vs_TEXCOORD4_1;
    let _e379 = _f_buffer0_.f_cb0_[4];
    let _e384 = hscard_bias.values[6];
    let _e387 = textureSampleBias(f_t6_, samplerf_s6_, _e374.zw, (_e379.x + _e384.x));
    u_xlat4_ = _e387;
    let _e388 = u_xlat4_;
    let _e393 = _f_buffer1_.f_cb1_[17];
    u_xlat4_ = (-(_e388) + _e393.zzzz);
    let _e396 = u_xlat3_;
    let _e398 = u_xlat4_;
    let _e400 = abs(_e398.xyz);
    u_xlat3_.x = _e400.x;
    u_xlat3_.y = _e400.y;
    u_xlat3_.z = _e400.z;
    let _e407 = u_xlat3_;
    let _e411 = _f_buffer1_.f_cb1_[16];
    u_xlat5_ = (_e407 * _e411);
    let _e417 = _f_buffer1_.f_cb1_[16];
    u_xlat4_.x = _e417.w;
    let _e420 = u_xlat4_;
    u_xlat4_.w = abs(_e420.w);
    let _e423 = u_xlat3_;
    u_xlat13_ = (_e423.x + -0.5f);
    let _e428 = u_xlat2_;
    let _e430 = u_xlat13_;
    u_xlat13_ = (_e428.z * _e430);
    let _e432 = u_xlat13_;
    let _e436 = _f_buffer1_.f_cb1_[18];
    let _e439 = u_xlat7_;
    u_xlat7_ = ((_e432 * _e436.x) + _e439);
    let _e441 = u_xlat4_;
    let _e443 = u_xlat5_;
    u_xlat3_ = (_e441.xxxw * _e443);
    let _e445 = u_xlat3_;
    let _e449 = _f_buffer1_.f_cb1_[17];
    u_xlat3_ = (_e445 * _e449.xxxx);
    let _e452 = u_xlat2_;
    let _e454 = u_xlat3_;
    u_xlat3_ = (_e452.zzzz * _e454);
    let _e456 = u_xlat3_;
    let _e457 = vs_TEXCOORD3_1;
    let _e460 = u_xlat0_;
    u_xlat4_ = ((_e456 * _e457.zzzz) + _e460);
    let _e462 = u_xlat3_;
    let _e463 = vs_TEXCOORD3_1;
    u_xlat3_ = (_e462 * _e463.zzzz);
    let _e466 = u_xlat4_;
    u_xlat4_ = (_e466 * vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
    let _e473 = u_xlat0_;
    let _e474 = u_xlat3_;
    let _e476 = u_xlat4_;
    u_xlat0_ = ((_e473 * _e474) + -(_e476));
    let _e482 = _f_buffer1_.f_cb1_[17];
    let _e484 = u_xlat0_;
    let _e486 = u_xlat4_;
    u_xlat0_ = ((_e482.wwww * _e484) + _e486);
    let _e489 = u_xlat1_;
    let _e494 = _f_buffer1_.f_cb1_[1];
    let _e497 = u_xlat7_;
    u_xlat1_.x = ((_e489.x * _e494.z) + _e497);
    let _e499 = u_xlat1_;
    let _e504 = _f_buffer1_.f_cb1_[25];
    let _e506 = u_xlat1_;
    let _e509 = vs_TEXCOORD0_1;
    let _e511 = ((_e504.xy * _e506.xx) + _e509.xy);
    u_xlat1_.x = _e511.x;
    u_xlat1_.y = _e511.y;
    let _e516 = u_xlat1_;
    let _e521 = _f_buffer0_.f_cb0_[4];
    let _e526 = hscard_bias.values[0];
    let _e529 = textureSampleBias(f_t0_, samplerf_s0_, _e516.xy, (_e521.x + _e526.x));
    u_xlat1_ = _e529;
    let _e530 = u_xlat0_;
    let _e531 = u_xlat1_;
    u_xlat0_ = (_e530 + _e531);
    let _e536 = _f_buffer1_.f_cb1_[24];
    let _e541 = _f_buffer1_.f_cb1_[24];
    let _e544 = u_xlat0_;
    u_xlat0_ = ((_e536.yyyy * _e541.zzzz) + _e544);
    let _e546 = u_xlat1_;
    let _e548 = u_xlat0_;
    u_xlat0_ = (-(_e546) + _e548);
    let _e551 = u_xlat2_;
    let _e553 = u_xlat2_;
    u_xlat2_.x = (_e551.y + _e553.x);
    let _e557 = u_xlat2_;
    let _e559 = u_xlat2_;
    u_xlat2_.x = (_e557.z + _e559.x);
    let _e563 = u_xlat2_;
    u_xlat2_.x = clamp(_e563.x, 0f, 1f);
    let _e568 = u_xlat2_;
    let _e570 = u_xlat0_;
    let _e572 = u_xlat1_;
    u_xlat0_ = ((_e568.xxxx * _e570) + _e572);
    let _e574 = u_xlat0_;
    u_xlat0_ = clamp(_e574, vec4(0f), vec4(1f));
    let _e580 = u_xlat0_;
    u_xlat1_ = (_e580 + vec4<f32>(0.15f, 0.15f, 0.15f, 0.15f));
    let _e587 = u_xlat1_;
    let _e588 = vs_COLOR0_1;
    u_xlat1_ = (_e587 * _e588);
    let _e590 = u_xlat0_;
    let _e591 = u_xlat1_;
    u_xlat0_ = min(_e590, _e591);
    let _e593 = vs_TEXCOORD1_1;
    let _e598 = _f_buffer0_.f_cb0_[4];
    let _e603 = hscard_bias.values[1];
    let _e606 = textureSampleBias(f_t1_, samplerf_s1_, _e593.xy, (_e598.x + _e603.x));
    u_xlat1_ = _e606;
    let _e607 = u_xlat0_;
    let _e608 = u_xlat1_;
    SV_TARGET0_ = (_e607 * _e608);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(5) vs_TEXCOORD5_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e68 = SV_TARGET0_;
    return FragmentOutput(_e68);
}
