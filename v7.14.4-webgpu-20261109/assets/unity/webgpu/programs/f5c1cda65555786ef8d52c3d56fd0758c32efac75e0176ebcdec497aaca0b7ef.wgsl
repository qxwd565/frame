struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 9>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

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
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer1_.v_cb1_[3];
    let _e69 = in_POSITION0_1;
    let _e72 = u_xlat0_;
    let _e74 = ((_e67.xz * _e69.ww) + _e72.xz);
    u_xlat0_.x = _e74.x;
    u_xlat0_.y = _e74.y;
    let _e79 = u_xlat0_;
    let _e81 = u_xlat0_;
    let _e86 = _v_buffer2_.v_cb2_[4];
    let _e92 = _v_buffer2_.v_cb2_[4];
    let _e94 = ((_e81.xy * _e86.xy) + _e92.zw);
    u_xlat0_.x = _e94.x;
    u_xlat0_.y = _e94.y;
    let _e99 = u_xlat1_;
    let _e104 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e99.yyyy * _e104);
    let _e109 = _v_buffer0_.v_cb0_[79];
    let _e110 = u_xlat1_;
    let _e113 = u_xlat2_;
    u_xlat2_ = ((_e109 * _e110.xxxx) + _e113);
    let _e118 = _v_buffer0_.v_cb0_[81];
    let _e119 = u_xlat1_;
    let _e122 = u_xlat2_;
    u_xlat2_ = ((_e118 * _e119.zzzz) + _e122);
    let _e128 = _v_buffer0_.v_cb0_[82];
    let _e129 = u_xlat1_;
    let _e132 = u_xlat2_;
    gl_Position = ((_e128 * _e129.wwww) + _e132);
    let _e134 = u_xlat6_;
    let _e136 = u_xlat0_;
    let _e139 = u_xlat0_;
    let _e141 = (-(_e136.xy) + _e139.yx);
    u_xlat6_.x = _e141.x;
    u_xlat6_.y = _e141.y;
    let _e146 = u_xlat0_;
    let _e151 = _v_buffer2_.v_cb2_[6];
    let _e153 = u_xlat6_;
    let _e156 = u_xlat0_;
    let _e158 = ((_e151.yy * _e153.xy) + _e156.xy);
    u_xlat0_.x = _e158.x;
    u_xlat0_.y = _e158.y;
    let _e163 = u_xlat6_;
    let _e168 = _v_buffer0_.v_cb0_[15];
    let _e173 = _v_buffer2_.v_cb2_[5];
    let _e175 = (_e168.zz * _e173.xy);
    u_xlat6_.x = _e175.x;
    u_xlat6_.y = _e175.y;
    let _e180 = u_xlat6_;
    let _e182 = u_xlat6_;
    let _e184 = fract(_e182.xy);
    u_xlat6_.x = _e184.x;
    u_xlat6_.y = _e184.y;
    let _e189 = vs_TEXCOORD0_;
    let _e191 = u_xlat6_;
    let _e193 = u_xlat0_;
    let _e195 = (_e191.xy + _e193.xy);
    vs_TEXCOORD0_.z = _e195.x;
    vs_TEXCOORD0_.w = _e195.y;
    let _e200 = u_xlat0_;
    let _e202 = in_TEXCOORD0_1;
    let _e207 = _v_buffer2_.v_cb2_[1];
    let _e213 = _v_buffer2_.v_cb2_[1];
    let _e215 = ((_e202.xy * _e207.xy) + _e213.zw);
    u_xlat0_.x = _e215.x;
    u_xlat0_.y = _e215.y;
    let _e220 = u_xlat6_;
    let _e222 = u_xlat0_;
    let _e225 = u_xlat0_;
    let _e227 = (-(_e222.xy) + _e225.yx);
    u_xlat6_.x = _e227.x;
    u_xlat6_.y = _e227.y;
    let _e232 = vs_TEXCOORD0_;
    let _e237 = _v_buffer2_.v_cb2_[2];
    let _e239 = u_xlat6_;
    let _e242 = u_xlat0_;
    let _e244 = ((_e237.zz * _e239.xy) + _e242.xy);
    vs_TEXCOORD0_.x = _e244.x;
    vs_TEXCOORD0_.y = _e244.y;
    let _e249 = in_COLOR0_1;
    let _e253 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e249 * _e253);
    let _e256 = u_xlat0_;
    let _e258 = u_xlat0_;
    u_xlat1_.x = max(_e256.y, _e258.x);
    let _e262 = u_xlat0_;
    let _e264 = u_xlat1_;
    u_xlat1_.x = max(_e262.z, _e264.x);
    let _e268 = u_xlat1_;
    u_xlat1_.x = ((_e268.x * 2f) + -1f);
    let _e276 = u_xlat1_;
    u_xlat1_.x = clamp(_e276.x, 0f, 1f);
    let _e282 = u_xlat1_;
    u_xlat1_.w = (-(_e282.x) + 1f);
    let _e287 = u_xlat0_;
    let _e289 = u_xlat0_;
    let _e291 = u_xlat0_;
    let _e293 = (_e289.xyz + _e291.xyz);
    u_xlat0_.x = _e293.x;
    u_xlat0_.y = _e293.y;
    u_xlat0_.z = _e293.z;
    let _e300 = u_xlat1_;
    let _e302 = u_xlat0_;
    let _e307 = _v_buffer2_.v_cb2_[8];
    let _e309 = (_e302.xyz * _e307.xxx);
    u_xlat1_.x = _e309.x;
    u_xlat1_.y = _e309.y;
    u_xlat1_.z = _e309.z;
    let _e316 = u_xlat0_;
    let _e318 = u_xlat1_;
    vs_COLOR1_ = (_e316.wwww * _e318);
    let _e320 = in_COLOR0_1;
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
    let _e30 = vs_COLOR1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
