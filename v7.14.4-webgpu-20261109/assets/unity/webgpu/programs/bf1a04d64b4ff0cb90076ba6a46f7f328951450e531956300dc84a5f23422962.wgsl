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

struct v_buffer4_ {
    v_cb4_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORD3_: vec3<f32>,
    @location(4) vs_TEXCOORD4_: vec4<f32>,
    @location(5) vs_TEXCOORD5_: vec3<f32>,
    @location(6) vs_TEXCOORD6_: vec3<f32>,
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
@group(0) @binding(4) 
var<uniform> _v_buffer4_: v_buffer4_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORD3_: vec3<f32>;
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_TEXCOORD5_: vec3<f32>;
var<private> vs_TEXCOORD6_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlati3_: i32 = 0i;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlatu15_: u32 = 0u;
    var u_xlatu16_: u32 = 0u;
    var u_xlat17_: f32 = 0f;
    var u_xlati17_: i32 = 0i;
    var u_xlatu17_: u32 = 0u;
    var u_xlatb17_: bool = false;
    var u_xlat18_: f32 = 0f;
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
    let _e142 = in_NORMAL0_1;
    let _e147 = _v_buffer2_.v_cb2_[4];
    u_xlat1_.x = dot(_e142.xyz, _e147.xyz);
    let _e151 = in_NORMAL0_1;
    let _e156 = _v_buffer2_.v_cb2_[5];
    u_xlat1_.y = dot(_e151.xyz, _e156.xyz);
    let _e160 = in_NORMAL0_1;
    let _e165 = _v_buffer2_.v_cb2_[6];
    u_xlat1_.z = dot(_e160.xyz, _e165.xyz);
    let _e168 = u_xlat1_;
    let _e170 = u_xlat1_;
    u_xlat15_ = dot(_e168.xyz, _e170.xyz);
    let _e173 = u_xlat15_;
    u_xlat15_ = max(_e173, 0.000000000000000000000000000000000000011754944f);
    let _e176 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e176);
    let _e178 = u_xlat1_;
    let _e180 = u_xlat15_;
    let _e182 = u_xlat1_;
    let _e184 = (vec3(_e180) * _e182.xyz);
    u_xlat1_.x = _e184.x;
    u_xlat1_.y = _e184.y;
    u_xlat1_.z = _e184.z;
    let _e191 = vs_TEXCOORD2_;
    let _e193 = u_xlat0_;
    let _e199 = _v_buffer0_.v_cb0_[21];
    let _e201 = (-(_e193.xyz) + _e199.xyz);
    vs_TEXCOORD2_.x = _e201.x;
    vs_TEXCOORD2_.y = _e201.y;
    vs_TEXCOORD2_.z = _e201.z;
    let _e208 = vs_TEXCOORD3_;
    let _e210 = u_xlat0_;
    let _e216 = _v_buffer0_.v_cb0_[5];
    let _e218 = (-(_e210.xyz) + _e216.xyz);
    vs_TEXCOORD3_.x = _e218.x;
    vs_TEXCOORD3_.y = _e218.y;
    vs_TEXCOORD3_.z = _e218.z;
    let _e225 = u_xlat2_;
    let _e227 = u_xlat0_;
    let _e232 = _v_buffer3_.v_cb3_[1];
    let _e234 = (_e227.yyy * _e232.xyz);
    u_xlat2_.x = _e234.x;
    u_xlat2_.y = _e234.y;
    u_xlat2_.z = _e234.z;
    let _e241 = u_xlat2_;
    let _e246 = _v_buffer3_.v_cb3_[0];
    let _e248 = u_xlat0_;
    let _e251 = u_xlat2_;
    let _e253 = ((_e246.xyz * _e248.xxx) + _e251.xyz);
    u_xlat2_.x = _e253.x;
    u_xlat2_.y = _e253.y;
    u_xlat2_.z = _e253.z;
    let _e260 = u_xlat2_;
    let _e265 = _v_buffer3_.v_cb3_[2];
    let _e267 = u_xlat0_;
    let _e270 = u_xlat2_;
    let _e272 = ((_e265.xyz * _e267.zzz) + _e270.xyz);
    u_xlat2_.x = _e272.x;
    u_xlat2_.y = _e272.y;
    u_xlat2_.z = _e272.z;
    let _e279 = vs_TEXCOORD4_;
    let _e281 = u_xlat2_;
    let _e286 = _v_buffer3_.v_cb3_[3];
    let _e288 = (_e281.xyz + _e286.xyz);
    vs_TEXCOORD4_.x = _e288.x;
    vs_TEXCOORD4_.y = _e288.y;
    vs_TEXCOORD4_.z = _e288.z;
    let _e298 = _v_buffer0_.v_cb0_[10];
    let _e303 = _v_buffer2_.v_cb2_[11];
    u_xlat15_ = min(_e298.x, _e303.y);
    let _e306 = u_xlat15_;
    u_xlatu15_ = u32(i32(_e306));
    u_xlat2_.x = 0f;
    u_xlat2_.y = 0f;
    u_xlat2_.z = 0f;
    loop {
        let _e320 = u_xlatu_loop_1_;
        let _e321 = u_xlatu15_;
        if !((_e320 < _e321)) {
            break;
        }
        {
            let _e327 = u_xlatu_loop_1_;
            u_xlatu17_ = (_e327 >> 2u);
            let _e330 = u_xlatu_loop_1_;
            u_xlati3_ = i32((_e330 & 3u));
            let _e334 = u_xlatu17_;
            let _e340 = _v_buffer2_.v_cb2_[(i32(_e334) + 12i)];
            let _e341 = u_xlati3_;
            let _e345 = local[_e341];
            u_xlat17_ = dot(_e340, bitcast<vec4<f32>>(_e345));
            let _e348 = u_xlat17_;
            u_xlati17_ = i32(_e348);
            let _e350 = u_xlat3_;
            let _e352 = u_xlat0_;
            let _e355 = u_xlati17_;
            let _e358 = _v_buffer1_.v_cb1_[_e355];
            let _e361 = u_xlati17_;
            let _e364 = _v_buffer1_.v_cb1_[_e361];
            let _e366 = ((-(_e352.xyz) * _e358.www) + _e364.xyz);
            u_xlat3_.x = _e366.x;
            u_xlat3_.y = _e366.y;
            u_xlat3_.z = _e366.z;
            let _e373 = u_xlat3_;
            let _e375 = u_xlat3_;
            u_xlat18_ = dot(_e373.xyz, _e375.xyz);
            let _e378 = u_xlat18_;
            u_xlat18_ = max(_e378, 0.000061035156f);
            let _e382 = u_xlat18_;
            u_xlat4_.x = inverseSqrt(_e382);
            let _e384 = u_xlat3_;
            let _e386 = u_xlat3_;
            let _e388 = u_xlat4_;
            let _e390 = (_e386.xyz * _e388.xxx);
            u_xlat3_.x = _e390.x;
            u_xlat3_.y = _e390.y;
            u_xlat3_.z = _e390.z;
            let _e400 = u_xlati17_;
            let _e405 = _v_buffer1_.v_cb1_[(_e400 + 512i)];
            u_xlat4_.x = (1f / _e405.x);
            let _e408 = u_xlat18_;
            u_xlat18_ = (_e408 * 25f);
            let _e411 = u_xlat18_;
            let _e412 = u_xlat4_;
            u_xlat18_ = (_e411 / _e412.x);
            let _e415 = u_xlat18_;
            u_xlat18_ = (_e415 + 1f);
            let _e420 = u_xlat18_;
            u_xlat18_ = (1f / _e420);
            let _e423 = u_xlati17_;
            let _e428 = _v_buffer1_.v_cb1_[(_e423 + 768i)];
            let _e430 = u_xlat3_;
            u_xlat4_.x = dot(_e428.xyz, _e430.xyz);
            let _e434 = u_xlat4_;
            let _e436 = u_xlati17_;
            let _e441 = _v_buffer1_.v_cb1_[(_e436 + 512i)];
            let _e444 = u_xlati17_;
            let _e449 = _v_buffer1_.v_cb1_[(_e444 + 512i)];
            u_xlat4_.x = ((_e434.x * _e441.z) + _e449.w);
            let _e453 = u_xlat4_;
            u_xlat4_.x = clamp(_e453.x, 0f, 1f);
            let _e459 = u_xlat4_;
            let _e461 = u_xlat4_;
            u_xlat4_.x = (_e459.x * _e461.x);
            let _e464 = u_xlat18_;
            let _e465 = u_xlat4_;
            u_xlat18_ = (_e464 * _e465.x);
            let _e468 = u_xlat4_;
            let _e470 = u_xlat18_;
            let _e472 = u_xlati17_;
            let _e477 = _v_buffer1_.v_cb1_[(_e472 + 256i)];
            let _e479 = (vec3(_e470) * _e477.xyz);
            u_xlat4_.x = _e479.x;
            u_xlat4_.y = _e479.y;
            u_xlat4_.z = _e479.z;
            let _e486 = u_xlat1_;
            let _e488 = u_xlat3_;
            u_xlat17_ = dot(_e486.xyz, _e488.xyz);
            let _e491 = u_xlat17_;
            u_xlat17_ = clamp(_e491, 0f, 1f);
            let _e495 = u_xlat2_;
            let _e497 = u_xlat4_;
            let _e499 = u_xlat17_;
            let _e502 = u_xlat2_;
            let _e504 = ((_e497.xyz * vec3(_e499)) + _e502.xyz);
            u_xlat2_.x = _e504.x;
            u_xlat2_.y = _e504.y;
            u_xlat2_.z = _e504.z;
        }
        continuing {
            let _e324 = u_xlatu_loop_1_;
            u_xlatu_loop_1_ = (_e324 + 1u);
        }
    }
    let _e511 = vs_TEXCOORD6_;
    let _e513 = u_xlat2_;
    let _e514 = _e513.xyz;
    vs_TEXCOORD6_.x = _e514.x;
    vs_TEXCOORD6_.y = _e514.y;
    vs_TEXCOORD6_.z = _e514.z;
    let _e525 = _v_buffer2_.v_cb2_[27];
    u_xlat2_.x = abs(_e525.w);
    let _e532 = _v_buffer2_.v_cb2_[28];
    u_xlat2_.y = abs(_e532.w);
    let _e539 = _v_buffer2_.v_cb2_[29];
    u_xlat2_.z = abs(_e539.w);
    let _e542 = u_xlat2_;
    let _e544 = u_xlat2_;
    let _e546 = log2(_e544.xyz);
    u_xlat2_.x = _e546.x;
    u_xlat2_.y = _e546.y;
    u_xlat2_.z = _e546.z;
    let _e553 = u_xlat2_;
    let _e555 = u_xlat2_;
    let _e561 = (_e555.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat2_.x = _e561.x;
    u_xlat2_.y = _e561.y;
    u_xlat2_.z = _e561.z;
    let _e568 = u_xlat2_;
    let _e570 = u_xlat2_;
    let _e572 = exp2(_e570.xyz);
    u_xlat2_.x = _e572.x;
    u_xlat2_.y = _e572.y;
    u_xlat2_.z = _e572.z;
    let _e579 = u_xlat2_;
    let _e581 = u_xlat2_;
    let _e595 = ((_e581.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat2_.x = _e595.x;
    u_xlat2_.y = _e595.y;
    u_xlat2_.z = _e595.z;
    let _e602 = u_xlat2_;
    let _e604 = u_xlat2_;
    let _e610 = clamp(_e604.xyz, vec3(0f), vec3(1f));
    u_xlat2_.x = _e610.x;
    u_xlat2_.y = _e610.y;
    u_xlat2_.z = _e610.z;
    let _e617 = u_xlat2_;
    let _e619 = u_xlat2_;
    let _e624 = _v_buffer0_.v_cb0_[6];
    let _e626 = (_e619.xyz + _e624.xyz);
    u_xlat2_.x = _e626.x;
    u_xlat2_.y = _e626.y;
    u_xlat2_.z = _e626.z;
    let _e633 = u_xlat2_;
    let _e635 = u_xlat2_;
    let _e644 = (_e635.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat2_.x = _e644.x;
    u_xlat2_.y = _e644.y;
    u_xlat2_.z = _e644.z;
    u_xlat2_.w = 0f;
    let _e656 = _v_buffer4_.v_cb4_[4];
    let _e658 = u_xlat2_;
    u_xlat2_ = ((_e656.zzzz * _e658) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e666 = u_xlat2_;
    let _e670 = _v_buffer4_.v_cb4_[1];
    vs_COLOR0_ = (_e666 * _e670);
    let _e672 = vs_TEXCOORD0_;
    let _e674 = in_TEXCOORD0_1;
    let _e675 = _e674.xy;
    vs_TEXCOORD0_.x = _e675.x;
    vs_TEXCOORD0_.y = _e675.y;
    let _e680 = vs_TEXCOORD0_;
    let _e682 = in_TEXCOORD1_1;
    let _e683 = _e682.xy;
    vs_TEXCOORD0_.z = _e683.x;
    vs_TEXCOORD0_.w = _e683.y;
    vs_TEXCOORD4_.w = 0f;
    let _e690 = vs_TEXCOORD5_;
    let _e692 = u_xlat0_;
    let _e693 = _e692.xyz;
    vs_TEXCOORD5_.x = _e693.x;
    vs_TEXCOORD5_.y = _e693.y;
    vs_TEXCOORD5_.z = _e693.z;
    let _e700 = vs_NORMAL0_;
    let _e702 = u_xlat1_;
    let _e703 = _e702.xyz;
    vs_NORMAL0_.x = _e703.x;
    vs_NORMAL0_.y = _e703.y;
    vs_NORMAL0_.z = _e703.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e50 = vs_TEXCOORD0_;
    let _e52 = vs_TEXCOORD2_;
    let _e54 = vs_TEXCOORD3_;
    let _e56 = vs_TEXCOORD4_;
    let _e58 = vs_TEXCOORD5_;
    let _e60 = vs_TEXCOORD6_;
    let _e62 = vs_NORMAL0_;
    let _e64 = vs_COLOR0_;
    let _e66 = gl_Position;
    return VertexOutput(_e50, _e52, _e54, _e56, _e58, _e60, _e62, _e64, _e66);
}
