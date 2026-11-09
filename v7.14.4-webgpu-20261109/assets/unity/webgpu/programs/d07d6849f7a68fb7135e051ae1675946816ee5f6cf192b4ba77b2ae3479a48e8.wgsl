struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 11>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 1024>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 30>,
}

struct f_buffer3_ {
    f_cb3_: array<vec4<f32>, 4>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

const ImmCB_0_: array<vec4<u32>, 4> = array<vec4<u32>, 4>(vec4<u32>(1065353216u, 0u, 0u, 0u), vec4<u32>(0u, 1065353216u, 0u, 0u), vec4<u32>(0u, 0u, 1065353216u, 0u), vec4<u32>(0u, 0u, 0u, 1065353216u));

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(1) @binding(1) 
var<uniform> _f_buffer1_: f_buffer1_;
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(1) @binding(3) 
var<uniform> _f_buffer3_: f_buffer3_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlatb1_: bool = false;
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: f32 = 0f;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e85 = vs_TEXCOORD0_1;
    let _e90 = _f_buffer0_.f_cb0_[4];
    let _e95 = hscard_bias.values[0];
    let _e98 = textureSampleBias(f_t0_, samplerf_s0_, _e85.xy, (_e90.x + _e95.x));
    u_xlat0_ = _e98;
    let _e100 = vs_TEXCOORD0_1;
    let _e102 = dpdx(_e100.x);
    u_xlat1_.x = _e102;
    let _e103 = vs_TEXCOORD0_1;
    let _e105 = dpdy(_e103.x);
    u_xlat7_ = _e105;
    let _e107 = u_xlat7_;
    let _e109 = u_xlat1_;
    u_xlat1_.x = (abs(_e107) + abs(_e109.x));
    let _e113 = u_xlat1_;
    let _e115 = u_xlat1_;
    let _e121 = (_e115.xx * vec2<f32>(0.5f, -0.5f));
    u_xlat1_.x = _e121.x;
    u_xlat1_.y = _e121.y;
    u_xlat1_.z = 0f;
    let _e128 = u_xlat1_;
    let _e130 = vs_TEXCOORD0_1;
    u_xlat2_ = (_e128.xzyz + _e130.xyxy);
    let _e133 = u_xlat2_;
    let _e138 = _f_buffer0_.f_cb0_[4];
    let _e143 = hscard_bias.values[0];
    let _e146 = textureSampleBias(f_t0_, samplerf_s0_, _e133.xy, (_e138.x + _e143.x));
    u_xlat3_ = _e146;
    let _e147 = u_xlat0_;
    let _e148 = u_xlat3_;
    u_xlat0_ = (_e147 + _e148);
    let _e150 = u_xlat2_;
    let _e155 = _f_buffer0_.f_cb0_[4];
    let _e160 = hscard_bias.values[0];
    let _e163 = textureSampleBias(f_t0_, samplerf_s0_, _e150.zw, (_e155.x + _e160.x));
    u_xlat2_ = _e163;
    let _e164 = u_xlat0_;
    let _e165 = u_xlat2_;
    u_xlat0_ = (_e164 + _e165);
    let _e167 = u_xlat1_;
    let _e169 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e167.zxzy + _e169.xyxy);
    let _e172 = u_xlat1_;
    let _e177 = _f_buffer0_.f_cb0_[4];
    let _e182 = hscard_bias.values[0];
    let _e185 = textureSampleBias(f_t0_, samplerf_s0_, _e172.xy, (_e177.x + _e182.x));
    u_xlat2_ = _e185;
    let _e186 = u_xlat0_;
    let _e187 = u_xlat2_;
    u_xlat0_ = (_e186 + _e187);
    let _e189 = u_xlat1_;
    let _e194 = _f_buffer0_.f_cb0_[4];
    let _e199 = hscard_bias.values[0];
    let _e202 = textureSampleBias(f_t0_, samplerf_s0_, _e189.zw, (_e194.x + _e199.x));
    u_xlat1_ = _e202;
    let _e203 = u_xlat0_;
    let _e204 = u_xlat1_;
    u_xlat0_ = (_e203 + _e204);
    let _e206 = u_xlat0_;
    u_xlat0_ = (_e206 * vec4<f32>(0.2f, 0.2f, 0.2f, 0.2f));
    let _e217 = _f_buffer3_.f_cb3_[1];
    u_xlatb1_ = (0f < _e217.x);
    let _e220 = u_xlatb1_;
    if _e220 {
        {
            let _e221 = vs_TEXCOORD5_1;
            let _e226 = _f_buffer0_.f_cb0_[4];
            let _e231 = hscard_bias.values[1];
            let _e234 = textureSampleBias(f_t1_, samplerf_s1_, _e221.xy, (_e226.x + _e231.x));
            u_xlat1_ = _e234;
            let _e238 = _f_buffer3_.f_cb3_[3];
            let _e240 = u_xlat1_;
            u_xlatb1_ = (_e238.x < _e240.x);
            let _e244 = u_xlatb1_;
            if _e244 {
                local = 1f;
            } else {
                local = 0f;
            }
            let _e249 = local;
            u_xlat1_.x = _e249;
            let _e251 = u_xlat0_;
            let _e253 = u_xlat1_;
            u_xlat0_.w = (_e251.w * _e253.x);
        }
    }
    let _e257 = vs_NORMAL0_1;
    let _e259 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e257.xyz, _e259.xyz);
    let _e263 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e263.x);
    let _e266 = u_xlat1_;
    let _e268 = u_xlat1_;
    let _e270 = vs_NORMAL0_1;
    let _e272 = (_e268.xxx * _e270.xyz);
    u_xlat1_.x = _e272.x;
    u_xlat1_.y = _e272.y;
    u_xlat1_.z = _e272.z;
    let _e279 = u_xlat2_;
    let _e284 = _f_buffer0_.f_cb0_[6];
    let _e289 = _f_buffer2_.f_cb2_[11];
    let _e291 = (_e284.xyz * _e289.zzz);
    u_xlat2_.x = _e291.x;
    u_xlat2_.y = _e291.y;
    u_xlat2_.z = _e291.z;
    let _e298 = u_xlat1_;
    let _e303 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e298.xyz, _e303.xyz);
    let _e306 = u_xlat19_;
    u_xlat19_ = clamp(_e306, 0f, 1f);
    let _e313 = _f_buffer0_.f_cb0_[10];
    let _e318 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e313.x, _e318.y);
    let _e321 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e321));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e336 = u_xlatu_loop_1_;
        let _e337 = u_xlatu20_;
        if !((_e336 < _e337)) {
            break;
        }
        {
            let _e343 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e343 >> 2u);
            let _e346 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e346 & 3u));
            let _e350 = u_xlatu4_;
            let _e356 = _f_buffer2_.f_cb2_[(i32(_e350) + 12i)];
            let _e357 = u_xlati10_;
            let _e361 = local_1[_e357];
            u_xlat4_ = dot(_e356, bitcast<vec4<f32>>(_e361));
            let _e364 = u_xlat4_;
            u_xlati4_ = i32(_e364);
            let _e366 = u_xlat10_;
            let _e368 = vs_TEXCOORD1_1;
            let _e371 = u_xlati4_;
            let _e374 = _f_buffer1_.f_cb1_[_e371];
            let _e377 = u_xlati4_;
            let _e380 = _f_buffer1_.f_cb1_[_e377];
            let _e382 = ((-(_e368.xyz) * _e374.www) + _e380.xyz);
            u_xlat10_.x = _e382.x;
            u_xlat10_.y = _e382.y;
            u_xlat10_.z = _e382.z;
            let _e390 = u_xlat10_;
            let _e392 = u_xlat10_;
            u_xlat5_.x = dot(_e390.xyz, _e392.xyz);
            let _e396 = u_xlat5_;
            u_xlat5_.x = max(_e396.x, 0.000061035156f);
            let _e400 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e400.x);
            let _e403 = u_xlat10_;
            let _e405 = u_xlat10_;
            let _e407 = u_xlat11_;
            let _e409 = (_e405.xyz * vec3(_e407));
            u_xlat10_.x = _e409.x;
            u_xlat10_.y = _e409.y;
            u_xlat10_.z = _e409.z;
            let _e418 = u_xlati4_;
            let _e423 = _f_buffer1_.f_cb1_[(_e418 + 512i)];
            u_xlat11_ = (1f / _e423.x);
            let _e427 = u_xlat5_;
            u_xlat5_.x = (_e427.x * 25f);
            let _e432 = u_xlat5_;
            let _e434 = u_xlat11_;
            u_xlat5_.x = (_e432.x / _e434);
            let _e437 = u_xlat5_;
            u_xlat5_.x = (_e437.x + 1f);
            let _e444 = u_xlat5_;
            u_xlat5_.x = (1f / _e444.x);
            let _e447 = u_xlati4_;
            let _e452 = _f_buffer1_.f_cb1_[(_e447 + 768i)];
            let _e454 = u_xlat10_;
            u_xlat11_ = dot(_e452.xyz, _e454.xyz);
            let _e457 = u_xlat11_;
            let _e458 = u_xlati4_;
            let _e463 = _f_buffer1_.f_cb1_[(_e458 + 512i)];
            let _e466 = u_xlati4_;
            let _e471 = _f_buffer1_.f_cb1_[(_e466 + 512i)];
            u_xlat11_ = ((_e457 * _e463.z) + _e471.w);
            let _e474 = u_xlat11_;
            u_xlat11_ = clamp(_e474, 0f, 1f);
            let _e478 = u_xlat11_;
            let _e479 = u_xlat11_;
            u_xlat11_ = (_e478 * _e479);
            let _e482 = u_xlat11_;
            let _e483 = u_xlat5_;
            u_xlat5_.x = (_e482 * _e483.x);
            let _e486 = u_xlat5_;
            let _e488 = u_xlat5_;
            let _e490 = u_xlati4_;
            let _e495 = _f_buffer1_.f_cb1_[(_e490 + 256i)];
            let _e497 = (_e488.xxx * _e495.xyz);
            u_xlat5_.x = _e497.x;
            u_xlat5_.y = _e497.y;
            u_xlat5_.z = _e497.z;
            let _e504 = u_xlat1_;
            let _e506 = u_xlat10_;
            u_xlat4_ = dot(_e504.xyz, _e506.xyz);
            let _e509 = u_xlat4_;
            u_xlat4_ = clamp(_e509, 0f, 1f);
            let _e513 = u_xlat3_;
            let _e515 = u_xlat5_;
            let _e517 = u_xlat4_;
            let _e520 = u_xlat3_;
            let _e522 = ((_e515.xyz * vec3(_e517)) + _e520.xyz);
            u_xlat3_.x = _e522.x;
            u_xlat3_.y = _e522.y;
            u_xlat3_.z = _e522.z;
        }
        continuing {
            let _e340 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e340 + 1u);
        }
    }
    let _e529 = u_xlat1_;
    let _e531 = u_xlat2_;
    let _e533 = u_xlat19_;
    let _e536 = u_xlat3_;
    let _e538 = ((_e531.xyz * vec3(_e533)) + _e536.xyz);
    u_xlat1_.x = _e538.x;
    u_xlat1_.y = _e538.y;
    u_xlat1_.z = _e538.z;
    let _e549 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e549.w);
    let _e556 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e556.w);
    let _e563 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e563.w);
    let _e566 = u_xlat2_;
    let _e568 = u_xlat2_;
    let _e570 = log2(_e568.xyz);
    u_xlat2_.x = _e570.x;
    u_xlat2_.y = _e570.y;
    u_xlat2_.z = _e570.z;
    let _e577 = u_xlat2_;
    let _e579 = u_xlat2_;
    let _e585 = (_e579.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e585.x;
    u_xlat2_.y = _e585.y;
    u_xlat2_.z = _e585.z;
    let _e592 = u_xlat2_;
    let _e594 = u_xlat2_;
    let _e596 = exp2(_e594.xyz);
    u_xlat2_.x = _e596.x;
    u_xlat2_.y = _e596.y;
    u_xlat2_.z = _e596.z;
    let _e603 = u_xlat2_;
    let _e605 = u_xlat2_;
    let _e619 = ((_e605.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e619.x;
    u_xlat2_.y = _e619.y;
    u_xlat2_.z = _e619.z;
    let _e626 = u_xlat2_;
    let _e628 = u_xlat2_;
    let _e634 = clamp(_e628.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e634.x;
    u_xlat2_.y = _e634.y;
    u_xlat2_.z = _e634.z;
    let _e641 = u_xlat1_;
    let _e643 = u_xlat1_;
    let _e645 = u_xlat2_;
    let _e647 = (_e643.xyz + _e645.xyz);
    u_xlat1_.x = _e647.x;
    u_xlat1_.y = _e647.y;
    u_xlat1_.z = _e647.z;
    let _e654 = u_xlat1_;
    let _e656 = u_xlat0_;
    let _e658 = u_xlat1_;
    let _e660 = (_e656.xyz * _e658.xyz);
    u_xlat1_.x = _e660.x;
    u_xlat1_.y = _e660.y;
    u_xlat1_.z = _e660.z;
    let _e667 = u_xlat0_;
    let _e669 = u_xlat0_;
    let _e671 = u_xlat1_;
    let _e673 = (_e669.www * _e671.xyz);
    u_xlat0_.x = _e673.x;
    u_xlat0_.y = _e673.y;
    u_xlat0_.z = _e673.z;
    let _e680 = u_xlat0_;
    SV_Target0_ = _e680;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
