struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 4>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 21>,
}

struct VertexOutput {
    @location(10) vs_COLOR0_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
var<private> in_POSITION0_1: vec3<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e17 = in_COLOR0_1;
    vs_COLOR0_ = _e17;
    let _e18 = vs_COLOR0_;
    vs_COLOR0_ = clamp(_e18, vec4(0f), vec4(1f));
    let _e24 = in_POSITION0_1;
    let _e29 = _v_buffer0_.v_cb0_[1];
    u_xlat0_ = (_e24.yyyy * _e29);
    let _e34 = _v_buffer0_.v_cb0_[0];
    let _e35 = in_POSITION0_1;
    let _e38 = u_xlat0_;
    u_xlat0_ = ((_e34 * _e35.xxxx) + _e38);
    let _e43 = _v_buffer0_.v_cb0_[2];
    let _e44 = in_POSITION0_1;
    let _e47 = u_xlat0_;
    u_xlat0_ = ((_e43 * _e44.zzzz) + _e47);
    let _e49 = u_xlat0_;
    let _e53 = _v_buffer0_.v_cb0_[3];
    u_xlat0_ = (_e49 + _e53);
    let _e55 = u_xlat0_;
    let _e60 = _v_buffer1_.v_cb1_[18];
    u_xlat1_ = (_e55.yyyy * _e60);
    let _e65 = _v_buffer1_.v_cb1_[17];
    let _e66 = u_xlat0_;
    let _e69 = u_xlat1_;
    u_xlat1_ = ((_e65 * _e66.xxxx) + _e69);
    let _e74 = _v_buffer1_.v_cb1_[19];
    let _e75 = u_xlat0_;
    let _e78 = u_xlat1_;
    u_xlat1_ = ((_e74 * _e75.zzzz) + _e78);
    let _e84 = _v_buffer1_.v_cb1_[20];
    let _e85 = u_xlat0_;
    let _e88 = u_xlat1_;
    gl_Position = ((_e84 * _e85.wwww) + _e88);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec3<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e17 = vs_COLOR0_;
    let _e19 = gl_Position;
    return VertexOutput(_e17, _e19);
}
