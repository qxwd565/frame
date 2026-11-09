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
    f_cb3_: array<vec4<f32>, 5>,
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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlati5_: i32 = 0i;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec3<f32> = vec3(0f);
    var u_xlat23_: f32 = 0f;
    var u_xlatu23_: u32 = 0u;
    var u_xlatu24_: u32 = 0u;
    var u_xlat25_: f32 = 0f;
    var u_xlati25_: i32 = 0i;
    var u_xlatu25_: u32 = 0u;
    var u_xlatb25_: bool = false;
    var u_xlat26_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e84 = vs_TEXCOORD0_1;
    let _e89 = _f_buffer0_.f_cb0_[4];
    let _e94 = hscard_bias.values[0];
    let _e97 = textureSampleBias(f_t0_, samplerf_s0_, _e84.xy, (_e89.x + _e94.x));
    u_xlat0_ = _e97;
    let _e98 = vs_TEXCOORD1_1;
    let _e103 = _f_buffer0_.f_cb0_[4];
    let _e108 = hscard_bias.values[1];
    let _e111 = textureSampleBias(f_t1_, samplerf_s1_, _e98.xy, (_e103.x + _e108.x));
    u_xlat1_ = _e111;
    let _e112 = u_xlat1_;
    let _e114 = u_xlat0_;
    let _e117 = u_xlat1_;
    let _e119 = (-(_e114.xyz) + _e117.xyz);
    u_xlat1_.x = _e119.x;
    u_xlat1_.y = _e119.y;
    u_xlat1_.z = _e119.z;
    let _e126 = u_xlat0_;
    let _e131 = _f_buffer3_.f_cb3_[4];
    let _e133 = u_xlat1_;
    let _e136 = u_xlat0_;
    let _e138 = ((_e131.xxx * _e133.xyz) + _e136.xyz);
    u_xlat0_.x = _e138.x;
    u_xlat0_.y = _e138.y;
    u_xlat0_.z = _e138.z;
    let _e149 = _f_buffer3_.f_cb3_[4];
    u_xlat1_.x = _e149.y;
    let _e152 = u_xlat1_;
    u_xlat1_.x = clamp(_e152.x, 0f, 1f);
    let _e158 = u_xlat1_;
    u_xlat8_.x = (-(_e158.x) + 1f);
    let _e163 = u_xlat8_;
    let _e165 = u_xlat0_;
    let _e167 = u_xlat8_;
    let _e169 = (_e165.xyz * _e167.xxx);
    u_xlat8_.x = _e169.x;
    u_xlat8_.y = _e169.y;
    u_xlat8_.z = _e169.z;
    let _e177 = u_xlat1_;
    let _e182 = _f_buffer3_.f_cb3_[4];
    u_xlat1_.x = (_e177.x + _e182.z);
    let _e185 = u_xlat0_;
    let _e187 = u_xlat0_;
    let _e189 = u_xlat1_;
    let _e191 = (_e187.xyz * _e189.xxx);
    u_xlat0_.x = _e191.x;
    u_xlat0_.y = _e191.y;
    u_xlat0_.z = _e191.z;
    let _e199 = vs_NORMAL0_1;
    let _e201 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e199.xyz, _e201.xyz);
    let _e205 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e205.x);
    let _e208 = u_xlat2_;
    let _e210 = u_xlat1_;
    let _e212 = vs_NORMAL0_1;
    let _e214 = (_e210.xxx * _e212.xyz);
    u_xlat2_.x = _e214.x;
    u_xlat2_.y = _e214.y;
    u_xlat2_.z = _e214.z;
    let _e221 = u_xlat3_;
    let _e226 = _f_buffer0_.f_cb0_[6];
    let _e231 = _f_buffer2_.f_cb2_[11];
    let _e233 = (_e226.xyz * _e231.zzz);
    u_xlat3_.x = _e233.x;
    u_xlat3_.y = _e233.y;
    u_xlat3_.z = _e233.z;
    let _e241 = u_xlat2_;
    let _e246 = _f_buffer0_.f_cb0_[5];
    u_xlat1_.x = dot(_e241.xyz, _e246.xyz);
    let _e250 = u_xlat1_;
    u_xlat1_.x = clamp(_e250.x, 0f, 1f);
    let _e258 = _f_buffer0_.f_cb0_[10];
    let _e263 = _f_buffer2_.f_cb2_[11];
    u_xlat23_ = min(_e258.x, _e263.y);
    let _e266 = u_xlat23_;
    u_xlatu23_ = u32(i32(_e266));
    u_xlat4_.x = 0f;
    u_xlat4_.y = 0f;
    u_xlat4_.z = 0f;
    loop {
        let _e280 = u_xlatu_loop_1_;
        let _e281 = u_xlatu23_;
        if !((_e280 < _e281)) {
            break;
        }
        {
            let _e287 = u_xlatu_loop_1_;
            u_xlatu25_ = (_e287 >> 2u);
            let _e290 = u_xlatu_loop_1_;
            u_xlati5_ = i32((_e290 & 3u));
            let _e294 = u_xlatu25_;
            let _e300 = _f_buffer2_.f_cb2_[(i32(_e294) + 12i)];
            let _e301 = u_xlati5_;
            let _e305 = local[_e301];
            u_xlat25_ = dot(_e300, bitcast<vec4<f32>>(_e305));
            let _e308 = u_xlat25_;
            u_xlati25_ = i32(_e308);
            let _e310 = u_xlat5_;
            let _e312 = vs_TEXCOORD2_1;
            let _e315 = u_xlati25_;
            let _e318 = _f_buffer1_.f_cb1_[_e315];
            let _e321 = u_xlati25_;
            let _e324 = _f_buffer1_.f_cb1_[_e321];
            let _e326 = ((-(_e312.xyz) * _e318.www) + _e324.xyz);
            u_xlat5_.x = _e326.x;
            u_xlat5_.y = _e326.y;
            u_xlat5_.z = _e326.z;
            let _e333 = u_xlat5_;
            let _e335 = u_xlat5_;
            u_xlat26_ = dot(_e333.xyz, _e335.xyz);
            let _e338 = u_xlat26_;
            u_xlat26_ = max(_e338, 0.000061035156f);
            let _e342 = u_xlat26_;
            u_xlat6_.x = inverseSqrt(_e342);
            let _e344 = u_xlat5_;
            let _e346 = u_xlat5_;
            let _e348 = u_xlat6_;
            let _e350 = (_e346.xyz * _e348.xxx);
            u_xlat5_.x = _e350.x;
            u_xlat5_.y = _e350.y;
            u_xlat5_.z = _e350.z;
            let _e360 = u_xlati25_;
            let _e365 = _f_buffer1_.f_cb1_[(_e360 + 512i)];
            u_xlat6_.x = (1f / _e365.x);
            let _e368 = u_xlat26_;
            u_xlat26_ = (_e368 * 25f);
            let _e371 = u_xlat26_;
            let _e372 = u_xlat6_;
            u_xlat26_ = (_e371 / _e372.x);
            let _e375 = u_xlat26_;
            u_xlat26_ = (_e375 + 1f);
            let _e380 = u_xlat26_;
            u_xlat26_ = (1f / _e380);
            let _e383 = u_xlati25_;
            let _e388 = _f_buffer1_.f_cb1_[(_e383 + 768i)];
            let _e390 = u_xlat5_;
            u_xlat6_.x = dot(_e388.xyz, _e390.xyz);
            let _e394 = u_xlat6_;
            let _e396 = u_xlati25_;
            let _e401 = _f_buffer1_.f_cb1_[(_e396 + 512i)];
            let _e404 = u_xlati25_;
            let _e409 = _f_buffer1_.f_cb1_[(_e404 + 512i)];
            u_xlat6_.x = ((_e394.x * _e401.z) + _e409.w);
            let _e413 = u_xlat6_;
            u_xlat6_.x = clamp(_e413.x, 0f, 1f);
            let _e419 = u_xlat6_;
            let _e421 = u_xlat6_;
            u_xlat6_.x = (_e419.x * _e421.x);
            let _e424 = u_xlat26_;
            let _e425 = u_xlat6_;
            u_xlat26_ = (_e424 * _e425.x);
            let _e428 = u_xlat6_;
            let _e430 = u_xlat26_;
            let _e432 = u_xlati25_;
            let _e437 = _f_buffer1_.f_cb1_[(_e432 + 256i)];
            let _e439 = (vec3(_e430) * _e437.xyz);
            u_xlat6_.x = _e439.x;
            u_xlat6_.y = _e439.y;
            u_xlat6_.z = _e439.z;
            let _e446 = u_xlat2_;
            let _e448 = u_xlat5_;
            u_xlat25_ = dot(_e446.xyz, _e448.xyz);
            let _e451 = u_xlat25_;
            u_xlat25_ = clamp(_e451, 0f, 1f);
            let _e455 = u_xlat4_;
            let _e457 = u_xlat6_;
            let _e459 = u_xlat25_;
            let _e462 = u_xlat4_;
            let _e464 = ((_e457.xyz * vec3(_e459)) + _e462.xyz);
            u_xlat4_.x = _e464.x;
            u_xlat4_.y = _e464.y;
            u_xlat4_.z = _e464.z;
        }
        continuing {
            let _e284 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e284 + 1u);
        }
    }
    let _e471 = u_xlat2_;
    let _e473 = u_xlat3_;
    let _e475 = u_xlat1_;
    let _e478 = u_xlat4_;
    let _e480 = ((_e473.xyz * _e475.xxx) + _e478.xyz);
    u_xlat2_.x = _e480.x;
    u_xlat2_.y = _e480.y;
    u_xlat2_.z = _e480.z;
    let _e491 = _f_buffer2_.f_cb2_[27];
    u_xlat3_.x = abs(_e491.w);
    let _e498 = _f_buffer2_.f_cb2_[28];
    u_xlat3_.y = abs(_e498.w);
    let _e505 = _f_buffer2_.f_cb2_[29];
    u_xlat3_.z = abs(_e505.w);
    let _e508 = u_xlat3_;
    let _e510 = u_xlat3_;
    let _e512 = log2(_e510.xyz);
    u_xlat3_.x = _e512.x;
    u_xlat3_.y = _e512.y;
    u_xlat3_.z = _e512.z;
    let _e519 = u_xlat3_;
    let _e521 = u_xlat3_;
    let _e527 = (_e521.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat3_.x = _e527.x;
    u_xlat3_.y = _e527.y;
    u_xlat3_.z = _e527.z;
    let _e534 = u_xlat3_;
    let _e536 = u_xlat3_;
    let _e538 = exp2(_e536.xyz);
    u_xlat3_.x = _e538.x;
    u_xlat3_.y = _e538.y;
    u_xlat3_.z = _e538.z;
    let _e545 = u_xlat3_;
    let _e547 = u_xlat3_;
    let _e561 = ((_e547.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat3_.x = _e561.x;
    u_xlat3_.y = _e561.y;
    u_xlat3_.z = _e561.z;
    let _e568 = u_xlat3_;
    let _e570 = u_xlat3_;
    let _e576 = clamp(_e570.xyz, vec3(0f), vec3(1f));
    u_xlat3_.x = _e576.x;
    u_xlat3_.y = _e576.y;
    u_xlat3_.z = _e576.z;
    let _e583 = u_xlat2_;
    let _e585 = u_xlat2_;
    let _e587 = u_xlat3_;
    let _e589 = (_e585.xyz + _e587.xyz);
    u_xlat2_.x = _e589.x;
    u_xlat2_.y = _e589.y;
    u_xlat2_.z = _e589.z;
    let _e596 = SV_Target0_;
    let _e598 = u_xlat8_;
    let _e600 = u_xlat2_;
    let _e603 = u_xlat0_;
    let _e605 = ((_e598.xyz * _e600.xyz) + _e603.xyz);
    SV_Target0_.x = _e605.x;
    SV_Target0_.y = _e605.y;
    SV_Target0_.z = _e605.z;
    let _e613 = u_xlat0_;
    SV_Target0_.w = _e613.w;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e44 = SV_Target0_;
    return FragmentOutput(_e44);
}
