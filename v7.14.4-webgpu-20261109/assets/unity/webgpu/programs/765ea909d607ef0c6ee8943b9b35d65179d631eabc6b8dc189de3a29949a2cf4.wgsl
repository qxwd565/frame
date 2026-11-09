struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
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
    let _e90 = vs_TEXCOORD1_;
    let _e92 = u_xlat0_;
    let _e97 = _v_buffer2_.v_cb2_[0];
    let _e103 = _v_buffer2_.v_cb2_[0];
    let _e105 = ((_e92.xz * _e97.zz) + _e103.yx);
    vs_TEXCOORD1_.x = _e105.x;
    vs_TEXCOORD1_.y = _e105.y;
    let _e110 = vs_TEXCOORD2_;
    let _e112 = u_xlat0_;
    let _e113 = _e112.xyz;
    vs_TEXCOORD2_.x = _e113.x;
    vs_TEXCOORD2_.y = _e113.y;
    vs_TEXCOORD2_.z = _e113.z;
    let _e120 = vs_TEXCOORD0_;
    let _e122 = in_TEXCOORD0_1;
    let _e127 = _v_buffer2_.v_cb2_[1];
    let _e133 = _v_buffer2_.v_cb2_[1];
    let _e135 = ((_e122.xy * _e127.xy) + _e133.zw);
    vs_TEXCOORD0_.x = _e135.x;
    vs_TEXCOORD0_.y = _e135.y;
    let _e140 = vs_NORMAL0_;
    let _e142 = in_NORMAL0_1;
    let _e143 = _e142.xyz;
    vs_NORMAL0_.x = _e143.x;
    vs_NORMAL0_.y = _e143.y;
    vs_NORMAL0_.z = _e143.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = vs_TEXCOORD2_;
    let _e36 = vs_NORMAL0_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
