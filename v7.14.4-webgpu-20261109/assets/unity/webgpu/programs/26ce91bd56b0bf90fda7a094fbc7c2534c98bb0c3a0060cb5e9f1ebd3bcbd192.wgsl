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
    f_cb2_: array<vec4<f32>, 12>,
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
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec2<bool> = vec2(false);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var local: vec3<f32>;
    var local_1: vec3<f32>;

    let _e65 = vs_NORMAL0_1;
    let _e67 = vs_NORMAL0_1;
    u_xlat0_.x = dot(_e65.xyz, _e67.xyz);
    let _e71 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e71.x);
    let _e74 = u_xlat0_;
    let _e76 = u_xlat0_;
    let _e78 = vs_NORMAL0_1;
    let _e80 = (_e76.xxx * _e78.xyz);
    u_xlat0_.x = _e80.x;
    u_xlat0_.y = _e80.y;
    u_xlat0_.z = _e80.z;
    let _e88 = u_xlat0_;
    let _e93 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e88.xyz, _e93.xyz);
    let _e97 = u_xlat0_;
    u_xlat0_.x = clamp(_e97.x, 0f, 1f);
    let _e102 = u_xlat6_;
    let _e107 = _f_buffer0_.f_cb0_[6];
    let _e112 = _f_buffer1_.f_cb1_[11];
    let _e114 = (_e107.xyz * _e112.zzz);
    u_xlat6_.x = _e114.x;
    u_xlat6_.y = _e114.y;
    u_xlat6_.z = _e114.z;
    let _e121 = u_xlat0_;
    let _e123 = u_xlat6_;
    let _e125 = u_xlat0_;
    let _e128 = vs_TEXCOORD2_1;
    let _e130 = ((_e123.xyz * _e125.xxx) + _e128.xyz);
    u_xlat0_.x = _e130.x;
    u_xlat0_.y = _e130.y;
    u_xlat0_.z = _e130.z;
    let _e137 = vs_TEXCOORD0_1;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[0];
    let _e150 = textureSampleBias(f_t0_, samplerf_s0_, _e137.xy, (_e142.x + _e147.x));
    u_xlat1_ = _e150;
    let _e151 = u_xlat0_;
    let _e153 = u_xlat0_;
    let _e155 = u_xlat1_;
    let _e157 = (_e153.xyz * _e155.xyz);
    u_xlat0_.x = _e157.x;
    u_xlat0_.y = _e157.y;
    u_xlat0_.z = _e157.z;
    let _e164 = vs_TEXCOORD0_1;
    let _e169 = _f_buffer0_.f_cb0_[4];
    let _e174 = hscard_bias.values[1];
    let _e177 = textureSampleBias(f_t1_, samplerf_s1_, _e164.xy, (_e169.x + _e174.x));
    u_xlat1_ = _e177;
    let _e178 = u_xlat1_;
    let _e182 = _f_buffer2_.f_cb2_[3];
    u_xlat18_ = dot(_e178, _e182);
    let _e184 = u_xlat18_;
    u_xlat18_ = min(_e184, 1f);
    let _e187 = vs_TEXCOORD4_1;
    let _e192 = _f_buffer0_.f_cb0_[4];
    let _e197 = hscard_bias.values[3];
    let _e200 = textureSampleBias(f_t3_, samplerf_s3_, _e187.xy, (_e192.x + _e197.x));
    u_xlat2_ = _e200;
    let _e201 = u_xlat2_;
    let _e203 = u_xlat2_;
    let _e208 = _f_buffer2_.f_cb2_[5];
    let _e210 = (_e203.zxy * _e208.zxy);
    u_xlat2_.x = _e210.x;
    u_xlat2_.y = _e210.y;
    u_xlat2_.z = _e210.z;
    let _e217 = u_xlat18_;
    let _e218 = u_xlat2_;
    u_xlat18_ = (_e217 * _e218.z);
    let _e221 = u_xlat3_;
    let _e223 = u_xlat18_;
    let _e228 = _f_buffer2_.f_cb2_[2];
    let _e230 = (vec3(_e223) * _e228.xyz);
    u_xlat3_.x = _e230.x;
    u_xlat3_.y = _e230.y;
    u_xlat3_.z = _e230.z;
    let _e237 = u_xlat0_;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat2_;
    let _e244 = u_xlat3_;
    let _e246 = ((_e239.xyz * _e241.yyy) + _e244.xyz);
    u_xlat0_.x = _e246.x;
    u_xlat0_.y = _e246.y;
    u_xlat0_.z = _e246.z;
    let _e253 = u_xlat0_;
    let _e255 = u_xlat2_;
    let _e260 = _f_buffer2_.f_cb2_[4];
    let _e263 = u_xlat0_;
    let _e265 = ((_e255.xxx * _e260.xyz) + _e263.xyz);
    u_xlat0_.x = _e265.x;
    u_xlat0_.y = _e265.y;
    u_xlat0_.z = _e265.z;
    let _e273 = u_xlat2_;
    u_xlat2_.x = _e273.x;
    let _e276 = u_xlat2_;
    u_xlat2_.x = clamp(_e276.x, 0f, 1f);
    let _e281 = vs_TEXCOORD0_1;
    let _e286 = _f_buffer0_.f_cb0_[4];
    let _e291 = hscard_bias.values[2];
    let _e294 = textureSampleBias(f_t2_, samplerf_s2_, _e281.zw, (_e286.x + _e291.x));
    u_xlat3_ = _e294;
    let _e295 = u_xlat8_;
    let _e297 = u_xlat3_;
    let _e302 = _f_buffer2_.f_cb2_[9];
    let _e305 = u_xlat0_;
    let _e308 = ((_e297.xyz * _e302.xyz) + -(_e305.xyz));
    u_xlat8_.x = _e308.x;
    u_xlat8_.y = _e308.y;
    u_xlat8_.z = _e308.z;
    let _e315 = u_xlat3_;
    let _e320 = _f_buffer2_.f_cb2_[9];
    u_xlat4_ = (_e315.wxyz * _e320.wxyz);
    let _e323 = u_xlat3_;
    let _e325 = u_xlat3_;
    let _e331 = _f_buffer2_.f_cb2_[9];
    let _e338 = ((-(_e325.xyz) * _e331.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat3_.x = _e338.x;
    u_xlat3_.y = _e338.y;
    u_xlat3_.z = _e338.z;
    let _e345 = u_xlat4_;
    let _e350 = _f_buffer2_.f_cb2_[11];
    u_xlat18_ = (_e345.x * _e350.w);
    let _e353 = u_xlat18_;
    u_xlat18_ = _e353;
    let _e354 = u_xlat18_;
    u_xlat18_ = clamp(_e354, 0f, 1f);
    let _e358 = u_xlat8_;
    let _e360 = u_xlat18_;
    let _e362 = u_xlat8_;
    let _e365 = u_xlat0_;
    let _e367 = ((vec3(_e360) * _e362.xyz) + _e365.xyz);
    u_xlat8_.x = _e367.x;
    u_xlat8_.y = _e367.y;
    u_xlat8_.z = _e367.z;
    let _e374 = u_xlatb5_;
    let _e384 = _f_buffer2_.f_cb2_[11];
    let _e387 = (vec4<f32>(0f, 0f, 0f, 0f) < _e384.wzww).xy;
    u_xlatb5_.x = _e387.x;
    u_xlatb5_.y = _e387.y;
    let _e392 = u_xlat8_;
    let _e394 = u_xlatb5_;
    if _e394.x {
        let _e396 = u_xlat8_;
        local = _e396.xyz;
    } else {
        let _e398 = u_xlat0_;
        local = _e398.xyz;
    }
    let _e401 = local;
    u_xlat8_.x = _e401.x;
    u_xlat8_.y = _e401.y;
    u_xlat8_.z = _e401.z;
    let _e408 = u_xlat5_;
    let _e410 = u_xlat4_;
    let _e412 = u_xlat8_;
    let _e414 = (_e410.yzw * _e412.xyz);
    u_xlat5_.x = _e414.x;
    u_xlat5_.z = _e414.y;
    u_xlat5_.w = _e414.z;
    let _e421 = u_xlat8_;
    let _e423 = u_xlat5_;
    let _e428 = _f_buffer2_.f_cb2_[11];
    let _e431 = u_xlat8_;
    let _e433 = ((_e423.xzw * _e428.yyy) + _e431.xyz);
    u_xlat8_.x = _e433.x;
    u_xlat8_.y = _e433.y;
    u_xlat8_.z = _e433.z;
    let _e440 = u_xlat8_;
    let _e445 = _f_buffer2_.f_cb2_[11];
    let _e447 = u_xlat4_;
    let _e450 = u_xlat8_;
    let _e452 = ((_e445.xxx * _e447.yzw) + _e450.xyz);
    u_xlat8_.x = _e452.x;
    u_xlat8_.y = _e452.y;
    u_xlat8_.z = _e452.z;
    let _e459 = u_xlat5_;
    let _e461 = u_xlat8_;
    let _e468 = (-(_e461.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat5_.x = _e468.x;
    u_xlat5_.z = _e468.y;
    u_xlat5_.w = _e468.z;
    let _e475 = u_xlat5_;
    let _e477 = u_xlat5_;
    let _e479 = u_xlat5_;
    let _e481 = (_e477.xzw + _e479.xzw);
    u_xlat5_.x = _e481.x;
    u_xlat5_.z = _e481.y;
    u_xlat5_.w = _e481.z;
    let _e488 = u_xlat3_;
    let _e490 = u_xlat5_;
    let _e493 = u_xlat3_;
    let _e500 = ((-(_e490.xzw) * _e493.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat3_.x = _e500.x;
    u_xlat3_.y = _e500.y;
    u_xlat3_.z = _e500.z;
    let _e507 = u_xlat5_;
    let _e509 = u_xlat8_;
    let _e511 = u_xlat8_;
    let _e513 = (_e509.xyz + _e511.xyz);
    u_xlat5_.x = _e513.x;
    u_xlat5_.z = _e513.y;
    u_xlat5_.w = _e513.z;
    let _e520 = u_xlat3_;
    let _e522 = u_xlat5_;
    let _e525 = u_xlat4_;
    let _e528 = u_xlat3_;
    let _e530 = ((-(_e522.xzw) * _e525.yzw) + _e528.xyz);
    u_xlat3_.x = _e530.x;
    u_xlat3_.y = _e530.y;
    u_xlat3_.z = _e530.z;
    let _e537 = u_xlat4_;
    let _e539 = u_xlat4_;
    let _e541 = u_xlat5_;
    let _e543 = (_e539.yzw * _e541.xzw);
    u_xlat4_.x = _e543.x;
    u_xlat4_.y = _e543.y;
    u_xlat4_.z = _e543.z;
    let _e550 = u_xlat5_;
    let _e552 = u_xlat5_;
    let _e554 = floor(_e552.xzw);
    u_xlat5_.x = _e554.x;
    u_xlat5_.z = _e554.y;
    u_xlat5_.w = _e554.z;
    let _e561 = u_xlat5_;
    let _e563 = u_xlat5_;
    let _e569 = min(_e563.xzw, vec3<f32>(1f, 1f, 1f));
    u_xlat5_.x = _e569.x;
    u_xlat5_.z = _e569.y;
    u_xlat5_.w = _e569.z;
    let _e576 = u_xlat3_;
    let _e578 = u_xlat5_;
    let _e580 = u_xlat3_;
    let _e583 = u_xlat4_;
    let _e585 = ((_e578.xzw * _e580.xyz) + _e583.xyz);
    u_xlat3_.x = _e585.x;
    u_xlat3_.y = _e585.y;
    u_xlat3_.z = _e585.z;
    let _e592 = u_xlat3_;
    let _e594 = u_xlat0_;
    let _e597 = u_xlat3_;
    let _e599 = (-(_e594.xyz) + _e597.xyz);
    u_xlat3_.x = _e599.x;
    u_xlat3_.y = _e599.y;
    u_xlat3_.z = _e599.z;
    let _e606 = u_xlat3_;
    let _e611 = _f_buffer2_.f_cb2_[11];
    let _e613 = u_xlat3_;
    let _e616 = u_xlat0_;
    let _e618 = ((_e611.zzz * _e613.xyz) + _e616.xyz);
    u_xlat3_.x = _e618.x;
    u_xlat3_.y = _e618.y;
    u_xlat3_.z = _e618.z;
    let _e625 = u_xlat8_;
    let _e627 = u_xlatb5_;
    if _e627.y {
        let _e629 = u_xlat3_;
        local_1 = _e629.xyz;
    } else {
        let _e631 = u_xlat8_;
        local_1 = _e631.xyz;
    }
    let _e634 = local_1;
    u_xlat8_.x = _e634.x;
    u_xlat8_.y = _e634.y;
    u_xlat8_.z = _e634.z;
    let _e641 = u_xlat8_;
    let _e643 = u_xlat0_;
    let _e646 = u_xlat8_;
    let _e648 = (-(_e643.xyz) + _e646.xyz);
    u_xlat8_.x = _e648.x;
    u_xlat8_.y = _e648.y;
    u_xlat8_.z = _e648.z;
    let _e655 = u_xlat1_;
    let _e659 = _f_buffer2_.f_cb2_[10];
    u_xlat18_ = dot(_e655, _e659);
    let _e662 = u_xlat1_;
    let _e666 = _f_buffer2_.f_cb2_[7];
    u_xlat1_.x = dot(_e662, _e666);
    let _e669 = u_xlat1_;
    u_xlat1_.x = min(_e669.x, 1f);
    let _e673 = u_xlat18_;
    u_xlat18_ = min(_e673, 1f);
    let _e676 = SV_Target0_;
    let _e678 = u_xlat18_;
    let _e680 = u_xlat8_;
    let _e683 = u_xlat0_;
    let _e685 = ((vec3(_e678) * _e680.xyz) + _e683.xyz);
    SV_Target0_.x = _e685.x;
    SV_Target0_.y = _e685.y;
    SV_Target0_.z = _e685.z;
    let _e696 = _f_buffer2_.f_cb2_[8];
    let _e702 = _f_buffer2_.f_cb2_[8];
    u_xlat0_.x = (-(_e696.x) + _e702.y);
    let _e706 = u_xlat1_;
    let _e708 = u_xlat0_;
    let _e714 = _f_buffer2_.f_cb2_[8];
    u_xlat0_.x = ((_e706.x * _e708.x) + _e714.x);
    let _e718 = u_xlat0_;
    let _e724 = _f_buffer2_.f_cb2_[8];
    u_xlat6_.x = (-(_e718.x) + _e724.y);
    let _e728 = u_xlat6_;
    let _e730 = u_xlat2_;
    u_xlat6_.x = (_e728.x * _e730.x);
    let _e737 = _f_buffer2_.f_cb2_[6];
    let _e739 = u_xlat6_;
    let _e742 = u_xlat0_;
    SV_Target0_.w = ((_e737.x * _e739.x) + _e742.x);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    main_1();
    let _e47 = SV_Target0_;
    return FragmentOutput(_e47);
}
