struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e23 = in_POSITION0_1;
    let _e28 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e23.yyyy * _e28);
    let _e33 = _v_buffer1_.v_cb1_[0];
    let _e34 = in_POSITION0_1;
    let _e37 = u_xlat0_;
    u_xlat0_ = ((_e33 * _e34.xxxx) + _e37);
    let _e42 = _v_buffer1_.v_cb1_[2];
    let _e43 = in_POSITION0_1;
    let _e46 = u_xlat0_;
    u_xlat0_ = ((_e42 * _e43.zzzz) + _e46);
    let _e48 = u_xlat0_;
    let _e52 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e48 + _e52);
    let _e54 = u_xlat0_;
    let _e59 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e54.yyyy * _e59);
    let _e64 = _v_buffer0_.v_cb0_[79];
    let _e65 = u_xlat0_;
    let _e68 = u_xlat1_;
    u_xlat1_ = ((_e64 * _e65.xxxx) + _e68);
    let _e73 = _v_buffer0_.v_cb0_[81];
    let _e74 = u_xlat0_;
    let _e77 = u_xlat1_;
    u_xlat1_ = ((_e73 * _e74.zzzz) + _e77);
    let _e83 = _v_buffer0_.v_cb0_[82];
    let _e84 = u_xlat0_;
    let _e87 = u_xlat1_;
    gl_Position = ((_e83 * _e84.wwww) + _e87);
    let _e89 = vs_TEXCOORD0_;
    let _e91 = in_TEXCOORD0_1;
    let _e96 = _v_buffer2_.v_cb2_[3];
    let _e102 = _v_buffer2_.v_cb2_[3];
    let _e104 = ((_e91.xy * _e96.xy) + _e102.zw);
    vs_TEXCOORD0_.x = _e104.x;
    vs_TEXCOORD0_.y = _e104.y;
    let _e109 = vs_TEXCOORD1_;
    let _e111 = in_TEXCOORD1_1;
    let _e116 = _v_buffer2_.v_cb2_[4];
    let _e122 = _v_buffer2_.v_cb2_[4];
    let _e124 = ((_e111.xy * _e116.xy) + _e122.zw);
    vs_TEXCOORD1_.x = _e124.x;
    vs_TEXCOORD1_.y = _e124.y;
    let _e133 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e133.w);
    let _e140 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e140.w);
    let _e147 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e147.w);
    let _e150 = u_xlat0_;
    let _e152 = u_xlat0_;
    let _e154 = log2(_e152.xyz);
    u_xlat0_.x = _e154.x;
    u_xlat0_.y = _e154.y;
    u_xlat0_.z = _e154.z;
    let _e161 = u_xlat0_;
    let _e163 = u_xlat0_;
    let _e169 = (_e163.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e169.x;
    u_xlat0_.y = _e169.y;
    u_xlat0_.z = _e169.z;
    let _e176 = u_xlat0_;
    let _e178 = u_xlat0_;
    let _e180 = exp2(_e178.xyz);
    u_xlat0_.x = _e180.x;
    u_xlat0_.y = _e180.y;
    u_xlat0_.z = _e180.z;
    let _e187 = u_xlat0_;
    let _e189 = u_xlat0_;
    let _e203 = ((_e189.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e203.x;
    u_xlat0_.y = _e203.y;
    u_xlat0_.z = _e203.z;
    let _e210 = u_xlat0_;
    let _e212 = u_xlat0_;
    let _e218 = clamp(_e212.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e218.x;
    u_xlat0_.y = _e218.y;
    u_xlat0_.z = _e218.z;
    let _e225 = u_xlat0_;
    let _e227 = u_xlat0_;
    let _e232 = _v_buffer0_.v_cb0_[6];
    let _e234 = (_e227.xyz + _e232.xyz);
    u_xlat0_.x = _e234.x;
    u_xlat0_.y = _e234.y;
    u_xlat0_.z = _e234.z;
    let _e241 = u_xlat0_;
    let _e243 = u_xlat0_;
    let _e252 = (_e243.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e252.x;
    u_xlat0_.y = _e252.y;
    u_xlat0_.z = _e252.z;
    u_xlat0_.w = 0f;
    let _e264 = _v_buffer2_.v_cb2_[2];
    let _e266 = u_xlat0_;
    vs_COLOR0_ = ((_e264.yyyy * _e266) + vec4<f32>(1f, 1f, 1f, 1f));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
