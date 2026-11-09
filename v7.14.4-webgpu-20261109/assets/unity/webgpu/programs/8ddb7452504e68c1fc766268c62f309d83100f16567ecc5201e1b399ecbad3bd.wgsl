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
    f_cb3_: array<vec4<f32>, 2>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat18_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e85 = vs_TEXCOORD0_1;
    let _e90 = _f_buffer0_.f_cb0_[4];
    let _e95 = hscard_bias.values[0];
    let _e98 = textureSampleBias(f_t0_, samplerf_s0_, _e85.xy, (_e90.x + _e95.x));
    u_xlat0_ = _e98;
    let _e99 = vs_TEXCOORD0_1;
    let _e104 = _f_buffer0_.f_cb0_[4];
    let _e109 = hscard_bias.values[1];
    let _e112 = textureSampleBias(f_t1_, samplerf_s1_, _e99.zw, (_e104.x + _e109.x));
    u_xlat1_ = _e112;
    let _e113 = u_xlat1_;
    let _e117 = _f_buffer3_.f_cb3_[1];
    u_xlat1_ = (_e113 * _e117.zzzz);
    let _e120 = vs_TEXCOORD1_1;
    let _e125 = _f_buffer0_.f_cb0_[4];
    let _e130 = hscard_bias.values[2];
    let _e133 = textureSampleBias(f_t2_, samplerf_s2_, _e120.xy, (_e125.x + _e130.x));
    u_xlat2_ = _e133;
    let _e134 = u_xlat0_;
    let _e138 = _f_buffer3_.f_cb3_[1];
    let _e141 = u_xlat1_;
    u_xlat0_ = ((_e134 * _e138.yyyy) + _e141);
    let _e143 = u_xlat0_;
    let _e144 = vs_COLOR0_1;
    u_xlat0_ = (_e143 * _e144);
    let _e146 = u_xlat0_;
    u_xlat0_ = clamp(_e146, vec4(0f), vec4(1f));
    let _e152 = u_xlat0_;
    let _e154 = u_xlat2_;
    u_xlat18_ = (_e152.w + _e154.x);
    let _e157 = u_xlat2_;
    let _e159 = u_xlat18_;
    u_xlat18_ = (_e157.x * _e159);
    let _e161 = u_xlat18_;
    let _e165 = _f_buffer3_.f_cb3_[1];
    u_xlat18_ = (_e161 * _e165.x);
    let _e168 = u_xlat18_;
    u_xlat18_ = clamp(_e168, 0f, 1f);
    let _e173 = vs_NORMAL0_1;
    let _e175 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e173.xyz, _e175.xyz);
    let _e179 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e179.x);
    let _e182 = u_xlat1_;
    let _e184 = u_xlat1_;
    let _e186 = vs_NORMAL0_1;
    let _e188 = (_e184.xxx * _e186.xyz);
    u_xlat1_.x = _e188.x;
    u_xlat1_.y = _e188.y;
    u_xlat1_.z = _e188.z;
    let _e195 = u_xlat2_;
    let _e200 = _f_buffer0_.f_cb0_[6];
    let _e205 = _f_buffer2_.f_cb2_[11];
    let _e207 = (_e200.xyz * _e205.zzz);
    u_xlat2_.x = _e207.x;
    u_xlat2_.y = _e207.y;
    u_xlat2_.z = _e207.z;
    let _e214 = u_xlat1_;
    let _e219 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e214.xyz, _e219.xyz);
    let _e222 = u_xlat19_;
    u_xlat19_ = clamp(_e222, 0f, 1f);
    let _e229 = _f_buffer0_.f_cb0_[10];
    let _e234 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e229.x, _e234.y);
    let _e237 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e237));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e252 = u_xlatu_loop_1_;
        let _e253 = u_xlatu20_;
        if !((_e252 < _e253)) {
            break;
        }
        {
            let _e259 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e259 >> 2u);
            let _e262 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e262 & 3u));
            let _e266 = u_xlatu4_;
            let _e272 = _f_buffer2_.f_cb2_[(i32(_e266) + 12i)];
            let _e273 = u_xlati10_;
            let _e277 = local[_e273];
            u_xlat4_ = dot(_e272, bitcast<vec4<f32>>(_e277));
            let _e280 = u_xlat4_;
            u_xlati4_ = i32(_e280);
            let _e282 = u_xlat10_;
            let _e284 = vs_TEXCOORD2_1;
            let _e287 = u_xlati4_;
            let _e290 = _f_buffer1_.f_cb1_[_e287];
            let _e293 = u_xlati4_;
            let _e296 = _f_buffer1_.f_cb1_[_e293];
            let _e298 = ((-(_e284.xyz) * _e290.www) + _e296.xyz);
            u_xlat10_.x = _e298.x;
            u_xlat10_.y = _e298.y;
            u_xlat10_.z = _e298.z;
            let _e306 = u_xlat10_;
            let _e308 = u_xlat10_;
            u_xlat5_.x = dot(_e306.xyz, _e308.xyz);
            let _e312 = u_xlat5_;
            u_xlat5_.x = max(_e312.x, 0.000061035156f);
            let _e316 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e316.x);
            let _e319 = u_xlat10_;
            let _e321 = u_xlat10_;
            let _e323 = u_xlat11_;
            let _e325 = (_e321.xyz * vec3(_e323));
            u_xlat10_.x = _e325.x;
            u_xlat10_.y = _e325.y;
            u_xlat10_.z = _e325.z;
            let _e334 = u_xlati4_;
            let _e339 = _f_buffer1_.f_cb1_[(_e334 + 512i)];
            u_xlat11_ = (1f / _e339.x);
            let _e343 = u_xlat5_;
            u_xlat5_.x = (_e343.x * 25f);
            let _e348 = u_xlat5_;
            let _e350 = u_xlat11_;
            u_xlat5_.x = (_e348.x / _e350);
            let _e353 = u_xlat5_;
            u_xlat5_.x = (_e353.x + 1f);
            let _e360 = u_xlat5_;
            u_xlat5_.x = (1f / _e360.x);
            let _e363 = u_xlati4_;
            let _e368 = _f_buffer1_.f_cb1_[(_e363 + 768i)];
            let _e370 = u_xlat10_;
            u_xlat11_ = dot(_e368.xyz, _e370.xyz);
            let _e373 = u_xlat11_;
            let _e374 = u_xlati4_;
            let _e379 = _f_buffer1_.f_cb1_[(_e374 + 512i)];
            let _e382 = u_xlati4_;
            let _e387 = _f_buffer1_.f_cb1_[(_e382 + 512i)];
            u_xlat11_ = ((_e373 * _e379.z) + _e387.w);
            let _e390 = u_xlat11_;
            u_xlat11_ = clamp(_e390, 0f, 1f);
            let _e394 = u_xlat11_;
            let _e395 = u_xlat11_;
            u_xlat11_ = (_e394 * _e395);
            let _e398 = u_xlat11_;
            let _e399 = u_xlat5_;
            u_xlat5_.x = (_e398 * _e399.x);
            let _e402 = u_xlat5_;
            let _e404 = u_xlat5_;
            let _e406 = u_xlati4_;
            let _e411 = _f_buffer1_.f_cb1_[(_e406 + 256i)];
            let _e413 = (_e404.xxx * _e411.xyz);
            u_xlat5_.x = _e413.x;
            u_xlat5_.y = _e413.y;
            u_xlat5_.z = _e413.z;
            let _e420 = u_xlat1_;
            let _e422 = u_xlat10_;
            u_xlat4_ = dot(_e420.xyz, _e422.xyz);
            let _e425 = u_xlat4_;
            u_xlat4_ = clamp(_e425, 0f, 1f);
            let _e429 = u_xlat3_;
            let _e431 = u_xlat5_;
            let _e433 = u_xlat4_;
            let _e436 = u_xlat3_;
            let _e438 = ((_e431.xyz * vec3(_e433)) + _e436.xyz);
            u_xlat3_.x = _e438.x;
            u_xlat3_.y = _e438.y;
            u_xlat3_.z = _e438.z;
        }
        continuing {
            let _e256 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e256 + 1u);
        }
    }
    let _e445 = u_xlat1_;
    let _e447 = u_xlat2_;
    let _e449 = u_xlat19_;
    let _e452 = u_xlat3_;
    let _e454 = ((_e447.xyz * vec3(_e449)) + _e452.xyz);
    u_xlat1_.x = _e454.x;
    u_xlat1_.y = _e454.y;
    u_xlat1_.z = _e454.z;
    let _e465 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e465.w);
    let _e472 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e472.w);
    let _e479 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e479.w);
    let _e482 = u_xlat2_;
    let _e484 = u_xlat2_;
    let _e486 = log2(_e484.xyz);
    u_xlat2_.x = _e486.x;
    u_xlat2_.y = _e486.y;
    u_xlat2_.z = _e486.z;
    let _e493 = u_xlat2_;
    let _e495 = u_xlat2_;
    let _e501 = (_e495.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e501.x;
    u_xlat2_.y = _e501.y;
    u_xlat2_.z = _e501.z;
    let _e508 = u_xlat2_;
    let _e510 = u_xlat2_;
    let _e512 = exp2(_e510.xyz);
    u_xlat2_.x = _e512.x;
    u_xlat2_.y = _e512.y;
    u_xlat2_.z = _e512.z;
    let _e519 = u_xlat2_;
    let _e521 = u_xlat2_;
    let _e535 = ((_e521.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e535.x;
    u_xlat2_.y = _e535.y;
    u_xlat2_.z = _e535.z;
    let _e542 = u_xlat2_;
    let _e544 = u_xlat2_;
    let _e550 = clamp(_e544.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e550.x;
    u_xlat2_.y = _e550.y;
    u_xlat2_.z = _e550.z;
    let _e557 = u_xlat1_;
    let _e559 = u_xlat1_;
    let _e561 = u_xlat2_;
    let _e563 = (_e559.xyz + _e561.xyz);
    u_xlat1_.x = _e563.x;
    u_xlat1_.y = _e563.y;
    u_xlat1_.z = _e563.z;
    let _e570 = u_xlat1_;
    let _e572 = u_xlat18_;
    let _e574 = u_xlat1_;
    let _e576 = (vec3(_e572) * _e574.xyz);
    u_xlat1_.x = _e576.x;
    u_xlat1_.y = _e576.y;
    u_xlat1_.z = _e576.z;
    let _e583 = SV_TARGET0_;
    let _e585 = u_xlat0_;
    let _e587 = u_xlat1_;
    let _e589 = (_e585.xyz * _e587.xyz);
    SV_TARGET0_.x = _e589.x;
    SV_TARGET0_.y = _e589.y;
    SV_TARGET0_.z = _e589.z;
    let _e597 = u_xlat18_;
    SV_TARGET0_.w = _e597;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e52 = SV_TARGET0_;
    return FragmentOutput(_e52);
}
