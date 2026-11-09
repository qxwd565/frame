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
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlati4_: i32 = 0i;
    var u_xlatu4_: u32 = 0u;
    var u_xlatb4_: bool = false;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat10_: vec3<f32> = vec3(0f);
    var u_xlati10_: i32 = 0i;
    var u_xlat11_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlat20_: f32 = 0f;
    var u_xlatu20_: u32 = 0u;
    var u_xlatu21_: u32 = 0u;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e73 = vs_TEXCOORD0_1;
    let _e78 = _f_buffer0_.f_cb0_[4];
    let _e83 = hscard_bias.values[0];
    let _e86 = textureSampleBias(f_t0_, samplerf_s0_, _e73.xy, (_e78.x + _e83.x));
    u_xlat0_ = _e86;
    let _e88 = vs_NORMAL0_1;
    let _e90 = vs_NORMAL0_1;
    u_xlat1_.x = dot(_e88.xyz, _e90.xyz);
    let _e94 = u_xlat1_;
    u_xlat1_.x = inverseSqrt(_e94.x);
    let _e97 = u_xlat1_;
    let _e99 = u_xlat1_;
    let _e101 = vs_NORMAL0_1;
    let _e103 = (_e99.xxx * _e101.xyz);
    u_xlat1_.x = _e103.x;
    u_xlat1_.y = _e103.y;
    u_xlat1_.z = _e103.z;
    let _e110 = u_xlat2_;
    let _e115 = _f_buffer0_.f_cb0_[6];
    let _e120 = _f_buffer2_.f_cb2_[11];
    let _e122 = (_e115.xyz * _e120.zzz);
    u_xlat2_.x = _e122.x;
    u_xlat2_.y = _e122.y;
    u_xlat2_.z = _e122.z;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer0_.f_cb0_[5];
    u_xlat19_ = dot(_e129.xyz, _e134.xyz);
    let _e137 = u_xlat19_;
    u_xlat19_ = clamp(_e137, 0f, 1f);
    let _e144 = _f_buffer0_.f_cb0_[10];
    let _e149 = _f_buffer2_.f_cb2_[11];
    u_xlat20_ = min(_e144.x, _e149.y);
    let _e152 = u_xlat20_;
    u_xlatu20_ = u32(i32(_e152));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e167 = u_xlatu_loop_1_;
        let _e168 = u_xlatu20_;
        if !((_e167 < _e168)) {
            break;
        }
        {
            let _e174 = u_xlatu_loop_1_;
            u_xlatu4_ = (_e174 >> 2u);
            let _e177 = u_xlatu_loop_1_;
            u_xlati10_ = i32((_e177 & 3u));
            let _e181 = u_xlatu4_;
            let _e187 = _f_buffer2_.f_cb2_[(i32(_e181) + 12i)];
            let _e188 = u_xlati10_;
            let _e192 = local[_e188];
            u_xlat4_ = dot(_e187, bitcast<vec4<f32>>(_e192));
            let _e195 = u_xlat4_;
            u_xlati4_ = i32(_e195);
            let _e197 = u_xlat10_;
            let _e199 = vs_TEXCOORD1_1;
            let _e202 = u_xlati4_;
            let _e205 = _f_buffer1_.f_cb1_[_e202];
            let _e208 = u_xlati4_;
            let _e211 = _f_buffer1_.f_cb1_[_e208];
            let _e213 = ((-(_e199.xyz) * _e205.www) + _e211.xyz);
            u_xlat10_.x = _e213.x;
            u_xlat10_.y = _e213.y;
            u_xlat10_.z = _e213.z;
            let _e221 = u_xlat10_;
            let _e223 = u_xlat10_;
            u_xlat5_.x = dot(_e221.xyz, _e223.xyz);
            let _e227 = u_xlat5_;
            u_xlat5_.x = max(_e227.x, 0.000061035156f);
            let _e231 = u_xlat5_;
            u_xlat11_ = inverseSqrt(_e231.x);
            let _e234 = u_xlat10_;
            let _e236 = u_xlat10_;
            let _e238 = u_xlat11_;
            let _e240 = (_e236.xyz * vec3(_e238));
            u_xlat10_.x = _e240.x;
            u_xlat10_.y = _e240.y;
            u_xlat10_.z = _e240.z;
            let _e249 = u_xlati4_;
            let _e254 = _f_buffer1_.f_cb1_[(_e249 + 512i)];
            u_xlat11_ = (1f / _e254.x);
            let _e258 = u_xlat5_;
            u_xlat5_.x = (_e258.x * 25f);
            let _e263 = u_xlat5_;
            let _e265 = u_xlat11_;
            u_xlat5_.x = (_e263.x / _e265);
            let _e268 = u_xlat5_;
            u_xlat5_.x = (_e268.x + 1f);
            let _e275 = u_xlat5_;
            u_xlat5_.x = (1f / _e275.x);
            let _e278 = u_xlati4_;
            let _e283 = _f_buffer1_.f_cb1_[(_e278 + 768i)];
            let _e285 = u_xlat10_;
            u_xlat11_ = dot(_e283.xyz, _e285.xyz);
            let _e288 = u_xlat11_;
            let _e289 = u_xlati4_;
            let _e294 = _f_buffer1_.f_cb1_[(_e289 + 512i)];
            let _e297 = u_xlati4_;
            let _e302 = _f_buffer1_.f_cb1_[(_e297 + 512i)];
            u_xlat11_ = ((_e288 * _e294.z) + _e302.w);
            let _e305 = u_xlat11_;
            u_xlat11_ = clamp(_e305, 0f, 1f);
            let _e309 = u_xlat11_;
            let _e310 = u_xlat11_;
            u_xlat11_ = (_e309 * _e310);
            let _e313 = u_xlat11_;
            let _e314 = u_xlat5_;
            u_xlat5_.x = (_e313 * _e314.x);
            let _e317 = u_xlat5_;
            let _e319 = u_xlat5_;
            let _e321 = u_xlati4_;
            let _e326 = _f_buffer1_.f_cb1_[(_e321 + 256i)];
            let _e328 = (_e319.xxx * _e326.xyz);
            u_xlat5_.x = _e328.x;
            u_xlat5_.y = _e328.y;
            u_xlat5_.z = _e328.z;
            let _e335 = u_xlat1_;
            let _e337 = u_xlat10_;
            u_xlat4_ = dot(_e335.xyz, _e337.xyz);
            let _e340 = u_xlat4_;
            u_xlat4_ = clamp(_e340, 0f, 1f);
            let _e344 = u_xlat3_;
            let _e346 = u_xlat5_;
            let _e348 = u_xlat4_;
            let _e351 = u_xlat3_;
            let _e353 = ((_e346.xyz * vec3(_e348)) + _e351.xyz);
            u_xlat3_.x = _e353.x;
            u_xlat3_.y = _e353.y;
            u_xlat3_.z = _e353.z;
        }
        continuing {
            let _e171 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e171 + 1u);
        }
    }
    let _e360 = u_xlat1_;
    let _e362 = u_xlat2_;
    let _e364 = u_xlat19_;
    let _e367 = u_xlat3_;
    let _e369 = ((_e362.xyz * vec3(_e364)) + _e367.xyz);
    u_xlat1_.x = _e369.x;
    u_xlat1_.y = _e369.y;
    u_xlat1_.z = _e369.z;
    let _e380 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e380.w);
    let _e387 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e387.w);
    let _e394 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e394.w);
    let _e397 = u_xlat2_;
    let _e399 = u_xlat2_;
    let _e401 = log2(_e399.xyz);
    u_xlat2_.x = _e401.x;
    u_xlat2_.y = _e401.y;
    u_xlat2_.z = _e401.z;
    let _e408 = u_xlat2_;
    let _e410 = u_xlat2_;
    let _e416 = (_e410.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e416.x;
    u_xlat2_.y = _e416.y;
    u_xlat2_.z = _e416.z;
    let _e423 = u_xlat2_;
    let _e425 = u_xlat2_;
    let _e427 = exp2(_e425.xyz);
    u_xlat2_.x = _e427.x;
    u_xlat2_.y = _e427.y;
    u_xlat2_.z = _e427.z;
    let _e434 = u_xlat2_;
    let _e436 = u_xlat2_;
    let _e450 = ((_e436.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e450.x;
    u_xlat2_.y = _e450.y;
    u_xlat2_.z = _e450.z;
    let _e457 = u_xlat2_;
    let _e459 = u_xlat2_;
    let _e465 = clamp(_e459.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e465.x;
    u_xlat2_.y = _e465.y;
    u_xlat2_.z = _e465.z;
    let _e472 = u_xlat1_;
    let _e474 = u_xlat1_;
    let _e476 = u_xlat2_;
    let _e478 = (_e474.xyz + _e476.xyz);
    u_xlat1_.x = _e478.x;
    u_xlat1_.y = _e478.y;
    u_xlat1_.z = _e478.z;
    let _e485 = SV_TARGET0_;
    let _e487 = u_xlat0_;
    let _e489 = u_xlat1_;
    let _e491 = (_e487.xyz * _e489.xyz);
    SV_TARGET0_.x = _e491.x;
    SV_TARGET0_.y = _e491.y;
    SV_TARGET0_.z = _e491.z;
    let _e499 = u_xlat0_;
    SV_TARGET0_.w = _e499.w;
    return;
}

@fragment 
fn main(@location(12) vs_NORMAL0_: vec3<f32>, @location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>) -> FragmentOutput {
    vs_NORMAL0_1 = vs_NORMAL0_;
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e33 = SV_TARGET0_;
    return FragmentOutput(_e33);
}
