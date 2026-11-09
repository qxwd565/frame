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
    let _e315 = vs_TEXCOORD0_;
    let _e320 = _v_buffer2_.v_cb2_[2];
    let _e322 = u_xlat8_;
    let _e325 = u_xlat0_;
    let _e327 = ((_e320.zz * _e322.xy) + _e325.xy);
    vs_TEXCOORD0_.x = _e327.x;
    vs_TEXCOORD0_.y = _e327.y;
    let _e332 = u_xlat0_;
    let _e337 = _v_buffer2_.v_cb2_[19];
    let _e343 = _v_buffer2_.v_cb2_[19];
    let _e345 = (-(_e337.xz) + _e343.yw);
    u_xlat0_.x = _e345.x;
    u_xlat0_.y = _e345.y;
    let _e350 = u_xlat8_;
    let _e352 = in_TEXCOORD0_1;
    let _e357 = _v_buffer2_.v_cb2_[18];
    let _e363 = _v_buffer2_.v_cb2_[18];
    let _e365 = ((_e352.xy * _e357.xy) + _e363.zw);
    u_xlat8_.x = _e365.x;
    u_xlat8_.y = _e365.y;
    let _e370 = u_xlat0_;
    let _e372 = u_xlat8_;
    let _e374 = u_xlat0_;
    let _e380 = _v_buffer2_.v_cb2_[19];
    let _e382 = ((_e372.xx * _e374.xy) + _e380.xz);
    u_xlat0_.x = _e382.x;
    u_xlat0_.y = _e382.y;
    let _e388 = u_xlat0_;
    let _e391 = u_xlat0_;
    u_xlat4_.x = (-(_e388.x) + _e391.y);
    let _e395 = u_xlat8_;
    let _e397 = u_xlat4_;
    let _e400 = u_xlat0_;
    u_xlat0_.x = ((_e395.y * _e397.x) + _e400.x);
    let _e403 = u_xlat4_;
    let _e405 = u_xlat8_;
    let _e416 = ((_e405.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e416.x;
    u_xlat4_.y = _e416.y;
    let _e422 = u_xlat4_;
    let _e424 = u_xlat4_;
    u_xlat4_.x = dot(_e422.xy, _e424.xy);
    let _e428 = u_xlat4_;
    u_xlat4_.x = (-(_e428.x) + 1f);
    let _e434 = u_xlat4_;
    let _e439 = _v_buffer2_.v_cb2_[17];
    u_xlat4_.x = (_e434.x * _e439.x);
    let _e443 = u_xlat4_;
    u_xlat4_.x = clamp(_e443.x, 0f, 1f);
    let _e449 = u_xlat0_;
    let _e451 = u_xlat4_;
    u_xlat0_.x = (_e449.x * _e451.x);
    let _e455 = u_xlat0_;
    u_xlat0_.x = clamp(_e455.x, 0f, 1f);
    let _e461 = u_xlat0_;
    let _e463 = in_COLOR0_1;
    u_xlat4_.x = (_e461.x * _e463.w);
    let _e467 = in_COLOR0_1;
    let _e470 = u_xlat0_;
    u_xlat0_.x = ((-(_e467.w) * _e470.x) + 1f);
    let _e476 = u_xlat0_;
    let _e481 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e476.x + -(_e481.w));
    let _e486 = u_xlat4_;
    let _e491 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e486.x, _e491.x);
    let _e494 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e503 = u_xlat1_;
    let _e505 = in_COLOR0_1;
    let _e506 = _e505.xyz;
    u_xlat1_.x = _e506.x;
    u_xlat1_.y = _e506.y;
    u_xlat1_.z = _e506.z;
    u_xlat1_.w = 1f;
    let _e515 = u_xlat1_;
    let _e519 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e515 * _e519);
    let _e522 = u_xlat1_;
    let _e524 = u_xlat1_;
    u_xlat4_.x = max(_e522.y, _e524.x);
    let _e528 = u_xlat1_;
    let _e530 = u_xlat4_;
    u_xlat4_.x = max(_e528.z, _e530.x);
    let _e534 = u_xlat4_;
    u_xlat4_.x = ((_e534.x * 2f) + -1f);
    let _e542 = u_xlat4_;
    u_xlat4_.x = clamp(_e542.x, 0f, 1f);
    let _e548 = u_xlat4_;
    u_xlat2_.w = (-(_e548.x) + 1f);
    let _e553 = u_xlat2_;
    let _e555 = u_xlat1_;
    let _e557 = u_xlat1_;
    let _e559 = (_e555.xyz + _e557.xyz);
    u_xlat2_.x = _e559.x;
    u_xlat2_.y = _e559.y;
    u_xlat2_.z = _e559.z;
    let _e567 = u_xlat1_;
    let _e572 = _v_buffer2_.v_cb2_[2];
    u_xlat4_.x = (_e567.w * _e572.w);
    let _e575 = u_xlat4_;
    let _e577 = u_xlat2_;
    vs_COLOR0_ = (_e575.xxxx * _e577);
    let _e583 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = (_e583.y * 1.01f);
    let _e588 = u_xlat4_;
    let _e590 = u_xlat0_;
    u_xlat0_.x = max(_e588.x, _e590.x);
    let _e597 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = ((_e597.z * 2f) + 1f);
    let _e603 = u_xlat0_;
    let _e605 = u_xlat4_;
    let _e611 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e603.x * _e605.x) + -(_e611.z));
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
