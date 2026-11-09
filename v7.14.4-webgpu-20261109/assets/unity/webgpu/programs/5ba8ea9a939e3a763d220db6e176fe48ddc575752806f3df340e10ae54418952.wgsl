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
    v_cb3_: array<vec4<f32>, 3>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORD3_: vec3<f32>,
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
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD3_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
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

    let _e76 = in_POSITION0_1;
    let _e81 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e76.yyyy * _e81);
    let _e86 = _v_buffer2_.v_cb2_[0];
    let _e87 = in_POSITION0_1;
    let _e90 = u_xlat0_;
    u_xlat0_ = ((_e86 * _e87.xxxx) + _e90);
    let _e95 = _v_buffer2_.v_cb2_[2];
    let _e96 = in_POSITION0_1;
    let _e99 = u_xlat0_;
    u_xlat0_ = ((_e95 * _e96.zzzz) + _e99);
    let _e101 = u_xlat0_;
    let _e105 = _v_buffer2_.v_cb2_[3];
    u_xlat1_ = (_e101 + _e105);
    let _e107 = u_xlat1_;
    let _e112 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e107.yyyy * _e112);
    let _e117 = _v_buffer0_.v_cb0_[79];
    let _e118 = u_xlat1_;
    let _e121 = u_xlat2_;
    u_xlat2_ = ((_e117 * _e118.xxxx) + _e121);
    let _e126 = _v_buffer0_.v_cb0_[81];
    let _e127 = u_xlat1_;
    let _e130 = u_xlat2_;
    u_xlat2_ = ((_e126 * _e127.zzzz) + _e130);
    let _e136 = _v_buffer0_.v_cb0_[82];
    let _e137 = u_xlat1_;
    let _e140 = u_xlat2_;
    gl_Position = ((_e136 * _e137.wwww) + _e140);
    let _e143 = in_NORMAL0_1;
    let _e148 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e143.xyz, _e148.xyz);
    let _e152 = in_NORMAL0_1;
    let _e157 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e152.xyz, _e157.xyz);
    let _e161 = in_NORMAL0_1;
    let _e166 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e161.xyz, _e166.xyz);
    let _e169 = u_xlat1_;
    let _e171 = u_xlat1_;
    u_xlat18_ = dot(_e169.xyz, _e171.xyz);
    let _e174 = u_xlat18_;
    u_xlat18_ = max(_e174, 0.000000000000000000000000000000000000011754944f);
    let _e177 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e177);
    let _e179 = u_xlat1_;
    let _e181 = u_xlat18_;
    let _e183 = u_xlat1_;
    let _e185 = (vec3(_e181) * _e183.xyz);
    u_xlat1_.x = _e185.x;
    u_xlat1_.y = _e185.y;
    u_xlat1_.z = _e185.z;
    let _e192 = u_xlat0_;
    let _e194 = u_xlat0_;
    let _e199 = _v_buffer2_.v_cb2_[3];
    let _e201 = (_e194.xyz + _e199.xyz);
    u_xlat0_.x = _e201.x;
    u_xlat0_.y = _e201.y;
    u_xlat0_.z = _e201.z;
    let _e212 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e212.w);
    let _e219 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e219.w);
    let _e226 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e226.w);
    let _e229 = u_xlat2_;
    let _e231 = u_xlat2_;
    let _e233 = log2(_e231.xyz);
    u_xlat2_.x = _e233.x;
    u_xlat2_.y = _e233.y;
    u_xlat2_.z = _e233.z;
    let _e240 = u_xlat2_;
    let _e242 = u_xlat2_;
    let _e248 = (_e242.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e248.x;
    u_xlat2_.y = _e248.y;
    u_xlat2_.z = _e248.z;
    let _e255 = u_xlat2_;
    let _e257 = u_xlat2_;
    let _e259 = exp2(_e257.xyz);
    u_xlat2_.x = _e259.x;
    u_xlat2_.y = _e259.y;
    u_xlat2_.z = _e259.z;
    let _e266 = u_xlat2_;
    let _e268 = u_xlat2_;
    let _e282 = ((_e268.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e282.x;
    u_xlat2_.y = _e282.y;
    u_xlat2_.z = _e282.z;
    let _e289 = u_xlat2_;
    let _e291 = u_xlat2_;
    let _e297 = clamp(_e291.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e297.x;
    u_xlat2_.y = _e297.y;
    u_xlat2_.z = _e297.z;
    let _e307 = _v_buffer0_.v_cb0_[10];
    let _e312 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e307.x, _e312.y);
    let _e315 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e315));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e329 = u_xlatu_loop_1_;
        let _e330 = u_xlatu18_;
        if !((_e329 < _e330)) {
            break;
        }
        {
            let _e336 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e336 >> 2u);
            let _e339 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e339 & 3u));
            let _e343 = u_xlatu20_;
            let _e349 = _v_buffer2_.v_cb2_[(i32(_e343) + 12i)];
            let _e350 = u_xlati21_;
            let _e354 = local[_e350];
            u_xlat20_ = dot(_e349, bitcast<vec4<f32>>(_e354));
            let _e357 = u_xlat20_;
            u_xlati20_ = i32(_e357);
            let _e359 = u_xlat4_;
            let _e361 = u_xlat0_;
            let _e364 = u_xlati20_;
            let _e367 = _v_buffer1_.v_cb1_[_e364];
            let _e370 = u_xlati20_;
            let _e373 = _v_buffer1_.v_cb1_[_e370];
            let _e375 = ((-(_e361.xyz) * _e367.www) + _e373.xyz);
            u_xlat4_.x = _e375.x;
            u_xlat4_.y = _e375.y;
            u_xlat4_.z = _e375.z;
            let _e382 = u_xlat4_;
            let _e384 = u_xlat4_;
            u_xlat21_ = dot(_e382.xyz, _e384.xyz);
            let _e387 = u_xlat21_;
            u_xlat21_ = max(_e387, 0.000061035156f);
            let _e390 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e390);
            let _e392 = u_xlat4_;
            let _e394 = u_xlat22_;
            let _e396 = u_xlat4_;
            let _e398 = (vec3(_e394) * _e396.xyz);
            u_xlat4_.x = _e398.x;
            u_xlat4_.y = _e398.y;
            u_xlat4_.z = _e398.z;
            let _e407 = u_xlati20_;
            let _e412 = _v_buffer1_.v_cb1_[(_e407 + 512i)];
            u_xlat22_ = (1f / _e412.x);
            let _e415 = u_xlat21_;
            u_xlat21_ = (_e415 * 25f);
            let _e418 = u_xlat21_;
            let _e419 = u_xlat22_;
            u_xlat21_ = (_e418 / _e419);
            let _e421 = u_xlat21_;
            u_xlat21_ = (_e421 + 1f);
            let _e426 = u_xlat21_;
            u_xlat21_ = (1f / _e426);
            let _e428 = u_xlati20_;
            let _e433 = _v_buffer1_.v_cb1_[(_e428 + 768i)];
            let _e435 = u_xlat4_;
            u_xlat22_ = dot(_e433.xyz, _e435.xyz);
            let _e438 = u_xlat22_;
            let _e439 = u_xlati20_;
            let _e444 = _v_buffer1_.v_cb1_[(_e439 + 512i)];
            let _e447 = u_xlati20_;
            let _e452 = _v_buffer1_.v_cb1_[(_e447 + 512i)];
            u_xlat22_ = ((_e438 * _e444.z) + _e452.w);
            let _e455 = u_xlat22_;
            u_xlat22_ = clamp(_e455, 0f, 1f);
            let _e459 = u_xlat22_;
            let _e460 = u_xlat22_;
            u_xlat22_ = (_e459 * _e460);
            let _e462 = u_xlat21_;
            let _e463 = u_xlat22_;
            u_xlat21_ = (_e462 * _e463);
            let _e465 = u_xlat5_;
            let _e467 = u_xlat21_;
            let _e469 = u_xlati20_;
            let _e474 = _v_buffer1_.v_cb1_[(_e469 + 256i)];
            let _e476 = (vec3(_e467) * _e474.xyz);
            u_xlat5_.x = _e476.x;
            u_xlat5_.y = _e476.y;
            u_xlat5_.z = _e476.z;
            let _e483 = u_xlat1_;
            let _e485 = u_xlat4_;
            u_xlat20_ = dot(_e483.xyz, _e485.xyz);
            let _e488 = u_xlat20_;
            u_xlat20_ = clamp(_e488, 0f, 1f);
            let _e492 = u_xlat3_;
            let _e494 = u_xlat5_;
            let _e496 = u_xlat20_;
            let _e499 = u_xlat3_;
            let _e501 = ((_e494.xyz * vec3(_e496)) + _e499.xyz);
            u_xlat3_.x = _e501.x;
            u_xlat3_.y = _e501.y;
            u_xlat3_.z = _e501.z;
        }
        continuing {
            let _e333 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e333 + 1u);
        }
    }
    let _e508 = vs_TEXCOORD3_;
    let _e510 = u_xlat2_;
    let _e512 = u_xlat3_;
    let _e514 = (_e510.xyz + _e512.xyz);
    vs_TEXCOORD3_.x = _e514.x;
    vs_TEXCOORD3_.y = _e514.y;
    vs_TEXCOORD3_.z = _e514.z;
    let _e521 = u_xlat2_;
    let _e523 = u_xlat1_;
    let _e525 = in_TEXCOORD1_1;
    let _e528 = (_e523.xz * -(_e525.xx));
    u_xlat2_.x = _e528.x;
    u_xlat2_.y = _e528.y;
    let _e533 = u_xlat2_;
    let _e535 = u_xlat2_;
    let _e541 = u_xlat0_;
    let _e543 = ((_e535.xy * vec2<f32>(0.3f, 0.3f)) + _e541.xz);
    u_xlat2_.x = _e543.x;
    u_xlat2_.y = _e543.y;
    let _e551 = _v_buffer0_.v_cb0_[15];
    let _e556 = _v_buffer3_.v_cb3_[2];
    u_xlat18_ = (_e551.x * _e556.y);
    let _e559 = vs_TEXCOORD1_;
    let _e561 = u_xlat2_;
    let _e567 = u_xlat18_;
    let _e569 = ((_e561.xy * vec2<f32>(0.07f, 0.07f)) + vec2(_e567));
    vs_TEXCOORD1_.x = _e569.x;
    vs_TEXCOORD1_.y = _e569.y;
    let _e574 = vs_TEXCOORD0_;
    let _e576 = in_TEXCOORD0_1;
    let _e577 = _e576.xy;
    vs_TEXCOORD0_.x = _e577.x;
    vs_TEXCOORD0_.y = _e577.y;
    let _e582 = vs_NORMAL0_;
    let _e584 = u_xlat1_;
    let _e585 = _e584.xyz;
    vs_NORMAL0_.x = _e585.x;
    vs_NORMAL0_.y = _e585.y;
    vs_NORMAL0_.z = _e585.z;
    let _e592 = vs_TEXCOORD2_;
    let _e594 = u_xlat0_;
    let _e595 = _e594.xyz;
    vs_TEXCOORD2_.x = _e595.x;
    vs_TEXCOORD2_.y = _e595.y;
    vs_TEXCOORD2_.z = _e595.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    main_1();
    let _e41 = vs_NORMAL0_;
    let _e43 = vs_TEXCOORD0_;
    let _e45 = vs_TEXCOORD1_;
    let _e47 = vs_TEXCOORD2_;
    let _e49 = vs_TEXCOORD3_;
    let _e51 = gl_Position;
    return VertexOutput(_e41, _e43, _e45, _e47, _e49, _e51);
}
