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
    let _e103 = _v_buffer2_.v_cb2_[4];
    let _e109 = _v_buffer2_.v_cb2_[4];
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
    let _e133 = _v_buffer2_.v_cb2_[6];
    let _e135 = u_xlat4_;
    let _e138 = u_xlat0_;
    let _e140 = ((_e133.yy * _e135.xy) + _e138.xy);
    u_xlat0_.x = _e140.x;
    u_xlat0_.y = _e140.y;
    let _e145 = u_xlat4_;
    let _e150 = _v_buffer0_.v_cb0_[15];
    let _e155 = _v_buffer2_.v_cb2_[5];
    let _e157 = (_e150.zz * _e155.xy);
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
    vs_TEXCOORD0_.z = _e177.x;
    vs_TEXCOORD0_.w = _e177.y;
    let _e182 = u_xlat0_;
    let _e184 = in_TEXCOORD0_1;
    let _e189 = _v_buffer2_.v_cb2_[1];
    let _e195 = _v_buffer2_.v_cb2_[1];
    let _e197 = ((_e184.xy * _e189.xy) + _e195.zw);
    u_xlat0_.x = _e197.x;
    u_xlat0_.y = _e197.y;
    let _e202 = u_xlat4_;
    let _e204 = u_xlat0_;
    let _e207 = u_xlat0_;
    let _e209 = (-(_e204.xy) + _e207.yx);
    u_xlat4_.x = _e209.x;
    u_xlat4_.y = _e209.y;
    let _e214 = vs_TEXCOORD0_;
    let _e219 = _v_buffer2_.v_cb2_[2];
    let _e221 = u_xlat4_;
    let _e224 = u_xlat0_;
    let _e226 = ((_e219.zz * _e221.xy) + _e224.xy);
    vs_TEXCOORD0_.x = _e226.x;
    vs_TEXCOORD0_.y = _e226.y;
    let _e231 = u_xlat0_;
    let _e236 = _v_buffer2_.v_cb2_[19];
    let _e242 = _v_buffer2_.v_cb2_[19];
    let _e244 = (-(_e236.xz) + _e242.yw);
    u_xlat0_.x = _e244.x;
    u_xlat0_.y = _e244.y;
    let _e249 = u_xlat4_;
    let _e251 = in_TEXCOORD0_1;
    let _e256 = _v_buffer2_.v_cb2_[18];
    let _e262 = _v_buffer2_.v_cb2_[18];
    let _e264 = ((_e251.xy * _e256.xy) + _e262.zw);
    u_xlat4_.x = _e264.x;
    u_xlat4_.y = _e264.y;
    let _e269 = u_xlat0_;
    let _e271 = u_xlat4_;
    let _e273 = u_xlat0_;
    let _e279 = _v_buffer2_.v_cb2_[19];
    let _e281 = ((_e271.xx * _e273.xy) + _e279.xz);
    u_xlat0_.x = _e281.x;
    u_xlat0_.y = _e281.y;
    let _e287 = u_xlat0_;
    let _e290 = u_xlat0_;
    u_xlat2_.x = (-(_e287.x) + _e290.y);
    let _e294 = u_xlat4_;
    let _e296 = u_xlat2_;
    let _e299 = u_xlat0_;
    u_xlat0_.x = ((_e294.y * _e296.x) + _e299.x);
    let _e302 = u_xlat2_;
    let _e304 = u_xlat4_;
    let _e315 = ((_e304.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat2_.x = _e315.x;
    u_xlat2_.y = _e315.y;
    let _e321 = u_xlat2_;
    let _e323 = u_xlat2_;
    u_xlat2_.x = dot(_e321.xy, _e323.xy);
    let _e327 = u_xlat2_;
    u_xlat2_.x = (-(_e327.x) + 1f);
    let _e333 = u_xlat2_;
    let _e338 = _v_buffer2_.v_cb2_[17];
    u_xlat2_.x = (_e333.x * _e338.x);
    let _e342 = u_xlat2_;
    u_xlat2_.x = clamp(_e342.x, 0f, 1f);
    let _e348 = u_xlat0_;
    let _e350 = u_xlat2_;
    u_xlat0_.x = (_e348.x * _e350.x);
    let _e354 = u_xlat0_;
    u_xlat0_.x = clamp(_e354.x, 0f, 1f);
    let _e360 = u_xlat0_;
    let _e362 = in_COLOR0_1;
    u_xlat0_.w = (_e360.x * _e362.w);
    let _e365 = u_xlat0_;
    let _e367 = in_COLOR0_1;
    let _e368 = _e367.xyz;
    u_xlat0_.x = _e368.x;
    u_xlat0_.y = _e368.y;
    u_xlat0_.z = _e368.z;
    let _e375 = u_xlat0_;
    let _e379 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e375 * _e379);
    let _e382 = u_xlat0_;
    let _e384 = u_xlat0_;
    u_xlat1_.x = max(_e382.y, _e384.x);
    let _e388 = u_xlat0_;
    let _e390 = u_xlat1_;
    u_xlat1_.x = max(_e388.z, _e390.x);
    let _e394 = u_xlat1_;
    u_xlat1_.x = ((_e394.x * 2f) + -1f);
    let _e402 = u_xlat1_;
    u_xlat1_.x = clamp(_e402.x, 0f, 1f);
    let _e408 = u_xlat1_;
    u_xlat1_.w = (-(_e408.x) + 1f);
    let _e413 = u_xlat1_;
    let _e415 = u_xlat0_;
    let _e417 = u_xlat0_;
    let _e419 = (_e415.xyz + _e417.xyz);
    u_xlat1_.x = _e419.x;
    u_xlat1_.y = _e419.y;
    u_xlat1_.z = _e419.z;
    let _e427 = u_xlat0_;
    let _e432 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e427.w * _e432.w);
    let _e435 = u_xlat0_;
    let _e437 = u_xlat1_;
    vs_COLOR0_ = (_e435.xxxx * _e437);
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
