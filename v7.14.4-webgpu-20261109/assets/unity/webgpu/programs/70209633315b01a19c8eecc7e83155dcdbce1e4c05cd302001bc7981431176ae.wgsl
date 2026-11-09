struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 8>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 21>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e22 = in_POSITION0_1;
    let _e27 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e22.yyyy * _e27);
    let _e32 = _v_buffer1_.v_cb1_[0];
    let _e33 = in_POSITION0_1;
    let _e36 = u_xlat0_;
    u_xlat0_ = ((_e32 * _e33.xxxx) + _e36);
    let _e41 = _v_buffer1_.v_cb1_[2];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    u_xlat0_ = ((_e41 * _e42.zzzz) + _e45);
    let _e47 = u_xlat0_;
    let _e51 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e47 + _e51);
    let _e53 = u_xlat0_;
    let _e58 = _v_buffer2_.v_cb2_[18];
    u_xlat1_ = (_e53.yyyy * _e58);
    let _e63 = _v_buffer2_.v_cb2_[17];
    let _e64 = u_xlat0_;
    let _e67 = u_xlat1_;
    u_xlat1_ = ((_e63 * _e64.xxxx) + _e67);
    let _e72 = _v_buffer2_.v_cb2_[19];
    let _e73 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat1_ = ((_e72 * _e73.zzzz) + _e76);
    let _e82 = _v_buffer2_.v_cb2_[20];
    let _e83 = u_xlat0_;
    let _e86 = u_xlat1_;
    gl_Position = ((_e82 * _e83.wwww) + _e86);
    let _e88 = vs_TEXCOORD0_;
    let _e90 = in_TEXCOORD0_1;
    let _e95 = _v_buffer0_.v_cb0_[7];
    let _e101 = _v_buffer0_.v_cb0_[7];
    let _e103 = ((_e90.xy * _e95.xy) + _e101.zw);
    vs_TEXCOORD0_.x = _e103.x;
    vs_TEXCOORD0_.y = _e103.y;
    let _e111 = _v_buffer2_.v_cb2_[0];
    let _e121 = _v_buffer0_.v_cb0_[2];
    u_xlat0_ = ((_e111 * vec4<f32>(2f, 2f, 2f, 2f)) + _e121);
    let _e123 = u_xlat0_;
    let _e124 = in_COLOR0_1;
    u_xlat0_ = (_e123 + -(_e124));
    let _e130 = _v_buffer0_.v_cb0_[6];
    let _e132 = u_xlat0_;
    let _e134 = in_COLOR0_1;
    u_xlat0_ = ((_e130.xxxx * _e132) + _e134);
    let _e136 = u_xlat0_;
    let _e140 = _v_buffer0_.v_cb0_[4];
    vs_COLOR0_ = (_e136 * _e140);
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
