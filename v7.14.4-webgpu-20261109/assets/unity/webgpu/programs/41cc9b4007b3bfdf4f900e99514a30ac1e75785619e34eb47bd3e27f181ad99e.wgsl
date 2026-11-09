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
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e40 = in_POSITION0_1;
    let _e45 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e40.yyyy * _e45);
    let _e50 = _v_buffer1_.v_cb1_[0];
    let _e51 = in_POSITION0_1;
    let _e54 = u_xlat0_;
    u_xlat0_ = ((_e50 * _e51.xxxx) + _e54);
    let _e59 = _v_buffer1_.v_cb1_[2];
    let _e60 = in_POSITION0_1;
    let _e63 = u_xlat0_;
    u_xlat0_ = ((_e59 * _e60.zzzz) + _e63);
    let _e65 = u_xlat0_;
    let _e69 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e65 + _e69);
    let _e71 = u_xlat0_;
    let _e76 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e71.yyyy * _e76);
    let _e81 = _v_buffer0_.v_cb0_[79];
    let _e82 = u_xlat0_;
    let _e85 = u_xlat1_;
    u_xlat1_ = ((_e81 * _e82.xxxx) + _e85);
    let _e90 = _v_buffer0_.v_cb0_[81];
    let _e91 = u_xlat0_;
    let _e94 = u_xlat1_;
    u_xlat1_ = ((_e90 * _e91.zzzz) + _e94);
    let _e100 = _v_buffer0_.v_cb0_[82];
    let _e101 = u_xlat0_;
    let _e104 = u_xlat1_;
    gl_Position = ((_e100 * _e101.wwww) + _e104);
    let _e106 = u_xlat0_;
    let _e108 = in_TEXCOORD0_1;
    let _e113 = _v_buffer2_.v_cb2_[4];
    let _e119 = _v_buffer2_.v_cb2_[4];
    let _e121 = ((_e108.xy * _e113.xy) + _e119.zw);
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    let _e126 = u_xlat8_;
    let _e128 = u_xlat0_;
    let _e131 = u_xlat0_;
    let _e133 = (-(_e128.xy) + _e131.yx);
    u_xlat8_.x = _e133.x;
    u_xlat8_.y = _e133.y;
    let _e138 = u_xlat0_;
    let _e143 = _v_buffer2_.v_cb2_[6];
    let _e145 = u_xlat8_;
    let _e148 = u_xlat0_;
    let _e150 = ((_e143.yy * _e145.xy) + _e148.xy);
    u_xlat0_.x = _e150.x;
    u_xlat0_.y = _e150.y;
    let _e155 = u_xlat8_;
    let _e160 = _v_buffer0_.v_cb0_[15];
    let _e165 = _v_buffer2_.v_cb2_[5];
    let _e167 = (_e160.zz * _e165.xy);
    u_xlat8_.x = _e167.x;
    u_xlat8_.y = _e167.y;
    let _e172 = u_xlat8_;
    let _e174 = u_xlat8_;
    let _e176 = fract(_e174.xy);
    u_xlat8_.x = _e176.x;
    u_xlat8_.y = _e176.y;
    let _e181 = vs_TEXCOORD0_;
    let _e183 = u_xlat8_;
    let _e185 = u_xlat0_;
    let _e187 = (_e183.xy + _e185.xy);
    vs_TEXCOORD0_.z = _e187.x;
    vs_TEXCOORD0_.w = _e187.y;
    let _e192 = u_xlat0_;
    let _e194 = in_TEXCOORD0_1;
    let _e199 = _v_buffer2_.v_cb2_[1];
    let _e205 = _v_buffer2_.v_cb2_[1];
    let _e207 = ((_e194.xy * _e199.xy) + _e205.zw);
    u_xlat0_.x = _e207.x;
    u_xlat0_.y = _e207.y;
    let _e212 = u_xlat8_;
    let _e214 = u_xlat0_;
    let _e217 = u_xlat0_;
    let _e219 = (-(_e214.xy) + _e217.yx);
    u_xlat8_.x = _e219.x;
    u_xlat8_.y = _e219.y;
    let _e224 = vs_TEXCOORD0_;
    let _e229 = _v_buffer2_.v_cb2_[2];
    let _e231 = u_xlat8_;
    let _e234 = u_xlat0_;
    let _e236 = ((_e229.zz * _e231.xy) + _e234.xy);
    vs_TEXCOORD0_.x = _e236.x;
    vs_TEXCOORD0_.y = _e236.y;
    let _e241 = u_xlat0_;
    let _e246 = _v_buffer2_.v_cb2_[19];
    let _e252 = _v_buffer2_.v_cb2_[19];
    let _e254 = (-(_e246.xz) + _e252.yw);
    u_xlat0_.x = _e254.x;
    u_xlat0_.y = _e254.y;
    let _e259 = u_xlat8_;
    let _e261 = in_TEXCOORD0_1;
    let _e266 = _v_buffer2_.v_cb2_[18];
    let _e272 = _v_buffer2_.v_cb2_[18];
    let _e274 = ((_e261.xy * _e266.xy) + _e272.zw);
    u_xlat8_.x = _e274.x;
    u_xlat8_.y = _e274.y;
    let _e279 = u_xlat0_;
    let _e281 = u_xlat8_;
    let _e283 = u_xlat0_;
    let _e289 = _v_buffer2_.v_cb2_[19];
    let _e291 = ((_e281.xx * _e283.xy) + _e289.xz);
    u_xlat0_.x = _e291.x;
    u_xlat0_.y = _e291.y;
    let _e297 = u_xlat0_;
    let _e300 = u_xlat0_;
    u_xlat4_.x = (-(_e297.x) + _e300.y);
    let _e304 = u_xlat8_;
    let _e306 = u_xlat4_;
    let _e309 = u_xlat0_;
    u_xlat0_.x = ((_e304.y * _e306.x) + _e309.x);
    let _e312 = u_xlat4_;
    let _e314 = u_xlat8_;
    let _e325 = ((_e314.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e325.x;
    u_xlat4_.y = _e325.y;
    let _e331 = u_xlat4_;
    let _e333 = u_xlat4_;
    u_xlat4_.x = dot(_e331.xy, _e333.xy);
    let _e337 = u_xlat4_;
    u_xlat4_.x = (-(_e337.x) + 1f);
    let _e343 = u_xlat4_;
    let _e348 = _v_buffer2_.v_cb2_[17];
    u_xlat4_.x = (_e343.x * _e348.x);
    let _e352 = u_xlat4_;
    u_xlat4_.x = clamp(_e352.x, 0f, 1f);
    let _e358 = u_xlat0_;
    let _e360 = u_xlat4_;
    u_xlat0_.x = (_e358.x * _e360.x);
    let _e364 = u_xlat0_;
    u_xlat0_.x = clamp(_e364.x, 0f, 1f);
    let _e370 = u_xlat0_;
    let _e372 = in_COLOR0_1;
    u_xlat4_.x = (_e370.x * _e372.w);
    let _e376 = in_COLOR0_1;
    let _e379 = u_xlat0_;
    u_xlat0_.x = ((-(_e376.w) * _e379.x) + 1f);
    let _e385 = u_xlat0_;
    let _e390 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e385.x + -(_e390.w));
    let _e395 = u_xlat4_;
    let _e400 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e395.x, _e400.x);
    let _e403 = u_xlat1_;
    let _e405 = in_COLOR0_1;
    let _e406 = _e405.xyz;
    u_xlat1_.x = _e406.x;
    u_xlat1_.y = _e406.y;
    u_xlat1_.z = _e406.z;
    let _e413 = u_xlat1_;
    let _e417 = _v_buffer2_.v_cb2_[7];
    u_xlat2_ = (_e413 * _e417);
    let _e419 = u_xlat1_;
    let _e423 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e419 * _e423);
    let _e426 = u_xlat2_;
    let _e428 = u_xlat2_;
    u_xlat4_.x = max(_e426.y, _e428.x);
    let _e432 = u_xlat2_;
    let _e434 = u_xlat4_;
    u_xlat4_.x = max(_e432.z, _e434.x);
    let _e438 = u_xlat4_;
    u_xlat4_.x = ((_e438.x * 2f) + -1f);
    let _e446 = u_xlat4_;
    u_xlat4_.x = clamp(_e446.x, 0f, 1f);
    let _e452 = u_xlat4_;
    u_xlat3_.w = (-(_e452.x) + 1f);
    let _e457 = u_xlat4_;
    let _e459 = u_xlat2_;
    let _e461 = u_xlat2_;
    let _e463 = (_e459.xyz + _e461.xyz);
    u_xlat4_.x = _e463.x;
    u_xlat4_.y = _e463.y;
    u_xlat4_.z = _e463.z;
    let _e470 = u_xlat3_;
    let _e472 = u_xlat4_;
    let _e477 = _v_buffer2_.v_cb2_[8];
    let _e479 = (_e472.xyz * _e477.xxx);
    u_xlat3_.x = _e479.x;
    u_xlat3_.y = _e479.y;
    u_xlat3_.z = _e479.z;
    let _e486 = u_xlat2_;
    let _e488 = u_xlat3_;
    vs_COLOR1_ = (_e486.wwww * _e488);
    let _e491 = u_xlat1_;
    let _e493 = u_xlat1_;
    u_xlat4_.x = max(_e491.y, _e493.x);
    let _e497 = u_xlat1_;
    let _e499 = u_xlat4_;
    u_xlat4_.x = max(_e497.z, _e499.x);
    let _e503 = u_xlat4_;
    u_xlat4_.x = ((_e503.x * 2f) + -1f);
    let _e511 = u_xlat4_;
    u_xlat4_.x = clamp(_e511.x, 0f, 1f);
    let _e517 = u_xlat4_;
    u_xlat2_.w = (-(_e517.x) + 1f);
    let _e522 = u_xlat2_;
    let _e524 = u_xlat1_;
    let _e526 = u_xlat1_;
    let _e528 = (_e524.xyz + _e526.xyz);
    u_xlat2_.x = _e528.x;
    u_xlat2_.y = _e528.y;
    u_xlat2_.z = _e528.z;
    let _e536 = u_xlat1_;
    let _e541 = _v_buffer2_.v_cb2_[2];
    u_xlat4_.x = (_e536.w * _e541.w);
    let _e544 = u_xlat4_;
    let _e546 = u_xlat2_;
    vs_COLOR0_ = (_e544.xxxx * _e546);
    let _e552 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = (_e552.y * 1.01f);
    let _e557 = u_xlat4_;
    let _e559 = u_xlat0_;
    u_xlat0_.x = max(_e557.x, _e559.x);
    let _e566 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = ((_e566.z * 2f) + 1f);
    let _e572 = u_xlat0_;
    let _e574 = u_xlat4_;
    let _e580 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e572.x * _e574.x) + -(_e580.z));
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
