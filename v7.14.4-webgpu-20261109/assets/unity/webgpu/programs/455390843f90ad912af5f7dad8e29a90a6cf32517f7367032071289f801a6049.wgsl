struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 13>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: f32,
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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e35 = in_POSITION0_1;
    let _e40 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e35.yyyy * _e40);
    let _e45 = _v_buffer1_.v_cb1_[0];
    let _e46 = in_POSITION0_1;
    let _e49 = u_xlat0_;
    u_xlat0_ = ((_e45 * _e46.xxxx) + _e49);
    let _e54 = _v_buffer1_.v_cb1_[2];
    let _e55 = in_POSITION0_1;
    let _e58 = u_xlat0_;
    u_xlat0_ = ((_e54 * _e55.zzzz) + _e58);
    let _e60 = u_xlat0_;
    let _e64 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e60 + _e64);
    let _e66 = u_xlat0_;
    let _e71 = _v_buffer1_.v_cb1_[3];
    let _e73 = in_POSITION0_1;
    let _e76 = u_xlat0_;
    let _e78 = ((_e71.xyz * _e73.www) + _e76.xyz);
    u_xlat0_.x = _e78.x;
    u_xlat0_.y = _e78.y;
    u_xlat0_.z = _e78.z;
    let _e85 = u_xlat1_;
    let _e90 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e85.yyyy * _e90);
    let _e95 = _v_buffer0_.v_cb0_[79];
    let _e96 = u_xlat1_;
    let _e99 = u_xlat2_;
    u_xlat2_ = ((_e95 * _e96.xxxx) + _e99);
    let _e104 = _v_buffer0_.v_cb0_[81];
    let _e105 = u_xlat1_;
    let _e108 = u_xlat2_;
    u_xlat2_ = ((_e104 * _e105.zzzz) + _e108);
    let _e114 = _v_buffer0_.v_cb0_[82];
    let _e115 = u_xlat1_;
    let _e118 = u_xlat2_;
    gl_Position = ((_e114 * _e115.wwww) + _e118);
    let _e120 = u_xlat0_;
    let _e122 = u_xlat0_;
    let _e127 = _v_buffer2_.v_cb2_[4];
    let _e133 = _v_buffer2_.v_cb2_[4];
    let _e135 = ((_e122.xz * _e127.xy) + _e133.zw);
    u_xlat0_.x = _e135.x;
    u_xlat0_.z = _e135.y;
    let _e141 = u_xlat0_;
    let _e146 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = (_e141.y + -(_e146.x));
    let _e150 = u_xlat3_;
    let _e155 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e150.x / _e155.w);
    let _e158 = u_xlat3_;
    let _e160 = u_xlat0_;
    let _e163 = u_xlat0_;
    let _e165 = (-(_e160.xz) + _e163.zx);
    u_xlat3_.x = _e165.x;
    u_xlat3_.z = _e165.y;
    let _e170 = u_xlat0_;
    let _e175 = _v_buffer2_.v_cb2_[6];
    let _e177 = u_xlat3_;
    let _e180 = u_xlat0_;
    let _e182 = ((_e175.yy * _e177.xz) + _e180.xz);
    u_xlat0_.x = _e182.x;
    u_xlat0_.y = _e182.y;
    let _e187 = u_xlat6_;
    let _e192 = _v_buffer0_.v_cb0_[15];
    let _e197 = _v_buffer2_.v_cb2_[5];
    let _e199 = (_e192.zz * _e197.xy);
    u_xlat6_.x = _e199.x;
    u_xlat6_.y = _e199.y;
    let _e204 = u_xlat6_;
    let _e206 = u_xlat6_;
    let _e208 = fract(_e206.xy);
    u_xlat6_.x = _e208.x;
    u_xlat6_.y = _e208.y;
    let _e213 = vs_TEXCOORD0_;
    let _e215 = u_xlat6_;
    let _e217 = u_xlat0_;
    let _e219 = (_e215.xy + _e217.xy);
    vs_TEXCOORD0_.z = _e219.x;
    vs_TEXCOORD0_.w = _e219.y;
    let _e224 = u_xlat0_;
    let _e226 = in_TEXCOORD0_1;
    let _e231 = _v_buffer2_.v_cb2_[1];
    let _e237 = _v_buffer2_.v_cb2_[1];
    let _e239 = ((_e226.xy * _e231.xy) + _e237.zw);
    u_xlat0_.x = _e239.x;
    u_xlat0_.y = _e239.y;
    let _e244 = u_xlat6_;
    let _e246 = u_xlat0_;
    let _e249 = u_xlat0_;
    let _e251 = (-(_e246.xy) + _e249.yx);
    u_xlat6_.x = _e251.x;
    u_xlat6_.y = _e251.y;
    let _e256 = vs_TEXCOORD0_;
    let _e261 = _v_buffer2_.v_cb2_[2];
    let _e263 = u_xlat6_;
    let _e266 = u_xlat0_;
    let _e268 = ((_e261.zz * _e263.xy) + _e266.xy);
    vs_TEXCOORD0_.x = _e268.x;
    vs_TEXCOORD0_.y = _e268.y;
    let _e273 = in_COLOR0_1;
    let _e277 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e273 * _e277);
    let _e280 = u_xlat0_;
    let _e282 = u_xlat0_;
    u_xlat1_.x = max(_e280.y, _e282.x);
    let _e286 = u_xlat0_;
    let _e288 = u_xlat1_;
    u_xlat1_.x = max(_e286.z, _e288.x);
    let _e292 = u_xlat1_;
    u_xlat1_.x = ((_e292.x * 2f) + -1f);
    let _e300 = u_xlat1_;
    u_xlat1_.x = clamp(_e300.x, 0f, 1f);
    let _e306 = u_xlat1_;
    u_xlat1_.w = (-(_e306.x) + 1f);
    let _e311 = u_xlat1_;
    let _e313 = u_xlat0_;
    let _e315 = u_xlat0_;
    let _e317 = (_e313.xyz + _e315.xyz);
    u_xlat1_.x = _e317.x;
    u_xlat1_.y = _e317.y;
    u_xlat1_.z = _e317.z;
    let _e325 = u_xlat0_;
    let _e330 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e325.w * _e330.w);
    let _e333 = u_xlat0_;
    let _e335 = u_xlat1_;
    vs_COLOR0_ = (_e333.xxxx * _e335);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_COLOR0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
