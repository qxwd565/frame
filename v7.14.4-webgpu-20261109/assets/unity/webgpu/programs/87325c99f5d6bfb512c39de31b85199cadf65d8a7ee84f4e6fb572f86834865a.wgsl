struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 7>,
}

struct v_buffer3_ {
    v_cb3_: vec4<f32>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e30 = in_POSITION0_1;
    let _e35 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e30.yyyy * _e35);
    let _e40 = _v_buffer1_.v_cb1_[0];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    u_xlat0_ = ((_e40 * _e41.xxxx) + _e44);
    let _e49 = _v_buffer1_.v_cb1_[2];
    let _e50 = in_POSITION0_1;
    let _e53 = u_xlat0_;
    u_xlat0_ = ((_e49 * _e50.zzzz) + _e53);
    let _e55 = u_xlat0_;
    let _e59 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e55 + _e59);
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e61.yyyy * _e66);
    let _e71 = _v_buffer0_.v_cb0_[79];
    let _e72 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_ = ((_e71 * _e72.xxxx) + _e75);
    let _e80 = _v_buffer0_.v_cb0_[81];
    let _e81 = u_xlat0_;
    let _e84 = u_xlat1_;
    u_xlat1_ = ((_e80 * _e81.zzzz) + _e84);
    let _e90 = _v_buffer0_.v_cb0_[82];
    let _e91 = u_xlat0_;
    let _e94 = u_xlat1_;
    gl_Position = ((_e90 * _e91.wwww) + _e94);
    let _e96 = u_xlat0_;
    let _e98 = in_TEXCOORD0_1;
    let _e103 = _v_buffer2_.v_cb2_[6];
    let _e109 = _v_buffer2_.v_cb2_[6];
    let _e111 = ((_e98.xy * _e103.xy) + _e109.zw);
    u_xlat0_.x = _e111.x;
    u_xlat0_.y = _e111.y;
    let _e116 = vs_TEXCOORD0_;
    let _e118 = u_xlat0_;
    let _e119 = _e118.xy;
    vs_TEXCOORD0_.x = _e119.x;
    vs_TEXCOORD0_.y = _e119.y;
    let _e128 = _v_buffer2_.v_cb2_[5];
    u_xlat4_.x = (-(_e128.x) + 1f);
    let _e133 = u_xlat0_;
    let _e135 = u_xlat0_;
    let _e137 = u_xlat4_;
    let _e139 = (_e135.xy * _e137.xx);
    u_xlat0_.x = _e139.x;
    u_xlat0_.y = _e139.y;
    let _e144 = u_xlat4_;
    let _e146 = in_TEXCOORD1_1;
    let _e151 = _v_buffer2_.v_cb2_[6];
    let _e157 = _v_buffer2_.v_cb2_[6];
    let _e159 = ((_e146.xy * _e151.xy) + _e157.zw);
    u_xlat4_.x = _e159.x;
    u_xlat4_.y = _e159.y;
    let _e164 = vs_TEXCOORD1_;
    let _e169 = _v_buffer2_.v_cb2_[5];
    let _e171 = u_xlat4_;
    let _e174 = u_xlat0_;
    let _e176 = ((_e169.xx * _e171.xy) + _e174.xy);
    vs_TEXCOORD1_.x = _e176.x;
    vs_TEXCOORD1_.y = _e176.y;
    let _e185 = _v_buffer2_.v_cb2_[4];
    let _e187 = _v_buffer3_;
    vs_TEXCOORD1_.w = (_e185.z + _e187.v_cb3_.x);
    let _e192 = in_COLOR0_1;
    vs_TEXCOORD1_.z = _e192.x;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e33 = vs_TEXCOORD0_;
    let _e35 = vs_TEXCOORD1_;
    let _e37 = gl_Position;
    return VertexOutput(_e33, _e35, _e37);
}
