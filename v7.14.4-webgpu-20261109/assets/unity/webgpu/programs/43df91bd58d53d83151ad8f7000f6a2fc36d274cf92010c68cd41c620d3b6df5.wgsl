struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 34>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 6>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_TEXCOORD3_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_TEXCOORD5_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlatb3_: vec3<bool> = vec3(false);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat12_: f32 = 0f;
    var hlslcc_movcTemp: vec4<f32>;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;

    let _e59 = vs_TEXCOORD0_1;
    let _e64 = _f_buffer0_.f_cb0_[4];
    let _e69 = hscard_bias.values[1];
    let _e72 = textureSampleBias(f_t1_, samplerf_s1_, _e59.xy, (_e64.x + _e69.x));
    u_xlat0_ = _e72;
    let _e74 = u_xlat0_;
    let _e76 = u_xlat0_;
    u_xlat0_.x = (_e74.x * _e76.w);
    let _e79 = u_xlat0_;
    let _e81 = u_xlat0_;
    let _e92 = ((_e81.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e92.x;
    u_xlat0_.y = _e92.y;
    let _e97 = u_xlat1_;
    let _e99 = u_xlat0_;
    let _e101 = vs_TEXCOORD4_1;
    let _e103 = (_e99.yyy * _e101.xyz);
    u_xlat1_.x = _e103.x;
    u_xlat1_.y = _e103.y;
    u_xlat1_.z = _e103.z;
    let _e110 = u_xlat1_;
    let _e112 = u_xlat0_;
    let _e114 = vs_TEXCOORD3_1;
    let _e117 = u_xlat1_;
    let _e119 = ((_e112.xxx * _e114.xyz) + _e117.xyz);
    u_xlat1_.x = _e119.x;
    u_xlat1_.y = _e119.y;
    u_xlat1_.z = _e119.z;
    let _e127 = u_xlat0_;
    let _e129 = u_xlat0_;
    u_xlat0_.x = dot(_e127.xy, _e129.xy);
    let _e133 = u_xlat0_;
    u_xlat0_.x = min(_e133.x, 1f);
    let _e138 = u_xlat0_;
    u_xlat0_.x = (-(_e138.x) + 1f);
    let _e144 = u_xlat0_;
    u_xlat0_.x = sqrt(_e144.x);
    let _e148 = u_xlat0_;
    u_xlat0_.x = max(_e148.x, 0.0000000000000001f);
    let _e152 = u_xlat0_;
    let _e154 = u_xlat0_;
    let _e156 = vs_TEXCOORD2_1;
    let _e159 = u_xlat1_;
    let _e161 = ((_e154.xxx * _e156.xyz) + _e159.xyz);
    u_xlat0_.x = _e161.x;
    u_xlat0_.y = _e161.y;
    u_xlat0_.z = _e161.z;
    let _e168 = u_xlat0_;
    let _e170 = u_xlat0_;
    u_xlat12_ = dot(_e168.xyz, _e170.xyz);
    let _e173 = u_xlat12_;
    u_xlat12_ = inverseSqrt(_e173);
    let _e175 = u_xlat0_;
    let _e177 = u_xlat12_;
    let _e179 = u_xlat0_;
    let _e181 = (vec3(_e177) * _e179.xyz);
    u_xlat0_.x = _e181.x;
    u_xlat0_.y = _e181.y;
    u_xlat0_.z = _e181.z;
    let _e189 = u_xlat0_;
    let _e191 = u_xlat0_;
    u_xlat1_.x = (_e189.y * _e191.y);
    let _e195 = u_xlat0_;
    let _e197 = u_xlat0_;
    let _e200 = u_xlat1_;
    u_xlat1_.x = ((_e195.x * _e197.x) + -(_e200.x));
    let _e204 = u_xlat0_;
    let _e206 = u_xlat0_;
    u_xlat2_ = (_e204.yzzx * _e206.xyzz);
    let _e213 = _f_buffer1_.f_cb1_[30];
    let _e214 = u_xlat2_;
    u_xlat3_.x = dot(_e213, _e214);
    let _e220 = _f_buffer1_.f_cb1_[31];
    let _e221 = u_xlat2_;
    u_xlat3_.y = dot(_e220, _e221);
    let _e227 = _f_buffer1_.f_cb1_[32];
    let _e228 = u_xlat2_;
    u_xlat3_.z = dot(_e227, _e228);
    let _e230 = u_xlat1_;
    let _e235 = _f_buffer1_.f_cb1_[33];
    let _e237 = u_xlat1_;
    let _e240 = u_xlat3_;
    let _e242 = ((_e235.xyz * _e237.xxx) + _e240.xyz);
    u_xlat1_.x = _e242.x;
    u_xlat1_.y = _e242.y;
    u_xlat1_.z = _e242.z;
    u_xlat0_.w = 1f;
    let _e255 = _f_buffer1_.f_cb1_[27];
    let _e256 = u_xlat0_;
    u_xlat2_.x = dot(_e255, _e256);
    let _e262 = _f_buffer1_.f_cb1_[28];
    let _e263 = u_xlat0_;
    u_xlat2_.y = dot(_e262, _e263);
    let _e269 = _f_buffer1_.f_cb1_[29];
    let _e270 = u_xlat0_;
    u_xlat2_.z = dot(_e269, _e270);
    let _e272 = u_xlat1_;
    let _e274 = u_xlat1_;
    let _e276 = u_xlat2_;
    let _e278 = (_e274.xyz + _e276.xyz);
    u_xlat1_.x = _e278.x;
    u_xlat1_.y = _e278.y;
    u_xlat1_.z = _e278.z;
    let _e285 = u_xlat2_;
    let _e287 = u_xlat1_;
    let _e290 = log2(abs(_e287.xyz));
    u_xlat2_.x = _e290.x;
    u_xlat2_.y = _e290.y;
    u_xlat2_.z = _e290.z;
    let _e297 = u_xlat2_;
    let _e299 = u_xlat2_;
    let _e305 = (_e299.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e305.x;
    u_xlat2_.y = _e305.y;
    u_xlat2_.z = _e305.z;
    let _e312 = u_xlat2_;
    let _e314 = u_xlat2_;
    let _e316 = exp2(_e314.xyz);
    u_xlat2_.x = _e316.x;
    u_xlat2_.y = _e316.y;
    u_xlat2_.z = _e316.z;
    let _e323 = u_xlat2_;
    let _e325 = u_xlat2_;
    let _e339 = ((_e325.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e339.x;
    u_xlat2_.y = _e339.y;
    u_xlat2_.z = _e339.z;
    let _e346 = u_xlatb3_;
    let _e353 = u_xlat1_;
    let _e356 = (vec4<f32>(0.0031308f, 0.0031308f, 0.0031308f, 0f) >= _e353.xyzx).xyz;
    u_xlatb3_.x = _e356.x;
    u_xlatb3_.y = _e356.y;
    u_xlatb3_.z = _e356.z;
    let _e363 = u_xlat1_;
    let _e365 = u_xlat1_;
    let _e371 = (_e365.xyz * vec3<f32>(12.92321f, 12.92321f, 12.92321f));
    u_xlat1_.x = _e371.x;
    u_xlat1_.y = _e371.y;
    u_xlat1_.z = _e371.z;
    {
        let _e378 = u_xlat1_;
        hlslcc_movcTemp = _e378;
        let _e381 = u_xlatb3_;
        if _e381.x {
            let _e383 = u_xlat1_;
            local = _e383.x;
        } else {
            let _e385 = u_xlat2_;
            local = _e385.x;
        }
        let _e388 = local;
        hlslcc_movcTemp.x = _e388;
        let _e390 = u_xlatb3_;
        if _e390.y {
            let _e392 = u_xlat1_;
            local_1 = _e392.y;
        } else {
            let _e394 = u_xlat2_;
            local_1 = _e394.y;
        }
        let _e397 = local_1;
        hlslcc_movcTemp.y = _e397;
        let _e399 = u_xlatb3_;
        if _e399.z {
            let _e401 = u_xlat1_;
            local_2 = _e401.z;
        } else {
            let _e403 = u_xlat2_;
            local_2 = _e403.z;
        }
        let _e406 = local_2;
        hlslcc_movcTemp.z = _e406;
        let _e407 = hlslcc_movcTemp;
        u_xlat1_ = _e407;
    }
    let _e409 = vs_TEXCOORD2_1;
    u_xlat2_.x = _e409.w;
    let _e412 = vs_TEXCOORD3_1;
    u_xlat2_.y = _e412.w;
    let _e415 = vs_TEXCOORD4_1;
    u_xlat2_.z = _e415.w;
    let _e417 = u_xlat2_;
    let _e419 = u_xlat2_;
    u_xlat12_ = dot(_e417.xyz, _e419.xyz);
    let _e422 = u_xlat12_;
    u_xlat12_ = max(_e422, 0.000061035156f);
    let _e425 = u_xlat12_;
    u_xlat12_ = inverseSqrt(_e425);
    let _e427 = u_xlat2_;
    let _e429 = u_xlat2_;
    let _e431 = u_xlat12_;
    let _e437 = _f_buffer0_.f_cb0_[5];
    let _e439 = ((_e429.xyz * vec3(_e431)) + _e437.xyz);
    u_xlat2_.x = _e439.x;
    u_xlat2_.y = _e439.y;
    u_xlat2_.z = _e439.z;
    let _e446 = u_xlat2_;
    let _e448 = u_xlat2_;
    u_xlat12_ = dot(_e446.xyz, _e448.xyz);
    let _e451 = u_xlat12_;
    u_xlat12_ = max(_e451, 0.000000000000000000000000000000000000011754944f);
    let _e454 = u_xlat12_;
    u_xlat12_ = inverseSqrt(_e454);
    let _e456 = u_xlat2_;
    let _e458 = u_xlat12_;
    let _e460 = u_xlat2_;
    let _e462 = (vec3(_e458) * _e460.xyz);
    u_xlat2_.x = _e462.x;
    u_xlat2_.y = _e462.y;
    u_xlat2_.z = _e462.z;
    let _e469 = u_xlat0_;
    let _e471 = u_xlat2_;
    u_xlat12_ = dot(_e469.xyz, _e471.xyz);
    let _e474 = u_xlat12_;
    u_xlat12_ = clamp(_e474, 0f, 1f);
    let _e479 = u_xlat0_;
    let _e484 = _f_buffer0_.f_cb0_[5];
    u_xlat0_.x = dot(_e479.xyz, _e484.xyz);
    let _e488 = u_xlat0_;
    u_xlat0_.x = clamp(_e488.x, 0f, 1f);
    let _e494 = u_xlat12_;
    u_xlat4_.x = log2(_e494);
    let _e496 = vs_TEXCOORD0_1;
    let _e501 = _f_buffer0_.f_cb0_[4];
    let _e506 = hscard_bias.values[3];
    let _e509 = textureSampleBias(f_t3_, samplerf_s3_, _e496.xy, (_e501.x + _e506.x));
    u_xlat2_ = _e509;
    let _e510 = u_xlat2_;
    let _e514 = _f_buffer2_.f_cb2_[3];
    u_xlat2_ = (_e510 * _e514);
    let _e516 = u_xlat2_;
    u_xlat8_ = ((_e516.w * 10f) + 1f);
    let _e522 = u_xlat8_;
    u_xlat8_ = exp2(_e522);
    let _e525 = u_xlat4_;
    let _e527 = u_xlat8_;
    u_xlat4_.x = (_e525.x * _e527);
    let _e530 = u_xlat4_;
    u_xlat4_.x = exp2(_e530.x);
    let _e533 = u_xlat4_;
    let _e535 = u_xlat4_;
    let _e537 = u_xlat2_;
    let _e539 = (_e535.xxx * _e537.xyz);
    u_xlat4_.x = _e539.x;
    u_xlat4_.y = _e539.y;
    u_xlat4_.z = _e539.z;
    let _e546 = u_xlat2_;
    let _e551 = _f_buffer0_.f_cb0_[6];
    let _e556 = _f_buffer1_.f_cb1_[11];
    let _e558 = (_e551.xyz * _e556.zzz);
    u_xlat2_.x = _e558.x;
    u_xlat2_.y = _e558.y;
    u_xlat2_.z = _e558.z;
    let _e565 = u_xlat4_;
    let _e567 = u_xlat4_;
    let _e569 = u_xlat2_;
    let _e571 = (_e567.xyz * _e569.xyz);
    u_xlat4_.x = _e571.x;
    u_xlat4_.y = _e571.y;
    u_xlat4_.z = _e571.z;
    let _e578 = u_xlat2_;
    let _e580 = u_xlat0_;
    let _e582 = u_xlat2_;
    let _e584 = (_e580.xxx * _e582.xyz);
    u_xlat2_.x = _e584.x;
    u_xlat2_.y = _e584.y;
    u_xlat2_.z = _e584.z;
    let _e591 = vs_TEXCOORD0_1;
    let _e596 = _f_buffer0_.f_cb0_[4];
    let _e601 = hscard_bias.values[0];
    let _e604 = textureSampleBias(f_t0_, samplerf_s0_, _e591.xy, (_e596.x + _e601.x));
    u_xlat3_ = _e604;
    let _e605 = u_xlat3_;
    let _e610 = _f_buffer2_.f_cb2_[2];
    u_xlat3_ = (_e605.wxyz * _e610.wxyz);
    let _e613 = u_xlat0_;
    let _e615 = u_xlat2_;
    let _e617 = u_xlat3_;
    let _e620 = u_xlat4_;
    let _e622 = ((_e615.xyz * _e617.yzw) + _e620.xyz);
    u_xlat0_.x = _e622.x;
    u_xlat0_.y = _e622.y;
    u_xlat0_.z = _e622.z;
    let _e629 = u_xlat0_;
    let _e631 = u_xlat1_;
    let _e633 = u_xlat3_;
    let _e636 = u_xlat0_;
    let _e638 = ((_e631.xyz * _e633.yzw) + _e636.xyz);
    u_xlat0_.x = _e638.x;
    u_xlat0_.y = _e638.y;
    u_xlat0_.z = _e638.z;
    let _e645 = u_xlat0_;
    let _e647 = vs_TEXCOORD5_1;
    let _e649 = u_xlat3_;
    let _e652 = u_xlat0_;
    let _e654 = ((_e647.yzw * _e649.yzw) + _e652.xyz);
    u_xlat0_.x = _e654.x;
    u_xlat0_.y = _e654.y;
    u_xlat0_.z = _e654.z;
    let _e661 = vs_TEXCOORD0_1;
    let _e666 = _f_buffer0_.f_cb0_[4];
    let _e671 = hscard_bias.values[2];
    let _e674 = textureSampleBias(f_t2_, samplerf_s2_, _e661.xy, (_e666.x + _e671.x));
    u_xlat1_ = _e674;
    let _e675 = SV_Target0_;
    let _e677 = u_xlat1_;
    let _e682 = _f_buffer2_.f_cb2_[4];
    let _e685 = u_xlat0_;
    let _e687 = ((_e677.xyz * _e682.xyz) + _e685.xyz);
    SV_Target0_.x = _e687.x;
    SV_Target0_.y = _e687.y;
    SV_Target0_.z = _e687.z;
    let _e697 = _f_buffer2_.f_cb2_[5];
    u_xlatb0_ = (_e697.y == 1f);
    let _e702 = u_xlatb0_;
    if _e702 {
        let _e703 = u_xlat3_;
        local_3 = _e703.x;
    } else {
        local_3 = 1f;
    }
    let _e707 = local_3;
    SV_Target0_.w = _e707;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(5) vs_TEXCOORD5_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    main_1();
    let _e51 = SV_Target0_;
    return FragmentOutput(_e51);
}
