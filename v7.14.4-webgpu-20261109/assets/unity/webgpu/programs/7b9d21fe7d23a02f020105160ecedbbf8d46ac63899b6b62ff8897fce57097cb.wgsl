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
    let _e113 = _v_buffer2_.v_cb2_[1];
    let _e119 = _v_buffer2_.v_cb2_[1];
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
    let _e143 = _v_buffer2_.v_cb2_[2];
    let _e145 = u_xlat8_;
    let _e148 = u_xlat0_;
    let _e150 = ((_e143.zz * _e145.xy) + _e148.xy);
    u_xlat0_.x = _e150.x;
    u_xlat0_.y = _e150.y;
    let _e155 = u_xlat8_;
    let _e160 = _v_buffer0_.v_cb0_[15];
    let _e165 = _v_buffer2_.v_cb2_[11];
    let _e167 = (_e160.zz * _e165.yz);
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
    vs_TEXCOORD0_.x = _e187.x;
    vs_TEXCOORD0_.y = _e187.y;
    let _e192 = u_xlat0_;
    let _e194 = in_TEXCOORD0_1;
    let _e199 = _v_buffer2_.v_cb2_[4];
    let _e205 = _v_buffer2_.v_cb2_[4];
    let _e207 = ((_e194.xy * _e199.xy) + _e205.zw);
    u_xlat0_.x = _e207.x;
    u_xlat0_.y = _e207.y;
    let _e212 = u_xlat8_;
    let _e214 = u_xlat0_;
    let _e217 = u_xlat0_;
    let _e219 = (-(_e214.xy) + _e217.yx);
    u_xlat8_.x = _e219.x;
    u_xlat8_.y = _e219.y;
    let _e224 = u_xlat0_;
    let _e229 = _v_buffer2_.v_cb2_[6];
    let _e231 = u_xlat8_;
    let _e234 = u_xlat0_;
    let _e236 = ((_e229.yy * _e231.xy) + _e234.xy);
    u_xlat0_.x = _e236.x;
    u_xlat0_.y = _e236.y;
    let _e241 = u_xlat8_;
    let _e246 = _v_buffer0_.v_cb0_[15];
    let _e251 = _v_buffer2_.v_cb2_[5];
    let _e253 = (_e246.zz * _e251.xy);
    u_xlat8_.x = _e253.x;
    u_xlat8_.y = _e253.y;
    let _e258 = u_xlat8_;
    let _e260 = u_xlat8_;
    let _e262 = fract(_e260.xy);
    u_xlat8_.x = _e262.x;
    u_xlat8_.y = _e262.y;
    let _e267 = vs_TEXCOORD0_;
    let _e269 = u_xlat8_;
    let _e271 = u_xlat0_;
    let _e273 = (_e269.xy + _e271.xy);
    vs_TEXCOORD0_.z = _e273.x;
    vs_TEXCOORD0_.w = _e273.y;
    let _e278 = u_xlat0_;
    let _e283 = _v_buffer2_.v_cb2_[19];
    let _e289 = _v_buffer2_.v_cb2_[19];
    let _e291 = (-(_e283.xz) + _e289.yw);
    u_xlat0_.x = _e291.x;
    u_xlat0_.y = _e291.y;
    let _e296 = u_xlat8_;
    let _e298 = in_TEXCOORD0_1;
    let _e303 = _v_buffer2_.v_cb2_[18];
    let _e309 = _v_buffer2_.v_cb2_[18];
    let _e311 = ((_e298.xy * _e303.xy) + _e309.zw);
    u_xlat8_.x = _e311.x;
    u_xlat8_.y = _e311.y;
    let _e316 = u_xlat0_;
    let _e318 = u_xlat8_;
    let _e320 = u_xlat0_;
    let _e326 = _v_buffer2_.v_cb2_[19];
    let _e328 = ((_e318.xx * _e320.xy) + _e326.xz);
    u_xlat0_.x = _e328.x;
    u_xlat0_.y = _e328.y;
    let _e334 = u_xlat0_;
    let _e337 = u_xlat0_;
    u_xlat4_.x = (-(_e334.x) + _e337.y);
    let _e341 = u_xlat8_;
    let _e343 = u_xlat4_;
    let _e346 = u_xlat0_;
    u_xlat0_.x = ((_e341.y * _e343.x) + _e346.x);
    let _e349 = u_xlat4_;
    let _e351 = u_xlat8_;
    let _e362 = ((_e351.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e362.x;
    u_xlat4_.y = _e362.y;
    let _e368 = u_xlat4_;
    let _e370 = u_xlat4_;
    u_xlat4_.x = dot(_e368.xy, _e370.xy);
    let _e374 = u_xlat4_;
    u_xlat4_.x = (-(_e374.x) + 1f);
    let _e380 = u_xlat4_;
    let _e385 = _v_buffer2_.v_cb2_[17];
    u_xlat4_.x = (_e380.x * _e385.x);
    let _e389 = u_xlat4_;
    u_xlat4_.x = clamp(_e389.x, 0f, 1f);
    let _e395 = u_xlat0_;
    let _e397 = u_xlat4_;
    u_xlat0_.x = (_e395.x * _e397.x);
    let _e401 = u_xlat0_;
    u_xlat0_.x = clamp(_e401.x, 0f, 1f);
    let _e407 = u_xlat0_;
    let _e409 = in_COLOR0_1;
    u_xlat4_.x = (_e407.x * _e409.w);
    let _e413 = in_COLOR0_1;
    let _e416 = u_xlat0_;
    u_xlat0_.x = ((-(_e413.w) * _e416.x) + 1f);
    let _e422 = u_xlat0_;
    let _e427 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e422.x + -(_e427.w));
    let _e432 = u_xlat4_;
    let _e437 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e432.x, _e437.x);
    let _e440 = u_xlat1_;
    let _e442 = in_COLOR0_1;
    let _e443 = _e442.xyz;
    u_xlat1_.x = _e443.x;
    u_xlat1_.y = _e443.y;
    u_xlat1_.z = _e443.z;
    let _e450 = u_xlat1_;
    let _e454 = _v_buffer2_.v_cb2_[7];
    u_xlat2_ = (_e450 * _e454);
    let _e456 = u_xlat1_;
    let _e460 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e456 * _e460);
    let _e463 = u_xlat2_;
    let _e465 = u_xlat2_;
    u_xlat4_.x = max(_e463.y, _e465.x);
    let _e469 = u_xlat2_;
    let _e471 = u_xlat4_;
    u_xlat4_.x = max(_e469.z, _e471.x);
    let _e475 = u_xlat4_;
    u_xlat4_.x = ((_e475.x * 2f) + -1f);
    let _e483 = u_xlat4_;
    u_xlat4_.x = clamp(_e483.x, 0f, 1f);
    let _e489 = u_xlat4_;
    u_xlat3_.w = (-(_e489.x) + 1f);
    let _e494 = u_xlat4_;
    let _e496 = u_xlat2_;
    let _e498 = u_xlat2_;
    let _e500 = (_e496.xyz + _e498.xyz);
    u_xlat4_.x = _e500.x;
    u_xlat4_.y = _e500.y;
    u_xlat4_.z = _e500.z;
    let _e507 = u_xlat3_;
    let _e509 = u_xlat4_;
    let _e514 = _v_buffer2_.v_cb2_[8];
    let _e516 = (_e509.xyz * _e514.xxx);
    u_xlat3_.x = _e516.x;
    u_xlat3_.y = _e516.y;
    u_xlat3_.z = _e516.z;
    let _e523 = u_xlat2_;
    let _e525 = u_xlat3_;
    vs_COLOR1_ = (_e523.wwww * _e525);
    let _e528 = u_xlat1_;
    let _e530 = u_xlat1_;
    u_xlat4_.x = max(_e528.y, _e530.x);
    let _e534 = u_xlat1_;
    let _e536 = u_xlat4_;
    u_xlat4_.x = max(_e534.z, _e536.x);
    let _e540 = u_xlat4_;
    u_xlat4_.x = ((_e540.x * 2f) + -1f);
    let _e548 = u_xlat4_;
    u_xlat4_.x = clamp(_e548.x, 0f, 1f);
    let _e554 = u_xlat4_;
    u_xlat2_.w = (-(_e554.x) + 1f);
    let _e559 = u_xlat2_;
    let _e561 = u_xlat1_;
    let _e563 = u_xlat1_;
    let _e565 = (_e561.xyz + _e563.xyz);
    u_xlat2_.x = _e565.x;
    u_xlat2_.y = _e565.y;
    u_xlat2_.z = _e565.z;
    let _e573 = u_xlat1_;
    let _e578 = _v_buffer2_.v_cb2_[2];
    u_xlat4_.x = (_e573.w * _e578.w);
    let _e581 = u_xlat4_;
    let _e583 = u_xlat2_;
    vs_COLOR0_ = (_e581.xxxx * _e583);
    let _e589 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = (_e589.y * 1.01f);
    let _e594 = u_xlat4_;
    let _e596 = u_xlat0_;
    u_xlat0_.x = max(_e594.x, _e596.x);
    let _e603 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = ((_e603.z * 2f) + 1f);
    let _e609 = u_xlat0_;
    let _e611 = u_xlat4_;
    let _e617 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e609.x * _e611.x) + -(_e617.z));
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
