struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> in_TEXCOORD2_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec2<f32> = vec2(0f);
    var u_xlat6_: f32 = 0f;

    let _e33 = u_xlat0_;
    let _e38 = _v_buffer0_.v_cb0_[15];
    let _e43 = _v_buffer2_.v_cb2_[1];
    let _e45 = (_e38.yy * _e43.yz);
    u_xlat0_.x = _e45.x;
    u_xlat0_.y = _e45.y;
    let _e50 = u_xlat0_;
    let _e52 = u_xlat0_;
    let _e54 = sin(_e52.xy);
    u_xlat0_.x = _e54.x;
    u_xlat0_.y = _e54.y;
    let _e59 = u_xlat0_;
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer2_.v_cb2_[1];
    let _e68 = (_e61.xy * _e66.xx);
    u_xlat0_.x = _e68.x;
    u_xlat0_.y = _e68.y;
    let _e73 = u_xlat2_;
    let _e75 = u_xlat0_;
    let _e77 = in_TEXCOORD2_1;
    let _e79 = (_e75.yy * _e77.xy);
    u_xlat2_.x = _e79.x;
    u_xlat2_.y = _e79.y;
    let _e84 = u_xlat0_;
    let _e86 = in_TEXCOORD1_1;
    let _e88 = u_xlat0_;
    let _e91 = u_xlat2_;
    let _e93 = ((_e86.xy * _e88.xx) + _e91.xy);
    u_xlat0_.x = _e93.x;
    u_xlat0_.y = _e93.y;
    let _e98 = u_xlat0_;
    let _e100 = u_xlat0_;
    let _e102 = in_POSITION0_1;
    let _e104 = (_e100.xy + _e102.xy);
    u_xlat0_.x = _e104.x;
    u_xlat0_.y = _e104.y;
    let _e109 = u_xlat0_;
    let _e114 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e109.yyyy * _e114);
    let _e119 = _v_buffer1_.v_cb1_[0];
    let _e120 = u_xlat0_;
    let _e123 = u_xlat1_;
    u_xlat0_ = ((_e119 * _e120.xxxx) + _e123);
    let _e128 = _v_buffer1_.v_cb1_[2];
    let _e129 = in_POSITION0_1;
    let _e132 = u_xlat0_;
    u_xlat0_ = ((_e128 * _e129.zzzz) + _e132);
    let _e134 = u_xlat0_;
    let _e138 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e134 + _e138);
    let _e140 = u_xlat0_;
    let _e145 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e140.yyyy * _e145);
    let _e150 = _v_buffer0_.v_cb0_[79];
    let _e151 = u_xlat0_;
    let _e154 = u_xlat1_;
    u_xlat1_ = ((_e150 * _e151.xxxx) + _e154);
    let _e159 = _v_buffer0_.v_cb0_[81];
    let _e160 = u_xlat0_;
    let _e163 = u_xlat1_;
    u_xlat1_ = ((_e159 * _e160.zzzz) + _e163);
    let _e169 = _v_buffer0_.v_cb0_[82];
    let _e170 = u_xlat0_;
    let _e173 = u_xlat1_;
    gl_Position = ((_e169 * _e170.wwww) + _e173);
    let _e175 = vs_TEXCOORD0_;
    let _e177 = in_TEXCOORD0_1;
    let _e182 = _v_buffer2_.v_cb2_[0];
    let _e188 = _v_buffer2_.v_cb2_[0];
    let _e190 = ((_e177.xy * _e182.xy) + _e188.zw);
    vs_TEXCOORD0_.x = _e190.x;
    vs_TEXCOORD0_.y = _e190.y;
    let _e196 = in_NORMAL0_1;
    let _e201 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e196.xyz, _e201.xyz);
    let _e205 = in_NORMAL0_1;
    let _e210 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e205.xyz, _e210.xyz);
    let _e214 = in_NORMAL0_1;
    let _e219 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e214.xyz, _e219.xyz);
    let _e222 = u_xlat0_;
    let _e224 = u_xlat0_;
    u_xlat6_ = dot(_e222.xyz, _e224.xyz);
    let _e227 = u_xlat6_;
    u_xlat6_ = max(_e227, 0.000000000000000000000000000000000000011754944f);
    let _e230 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e230);
    let _e232 = vs_NORMAL0_;
    let _e234 = u_xlat6_;
    let _e236 = u_xlat0_;
    let _e238 = (vec3(_e234) * _e236.xyz);
    vs_NORMAL0_.x = _e238.x;
    vs_NORMAL0_.y = _e238.y;
    vs_NORMAL0_.z = _e238.z;
    let _e249 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e249.w);
    let _e256 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e256.w);
    let _e263 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e263.w);
    let _e266 = u_xlat0_;
    let _e268 = u_xlat0_;
    let _e270 = log2(_e268.xyz);
    u_xlat0_.x = _e270.x;
    u_xlat0_.y = _e270.y;
    u_xlat0_.z = _e270.z;
    let _e277 = u_xlat0_;
    let _e279 = u_xlat0_;
    let _e285 = (_e279.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e285.x;
    u_xlat0_.y = _e285.y;
    u_xlat0_.z = _e285.z;
    let _e292 = u_xlat0_;
    let _e294 = u_xlat0_;
    let _e296 = exp2(_e294.xyz);
    u_xlat0_.x = _e296.x;
    u_xlat0_.y = _e296.y;
    u_xlat0_.z = _e296.z;
    let _e303 = u_xlat0_;
    let _e305 = u_xlat0_;
    let _e319 = ((_e305.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e319.x;
    u_xlat0_.y = _e319.y;
    u_xlat0_.z = _e319.z;
    let _e326 = u_xlat0_;
    let _e328 = u_xlat0_;
    let _e334 = clamp(_e328.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e334.x;
    u_xlat0_.y = _e334.y;
    u_xlat0_.z = _e334.z;
    let _e341 = u_xlat0_;
    let _e343 = u_xlat0_;
    let _e348 = _v_buffer0_.v_cb0_[6];
    let _e350 = (_e343.xyz + _e348.xyz);
    u_xlat0_.x = _e350.x;
    u_xlat0_.y = _e350.y;
    u_xlat0_.z = _e350.z;
    u_xlat0_.w = 1f;
    let _e359 = u_xlat0_;
    let _e360 = in_COLOR0_1;
    u_xlat0_ = (_e359 + -(_e360));
    let _e366 = _v_buffer2_.v_cb2_[1];
    let _e368 = u_xlat0_;
    let _e370 = in_COLOR0_1;
    vs_COLOR0_ = ((_e366.wwww * _e368) + _e370);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(6) in_TEXCOORD2_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_TEXCOORD2_1 = in_TEXCOORD2_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e40 = vs_TEXCOORD0_;
    let _e42 = vs_NORMAL0_;
    let _e44 = vs_COLOR0_;
    let _e46 = gl_Position;
    return VertexOutput(_e40, _e42, _e44, _e46);
}
