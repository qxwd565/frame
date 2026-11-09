struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 1024>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 30>,
}

struct v_buffer3_ {
    v_cb3_: vec4<f32>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

const ImmCB_0_: array<vec4<u32>, 4> = array<vec4<u32>, 4>(vec4<u32>(1065353216u, 0u, 0u, 0u), vec4<u32>(0u, 1065353216u, 0u, 0u), vec4<u32>(0u, 0u, 1065353216u, 0u), vec4<u32>(0u, 0u, 0u, 1065353216u));

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var u_xlatu18_: u32 = 0u;
    var u_xlatu19_: u32 = 0u;
    var u_xlat20_: f32 = 0f;
    var u_xlati20_: i32 = 0i;
    var u_xlatu20_: u32 = 0u;
    var u_xlatb20_: bool = false;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlat22_: f32 = 0f;
    var u_xlatu_loop_1_: u32 = 0u;
    var local: array<vec4<u32>, 4> = ImmCB_0_;

    let _e74 = in_POSITION0_1;
    let _e79 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e74.yyyy * _e79);
    let _e84 = _v_buffer2_.v_cb2_[0];
    let _e85 = in_POSITION0_1;
    let _e88 = u_xlat0_;
    u_xlat0_ = ((_e84 * _e85.xxxx) + _e88);
    let _e93 = _v_buffer2_.v_cb2_[2];
    let _e94 = in_POSITION0_1;
    let _e97 = u_xlat0_;
    u_xlat0_ = ((_e93 * _e94.zzzz) + _e97);
    let _e99 = u_xlat0_;
    let _e103 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e99 + _e103);
    let _e105 = u_xlat0_;
    let _e110 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e105.yyyy * _e110);
    let _e115 = _v_buffer0_.v_cb0_[79];
    let _e116 = u_xlat0_;
    let _e119 = u_xlat1_;
    u_xlat1_ = ((_e115 * _e116.xxxx) + _e119);
    let _e124 = _v_buffer0_.v_cb0_[81];
    let _e125 = u_xlat0_;
    let _e128 = u_xlat1_;
    u_xlat1_ = ((_e124 * _e125.zzzz) + _e128);
    let _e134 = _v_buffer0_.v_cb0_[82];
    let _e135 = u_xlat0_;
    let _e138 = u_xlat1_;
    gl_Position = ((_e134 * _e135.wwww) + _e138);
    let _e140 = vs_TEXCOORD0_;
    let _e142 = in_TEXCOORD0_1;
    let _e144 = _v_buffer3_;
    let _e148 = _v_buffer3_;
    let _e151 = ((_e142.xy * _e144.v_cb3_.xy) + _e148.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e151.x;
    vs_TEXCOORD0_.y = _e151.y;
    let _e157 = in_NORMAL0_1;
    let _e162 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e157.xyz, _e162.xyz);
    let _e166 = in_NORMAL0_1;
    let _e171 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e166.xyz, _e171.xyz);
    let _e175 = in_NORMAL0_1;
    let _e180 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e175.xyz, _e180.xyz);
    let _e183 = u_xlat1_;
    let _e185 = u_xlat1_;
    u_xlat18_ = dot(_e183.xyz, _e185.xyz);
    let _e188 = u_xlat18_;
    u_xlat18_ = max(_e188, 0.000000000000000000000000000000000000011754944f);
    let _e191 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e191);
    let _e193 = u_xlat1_;
    let _e195 = u_xlat18_;
    let _e197 = u_xlat1_;
    let _e199 = (vec3(_e195) * _e197.xyz);
    u_xlat1_.x = _e199.x;
    u_xlat1_.y = _e199.y;
    u_xlat1_.z = _e199.z;
    let _e210 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e210.w);
    let _e217 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e217.w);
    let _e224 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e224.w);
    let _e227 = u_xlat2_;
    let _e229 = u_xlat2_;
    let _e231 = log2(_e229.xyz);
    u_xlat2_.x = _e231.x;
    u_xlat2_.y = _e231.y;
    u_xlat2_.z = _e231.z;
    let _e238 = u_xlat2_;
    let _e240 = u_xlat2_;
    let _e246 = (_e240.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e246.x;
    u_xlat2_.y = _e246.y;
    u_xlat2_.z = _e246.z;
    let _e253 = u_xlat2_;
    let _e255 = u_xlat2_;
    let _e257 = exp2(_e255.xyz);
    u_xlat2_.x = _e257.x;
    u_xlat2_.y = _e257.y;
    u_xlat2_.z = _e257.z;
    let _e264 = u_xlat2_;
    let _e266 = u_xlat2_;
    let _e280 = ((_e266.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e280.x;
    u_xlat2_.y = _e280.y;
    u_xlat2_.z = _e280.z;
    let _e287 = u_xlat2_;
    let _e289 = u_xlat2_;
    let _e295 = clamp(_e289.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e295.x;
    u_xlat2_.y = _e295.y;
    u_xlat2_.z = _e295.z;
    let _e305 = _v_buffer0_.v_cb0_[10];
    let _e310 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e305.x, _e310.y);
    let _e313 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e313));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e327 = u_xlatu_loop_1_;
        let _e328 = u_xlatu18_;
        if !((_e327 < _e328)) {
            break;
        }
        {
            let _e334 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e334 >> 2u);
            let _e337 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e337 & 3u));
            let _e341 = u_xlatu20_;
            let _e347 = _v_buffer2_.v_cb2_[(i32(_e341) + 12i)];
            let _e348 = u_xlati21_;
            let _e352 = local[_e348];
            u_xlat20_ = dot(_e347, bitcast<vec4<f32>>(_e352));
            let _e355 = u_xlat20_;
            u_xlati20_ = i32(_e355);
            let _e357 = u_xlat4_;
            let _e359 = u_xlat0_;
            let _e362 = u_xlati20_;
            let _e365 = _v_buffer1_.v_cb1_[_e362];
            let _e368 = u_xlati20_;
            let _e371 = _v_buffer1_.v_cb1_[_e368];
            let _e373 = ((-(_e359.xyz) * _e365.www) + _e371.xyz);
            u_xlat4_.x = _e373.x;
            u_xlat4_.y = _e373.y;
            u_xlat4_.z = _e373.z;
            let _e380 = u_xlat4_;
            let _e382 = u_xlat4_;
            u_xlat21_ = dot(_e380.xyz, _e382.xyz);
            let _e385 = u_xlat21_;
            u_xlat21_ = max(_e385, 0.000061035156f);
            let _e388 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e388);
            let _e390 = u_xlat4_;
            let _e392 = u_xlat22_;
            let _e394 = u_xlat4_;
            let _e396 = (vec3(_e392) * _e394.xyz);
            u_xlat4_.x = _e396.x;
            u_xlat4_.y = _e396.y;
            u_xlat4_.z = _e396.z;
            let _e405 = u_xlati20_;
            let _e410 = _v_buffer1_.v_cb1_[(_e405 + 512i)];
            u_xlat22_ = (1f / _e410.x);
            let _e413 = u_xlat21_;
            u_xlat21_ = (_e413 * 25f);
            let _e416 = u_xlat21_;
            let _e417 = u_xlat22_;
            u_xlat21_ = (_e416 / _e417);
            let _e419 = u_xlat21_;
            u_xlat21_ = (_e419 + 1f);
            let _e424 = u_xlat21_;
            u_xlat21_ = (1f / _e424);
            let _e426 = u_xlati20_;
            let _e431 = _v_buffer1_.v_cb1_[(_e426 + 768i)];
            let _e433 = u_xlat4_;
            u_xlat22_ = dot(_e431.xyz, _e433.xyz);
            let _e436 = u_xlat22_;
            let _e437 = u_xlati20_;
            let _e442 = _v_buffer1_.v_cb1_[(_e437 + 512i)];
            let _e445 = u_xlati20_;
            let _e450 = _v_buffer1_.v_cb1_[(_e445 + 512i)];
            u_xlat22_ = ((_e436 * _e442.z) + _e450.w);
            let _e453 = u_xlat22_;
            u_xlat22_ = clamp(_e453, 0f, 1f);
            let _e457 = u_xlat22_;
            let _e458 = u_xlat22_;
            u_xlat22_ = (_e457 * _e458);
            let _e460 = u_xlat21_;
            let _e461 = u_xlat22_;
            u_xlat21_ = (_e460 * _e461);
            let _e463 = u_xlat5_;
            let _e465 = u_xlat21_;
            let _e467 = u_xlati20_;
            let _e472 = _v_buffer1_.v_cb1_[(_e467 + 256i)];
            let _e474 = (vec3(_e465) * _e472.xyz);
            u_xlat5_.x = _e474.x;
            u_xlat5_.y = _e474.y;
            u_xlat5_.z = _e474.z;
            let _e481 = u_xlat1_;
            let _e483 = u_xlat4_;
            u_xlat20_ = dot(_e481.xyz, _e483.xyz);
            let _e486 = u_xlat20_;
            u_xlat20_ = clamp(_e486, 0f, 1f);
            let _e490 = u_xlat3_;
            let _e492 = u_xlat5_;
            let _e494 = u_xlat20_;
            let _e497 = u_xlat3_;
            let _e499 = ((_e492.xyz * vec3(_e494)) + _e497.xyz);
            u_xlat3_.x = _e499.x;
            u_xlat3_.y = _e499.y;
            u_xlat3_.z = _e499.z;
        }
        continuing {
            let _e331 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e331 + 1u);
        }
    }
    let _e506 = vs_TEXCOORD2_;
    let _e508 = u_xlat2_;
    let _e510 = u_xlat3_;
    let _e512 = (_e508.xyz + _e510.xyz);
    vs_TEXCOORD2_.x = _e512.x;
    vs_TEXCOORD2_.y = _e512.y;
    vs_TEXCOORD2_.z = _e512.z;
    let _e519 = vs_TEXCOORD1_;
    let _e521 = u_xlat0_;
    let _e522 = _e521.xyz;
    vs_TEXCOORD1_.x = _e522.x;
    vs_TEXCOORD1_.y = _e522.y;
    vs_TEXCOORD1_.z = _e522.z;
    let _e529 = vs_NORMAL0_;
    let _e531 = u_xlat1_;
    let _e532 = _e531.xyz;
    vs_NORMAL0_.x = _e532.x;
    vs_NORMAL0_.y = _e532.y;
    vs_NORMAL0_.z = _e532.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e35 = vs_TEXCOORD0_;
    let _e37 = vs_TEXCOORD1_;
    let _e39 = vs_TEXCOORD2_;
    let _e41 = vs_NORMAL0_;
    let _e43 = gl_Position;
    return VertexOutput(_e35, _e37, _e39, _e41, _e43);
}
