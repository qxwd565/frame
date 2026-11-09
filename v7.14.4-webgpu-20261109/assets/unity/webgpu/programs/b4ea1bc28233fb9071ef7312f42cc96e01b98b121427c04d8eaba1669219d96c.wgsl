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
    @location(5) vs_TEXCOORD5_: vec2<f32>,
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
var<private> vs_TEXCOORD5_: vec2<f32>;
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

    let _e75 = in_POSITION0_1;
    let _e80 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e75.yyyy * _e80);
    let _e85 = _v_buffer2_.v_cb2_[0];
    let _e86 = in_POSITION0_1;
    let _e89 = u_xlat0_;
    u_xlat0_ = ((_e85 * _e86.xxxx) + _e89);
    let _e94 = _v_buffer2_.v_cb2_[2];
    let _e95 = in_POSITION0_1;
    let _e98 = u_xlat0_;
    u_xlat0_ = ((_e94 * _e95.zzzz) + _e98);
    let _e100 = u_xlat0_;
    let _e104 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e100 + _e104);
    let _e106 = u_xlat0_;
    let _e111 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e106.yyyy * _e111);
    let _e116 = _v_buffer0_.v_cb0_[79];
    let _e117 = u_xlat0_;
    let _e120 = u_xlat1_;
    u_xlat1_ = ((_e116 * _e117.xxxx) + _e120);
    let _e125 = _v_buffer0_.v_cb0_[81];
    let _e126 = u_xlat0_;
    let _e129 = u_xlat1_;
    u_xlat1_ = ((_e125 * _e126.zzzz) + _e129);
    let _e135 = _v_buffer0_.v_cb0_[82];
    let _e136 = u_xlat0_;
    let _e139 = u_xlat1_;
    gl_Position = ((_e135 * _e136.wwww) + _e139);
    let _e141 = u_xlat1_;
    let _e143 = in_TEXCOORD0_1;
    let _e150 = (_e143.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat1_.x = _e150.x;
    u_xlat1_.y = _e150.y;
    let _e155 = u_xlat1_;
    let _e157 = u_xlat1_;
    let _e162 = _v_buffer3_.v_cb3_[3];
    let _e168 = ((_e157.xy * _e162.yy) + vec2<f32>(0.5f, 0.5f));
    u_xlat1_.x = _e168.x;
    u_xlat1_.y = _e168.y;
    let _e173 = vs_TEXCOORD0_;
    let _e175 = u_xlat1_;
    let _e180 = _v_buffer3_.v_cb3_[0];
    let _e186 = _v_buffer3_.v_cb3_[0];
    let _e188 = ((_e175.xy * _e180.xy) + _e186.zw);
    vs_TEXCOORD0_.x = _e188.x;
    vs_TEXCOORD0_.y = _e188.y;
    let _e193 = vs_TEXCOORD5_;
    let _e195 = u_xlat1_;
    let _e200 = _v_buffer3_.v_cb3_[2];
    let _e206 = _v_buffer3_.v_cb3_[2];
    let _e208 = ((_e195.xy * _e200.xy) + _e206.zw);
    vs_TEXCOORD5_.x = _e208.x;
    vs_TEXCOORD5_.y = _e208.y;
    let _e214 = in_NORMAL0_1;
    let _e219 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e214.xyz, _e219.xyz);
    let _e223 = in_NORMAL0_1;
    let _e228 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e223.xyz, _e228.xyz);
    let _e232 = in_NORMAL0_1;
    let _e237 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e232.xyz, _e237.xyz);
    let _e240 = u_xlat1_;
    let _e242 = u_xlat1_;
    u_xlat18_ = dot(_e240.xyz, _e242.xyz);
    let _e245 = u_xlat18_;
    u_xlat18_ = max(_e245, 0.000000000000000000000000000000000000011754944f);
    let _e248 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e248);
    let _e250 = u_xlat1_;
    let _e252 = u_xlat18_;
    let _e254 = u_xlat1_;
    let _e256 = (vec3(_e252) * _e254.xyz);
    u_xlat1_.x = _e256.x;
    u_xlat1_.y = _e256.y;
    u_xlat1_.z = _e256.z;
    let _e267 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e267.w);
    let _e274 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e274.w);
    let _e281 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e281.w);
    let _e284 = u_xlat2_;
    let _e286 = u_xlat2_;
    let _e288 = log2(_e286.xyz);
    u_xlat2_.x = _e288.x;
    u_xlat2_.y = _e288.y;
    u_xlat2_.z = _e288.z;
    let _e295 = u_xlat2_;
    let _e297 = u_xlat2_;
    let _e303 = (_e297.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e303.x;
    u_xlat2_.y = _e303.y;
    u_xlat2_.z = _e303.z;
    let _e310 = u_xlat2_;
    let _e312 = u_xlat2_;
    let _e314 = exp2(_e312.xyz);
    u_xlat2_.x = _e314.x;
    u_xlat2_.y = _e314.y;
    u_xlat2_.z = _e314.z;
    let _e321 = u_xlat2_;
    let _e323 = u_xlat2_;
    let _e337 = ((_e323.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e337.x;
    u_xlat2_.y = _e337.y;
    u_xlat2_.z = _e337.z;
    let _e344 = u_xlat2_;
    let _e346 = u_xlat2_;
    let _e352 = clamp(_e346.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e352.x;
    u_xlat2_.y = _e352.y;
    u_xlat2_.z = _e352.z;
    let _e362 = _v_buffer0_.v_cb0_[10];
    let _e367 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e362.x, _e367.y);
    let _e370 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e370));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e384 = u_xlatu_loop_1_;
        let _e385 = u_xlatu18_;
        if !((_e384 < _e385)) {
            break;
        }
        {
            let _e391 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e391 >> 2u);
            let _e394 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e394 & 3u));
            let _e398 = u_xlatu20_;
            let _e404 = _v_buffer2_.v_cb2_[(i32(_e398) + 12i)];
            let _e405 = u_xlati21_;
            let _e409 = local[_e405];
            u_xlat20_ = dot(_e404, bitcast<vec4<f32>>(_e409));
            let _e412 = u_xlat20_;
            u_xlati20_ = i32(_e412);
            let _e414 = u_xlat4_;
            let _e416 = u_xlat0_;
            let _e419 = u_xlati20_;
            let _e422 = _v_buffer1_.v_cb1_[_e419];
            let _e425 = u_xlati20_;
            let _e428 = _v_buffer1_.v_cb1_[_e425];
            let _e430 = ((-(_e416.xyz) * _e422.www) + _e428.xyz);
            u_xlat4_.x = _e430.x;
            u_xlat4_.y = _e430.y;
            u_xlat4_.z = _e430.z;
            let _e437 = u_xlat4_;
            let _e439 = u_xlat4_;
            u_xlat21_ = dot(_e437.xyz, _e439.xyz);
            let _e442 = u_xlat21_;
            u_xlat21_ = max(_e442, 0.000061035156f);
            let _e445 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e445);
            let _e447 = u_xlat4_;
            let _e449 = u_xlat22_;
            let _e451 = u_xlat4_;
            let _e453 = (vec3(_e449) * _e451.xyz);
            u_xlat4_.x = _e453.x;
            u_xlat4_.y = _e453.y;
            u_xlat4_.z = _e453.z;
            let _e462 = u_xlati20_;
            let _e467 = _v_buffer1_.v_cb1_[(_e462 + 512i)];
            u_xlat22_ = (1f / _e467.x);
            let _e470 = u_xlat21_;
            u_xlat21_ = (_e470 * 25f);
            let _e473 = u_xlat21_;
            let _e474 = u_xlat22_;
            u_xlat21_ = (_e473 / _e474);
            let _e476 = u_xlat21_;
            u_xlat21_ = (_e476 + 1f);
            let _e481 = u_xlat21_;
            u_xlat21_ = (1f / _e481);
            let _e483 = u_xlati20_;
            let _e488 = _v_buffer1_.v_cb1_[(_e483 + 768i)];
            let _e490 = u_xlat4_;
            u_xlat22_ = dot(_e488.xyz, _e490.xyz);
            let _e493 = u_xlat22_;
            let _e494 = u_xlati20_;
            let _e499 = _v_buffer1_.v_cb1_[(_e494 + 512i)];
            let _e502 = u_xlati20_;
            let _e507 = _v_buffer1_.v_cb1_[(_e502 + 512i)];
            u_xlat22_ = ((_e493 * _e499.z) + _e507.w);
            let _e510 = u_xlat22_;
            u_xlat22_ = clamp(_e510, 0f, 1f);
            let _e514 = u_xlat22_;
            let _e515 = u_xlat22_;
            u_xlat22_ = (_e514 * _e515);
            let _e517 = u_xlat21_;
            let _e518 = u_xlat22_;
            u_xlat21_ = (_e517 * _e518);
            let _e520 = u_xlat5_;
            let _e522 = u_xlat21_;
            let _e524 = u_xlati20_;
            let _e529 = _v_buffer1_.v_cb1_[(_e524 + 256i)];
            let _e531 = (vec3(_e522) * _e529.xyz);
            u_xlat5_.x = _e531.x;
            u_xlat5_.y = _e531.y;
            u_xlat5_.z = _e531.z;
            let _e538 = u_xlat1_;
            let _e540 = u_xlat4_;
            u_xlat20_ = dot(_e538.xyz, _e540.xyz);
            let _e543 = u_xlat20_;
            u_xlat20_ = clamp(_e543, 0f, 1f);
            let _e547 = u_xlat3_;
            let _e549 = u_xlat5_;
            let _e551 = u_xlat20_;
            let _e554 = u_xlat3_;
            let _e556 = ((_e549.xyz * vec3(_e551)) + _e554.xyz);
            u_xlat3_.x = _e556.x;
            u_xlat3_.y = _e556.y;
            u_xlat3_.z = _e556.z;
        }
        continuing {
            let _e388 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e388 + 1u);
        }
    }
    let _e563 = vs_TEXCOORD2_;
    let _e565 = u_xlat2_;
    let _e567 = u_xlat3_;
    let _e569 = (_e565.xyz + _e567.xyz);
    vs_TEXCOORD2_.x = _e569.x;
    vs_TEXCOORD2_.y = _e569.y;
    vs_TEXCOORD2_.z = _e569.z;
    let _e576 = vs_TEXCOORD1_;
    let _e578 = u_xlat0_;
    let _e579 = _e578.xyz;
    vs_TEXCOORD1_.x = _e579.x;
    vs_TEXCOORD1_.y = _e579.y;
    vs_TEXCOORD1_.z = _e579.z;
    let _e586 = vs_NORMAL0_;
    let _e588 = u_xlat1_;
    let _e589 = _e588.xyz;
    vs_NORMAL0_.x = _e589.x;
    vs_NORMAL0_.y = _e589.y;
    vs_NORMAL0_.z = _e589.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e37 = vs_TEXCOORD0_;
    let _e39 = vs_TEXCOORD5_;
    let _e41 = vs_TEXCOORD1_;
    let _e43 = vs_TEXCOORD2_;
    let _e45 = vs_NORMAL0_;
    let _e47 = gl_Position;
    return VertexOutput(_e37, _e39, _e41, _e43, _e45, _e47);
}
