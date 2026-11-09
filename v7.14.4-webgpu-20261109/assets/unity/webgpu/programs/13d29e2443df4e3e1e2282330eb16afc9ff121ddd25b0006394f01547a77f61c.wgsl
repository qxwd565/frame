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
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: f32,
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
var<private> vs_COLOR0_: vec4<f32>;
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
    let _e134 = _v_buffer2_.v_cb2_[1];
    let _e140 = _v_buffer2_.v_cb2_[1];
    let _e142 = ((_e129.xy * _e134.xy) + _e140.zw);
    u_xlat0_.x = _e142.x;
    u_xlat0_.y = _e142.y;
    let _e147 = u_xlat4_;
    let _e149 = u_xlat0_;
    let _e152 = u_xlat0_;
    let _e154 = (-(_e149.xy) + _e152.yx);
    u_xlat4_.x = _e154.x;
    u_xlat4_.y = _e154.y;
    let _e159 = vs_TEXCOORD0_;
    let _e164 = _v_buffer2_.v_cb2_[2];
    let _e166 = u_xlat4_;
    let _e169 = u_xlat0_;
    let _e171 = ((_e164.zz * _e166.xy) + _e169.xy);
    vs_TEXCOORD0_.x = _e171.x;
    vs_TEXCOORD0_.y = _e171.y;
    let _e176 = u_xlat0_;
    let _e181 = _v_buffer2_.v_cb2_[19];
    let _e187 = _v_buffer2_.v_cb2_[19];
    let _e189 = (-(_e181.xz) + _e187.yw);
    u_xlat0_.x = _e189.x;
    u_xlat0_.y = _e189.y;
    let _e194 = u_xlat4_;
    let _e196 = in_TEXCOORD0_1;
    let _e201 = _v_buffer2_.v_cb2_[18];
    let _e207 = _v_buffer2_.v_cb2_[18];
    let _e209 = ((_e196.xy * _e201.xy) + _e207.zw);
    u_xlat4_.x = _e209.x;
    u_xlat4_.y = _e209.y;
    let _e214 = u_xlat0_;
    let _e216 = u_xlat4_;
    let _e218 = u_xlat0_;
    let _e224 = _v_buffer2_.v_cb2_[19];
    let _e226 = ((_e216.xx * _e218.xy) + _e224.xz);
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    let _e232 = u_xlat0_;
    let _e235 = u_xlat0_;
    u_xlat2_.x = (-(_e232.x) + _e235.y);
    let _e239 = u_xlat4_;
    let _e241 = u_xlat2_;
    let _e244 = u_xlat0_;
    u_xlat0_.x = ((_e239.y * _e241.x) + _e244.x);
    let _e247 = u_xlat2_;
    let _e249 = u_xlat4_;
    let _e260 = ((_e249.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e260.x;
    u_xlat2_.y = _e260.y;
    let _e266 = u_xlat2_;
    let _e268 = u_xlat2_;
    u_xlat2_.x = dot(_e266.xy, _e268.xy);
    let _e272 = u_xlat2_;
    u_xlat2_.x = (-(_e272.x) + 1f);
    let _e278 = u_xlat2_;
    let _e283 = _v_buffer2_.v_cb2_[17];
    u_xlat2_.x = (_e278.x * _e283.x);
    let _e287 = u_xlat2_;
    u_xlat2_.x = clamp(_e287.x, 0f, 1f);
    let _e293 = u_xlat0_;
    let _e295 = u_xlat2_;
    u_xlat0_.x = (_e293.x * _e295.x);
    let _e299 = u_xlat0_;
    u_xlat0_.x = clamp(_e299.x, 0f, 1f);
    let _e305 = u_xlat0_;
    let _e307 = in_COLOR0_1;
    u_xlat0_.w = (_e305.x * _e307.w);
    let _e310 = u_xlat0_;
    let _e312 = in_COLOR0_1;
    let _e313 = _e312.xyz;
    u_xlat0_.x = _e313.x;
    u_xlat0_.y = _e313.y;
    u_xlat0_.z = _e313.z;
    let _e320 = u_xlat0_;
    let _e324 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e320 * _e324);
    let _e327 = u_xlat0_;
    let _e329 = u_xlat0_;
    u_xlat1_.x = max(_e327.y, _e329.x);
    let _e333 = u_xlat0_;
    let _e335 = u_xlat1_;
    u_xlat1_.x = max(_e333.z, _e335.x);
    let _e339 = u_xlat1_;
    u_xlat1_.x = ((_e339.x * 2f) + -1f);
    let _e347 = u_xlat1_;
    u_xlat1_.x = clamp(_e347.x, 0f, 1f);
    let _e353 = u_xlat1_;
    u_xlat1_.w = (-(_e353.x) + 1f);
    let _e358 = u_xlat1_;
    let _e360 = u_xlat0_;
    let _e362 = u_xlat0_;
    let _e364 = (_e360.xyz + _e362.xyz);
    u_xlat1_.x = _e364.x;
    u_xlat1_.y = _e364.y;
    u_xlat1_.z = _e364.z;
    let _e372 = u_xlat0_;
    let _e377 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e372.w * _e377.w);
    let _e380 = u_xlat0_;
    let _e382 = u_xlat1_;
    vs_COLOR0_ = (_e380.xxxx * _e382);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
