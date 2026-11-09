struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: vec4<f32>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
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
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

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
    let _e92 = vs_TEXCOORD1_;
    let _e94 = u_xlat0_;
    let _e95 = _e94.xyz;
    vs_TEXCOORD1_.x = _e95.x;
    vs_TEXCOORD1_.y = _e95.y;
    vs_TEXCOORD1_.z = _e95.z;
    let _e102 = vs_TEXCOORD0_;
    let _e104 = in_TEXCOORD0_1;
    let _e106 = _v_buffer2_;
    let _e110 = _v_buffer2_;
    let _e113 = ((_e104.xy * _e106.v_cb2_.xy) + _e110.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e113.x;
    vs_TEXCOORD0_.y = _e113.y;
    let _e119 = in_NORMAL0_1;
    let _e124 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e119.xyz, _e124.xyz);
    let _e128 = in_NORMAL0_1;
    let _e133 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e128.xyz, _e133.xyz);
    let _e137 = in_NORMAL0_1;
    let _e142 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e137.xyz, _e142.xyz);
    let _e145 = u_xlat0_;
    let _e147 = u_xlat0_;
    u_xlat6_ = dot(_e145.xyz, _e147.xyz);
    let _e150 = u_xlat6_;
    u_xlat6_ = max(_e150, 0.000000000000000000000000000000000000011754944f);
    let _e153 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e153);
    let _e155 = vs_NORMAL0_;
    let _e157 = u_xlat6_;
    let _e159 = u_xlat0_;
    let _e161 = (vec3(_e157) * _e159.xyz);
    vs_NORMAL0_.x = _e161.x;
    vs_NORMAL0_.y = _e161.y;
    vs_NORMAL0_.z = _e161.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_NORMAL0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
