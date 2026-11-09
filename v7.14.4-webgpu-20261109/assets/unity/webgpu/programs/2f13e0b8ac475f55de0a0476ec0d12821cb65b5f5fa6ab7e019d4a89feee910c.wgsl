struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 5>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat6_: f32 = 0f;

    let _e33 = in_POSITION0_1;
    let _e38 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e33.yyyy * _e38);
    let _e43 = _v_buffer1_.v_cb1_[0];
    let _e44 = in_POSITION0_1;
    let _e47 = u_xlat0_;
    u_xlat0_ = ((_e43 * _e44.xxxx) + _e47);
    let _e52 = _v_buffer1_.v_cb1_[2];
    let _e53 = in_POSITION0_1;
    let _e56 = u_xlat0_;
    u_xlat0_ = ((_e52 * _e53.zzzz) + _e56);
    let _e58 = u_xlat0_;
    let _e62 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e58 + _e62);
    let _e64 = u_xlat0_;
    let _e69 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e64.yyyy * _e69);
    let _e74 = _v_buffer0_.v_cb0_[79];
    let _e75 = u_xlat0_;
    let _e78 = u_xlat1_;
    u_xlat1_ = ((_e74 * _e75.xxxx) + _e78);
    let _e83 = _v_buffer0_.v_cb0_[81];
    let _e84 = u_xlat0_;
    let _e87 = u_xlat1_;
    u_xlat1_ = ((_e83 * _e84.zzzz) + _e87);
    let _e93 = _v_buffer0_.v_cb0_[82];
    let _e94 = u_xlat0_;
    let _e97 = u_xlat1_;
    gl_Position = ((_e93 * _e94.wwww) + _e97);
    let _e99 = vs_TEXCOORD2_;
    let _e101 = u_xlat0_;
    let _e102 = _e101.xyz;
    vs_TEXCOORD2_.x = _e102.x;
    vs_TEXCOORD2_.y = _e102.y;
    vs_TEXCOORD2_.z = _e102.z;
    let _e110 = in_TEXCOORD1_1;
    let _e115 = _v_buffer2_.v_cb2_[1];
    u_xlat4_.x = (_e110.x + _e115.w);
    let _e119 = in_TEXCOORD1_1;
    let _e124 = _v_buffer2_.v_cb2_[2];
    u_xlat4_.y = (_e119.y + _e124.x);
    let _e127 = vs_TEXCOORD1_;
    let _e129 = u_xlat4_;
    let _e134 = _v_buffer2_.v_cb2_[2];
    let _e136 = (_e129.xy * _e134.yy);
    vs_TEXCOORD1_.x = _e136.x;
    vs_TEXCOORD1_.y = _e136.y;
    let _e141 = u_xlat0_;
    let _e143 = in_TEXCOORD0_1;
    let _e148 = _v_buffer2_.v_cb2_[1];
    let _e150 = (_e143.xy + _e148.xy);
    u_xlat0_.x = _e150.x;
    u_xlat0_.y = _e150.y;
    let _e155 = vs_TEXCOORD0_;
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer2_.v_cb2_[1];
    let _e164 = (_e157.xy * _e162.zz);
    vs_TEXCOORD0_.x = _e164.x;
    vs_TEXCOORD0_.y = _e164.y;
    let _e170 = in_NORMAL0_1;
    let _e175 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e170.xyz, _e175.xyz);
    let _e179 = in_NORMAL0_1;
    let _e184 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e179.xyz, _e184.xyz);
    let _e188 = in_NORMAL0_1;
    let _e193 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e188.xyz, _e193.xyz);
    let _e196 = u_xlat0_;
    let _e198 = u_xlat0_;
    u_xlat6_ = dot(_e196.xyz, _e198.xyz);
    let _e201 = u_xlat6_;
    u_xlat6_ = max(_e201, 0.000000000000000000000000000000000000011754944f);
    let _e204 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e204);
    let _e206 = vs_NORMAL0_;
    let _e208 = u_xlat6_;
    let _e210 = u_xlat0_;
    let _e212 = (vec3(_e208) * _e210.xyz);
    vs_NORMAL0_.x = _e212.x;
    vs_NORMAL0_.y = _e212.y;
    vs_NORMAL0_.z = _e212.z;
    let _e223 = _v_buffer2_.v_cb2_[3];
    let _e228 = _v_buffer2_.v_cb2_[3];
    u_xlat0_.x = dot(_e223.xyz, _e228.xyz);
    let _e232 = u_xlat0_;
    u_xlat0_.x = inverseSqrt(_e232.x);
    let _e235 = u_xlat0_;
    let _e237 = u_xlat0_;
    let _e242 = _v_buffer2_.v_cb2_[3];
    let _e244 = (_e237.xxx * _e242.xyz);
    u_xlat0_.x = _e244.x;
    u_xlat0_.y = _e244.y;
    u_xlat0_.z = _e244.z;
    let _e252 = u_xlat0_;
    let _e254 = in_NORMAL0_1;
    u_xlat0_.x = dot(_e252.xyz, _e254.xyz);
    let _e258 = u_xlat0_;
    let _e263 = _v_buffer2_.v_cb2_[4];
    u_xlat0_.x = (_e258.x * _e263.x);
    let _e267 = u_xlat0_;
    u_xlat0_.x = clamp(_e267.x, 0f, 1f);
    let _e273 = u_xlat0_;
    u_xlat0_.x = log2(_e273.x);
    let _e277 = u_xlat0_;
    let _e282 = _v_buffer2_.v_cb2_[3];
    u_xlat0_.x = (_e277.x * _e282.w);
    let _e285 = u_xlat0_;
    vs_COLOR0_ = exp2(_e285.xxxx);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e36 = vs_TEXCOORD0_;
    let _e38 = vs_TEXCOORD1_;
    let _e40 = vs_TEXCOORD2_;
    let _e42 = vs_NORMAL0_;
    let _e44 = vs_COLOR0_;
    let _e46 = gl_Position;
    return VertexOutput(_e36, _e38, _e40, _e42, _e44, _e46);
}
