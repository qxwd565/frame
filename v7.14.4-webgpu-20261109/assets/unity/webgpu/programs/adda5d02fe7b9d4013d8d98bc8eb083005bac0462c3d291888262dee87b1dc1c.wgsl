struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 1024>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 30>,
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

    let _e71 = in_POSITION0_1;
    let _e76 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e71.yyyy * _e76);
    let _e81 = _v_buffer2_.v_cb2_[0];
    let _e82 = in_POSITION0_1;
    let _e85 = u_xlat0_;
    u_xlat0_ = ((_e81 * _e82.xxxx) + _e85);
    let _e90 = _v_buffer2_.v_cb2_[2];
    let _e91 = in_POSITION0_1;
    let _e94 = u_xlat0_;
    u_xlat0_ = ((_e90 * _e91.zzzz) + _e94);
    let _e96 = u_xlat0_;
    let _e100 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e96 + _e100);
    let _e102 = u_xlat0_;
    let _e107 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e102.yyyy * _e107);
    let _e112 = _v_buffer0_.v_cb0_[79];
    let _e113 = u_xlat0_;
    let _e116 = u_xlat1_;
    u_xlat1_ = ((_e112 * _e113.xxxx) + _e116);
    let _e121 = _v_buffer0_.v_cb0_[81];
    let _e122 = u_xlat0_;
    let _e125 = u_xlat1_;
    u_xlat1_ = ((_e121 * _e122.zzzz) + _e125);
    let _e131 = _v_buffer0_.v_cb0_[82];
    let _e132 = u_xlat0_;
    let _e135 = u_xlat1_;
    gl_Position = ((_e131 * _e132.wwww) + _e135);
    let _e138 = in_NORMAL0_1;
    let _e143 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e138.xyz, _e143.xyz);
    let _e147 = in_NORMAL0_1;
    let _e152 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e147.xyz, _e152.xyz);
    let _e156 = in_NORMAL0_1;
    let _e161 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e156.xyz, _e161.xyz);
    let _e164 = u_xlat1_;
    let _e166 = u_xlat1_;
    u_xlat18_ = dot(_e164.xyz, _e166.xyz);
    let _e169 = u_xlat18_;
    u_xlat18_ = max(_e169, 0.000000000000000000000000000000000000011754944f);
    let _e172 = u_xlat18_;
    u_xlat18_ = inverseSqrt(_e172);
    let _e174 = u_xlat1_;
    let _e176 = u_xlat18_;
    let _e178 = u_xlat1_;
    let _e180 = (vec3(_e176) * _e178.xyz);
    u_xlat1_.x = _e180.x;
    u_xlat1_.y = _e180.y;
    u_xlat1_.z = _e180.z;
    let _e191 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e191.w);
    let _e198 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e198.w);
    let _e205 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e205.w);
    let _e208 = u_xlat2_;
    let _e210 = u_xlat2_;
    let _e212 = log2(_e210.xyz);
    u_xlat2_.x = _e212.x;
    u_xlat2_.y = _e212.y;
    u_xlat2_.z = _e212.z;
    let _e219 = u_xlat2_;
    let _e221 = u_xlat2_;
    let _e227 = (_e221.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e227.x;
    u_xlat2_.y = _e227.y;
    u_xlat2_.z = _e227.z;
    let _e234 = u_xlat2_;
    let _e236 = u_xlat2_;
    let _e238 = exp2(_e236.xyz);
    u_xlat2_.x = _e238.x;
    u_xlat2_.y = _e238.y;
    u_xlat2_.z = _e238.z;
    let _e245 = u_xlat2_;
    let _e247 = u_xlat2_;
    let _e261 = ((_e247.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e261.x;
    u_xlat2_.y = _e261.y;
    u_xlat2_.z = _e261.z;
    let _e268 = u_xlat2_;
    let _e270 = u_xlat2_;
    let _e276 = clamp(_e270.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e276.x;
    u_xlat2_.y = _e276.y;
    u_xlat2_.z = _e276.z;
    let _e286 = _v_buffer0_.v_cb0_[10];
    let _e291 = _v_buffer2_.v_cb2_[11];
    u_xlat18_ = min(_e286.x, _e291.y);
    let _e294 = u_xlat18_;
    u_xlatu18_ = u32(i32(_e294));
    u_xlat3_.x = 0f;
    u_xlat3_.y = 0f;
    u_xlat3_.z = 0f;
    loop {
        let _e308 = u_xlatu_loop_1_;
        let _e309 = u_xlatu18_;
        if !((_e308 < _e309)) {
            break;
        }
        {
            let _e315 = u_xlatu_loop_1_;
            u_xlatu20_ = (_e315 >> 2u);
            let _e318 = u_xlatu_loop_1_;
            u_xlati21_ = i32((_e318 & 3u));
            let _e322 = u_xlatu20_;
            let _e328 = _v_buffer2_.v_cb2_[(i32(_e322) + 12i)];
            let _e329 = u_xlati21_;
            let _e333 = local[_e329];
            u_xlat20_ = dot(_e328, bitcast<vec4<f32>>(_e333));
            let _e336 = u_xlat20_;
            u_xlati20_ = i32(_e336);
            let _e338 = u_xlat4_;
            let _e340 = u_xlat0_;
            let _e343 = u_xlati20_;
            let _e346 = _v_buffer1_.v_cb1_[_e343];
            let _e349 = u_xlati20_;
            let _e352 = _v_buffer1_.v_cb1_[_e349];
            let _e354 = ((-(_e340.xyz) * _e346.www) + _e352.xyz);
            u_xlat4_.x = _e354.x;
            u_xlat4_.y = _e354.y;
            u_xlat4_.z = _e354.z;
            let _e361 = u_xlat4_;
            let _e363 = u_xlat4_;
            u_xlat21_ = dot(_e361.xyz, _e363.xyz);
            let _e366 = u_xlat21_;
            u_xlat21_ = max(_e366, 0.000061035156f);
            let _e369 = u_xlat21_;
            u_xlat22_ = inverseSqrt(_e369);
            let _e371 = u_xlat4_;
            let _e373 = u_xlat22_;
            let _e375 = u_xlat4_;
            let _e377 = (vec3(_e373) * _e375.xyz);
            u_xlat4_.x = _e377.x;
            u_xlat4_.y = _e377.y;
            u_xlat4_.z = _e377.z;
            let _e386 = u_xlati20_;
            let _e391 = _v_buffer1_.v_cb1_[(_e386 + 512i)];
            u_xlat22_ = (1f / _e391.x);
            let _e394 = u_xlat21_;
            u_xlat21_ = (_e394 * 25f);
            let _e397 = u_xlat21_;
            let _e398 = u_xlat22_;
            u_xlat21_ = (_e397 / _e398);
            let _e400 = u_xlat21_;
            u_xlat21_ = (_e400 + 1f);
            let _e405 = u_xlat21_;
            u_xlat21_ = (1f / _e405);
            let _e407 = u_xlati20_;
            let _e412 = _v_buffer1_.v_cb1_[(_e407 + 768i)];
            let _e414 = u_xlat4_;
            u_xlat22_ = dot(_e412.xyz, _e414.xyz);
            let _e417 = u_xlat22_;
            let _e418 = u_xlati20_;
            let _e423 = _v_buffer1_.v_cb1_[(_e418 + 512i)];
            let _e426 = u_xlati20_;
            let _e431 = _v_buffer1_.v_cb1_[(_e426 + 512i)];
            u_xlat22_ = ((_e417 * _e423.z) + _e431.w);
            let _e434 = u_xlat22_;
            u_xlat22_ = clamp(_e434, 0f, 1f);
            let _e438 = u_xlat22_;
            let _e439 = u_xlat22_;
            u_xlat22_ = (_e438 * _e439);
            let _e441 = u_xlat21_;
            let _e442 = u_xlat22_;
            u_xlat21_ = (_e441 * _e442);
            let _e444 = u_xlat5_;
            let _e446 = u_xlat21_;
            let _e448 = u_xlati20_;
            let _e453 = _v_buffer1_.v_cb1_[(_e448 + 256i)];
            let _e455 = (vec3(_e446) * _e453.xyz);
            u_xlat5_.x = _e455.x;
            u_xlat5_.y = _e455.y;
            u_xlat5_.z = _e455.z;
            let _e462 = u_xlat1_;
            let _e464 = u_xlat4_;
            u_xlat20_ = dot(_e462.xyz, _e464.xyz);
            let _e467 = u_xlat20_;
            u_xlat20_ = clamp(_e467, 0f, 1f);
            let _e471 = u_xlat3_;
            let _e473 = u_xlat5_;
            let _e475 = u_xlat20_;
            let _e478 = u_xlat3_;
            let _e480 = ((_e473.xyz * vec3(_e475)) + _e478.xyz);
            u_xlat3_.x = _e480.x;
            u_xlat3_.y = _e480.y;
            u_xlat3_.z = _e480.z;
        }
        continuing {
            let _e312 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e312 + 1u);
        }
    }
    let _e487 = vs_TEXCOORD2_;
    let _e489 = u_xlat2_;
    let _e491 = u_xlat3_;
    let _e493 = (_e489.xyz + _e491.xyz);
    vs_TEXCOORD2_.x = _e493.x;
    vs_TEXCOORD2_.y = _e493.y;
    vs_TEXCOORD2_.z = _e493.z;
    let _e500 = vs_TEXCOORD1_;
    let _e502 = u_xlat0_;
    let _e503 = _e502.xyz;
    vs_TEXCOORD1_.x = _e503.x;
    vs_TEXCOORD1_.y = _e503.y;
    vs_TEXCOORD1_.z = _e503.z;
    let _e510 = vs_NORMAL0_;
    let _e512 = u_xlat1_;
    let _e513 = _e512.xyz;
    vs_NORMAL0_.x = _e513.x;
    vs_NORMAL0_.y = _e513.y;
    vs_NORMAL0_.z = _e513.z;
    let _e520 = vs_TEXCOORD0_;
    let _e522 = in_TEXCOORD0_1;
    let _e523 = _e522.xy;
    vs_TEXCOORD0_.x = _e523.x;
    vs_TEXCOORD0_.y = _e523.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_TEXCOORD1_;
    let _e36 = vs_TEXCOORD2_;
    let _e38 = vs_NORMAL0_;
    let _e40 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38, _e40);
}
