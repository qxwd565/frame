struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 7>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e26 = in_POSITION0_1;
    let _e31 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e26.yyyy * _e31);
    let _e36 = _v_buffer1_.v_cb1_[0];
    let _e37 = in_POSITION0_1;
    let _e40 = u_xlat0_;
    u_xlat0_ = ((_e36 * _e37.xxxx) + _e40);
    let _e45 = _v_buffer1_.v_cb1_[2];
    let _e46 = in_POSITION0_1;
    let _e49 = u_xlat0_;
    u_xlat0_ = ((_e45 * _e46.zzzz) + _e49);
    let _e51 = u_xlat0_;
    let _e55 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e51 + _e55);
    let _e57 = u_xlat0_;
    let _e62 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e57.yyyy * _e62);
    let _e67 = _v_buffer0_.v_cb0_[79];
    let _e68 = u_xlat0_;
    let _e71 = u_xlat1_;
    u_xlat1_ = ((_e67 * _e68.xxxx) + _e71);
    let _e76 = _v_buffer0_.v_cb0_[81];
    let _e77 = u_xlat0_;
    let _e80 = u_xlat1_;
    u_xlat1_ = ((_e76 * _e77.zzzz) + _e80);
    let _e86 = _v_buffer0_.v_cb0_[82];
    let _e87 = u_xlat0_;
    let _e90 = u_xlat1_;
    gl_Position = ((_e86 * _e87.wwww) + _e90);
    let _e93 = in_TEXCOORD0_1;
    let _e98 = _v_buffer2_.v_cb2_[3];
    u_xlat0_.x = (_e93.x * _e98.y);
    let _e105 = _v_buffer0_.v_cb0_[15];
    let _e110 = _v_buffer2_.v_cb2_[2];
    let _e113 = u_xlat0_;
    vs_TEXCOORD0_.z = ((_e105.x * _e110.w) + _e113.x);
    let _e116 = vs_TEXCOORD0_;
    let _e118 = in_TEXCOORD1_1;
    let _e123 = _v_buffer2_.v_cb2_[0];
    let _e129 = _v_buffer2_.v_cb2_[0];
    let _e131 = ((_e118.xy * _e123.xy) + _e129.zw);
    vs_TEXCOORD0_.x = _e131.x;
    vs_TEXCOORD0_.y = _e131.y;
    let _e136 = u_xlat0_;
    let _e141 = _v_buffer0_.v_cb0_[15];
    let _e146 = _v_buffer2_.v_cb2_[3];
    let _e148 = (_e141.xx * _e146.xw);
    u_xlat0_.x = _e148.x;
    u_xlat0_.y = _e148.y;
    let _e154 = in_TEXCOORD0_1;
    let _e159 = _v_buffer2_.v_cb2_[3];
    let _e162 = u_xlat0_;
    vs_TEXCOORD0_.w = ((_e154.y * _e159.z) + _e162.x);
    let _e166 = in_TEXCOORD0_1;
    let _e171 = _v_buffer2_.v_cb2_[4];
    let _e174 = u_xlat0_;
    u_xlat0_.x = ((_e166.x * _e171.y) + _e174.y);
    let _e178 = u_xlat0_;
    let _e183 = _v_buffer2_.v_cb2_[4];
    vs_TEXCOORD1_.x = (_e178.x + _e183.w);
    let _e187 = in_TEXCOORD0_1;
    let _e192 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.x = (_e187.y * _e192.y);
    let _e199 = _v_buffer0_.v_cb0_[15];
    let _e204 = _v_buffer2_.v_cb2_[4];
    let _e207 = u_xlat0_;
    u_xlat0_.x = ((_e199.x * _e204.x) + _e207.x);
    let _e211 = u_xlat0_;
    let _e216 = _v_buffer2_.v_cb2_[5];
    vs_TEXCOORD1_.y = (_e211.x + _e216.x);
    let _e219 = u_xlat0_;
    let _e221 = in_TEXCOORD0_1;
    let _e226 = _v_buffer2_.v_cb2_[6];
    let _e228 = (_e221.xy + _e226.yz);
    u_xlat0_.x = _e228.x;
    u_xlat0_.y = _e228.y;
    let _e233 = u_xlat4_;
    let _e238 = _v_buffer0_.v_cb0_[15];
    let _e243 = _v_buffer2_.v_cb2_[5];
    let _e245 = (_e238.xx * _e243.yz);
    u_xlat4_.x = _e245.x;
    u_xlat4_.y = _e245.y;
    let _e251 = u_xlat0_;
    let _e256 = _v_buffer2_.v_cb2_[5];
    let _e259 = u_xlat4_;
    vs_TEXCOORD1_.z = ((_e251.x * _e256.w) + _e259.x);
    let _e263 = u_xlat0_;
    let _e268 = _v_buffer2_.v_cb2_[6];
    let _e271 = u_xlat4_;
    vs_TEXCOORD1_.w = ((_e263.y * _e268.x) + _e271.y);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    main_1();
    let _e26 = vs_TEXCOORD0_;
    let _e28 = vs_TEXCOORD1_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
