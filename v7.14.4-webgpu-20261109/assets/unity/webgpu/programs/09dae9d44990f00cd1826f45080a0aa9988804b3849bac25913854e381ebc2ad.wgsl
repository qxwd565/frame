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
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e200 = in_COLOR0_1;
    let _e205 = _v_buffer2_.v_cb2_[13];
    u_xlat0_.w = max(_e200.w, _e205.x);
    let _e208 = u_xlat0_;
    let _e210 = in_COLOR0_1;
    let _e211 = _e210.xyz;
    u_xlat0_.x = _e211.x;
    u_xlat0_.y = _e211.y;
    u_xlat0_.z = _e211.z;
    let _e218 = u_xlat0_;
    let _e222 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e218 * _e222);
    let _e225 = u_xlat0_;
    let _e227 = u_xlat0_;
    u_xlat1_.x = max(_e225.y, _e227.x);
    let _e231 = u_xlat0_;
    let _e233 = u_xlat1_;
    u_xlat1_.x = max(_e231.z, _e233.x);
    let _e237 = u_xlat1_;
    u_xlat1_.x = ((_e237.x * 2f) + -1f);
    let _e245 = u_xlat1_;
    u_xlat1_.x = clamp(_e245.x, 0f, 1f);
    let _e251 = u_xlat1_;
    u_xlat1_.w = (-(_e251.x) + 1f);
    let _e256 = u_xlat1_;
    let _e258 = u_xlat0_;
    let _e260 = u_xlat0_;
    let _e262 = (_e258.xyz + _e260.xyz);
    u_xlat1_.x = _e262.x;
    u_xlat1_.y = _e262.y;
    u_xlat1_.z = _e262.z;
    let _e270 = u_xlat0_;
    let _e275 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e270.w * _e275.w);
    let _e278 = u_xlat0_;
    let _e280 = u_xlat1_;
    vs_COLOR0_ = (_e278.xxxx * _e280);
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
