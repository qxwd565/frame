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

    let _e20 = vs_TEXCOORD0_;
    let _e22 = in_TEXCOORD0_1;
    let _e24 = _v_buffer2_;
    let _e28 = _v_buffer2_;
    let _e31 = ((_e22.xy * _e24.v_cb2_.xy) + _e28.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e31.x;
    vs_TEXCOORD0_.y = _e31.y;
    let _e36 = in_POSITION0_1;
    let _e41 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e36.yyyy * _e41);
    let _e46 = _v_buffer1_.v_cb1_[0];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.xxxx) + _e50);
    let _e55 = _v_buffer1_.v_cb1_[2];
    let _e56 = in_POSITION0_1;
    let _e59 = u_xlat0_;
    u_xlat0_ = ((_e55 * _e56.zzzz) + _e59);
    let _e61 = u_xlat0_;
    let _e65 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e61 + _e65);
    let _e67 = u_xlat0_;
    let _e72 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e67.yyyy * _e72);
    let _e77 = _v_buffer0_.v_cb0_[79];
    let _e78 = u_xlat0_;
    let _e81 = u_xlat1_;
    u_xlat1_ = ((_e77 * _e78.xxxx) + _e81);
    let _e86 = _v_buffer0_.v_cb0_[81];
    let _e87 = u_xlat0_;
    let _e90 = u_xlat1_;
    u_xlat1_ = ((_e86 * _e87.zzzz) + _e90);
    let _e96 = _v_buffer0_.v_cb0_[82];
    let _e97 = u_xlat0_;
    let _e100 = u_xlat1_;
    gl_Position = ((_e96 * _e97.wwww) + _e100);
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
