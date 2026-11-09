struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct VertexOutput {
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
    @location(2) vs_TEXCOORD2_: vec4<f32>,
    @location(3) vs_TEXCOORD3_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> vs_TEXCOORD2_: vec4<f32>;
var<private> vs_TEXCOORD3_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e29 = in_POSITION0_1;
    let _e34 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e29.yyyy * _e34);
    let _e39 = _v_buffer1_.v_cb1_[0];
    let _e40 = in_POSITION0_1;
    let _e43 = u_xlat0_;
    u_xlat0_ = ((_e39 * _e40.xxxx) + _e43);
    let _e48 = _v_buffer1_.v_cb1_[2];
    let _e49 = in_POSITION0_1;
    let _e52 = u_xlat0_;
    u_xlat0_ = ((_e48 * _e49.zzzz) + _e52);
    let _e54 = u_xlat0_;
    let _e58 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e54 + _e58);
    let _e60 = u_xlat0_;
    let _e65 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e60.yyyy * _e65);
    let _e70 = _v_buffer0_.v_cb0_[79];
    let _e71 = u_xlat0_;
    let _e74 = u_xlat1_;
    u_xlat1_ = ((_e70 * _e71.xxxx) + _e74);
    let _e79 = _v_buffer0_.v_cb0_[81];
    let _e80 = u_xlat0_;
    let _e83 = u_xlat1_;
    u_xlat1_ = ((_e79 * _e80.zzzz) + _e83);
    let _e89 = _v_buffer0_.v_cb0_[82];
    let _e90 = u_xlat0_;
    let _e93 = u_xlat1_;
    gl_Position = ((_e89 * _e90.wwww) + _e93);
    let _e95 = in_COLOR0_1;
    let _e99 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e95 * _e99);
    let _e101 = u_xlat0_;
    let _e106 = _v_buffer2_.v_cb2_[3];
    let _e112 = in_TEXCOORD0_1;
    let _e114 = ((_e106.xy * vec2<f32>(0.6f, 0.6f)) + _e112.xy);
    u_xlat0_.x = _e114.x;
    u_xlat0_.y = _e114.y;
    let _e119 = vs_TEXCOORD0_;
    let _e121 = u_xlat0_;
    let _e126 = _v_buffer2_.v_cb2_[0];
    let _e132 = _v_buffer2_.v_cb2_[0];
    let _e134 = ((_e121.xy * _e126.xy) + _e132.zw);
    vs_TEXCOORD0_.x = _e134.x;
    vs_TEXCOORD0_.y = _e134.y;
    let _e139 = u_xlat0_;
    let _e144 = _v_buffer2_.v_cb2_[3];
    let _e151 = in_TEXCOORD0_1;
    let _e153 = ((-(_e144.xy) * vec2<f32>(0.6f, 0.6f)) + _e151.xy);
    u_xlat0_.z = _e153.x;
    u_xlat0_.w = _e153.y;
    let _e158 = vs_TEXCOORD0_;
    let _e160 = u_xlat0_;
    let _e165 = _v_buffer2_.v_cb2_[0];
    let _e171 = _v_buffer2_.v_cb2_[0];
    let _e173 = ((_e160.zw * _e165.xy) + _e171.zw);
    vs_TEXCOORD0_.z = _e173.x;
    vs_TEXCOORD0_.w = _e173.y;
    let _e178 = vs_TEXCOORD1_;
    let _e180 = u_xlat0_;
    let _e185 = _v_buffer2_.v_cb2_[0];
    let _e191 = _v_buffer2_.v_cb2_[0];
    let _e193 = ((_e180.xw * _e185.xy) + _e191.zw);
    vs_TEXCOORD1_.x = _e193.x;
    vs_TEXCOORD1_.y = _e193.y;
    let _e198 = vs_TEXCOORD1_;
    let _e200 = u_xlat0_;
    let _e205 = _v_buffer2_.v_cb2_[0];
    let _e211 = _v_buffer2_.v_cb2_[0];
    let _e213 = ((_e200.zy * _e205.xy) + _e211.zw);
    vs_TEXCOORD1_.z = _e213.x;
    vs_TEXCOORD1_.w = _e213.y;
    let _e219 = in_TEXCOORD0_1;
    let _e224 = _v_buffer2_.v_cb2_[3];
    u_xlat4_.y = (_e219.y + -(_e224.y));
    let _e229 = in_TEXCOORD0_1;
    u_xlat4_.x = _e229.x;
    let _e231 = vs_TEXCOORD2_;
    let _e233 = u_xlat4_;
    let _e238 = _v_buffer2_.v_cb2_[0];
    let _e244 = _v_buffer2_.v_cb2_[0];
    let _e246 = ((_e233.xy * _e238.xy) + _e244.zw);
    vs_TEXCOORD2_.z = _e246.x;
    vs_TEXCOORD2_.w = _e246.y;
    let _e251 = u_xlat0_;
    let _e253 = in_TEXCOORD0_1;
    let _e258 = _v_buffer2_.v_cb2_[3];
    let _e260 = (_e253.yx + _e258.yx);
    u_xlat0_.x = _e260.x;
    u_xlat0_.y = _e260.y;
    let _e265 = u_xlat0_;
    let _e267 = in_TEXCOORD0_1;
    let _e268 = _e267.xy;
    u_xlat0_.z = _e268.x;
    u_xlat0_.w = _e268.y;
    let _e273 = vs_TEXCOORD2_;
    let _e275 = u_xlat0_;
    let _e280 = _v_buffer2_.v_cb2_[0];
    let _e286 = _v_buffer2_.v_cb2_[0];
    let _e288 = ((_e275.zx * _e280.xy) + _e286.zw);
    vs_TEXCOORD2_.x = _e288.x;
    vs_TEXCOORD2_.y = _e288.y;
    let _e293 = vs_TEXCOORD3_;
    let _e295 = u_xlat0_;
    let _e300 = _v_buffer2_.v_cb2_[0];
    let _e306 = _v_buffer2_.v_cb2_[0];
    let _e308 = ((_e295.yw * _e300.xy) + _e306.zw);
    vs_TEXCOORD3_.x = _e308.x;
    vs_TEXCOORD3_.y = _e308.y;
    let _e313 = vs_TEXCOORD3_;
    let _e315 = in_TEXCOORD0_1;
    let _e320 = _v_buffer2_.v_cb2_[0];
    let _e326 = _v_buffer2_.v_cb2_[0];
    let _e328 = ((_e315.xy * _e320.xy) + _e326.zw);
    vs_TEXCOORD3_.z = _e328.x;
    vs_TEXCOORD3_.w = _e328.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_COLOR0_1 = in_COLOR0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e32 = vs_COLOR0_;
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = vs_TEXCOORD2_;
    let _e40 = vs_TEXCOORD3_;
    let _e42 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38, _e40, _e42);
}
