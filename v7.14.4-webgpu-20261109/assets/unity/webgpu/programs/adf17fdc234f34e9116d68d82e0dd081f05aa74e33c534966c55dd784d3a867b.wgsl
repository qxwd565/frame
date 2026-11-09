struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 12>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

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
    let _e92 = u_xlat0_;
    let _e94 = in_TEXCOORD0_1;
    let _e99 = _v_buffer2_.v_cb2_[1];
    let _e105 = _v_buffer2_.v_cb2_[1];
    let _e107 = ((_e94.xy * _e99.xy) + _e105.zw);
    u_xlat0_.x = _e107.x;
    u_xlat0_.y = _e107.y;
    let _e112 = u_xlat4_;
    let _e114 = u_xlat0_;
    let _e117 = u_xlat0_;
    let _e119 = (-(_e114.xy) + _e117.yx);
    u_xlat4_.x = _e119.x;
    u_xlat4_.y = _e119.y;
    let _e124 = u_xlat0_;
    let _e129 = _v_buffer2_.v_cb2_[2];
    let _e131 = u_xlat4_;
    let _e134 = u_xlat0_;
    let _e136 = ((_e129.zz * _e131.xy) + _e134.xy);
    u_xlat0_.x = _e136.x;
    u_xlat0_.y = _e136.y;
    let _e141 = u_xlat4_;
    let _e146 = _v_buffer0_.v_cb0_[15];
    let _e151 = _v_buffer2_.v_cb2_[11];
    let _e153 = (_e146.zz * _e151.yz);
    u_xlat4_.x = _e153.x;
    u_xlat4_.y = _e153.y;
    let _e158 = u_xlat4_;
    let _e160 = u_xlat4_;
    let _e162 = fract(_e160.xy);
    u_xlat4_.x = _e162.x;
    u_xlat4_.y = _e162.y;
    let _e167 = vs_TEXCOORD0_;
    let _e169 = u_xlat4_;
    let _e171 = u_xlat0_;
    let _e173 = (_e169.xy + _e171.xy);
    vs_TEXCOORD0_.x = _e173.x;
    vs_TEXCOORD0_.y = _e173.y;
    let _e178 = in_COLOR0_1;
    let _e182 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e178 * _e182);
    let _e185 = u_xlat0_;
    let _e187 = u_xlat0_;
    u_xlat1_.x = max(_e185.y, _e187.x);
    let _e191 = u_xlat0_;
    let _e193 = u_xlat1_;
    u_xlat1_.x = max(_e191.z, _e193.x);
    let _e197 = u_xlat1_;
    u_xlat1_.x = ((_e197.x * 2f) + -1f);
    let _e205 = u_xlat1_;
    u_xlat1_.x = clamp(_e205.x, 0f, 1f);
    let _e211 = u_xlat1_;
    u_xlat1_.w = (-(_e211.x) + 1f);
    let _e216 = u_xlat1_;
    let _e218 = u_xlat0_;
    let _e220 = u_xlat0_;
    let _e222 = (_e218.xyz + _e220.xyz);
    u_xlat1_.x = _e222.x;
    u_xlat1_.y = _e222.y;
    u_xlat1_.z = _e222.z;
    let _e230 = u_xlat0_;
    let _e235 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e230.w * _e235.w);
    let _e238 = u_xlat0_;
    let _e240 = u_xlat1_;
    vs_COLOR0_ = (_e238.xxxx * _e240);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e26 = vs_TEXCOORD0_;
    let _e28 = vs_COLOR0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
