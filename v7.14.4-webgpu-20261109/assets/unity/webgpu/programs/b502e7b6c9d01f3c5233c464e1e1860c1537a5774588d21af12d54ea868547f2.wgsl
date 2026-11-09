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
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
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

    let _e74 = vs_TEXCOORD0_;
    let _e76 = in_TEXCOORD0_1;
    let _e78 = _v_buffer3_;
    let _e82 = _v_buffer3_;
    let _e85 = ((_e76.xy * _e78.v_cb3_.xy) + _e82.v_cb3_.zw);
    vs_TEXCOORD0_.x = _e85.x;
    vs_TEXCOORD0_.y = _e85.y;
    let _e91 = in_NORMAL0_1;
    let _e96 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.x = dot(_e91.xyz, _e96.xyz);
    let _e100 = in_NORMAL0_1;
    let _e105 = _v_buffer2_.v_cb2_[5];
    u_xlat0_.y = dot(_e100.xyz, _e105.xyz);
    let _e109 = in_NORMAL0_1;
    let _e114 = _v_buffer2_.v_cb2_[6];
    u_xlat0_.z = dot(_e109.xyz, _e114.xyz);
    let _e117 = u_xlat0_;
    let _e119 = u_xlat0_;
    u_xlat18_ = dot(_e117.xyz, _e119.xyz);
    let _e122 = u_xlat18_;
    u_xlat18_ = max(_e122, 0.000000000000000000000000000000000000011754944f);
    let _e125 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e125);
    let _e127 = u_xlat0_;
    let _e129 = u_xlat18_;
    let _e131 = u_xlat0_;
    let _e133 = (vec3(_e129) * _e131.xyz);
    u_xlat0_.x = _e133.x;
    u_xlat0_.y = _e133.y;
    u_xlat0_.z = _e133.z;
    let _e140 = u_xlat1_;
    let _e142 = in_POSITION0_1;
    let _e147 = _v_buffer2_.v_cb2_[1];
    let _e149 = (_e142.yyy * _e147.xyz);
    u_xlat1_.x = _e149.x;
    u_xlat1_.y = _e149.y;
    u_xlat1_.z = _e149.z;
    let _e156 = u_xlat1_;
    let _e161 = _v_buffer2_.v_cb2_[0];
    let _e163 = in_POSITION0_1;
    let _e166 = u_xlat1_;
    let _e168 = ((_e161.xyz * _e163.xxx) + _e166.xyz);
    u_xlat1_.x = _e168.x;
    u_xlat1_.y = _e168.y;
    u_xlat1_.z = _e168.z;
    let _e175 = u_xlat1_;
    let _e180 = _v_buffer2_.v_cb2_[2];
    let _e182 = in_POSITION0_1;
    let _e185 = u_xlat1_;
    let _e187 = ((_e180.xyz * _e182.zzz) + _e185.xyz);
    u_xlat1_.x = _e187.x;
    u_xlat1_.y = _e187.y;
    u_xlat1_.z = _e187.z;
    let _e194 = u_xlat1_;
    let _e196 = u_xlat1_;
    let _e201 = _v_buffer2_.v_cb2_[3];
    let _e203 = (_e196.xyz + _e201.xyz);
    u_xlat1_.x = _e203.x;
    u_xlat1_.y = _e203.y;
    u_xlat1_.z = _e203.z;
    let _e214 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e214.w);
    let _e221 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e221.w);
    let _e228 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e228.w);
    let _e231 = u_xlat2_;
    let _e233 = u_xlat2_;
    let _e235 = log2(_e233.xyz);
    u_xlat2_.x = _e235.x;
    u_xlat2_.y = _e235.y;
    u_xlat2_.z = _e235.z;
    let _e242 = u_xlat2_;
    let _e244 = u_xlat2_;
    let _e250 = (_e244.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e250.x;
    u_xlat2_.y = _e250.y;
    u_xlat2_.z = _e250.z;
    let _e257 = u_xlat2_;
    let _e259 = u_xlat2_;
    let _e261 = exp2(_e259.xyz);
    u_xlat2_.x = _e261.x;
    u_xlat2_.y = _e261.y;
    u_xlat2_.z = _e261.z;
    let _e268 = u_xlat2_;
    let _e270 = u_xlat2_;
    let _e284 = ((_e270.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e284.x;
    u_xlat2_.y = _e284.y;
    u_xlat2_.z = _e284.z;
    let _e291 = u_xlat2_;
    let _e293 = u_xlat2_;
    let _e299 = clamp(_e293.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e299.x;
    u_xlat2_.y = _e299.y;
    u_xlat2_.z = _e299.z;
    let _e309 = _v_buffer0_.v_cb0_[10];
    let _e314 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e309.x, _e314.y);
    let _e317 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e317));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e331 = u_xlatu_loop_1_;
        let _e332 = u_xlatu18_;
        if !((_e331 < _e332)) {
            break;
        }
        {
            let _e338 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e338 >> 2u);
            let _e341 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e341 & 3u));
            let _e345 = u_xlatu20_;
            let _e351 = _v_buffer2_.v_cb2_[(i32(_e345) + 12i)];
            let _e352 = u_xlati21_;
            let _e356 = local[_e352];
            u_xlat20_ = dot(_e351, bitcast<vec4<f32>>(_e356));
            let _e359 = u_xlat20_;
            u_xlati20_ = i32(_e359);
            let _e361 = u_xlat4_;
            let _e363 = u_xlat1_;
            let _e366 = u_xlati20_;
            let _e369 = _v_buffer1_.v_cb1_[_e366];
            let _e372 = u_xlati20_;
            let _e375 = _v_buffer1_.v_cb1_[_e372];
            let _e377 = ((-(_e363.xyz) * _e369.www) + _e375.xyz);
            u_xlat4_.x = _e377.x;
            u_xlat4_.y = _e377.y;
            u_xlat4_.z = _e377.z;
            let _e384 = u_xlat4_;
            let _e386 = u_xlat4_;
            u_xlat21_ = dot(_e384.xyz, _e386.xyz);
            let _e389 = u_xlat21_;
            u_xlat21_ = max(_e389, 0.000061035156f);
            let _e392 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e392);
            let _e394 = u_xlat4_;
            let _e396 = u_xlat22_;
            let _e398 = u_xlat4_;
            let _e400 = (vec3(_e396) * _e398.xyz);
            u_xlat4_.x = _e400.x;
            u_xlat4_.y = _e400.y;
            u_xlat4_.z = _e400.z;
            let _e409 = u_xlati20_;
            let _e414 = _v_buffer1_.v_cb1_[(_e409 + 512i)];
            u_xlat22_ = (1f / _e414.x);
            let _e417 = u_xlat21_;
            u_xlat21_ = (_e417 * 25f);
            let _e420 = u_xlat21_;
            let _e421 = u_xlat22_;
            u_xlat21_ = (_e420 / _e421);
            let _e423 = u_xlat21_;
            u_xlat21_ = (_e423 + 1f);
            let _e428 = u_xlat21_;
            u_xlat21_ = (1f / _e428);
            let _e430 = u_xlati20_;
            let _e435 = _v_buffer1_.v_cb1_[(_e430 + 768i)];
            let _e437 = u_xlat4_;
            u_xlat22_ = dot(_e435.xyz, _e437.xyz);
            let _e440 = u_xlat22_;
            let _e441 = u_xlati20_;
            let _e446 = _v_buffer1_.v_cb1_[(_e441 + 512i)];
            let _e449 = u_xlati20_;
            let _e454 = _v_buffer1_.v_cb1_[(_e449 + 512i)];
            u_xlat22_ = ((_e440 * _e446.z) + _e454.w);
            let _e457 = u_xlat22_;
            u_xlat22_ = clamp(_e457, 0f, 1f);
            let _e461 = u_xlat22_;
            let _e462 = u_xlat22_;
            u_xlat22_ = (_e461 * _e462);
            let _e464 = u_xlat21_;
            let _e465 = u_xlat22_;
            u_xlat21_ = (_e464 * _e465);
            let _e467 = u_xlat5_;
            let _e469 = u_xlat21_;
            let _e471 = u_xlati20_;
            let _e476 = _v_buffer1_.v_cb1_[(_e471 + 256i)];
            let _e478 = (vec3(_e469) * _e476.xyz);
            u_xlat5_.x = _e478.x;
            u_xlat5_.y = _e478.y;
            u_xlat5_.z = _e478.z;
            let _e485 = u_xlat0_;
            let _e487 = u_xlat4_;
            u_xlat20_ = dot(_e485.xyz, _e487.xyz);
            let _e490 = u_xlat20_;
            u_xlat20_ = clamp(_e490, 0f, 1f);
            let _e494 = u_xlat3_;
            let _e496 = u_xlat5_;
            let _e498 = u_xlat20_;
            let _e501 = u_xlat3_;
            let _e503 = ((_e496.xyz * vec3(_e498)) + _e501.xyz);
            u_xlat3_.x = _e503.x;
            u_xlat3_.y = _e503.y;
            u_xlat3_.z = _e503.z;
        }
        continuing {
            let _e335 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e335 + 1u);
        }
    }
    let _e510 = vs_TEXCOORD2_;
    let _e512 = u_xlat2_;
    let _e514 = u_xlat3_;
    let _e516 = (_e512.xyz + _e514.xyz);
    vs_TEXCOORD2_.x = _e516.x;
    vs_TEXCOORD2_.y = _e516.y;
    vs_TEXCOORD2_.z = _e516.z;
    let _e523 = in_POSITION0_1;
    let _e528 = _v_buffer2_.v_cb2_[1];
    u_xlat2_ = (_e523.yyyy * _e528);
    let _e533 = _v_buffer2_.v_cb2_[0];
    let _e534 = in_POSITION0_1;
    let _e537 = u_xlat2_;
    u_xlat2_ = ((_e533 * _e534.xxxx) + _e537);
    let _e542 = _v_buffer2_.v_cb2_[2];
    let _e543 = in_POSITION0_1;
    let _e546 = u_xlat2_;
    u_xlat2_ = ((_e542 * _e543.zzzz) + _e546);
    let _e548 = u_xlat2_;
    let _e552 = _v_buffer2_.v_cb2_[3];
    u_xlat2_ = (_e548 + _e552);
    let _e554 = u_xlat2_;
    let _e559 = _v_buffer0_.v_cb0_[80];
    u_xlat3_ = (_e554.yyyy * _e559);
    let _e564 = _v_buffer0_.v_cb0_[79];
    let _e565 = u_xlat2_;
    let _e568 = u_xlat3_;
    u_xlat3_ = ((_e564 * _e565.xxxx) + _e568);
    let _e573 = _v_buffer0_.v_cb0_[81];
    let _e574 = u_xlat2_;
    let _e577 = u_xlat3_;
    u_xlat3_ = ((_e573 * _e574.zzzz) + _e577);
    let _e583 = _v_buffer0_.v_cb0_[82];
    let _e584 = u_xlat2_;
    let _e587 = u_xlat3_;
    gl_Position = ((_e583 * _e584.wwww) + _e587);
    let _e589 = vs_TEXCOORD1_;
    let _e591 = u_xlat1_;
    let _e592 = _e591.xyz;
    vs_TEXCOORD1_.x = _e592.x;
    vs_TEXCOORD1_.y = _e592.y;
    vs_TEXCOORD1_.z = _e592.z;
    let _e599 = vs_NORMAL0_;
    let _e601 = u_xlat0_;
    let _e602 = _e601.xyz;
    vs_NORMAL0_.x = _e602.x;
    vs_NORMAL0_.y = _e602.y;
    vs_NORMAL0_.z = _e602.z;
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
