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
    v_cb3_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORD3_: vec3<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD3_: vec3<f32>;
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
    u_xlat0_ = (_e101 + _e105);
    let _e107 = u_xlat0_;
    let _e112 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e107.yyyy * _e112);
    let _e117 = _v_buffer0_.v_cb0_[79];
    let _e118 = u_xlat0_;
    let _e121 = u_xlat1_;
    u_xlat1_ = ((_e117 * _e118.xxxx) + _e121);
    let _e126 = _v_buffer0_.v_cb0_[81];
    let _e127 = u_xlat0_;
    let _e130 = u_xlat1_;
    u_xlat1_ = ((_e126 * _e127.zzzz) + _e130);
    let _e136 = _v_buffer0_.v_cb0_[82];
    let _e137 = u_xlat0_;
    let _e140 = u_xlat1_;
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
    let _e192 = u_xlat2_;
    let _e194 = in_TEXCOORD0_1;
    let _e199 = _v_buffer3_.v_cb3_[3];
    let _e201 = (_e194.xy + _e199.xy);
    u_xlat2_.x = _e201.x;
    u_xlat2_.y = _e201.y;
    let _e206 = vs_TEXCOORD0_;
    let _e208 = u_xlat2_;
    let _e213 = _v_buffer3_.v_cb3_[0];
    let _e219 = _v_buffer3_.v_cb3_[0];
    let _e221 = ((_e208.xy * _e213.xy) + _e219.zw);
    vs_TEXCOORD0_.x = _e221.x;
    vs_TEXCOORD0_.y = _e221.y;
    let _e226 = u_xlat2_;
    let _e228 = in_TEXCOORD1_1;
    let _e233 = _v_buffer3_.v_cb3_[3];
    let _e235 = (_e228.xy + _e233.zw);
    u_xlat2_.x = _e235.x;
    u_xlat2_.y = _e235.y;
    let _e240 = vs_TEXCOORD1_;
    let _e242 = u_xlat2_;
    let _e247 = _v_buffer3_.v_cb3_[1];
    let _e253 = _v_buffer3_.v_cb3_[1];
    let _e255 = ((_e242.xy * _e247.xy) + _e253.zw);
    vs_TEXCOORD1_.x = _e255.x;
    vs_TEXCOORD1_.y = _e255.y;
    let _e264 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e264.w);
    let _e271 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e271.w);
    let _e278 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e278.w);
    let _e281 = u_xlat2_;
    let _e283 = u_xlat2_;
    let _e285 = log2(_e283.xyz);
    u_xlat2_.x = _e285.x;
    u_xlat2_.y = _e285.y;
    u_xlat2_.z = _e285.z;
    let _e292 = u_xlat2_;
    let _e294 = u_xlat2_;
    let _e300 = (_e294.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e300.x;
    u_xlat2_.y = _e300.y;
    u_xlat2_.z = _e300.z;
    let _e307 = u_xlat2_;
    let _e309 = u_xlat2_;
    let _e311 = exp2(_e309.xyz);
    u_xlat2_.x = _e311.x;
    u_xlat2_.y = _e311.y;
    u_xlat2_.z = _e311.z;
    let _e318 = u_xlat2_;
    let _e320 = u_xlat2_;
    let _e334 = ((_e320.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e334.x;
    u_xlat2_.y = _e334.y;
    u_xlat2_.z = _e334.z;
    let _e341 = u_xlat2_;
    let _e343 = u_xlat2_;
    let _e349 = clamp(_e343.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e349.x;
    u_xlat2_.y = _e349.y;
    u_xlat2_.z = _e349.z;
    let _e359 = _v_buffer0_.v_cb0_[10];
    let _e364 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e359.x, _e364.y);
    let _e367 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e367));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e381 = u_xlatu_loop_1_;
        let _e382 = u_xlatu18_;
        if !((_e381 < _e382)) {
            break;
        }
        {
            let _e388 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e388 >> 2u);
            let _e391 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e391 & 3u));
            let _e395 = u_xlatu20_;
            let _e401 = _v_buffer2_.v_cb2_[(i32(_e395) + 12i)];
            let _e402 = u_xlati21_;
            let _e406 = local[_e402];
            u_xlat20_ = dot(_e401, bitcast<vec4<f32>>(_e406));
            let _e409 = u_xlat20_;
            u_xlati20_ = i32(_e409);
            let _e411 = u_xlat4_;
            let _e413 = u_xlat0_;
            let _e416 = u_xlati20_;
            let _e419 = _v_buffer1_.v_cb1_[_e416];
            let _e422 = u_xlati20_;
            let _e425 = _v_buffer1_.v_cb1_[_e422];
            let _e427 = ((-(_e413.xyz) * _e419.www) + _e425.xyz);
            u_xlat4_.x = _e427.x;
            u_xlat4_.y = _e427.y;
            u_xlat4_.z = _e427.z;
            let _e434 = u_xlat4_;
            let _e436 = u_xlat4_;
            u_xlat21_ = dot(_e434.xyz, _e436.xyz);
            let _e439 = u_xlat21_;
            u_xlat21_ = max(_e439, 0.000061035156f);
            let _e442 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e442);
            let _e444 = u_xlat4_;
            let _e446 = u_xlat22_;
            let _e448 = u_xlat4_;
            let _e450 = (vec3(_e446) * _e448.xyz);
            u_xlat4_.x = _e450.x;
            u_xlat4_.y = _e450.y;
            u_xlat4_.z = _e450.z;
            let _e459 = u_xlati20_;
            let _e464 = _v_buffer1_.v_cb1_[(_e459 + 512i)];
            u_xlat22_ = (1f / _e464.x);
            let _e467 = u_xlat21_;
            u_xlat21_ = (_e467 * 25f);
            let _e470 = u_xlat21_;
            let _e471 = u_xlat22_;
            u_xlat21_ = (_e470 / _e471);
            let _e473 = u_xlat21_;
            u_xlat21_ = (_e473 + 1f);
            let _e478 = u_xlat21_;
            u_xlat21_ = (1f / _e478);
            let _e480 = u_xlati20_;
            let _e485 = _v_buffer1_.v_cb1_[(_e480 + 768i)];
            let _e487 = u_xlat4_;
            u_xlat22_ = dot(_e485.xyz, _e487.xyz);
            let _e490 = u_xlat22_;
            let _e491 = u_xlati20_;
            let _e496 = _v_buffer1_.v_cb1_[(_e491 + 512i)];
            let _e499 = u_xlati20_;
            let _e504 = _v_buffer1_.v_cb1_[(_e499 + 512i)];
            u_xlat22_ = ((_e490 * _e496.z) + _e504.w);
            let _e507 = u_xlat22_;
            u_xlat22_ = clamp(_e507, 0f, 1f);
            let _e511 = u_xlat22_;
            let _e512 = u_xlat22_;
            u_xlat22_ = (_e511 * _e512);
            let _e514 = u_xlat21_;
            let _e515 = u_xlat22_;
            u_xlat21_ = (_e514 * _e515);
            let _e517 = u_xlat5_;
            let _e519 = u_xlat21_;
            let _e521 = u_xlati20_;
            let _e526 = _v_buffer1_.v_cb1_[(_e521 + 256i)];
            let _e528 = (vec3(_e519) * _e526.xyz);
            u_xlat5_.x = _e528.x;
            u_xlat5_.y = _e528.y;
            u_xlat5_.z = _e528.z;
            let _e535 = u_xlat1_;
            let _e537 = u_xlat4_;
            u_xlat20_ = dot(_e535.xyz, _e537.xyz);
            let _e540 = u_xlat20_;
            u_xlat20_ = clamp(_e540, 0f, 1f);
            let _e544 = u_xlat3_;
            let _e546 = u_xlat5_;
            let _e548 = u_xlat20_;
            let _e551 = u_xlat3_;
            let _e553 = ((_e546.xyz * vec3(_e548)) + _e551.xyz);
            u_xlat3_.x = _e553.x;
            u_xlat3_.y = _e553.y;
            u_xlat3_.z = _e553.z;
        }
        continuing {
            let _e385 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e385 + 1u);
        }
    }
    let _e560 = vs_TEXCOORD3_;
    let _e562 = u_xlat2_;
    let _e564 = u_xlat3_;
    let _e566 = (_e562.xyz + _e564.xyz);
    vs_TEXCOORD3_.x = _e566.x;
    vs_TEXCOORD3_.y = _e566.y;
    vs_TEXCOORD3_.z = _e566.z;
    let _e573 = vs_TEXCOORD2_;
    let _e575 = u_xlat0_;
    let _e576 = _e575.xyz;
    vs_TEXCOORD2_.x = _e576.x;
    vs_TEXCOORD2_.y = _e576.y;
    vs_TEXCOORD2_.z = _e576.z;
    let _e583 = vs_NORMAL0_;
    let _e585 = u_xlat1_;
    let _e586 = _e585.xyz;
    vs_NORMAL0_.x = _e586.x;
    vs_NORMAL0_.y = _e586.y;
    vs_NORMAL0_.z = _e586.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e41 = vs_TEXCOORD0_;
    let _e43 = vs_TEXCOORD1_;
    let _e45 = vs_TEXCOORD2_;
    let _e47 = vs_TEXCOORD3_;
    let _e49 = vs_NORMAL0_;
    let _e51 = gl_Position;
    return VertexOutput(_e41, _e43, _e45, _e47, _e49, _e51);
}
