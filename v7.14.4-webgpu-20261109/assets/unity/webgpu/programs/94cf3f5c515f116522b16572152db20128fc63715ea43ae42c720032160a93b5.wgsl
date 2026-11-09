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
    var u_xlat3_: vec2<f32> = vec2(0f);
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
    u_xlat0_ = (_e60 + _e64);
    let _e66 = u_xlat0_;
    let _e71 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e66.yyyy * _e71);
    let _e76 = _v_buffer0_.v_cb0_[79];
    let _e77 = u_xlat0_;
    let _e80 = u_xlat1_;
    u_xlat1_ = ((_e76 * _e77.xxxx) + _e80);
    let _e85 = _v_buffer0_.v_cb0_[81];
    let _e86 = u_xlat0_;
    let _e89 = u_xlat1_;
    u_xlat1_ = ((_e85 * _e86.zzzz) + _e89);
    let _e95 = _v_buffer0_.v_cb0_[82];
    let _e96 = u_xlat0_;
    let _e99 = u_xlat1_;
    gl_Position = ((_e95 * _e96.wwww) + _e99);
    let _e101 = u_xlat0_;
    let _e103 = in_TEXCOORD0_1;
    let _e108 = _v_buffer2_.v_cb2_[1];
    let _e114 = _v_buffer2_.v_cb2_[1];
    let _e116 = ((_e103.xy * _e108.xy) + _e114.zw);
    u_xlat0_.x = _e116.x;
    u_xlat0_.y = _e116.y;
    let _e121 = u_xlat6_;
    let _e123 = u_xlat0_;
    let _e126 = u_xlat0_;
    let _e128 = (-(_e123.xy) + _e126.yx);
    u_xlat6_.x = _e128.x;
    u_xlat6_.y = _e128.y;
    let _e133 = u_xlat0_;
    let _e138 = _v_buffer2_.v_cb2_[2];
    let _e140 = u_xlat6_;
    let _e143 = u_xlat0_;
    let _e145 = ((_e138.zz * _e140.xy) + _e143.xy);
    u_xlat0_.x = _e145.x;
    u_xlat0_.y = _e145.y;
    let _e150 = u_xlat6_;
    let _e155 = _v_buffer0_.v_cb0_[15];
    let _e160 = _v_buffer2_.v_cb2_[11];
    let _e162 = (_e155.zz * _e160.yz);
    u_xlat6_.x = _e162.x;
    u_xlat6_.y = _e162.y;
    let _e167 = u_xlat6_;
    let _e169 = u_xlat6_;
    let _e171 = fract(_e169.xy);
    u_xlat6_.x = _e171.x;
    u_xlat6_.y = _e171.y;
    let _e176 = vs_TEXCOORD0_;
    let _e178 = u_xlat6_;
    let _e180 = u_xlat0_;
    let _e182 = (_e178.xy + _e180.xy);
    vs_TEXCOORD0_.x = _e182.x;
    vs_TEXCOORD0_.y = _e182.y;
    let _e187 = u_xlat0_;
    let _e189 = in_TEXCOORD0_1;
    let _e194 = _v_buffer2_.v_cb2_[4];
    let _e200 = _v_buffer2_.v_cb2_[4];
    let _e202 = ((_e189.xy * _e194.xy) + _e200.zw);
    u_xlat0_.x = _e202.x;
    u_xlat0_.y = _e202.y;
    let _e207 = u_xlat6_;
    let _e209 = u_xlat0_;
    let _e212 = u_xlat0_;
    let _e214 = (-(_e209.xy) + _e212.yx);
    u_xlat6_.x = _e214.x;
    u_xlat6_.y = _e214.y;
    let _e219 = u_xlat0_;
    let _e224 = _v_buffer2_.v_cb2_[6];
    let _e226 = u_xlat6_;
    let _e229 = u_xlat0_;
    let _e231 = ((_e224.yy * _e226.xy) + _e229.xy);
    u_xlat0_.x = _e231.x;
    u_xlat0_.y = _e231.y;
    let _e236 = u_xlat6_;
    let _e241 = _v_buffer0_.v_cb0_[15];
    let _e246 = _v_buffer2_.v_cb2_[5];
    let _e248 = (_e241.zz * _e246.xy);
    u_xlat6_.x = _e248.x;
    u_xlat6_.y = _e248.y;
    let _e253 = u_xlat6_;
    let _e255 = u_xlat6_;
    let _e257 = fract(_e255.xy);
    u_xlat6_.x = _e257.x;
    u_xlat6_.y = _e257.y;
    let _e262 = vs_TEXCOORD0_;
    let _e264 = u_xlat6_;
    let _e266 = u_xlat0_;
    let _e268 = (_e264.xy + _e266.xy);
    vs_TEXCOORD0_.z = _e268.x;
    vs_TEXCOORD0_.w = _e268.y;
    let _e273 = u_xlat0_;
    let _e278 = _v_buffer2_.v_cb2_[19];
    let _e284 = _v_buffer2_.v_cb2_[19];
    let _e286 = (-(_e278.xz) + _e284.yw);
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    let _e291 = u_xlat6_;
    let _e293 = in_TEXCOORD0_1;
    let _e298 = _v_buffer2_.v_cb2_[18];
    let _e304 = _v_buffer2_.v_cb2_[18];
    let _e306 = ((_e293.xy * _e298.xy) + _e304.zw);
    u_xlat6_.x = _e306.x;
    u_xlat6_.y = _e306.y;
    let _e311 = u_xlat0_;
    let _e313 = u_xlat6_;
    let _e315 = u_xlat0_;
    let _e321 = _v_buffer2_.v_cb2_[19];
    let _e323 = ((_e313.xx * _e315.xy) + _e321.xz);
    u_xlat0_.x = _e323.x;
    u_xlat0_.y = _e323.y;
    let _e329 = u_xlat0_;
    let _e332 = u_xlat0_;
    u_xlat3_.x = (-(_e329.x) + _e332.y);
    let _e336 = u_xlat6_;
    let _e338 = u_xlat3_;
    let _e341 = u_xlat0_;
    u_xlat0_.x = ((_e336.y * _e338.x) + _e341.x);
    let _e344 = u_xlat3_;
    let _e346 = u_xlat6_;
    let _e357 = ((_e346.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e357.x;
    u_xlat3_.y = _e357.y;
    let _e363 = u_xlat3_;
    let _e365 = u_xlat3_;
    u_xlat3_.x = dot(_e363.xy, _e365.xy);
    let _e369 = u_xlat3_;
    u_xlat3_.x = (-(_e369.x) + 1f);
    let _e375 = u_xlat3_;
    let _e380 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e375.x * _e380.x);
    let _e384 = u_xlat3_;
    u_xlat3_.x = clamp(_e384.x, 0f, 1f);
    let _e390 = u_xlat0_;
    let _e392 = u_xlat3_;
    u_xlat0_.x = (_e390.x * _e392.x);
    let _e396 = u_xlat0_;
    u_xlat0_.x = clamp(_e396.x, 0f, 1f);
    let _e402 = u_xlat0_;
    let _e404 = in_COLOR0_1;
    u_xlat0_.w = (_e402.x * _e404.w);
    let _e407 = u_xlat0_;
    let _e409 = in_COLOR0_1;
    let _e410 = _e409.xyz;
    u_xlat0_.x = _e410.x;
    u_xlat0_.y = _e410.y;
    u_xlat0_.z = _e410.z;
    let _e417 = u_xlat0_;
    let _e421 = _v_buffer2_.v_cb2_[7];
    u_xlat1_ = (_e417 * _e421);
    let _e423 = u_xlat0_;
    let _e427 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e423 * _e427);
    let _e430 = u_xlat1_;
    let _e432 = u_xlat1_;
    u_xlat2_.x = max(_e430.y, _e432.x);
    let _e436 = u_xlat1_;
    let _e438 = u_xlat2_;
    u_xlat2_.x = max(_e436.z, _e438.x);
    let _e442 = u_xlat2_;
    u_xlat2_.x = ((_e442.x * 2f) + -1f);
    let _e450 = u_xlat2_;
    u_xlat2_.x = clamp(_e450.x, 0f, 1f);
    let _e456 = u_xlat2_;
    u_xlat2_.w = (-(_e456.x) + 1f);
    let _e461 = u_xlat1_;
    let _e463 = u_xlat1_;
    let _e465 = u_xlat1_;
    let _e467 = (_e463.xyz + _e465.xyz);
    u_xlat1_.x = _e467.x;
    u_xlat1_.y = _e467.y;
    u_xlat1_.z = _e467.z;
    let _e474 = u_xlat2_;
    let _e476 = u_xlat1_;
    let _e481 = _v_buffer2_.v_cb2_[8];
    let _e483 = (_e476.xyz * _e481.xxx);
    u_xlat2_.x = _e483.x;
    u_xlat2_.y = _e483.y;
    u_xlat2_.z = _e483.z;
    let _e490 = u_xlat1_;
    let _e492 = u_xlat2_;
    vs_COLOR1_ = (_e490.wwww * _e492);
    let _e495 = u_xlat0_;
    let _e497 = u_xlat0_;
    u_xlat1_.x = max(_e495.y, _e497.x);
    let _e501 = u_xlat0_;
    let _e503 = u_xlat1_;
    u_xlat1_.x = max(_e501.z, _e503.x);
    let _e507 = u_xlat1_;
    u_xlat1_.x = ((_e507.x * 2f) + -1f);
    let _e515 = u_xlat1_;
    u_xlat1_.x = clamp(_e515.x, 0f, 1f);
    let _e521 = u_xlat1_;
    u_xlat1_.w = (-(_e521.x) + 1f);
    let _e526 = u_xlat1_;
    let _e528 = u_xlat0_;
    let _e530 = u_xlat0_;
    let _e532 = (_e528.xyz + _e530.xyz);
    u_xlat1_.x = _e532.x;
    u_xlat1_.y = _e532.y;
    u_xlat1_.z = _e532.z;
    let _e540 = u_xlat0_;
    let _e545 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e540.w * _e545.w);
    let _e548 = u_xlat0_;
    let _e550 = u_xlat1_;
    vs_COLOR0_ = (_e548.xxxx * _e550);
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
