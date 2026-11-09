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
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e374 = u_xlat0_;
    let _e379 = _v_buffer2_.v_cb2_[19];
    let _e385 = _v_buffer2_.v_cb2_[19];
    let _e387 = (-(_e379.xz) + _e385.yw);
    u_xlat0_.x = _e387.x;
    u_xlat0_.y = _e387.y;
    let _e392 = u_xlat8_;
    let _e394 = in_TEXCOORD0_1;
    let _e399 = _v_buffer2_.v_cb2_[18];
    let _e405 = _v_buffer2_.v_cb2_[18];
    let _e407 = ((_e394.xy * _e399.xy) + _e405.zw);
    u_xlat8_.x = _e407.x;
    u_xlat8_.y = _e407.y;
    let _e412 = u_xlat0_;
    let _e414 = u_xlat8_;
    let _e416 = u_xlat0_;
    let _e422 = _v_buffer2_.v_cb2_[19];
    let _e424 = ((_e414.xx * _e416.xy) + _e422.xz);
    u_xlat0_.x = _e424.x;
    u_xlat0_.y = _e424.y;
    let _e430 = u_xlat0_;
    let _e433 = u_xlat0_;
    u_xlat4_.x = (-(_e430.x) + _e433.y);
    let _e437 = u_xlat8_;
    let _e439 = u_xlat4_;
    let _e442 = u_xlat0_;
    u_xlat0_.x = ((_e437.y * _e439.x) + _e442.x);
    let _e445 = u_xlat4_;
    let _e447 = u_xlat8_;
    let _e458 = ((_e447.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e458.x;
    u_xlat4_.y = _e458.y;
    let _e464 = u_xlat4_;
    let _e466 = u_xlat4_;
    u_xlat4_.x = dot(_e464.xy, _e466.xy);
    let _e470 = u_xlat4_;
    u_xlat4_.x = (-(_e470.x) + 1f);
    let _e476 = u_xlat4_;
    let _e481 = _v_buffer2_.v_cb2_[17];
    u_xlat4_.x = (_e476.x * _e481.x);
    let _e485 = u_xlat4_;
    u_xlat4_.x = clamp(_e485.x, 0f, 1f);
    let _e491 = u_xlat0_;
    let _e493 = u_xlat4_;
    u_xlat0_.x = (_e491.x * _e493.x);
    let _e497 = u_xlat0_;
    u_xlat0_.x = clamp(_e497.x, 0f, 1f);
    let _e503 = u_xlat0_;
    let _e505 = in_COLOR0_1;
    u_xlat4_.x = (_e503.x * _e505.w);
    let _e509 = in_COLOR0_1;
    let _e512 = u_xlat0_;
    u_xlat0_.x = ((-(_e509.w) * _e512.x) + 1f);
    let _e518 = u_xlat0_;
    let _e523 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e518.x + -(_e523.w));
    let _e528 = u_xlat4_;
    let _e533 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e528.x, _e533.x);
    let _e536 = u_xlat1_;
    let _e538 = in_COLOR0_1;
    let _e539 = _e538.xyz;
    u_xlat1_.x = _e539.x;
    u_xlat1_.y = _e539.y;
    u_xlat1_.z = _e539.z;
    let _e546 = u_xlat1_;
    let _e550 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e546 * _e550);
    let _e553 = u_xlat1_;
    let _e555 = u_xlat1_;
    u_xlat4_.x = max(_e553.y, _e555.x);
    let _e559 = u_xlat1_;
    let _e561 = u_xlat4_;
    u_xlat4_.x = max(_e559.z, _e561.x);
    let _e565 = u_xlat4_;
    u_xlat4_.x = ((_e565.x * 2f) + -1f);
    let _e573 = u_xlat4_;
    u_xlat4_.x = clamp(_e573.x, 0f, 1f);
    let _e579 = u_xlat4_;
    u_xlat2_.w = (-(_e579.x) + 1f);
    let _e584 = u_xlat2_;
    let _e586 = u_xlat1_;
    let _e588 = u_xlat1_;
    let _e590 = (_e586.xyz + _e588.xyz);
    u_xlat2_.x = _e590.x;
    u_xlat2_.y = _e590.y;
    u_xlat2_.z = _e590.z;
    let _e598 = u_xlat1_;
    let _e603 = _v_buffer2_.v_cb2_[2];
    u_xlat4_.x = (_e598.w * _e603.w);
    let _e606 = u_xlat4_;
    let _e608 = u_xlat2_;
    vs_COLOR0_ = (_e606.xxxx * _e608);
    let _e614 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = (_e614.y * 1.01f);
    let _e619 = u_xlat4_;
    let _e621 = u_xlat0_;
    u_xlat0_.x = max(_e619.x, _e621.x);
    let _e628 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = ((_e628.z * 2f) + 1f);
    let _e634 = u_xlat0_;
    let _e636 = u_xlat4_;
    let _e642 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e634.x * _e636.x) + -(_e642.z));
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
