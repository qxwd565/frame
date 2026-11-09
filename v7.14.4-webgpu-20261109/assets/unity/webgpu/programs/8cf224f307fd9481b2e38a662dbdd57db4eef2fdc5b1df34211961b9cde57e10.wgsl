struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 6>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e33 = in_POSITION0_1;
    let _e38 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e33.yyyy * _e38);
    let _e43 = _v_buffer1_.v_cb1_[0];
    let _e44 = in_POSITION0_1;
    let _e47 = u_xlat0_;
    u_xlat0_ = ((_e43 * _e44.xxxx) + _e47);
    let _e52 = _v_buffer1_.v_cb1_[2];
    let _e53 = in_POSITION0_1;
    let _e56 = u_xlat0_;
    u_xlat0_ = ((_e52 * _e53.zzzz) + _e56);
    let _e58 = u_xlat0_;
    let _e62 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e58 + _e62);
    let _e64 = u_xlat0_;
    let _e69 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e64.yyyy * _e69);
    let _e74 = _v_buffer0_.v_cb0_[79];
    let _e75 = u_xlat0_;
    let _e78 = u_xlat1_;
    u_xlat1_ = ((_e74 * _e75.xxxx) + _e78);
    let _e83 = _v_buffer0_.v_cb0_[81];
    let _e84 = u_xlat0_;
    let _e87 = u_xlat1_;
    u_xlat1_ = ((_e83 * _e84.zzzz) + _e87);
    let _e93 = _v_buffer0_.v_cb0_[82];
    let _e94 = u_xlat0_;
    let _e97 = u_xlat1_;
    gl_Position = ((_e93 * _e94.wwww) + _e97);
    let _e103 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e103.w + 0.5f);
    let _e111 = _v_buffer2_.v_cb2_[3];
    u_xlat0_.y = (_e111.x + 0.5f);
    let _e115 = u_xlat8_;
    let _e117 = in_TEXCOORD0_1;
    let _e122 = _v_buffer2_.v_cb2_[0];
    let _e128 = _v_buffer2_.v_cb2_[0];
    let _e130 = ((_e117.xy * _e122.xy) + _e128.zw);
    u_xlat8_.x = _e130.x;
    u_xlat8_.y = _e130.y;
    let _e135 = u_xlat0_;
    let _e137 = u_xlat0_;
    let _e140 = u_xlat8_;
    let _e142 = (-(_e137.xy) + _e140.xy);
    u_xlat0_.x = _e142.x;
    u_xlat0_.y = _e142.y;
    let _e147 = u_xlat8_;
    let _e149 = u_xlat8_;
    let _e154 = _v_buffer2_.v_cb2_[4];
    let _e156 = (_e149.xy + _e154.zw);
    u_xlat8_.x = _e156.x;
    u_xlat8_.y = _e156.y;
    let _e161 = vs_TEXCOORD0_;
    let _e163 = u_xlat8_;
    let _e168 = _v_buffer2_.v_cb2_[4];
    let _e170 = (_e163.xy * _e168.xy);
    vs_TEXCOORD0_.x = _e170.x;
    vs_TEXCOORD0_.y = _e170.y;
    let _e175 = u_xlat0_;
    let _e177 = u_xlat0_;
    let _e182 = _v_buffer2_.v_cb2_[3];
    let _e184 = (_e177.xy * _e182.yz);
    u_xlat0_.x = _e184.x;
    u_xlat0_.y = _e184.y;
    let _e193 = _v_buffer2_.v_cb2_[2];
    let _e198 = _v_buffer0_.v_cb0_[15];
    let _e204 = _v_buffer2_.v_cb2_[2];
    u_xlat8_.x = ((_e193.y * _e198.x) + _e204.z);
    let _e208 = u_xlat8_;
    u_xlat1_.x = sin(_e208.x);
    let _e211 = u_xlat8_;
    u_xlat2_ = cos(_e211.x);
    let _e215 = u_xlat1_;
    u_xlat3_.z = _e215.x;
    let _e218 = u_xlat2_;
    u_xlat3_.y = _e218;
    let _e220 = u_xlat1_;
    u_xlat3_.x = -(_e220.x);
    let _e224 = u_xlat0_;
    let _e226 = u_xlat3_;
    u_xlat8_.y = dot(_e224.xy, _e226.xy);
    let _e230 = u_xlat0_;
    let _e232 = u_xlat3_;
    u_xlat8_.x = dot(_e230.xy, _e232.yz);
    let _e235 = vs_TEXCOORD0_;
    let _e237 = u_xlat8_;
    let _e242 = (_e237.xy + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD0_.z = _e242.x;
    vs_TEXCOORD0_.w = _e242.y;
    let _e251 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e251.w);
    let _e258 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e258.w);
    let _e265 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e265.w);
    let _e268 = u_xlat0_;
    let _e270 = u_xlat0_;
    let _e272 = log2(_e270.xyz);
    u_xlat0_.x = _e272.x;
    u_xlat0_.y = _e272.y;
    u_xlat0_.z = _e272.z;
    let _e279 = u_xlat0_;
    let _e281 = u_xlat0_;
    let _e287 = (_e281.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e287.x;
    u_xlat0_.y = _e287.y;
    u_xlat0_.z = _e287.z;
    let _e294 = u_xlat0_;
    let _e296 = u_xlat0_;
    let _e298 = exp2(_e296.xyz);
    u_xlat0_.x = _e298.x;
    u_xlat0_.y = _e298.y;
    u_xlat0_.z = _e298.z;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat0_;
    let _e321 = ((_e307.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e321.x;
    u_xlat0_.y = _e321.y;
    u_xlat0_.z = _e321.z;
    let _e328 = u_xlat0_;
    let _e330 = u_xlat0_;
    let _e336 = clamp(_e330.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e336.x;
    u_xlat0_.y = _e336.y;
    u_xlat0_.z = _e336.z;
    let _e343 = u_xlat0_;
    let _e345 = u_xlat0_;
    let _e350 = _v_buffer0_.v_cb0_[6];
    let _e352 = (_e345.xyz + _e350.xyz);
    u_xlat0_.x = _e352.x;
    u_xlat0_.y = _e352.y;
    u_xlat0_.z = _e352.z;
    let _e359 = u_xlat0_;
    let _e361 = u_xlat0_;
    let _e370 = (_e361.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e370.x;
    u_xlat0_.y = _e370.y;
    u_xlat0_.z = _e370.z;
    u_xlat0_.w = 0f;
    let _e382 = _v_buffer2_.v_cb2_[5];
    let _e384 = u_xlat0_;
    u_xlat0_ = ((_e382.xxxx * _e384) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e392 = u_xlat0_;
    let _e393 = in_COLOR0_1;
    u_xlat0_ = (_e392 * _e393);
    let _e395 = u_xlat0_;
    let _e399 = _v_buffer2_.v_cb2_[2];
    u_xlat0_ = (_e395 * _e399.xxxx);
    let _e402 = u_xlat0_;
    let _e406 = _v_buffer2_.v_cb2_[3];
    vs_COLOR0_ = (_e402 * _e406.wwww);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e26 = vs_TEXCOORD0_;
    let _e28 = vs_COLOR0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
