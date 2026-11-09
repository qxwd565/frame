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
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e36 = in_POSITION0_1;
    let _e41 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e36.yyyy * _e41);
    let _e46 = _v_buffer1_.v_cb1_[0];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.xxxx) + _e50);
    let _e55 = _v_buffer1_.v_cb1_[2];
    let _e56 = in_POSITION0_1;
    let _e59 = u_xlat0_;
    u_xlat0_ = ((_e55 * _e56.zzzz) + _e59);
    let _e61 = u_xlat0_;
    let _e65 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e61 + _e65);
    let _e67 = u_xlat0_;
    let _e72 = _v_buffer1_.v_cb1_[3];
    let _e74 = in_POSITION0_1;
    let _e77 = u_xlat0_;
    let _e79 = ((_e72.xz * _e74.ww) + _e77.xz);
    u_xlat0_.x = _e79.x;
    u_xlat0_.y = _e79.y;
    let _e84 = u_xlat0_;
    let _e86 = u_xlat0_;
    let _e91 = _v_buffer2_.v_cb2_[4];
    let _e97 = _v_buffer2_.v_cb2_[4];
    let _e99 = ((_e86.xy * _e91.xy) + _e97.zw);
    u_xlat0_.x = _e99.x;
    u_xlat0_.y = _e99.y;
    let _e104 = u_xlat1_;
    let _e109 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e104.yyyy * _e109);
    let _e114 = _v_buffer0_.v_cb0_[79];
    let _e115 = u_xlat1_;
    let _e118 = u_xlat2_;
    u_xlat2_ = ((_e114 * _e115.xxxx) + _e118);
    let _e123 = _v_buffer0_.v_cb0_[81];
    let _e124 = u_xlat1_;
    let _e127 = u_xlat2_;
    u_xlat2_ = ((_e123 * _e124.zzzz) + _e127);
    let _e133 = _v_buffer0_.v_cb0_[82];
    let _e134 = u_xlat1_;
    let _e137 = u_xlat2_;
    gl_Position = ((_e133 * _e134.wwww) + _e137);
    let _e139 = u_xlat6_;
    let _e141 = u_xlat0_;
    let _e144 = u_xlat0_;
    let _e146 = (-(_e141.xy) + _e144.yx);
    u_xlat6_.x = _e146.x;
    u_xlat6_.y = _e146.y;
    let _e151 = u_xlat0_;
    let _e156 = _v_buffer2_.v_cb2_[6];
    let _e158 = u_xlat6_;
    let _e161 = u_xlat0_;
    let _e163 = ((_e156.yy * _e158.xy) + _e161.xy);
    u_xlat0_.x = _e163.x;
    u_xlat0_.y = _e163.y;
    let _e168 = u_xlat6_;
    let _e173 = _v_buffer0_.v_cb0_[15];
    let _e178 = _v_buffer2_.v_cb2_[5];
    let _e180 = (_e173.zz * _e178.xy);
    u_xlat6_.x = _e180.x;
    u_xlat6_.y = _e180.y;
    let _e185 = u_xlat6_;
    let _e187 = u_xlat6_;
    let _e189 = fract(_e187.xy);
    u_xlat6_.x = _e189.x;
    u_xlat6_.y = _e189.y;
    let _e194 = vs_TEXCOORD0_;
    let _e196 = u_xlat6_;
    let _e198 = u_xlat0_;
    let _e200 = (_e196.xy + _e198.xy);
    vs_TEXCOORD0_.z = _e200.x;
    vs_TEXCOORD0_.w = _e200.y;
    let _e205 = u_xlat0_;
    let _e207 = in_TEXCOORD0_1;
    let _e212 = _v_buffer2_.v_cb2_[1];
    let _e218 = _v_buffer2_.v_cb2_[1];
    let _e220 = ((_e207.xy * _e212.xy) + _e218.zw);
    u_xlat0_.x = _e220.x;
    u_xlat0_.y = _e220.y;
    let _e225 = u_xlat6_;
    let _e227 = u_xlat0_;
    let _e230 = u_xlat0_;
    let _e232 = (-(_e227.xy) + _e230.yx);
    u_xlat6_.x = _e232.x;
    u_xlat6_.y = _e232.y;
    let _e237 = vs_TEXCOORD0_;
    let _e242 = _v_buffer2_.v_cb2_[2];
    let _e244 = u_xlat6_;
    let _e247 = u_xlat0_;
    let _e249 = ((_e242.zz * _e244.xy) + _e247.xy);
    vs_TEXCOORD0_.x = _e249.x;
    vs_TEXCOORD0_.y = _e249.y;
    let _e254 = u_xlat0_;
    let _e259 = _v_buffer2_.v_cb2_[19];
    let _e265 = _v_buffer2_.v_cb2_[19];
    let _e267 = (-(_e259.xz) + _e265.yw);
    u_xlat0_.x = _e267.x;
    u_xlat0_.y = _e267.y;
    let _e272 = u_xlat6_;
    let _e274 = in_TEXCOORD0_1;
    let _e279 = _v_buffer2_.v_cb2_[18];
    let _e285 = _v_buffer2_.v_cb2_[18];
    let _e287 = ((_e274.xy * _e279.xy) + _e285.zw);
    u_xlat6_.x = _e287.x;
    u_xlat6_.y = _e287.y;
    let _e292 = u_xlat0_;
    let _e294 = u_xlat6_;
    let _e296 = u_xlat0_;
    let _e302 = _v_buffer2_.v_cb2_[19];
    let _e304 = ((_e294.xx * _e296.xy) + _e302.xz);
    u_xlat0_.x = _e304.x;
    u_xlat0_.y = _e304.y;
    let _e310 = u_xlat0_;
    let _e313 = u_xlat0_;
    u_xlat3_.x = (-(_e310.x) + _e313.y);
    let _e317 = u_xlat6_;
    let _e319 = u_xlat3_;
    let _e322 = u_xlat0_;
    u_xlat0_.x = ((_e317.y * _e319.x) + _e322.x);
    let _e325 = u_xlat3_;
    let _e327 = u_xlat6_;
    let _e338 = ((_e327.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e338.x;
    u_xlat3_.y = _e338.y;
    let _e344 = u_xlat3_;
    let _e346 = u_xlat3_;
    u_xlat3_.x = dot(_e344.xy, _e346.xy);
    let _e350 = u_xlat3_;
    u_xlat3_.x = (-(_e350.x) + 1f);
    let _e356 = u_xlat3_;
    let _e361 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e356.x * _e361.x);
    let _e365 = u_xlat3_;
    u_xlat3_.x = clamp(_e365.x, 0f, 1f);
    let _e371 = u_xlat0_;
    let _e373 = u_xlat3_;
    u_xlat0_.x = (_e371.x * _e373.x);
    let _e377 = u_xlat0_;
    u_xlat0_.x = clamp(_e377.x, 0f, 1f);
    let _e383 = u_xlat0_;
    let _e385 = in_COLOR0_1;
    u_xlat3_.x = (_e383.x * _e385.w);
    let _e389 = in_COLOR0_1;
    let _e392 = u_xlat0_;
    u_xlat0_.x = ((-(_e389.w) * _e392.x) + 1f);
    let _e398 = u_xlat0_;
    let _e403 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e398.x + -(_e403.w));
    let _e408 = u_xlat3_;
    let _e413 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e408.x, _e413.x);
    let _e416 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e425 = u_xlat1_;
    let _e427 = in_COLOR0_1;
    let _e428 = _e427.xyz;
    u_xlat1_.x = _e428.x;
    u_xlat1_.y = _e428.y;
    u_xlat1_.z = _e428.z;
    u_xlat1_.w = 1f;
    let _e437 = u_xlat1_;
    let _e441 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e437 * _e441);
    let _e444 = u_xlat1_;
    let _e446 = u_xlat1_;
    u_xlat3_.x = max(_e444.y, _e446.x);
    let _e450 = u_xlat1_;
    let _e452 = u_xlat3_;
    u_xlat3_.x = max(_e450.z, _e452.x);
    let _e456 = u_xlat3_;
    u_xlat3_.x = ((_e456.x * 2f) + -1f);
    let _e464 = u_xlat3_;
    u_xlat3_.x = clamp(_e464.x, 0f, 1f);
    let _e470 = u_xlat3_;
    u_xlat2_.w = (-(_e470.x) + 1f);
    let _e475 = u_xlat2_;
    let _e477 = u_xlat1_;
    let _e479 = u_xlat1_;
    let _e481 = (_e477.xyz + _e479.xyz);
    u_xlat2_.x = _e481.x;
    u_xlat2_.y = _e481.y;
    u_xlat2_.z = _e481.z;
    let _e489 = u_xlat1_;
    let _e494 = _v_buffer2_.v_cb2_[2];
    u_xlat3_.x = (_e489.w * _e494.w);
    let _e497 = u_xlat3_;
    let _e499 = u_xlat2_;
    vs_COLOR0_ = (_e497.xxxx * _e499);
    let _e505 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = (_e505.y * 1.01f);
    let _e510 = u_xlat3_;
    let _e512 = u_xlat0_;
    u_xlat0_.x = max(_e510.x, _e512.x);
    let _e519 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = ((_e519.z * 2f) + 1f);
    let _e525 = u_xlat0_;
    let _e527 = u_xlat3_;
    let _e533 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e525.x * _e527.x) + -(_e533.z));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR1_;
    let _e34 = vs_COLOR0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
