struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

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
    let _e96 = vs_TEXCOORD2_;
    let _e98 = u_xlat0_;
    let _e99 = _e98.xyz;
    vs_TEXCOORD2_.x = _e99.x;
    vs_TEXCOORD2_.y = _e99.y;
    vs_TEXCOORD2_.z = _e99.z;
    let _e106 = u_xlat0_;
    let _e111 = _v_buffer0_.v_cb0_[15];
    let _e116 = _v_buffer2_.v_cb2_[2];
    let _e119 = in_TEXCOORD0_1;
    let _e121 = ((_e111.xx * _e116.yz) + _e119.xy);
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    let _e126 = vs_TEXCOORD0_;
    let _e128 = u_xlat0_;
    let _e133 = _v_buffer2_.v_cb2_[2];
    let _e135 = (_e128.xy * _e133.xx);
    vs_TEXCOORD0_.x = _e135.x;
    vs_TEXCOORD0_.y = _e135.y;
    let _e140 = u_xlat0_;
    let _e145 = _v_buffer0_.v_cb0_[15];
    let _e150 = _v_buffer2_.v_cb2_[3];
    let _e153 = in_TEXCOORD0_1;
    let _e155 = ((_e145.xx * _e150.xy) + _e153.xy);
    u_xlat0_.x = _e155.x;
    u_xlat0_.y = _e155.y;
    let _e160 = vs_TEXCOORD0_;
    let _e162 = u_xlat0_;
    let _e167 = _v_buffer2_.v_cb2_[2];
    let _e169 = (_e162.xy * _e167.ww);
    vs_TEXCOORD0_.z = _e169.x;
    vs_TEXCOORD0_.w = _e169.y;
    let _e174 = vs_TEXCOORD1_;
    let _e176 = in_TEXCOORD1_1;
    let _e181 = _v_buffer2_.v_cb2_[0];
    let _e187 = _v_buffer2_.v_cb2_[0];
    let _e189 = ((_e176.xy * _e181.xy) + _e187.zw);
    vs_TEXCOORD1_.x = _e189.x;
    vs_TEXCOORD1_.y = _e189.y;
    let _e194 = in_COLOR0_1;
    let _e198 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e194 * _e198.wwww);
    let _e202 = in_NORMAL0_1;
    let _e207 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e202.xyz, _e207.xyz);
    let _e211 = in_NORMAL0_1;
    let _e216 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e211.xyz, _e216.xyz);
    let _e220 = in_NORMAL0_1;
    let _e225 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e220.xyz, _e225.xyz);
    let _e228 = u_xlat0_;
    let _e230 = u_xlat0_;
    u_xlat6_ = dot(_e228.xyz, _e230.xyz);
    let _e233 = u_xlat6_;
    u_xlat6_ = max(_e233, 0.000000000000000000000000000000000000011754944f);
    let _e236 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e236);
    let _e238 = vs_NORMAL0_;
    let _e240 = u_xlat6_;
    let _e242 = u_xlat0_;
    let _e244 = (vec3(_e240) * _e242.xyz);
    vs_NORMAL0_.x = _e244.x;
    vs_NORMAL0_.y = _e244.y;
    vs_NORMAL0_.z = _e244.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e40 = vs_TEXCOORD0_;
    let _e42 = vs_TEXCOORD1_;
    let _e44 = vs_TEXCOORD2_;
    let _e46 = vs_COLOR0_;
    let _e48 = vs_NORMAL0_;
    let _e50 = gl_Position;
    return VertexOutput(_e40, _e42, _e44, _e46, _e48, _e50);
}
