struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 14>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: f32,
    @location(11) vs_COLOR1_: vec4<f32>,
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
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e31 = in_POSITION0_1;
    let _e36 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e31.yyyy * _e36);
    let _e41 = _v_buffer1_.v_cb1_[0];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    u_xlat0_ = ((_e41 * _e42.xxxx) + _e45);
    let _e50 = _v_buffer1_.v_cb1_[2];
    let _e51 = in_POSITION0_1;
    let _e54 = u_xlat0_;
    u_xlat0_ = ((_e50 * _e51.zzzz) + _e54);
    let _e56 = u_xlat0_;
    let _e60 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e56 + _e60);
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e62.yyyy * _e67);
    let _e72 = _v_buffer0_.v_cb0_[79];
    let _e73 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat1_ = ((_e72 * _e73.xxxx) + _e76);
    let _e81 = _v_buffer0_.v_cb0_[81];
    let _e82 = u_xlat0_;
    let _e85 = u_xlat1_;
    u_xlat1_ = ((_e81 * _e82.zzzz) + _e85);
    let _e91 = _v_buffer0_.v_cb0_[82];
    let _e92 = u_xlat0_;
    let _e95 = u_xlat1_;
    gl_Position = ((_e91 * _e92.wwww) + _e95);
    let _e98 = in_COLOR0_1;
    u_xlat0_.x = (-(_e98.w) + 1f);
    let _e104 = u_xlat0_;
    let _e109 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e104.x + -(_e109.w));
    let _e116 = _v_buffer2_.v_cb2_[12];
    u_xlat2_ = (_e116.y * 1.01f);
    let _e121 = u_xlat2_;
    let _e122 = u_xlat0_;
    u_xlat0_.x = max(_e121, _e122.x);
    let _e128 = _v_buffer2_.v_cb2_[12];
    u_xlat2_ = ((_e128.z * 2f) + 1f);
    let _e134 = u_xlat0_;
    let _e136 = u_xlat2_;
    let _e141 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e134.x * _e136) + -(_e141.z));
    let _e145 = u_xlat0_;
    let _e147 = in_TEXCOORD0_1;
    let _e152 = _v_buffer2_.v_cb2_[1];
    let _e158 = _v_buffer2_.v_cb2_[1];
    let _e160 = ((_e147.xy * _e152.xy) + _e158.zw);
    u_xlat0_.x = _e160.x;
    u_xlat0_.y = _e160.y;
    let _e165 = u_xlat4_;
    let _e167 = u_xlat0_;
    let _e170 = u_xlat0_;
    let _e172 = (-(_e167.xy) + _e170.yx);
    u_xlat4_.x = _e172.x;
    u_xlat4_.y = _e172.y;
    let _e177 = vs_TEXCOORD0_;
    let _e182 = _v_buffer2_.v_cb2_[2];
    let _e184 = u_xlat4_;
    let _e187 = u_xlat0_;
    let _e189 = ((_e182.zz * _e184.xy) + _e187.xy);
    vs_TEXCOORD0_.x = _e189.x;
    vs_TEXCOORD0_.y = _e189.y;
    let _e195 = in_COLOR0_1;
    let _e200 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e195.w, _e200.x);
    let _e203 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e212 = u_xlat0_;
    let _e214 = in_COLOR0_1;
    let _e215 = _e214.xyz;
    u_xlat0_.x = _e215.x;
    u_xlat0_.y = _e215.y;
    u_xlat0_.z = _e215.z;
    u_xlat0_.w = 1f;
    let _e224 = u_xlat0_;
    let _e228 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e224 * _e228);
    let _e231 = u_xlat0_;
    let _e233 = u_xlat0_;
    u_xlat1_.x = max(_e231.y, _e233.x);
    let _e237 = u_xlat0_;
    let _e239 = u_xlat1_;
    u_xlat1_.x = max(_e237.z, _e239.x);
    let _e243 = u_xlat1_;
    u_xlat1_.x = ((_e243.x * 2f) + -1f);
    let _e251 = u_xlat1_;
    u_xlat1_.x = clamp(_e251.x, 0f, 1f);
    let _e257 = u_xlat1_;
    u_xlat1_.w = (-(_e257.x) + 1f);
    let _e262 = u_xlat1_;
    let _e264 = u_xlat0_;
    let _e266 = u_xlat0_;
    let _e268 = (_e264.xyz + _e266.xyz);
    u_xlat1_.x = _e268.x;
    u_xlat1_.y = _e268.y;
    u_xlat1_.z = _e268.z;
    let _e276 = u_xlat0_;
    let _e281 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e276.w * _e281.w);
    let _e284 = u_xlat0_;
    let _e286 = u_xlat1_;
    vs_COLOR0_ = (_e284.xxxx * _e286);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = vs_COLOR1_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
