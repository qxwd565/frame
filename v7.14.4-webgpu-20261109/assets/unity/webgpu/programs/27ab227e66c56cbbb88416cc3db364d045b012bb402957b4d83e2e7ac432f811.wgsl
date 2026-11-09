struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 3>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec2<f32>,
    @location(3) vs_TEXCOORD3_: vec2<f32>,
    @location(4) vs_TEXCOORD4_: vec2<f32>,
    @location(5) vs_TEXCOORD5_: vec2<f32>,
    @location(6) vs_TEXCOORD6_: vec2<f32>,
    @location(7) vs_TEXCOORD7_: vec2<f32>,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec2<f32>;
var<private> vs_TEXCOORD3_: vec2<f32>;
var<private> vs_TEXCOORD4_: vec2<f32>;
var<private> vs_TEXCOORD5_: vec2<f32>;
var<private> vs_TEXCOORD6_: vec2<f32>;
var<private> vs_TEXCOORD7_: vec2<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e27 = in_POSITION0_1;
    let _e32 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e27.yyyy * _e32);
    let _e37 = _v_buffer1_.v_cb1_[0];
    let _e38 = in_POSITION0_1;
    let _e41 = u_xlat0_;
    u_xlat0_ = ((_e37 * _e38.xxxx) + _e41);
    let _e46 = _v_buffer1_.v_cb1_[2];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.zzzz) + _e50);
    let _e52 = u_xlat0_;
    let _e56 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e52 + _e56);
    let _e58 = u_xlat0_;
    let _e63 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e58.yyyy * _e63);
    let _e68 = _v_buffer0_.v_cb0_[79];
    let _e69 = u_xlat0_;
    let _e72 = u_xlat1_;
    u_xlat1_ = ((_e68 * _e69.xxxx) + _e72);
    let _e77 = _v_buffer0_.v_cb0_[81];
    let _e78 = u_xlat0_;
    let _e81 = u_xlat1_;
    u_xlat1_ = ((_e77 * _e78.zzzz) + _e81);
    let _e87 = _v_buffer0_.v_cb0_[82];
    let _e88 = u_xlat0_;
    let _e91 = u_xlat1_;
    gl_Position = ((_e87 * _e88.wwww) + _e91);
    let _e93 = u_xlat0_;
    let _e95 = in_TEXCOORD0_1;
    let _e100 = _v_buffer2_.v_cb2_[2];
    let _e102 = (_e95.xy + _e100.xy);
    u_xlat0_.x = _e102.x;
    u_xlat0_.y = _e102.y;
    let _e107 = vs_TEXCOORD0_;
    let _e109 = u_xlat0_;
    let _e114 = _v_buffer2_.v_cb2_[0];
    let _e120 = _v_buffer2_.v_cb2_[0];
    let _e122 = ((_e109.xy * _e114.xy) + _e120.zw);
    vs_TEXCOORD0_.x = _e122.x;
    vs_TEXCOORD0_.y = _e122.y;
    let _e127 = u_xlat0_;
    let _e129 = in_TEXCOORD0_1;
    let _e134 = _v_buffer2_.v_cb2_[2];
    let _e137 = (_e129.xy + -(_e134.xy));
    u_xlat0_.z = _e137.x;
    u_xlat0_.w = _e137.y;
    let _e142 = vs_TEXCOORD1_;
    let _e144 = u_xlat0_;
    let _e149 = _v_buffer2_.v_cb2_[0];
    let _e155 = _v_buffer2_.v_cb2_[0];
    let _e157 = ((_e144.zw * _e149.xy) + _e155.zw);
    vs_TEXCOORD1_.x = _e157.x;
    vs_TEXCOORD1_.y = _e157.y;
    let _e162 = vs_TEXCOORD2_;
    let _e164 = u_xlat0_;
    let _e169 = _v_buffer2_.v_cb2_[0];
    let _e175 = _v_buffer2_.v_cb2_[0];
    let _e177 = ((_e164.xw * _e169.xy) + _e175.zw);
    vs_TEXCOORD2_.x = _e177.x;
    vs_TEXCOORD2_.y = _e177.y;
    let _e182 = vs_TEXCOORD3_;
    let _e184 = u_xlat0_;
    let _e189 = _v_buffer2_.v_cb2_[0];
    let _e195 = _v_buffer2_.v_cb2_[0];
    let _e197 = ((_e184.zy * _e189.xy) + _e195.zw);
    vs_TEXCOORD3_.x = _e197.x;
    vs_TEXCOORD3_.y = _e197.y;
    let _e202 = u_xlat1_;
    let _e204 = u_xlat0_;
    let _e205 = _e204.yw;
    u_xlat1_.y = _e205.x;
    u_xlat1_.w = _e205.y;
    let _e210 = u_xlat1_;
    let _e212 = in_TEXCOORD0_1;
    let _e213 = _e212.xx;
    u_xlat1_.x = _e213.x;
    u_xlat1_.z = _e213.y;
    let _e218 = vs_TEXCOORD4_;
    let _e220 = u_xlat1_;
    let _e225 = _v_buffer2_.v_cb2_[0];
    let _e231 = _v_buffer2_.v_cb2_[0];
    let _e233 = ((_e220.xy * _e225.xy) + _e231.zw);
    vs_TEXCOORD4_.x = _e233.x;
    vs_TEXCOORD4_.y = _e233.y;
    let _e238 = vs_TEXCOORD5_;
    let _e240 = u_xlat1_;
    let _e245 = _v_buffer2_.v_cb2_[0];
    let _e251 = _v_buffer2_.v_cb2_[0];
    let _e253 = ((_e240.zw * _e245.xy) + _e251.zw);
    vs_TEXCOORD5_.x = _e253.x;
    vs_TEXCOORD5_.y = _e253.y;
    let _e258 = u_xlat0_;
    let _e260 = in_TEXCOORD0_1;
    let _e261 = _e260.yy;
    u_xlat0_.y = _e261.x;
    u_xlat0_.w = _e261.y;
    let _e266 = vs_TEXCOORD6_;
    let _e268 = u_xlat0_;
    let _e273 = _v_buffer2_.v_cb2_[0];
    let _e279 = _v_buffer2_.v_cb2_[0];
    let _e281 = ((_e268.xy * _e273.xy) + _e279.zw);
    vs_TEXCOORD6_.x = _e281.x;
    vs_TEXCOORD6_.y = _e281.y;
    let _e286 = vs_TEXCOORD7_;
    let _e288 = u_xlat0_;
    let _e293 = _v_buffer2_.v_cb2_[0];
    let _e299 = _v_buffer2_.v_cb2_[0];
    let _e301 = ((_e288.zw * _e293.xy) + _e299.zw);
    vs_TEXCOORD7_.x = _e301.x;
    vs_TEXCOORD7_.y = _e301.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = vs_TEXCOORD2_;
    let _e40 = vs_TEXCOORD3_;
    let _e42 = vs_TEXCOORD4_;
    let _e44 = vs_TEXCOORD5_;
    let _e46 = vs_TEXCOORD6_;
    let _e48 = vs_TEXCOORD7_;
    let _e50 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42, _e44, _e46, _e48, _e50);
}
