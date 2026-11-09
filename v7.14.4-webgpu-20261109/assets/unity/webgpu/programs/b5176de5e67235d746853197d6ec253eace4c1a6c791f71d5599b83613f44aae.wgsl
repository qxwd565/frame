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
    v_cb3_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORD3_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD3_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat13_: vec2<f32> = vec2(0f);
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

    let _e81 = in_POSITION0_1;
    let _e86 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e81.yyyy * _e86);
    let _e91 = _v_buffer2_.v_cb2_[0];
    let _e92 = in_POSITION0_1;
    let _e95 = u_xlat0_;
    u_xlat0_ = ((_e91 * _e92.xxxx) + _e95);
    let _e100 = _v_buffer2_.v_cb2_[2];
    let _e101 = in_POSITION0_1;
    let _e104 = u_xlat0_;
    u_xlat0_ = ((_e100 * _e101.zzzz) + _e104);
    let _e106 = u_xlat0_;
    let _e110 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e106 + _e110);
    let _e112 = u_xlat0_;
    let _e117 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e112.yyyy * _e117);
    let _e122 = _v_buffer0_.v_cb0_[79];
    let _e123 = u_xlat0_;
    let _e126 = u_xlat1_;
    u_xlat1_ = ((_e122 * _e123.xxxx) + _e126);
    let _e131 = _v_buffer0_.v_cb0_[81];
    let _e132 = u_xlat0_;
    let _e135 = u_xlat1_;
    u_xlat1_ = ((_e131 * _e132.zzzz) + _e135);
    let _e141 = _v_buffer0_.v_cb0_[82];
    let _e142 = u_xlat0_;
    let _e145 = u_xlat1_;
    gl_Position = ((_e141 * _e142.wwww) + _e145);
    let _e147 = u_xlat1_;
    let _e149 = in_TEXCOORD0_1;
    let _e154 = _v_buffer3_.v_cb3_[1];
    let _e156 = (_e149.xy + _e154.xy);
    u_xlat1_.x = _e156.x;
    u_xlat1_.y = _e156.y;
    let _e161 = vs_TEXCOORD0_;
    let _e163 = u_xlat1_;
    let _e168 = _v_buffer3_.v_cb3_[1];
    let _e170 = (_e163.xy * _e168.zz);
    vs_TEXCOORD0_.x = _e170.x;
    vs_TEXCOORD0_.y = _e170.y;
    let _e176 = in_TEXCOORD1_1;
    let _e181 = _v_buffer3_.v_cb3_[1];
    u_xlat13_.x = (_e176.x + _e181.w);
    let _e185 = in_TEXCOORD1_1;
    let _e190 = _v_buffer3_.v_cb3_[2];
    u_xlat13_.y = (_e185.y + _e190.x);
    let _e193 = vs_TEXCOORD1_;
    let _e195 = u_xlat13_;
    let _e200 = _v_buffer3_.v_cb3_[2];
    let _e202 = (_e195.xy * _e200.yy);
    vs_TEXCOORD1_.x = _e202.x;
    vs_TEXCOORD1_.y = _e202.y;
    let _e208 = in_NORMAL0_1;
    let _e213 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e208.xyz, _e213.xyz);
    let _e217 = in_NORMAL0_1;
    let _e222 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e217.xyz, _e222.xyz);
    let _e226 = in_NORMAL0_1;
    let _e231 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e226.xyz, _e231.xyz);
    let _e234 = u_xlat1_;
    let _e236 = u_xlat1_;
    u_xlat18_ = dot(_e234.xyz, _e236.xyz);
    let _e239 = u_xlat18_;
    u_xlat18_ = max(_e239, 0.000000000000000000000000000000000000011754944f);
    let _e242 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e242);
    let _e244 = u_xlat1_;
    let _e246 = u_xlat18_;
    let _e248 = u_xlat1_;
    let _e250 = (vec3(_e246) * _e248.xyz);
    u_xlat1_.x = _e250.x;
    u_xlat1_.y = _e250.y;
    u_xlat1_.z = _e250.z;
    let _e260 = _v_buffer3_.v_cb3_[3];
    let _e265 = _v_buffer3_.v_cb3_[3];
    u_xlat18_ = dot(_e260.xyz, _e265.xyz);
    let _e268 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e268);
    let _e270 = u_xlat2_;
    let _e272 = u_xlat18_;
    let _e277 = _v_buffer3_.v_cb3_[3];
    let _e279 = (vec3(_e272) * _e277.xyz);
    u_xlat2_.x = _e279.x;
    u_xlat2_.y = _e279.y;
    u_xlat2_.z = _e279.z;
    let _e286 = u_xlat2_;
    let _e288 = in_NORMAL0_1;
    u_xlat18_ = dot(_e286.xyz, _e288.xyz);
    let _e291 = u_xlat18_;
    let _e295 = _v_buffer3_.v_cb3_[4];
    u_xlat18_ = (_e291 * _e295.x);
    let _e298 = u_xlat18_;
    u_xlat18_ = clamp(_e298, 0f, 1f);
    let _e302 = u_xlat18_;
    u_xlat18_ = log2(_e302);
    let _e304 = u_xlat18_;
    let _e308 = _v_buffer3_.v_cb3_[3];
    u_xlat18_ = (_e304 * _e308.w);
    let _e311 = u_xlat18_;
    vs_COLOR0_ = exp2(vec4(_e311));
    let _e318 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e318.w);
    let _e325 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e325.w);
    let _e332 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e332.w);
    let _e335 = u_xlat2_;
    let _e337 = u_xlat2_;
    let _e339 = log2(_e337.xyz);
    u_xlat2_.x = _e339.x;
    u_xlat2_.y = _e339.y;
    u_xlat2_.z = _e339.z;
    let _e346 = u_xlat2_;
    let _e348 = u_xlat2_;
    let _e354 = (_e348.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e354.x;
    u_xlat2_.y = _e354.y;
    u_xlat2_.z = _e354.z;
    let _e361 = u_xlat2_;
    let _e363 = u_xlat2_;
    let _e365 = exp2(_e363.xyz);
    u_xlat2_.x = _e365.x;
    u_xlat2_.y = _e365.y;
    u_xlat2_.z = _e365.z;
    let _e372 = u_xlat2_;
    let _e374 = u_xlat2_;
    let _e388 = ((_e374.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e388.x;
    u_xlat2_.y = _e388.y;
    u_xlat2_.z = _e388.z;
    let _e395 = u_xlat2_;
    let _e397 = u_xlat2_;
    let _e403 = clamp(_e397.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e403.x;
    u_xlat2_.y = _e403.y;
    u_xlat2_.z = _e403.z;
    let _e413 = _v_buffer0_.v_cb0_[10];
    let _e418 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e413.x, _e418.y);
    let _e421 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e421));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e435 = u_xlatu_loop_1_;
        let _e436 = u_xlatu18_;
        if !((_e435 < _e436)) {
            break;
        }
        {
            let _e442 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e442 >> 2u);
            let _e445 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e445 & 3u));
            let _e449 = u_xlatu20_;
            let _e455 = _v_buffer2_.v_cb2_[(i32(_e449) + 12i)];
            let _e456 = u_xlati21_;
            let _e460 = local[_e456];
            u_xlat20_ = dot(_e455, bitcast<vec4<f32>>(_e460));
            let _e463 = u_xlat20_;
            u_xlati20_ = i32(_e463);
            let _e465 = u_xlat4_;
            let _e467 = u_xlat0_;
            let _e470 = u_xlati20_;
            let _e473 = _v_buffer1_.v_cb1_[_e470];
            let _e476 = u_xlati20_;
            let _e479 = _v_buffer1_.v_cb1_[_e476];
            let _e481 = ((-(_e467.xyz) * _e473.www) + _e479.xyz);
            u_xlat4_.x = _e481.x;
            u_xlat4_.y = _e481.y;
            u_xlat4_.z = _e481.z;
            let _e488 = u_xlat4_;
            let _e490 = u_xlat4_;
            u_xlat21_ = dot(_e488.xyz, _e490.xyz);
            let _e493 = u_xlat21_;
            u_xlat21_ = max(_e493, 0.000061035156f);
            let _e496 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e496);
            let _e498 = u_xlat4_;
            let _e500 = u_xlat22_;
            let _e502 = u_xlat4_;
            let _e504 = (vec3(_e500) * _e502.xyz);
            u_xlat4_.x = _e504.x;
            u_xlat4_.y = _e504.y;
            u_xlat4_.z = _e504.z;
            let _e513 = u_xlati20_;
            let _e518 = _v_buffer1_.v_cb1_[(_e513 + 512i)];
            u_xlat22_ = (1f / _e518.x);
            let _e521 = u_xlat21_;
            u_xlat21_ = (_e521 * 25f);
            let _e524 = u_xlat21_;
            let _e525 = u_xlat22_;
            u_xlat21_ = (_e524 / _e525);
            let _e527 = u_xlat21_;
            u_xlat21_ = (_e527 + 1f);
            let _e532 = u_xlat21_;
            u_xlat21_ = (1f / _e532);
            let _e534 = u_xlati20_;
            let _e539 = _v_buffer1_.v_cb1_[(_e534 + 768i)];
            let _e541 = u_xlat4_;
            u_xlat22_ = dot(_e539.xyz, _e541.xyz);
            let _e544 = u_xlat22_;
            let _e545 = u_xlati20_;
            let _e550 = _v_buffer1_.v_cb1_[(_e545 + 512i)];
            let _e553 = u_xlati20_;
            let _e558 = _v_buffer1_.v_cb1_[(_e553 + 512i)];
            u_xlat22_ = ((_e544 * _e550.z) + _e558.w);
            let _e561 = u_xlat22_;
            u_xlat22_ = clamp(_e561, 0f, 1f);
            let _e565 = u_xlat22_;
            let _e566 = u_xlat22_;
            u_xlat22_ = (_e565 * _e566);
            let _e568 = u_xlat21_;
            let _e569 = u_xlat22_;
            u_xlat21_ = (_e568 * _e569);
            let _e571 = u_xlat5_;
            let _e573 = u_xlat21_;
            let _e575 = u_xlati20_;
            let _e580 = _v_buffer1_.v_cb1_[(_e575 + 256i)];
            let _e582 = (vec3(_e573) * _e580.xyz);
            u_xlat5_.x = _e582.x;
            u_xlat5_.y = _e582.y;
            u_xlat5_.z = _e582.z;
            let _e589 = u_xlat1_;
            let _e591 = u_xlat4_;
            u_xlat20_ = dot(_e589.xyz, _e591.xyz);
            let _e594 = u_xlat20_;
            u_xlat20_ = clamp(_e594, 0f, 1f);
            let _e598 = u_xlat3_;
            let _e600 = u_xlat5_;
            let _e602 = u_xlat20_;
            let _e605 = u_xlat3_;
            let _e607 = ((_e600.xyz * vec3(_e602)) + _e605.xyz);
            u_xlat3_.x = _e607.x;
            u_xlat3_.y = _e607.y;
            u_xlat3_.z = _e607.z;
        }
        continuing {
            let _e439 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e439 + 1u);
        }
    }
    let _e614 = vs_TEXCOORD3_;
    let _e616 = u_xlat2_;
    let _e618 = u_xlat3_;
    let _e620 = (_e616.xyz + _e618.xyz);
    vs_TEXCOORD3_.x = _e620.x;
    vs_TEXCOORD3_.y = _e620.y;
    vs_TEXCOORD3_.z = _e620.z;
    let _e627 = vs_TEXCOORD2_;
    let _e629 = u_xlat0_;
    let _e630 = _e629.xyz;
    vs_TEXCOORD2_.x = _e630.x;
    vs_TEXCOORD2_.y = _e630.y;
    vs_TEXCOORD2_.z = _e630.z;
    let _e637 = vs_NORMAL0_;
    let _e639 = u_xlat1_;
    let _e640 = _e639.xyz;
    vs_NORMAL0_.x = _e640.x;
    vs_NORMAL0_.y = _e640.y;
    vs_NORMAL0_.z = _e640.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e43 = vs_TEXCOORD0_;
    let _e45 = vs_TEXCOORD1_;
    let _e47 = vs_TEXCOORD2_;
    let _e49 = vs_TEXCOORD3_;
    let _e51 = vs_NORMAL0_;
    let _e53 = vs_COLOR0_;
    let _e55 = gl_Position;
    return VertexOutput(_e43, _e45, _e47, _e49, _e51, _e53, _e55);
}
