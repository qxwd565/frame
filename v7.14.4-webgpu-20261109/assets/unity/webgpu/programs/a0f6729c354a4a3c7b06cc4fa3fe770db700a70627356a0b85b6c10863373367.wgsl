struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 6>,
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
    let _e54 = _v_buffer1_.v_cb1_[3];
    let _e55 = in_POSITION0_1;
    let _e58 = u_xlat0_;
    u_xlat1_ = ((_e54 * _e55.wwww) + _e58);
    let _e60 = vs_TEXCOORD1_;
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer1_.v_cb1_[3];
    let _e69 = (_e62.xyz + _e67.xyz);
    vs_TEXCOORD1_.x = _e69.x;
    vs_TEXCOORD1_.y = _e69.y;
    vs_TEXCOORD1_.z = _e69.z;
    let _e76 = u_xlat1_;
    let _e80 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e76 + -(_e80));
    let _e83 = u_xlat0_;
    let _e87 = _v_buffer2_.v_cb2_[1];
    u_xlat0_ = (_e83 * _e87);
    let _e89 = u_xlat0_;
    let _e94 = _v_buffer2_.v_cb2_[3];
    u_xlat1_ = (_e89.yyyy * _e94);
    let _e99 = _v_buffer2_.v_cb2_[2];
    let _e100 = u_xlat0_;
    let _e103 = u_xlat1_;
    u_xlat1_ = ((_e99 * _e100.xxxx) + _e103);
    let _e108 = _v_buffer2_.v_cb2_[4];
    let _e109 = u_xlat0_;
    let _e112 = u_xlat1_;
    u_xlat1_ = ((_e108 * _e109.zzzz) + _e112);
    let _e117 = _v_buffer2_.v_cb2_[5];
    let _e118 = u_xlat0_;
    let _e121 = u_xlat1_;
    u_xlat0_ = ((_e117 * _e118.wwww) + _e121);
    let _e123 = u_xlat0_;
    let _e127 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e123 + _e127);
    let _e129 = u_xlat1_;
    let _e131 = u_xlat0_;
    let _e136 = _v_buffer1_.v_cb1_[5];
    let _e138 = (_e131.yyy * _e136.xyz);
    u_xlat1_.x = _e138.x;
    u_xlat1_.y = _e138.y;
    u_xlat1_.z = _e138.z;
    let _e145 = u_xlat1_;
    let _e150 = _v_buffer1_.v_cb1_[4];
    let _e152 = u_xlat0_;
    let _e155 = u_xlat1_;
    let _e157 = ((_e150.xyz * _e152.xxx) + _e155.xyz);
    u_xlat1_.x = _e157.x;
    u_xlat1_.y = _e157.y;
    u_xlat1_.z = _e157.z;
    let _e164 = u_xlat0_;
    let _e169 = _v_buffer1_.v_cb1_[6];
    let _e171 = u_xlat0_;
    let _e174 = u_xlat1_;
    let _e176 = ((_e169.xyz * _e171.zzz) + _e174.xyz);
    u_xlat0_.x = _e176.x;
    u_xlat0_.y = _e176.y;
    u_xlat0_.z = _e176.z;
    let _e183 = u_xlat0_;
    let _e188 = _v_buffer1_.v_cb1_[7];
    let _e190 = u_xlat0_;
    let _e193 = u_xlat0_;
    let _e195 = ((_e188.xyz * _e190.www) + _e193.xyz);
    u_xlat0_.x = _e195.x;
    u_xlat0_.y = _e195.y;
    u_xlat0_.z = _e195.z;
    let _e202 = u_xlat0_;
    let _e207 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e202.yyyy * _e207);
    let _e212 = _v_buffer1_.v_cb1_[0];
    let _e213 = u_xlat0_;
    let _e216 = u_xlat1_;
    u_xlat1_ = ((_e212 * _e213.xxxx) + _e216);
    let _e221 = _v_buffer1_.v_cb1_[2];
    let _e222 = u_xlat0_;
    let _e225 = u_xlat1_;
    u_xlat0_ = ((_e221 * _e222.zzzz) + _e225);
    let _e227 = u_xlat0_;
    let _e231 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e227 + _e231);
    let _e233 = u_xlat0_;
    let _e238 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e233.yyyy * _e238);
    let _e243 = _v_buffer0_.v_cb0_[79];
    let _e244 = u_xlat0_;
    let _e247 = u_xlat1_;
    u_xlat1_ = ((_e243 * _e244.xxxx) + _e247);
    let _e252 = _v_buffer0_.v_cb0_[81];
    let _e253 = u_xlat0_;
    let _e256 = u_xlat1_;
    u_xlat1_ = ((_e252 * _e253.zzzz) + _e256);
    let _e262 = _v_buffer0_.v_cb0_[82];
    let _e263 = u_xlat0_;
    let _e266 = u_xlat1_;
    gl_Position = ((_e262 * _e263.wwww) + _e266);
    let _e268 = vs_TEXCOORD0_;
    let _e270 = in_TEXCOORD0_1;
    let _e275 = _v_buffer2_.v_cb2_[0];
    let _e281 = _v_buffer2_.v_cb2_[0];
    let _e283 = ((_e270.xy * _e275.xy) + _e281.zw);
    vs_TEXCOORD0_.x = _e283.x;
    vs_TEXCOORD0_.y = _e283.y;
    let _e289 = in_NORMAL0_1;
    let _e294 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e289.xyz, _e294.xyz);
    let _e298 = in_NORMAL0_1;
    let _e303 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e298.xyz, _e303.xyz);
    let _e307 = in_NORMAL0_1;
    let _e312 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e307.xyz, _e312.xyz);
    let _e315 = u_xlat0_;
    let _e317 = u_xlat0_;
    u_xlat6_ = dot(_e315.xyz, _e317.xyz);
    let _e320 = u_xlat6_;
    u_xlat6_ = max(_e320, 0.000000000000000000000000000000000000011754944f);
    let _e323 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e323);
    let _e325 = vs_NORMAL0_;
    let _e327 = u_xlat6_;
    let _e329 = u_xlat0_;
    let _e331 = (vec3(_e327) * _e329.xyz);
    vs_NORMAL0_.x = _e331.x;
    vs_NORMAL0_.y = _e331.y;
    vs_NORMAL0_.z = _e331.z;
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
