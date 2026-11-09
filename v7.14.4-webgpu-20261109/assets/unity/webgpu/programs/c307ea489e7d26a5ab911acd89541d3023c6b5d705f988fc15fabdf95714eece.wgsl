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
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e26 = u_xlat0_;
    let _e28 = in_POSITION0_1;
    let _e33 = _v_buffer1_.v_cb1_[1];
    let _e35 = (_e28.yyy * _e33.xyz);
    u_xlat0_.x = _e35.x;
    u_xlat0_.y = _e35.y;
    u_xlat0_.z = _e35.z;
    let _e42 = u_xlat0_;
    let _e47 = _v_buffer1_.v_cb1_[0];
    let _e49 = in_POSITION0_1;
    let _e52 = u_xlat0_;
    let _e54 = ((_e47.xyz * _e49.xxx) + _e52.xyz);
    u_xlat0_.x = _e54.x;
    u_xlat0_.y = _e54.y;
    u_xlat0_.z = _e54.z;
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer1_.v_cb1_[2];
    let _e68 = in_POSITION0_1;
    let _e71 = u_xlat0_;
    let _e73 = ((_e66.xyz * _e68.zzz) + _e71.xyz);
    u_xlat0_.x = _e73.x;
    u_xlat0_.y = _e73.y;
    u_xlat0_.z = _e73.z;
    let _e80 = u_xlat0_;
    let _e82 = u_xlat0_;
    let _e87 = _v_buffer1_.v_cb1_[3];
    let _e89 = (_e82.xyz + _e87.xyz);
    u_xlat0_.x = _e89.x;
    u_xlat0_.y = _e89.y;
    u_xlat0_.z = _e89.z;
    let _e96 = u_xlat0_;
    let _e101 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e96.yyyy * _e101);
    let _e106 = _v_buffer0_.v_cb0_[79];
    let _e107 = u_xlat0_;
    let _e110 = u_xlat1_;
    u_xlat1_ = ((_e106 * _e107.xxxx) + _e110);
    let _e115 = _v_buffer0_.v_cb0_[81];
    let _e116 = u_xlat0_;
    let _e119 = u_xlat1_;
    u_xlat1_ = ((_e115 * _e116.zzzz) + _e119);
    let _e121 = vs_TEXCOORD1_;
    let _e123 = u_xlat0_;
    let _e124 = _e123.xyz;
    vs_TEXCOORD1_.x = _e124.x;
    vs_TEXCOORD1_.y = _e124.y;
    vs_TEXCOORD1_.z = _e124.z;
    let _e132 = u_xlat1_;
    let _e136 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e132 + _e136);
    let _e138 = vs_TEXCOORD0_;
    let _e140 = in_TEXCOORD0_1;
    let _e142 = _v_buffer2_;
    let _e146 = _v_buffer2_;
    let _e149 = ((_e140.xy * _e142.v_cb2_.xy) + _e146.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e149.x;
    vs_TEXCOORD0_.y = _e149.y;
    let _e155 = in_NORMAL0_1;
    let _e160 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e155.xyz, _e160.xyz);
    let _e164 = in_NORMAL0_1;
    let _e169 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e164.xyz, _e169.xyz);
    let _e173 = in_NORMAL0_1;
    let _e178 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e173.xyz, _e178.xyz);
    let _e181 = u_xlat0_;
    let _e183 = u_xlat0_;
    u_xlat6_ = dot(_e181.xyz, _e183.xyz);
    let _e186 = u_xlat6_;
    u_xlat6_ = max(_e186, 0.000000000000000000000000000000000000011754944f);
    let _e189 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e189);
    let _e191 = vs_NORMAL0_;
    let _e193 = u_xlat6_;
    let _e195 = u_xlat0_;
    let _e197 = (vec3(_e193) * _e195.xyz);
    vs_NORMAL0_.x = _e197.x;
    vs_NORMAL0_.y = _e197.y;
    vs_NORMAL0_.z = _e197.z;
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
