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
    var u_xlat2_: vec2<f32> = vec2(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e30 = in_POSITION0_1;
    let _e35 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e30.yyyy * _e35);
    let _e40 = _v_buffer1_.v_cb1_[0];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    u_xlat0_ = ((_e40 * _e41.xxxx) + _e44);
    let _e49 = _v_buffer1_.v_cb1_[2];
    let _e50 = in_POSITION0_1;
    let _e53 = u_xlat0_;
    u_xlat0_ = ((_e49 * _e50.zzzz) + _e53);
    let _e55 = u_xlat0_;
    let _e59 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e55 + _e59);
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e61.yyyy * _e66);
    let _e71 = _v_buffer0_.v_cb0_[79];
    let _e72 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_ = ((_e71 * _e72.xxxx) + _e75);
    let _e80 = _v_buffer0_.v_cb0_[81];
    let _e81 = u_xlat0_;
    let _e84 = u_xlat1_;
    u_xlat1_ = ((_e80 * _e81.zzzz) + _e84);
    let _e90 = _v_buffer0_.v_cb0_[82];
    let _e91 = u_xlat0_;
    let _e94 = u_xlat1_;
    gl_Position = ((_e90 * _e91.wwww) + _e94);
    let _e96 = u_xlat0_;
    let _e98 = in_TEXCOORD0_1;
    let _e103 = _v_buffer2_.v_cb2_[1];
    let _e109 = _v_buffer2_.v_cb2_[1];
    let _e111 = ((_e98.xy * _e103.xy) + _e109.zw);
    u_xlat0_.x = _e111.x;
    u_xlat0_.y = _e111.y;
    let _e116 = u_xlat4_;
    let _e118 = u_xlat0_;
    let _e121 = u_xlat0_;
    let _e123 = (-(_e118.xy) + _e121.yx);
    u_xlat4_.x = _e123.x;
    u_xlat4_.y = _e123.y;
    let _e128 = u_xlat0_;
    let _e133 = _v_buffer2_.v_cb2_[2];
    let _e135 = u_xlat4_;
    let _e138 = u_xlat0_;
    let _e140 = ((_e133.zz * _e135.xy) + _e138.xy);
    u_xlat0_.x = _e140.x;
    u_xlat0_.y = _e140.y;
    let _e145 = u_xlat4_;
    let _e150 = _v_buffer0_.v_cb0_[15];
    let _e155 = _v_buffer2_.v_cb2_[11];
    let _e157 = (_e150.zz * _e155.yz);
    u_xlat4_.x = _e157.x;
    u_xlat4_.y = _e157.y;
    let _e162 = u_xlat4_;
    let _e164 = u_xlat4_;
    let _e166 = fract(_e164.xy);
    u_xlat4_.x = _e166.x;
    u_xlat4_.y = _e166.y;
    let _e171 = vs_TEXCOORD0_;
    let _e173 = u_xlat4_;
    let _e175 = u_xlat0_;
    let _e177 = (_e173.xy + _e175.xy);
    vs_TEXCOORD0_.x = _e177.x;
    vs_TEXCOORD0_.y = _e177.y;
    let _e182 = u_xlat0_;
    let _e187 = _v_buffer2_.v_cb2_[19];
    let _e193 = _v_buffer2_.v_cb2_[19];
    let _e195 = (-(_e187.xz) + _e193.yw);
    u_xlat0_.x = _e195.x;
    u_xlat0_.y = _e195.y;
    let _e200 = u_xlat4_;
    let _e202 = in_TEXCOORD0_1;
    let _e207 = _v_buffer2_.v_cb2_[18];
    let _e213 = _v_buffer2_.v_cb2_[18];
    let _e215 = ((_e202.xy * _e207.xy) + _e213.zw);
    u_xlat4_.x = _e215.x;
    u_xlat4_.y = _e215.y;
    let _e220 = u_xlat0_;
    let _e222 = u_xlat4_;
    let _e224 = u_xlat0_;
    let _e230 = _v_buffer2_.v_cb2_[19];
    let _e232 = ((_e222.xx * _e224.xy) + _e230.xz);
    u_xlat0_.x = _e232.x;
    u_xlat0_.y = _e232.y;
    let _e238 = u_xlat0_;
    let _e241 = u_xlat0_;
    u_xlat2_.x = (-(_e238.x) + _e241.y);
    let _e245 = u_xlat4_;
    let _e247 = u_xlat2_;
    let _e250 = u_xlat0_;
    u_xlat0_.x = ((_e245.y * _e247.x) + _e250.x);
    let _e253 = u_xlat2_;
    let _e255 = u_xlat4_;
    let _e266 = ((_e255.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e266.x;
    u_xlat2_.y = _e266.y;
    let _e272 = u_xlat2_;
    let _e274 = u_xlat2_;
    u_xlat2_.x = dot(_e272.xy, _e274.xy);
    let _e278 = u_xlat2_;
    u_xlat2_.x = (-(_e278.x) + 1f);
    let _e284 = u_xlat2_;
    let _e289 = _v_buffer2_.v_cb2_[17];
    u_xlat2_.x = (_e284.x * _e289.x);
    let _e293 = u_xlat2_;
    u_xlat2_.x = clamp(_e293.x, 0f, 1f);
    let _e299 = u_xlat0_;
    let _e301 = u_xlat2_;
    u_xlat0_.x = (_e299.x * _e301.x);
    let _e305 = u_xlat0_;
    u_xlat0_.x = clamp(_e305.x, 0f, 1f);
    let _e311 = u_xlat0_;
    let _e313 = in_COLOR0_1;
    u_xlat0_.w = (_e311.x * _e313.w);
    let _e316 = u_xlat0_;
    let _e318 = in_COLOR0_1;
    let _e319 = _e318.xyz;
    u_xlat0_.x = _e319.x;
    u_xlat0_.y = _e319.y;
    u_xlat0_.z = _e319.z;
    let _e326 = u_xlat0_;
    let _e330 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e326 * _e330);
    let _e333 = u_xlat0_;
    let _e335 = u_xlat0_;
    u_xlat1_.x = max(_e333.y, _e335.x);
    let _e339 = u_xlat0_;
    let _e341 = u_xlat1_;
    u_xlat1_.x = max(_e339.z, _e341.x);
    let _e345 = u_xlat1_;
    u_xlat1_.x = ((_e345.x * 2f) + -1f);
    let _e353 = u_xlat1_;
    u_xlat1_.x = clamp(_e353.x, 0f, 1f);
    let _e359 = u_xlat1_;
    u_xlat1_.w = (-(_e359.x) + 1f);
    let _e364 = u_xlat1_;
    let _e366 = u_xlat0_;
    let _e368 = u_xlat0_;
    let _e370 = (_e366.xyz + _e368.xyz);
    u_xlat1_.x = _e370.x;
    u_xlat1_.y = _e370.y;
    u_xlat1_.z = _e370.z;
    let _e378 = u_xlat0_;
    let _e383 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e378.w * _e383.w);
    let _e386 = u_xlat0_;
    let _e388 = u_xlat1_;
    vs_COLOR0_ = (_e386.xxxx * _e388);
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
