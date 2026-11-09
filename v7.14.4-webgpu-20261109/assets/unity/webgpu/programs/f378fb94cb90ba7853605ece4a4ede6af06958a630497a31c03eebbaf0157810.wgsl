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
    let _e108 = _v_buffer2_.v_cb2_[4];
    let _e114 = _v_buffer2_.v_cb2_[4];
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
    let _e138 = _v_buffer2_.v_cb2_[6];
    let _e140 = u_xlat6_;
    let _e143 = u_xlat0_;
    let _e145 = ((_e138.yy * _e140.xy) + _e143.xy);
    u_xlat0_.x = _e145.x;
    u_xlat0_.y = _e145.y;
    let _e150 = u_xlat6_;
    let _e155 = _v_buffer0_.v_cb0_[15];
    let _e160 = _v_buffer2_.v_cb2_[5];
    let _e162 = (_e155.zz * _e160.xy);
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
    vs_TEXCOORD0_.z = _e182.x;
    vs_TEXCOORD0_.w = _e182.y;
    let _e187 = u_xlat0_;
    let _e189 = in_TEXCOORD0_1;
    let _e194 = _v_buffer2_.v_cb2_[1];
    let _e200 = _v_buffer2_.v_cb2_[1];
    let _e202 = ((_e189.xy * _e194.xy) + _e200.zw);
    u_xlat0_.x = _e202.x;
    u_xlat0_.y = _e202.y;
    let _e207 = u_xlat6_;
    let _e209 = u_xlat0_;
    let _e212 = u_xlat0_;
    let _e214 = (-(_e209.xy) + _e212.yx);
    u_xlat6_.x = _e214.x;
    u_xlat6_.y = _e214.y;
    let _e219 = vs_TEXCOORD0_;
    let _e224 = _v_buffer2_.v_cb2_[2];
    let _e226 = u_xlat6_;
    let _e229 = u_xlat0_;
    let _e231 = ((_e224.zz * _e226.xy) + _e229.xy);
    vs_TEXCOORD0_.x = _e231.x;
    vs_TEXCOORD0_.y = _e231.y;
    let _e236 = u_xlat0_;
    let _e241 = _v_buffer2_.v_cb2_[19];
    let _e247 = _v_buffer2_.v_cb2_[19];
    let _e249 = (-(_e241.xz) + _e247.yw);
    u_xlat0_.x = _e249.x;
    u_xlat0_.y = _e249.y;
    let _e254 = u_xlat6_;
    let _e256 = in_TEXCOORD0_1;
    let _e261 = _v_buffer2_.v_cb2_[18];
    let _e267 = _v_buffer2_.v_cb2_[18];
    let _e269 = ((_e256.xy * _e261.xy) + _e267.zw);
    u_xlat6_.x = _e269.x;
    u_xlat6_.y = _e269.y;
    let _e274 = u_xlat0_;
    let _e276 = u_xlat6_;
    let _e278 = u_xlat0_;
    let _e284 = _v_buffer2_.v_cb2_[19];
    let _e286 = ((_e276.xx * _e278.xy) + _e284.xz);
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    let _e292 = u_xlat0_;
    let _e295 = u_xlat0_;
    u_xlat3_.x = (-(_e292.x) + _e295.y);
    let _e299 = u_xlat6_;
    let _e301 = u_xlat3_;
    let _e304 = u_xlat0_;
    u_xlat0_.x = ((_e299.y * _e301.x) + _e304.x);
    let _e307 = u_xlat3_;
    let _e309 = u_xlat6_;
    let _e320 = ((_e309.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e320.x;
    u_xlat3_.y = _e320.y;
    let _e326 = u_xlat3_;
    let _e328 = u_xlat3_;
    u_xlat3_.x = dot(_e326.xy, _e328.xy);
    let _e332 = u_xlat3_;
    u_xlat3_.x = (-(_e332.x) + 1f);
    let _e338 = u_xlat3_;
    let _e343 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e338.x * _e343.x);
    let _e347 = u_xlat3_;
    u_xlat3_.x = clamp(_e347.x, 0f, 1f);
    let _e353 = u_xlat0_;
    let _e355 = u_xlat3_;
    u_xlat0_.x = (_e353.x * _e355.x);
    let _e359 = u_xlat0_;
    u_xlat0_.x = clamp(_e359.x, 0f, 1f);
    let _e365 = u_xlat0_;
    let _e367 = in_COLOR0_1;
    u_xlat0_.w = (_e365.x * _e367.w);
    let _e370 = u_xlat0_;
    let _e372 = in_COLOR0_1;
    let _e373 = _e372.xyz;
    u_xlat0_.x = _e373.x;
    u_xlat0_.y = _e373.y;
    u_xlat0_.z = _e373.z;
    let _e380 = u_xlat0_;
    let _e384 = _v_buffer2_.v_cb2_[7];
    u_xlat1_ = (_e380 * _e384);
    let _e386 = u_xlat0_;
    let _e390 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e386 * _e390);
    let _e393 = u_xlat1_;
    let _e395 = u_xlat1_;
    u_xlat2_.x = max(_e393.y, _e395.x);
    let _e399 = u_xlat1_;
    let _e401 = u_xlat2_;
    u_xlat2_.x = max(_e399.z, _e401.x);
    let _e405 = u_xlat2_;
    u_xlat2_.x = ((_e405.x * 2f) + -1f);
    let _e413 = u_xlat2_;
    u_xlat2_.x = clamp(_e413.x, 0f, 1f);
    let _e419 = u_xlat2_;
    u_xlat2_.w = (-(_e419.x) + 1f);
    let _e424 = u_xlat1_;
    let _e426 = u_xlat1_;
    let _e428 = u_xlat1_;
    let _e430 = (_e426.xyz + _e428.xyz);
    u_xlat1_.x = _e430.x;
    u_xlat1_.y = _e430.y;
    u_xlat1_.z = _e430.z;
    let _e437 = u_xlat2_;
    let _e439 = u_xlat1_;
    let _e444 = _v_buffer2_.v_cb2_[8];
    let _e446 = (_e439.xyz * _e444.xxx);
    u_xlat2_.x = _e446.x;
    u_xlat2_.y = _e446.y;
    u_xlat2_.z = _e446.z;
    let _e453 = u_xlat1_;
    let _e455 = u_xlat2_;
    vs_COLOR1_ = (_e453.wwww * _e455);
    let _e458 = u_xlat0_;
    let _e460 = u_xlat0_;
    u_xlat1_.x = max(_e458.y, _e460.x);
    let _e464 = u_xlat0_;
    let _e466 = u_xlat1_;
    u_xlat1_.x = max(_e464.z, _e466.x);
    let _e470 = u_xlat1_;
    u_xlat1_.x = ((_e470.x * 2f) + -1f);
    let _e478 = u_xlat1_;
    u_xlat1_.x = clamp(_e478.x, 0f, 1f);
    let _e484 = u_xlat1_;
    u_xlat1_.w = (-(_e484.x) + 1f);
    let _e489 = u_xlat1_;
    let _e491 = u_xlat0_;
    let _e493 = u_xlat0_;
    let _e495 = (_e491.xyz + _e493.xyz);
    u_xlat1_.x = _e495.x;
    u_xlat1_.y = _e495.y;
    u_xlat1_.z = _e495.z;
    let _e503 = u_xlat0_;
    let _e508 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e503.w * _e508.w);
    let _e511 = u_xlat0_;
    let _e513 = u_xlat1_;
    vs_COLOR0_ = (_e511.xxxx * _e513);
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
