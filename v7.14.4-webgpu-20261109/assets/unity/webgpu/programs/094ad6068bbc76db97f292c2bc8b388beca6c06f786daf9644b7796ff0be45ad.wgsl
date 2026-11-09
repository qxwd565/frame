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
    let _e184 = in_TEXCOORD0_1;
    let _e189 = _v_buffer2_.v_cb2_[4];
    let _e195 = _v_buffer2_.v_cb2_[4];
    let _e197 = ((_e184.xy * _e189.xy) + _e195.zw);
    u_xlat0_.x = _e197.x;
    u_xlat0_.y = _e197.y;
    let _e202 = u_xlat4_;
    let _e204 = u_xlat0_;
    let _e207 = u_xlat0_;
    let _e209 = (-(_e204.xy) + _e207.yx);
    u_xlat4_.x = _e209.x;
    u_xlat4_.y = _e209.y;
    let _e214 = u_xlat0_;
    let _e219 = _v_buffer2_.v_cb2_[6];
    let _e221 = u_xlat4_;
    let _e224 = u_xlat0_;
    let _e226 = ((_e219.yy * _e221.xy) + _e224.xy);
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    let _e231 = u_xlat4_;
    let _e236 = _v_buffer0_.v_cb0_[15];
    let _e241 = _v_buffer2_.v_cb2_[5];
    let _e243 = (_e236.zz * _e241.xy);
    u_xlat4_.x = _e243.x;
    u_xlat4_.y = _e243.y;
    let _e248 = u_xlat4_;
    let _e250 = u_xlat4_;
    let _e252 = fract(_e250.xy);
    u_xlat4_.x = _e252.x;
    u_xlat4_.y = _e252.y;
    let _e257 = vs_TEXCOORD0_;
    let _e259 = u_xlat4_;
    let _e261 = u_xlat0_;
    let _e263 = (_e259.xy + _e261.xy);
    vs_TEXCOORD0_.z = _e263.x;
    vs_TEXCOORD0_.w = _e263.y;
    let _e268 = u_xlat0_;
    let _e273 = _v_buffer2_.v_cb2_[19];
    let _e279 = _v_buffer2_.v_cb2_[19];
    let _e281 = (-(_e273.xz) + _e279.yw);
    u_xlat0_.x = _e281.x;
    u_xlat0_.y = _e281.y;
    let _e286 = u_xlat4_;
    let _e288 = in_TEXCOORD0_1;
    let _e293 = _v_buffer2_.v_cb2_[18];
    let _e299 = _v_buffer2_.v_cb2_[18];
    let _e301 = ((_e288.xy * _e293.xy) + _e299.zw);
    u_xlat4_.x = _e301.x;
    u_xlat4_.y = _e301.y;
    let _e306 = u_xlat0_;
    let _e308 = u_xlat4_;
    let _e310 = u_xlat0_;
    let _e316 = _v_buffer2_.v_cb2_[19];
    let _e318 = ((_e308.xx * _e310.xy) + _e316.xz);
    u_xlat0_.x = _e318.x;
    u_xlat0_.y = _e318.y;
    let _e324 = u_xlat0_;
    let _e327 = u_xlat0_;
    u_xlat2_.x = (-(_e324.x) + _e327.y);
    let _e331 = u_xlat4_;
    let _e333 = u_xlat2_;
    let _e336 = u_xlat0_;
    u_xlat0_.x = ((_e331.y * _e333.x) + _e336.x);
    let _e339 = u_xlat2_;
    let _e341 = u_xlat4_;
    let _e352 = ((_e341.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e352.x;
    u_xlat2_.y = _e352.y;
    let _e358 = u_xlat2_;
    let _e360 = u_xlat2_;
    u_xlat2_.x = dot(_e358.xy, _e360.xy);
    let _e364 = u_xlat2_;
    u_xlat2_.x = (-(_e364.x) + 1f);
    let _e370 = u_xlat2_;
    let _e375 = _v_buffer2_.v_cb2_[17];
    u_xlat2_.x = (_e370.x * _e375.x);
    let _e379 = u_xlat2_;
    u_xlat2_.x = clamp(_e379.x, 0f, 1f);
    let _e385 = u_xlat0_;
    let _e387 = u_xlat2_;
    u_xlat0_.x = (_e385.x * _e387.x);
    let _e391 = u_xlat0_;
    u_xlat0_.x = clamp(_e391.x, 0f, 1f);
    let _e397 = u_xlat0_;
    let _e399 = in_COLOR0_1;
    u_xlat0_.w = (_e397.x * _e399.w);
    let _e402 = u_xlat0_;
    let _e404 = in_COLOR0_1;
    let _e405 = _e404.xyz;
    u_xlat0_.x = _e405.x;
    u_xlat0_.y = _e405.y;
    u_xlat0_.z = _e405.z;
    let _e412 = u_xlat0_;
    let _e416 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e412 * _e416);
    let _e419 = u_xlat0_;
    let _e421 = u_xlat0_;
    u_xlat1_.x = max(_e419.y, _e421.x);
    let _e425 = u_xlat0_;
    let _e427 = u_xlat1_;
    u_xlat1_.x = max(_e425.z, _e427.x);
    let _e431 = u_xlat1_;
    u_xlat1_.x = ((_e431.x * 2f) + -1f);
    let _e439 = u_xlat1_;
    u_xlat1_.x = clamp(_e439.x, 0f, 1f);
    let _e445 = u_xlat1_;
    u_xlat1_.w = (-(_e445.x) + 1f);
    let _e450 = u_xlat1_;
    let _e452 = u_xlat0_;
    let _e454 = u_xlat0_;
    let _e456 = (_e452.xyz + _e454.xyz);
    u_xlat1_.x = _e456.x;
    u_xlat1_.y = _e456.y;
    u_xlat1_.z = _e456.z;
    let _e464 = u_xlat0_;
    let _e469 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e464.w * _e469.w);
    let _e472 = u_xlat0_;
    let _e474 = u_xlat1_;
    vs_COLOR0_ = (_e472.xxxx * _e474);
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
