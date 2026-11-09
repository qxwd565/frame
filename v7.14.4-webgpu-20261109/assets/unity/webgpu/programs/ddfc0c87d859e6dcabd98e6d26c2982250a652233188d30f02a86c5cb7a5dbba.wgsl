struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: vec4<f32>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e20 = in_POSITION0_1;
    let _e25 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e20.yyyy * _e25);
    let _e30 = _v_buffer1_.v_cb1_[0];
    let _e31 = in_POSITION0_1;
    let _e34 = u_xlat0_;
    u_xlat0_ = ((_e30 * _e31.xxxx) + _e34);
    let _e39 = _v_buffer1_.v_cb1_[2];
    let _e40 = in_POSITION0_1;
    let _e43 = u_xlat0_;
    u_xlat0_ = ((_e39 * _e40.zzzz) + _e43);
    let _e45 = u_xlat0_;
    let _e49 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e45 + _e49);
    let _e51 = u_xlat0_;
    let _e56 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e51.yyyy * _e56);
    let _e61 = _v_buffer0_.v_cb0_[79];
    let _e62 = u_xlat0_;
    let _e65 = u_xlat1_;
    u_xlat1_ = ((_e61 * _e62.xxxx) + _e65);
    let _e70 = _v_buffer0_.v_cb0_[81];
    let _e71 = u_xlat0_;
    let _e74 = u_xlat1_;
    u_xlat1_ = ((_e70 * _e71.zzzz) + _e74);
    let _e80 = _v_buffer0_.v_cb0_[82];
    let _e81 = u_xlat0_;
    let _e84 = u_xlat1_;
    gl_Position = ((_e80 * _e81.wwww) + _e84);
    let _e86 = vs_TEXCOORD0_;
    let _e88 = in_TEXCOORD0_1;
    let _e90 = _v_buffer2_;
    let _e94 = _v_buffer2_;
    let _e97 = ((_e88.xy * _e90.v_cb2_.xy) + _e94.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e97.x;
    vs_TEXCOORD0_.y = _e97.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e20 = vs_TEXCOORD0_;
    let _e22 = gl_Position;
    return VertexOutput(_e20, _e22);
}
