struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e24 = in_POSITION0_1;
    let _e29 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e24.yyyy * _e29);
    let _e34 = _v_buffer1_.v_cb1_[0];
    let _e35 = in_POSITION0_1;
    let _e38 = u_xlat0_;
    u_xlat0_ = ((_e34 * _e35.xxxx) + _e38);
    let _e43 = _v_buffer1_.v_cb1_[2];
    let _e44 = in_POSITION0_1;
    let _e47 = u_xlat0_;
    u_xlat0_ = ((_e43 * _e44.zzzz) + _e47);
    let _e49 = u_xlat0_;
    let _e53 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e49 + _e53);
    let _e55 = u_xlat0_;
    let _e60 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e55.yyyy * _e60);
    let _e65 = _v_buffer0_.v_cb0_[79];
    let _e66 = u_xlat0_;
    let _e69 = u_xlat1_;
    u_xlat1_ = ((_e65 * _e66.xxxx) + _e69);
    let _e74 = _v_buffer0_.v_cb0_[81];
    let _e75 = u_xlat0_;
    let _e78 = u_xlat1_;
    u_xlat1_ = ((_e74 * _e75.zzzz) + _e78);
    let _e84 = _v_buffer0_.v_cb0_[82];
    let _e85 = u_xlat0_;
    let _e88 = u_xlat1_;
    gl_Position = ((_e84 * _e85.wwww) + _e88);
    let _e90 = vs_TEXCOORD0_;
    let _e92 = in_TEXCOORD0_1;
    let _e97 = _v_buffer2_.v_cb2_[2];
    let _e103 = _v_buffer2_.v_cb2_[2];
    let _e105 = ((_e92.xy * _e97.xy) + _e103.zw);
    vs_TEXCOORD0_.x = _e105.x;
    vs_TEXCOORD0_.y = _e105.y;
    let _e110 = vs_TEXCOORD1_;
    let _e112 = in_TEXCOORD1_1;
    let _e117 = _v_buffer2_.v_cb2_[3];
    let _e123 = _v_buffer2_.v_cb2_[3];
    let _e125 = ((_e112.xy * _e117.xy) + _e123.zw);
    vs_TEXCOORD1_.x = _e125.x;
    vs_TEXCOORD1_.y = _e125.y;
    let _e134 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e134.w);
    let _e141 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e141.w);
    let _e148 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e148.w);
    let _e151 = u_xlat0_;
    let _e153 = u_xlat0_;
    let _e155 = log2(_e153.xyz);
    u_xlat0_.x = _e155.x;
    u_xlat0_.y = _e155.y;
    u_xlat0_.z = _e155.z;
    let _e162 = u_xlat0_;
    let _e164 = u_xlat0_;
    let _e170 = (_e164.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e170.x;
    u_xlat0_.y = _e170.y;
    u_xlat0_.z = _e170.z;
    let _e177 = u_xlat0_;
    let _e179 = u_xlat0_;
    let _e181 = exp2(_e179.xyz);
    u_xlat0_.x = _e181.x;
    u_xlat0_.y = _e181.y;
    u_xlat0_.z = _e181.z;
    let _e188 = u_xlat0_;
    let _e190 = u_xlat0_;
    let _e204 = ((_e190.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e204.x;
    u_xlat0_.y = _e204.y;
    u_xlat0_.z = _e204.z;
    let _e211 = u_xlat0_;
    let _e213 = u_xlat0_;
    let _e219 = clamp(_e213.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e219.x;
    u_xlat0_.y = _e219.y;
    u_xlat0_.z = _e219.z;
    let _e226 = u_xlat0_;
    let _e228 = u_xlat0_;
    let _e233 = _v_buffer0_.v_cb0_[6];
    let _e235 = (_e228.xyz + _e233.xyz);
    u_xlat0_.x = _e235.x;
    u_xlat0_.y = _e235.y;
    u_xlat0_.z = _e235.z;
    u_xlat0_.w = 1f;
    let _e244 = u_xlat0_;
    let _e245 = in_COLOR0_1;
    u_xlat0_ = (_e244 + -(_e245));
    let _e251 = _v_buffer2_.v_cb2_[0];
    let _e253 = u_xlat0_;
    let _e255 = in_COLOR0_1;
    u_xlat0_ = ((_e251.xxxx * _e253) + _e255);
    let _e257 = u_xlat0_;
    let _e261 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e257 * _e261);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_TEXCOORD1_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
