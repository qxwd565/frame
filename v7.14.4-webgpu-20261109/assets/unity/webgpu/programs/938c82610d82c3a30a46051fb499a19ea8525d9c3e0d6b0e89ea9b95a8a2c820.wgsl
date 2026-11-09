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
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
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
    let _e181 = u_xlat0_;
    let _e183 = u_xlat8_;
    let _e185 = u_xlat0_;
    let _e187 = (_e183.xy + _e185.xy);
    u_xlat0_.x = _e187.x;
    u_xlat0_.y = _e187.y;
    let _e192 = u_xlat0_;
    let _e197 = _v_buffer2_.v_cb2_[4];
    let _e204 = u_xlat0_;
    let _e206 = ((-(_e197.xy) * vec2<f32>(0.5f, 0.5f)) + _e204.xy);
    u_xlat0_.x = _e206.x;
    u_xlat0_.y = _e206.y;
    let _e215 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e215.w * 0.017453289f);
    let _e223 = _v_buffer2_.v_cb2_[6];
    let _e228 = _v_buffer0_.v_cb0_[15];
    let _e231 = u_xlat8_;
    u_xlat8_.x = ((_e223.z * _e228.z) + -(_e231.x));
    let _e236 = u_xlat8_;
    u_xlat1_.x = sin(_e236.x);
    let _e240 = u_xlat8_;
    u_xlat2_.x = cos(_e240.x);
    let _e244 = u_xlat1_;
    u_xlat3_.z = _e244.x;
    let _e247 = u_xlat2_;
    u_xlat3_.y = _e247.x;
    let _e250 = u_xlat1_;
    u_xlat3_.x = -(_e250.x);
    let _e254 = u_xlat0_;
    let _e256 = u_xlat3_;
    u_xlat8_.y = dot(_e254.xy, _e256.xy);
    let _e260 = u_xlat0_;
    let _e262 = u_xlat3_;
    u_xlat8_.x = dot(_e260.xy, _e262.yz);
    let _e265 = vs_TEXCOORD0_;
    let _e270 = _v_buffer2_.v_cb2_[4];
    let _e276 = u_xlat8_;
    let _e278 = ((_e270.xy * vec2<f32>(0.5f, 0.5f)) + _e276.xy);
    vs_TEXCOORD0_.z = _e278.x;
    vs_TEXCOORD0_.w = _e278.y;
    let _e283 = u_xlat0_;
    let _e285 = in_TEXCOORD0_1;
    let _e290 = _v_buffer2_.v_cb2_[1];
    let _e296 = _v_buffer2_.v_cb2_[1];
    let _e298 = ((_e285.xy * _e290.xy) + _e296.zw);
    u_xlat0_.x = _e298.x;
    u_xlat0_.y = _e298.y;
    let _e303 = u_xlat8_;
    let _e305 = u_xlat0_;
    let _e308 = u_xlat0_;
    let _e310 = (-(_e305.xy) + _e308.yx);
    u_xlat8_.x = _e310.x;
    u_xlat8_.y = _e310.y;
    let _e315 = u_xlat0_;
    let _e320 = _v_buffer2_.v_cb2_[2];
    let _e322 = u_xlat8_;
    let _e325 = u_xlat0_;
    let _e327 = ((_e320.zz * _e322.xy) + _e325.xy);
    u_xlat0_.x = _e327.x;
    u_xlat0_.y = _e327.y;
    let _e332 = u_xlat8_;
    let _e337 = _v_buffer0_.v_cb0_[15];
    let _e342 = _v_buffer2_.v_cb2_[11];
    let _e344 = (_e337.zz * _e342.yz);
    u_xlat8_.x = _e344.x;
    u_xlat8_.y = _e344.y;
    let _e349 = u_xlat8_;
    let _e351 = u_xlat8_;
    let _e353 = fract(_e351.xy);
    u_xlat8_.x = _e353.x;
    u_xlat8_.y = _e353.y;
    let _e358 = vs_TEXCOORD0_;
    let _e360 = u_xlat8_;
    let _e362 = u_xlat0_;
    let _e364 = (_e360.xy + _e362.xy);
    vs_TEXCOORD0_.x = _e364.x;
    vs_TEXCOORD0_.y = _e364.y;
    let _e369 = u_xlat0_;
    let _e374 = _v_buffer2_.v_cb2_[19];
    let _e380 = _v_buffer2_.v_cb2_[19];
    let _e382 = (-(_e374.xz) + _e380.yw);
    u_xlat0_.x = _e382.x;
    u_xlat0_.y = _e382.y;
    let _e387 = u_xlat8_;
    let _e389 = in_TEXCOORD0_1;
    let _e394 = _v_buffer2_.v_cb2_[18];
    let _e400 = _v_buffer2_.v_cb2_[18];
    let _e402 = ((_e389.xy * _e394.xy) + _e400.zw);
    u_xlat8_.x = _e402.x;
    u_xlat8_.y = _e402.y;
    let _e407 = u_xlat0_;
    let _e409 = u_xlat8_;
    let _e411 = u_xlat0_;
    let _e417 = _v_buffer2_.v_cb2_[19];
    let _e419 = ((_e409.xx * _e411.xy) + _e417.xz);
    u_xlat0_.x = _e419.x;
    u_xlat0_.y = _e419.y;
    let _e425 = u_xlat0_;
    let _e428 = u_xlat0_;
    u_xlat4_.x = (-(_e425.x) + _e428.y);
    let _e432 = u_xlat8_;
    let _e434 = u_xlat4_;
    let _e437 = u_xlat0_;
    u_xlat0_.x = ((_e432.y * _e434.x) + _e437.x);
    let _e440 = u_xlat4_;
    let _e442 = u_xlat8_;
    let _e453 = ((_e442.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e453.x;
    u_xlat4_.y = _e453.y;
    let _e459 = u_xlat4_;
    let _e461 = u_xlat4_;
    u_xlat4_.x = dot(_e459.xy, _e461.xy);
    let _e465 = u_xlat4_;
    u_xlat4_.x = (-(_e465.x) + 1f);
    let _e471 = u_xlat4_;
    let _e476 = _v_buffer2_.v_cb2_[17];
    u_xlat4_.x = (_e471.x * _e476.x);
    let _e480 = u_xlat4_;
    u_xlat4_.x = clamp(_e480.x, 0f, 1f);
    let _e486 = u_xlat0_;
    let _e488 = u_xlat4_;
    u_xlat0_.x = (_e486.x * _e488.x);
    let _e492 = u_xlat0_;
    u_xlat0_.x = clamp(_e492.x, 0f, 1f);
    let _e498 = u_xlat0_;
    let _e500 = in_COLOR0_1;
    u_xlat4_.x = (_e498.x * _e500.w);
    let _e504 = in_COLOR0_1;
    let _e507 = u_xlat0_;
    u_xlat0_.x = ((-(_e504.w) * _e507.x) + 1f);
    let _e513 = u_xlat0_;
    let _e518 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e513.x + -(_e518.w));
    let _e523 = u_xlat4_;
    let _e528 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e523.x, _e528.x);
    let _e531 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e540 = u_xlat1_;
    let _e542 = in_COLOR0_1;
    let _e543 = _e542.xyz;
    u_xlat1_.x = _e543.x;
    u_xlat1_.y = _e543.y;
    u_xlat1_.z = _e543.z;
    u_xlat1_.w = 1f;
    let _e552 = u_xlat1_;
    let _e556 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e552 * _e556);
    let _e559 = u_xlat1_;
    let _e561 = u_xlat1_;
    u_xlat4_.x = max(_e559.y, _e561.x);
    let _e565 = u_xlat1_;
    let _e567 = u_xlat4_;
    u_xlat4_.x = max(_e565.z, _e567.x);
    let _e571 = u_xlat4_;
    u_xlat4_.x = ((_e571.x * 2f) + -1f);
    let _e579 = u_xlat4_;
    u_xlat4_.x = clamp(_e579.x, 0f, 1f);
    let _e585 = u_xlat4_;
    u_xlat2_.w = (-(_e585.x) + 1f);
    let _e590 = u_xlat2_;
    let _e592 = u_xlat1_;
    let _e594 = u_xlat1_;
    let _e596 = (_e592.xyz + _e594.xyz);
    u_xlat2_.x = _e596.x;
    u_xlat2_.y = _e596.y;
    u_xlat2_.z = _e596.z;
    let _e604 = u_xlat1_;
    let _e609 = _v_buffer2_.v_cb2_[2];
    u_xlat4_.x = (_e604.w * _e609.w);
    let _e612 = u_xlat4_;
    let _e614 = u_xlat2_;
    vs_COLOR0_ = (_e612.xxxx * _e614);
    let _e620 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = (_e620.y * 1.01f);
    let _e625 = u_xlat4_;
    let _e627 = u_xlat0_;
    u_xlat0_.x = max(_e625.x, _e627.x);
    let _e634 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = ((_e634.z * 2f) + 1f);
    let _e640 = u_xlat0_;
    let _e642 = u_xlat4_;
    let _e648 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e640.x * _e642.x) + -(_e648.z));
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
