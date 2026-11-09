struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 13>,
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
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
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
var<private> vs_TEXCOORD4_1: vec3<f32>;
var<private> vs_TEXCOORD5_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec2<bool> = vec2(false);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: f32 = 0f;
    var u_xlat8_: f32 = 0f;
    var u_xlat18_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var local: vec3<f32>;
    var local_1: vec3<f32>;

    let _e69 = vs_NORMAL0_1;
    let _e71 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e69.xyz, _e71.xyz);
    let _e75 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e75.x);
    let _e78 = u_xlat0_;
    let _e80 = u_xlat0_;
    let _e82 = vs_NORMAL0_1;
    let _e84 = (_e80.xxx * _e82.xyz);
    u_xlat0_.x = _e84.x;
    u_xlat0_.y = _e84.y;
    u_xlat0_.z = _e84.z;
    let _e92 = u_xlat0_;
    let _e97 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e92.xyz, _e97.xyz);
    let _e101 = u_xlat0_;
    u_xlat0_.x = clamp(_e101.x, 0f, 1f);
    let _e106 = u_xlat6_;
    let _e111 = _f_buffer0_.f_cb0_[6];
    let _e116 = _f_buffer1_.f_cb1_[11];
    let _e118 = (_e111.xyz * _e116.zzz);
    u_xlat6_.x = _e118.x;
    u_xlat6_.y = _e118.y;
    u_xlat6_.z = _e118.z;
    let _e125 = u_xlat0_;
    let _e127 = u_xlat6_;
    let _e129 = u_xlat0_;
    let _e132 = vs_TEXCOORD2_1;
    let _e134 = ((_e127.xyz * _e129.xxx) + _e132.xyz);
    u_xlat0_.x = _e134.x;
    u_xlat0_.y = _e134.y;
    u_xlat0_.z = _e134.z;
    let _e141 = vs_TEXCOORD0_1;
    let _e146 = _f_buffer0_.f_cb0_[4];
    let _e151 = hscard_bias.values[0];
    let _e154 = textureSampleBias(f_t0_, samplerf_s0_, _e141.xy, (_e146.x + _e151.x));
    u_xlat1_ = _e154;
    let _e155 = u_xlat2_;
    let _e157 = u_xlat0_;
    let _e159 = u_xlat1_;
    let _e161 = (_e157.xyz * _e159.xyz);
    u_xlat2_.x = _e161.x;
    u_xlat2_.y = _e161.y;
    u_xlat2_.z = _e161.z;
    let _e168 = u_xlat0_;
    let _e170 = u_xlat1_;
    let _e173 = u_xlat0_;
    let _e179 = _f_buffer2_.f_cb2_[5];
    let _e181 = ((-(_e170.xyz) * _e173.xyz) + _e179.xyz);
    u_xlat0_.x = _e181.x;
    u_xlat0_.y = _e181.y;
    u_xlat0_.z = _e181.z;
    let _e188 = vs_TEXCOORD5_1;
    let _e190 = vs_TEXCOORD4_1;
    u_xlat18_ = dot(_e188.xyz, _e190.xyz);
    let _e193 = u_xlat18_;
    u_xlat18_ = clamp(_e193, 0f, 1f);
    let _e197 = u_xlat18_;
    u_xlat18_ = (-(_e197) + 1f);
    let _e201 = u_xlat18_;
    u_xlat18_ = log2(_e201);
    let _e203 = u_xlat18_;
    let _e207 = _f_buffer2_.f_cb2_[7];
    u_xlat18_ = (_e203 * _e207.x);
    let _e210 = u_xlat18_;
    u_xlat18_ = exp2(_e210);
    let _e212 = vs_TEXCOORD0_1;
    let _e217 = _f_buffer0_.f_cb0_[4];
    let _e222 = hscard_bias.values[1];
    let _e225 = textureSampleBias(f_t1_, samplerf_s1_, _e212.xy, (_e217.x + _e222.x));
    u_xlat1_ = _e225;
    let _e226 = u_xlat1_;
    let _e230 = _f_buffer2_.f_cb2_[6];
    u_xlat20_ = dot(_e226, _e230);
    let _e232 = u_xlat20_;
    u_xlat20_ = min(_e232, 1f);
    let _e235 = u_xlat18_;
    let _e236 = u_xlat20_;
    u_xlat18_ = (_e235 * _e236);
    let _e238 = u_xlat18_;
    let _e242 = _f_buffer2_.f_cb2_[7];
    u_xlat18_ = (_e238 * _e242.y);
    let _e245 = u_xlat18_;
    u_xlat18_ = clamp(_e245, 0f, 1f);
    let _e249 = u_xlat0_;
    let _e251 = u_xlat18_;
    let _e253 = u_xlat0_;
    let _e256 = u_xlat2_;
    let _e258 = ((vec3(_e251) * _e253.xyz) + _e256.xyz);
    u_xlat0_.x = _e258.x;
    u_xlat0_.y = _e258.y;
    u_xlat0_.z = _e258.z;
    let _e269 = _f_buffer0_.f_cb0_[5];
    let _e274 = _f_buffer0_.f_cb0_[5];
    u_xlat2_.x = dot(_e269.xyz, _e274.xyz);
    let _e278 = u_xlat2_;
    u_xlat2_.x = inverseSqrt(_e278.x);
    let _e281 = u_xlat2_;
    let _e283 = u_xlat2_;
    let _e288 = _f_buffer0_.f_cb0_[5];
    let _e290 = (_e283.xxx * _e288.xyz);
    u_xlat2_.x = _e290.x;
    u_xlat2_.y = _e290.y;
    u_xlat2_.z = _e290.z;
    let _e298 = u_xlat2_;
    let _e300 = vs_NORMAL0_1;
    u_xlat2_.x = dot(_e298.xyz, _e300.xyz);
    let _e303 = u_xlat1_;
    let _e307 = _f_buffer2_.f_cb2_[3];
    u_xlat8_ = dot(_e303, _e307);
    let _e309 = u_xlat8_;
    u_xlat8_ = min(_e309, 1f);
    let _e313 = u_xlat8_;
    let _e314 = u_xlat2_;
    u_xlat2_.x = (_e313 * _e314.x);
    let _e318 = u_xlat2_;
    let _e323 = _f_buffer2_.f_cb2_[4];
    u_xlat2_.x = (_e318.x * _e323.x);
    let _e327 = u_xlat2_;
    u_xlat2_.x = clamp(_e327.x, 0f, 1f);
    let _e332 = u_xlat0_;
    let _e337 = _f_buffer2_.f_cb2_[2];
    let _e339 = u_xlat2_;
    let _e342 = u_xlat0_;
    let _e344 = ((_e337.xyz * _e339.xxx) + _e342.xyz);
    u_xlat0_.x = _e344.x;
    u_xlat0_.y = _e344.y;
    u_xlat0_.z = _e344.z;
    let _e351 = vs_TEXCOORD0_1;
    let _e356 = _f_buffer0_.f_cb0_[4];
    let _e361 = hscard_bias.values[2];
    let _e364 = textureSampleBias(f_t2_, samplerf_s2_, _e351.zw, (_e356.x + _e361.x));
    u_xlat2_ = _e364;
    let _e365 = u_xlat3_;
    let _e367 = u_xlat2_;
    let _e372 = _f_buffer2_.f_cb2_[10];
    let _e375 = u_xlat0_;
    let _e378 = ((_e367.xyz * _e372.xyz) + -(_e375.xyz));
    u_xlat3_.x = _e378.x;
    u_xlat3_.y = _e378.y;
    u_xlat3_.z = _e378.z;
    let _e385 = u_xlat2_;
    let _e390 = _f_buffer2_.f_cb2_[10];
    u_xlat4_ = (_e385.wxyz * _e390.wxyz);
    let _e393 = u_xlat2_;
    let _e395 = u_xlat2_;
    let _e401 = _f_buffer2_.f_cb2_[10];
    let _e408 = ((-(_e395.xyz) * _e401.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e408.x;
    u_xlat2_.y = _e408.y;
    u_xlat2_.z = _e408.z;
    let _e415 = u_xlat4_;
    let _e420 = _f_buffer2_.f_cb2_[12];
    u_xlat20_ = (_e415.x * _e420.w);
    let _e423 = u_xlat20_;
    u_xlat20_ = _e423;
    let _e424 = u_xlat20_;
    u_xlat20_ = clamp(_e424, 0f, 1f);
    let _e428 = u_xlat3_;
    let _e430 = u_xlat20_;
    let _e432 = u_xlat3_;
    let _e435 = u_xlat0_;
    let _e437 = ((vec3(_e430) * _e432.xyz) + _e435.xyz);
    u_xlat3_.x = _e437.x;
    u_xlat3_.y = _e437.y;
    u_xlat3_.z = _e437.z;
    let _e444 = u_xlatb5_;
    let _e454 = _f_buffer2_.f_cb2_[12];
    let _e457 = (vec4<f32>(0f, 0f, 0f, 0f) < _e454.wzww).xy;
    u_xlatb5_.x = _e457.x;
    u_xlatb5_.y = _e457.y;
    let _e462 = u_xlat3_;
    let _e464 = u_xlatb5_;
    if _e464.x {
        let _e466 = u_xlat3_;
        local = _e466.xyz;
    } else {
        let _e468 = u_xlat0_;
        local = _e468.xyz;
    }
    let _e471 = local;
    u_xlat3_.x = _e471.x;
    u_xlat3_.y = _e471.y;
    u_xlat3_.z = _e471.z;
    let _e478 = u_xlat5_;
    let _e480 = u_xlat4_;
    let _e482 = u_xlat3_;
    let _e484 = (_e480.yzw * _e482.xyz);
    u_xlat5_.x = _e484.x;
    u_xlat5_.z = _e484.y;
    u_xlat5_.w = _e484.z;
    let _e491 = u_xlat3_;
    let _e493 = u_xlat5_;
    let _e498 = _f_buffer2_.f_cb2_[12];
    let _e501 = u_xlat3_;
    let _e503 = ((_e493.xzw * _e498.yyy) + _e501.xyz);
    u_xlat3_.x = _e503.x;
    u_xlat3_.y = _e503.y;
    u_xlat3_.z = _e503.z;
    let _e510 = u_xlat3_;
    let _e515 = _f_buffer2_.f_cb2_[12];
    let _e517 = u_xlat4_;
    let _e520 = u_xlat3_;
    let _e522 = ((_e515.xxx * _e517.yzw) + _e520.xyz);
    u_xlat3_.x = _e522.x;
    u_xlat3_.y = _e522.y;
    u_xlat3_.z = _e522.z;
    let _e529 = u_xlat5_;
    let _e531 = u_xlat3_;
    let _e538 = (-(_e531.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat5_.x = _e538.x;
    u_xlat5_.z = _e538.y;
    u_xlat5_.w = _e538.z;
    let _e545 = u_xlat5_;
    let _e547 = u_xlat5_;
    let _e549 = u_xlat5_;
    let _e551 = (_e547.xzw + _e549.xzw);
    u_xlat5_.x = _e551.x;
    u_xlat5_.z = _e551.y;
    u_xlat5_.w = _e551.z;
    let _e558 = u_xlat2_;
    let _e560 = u_xlat5_;
    let _e563 = u_xlat2_;
    let _e570 = ((-(_e560.xzw) * _e563.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e570.x;
    u_xlat2_.y = _e570.y;
    u_xlat2_.z = _e570.z;
    let _e577 = u_xlat5_;
    let _e579 = u_xlat3_;
    let _e581 = u_xlat3_;
    let _e583 = (_e579.xyz + _e581.xyz);
    u_xlat5_.x = _e583.x;
    u_xlat5_.z = _e583.y;
    u_xlat5_.w = _e583.z;
    let _e590 = u_xlat2_;
    let _e592 = u_xlat5_;
    let _e595 = u_xlat4_;
    let _e598 = u_xlat2_;
    let _e600 = ((-(_e592.xzw) * _e595.yzw) + _e598.xyz);
    u_xlat2_.x = _e600.x;
    u_xlat2_.y = _e600.y;
    u_xlat2_.z = _e600.z;
    let _e607 = u_xlat4_;
    let _e609 = u_xlat4_;
    let _e611 = u_xlat5_;
    let _e613 = (_e609.yzw * _e611.xzw);
    u_xlat4_.x = _e613.x;
    u_xlat4_.y = _e613.y;
    u_xlat4_.z = _e613.z;
    let _e620 = u_xlat5_;
    let _e622 = u_xlat5_;
    let _e624 = floor(_e622.xzw);
    u_xlat5_.x = _e624.x;
    u_xlat5_.z = _e624.y;
    u_xlat5_.w = _e624.z;
    let _e631 = u_xlat5_;
    let _e633 = u_xlat5_;
    let _e639 = min(_e633.xzw, vec3<f32>(1f, 1f, 1f));
    u_xlat5_.x = _e639.x;
    u_xlat5_.z = _e639.y;
    u_xlat5_.w = _e639.z;
    let _e646 = u_xlat2_;
    let _e648 = u_xlat5_;
    let _e650 = u_xlat2_;
    let _e653 = u_xlat4_;
    let _e655 = ((_e648.xzw * _e650.xyz) + _e653.xyz);
    u_xlat2_.x = _e655.x;
    u_xlat2_.y = _e655.y;
    u_xlat2_.z = _e655.z;
    let _e662 = u_xlat2_;
    let _e664 = u_xlat0_;
    let _e667 = u_xlat2_;
    let _e669 = (-(_e664.xyz) + _e667.xyz);
    u_xlat2_.x = _e669.x;
    u_xlat2_.y = _e669.y;
    u_xlat2_.z = _e669.z;
    let _e676 = u_xlat2_;
    let _e681 = _f_buffer2_.f_cb2_[12];
    let _e683 = u_xlat2_;
    let _e686 = u_xlat0_;
    let _e688 = ((_e681.zzz * _e683.xyz) + _e686.xyz);
    u_xlat2_.x = _e688.x;
    u_xlat2_.y = _e688.y;
    u_xlat2_.z = _e688.z;
    let _e695 = u_xlat2_;
    let _e697 = u_xlatb5_;
    if _e697.y {
        let _e699 = u_xlat2_;
        local_1 = _e699.xyz;
    } else {
        let _e701 = u_xlat3_;
        local_1 = _e701.xyz;
    }
    let _e704 = local_1;
    u_xlat2_.x = _e704.x;
    u_xlat2_.y = _e704.y;
    u_xlat2_.z = _e704.z;
    let _e711 = u_xlat2_;
    let _e713 = u_xlat0_;
    let _e716 = u_xlat2_;
    let _e718 = (-(_e713.xyz) + _e716.xyz);
    u_xlat2_.x = _e718.x;
    u_xlat2_.y = _e718.y;
    u_xlat2_.z = _e718.z;
    let _e725 = u_xlat1_;
    let _e729 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = dot(_e725, _e729);
    let _e732 = u_xlat1_;
    let _e736 = _f_buffer2_.f_cb2_[8];
    u_xlat1_.x = dot(_e732, _e736);
    let _e739 = u_xlat1_;
    u_xlat1_.x = min(_e739.x, 1f);
    let _e743 = u_xlat20_;
    u_xlat7_ = min(_e743, 1f);
    let _e746 = SV_Target0_;
    let _e748 = u_xlat7_;
    let _e750 = u_xlat2_;
    let _e753 = u_xlat0_;
    let _e755 = ((vec3(_e748) * _e750.xyz) + _e753.xyz);
    SV_Target0_.x = _e755.x;
    SV_Target0_.y = _e755.y;
    SV_Target0_.z = _e755.z;
    let _e766 = _f_buffer2_.f_cb2_[9];
    let _e772 = _f_buffer2_.f_cb2_[9];
    u_xlat0_.x = (-(_e766.x) + _e772.y);
    let _e776 = u_xlat1_;
    let _e778 = u_xlat0_;
    let _e784 = _f_buffer2_.f_cb2_[9];
    u_xlat0_.x = ((_e776.x * _e778.x) + _e784.x);
    let _e788 = u_xlat0_;
    let _e794 = _f_buffer2_.f_cb2_[9];
    u_xlat6_.x = (-(_e788.x) + _e794.y);
    let _e798 = u_xlat6_;
    let _e800 = u_xlat18_;
    u_xlat6_.x = (_e798.x * _e800);
    let _e806 = _f_buffer2_.f_cb2_[7];
    let _e808 = u_xlat6_;
    let _e811 = u_xlat0_;
    SV_Target0_.w = ((_e806.z * _e808.x) + _e811.x);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec3<f32>, @location(5) vs_TEXCOORD5_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e47 = SV_Target0_;
    return FragmentOutput(_e47);
}
