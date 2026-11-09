struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

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
    let _e89 = vs_TEXCOORD1_;
    let _e91 = u_xlat0_;
    let _e92 = _e91.xyz;
    vs_TEXCOORD1_.x = _e92.x;
    vs_TEXCOORD1_.y = _e92.y;
    vs_TEXCOORD1_.z = _e92.z;
    let _e100 = in_NORMAL0_1;
    let _e105 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e100.xyz, _e105.xyz);
    let _e109 = in_NORMAL0_1;
    let _e114 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e109.xyz, _e114.xyz);
    let _e118 = in_NORMAL0_1;
    let _e123 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e118.xyz, _e123.xyz);
    let _e126 = u_xlat0_;
    let _e128 = u_xlat0_;
    u_xlat6_ = dot(_e126.xyz, _e128.xyz);
    let _e131 = u_xlat6_;
    u_xlat6_ = max(_e131, 0.000000000000000000000000000000000000011754944f);
    let _e134 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e134);
    let _e136 = vs_NORMAL0_;
    let _e138 = u_xlat6_;
    let _e140 = u_xlat0_;
    let _e142 = (vec3(_e138) * _e140.xyz);
    vs_NORMAL0_.x = _e142.x;
    vs_NORMAL0_.y = _e142.y;
    vs_NORMAL0_.z = _e142.z;
    let _e149 = vs_TEXCOORD0_;
    let _e151 = in_TEXCOORD0_1;
    let _e152 = _e151.xy;
    vs_TEXCOORD0_.x = _e152.x;
    vs_TEXCOORD0_.y = _e152.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e25 = vs_NORMAL0_;
    let _e27 = vs_TEXCOORD0_;
    let _e29 = vs_TEXCOORD1_;
    let _e31 = gl_Position;
    return VertexOutput(_e25, _e27, _e29, _e31);
}
