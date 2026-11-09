struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 1024>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 14>,
}

struct v_buffer3_ {
    v_cb3_: vec4<f32>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec4<f32>,
    @location(3) vs_TEXCOORD3_: vec4<f32>,
    @location(4) vs_TEXCOORD4_: vec4<f32>,
    @location(5) vs_TEXCOORD5_: vec4<f32>,
    @location(7) vs_TEXCOORD7_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TANGENT0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec4<f32>;
var<private> vs_TEXCOORD3_: vec4<f32>;
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_TEXCOORD5_: vec4<f32>;
var<private> vs_TEXCOORD7_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat18_: f32 = 0f;
    var u_xlatu18_: u32 = 0u;
    var u_xlatb18_: bool = false;
    var u_xlat19_: f32 = 0f;
    var u_xlatu19_: u32 = 0u;
    var u_xlat20_: f32 = 0f;
    var u_xlati20_: i32 = 0i;
    var u_xlatu20_: u32 = 0u;
    var u_xlatb20_: bool = false;
    var u_xlat21_: f32 = 0f;
    var u_xlati21_: i32 = 0i;
    var u_xlat22_: f32 = 0f;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;
    var u_xlatu_loop_1_: u32 = 0u;
    var local_4: array<vec4<u32>, 4> = ImmCB_0_;

