struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 20>,
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
    var u_xlat2_: vec2<f32> = vec2(0f);
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
    u_xlat1_ = (_e56 + _e60);
    let _e66 = _v_buffer1_.v_cb1_[3];
    let _e68 = in_POSITION0_1;
    let _e71 = u_xlat0_;
    u_xlat0_.x = ((_e66.y * _e68.w) + _e71.y);
    let _e75 = u_xlat0_;
    let _e80 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e75.x + -(_e80.x));
    let _e84 = u_xlat0_;
    let _e89 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e84.x / _e89.w);
    let _e92 = u_xlat1_;
    let _e97 = _v_buffer0_.v_cb0_[80];
    u_xlat0_ = (_e92.yyyy * _e97);
    let _e102 = _v_buffer0_.v_cb0_[79];
    let _e103 = u_xlat1_;
    let _e106 = u_xlat0_;
    u_xlat0_ = ((_e102 * _e103.xxxx) + _e106);
    let _e111 = _v_buffer0_.v_cb0_[81];
    let _e112 = u_xlat1_;
    let _e115 = u_xlat0_;
    u_xlat0_ = ((_e111 * _e112.zzzz) + _e115);
    let _e121 = _v_buffer0_.v_cb0_[82];
    let _e122 = u_xlat1_;
    let _e125 = u_xlat0_;
    gl_Position = ((_e121 * _e122.wwww) + _e125);
    let _e127 = u_xlat0_;
    let _e129 = in_TEXCOORD0_1;
    let _e134 = _v_buffer2_.v_cb2_[4];
    let _e140 = _v_buffer2_.v_cb2_[4];
    let _e142 = ((_e129.xy * _e134.xy) + _e140.zw);
    u_xlat0_.x = _e142.x;
    u_xlat0_.y = _e142.y;
    let _e147 = u_xlat4_;
    let _e149 = u_xlat0_;
    let _e152 = u_xlat0_;
    let _e154 = (-(_e149.xy) + _e152.yx);
    u_xlat4_.x = _e154.x;
    u_xlat4_.y = _e154.y;
    let _e159 = u_xlat0_;
    let _e164 = _v_buffer2_.v_cb2_[6];
    let _e166 = u_xlat4_;
    let _e169 = u_xlat0_;
    let _e171 = ((_e164.yy * _e166.xy) + _e169.xy);
    u_xlat0_.x = _e171.x;
    u_xlat0_.y = _e171.y;
    let _e176 = u_xlat4_;
    let _e181 = _v_buffer0_.v_cb0_[15];
    let _e186 = _v_buffer2_.v_cb2_[5];
    let _e188 = (_e181.zz * _e186.xy);
    u_xlat4_.x = _e188.x;
    u_xlat4_.y = _e188.y;
    let _e193 = u_xlat4_;
    let _e195 = u_xlat4_;
    let _e197 = fract(_e195.xy);
    u_xlat4_.x = _e197.x;
    u_xlat4_.y = _e197.y;
    let _e202 = vs_TEXCOORD0_;
    let _e204 = u_xlat4_;
    let _e206 = u_xlat0_;
    let _e208 = (_e204.xy + _e206.xy);
    vs_TEXCOORD0_.z = _e208.x;
    vs_TEXCOORD0_.w = _e208.y;
    let _e213 = u_xlat0_;
    let _e215 = in_TEXCOORD0_1;
    let _e220 = _v_buffer2_.v_cb2_[1];
    let _e226 = _v_buffer2_.v_cb2_[1];
    let _e228 = ((_e215.xy * _e220.xy) + _e226.zw);
    u_xlat0_.x = _e228.x;
    u_xlat0_.y = _e228.y;
    let _e233 = u_xlat4_;
    let _e235 = u_xlat0_;
    let _e238 = u_xlat0_;
    let _e240 = (-(_e235.xy) + _e238.yx);
    u_xlat4_.x = _e240.x;
    u_xlat4_.y = _e240.y;
    let _e245 = vs_TEXCOORD0_;
    let _e250 = _v_buffer2_.v_cb2_[2];
    let _e252 = u_xlat4_;
    let _e255 = u_xlat0_;
    let _e257 = ((_e250.zz * _e252.xy) + _e255.xy);
    vs_TEXCOORD0_.x = _e257.x;
    vs_TEXCOORD0_.y = _e257.y;
    let _e262 = u_xlat0_;
    let _e267 = _v_buffer2_.v_cb2_[19];
    let _e273 = _v_buffer2_.v_cb2_[19];
    let _e275 = (-(_e267.xz) + _e273.yw);
    u_xlat0_.x = _e275.x;
    u_xlat0_.y = _e275.y;
    let _e280 = u_xlat4_;
    let _e282 = in_TEXCOORD0_1;
    let _e287 = _v_buffer2_.v_cb2_[18];
    let _e293 = _v_buffer2_.v_cb2_[18];
    let _e295 = ((_e282.xy * _e287.xy) + _e293.zw);
    u_xlat4_.x = _e295.x;
    u_xlat4_.y = _e295.y;
    let _e300 = u_xlat0_;
    let _e302 = u_xlat4_;
    let _e304 = u_xlat0_;
    let _e310 = _v_buffer2_.v_cb2_[19];
    let _e312 = ((_e302.xx * _e304.xy) + _e310.xz);
    u_xlat0_.x = _e312.x;
    u_xlat0_.y = _e312.y;
    let _e318 = u_xlat0_;
    let _e321 = u_xlat0_;
    u_xlat2_.x = (-(_e318.x) + _e321.y);
    let _e325 = u_xlat4_;
    let _e327 = u_xlat2_;
    let _e330 = u_xlat0_;
    u_xlat0_.x = ((_e325.y * _e327.x) + _e330.x);
    let _e333 = u_xlat2_;
    let _e335 = u_xlat4_;
    let _e346 = ((_e335.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e346.x;
    u_xlat2_.y = _e346.y;
    let _e352 = u_xlat2_;
    let _e354 = u_xlat2_;
    u_xlat2_.x = dot(_e352.xy, _e354.xy);
    let _e358 = u_xlat2_;
    u_xlat2_.x = (-(_e358.x) + 1f);
    let _e364 = u_xlat2_;
    let _e369 = _v_buffer2_.v_cb2_[17];
    u_xlat2_.x = (_e364.x * _e369.x);
    let _e373 = u_xlat2_;
    u_xlat2_.x = clamp(_e373.x, 0f, 1f);
    let _e379 = u_xlat0_;
    let _e381 = u_xlat2_;
    u_xlat0_.x = (_e379.x * _e381.x);
    let _e385 = u_xlat0_;
    u_xlat0_.x = clamp(_e385.x, 0f, 1f);
    let _e391 = u_xlat0_;
    let _e393 = in_COLOR0_1;
    u_xlat0_.w = (_e391.x * _e393.w);
    let _e396 = u_xlat0_;
    let _e398 = in_COLOR0_1;
    let _e399 = _e398.xyz;
    u_xlat0_.x = _e399.x;
    u_xlat0_.y = _e399.y;
    u_xlat0_.z = _e399.z;
    let _e406 = u_xlat0_;
    let _e410 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e406 * _e410);
    let _e413 = u_xlat0_;
    let _e415 = u_xlat0_;
    u_xlat1_.x = max(_e413.y, _e415.x);
    let _e419 = u_xlat0_;
    let _e421 = u_xlat1_;
    u_xlat1_.x = max(_e419.z, _e421.x);
    let _e425 = u_xlat1_;
    u_xlat1_.x = ((_e425.x * 2f) + -1f);
    let _e433 = u_xlat1_;
    u_xlat1_.x = clamp(_e433.x, 0f, 1f);
    let _e439 = u_xlat1_;
    u_xlat1_.w = (-(_e439.x) + 1f);
    let _e444 = u_xlat1_;
    let _e446 = u_xlat0_;
    let _e448 = u_xlat0_;
    let _e450 = (_e446.xyz + _e448.xyz);
    u_xlat1_.x = _e450.x;
    u_xlat1_.y = _e450.y;
    u_xlat1_.z = _e450.z;
    let _e458 = u_xlat0_;
    let _e463 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e458.w * _e463.w);
    let _e466 = u_xlat0_;
    let _e468 = u_xlat1_;
    vs_COLOR0_ = (_e466.xxxx * _e468);
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
