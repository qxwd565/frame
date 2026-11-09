struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 6>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec2<f32>,
    @location(3) vs_TEXCOORD3_: f32,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec2<f32>;
var<private> vs_TEXCOORD3_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e23 = vs_TEXCOORD0_;
    let _e25 = in_TEXCOORD0_1;
    let _e30 = _v_buffer2_.v_cb2_[0];
    let _e36 = _v_buffer2_.v_cb2_[0];
    let _e38 = ((_e25.xy * _e30.xy) + _e36.zw);
    vs_TEXCOORD0_.x = _e38.x;
    vs_TEXCOORD0_.y = _e38.y;
    let _e43 = vs_TEXCOORD1_;
    let _e45 = in_TEXCOORD0_1;
    let _e50 = _v_buffer2_.v_cb2_[2];
    let _e56 = _v_buffer2_.v_cb2_[2];
    let _e58 = ((_e45.xy * _e50.xy) + _e56.zw);
    vs_TEXCOORD1_.x = _e58.x;
    vs_TEXCOORD1_.y = _e58.y;
    let _e63 = vs_TEXCOORD2_;
    let _e65 = in_TEXCOORD0_1;
    let _e70 = _v_buffer2_.v_cb2_[5];
    let _e76 = _v_buffer2_.v_cb2_[5];
    let _e78 = ((_e65.xy * _e70.xy) + _e76.zw);
    vs_TEXCOORD2_.x = _e78.x;
    vs_TEXCOORD2_.y = _e78.y;
    vs_TEXCOORD3_ = 0f;
    let _e84 = in_POSITION0_1;
    let _e89 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e84.yyyy * _e89);
    let _e94 = _v_buffer1_.v_cb1_[0];
    let _e95 = in_POSITION0_1;
    let _e98 = u_xlat0_;
    u_xlat0_ = ((_e94 * _e95.xxxx) + _e98);
    let _e103 = _v_buffer1_.v_cb1_[2];
    let _e104 = in_POSITION0_1;
    let _e107 = u_xlat0_;
    u_xlat0_ = ((_e103 * _e104.zzzz) + _e107);
    let _e109 = u_xlat0_;
    let _e113 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e109 + _e113);
    let _e115 = u_xlat0_;
    let _e120 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e115.yyyy * _e120);
    let _e125 = _v_buffer0_.v_cb0_[79];
    let _e126 = u_xlat0_;
    let _e129 = u_xlat1_;
    u_xlat1_ = ((_e125 * _e126.xxxx) + _e129);
    let _e134 = _v_buffer0_.v_cb0_[81];
    let _e135 = u_xlat0_;
    let _e138 = u_xlat1_;
    u_xlat1_ = ((_e134 * _e135.zzzz) + _e138);
    let _e144 = _v_buffer0_.v_cb0_[82];
    let _e145 = u_xlat0_;
    let _e148 = u_xlat1_;
    gl_Position = ((_e144 * _e145.wwww) + _e148);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e26 = vs_TEXCOORD0_;
    let _e28 = vs_TEXCOORD1_;
    let _e30 = vs_TEXCOORD2_;
    let _e32 = vs_TEXCOORD3_;
    let _e34 = gl_Position;
    return VertexOutput(_e26, _e28, _e30, _e32, _e34);
}
