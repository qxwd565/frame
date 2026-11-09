struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec2<f32>,
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
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec2<f32>;
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
    let _e90 = u_xlat0_;
    let _e92 = in_TEXCOORD0_1;
    let _e97 = _v_buffer2_.v_cb2_[0];
    let _e103 = _v_buffer2_.v_cb2_[0];
    let _e105 = ((_e92.xy * _e97.xy) + _e103.zw);
    u_xlat0_.x = _e105.x;
    u_xlat0_.y = _e105.y;
    let _e110 = vs_TEXCOORD0_;
    let _e115 = _v_buffer0_.v_cb0_[15];
    let _e120 = _v_buffer2_.v_cb2_[3];
    let _e123 = u_xlat0_;
    let _e125 = ((_e115.xx * _e120.yz) + _e123.xy);
    vs_TEXCOORD0_.x = _e125.x;
    vs_TEXCOORD0_.y = _e125.y;
    let _e130 = u_xlat0_;
    let _e132 = in_TEXCOORD0_1;
    let _e137 = _v_buffer2_.v_cb2_[1];
    let _e143 = _v_buffer2_.v_cb2_[1];
    let _e145 = ((_e132.xy * _e137.xy) + _e143.zw);
    u_xlat0_.x = _e145.x;
    u_xlat0_.y = _e145.y;
    let _e150 = vs_TEXCOORD1_;
    let _e155 = _v_buffer0_.v_cb0_[15];
    let _e160 = _v_buffer2_.v_cb2_[4];
    let _e163 = u_xlat0_;
    let _e165 = ((_e155.xx * _e160.xy) + _e163.xy);
    vs_TEXCOORD1_.x = _e165.x;
    vs_TEXCOORD1_.y = _e165.y;
    let _e170 = u_xlat0_;
    let _e172 = in_TEXCOORD0_1;
    let _e177 = _v_buffer2_.v_cb2_[2];
    let _e183 = _v_buffer2_.v_cb2_[2];
    let _e185 = ((_e172.xy * _e177.xy) + _e183.zw);
    u_xlat0_.x = _e185.x;
    u_xlat0_.y = _e185.y;
    let _e190 = vs_TEXCOORD2_;
    let _e195 = _v_buffer0_.v_cb0_[15];
    let _e200 = _v_buffer2_.v_cb2_[4];
    let _e203 = u_xlat0_;
    let _e205 = ((_e195.xx * _e200.zw) + _e203.xy);
    vs_TEXCOORD2_.x = _e205.x;
    vs_TEXCOORD2_.y = _e205.y;
    let _e210 = in_COLOR0_1;
    let _e214 = _v_buffer2_.v_cb2_[3];
    vs_COLOR0_ = (_e210 * _e214.xxxx);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = vs_TEXCOORD2_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
