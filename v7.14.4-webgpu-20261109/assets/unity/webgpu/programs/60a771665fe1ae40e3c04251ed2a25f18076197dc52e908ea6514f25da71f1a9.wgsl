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
    f_cb3_: array<vec4<f32>, 28>,
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
var samplerf_s0_: sampler_comparison;
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
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlatb8_: bool = false;
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e94 = vs_TEXCOORD0_1;
    let _e99 = _f_buffer0_.f_cb0_[4];
    let _e104 = hscard_bias.values[1];
    let _e107 = textureSampleBias(f_t1_, samplerf_s1_, _e94.xy, (_e99.x + _e104.x));
    u_xlat0_ = _e107;
    let _e108 = vs_TEXCOORD0_1;
    let _e113 = _f_buffer0_.f_cb0_[4];
    let _e118 = hscard_bias.values[2];
    let _e121 = textureSampleBias(f_t2_, samplerf_s2_, _e108.xy, (_e113.x + _e118.x));
    u_xlat1_ = _e121;
    let _e122 = vs_TEXCOORD0_1;
    let _e127 = _f_buffer0_.f_cb0_[4];
    let _e132 = hscard_bias.values[3];
    let _e135 = textureSampleBias(f_t3_, samplerf_s3_, _e122.xy, (_e127.x + _e132.x));
    u_xlat2_ = _e135;
    let _e136 = vs_TEXCOORD0_1;
    let _e141 = _f_buffer0_.f_cb0_[4];
    let _e146 = hscard_bias.values[4];
    let _e149 = textureSampleBias(f_t4_, samplerf_s4_, _e136.xy, (_e141.x + _e146.x));
    u_xlat3_ = _e149;
    let _e150 = vs_TEXCOORD0_1;
    let _e155 = _f_buffer0_.f_cb0_[4];
    let _e160 = hscard_bias.values[5];
    let _e163 = textureSampleBias(f_t5_, samplerf_s5_, _e150.xy, (_e155.x + _e160.x));
    u_xlat4_ = _e163;
    let _e164 = u_xlat0_;
    let _e166 = u_xlat1_;
    u_xlat1_ = (-(_e164) + _e166);
    let _e168 = u_xlat2_;
    let _e170 = u_xlat1_;
    let _e172 = u_xlat0_;
    u_xlat0_ = ((_e168.xxxx * _e170) + _e172);
    let _e174 = u_xlat0_;
    let _e176 = u_xlat3_;
    u_xlat1_ = (-(_e174) + _e176);
    let _e178 = u_xlat4_;
    let _e180 = u_xlat1_;
    let _e182 = u_xlat0_;
    u_xlat0_ = ((_e178.yyyy * _e180) + _e182);
    let _e185 = vs_NORMAL0_1;
    let _e187 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e185.xyz, _e187.xyz);
    let _e191 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e191.x);
    let _e194 = u_xlat1_;
    let _e196 = u_xlat1_;
    let _e198 = vs_NORMAL0_1;
    let _e200 = (_e196.xxx * _e198.xyz);
    u_xlat1_.x = _e200.x;
    u_xlat1_.y = _e200.y;
    u_xlat1_.z = _e200.z;
    let _e207 = vs_TEXCOORDindex3_1;
    let _e208 = _e207.xy;
    let _e209 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e208.x, _e208.y, _e209.z);
    let _e215 = txVec0_;
    let _e219 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e215.xy, _e215.z);
    u_xlat19_ = _e219;
    let _e224 = _f_buffer3_.f_cb3_[27];
    u_xlat2_.x = (-(_e224.x) + 1f);
    let _e229 = u_xlat19_;
    let _e233 = _f_buffer3_.f_cb3_[27];
    let _e236 = u_xlat2_;
    u_xlat19_ = ((_e229 * _e233.x) + _e236.x);
    let _e240 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (0f >= _e240.z);
    let _e243 = vs_TEXCOORDindex3_1;
    u_xlatb8_ = (_e243.z >= 1f);
    let _e247 = u_xlatb8_;
    let _e248 = u_xlatb2_;
    u_xlatb2_ = (_e247 || _e248);
    let _e250 = u_xlatb2_;
    if _e250 {
        local = 1f;
    } else {
        let _e252 = u_xlat19_;
        local = _e252;
    }
    let _e254 = local;
    u_xlat19_ = _e254;
    let _e255 = u_xlat19_;
    let _e259 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = (_e255 * _e259.z);
    let _e262 = u_xlat2_;
    let _e264 = u_xlat19_;
    let _e269 = _f_buffer0_.f_cb0_[6];
    let _e271 = (vec3(_e264) * _e269.xyz);
    u_xlat2_.x = _e271.x;
    u_xlat2_.y = _e271.y;
    u_xlat2_.z = _e271.z;
    let _e278 = u_xlat1_;
    let _e283 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e278.xyz, _e283.xyz);
    let _e286 = u_xlat19_;
    u_xlat19_ = clamp(_e286, 0f, 1f);
    let _e293 = _f_buffer0_.f_cb0_[10];
    let _e298 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e293.x, _e298.y);
    let _e301 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e301));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e316 = u_xlatu_loop_1_;
        let _e317 = u_xlatu20_;
        if !((_e316 < _e317)) {
            break;
        }
        {
            let _e323 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e323 >> 2u);
            let _e326 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e326 & 3u));
            let _e331 = u_xlatu4_;
            let _e337 = _f_buffer2_.f_cb2_[(i32(_e331) + 12i)];
            let _e338 = u_xlati10_;
            let _e342 = local_1[_e338];
            u_xlat4_.x = dot(_e337, bitcast<vec4<f32>>(_e342));
            let _e345 = u_xlat4_;
            u_xlati4_ = i32(_e345.x);
            let _e348 = u_xlat10_;
            let _e350 = vs_TEXCOORD1_1;
            let _e353 = u_xlati4_;
            let _e356 = _f_buffer1_.f_cb1_[_e353];
            let _e359 = u_xlati4_;
            let _e362 = _f_buffer1_.f_cb1_[_e359];
            let _e364 = ((-(_e350.xyz) * _e356.www) + _e362.xyz);
            u_xlat10_.x = _e364.x;
            u_xlat10_.y = _e364.y;
            u_xlat10_.z = _e364.z;
            let _e372 = u_xlat10_;
            let _e374 = u_xlat10_;
            u_xlat5_.x = dot(_e372.xyz, _e374.xyz);
            let _e378 = u_xlat5_;
            u_xlat5_.x = max(_e378.x, 0.000061035156f);
            let _e382 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e382.x);
            let _e385 = u_xlat10_;
            let _e387 = u_xlat10_;
            let _e389 = u_xlat11_;
            let _e391 = (_e387.xyz * vec3(_e389));
            u_xlat10_.x = _e391.x;
            u_xlat10_.y = _e391.y;
            u_xlat10_.z = _e391.z;
            let _e400 = u_xlati4_;
            let _e405 = _f_buffer1_.f_cb1_[(_e400 + 512i)];
            u_xlat11_ = (1f / _e405.x);
            let _e409 = u_xlat5_;
            u_xlat5_.x = (_e409.x * 25f);
            let _e414 = u_xlat5_;
            let _e416 = u_xlat11_;
            u_xlat5_.x = (_e414.x / _e416);
            let _e419 = u_xlat5_;
            u_xlat5_.x = (_e419.x + 1f);
            let _e426 = u_xlat5_;
            u_xlat5_.x = (1f / _e426.x);
            let _e429 = u_xlati4_;
            let _e434 = _f_buffer1_.f_cb1_[(_e429 + 768i)];
            let _e436 = u_xlat10_;
            u_xlat11_ = dot(_e434.xyz, _e436.xyz);
            let _e439 = u_xlat11_;
            let _e440 = u_xlati4_;
            let _e445 = _f_buffer1_.f_cb1_[(_e440 + 512i)];
            let _e448 = u_xlati4_;
            let _e453 = _f_buffer1_.f_cb1_[(_e448 + 512i)];
            u_xlat11_ = ((_e439 * _e445.z) + _e453.w);
            let _e456 = u_xlat11_;
            u_xlat11_ = clamp(_e456, 0f, 1f);
            let _e460 = u_xlat11_;
            let _e461 = u_xlat11_;
            u_xlat11_ = (_e460 * _e461);
            let _e464 = u_xlat11_;
            let _e465 = u_xlat5_;
            u_xlat5_.x = (_e464 * _e465.x);
            let _e468 = u_xlat5_;
            let _e470 = u_xlat5_;
            let _e472 = u_xlati4_;
            let _e477 = _f_buffer1_.f_cb1_[(_e472 + 256i)];
            let _e479 = (_e470.xxx * _e477.xyz);
            u_xlat5_.x = _e479.x;
            u_xlat5_.y = _e479.y;
            u_xlat5_.z = _e479.z;
            let _e487 = u_xlat1_;
            let _e489 = u_xlat10_;
            u_xlat4_.x = dot(_e487.xyz, _e489.xyz);
            let _e493 = u_xlat4_;
            u_xlat4_.x = clamp(_e493.x, 0f, 1f);
            let _e498 = u_xlat3_;
            let _e500 = u_xlat5_;
            let _e502 = u_xlat4_;
            let _e505 = u_xlat3_;
            let _e507 = ((_e500.xyz * _e502.xxx) + _e505.xyz);
            u_xlat3_.x = _e507.x;
            u_xlat3_.y = _e507.y;
            u_xlat3_.z = _e507.z;
        }
        continuing {
            let _e320 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e320 + 1u);
        }
    }
    let _e514 = u_xlat1_;
    let _e516 = u_xlat2_;
    let _e518 = u_xlat19_;
    let _e521 = u_xlat3_;
    let _e523 = ((_e516.xyz * vec3(_e518)) + _e521.xyz);
    u_xlat1_.x = _e523.x;
    u_xlat1_.y = _e523.y;
    u_xlat1_.z = _e523.z;
    let _e534 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e534.w);
    let _e541 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e541.w);
    let _e548 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e548.w);
    let _e551 = u_xlat2_;
    let _e553 = u_xlat2_;
    let _e555 = log2(_e553.xyz);
    u_xlat2_.x = _e555.x;
    u_xlat2_.y = _e555.y;
    u_xlat2_.z = _e555.z;
    let _e562 = u_xlat2_;
    let _e564 = u_xlat2_;
    let _e570 = (_e564.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e570.x;
    u_xlat2_.y = _e570.y;
    u_xlat2_.z = _e570.z;
    let _e577 = u_xlat2_;
    let _e579 = u_xlat2_;
    let _e581 = exp2(_e579.xyz);
    u_xlat2_.x = _e581.x;
    u_xlat2_.y = _e581.y;
    u_xlat2_.z = _e581.z;
    let _e588 = u_xlat2_;
    let _e590 = u_xlat2_;
    let _e604 = ((_e590.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e604.x;
    u_xlat2_.y = _e604.y;
    u_xlat2_.z = _e604.z;
    let _e611 = u_xlat2_;
    let _e613 = u_xlat2_;
    let _e619 = clamp(_e613.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e619.x;
    u_xlat2_.y = _e619.y;
    u_xlat2_.z = _e619.z;
    let _e626 = u_xlat1_;
    let _e628 = u_xlat1_;
    let _e630 = u_xlat2_;
    let _e632 = (_e628.xyz + _e630.xyz);
    u_xlat1_.x = _e632.x;
    u_xlat1_.y = _e632.y;
    u_xlat1_.z = _e632.z;
    let _e639 = SV_Target0_;
    let _e641 = u_xlat0_;
    let _e643 = u_xlat1_;
    let _e645 = (_e641.xyz * _e643.xyz);
    SV_Target0_.x = _e645.x;
    SV_Target0_.y = _e645.y;
    SV_Target0_.z = _e645.z;
    let _e653 = u_xlat0_;
    SV_Target0_.w = _e653.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e60 = SV_Target0_;
    return FragmentOutput(_e60);
}
