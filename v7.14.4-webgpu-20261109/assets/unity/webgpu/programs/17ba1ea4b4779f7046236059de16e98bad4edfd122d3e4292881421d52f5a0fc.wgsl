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

struct f_buffer4_ {
    f_cb4_: array<vec4<f32>, 3>,
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
@group(1) @binding(4) 
var<uniform> _f_buffer4_: f_buffer4_;
@group(3) @binding(1) 
var samplerf_s0_: sampler_comparison;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_depth_2d;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec3<f32>;
var<private> vs_TEXCOORDindex3_1: vec4<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlatb2_: bool = false;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlati4_: i32 = 0i;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var u_xlat19_: f32 = 0f;
    var u_xlatu19_: u32 = 0u;
    var u_xlatb19_: bool = false;
    var u_xlatu20_: u32 = 0u;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlatu21_: u32 = 0u;
    var u_xlatb21_: bool = false;
    var u_xlat22_: f32 = 0f;
    var txVec0_: vec3<f32>;
    var local: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_1: array<vec4<u32>, 4> = ImmCB_0_;

    let _e88 = vs_TEXCOORD0_1;
    let _e93 = _f_buffer0_.f_cb0_[4];
    let _e98 = hscard_bias.values[1];
    let _e101 = textureSampleBias(f_t1_, samplerf_s1_, _e88.xy, (_e93.x + _e98.x));
    u_xlat0_ = _e101;
    let _e102 = u_xlat0_;
    let _e104 = u_xlat0_;
    let _e109 = _f_buffer4_.f_cb4_[1];
    let _e111 = (_e104.xyz * _e109.xyz);
    u_xlat0_.x = _e111.x;
    u_xlat0_.y = _e111.y;
    u_xlat0_.z = _e111.z;
    let _e118 = vs_NORMAL0_1;
    let _e120 = vs_NORMAL0_1;
    u_xlat18_ = dot(_e118.xyz, _e120.xyz);
    let _e123 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e123);
    let _e125 = u_xlat1_;
    let _e127 = u_xlat18_;
    let _e129 = vs_NORMAL0_1;
    let _e131 = (vec3(_e127) * _e129.xyz);
    u_xlat1_.x = _e131.x;
    u_xlat1_.y = _e131.y;
    u_xlat1_.z = _e131.z;
    let _e138 = vs_TEXCOORDindex3_1;
    let _e139 = _e138.xy;
    let _e140 = vs_TEXCOORDindex3_1;
    txVec0_ = vec3<f32>(_e139.x, _e139.y, _e140.z);
    let _e146 = txVec0_;
    let _e150 = textureSampleCompareLevel(f_t0_, samplerf_s0_, _e146.xy, _e146.z);
    u_xlat18_ = _e150;
    let _e154 = _f_buffer3_.f_cb3_[27];
    u_xlat19_ = (-(_e154.x) + 1f);
    let _e159 = u_xlat18_;
    let _e163 = _f_buffer3_.f_cb3_[27];
    let _e166 = u_xlat19_;
    u_xlat18_ = ((_e159 * _e163.x) + _e166);
    let _e169 = vs_TEXCOORDindex3_1;
    u_xlatb19_ = (0f >= _e169.z);
    let _e172 = vs_TEXCOORDindex3_1;
    u_xlatb2_ = (_e172.z >= 1f);
    let _e176 = u_xlatb19_;
    let _e177 = u_xlatb2_;
    u_xlatb19_ = (_e176 || _e177);
    let _e179 = u_xlatb19_;
    if _e179 {
        local = 1f;
    } else {
        let _e181 = u_xlat18_;
        local = _e181;
    }
    let _e183 = local;
    u_xlat18_ = _e183;
    let _e184 = u_xlat18_;
    let _e188 = _f_buffer2_.f_cb2_[11];
    u_xlat18_ = (_e184 * _e188.z);
    let _e191 = u_xlat2_;
    let _e193 = u_xlat18_;
    let _e198 = _f_buffer0_.f_cb0_[6];
    let _e200 = (vec3(_e193) * _e198.xyz);
    u_xlat2_.x = _e200.x;
    u_xlat2_.y = _e200.y;
    u_xlat2_.z = _e200.z;
    let _e207 = u_xlat1_;
    let _e212 = _f_buffer0_.f_cb0_[5];
    u_xlat18_ = dot(_e207.xyz, _e212.xyz);
    let _e215 = u_xlat18_;
    u_xlat18_ = clamp(_e215, 0f, 1f);
    let _e222 = _f_buffer0_.f_cb0_[10];
    let _e227 = _f_buffer2_.f_cb2_[11];
    u_xlat19_ = min(_e222.x, _e227.y);
    let _e230 = u_xlat19_;
    u_xlatu19_ = u32(i32(_e230));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e244 = u_xlatu_loop_1_;
        let _e245 = u_xlatu19_;
        if !((_e244 < _e245)) {
            break;
        }
        {
            let _e251 = u_xlatu_loop_1_;
            u_xlatu21_ = (_e251 >> 2u);
            let _e254 = u_xlatu_loop_1_;
            u_xlati4_ = i32((_e254 & 3u));
            let _e258 = u_xlatu21_;
            let _e264 = _f_buffer2_.f_cb2_[(i32(_e258) + 12i)];
            let _e265 = u_xlati4_;
            let _e269 = local_1[_e265];
            u_xlat21_ = dot(_e264, bitcast<vec4<f32>>(_e269));
            let _e272 = u_xlat21_;
            u_xlati21_ = i32(_e272);
            let _e274 = u_xlat4_;
            let _e276 = vs_TEXCOORD1_1;
            let _e279 = u_xlati21_;
            let _e282 = _f_buffer1_.f_cb1_[_e279];
            let _e285 = u_xlati21_;
            let _e288 = _f_buffer1_.f_cb1_[_e285];
            let _e290 = ((-(_e276.xyz) * _e282.www) + _e288.xyz);
            u_xlat4_.x = _e290.x;
            u_xlat4_.y = _e290.y;
            u_xlat4_.z = _e290.z;
            let _e297 = u_xlat4_;
            let _e299 = u_xlat4_;
            u_xlat22_ = dot(_e297.xyz, _e299.xyz);
            let _e302 = u_xlat22_;
            u_xlat22_ = max(_e302, 0.000061035156f);
            let _e306 = u_xlat22_;
            u_xlat5_.x = inverseSqrt(_e306);
            let _e308 = u_xlat4_;
            let _e310 = u_xlat4_;
            let _e312 = u_xlat5_;
            let _e314 = (_e310.xyz * _e312.xxx);
            u_xlat4_.x = _e314.x;
            u_xlat4_.y = _e314.y;
            u_xlat4_.z = _e314.z;
            let _e324 = u_xlati21_;
            let _e329 = _f_buffer1_.f_cb1_[(_e324 + 512i)];
            u_xlat5_.x = (1f / _e329.x);
            let _e332 = u_xlat22_;
            u_xlat22_ = (_e332 * 25f);
            let _e335 = u_xlat22_;
            let _e336 = u_xlat5_;
            u_xlat22_ = (_e335 / _e336.x);
            let _e339 = u_xlat22_;
            u_xlat22_ = (_e339 + 1f);
            let _e344 = u_xlat22_;
            u_xlat22_ = (1f / _e344);
            let _e347 = u_xlati21_;
            let _e352 = _f_buffer1_.f_cb1_[(_e347 + 768i)];
            let _e354 = u_xlat4_;
            u_xlat5_.x = dot(_e352.xyz, _e354.xyz);
            let _e358 = u_xlat5_;
            let _e360 = u_xlati21_;
            let _e365 = _f_buffer1_.f_cb1_[(_e360 + 512i)];
            let _e368 = u_xlati21_;
            let _e373 = _f_buffer1_.f_cb1_[(_e368 + 512i)];
            u_xlat5_.x = ((_e358.x * _e365.z) + _e373.w);
            let _e377 = u_xlat5_;
            u_xlat5_.x = clamp(_e377.x, 0f, 1f);
            let _e383 = u_xlat5_;
            let _e385 = u_xlat5_;
            u_xlat5_.x = (_e383.x * _e385.x);
            let _e388 = u_xlat22_;
            let _e389 = u_xlat5_;
            u_xlat22_ = (_e388 * _e389.x);
            let _e392 = u_xlat5_;
            let _e394 = u_xlat22_;
            let _e396 = u_xlati21_;
            let _e401 = _f_buffer1_.f_cb1_[(_e396 + 256i)];
            let _e403 = (vec3(_e394) * _e401.xyz);
            u_xlat5_.x = _e403.x;
            u_xlat5_.y = _e403.y;
            u_xlat5_.z = _e403.z;
            let _e410 = u_xlat1_;
            let _e412 = u_xlat4_;
            u_xlat21_ = dot(_e410.xyz, _e412.xyz);
            let _e415 = u_xlat21_;
            u_xlat21_ = clamp(_e415, 0f, 1f);
            let _e419 = u_xlat3_;
            let _e421 = u_xlat5_;
            let _e423 = u_xlat21_;
            let _e426 = u_xlat3_;
            let _e428 = ((_e421.xyz * vec3(_e423)) + _e426.xyz);
            u_xlat3_.x = _e428.x;
            u_xlat3_.y = _e428.y;
            u_xlat3_.z = _e428.z;
        }
        continuing {
            let _e248 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e248 + 1u);
        }
    }
    let _e435 = u_xlat1_;
    let _e437 = u_xlat2_;
    let _e439 = u_xlat18_;
    let _e442 = u_xlat3_;
    let _e444 = ((_e437.xyz * vec3(_e439)) + _e442.xyz);
    u_xlat1_.x = _e444.x;
    u_xlat1_.y = _e444.y;
    u_xlat1_.z = _e444.z;
    let _e455 = _f_buffer2_.f_cb2_[27];
    u_xlat2_.x = abs(_e455.w);
    let _e462 = _f_buffer2_.f_cb2_[28];
    u_xlat2_.y = abs(_e462.w);
    let _e469 = _f_buffer2_.f_cb2_[29];
    u_xlat2_.z = abs(_e469.w);
    let _e472 = u_xlat2_;
    let _e474 = u_xlat2_;
    let _e476 = log2(_e474.xyz);
    u_xlat2_.x = _e476.x;
    u_xlat2_.y = _e476.y;
    u_xlat2_.z = _e476.z;
    let _e483 = u_xlat2_;
    let _e485 = u_xlat2_;
    let _e491 = (_e485.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e491.x;
    u_xlat2_.y = _e491.y;
    u_xlat2_.z = _e491.z;
    let _e498 = u_xlat2_;
    let _e500 = u_xlat2_;
    let _e502 = exp2(_e500.xyz);
    u_xlat2_.x = _e502.x;
    u_xlat2_.y = _e502.y;
    u_xlat2_.z = _e502.z;
    let _e509 = u_xlat2_;
    let _e511 = u_xlat2_;
    let _e525 = ((_e511.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e525.x;
    u_xlat2_.y = _e525.y;
    u_xlat2_.z = _e525.z;
    let _e532 = u_xlat2_;
    let _e534 = u_xlat2_;
    let _e540 = clamp(_e534.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e540.x;
    u_xlat2_.y = _e540.y;
    u_xlat2_.z = _e540.z;
    let _e547 = u_xlat1_;
    let _e549 = u_xlat1_;
    let _e551 = u_xlat2_;
    let _e553 = (_e549.xyz + _e551.xyz);
    u_xlat1_.x = _e553.x;
    u_xlat1_.y = _e553.y;
    u_xlat1_.z = _e553.z;
    let _e560 = u_xlat2_;
    let _e562 = u_xlat2_;
    let _e571 = (_e562.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat2_.x = _e571.x;
    u_xlat2_.y = _e571.y;
    u_xlat2_.z = _e571.z;
    let _e578 = u_xlat2_;
    let _e583 = _f_buffer4_.f_cb4_[2];
    let _e585 = u_xlat2_;
    let _e592 = ((_e583.xxx * _e585.xyz) + vec3<f32>(1f, 1f, 1f));
    u_xlat2_.x = _e592.x;
    u_xlat2_.y = _e592.y;
    u_xlat2_.z = _e592.z;
    let _e599 = u_xlat2_;
    let _e601 = u_xlat0_;
    let _e603 = u_xlat2_;
    let _e605 = (_e601.xyz * _e603.xyz);
    u_xlat2_.x = _e605.x;
    u_xlat2_.y = _e605.y;
    u_xlat2_.z = _e605.z;
    let _e612 = SV_Target0_;
    let _e614 = u_xlat1_;
    let _e616 = u_xlat0_;
    let _e619 = u_xlat2_;
    let _e621 = ((_e614.xyz * _e616.xyz) + _e619.xyz);
    SV_Target0_.x = _e621.x;
    SV_Target0_.y = _e621.y;
    SV_Target0_.z = _e621.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec3<f32>, @location(3) vs_TEXCOORDindex3_: vec4<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORDindex3_1 = vs_TEXCOORDindex3_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e47 = SV_Target0_;
    return FragmentOutput(_e47);
}
