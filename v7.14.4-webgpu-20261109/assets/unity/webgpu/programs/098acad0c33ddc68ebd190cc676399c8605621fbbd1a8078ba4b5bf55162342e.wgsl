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
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e34 = in_POSITION0_1;
    let _e39 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e34.yyyy * _e39);
    let _e44 = _v_buffer1_.v_cb1_[0];
    let _e45 = in_POSITION0_1;
    let _e48 = u_xlat0_;
    u_xlat0_ = ((_e44 * _e45.xxxx) + _e48);
    let _e53 = _v_buffer1_.v_cb1_[2];
    let _e54 = in_POSITION0_1;
    let _e57 = u_xlat0_;
    u_xlat0_ = ((_e53 * _e54.zzzz) + _e57);
    let _e59 = u_xlat0_;
    let _e63 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e59 + _e63);
    let _e69 = _v_buffer1_.v_cb1_[3];
    let _e71 = in_POSITION0_1;
    let _e74 = u_xlat0_;
    u_xlat0_.x = ((_e69.y * _e71.w) + _e74.y);
    let _e78 = u_xlat0_;
    let _e83 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e78.x + -(_e83.x));
    let _e87 = u_xlat0_;
    let _e92 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e87.x / _e92.w);
    let _e95 = u_xlat1_;
    let _e100 = _v_buffer0_.v_cb0_[80];
    u_xlat0_ = (_e95.yyyy * _e100);
    let _e105 = _v_buffer0_.v_cb0_[79];
    let _e106 = u_xlat1_;
    let _e109 = u_xlat0_;
    u_xlat0_ = ((_e105 * _e106.xxxx) + _e109);
    let _e114 = _v_buffer0_.v_cb0_[81];
    let _e115 = u_xlat1_;
    let _e118 = u_xlat0_;
    u_xlat0_ = ((_e114 * _e115.zzzz) + _e118);
    let _e124 = _v_buffer0_.v_cb0_[82];
    let _e125 = u_xlat1_;
    let _e128 = u_xlat0_;
    gl_Position = ((_e124 * _e125.wwww) + _e128);
    let _e130 = u_xlat0_;
    let _e132 = in_TEXCOORD0_1;
    let _e137 = _v_buffer2_.v_cb2_[4];
    let _e143 = _v_buffer2_.v_cb2_[4];
    let _e145 = ((_e132.xy * _e137.xy) + _e143.zw);
    u_xlat0_.x = _e145.x;
    u_xlat0_.y = _e145.y;
    let _e150 = u_xlat8_;
    let _e152 = u_xlat0_;
    let _e155 = u_xlat0_;
    let _e157 = (-(_e152.xy) + _e155.yx);
    u_xlat8_.x = _e157.x;
    u_xlat8_.y = _e157.y;
    let _e162 = u_xlat0_;
    let _e167 = _v_buffer2_.v_cb2_[6];
    let _e169 = u_xlat8_;
    let _e172 = u_xlat0_;
    let _e174 = ((_e167.yy * _e169.xy) + _e172.xy);
    u_xlat0_.x = _e174.x;
    u_xlat0_.y = _e174.y;
    let _e179 = u_xlat8_;
    let _e184 = _v_buffer0_.v_cb0_[15];
    let _e189 = _v_buffer2_.v_cb2_[5];
    let _e191 = (_e184.zz * _e189.xy);
    u_xlat8_.x = _e191.x;
    u_xlat8_.y = _e191.y;
    let _e196 = u_xlat8_;
    let _e198 = u_xlat8_;
    let _e200 = fract(_e198.xy);
    u_xlat8_.x = _e200.x;
    u_xlat8_.y = _e200.y;
    let _e205 = u_xlat0_;
    let _e207 = u_xlat8_;
    let _e209 = u_xlat0_;
    let _e211 = (_e207.xy + _e209.xy);
    u_xlat0_.x = _e211.x;
    u_xlat0_.y = _e211.y;
    let _e216 = u_xlat0_;
    let _e221 = _v_buffer2_.v_cb2_[4];
    let _e228 = u_xlat0_;
    let _e230 = ((-(_e221.xy) * vec2<f32>(0.5f, 0.5f)) + _e228.xy);
    u_xlat0_.x = _e230.x;
    u_xlat0_.y = _e230.y;
    let _e239 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e239.w * 0.017453289f);
    let _e247 = _v_buffer2_.v_cb2_[6];
    let _e252 = _v_buffer0_.v_cb0_[15];
    let _e255 = u_xlat8_;
    u_xlat8_.x = ((_e247.z * _e252.z) + -(_e255.x));
    let _e260 = u_xlat8_;
    u_xlat1_.x = sin(_e260.x);
    let _e263 = u_xlat8_;
    u_xlat2_ = cos(_e263.x);
    let _e267 = u_xlat1_;
    u_xlat3_.z = _e267.x;
    let _e270 = u_xlat2_;
    u_xlat3_.y = _e270;
    let _e272 = u_xlat1_;
    u_xlat3_.x = -(_e272.x);
    let _e276 = u_xlat0_;
    let _e278 = u_xlat3_;
    u_xlat8_.y = dot(_e276.xy, _e278.xy);
    let _e282 = u_xlat0_;
    let _e284 = u_xlat3_;
    u_xlat8_.x = dot(_e282.xy, _e284.yz);
    let _e287 = vs_TEXCOORD0_;
    let _e292 = _v_buffer2_.v_cb2_[4];
    let _e298 = u_xlat8_;
    let _e300 = ((_e292.xy * vec2<f32>(0.5f, 0.5f)) + _e298.xy);
    vs_TEXCOORD0_.z = _e300.x;
    vs_TEXCOORD0_.w = _e300.y;
    let _e305 = u_xlat0_;
    let _e307 = in_TEXCOORD0_1;
    let _e312 = _v_buffer2_.v_cb2_[1];
    let _e318 = _v_buffer2_.v_cb2_[1];
    let _e320 = ((_e307.xy * _e312.xy) + _e318.zw);
    u_xlat0_.x = _e320.x;
    u_xlat0_.y = _e320.y;
    let _e325 = u_xlat8_;
    let _e327 = u_xlat0_;
    let _e330 = u_xlat0_;
    let _e332 = (-(_e327.xy) + _e330.yx);
    u_xlat8_.x = _e332.x;
    u_xlat8_.y = _e332.y;
    let _e337 = u_xlat0_;
    let _e342 = _v_buffer2_.v_cb2_[2];
    let _e344 = u_xlat8_;
    let _e347 = u_xlat0_;
    let _e349 = ((_e342.zz * _e344.xy) + _e347.xy);
    u_xlat0_.x = _e349.x;
    u_xlat0_.y = _e349.y;
    let _e354 = u_xlat8_;
    let _e359 = _v_buffer0_.v_cb0_[15];
    let _e364 = _v_buffer2_.v_cb2_[11];
    let _e366 = (_e359.zz * _e364.yz);
    u_xlat8_.x = _e366.x;
    u_xlat8_.y = _e366.y;
    let _e371 = u_xlat8_;
    let _e373 = u_xlat8_;
    let _e375 = fract(_e373.xy);
    u_xlat8_.x = _e375.x;
    u_xlat8_.y = _e375.y;
    let _e380 = vs_TEXCOORD0_;
    let _e382 = u_xlat8_;
    let _e384 = u_xlat0_;
    let _e386 = (_e382.xy + _e384.xy);
    vs_TEXCOORD0_.x = _e386.x;
    vs_TEXCOORD0_.y = _e386.y;
    let _e391 = in_COLOR0_1;
    let _e395 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e391 * _e395);
    let _e398 = u_xlat0_;
    let _e400 = u_xlat0_;
    u_xlat1_.x = max(_e398.y, _e400.x);
    let _e404 = u_xlat0_;
    let _e406 = u_xlat1_;
    u_xlat1_.x = max(_e404.z, _e406.x);
    let _e410 = u_xlat1_;
    u_xlat1_.x = ((_e410.x * 2f) + -1f);
    let _e418 = u_xlat1_;
    u_xlat1_.x = clamp(_e418.x, 0f, 1f);
    let _e424 = u_xlat1_;
    u_xlat1_.w = (-(_e424.x) + 1f);
    let _e429 = u_xlat1_;
    let _e431 = u_xlat0_;
    let _e433 = u_xlat0_;
    let _e435 = (_e431.xyz + _e433.xyz);
    u_xlat1_.x = _e435.x;
    u_xlat1_.y = _e435.y;
    u_xlat1_.z = _e435.z;
    let _e443 = u_xlat0_;
    let _e448 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e443.w * _e448.w);
    let _e451 = u_xlat0_;
    let _e453 = u_xlat1_;
    vs_COLOR0_ = (_e451.xxxx * _e453);
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