    let _e84 = u_xlat0_;
    let _e86 = in_POSITION0_1;
    let _e91 = _v_buffer2_.v_cb2_[1];
    let _e93 = (_e86.yyy * _e91.xyz);
    u_xlat0_.x = _e93.x;
    u_xlat0_.y = _e93.y;
    u_xlat0_.z = _e93.z;
    let _e100 = u_xlat0_;
    let _e105 = _v_buffer2_.v_cb2_[0];
    let _e107 = in_POSITION0_1;
    let _e110 = u_xlat0_;
    let _e112 = ((_e105.xyz * _e107.xxx) + _e110.xyz);
    u_xlat0_.x = _e112.x;
    u_xlat0_.y = _e112.y;
    u_xlat0_.z = _e112.z;
    let _e119 = u_xlat0_;
    let _e124 = _v_buffer2_.v_cb2_[2];
    let _e126 = in_POSITION0_1;
    let _e129 = u_xlat0_;
    let _e131 = ((_e124.xyz * _e126.zzz) + _e129.xyz);
    u_xlat0_.x = _e131.x;
    u_xlat0_.y = _e131.y;
    u_xlat0_.z = _e131.z;
    let _e138 = u_xlat0_;
    let _e140 = u_xlat0_;
    let _e145 = _v_buffer2_.v_cb2_[3];
    let _e147 = (_e140.xyz + _e145.xyz);
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    u_xlat0_.z = _e147.z;
    let _e154 = u_xlat0_;
    let _e159 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e154.yyyy * _e159);
    let _e164 = _v_buffer0_.v_cb0_[79];
    let _e165 = u_xlat0_;
    let _e168 = u_xlat1_;
    u_xlat1_ = ((_e164 * _e165.xxxx) + _e168);
    let _e173 = _v_buffer0_.v_cb0_[81];
    let _e174 = u_xlat0_;
    let _e177 = u_xlat1_;
    u_xlat1_ = ((_e173 * _e174.zzzz) + _e177);
    let _e180 = u_xlat1_;
    let _e184 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e180 + _e184);
    let _e189 = _v_buffer2_.v_cb2_[9];
    u_xlatb18_ = (_e189.w >= 0f);
    let _e193 = u_xlatb18_;
    if _e193 {
        local = 1f;
    } else {
        local = -1f;
    }
    let _e198 = local;
    u_xlat18_ = _e198;
    let _e199 = u_xlat18_;
    let _e200 = in_TANGENT0_1;
    u_xlat18_ = (_e199 * _e200.w);
    let _e204 = in_NORMAL0_1;
    let _e209 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e204.xyz, _e209.xyz);
    let _e213 = in_NORMAL0_1;
    let _e218 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e213.xyz, _e218.xyz);
    let _e222 = in_NORMAL0_1;
    let _e227 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e222.xyz, _e227.xyz);
    let _e230 = u_xlat1_;
    let _e232 = u_xlat1_;
    u_xlat19_ = dot(_e230.xyz, _e232.xyz);
    let _e235 = u_xlat19_;
    u_xlat19_ = max(_e235, 0.000000000000000000000000000000000000011754944f);
    let _e238 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e238);
    let _e240 = u_xlat1_;
    let _e242 = u_xlat19_;
    let _e244 = u_xlat1_;
    let _e246 = (vec3(_e242) * _e244.xyz);
    u_xlat1_.x = _e246.x;
    u_xlat1_.y = _e246.y;
    u_xlat1_.z = _e246.z;
    let _e253 = u_xlat2_;
    let _e255 = in_TANGENT0_1;
    let _e260 = _v_buffer2_.v_cb2_[1];
    let _e262 = (_e255.yyy * _e260.xyz);
    u_xlat2_.x = _e262.x;
    u_xlat2_.y = _e262.y;
    u_xlat2_.z = _e262.z;
    let _e269 = u_xlat2_;
    let _e274 = _v_buffer2_.v_cb2_[0];
    let _e276 = in_TANGENT0_1;
    let _e279 = u_xlat2_;
    let _e281 = ((_e274.xyz * _e276.xxx) + _e279.xyz);
    u_xlat2_.x = _e281.x;
    u_xlat2_.y = _e281.y;
    u_xlat2_.z = _e281.z;
    let _e288 = u_xlat2_;
    let _e293 = _v_buffer2_.v_cb2_[2];
    let _e295 = in_TANGENT0_1;
    let _e298 = u_xlat2_;
    let _e300 = ((_e293.xyz * _e295.zzz) + _e298.xyz);
    u_xlat2_.x = _e300.x;
    u_xlat2_.y = _e300.y;
    u_xlat2_.z = _e300.z;
    let _e307 = u_xlat2_;
    let _e309 = u_xlat2_;
    u_xlat19_ = dot(_e307.xyz, _e309.xyz);
    let _e312 = u_xlat19_;
    u_xlat19_ = max(_e312, 0.000000000000000000000000000000000000011754944f);
    let _e315 = u_xlat19_;
    u_xlat19_ = inverseSqrt(_e315);
    let _e317 = u_xlat2_;
    let _e319 = u_xlat19_;
    let _e321 = u_xlat2_;
    let _e323 = (vec3(_e319) * _e321.xyz);
    u_xlat2_.x = _e323.x;
    u_xlat2_.y = _e323.y;
    u_xlat2_.z = _e323.z;
    let _e330 = u_xlat3_;
    let _e332 = u_xlat1_;
    let _e334 = u_xlat2_;
    let _e336 = (_e332.zxy * _e334.yzx);
    u_xlat3_.x = _e336.x;
    u_xlat3_.y = _e336.y;
    u_xlat3_.z = _e336.z;
    let _e343 = u_xlat3_;
    let _e345 = u_xlat1_;
    let _e347 = u_xlat2_;
    let _e350 = u_xlat3_;
    let _e353 = ((_e345.yzx * _e347.zxy) + -(_e350.xyz));
    u_xlat3_.x = _e353.x;
    u_xlat3_.y = _e353.y;
    u_xlat3_.z = _e353.z;
    let _e360 = vs_TEXCOORD4_;
    let _e362 = u_xlat18_;
    let _e364 = u_xlat3_;
    let _e366 = (vec3(_e362) * _e364.xyz);
    vs_TEXCOORD4_.x = _e366.x;
    vs_TEXCOORD4_.y = _e366.y;
    vs_TEXCOORD4_.z = _e366.z;
    let _e373 = vs_TEXCOORD0_;
    let _e375 = in_TEXCOORD0_1;
    let _e377 = _v_buffer3_;
    let _e381 = _v_buffer3_;
    let _e384 = ((_e375.xy * _e377.v_cb3_.xy) + _e381.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e384.x;
    vs_TEXCOORD0_.y = _e384.y;
    let _e392 = _v_buffer0_.v_cb0_[25];
    u_xlatb18_ = (_e392.w == 0f);
    let _e396 = u_xlat3_;
    let _e398 = u_xlat0_;
    let _e404 = _v_buffer0_.v_cb0_[21];
    let _e406 = (-(_e398.xyz) + _e404.xyz);
    u_xlat3_.x = _e406.x;
    u_xlat3_.y = _e406.y;
    u_xlat3_.z = _e406.z;
    let _e414 = u_xlatb18_;
    if _e414 {
        let _e415 = u_xlat3_;
        local_1 = _e415.x;
    } else {
        let _e420 = _v_buffer0_.v_cb0_[67];
        local_1 = _e420.z;
    }
    let _e423 = local_1;
    vs_TEXCOORD2_.w = _e423;
    let _e425 = u_xlatb18_;
    if _e425 {
        let _e426 = u_xlat3_;
        local_2 = _e426.y;
    } else {
        let _e431 = _v_buffer0_.v_cb0_[68];
        local_2 = _e431.z;
    }
    let _e434 = local_2;
    vs_TEXCOORD3_.w = _e434;
    let _e436 = u_xlatb18_;
    if _e436 {
        let _e437 = u_xlat3_;
        local_3 = _e437.z;
    } else {
        let _e442 = _v_buffer0_.v_cb0_[69];
        local_3 = _e442.z;
    }
    let _e445 = local_3;
    vs_TEXCOORD4_.w = _e445;
    let _e449 = _v_buffer0_.v_cb0_[10];
    let _e454 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e449.x, _e454.y);
    let _e457 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e457));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e471 = u_xlatu_loop_1_;
        let _e472 = u_xlatu18_;
        if !((_e471 < _e472)) {
            break;
        }
        {
            let _e478 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e478 >> 2u);
            let _e481 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e481 & 3u));
            let _e485 = u_xlatu20_;
            let _e491 = _v_buffer2_.v_cb2_[(i32(_e485) + 12i)];
            let _e492 = u_xlati21_;
            let _e496 = local_4[_e492];
            u_xlat20_ = dot(_e491, bitcast<vec4<f32>>(_e496));
            let _e499 = u_xlat20_;
            u_xlati20_ = i32(_e499);
            let _e501 = u_xlat4_;
            let _e503 = u_xlat0_;
            let _e506 = u_xlati20_;
            let _e509 = _v_buffer1_.v_cb1_[_e506];
            let _e512 = u_xlati20_;
            let _e515 = _v_buffer1_.v_cb1_[_e512];
            let _e517 = ((-(_e503.xyz) * _e509.www) + _e515.xyz);
            u_xlat4_.x = _e517.x;
            u_xlat4_.y = _e517.y;
            u_xlat4_.z = _e517.z;
            let _e524 = u_xlat4_;
            let _e526 = u_xlat4_;
            u_xlat21_ = dot(_e524.xyz, _e526.xyz);
            let _e529 = u_xlat21_;
            u_xlat21_ = max(_e529, 0.000061035156f);
            let _e532 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e532);
            let _e534 = u_xlat4_;
            let _e536 = u_xlat22_;
            let _e538 = u_xlat4_;
            let _e540 = (vec3(_e536) * _e538.xyz);
            u_xlat4_.x = _e540.x;
            u_xlat4_.y = _e540.y;
            u_xlat4_.z = _e540.z;
            let _e549 = u_xlat21_;
            u_xlat22_ = (1f / _e549);
            let _e551 = u_xlat21_;
            let _e552 = u_xlati20_;
            let _e557 = _v_buffer1_.v_cb1_[(_e552 + 512i)];
            u_xlat21_ = (_e551 * _e557.x);
            let _e560 = u_xlat21_;
            let _e562 = u_xlat21_;
            u_xlat21_ = ((-(_e560) * _e562) + 1f);
            let _e566 = u_xlat21_;
            u_xlat21_ = max(_e566, 0f);
            let _e569 = u_xlat21_;
            let _e570 = u_xlat21_;
            u_xlat21_ = (_e569 * _e570);
            let _e572 = u_xlat21_;
            let _e573 = u_xlat22_;
            u_xlat21_ = (_e572 * _e573);
            let _e575 = u_xlati20_;
            let _e580 = _v_buffer1_.v_cb1_[(_e575 + 768i)];
            let _e582 = u_xlat4_;
            u_xlat22_ = dot(_e580.xyz, _e582.xyz);
            let _e585 = u_xlat22_;
            let _e586 = u_xlati20_;
            let _e591 = _v_buffer1_.v_cb1_[(_e586 + 512i)];
            let _e594 = u_xlati20_;
            let _e599 = _v_buffer1_.v_cb1_[(_e594 + 512i)];
            u_xlat22_ = ((_e585 * _e591.z) + _e599.w);
            let _e602 = u_xlat22_;
            u_xlat22_ = clamp(_e602, 0f, 1f);
            let _e606 = u_xlat22_;
            let _e607 = u_xlat22_;
            u_xlat22_ = (_e606 * _e607);
            let _e609 = u_xlat21_;
            let _e610 = u_xlat22_;
            u_xlat21_ = (_e609 * _e610);
            let _e612 = u_xlat5_;
            let _e614 = u_xlat21_;
            let _e616 = u_xlati20_;
            let _e621 = _v_buffer1_.v_cb1_[(_e616 + 256i)];
            let _e623 = (vec3(_e614) * _e621.xyz);
            u_xlat5_.x = _e623.x;
            u_xlat5_.y = _e623.y;
            u_xlat5_.z = _e623.z;
            let _e630 = u_xlat1_;
            let _e632 = u_xlat4_;
            u_xlat20_ = dot(_e630.xyz, _e632.xyz);
            let _e635 = u_xlat20_;
            u_xlat20_ = clamp(_e635, 0f, 1f);
            let _e639 = u_xlat3_;
            let _e641 = u_xlat5_;
            let _e643 = u_xlat20_;
            let _e646 = u_xlat3_;
            let _e648 = ((_e641.xyz * vec3(_e643)) + _e646.xyz);
            u_xlat3_.x = _e648.x;
            u_xlat3_.y = _e648.y;
            u_xlat3_.z = _e648.z;
        }
        continuing {
            let _e475 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e475 + 1u);
        }
    }
    let _e655 = vs_TEXCOORD5_;
    let _e657 = u_xlat3_;
    let _e658 = _e657.xyz;
    vs_TEXCOORD5_.y = _e658.x;
    vs_TEXCOORD5_.z = _e658.y;
    vs_TEXCOORD5_.w = _e658.z;
    let _e665 = vs_TEXCOORD2_;
    let _e667 = u_xlat1_;
    let _e668 = _e667.xyz;
    vs_TEXCOORD2_.x = _e668.x;
    vs_TEXCOORD2_.y = _e668.y;
    vs_TEXCOORD2_.z = _e668.z;
    let _e675 = vs_TEXCOORD3_;
    let _e677 = u_xlat2_;
    let _e678 = _e677.xyz;
    vs_TEXCOORD3_.x = _e678.x;
    vs_TEXCOORD3_.y = _e678.y;
    vs_TEXCOORD3_.z = _e678.z;
    vs_TEXCOORD5_.x = 0f;
    let _e687 = vs_TEXCOORD1_;
    let _e689 = u_xlat0_;
    let _e690 = _e689.xyz;
    vs_TEXCOORD1_.x = _e690.x;
    vs_TEXCOORD1_.y = _e690.y;
    vs_TEXCOORD1_.z = _e690.z;
    let _e697 = vs_TEXCOORD7_;
    vs_TEXCOORD7_.x = 0f;
    vs_TEXCOORD7_.y = 0f;
    vs_TEXCOORD7_.z = 0f;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(2) in_TANGENT0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TANGENT0_1 = in_TANGENT0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e45 = vs_TEXCOORD0_;
    let _e47 = vs_TEXCOORD1_;
    let _e49 = vs_TEXCOORD2_;
    let _e51 = vs_TEXCOORD3_;
    let _e53 = vs_TEXCOORD4_;
    let _e55 = vs_TEXCOORD5_;
    let _e57 = vs_TEXCOORD7_;
    let _e59 = gl_Position;
    return VertexOutput(_e45, _e47, _e49, _e51, _e53, _e55, _e57, _e59);
}
