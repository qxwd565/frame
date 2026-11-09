struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e15 = in_POSITION0_1;
    let _e20 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e15.yyyy * _e20);
    let _e25 = _v_buffer1_.v_cb1_[0];
    let _e26 = in_POSITION0_1;
    let _e29 = u_xlat0_;
    u_xlat0_ = ((_e25 * _e26.xxxx) + _e29);
    let _e34 = _v_buffer1_.v_cb1_[2];
    let _e35 = in_POSITION0_1;
    let _e38 = u_xlat0_;
    u_xlat0_ = ((_e34 * _e35.zzzz) + _e38);
    let _e40 = u_xlat0_;
    let _e44 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e40 + _e44);
    let _e46 = u_xlat0_;
    let _e51 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e46.yyyy * _e51);
    let _e56 = _v_buffer0_.v_cb0_[79];
    let _e57 = u_xlat0_;
    let _e60 = u_xlat1_;
    u_xlat1_ = ((_e56 * _e57.xxxx) + _e60);
    let _e65 = _v_buffer0_.v_cb0_[81];
    let _e66 = u_xlat0_;
    let _e69 = u_xlat1_;
    u_xlat1_ = ((_e65 * _e66.zzzz) + _e69);
    let _e75 = _v_buffer0_.v_cb0_[82];
    let _e76 = u_xlat0_;
    let _e79 = u_xlat1_;
    gl_Position = ((_e75 * _e76.wwww) + _e79);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    main_1();
    let _e11 = gl_Position;
    return VertexOutput(_e11);
}
