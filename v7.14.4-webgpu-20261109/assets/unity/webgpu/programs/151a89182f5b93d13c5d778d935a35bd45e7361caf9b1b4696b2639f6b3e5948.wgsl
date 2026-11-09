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
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e337 = u_xlat0_;
    let _e342 = _v_buffer2_.v_cb2_[19];
    let _e348 = _v_buffer2_.v_cb2_[19];
    let _e350 = (-(_e342.xz) + _e348.yw);
    u_xlat0_.x = _e350.x;
    u_xlat0_.y = _e350.y;
    let _e355 = u_xlat8_;
    let _e357 = in_TEXCOORD0_1;
    let _e362 = _v_buffer2_.v_cb2_[18];
    let _e368 = _v_buffer2_.v_cb2_[18];
    let _e370 = ((_e357.xy * _e362.xy) + _e368.zw);
    u_xlat8_.x = _e370.x;
    u_xlat8_.y = _e370.y;
    let _e375 = u_xlat0_;
    let _e377 = u_xlat8_;
    let _e379 = u_xlat0_;
    let _e385 = _v_buffer2_.v_cb2_[19];
    let _e387 = ((_e377.xx * _e379.xy) + _e385.xz);
    u_xlat0_.x = _e387.x;
    u_xlat0_.y = _e387.y;
    let _e393 = u_xlat0_;
    let _e396 = u_xlat0_;
    u_xlat4_.x = (-(_e393.x) + _e396.y);
    let _e400 = u_xlat8_;
    let _e402 = u_xlat4_;
    let _e405 = u_xlat0_;
    u_xlat0_.x = ((_e400.y * _e402.x) + _e405.x);
    let _e408 = u_xlat4_;
    let _e410 = u_xlat8_;
    let _e421 = ((_e410.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e421.x;
    u_xlat4_.y = _e421.y;
    let _e427 = u_xlat4_;
    let _e429 = u_xlat4_;
    u_xlat4_.x = dot(_e427.xy, _e429.xy);
    let _e433 = u_xlat4_;
    u_xlat4_.x = (-(_e433.x) + 1f);
    let _e439 = u_xlat4_;
    let _e444 = _v_buffer2_.v_cb2_[17];
    u_xlat4_.x = (_e439.x * _e444.x);
    let _e448 = u_xlat4_;
    u_xlat4_.x = clamp(_e448.x, 0f, 1f);
    let _e454 = u_xlat0_;
    let _e456 = u_xlat4_;
    u_xlat0_.x = (_e454.x * _e456.x);
    let _e460 = u_xlat0_;
    u_xlat0_.x = clamp(_e460.x, 0f, 1f);
    let _e466 = u_xlat0_;
    let _e468 = in_COLOR0_1;
    u_xlat4_.x = (_e466.x * _e468.w);
    let _e472 = in_COLOR0_1;
    let _e475 = u_xlat0_;
    u_xlat0_.x = ((-(_e472.w) * _e475.x) + 1f);
    let _e481 = u_xlat0_;
    let _e486 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e481.x + -(_e486.w));
    let _e491 = u_xlat4_;
    let _e496 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e491.x, _e496.x);
    let _e499 = u_xlat1_;
    let _e501 = in_COLOR0_1;
    let _e502 = _e501.xyz;
    u_xlat1_.x = _e502.x;
    u_xlat1_.y = _e502.y;
    u_xlat1_.z = _e502.z;
    let _e509 = u_xlat1_;
    let _e513 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e509 * _e513);
    let _e516 = u_xlat1_;
    let _e518 = u_xlat1_;
    u_xlat4_.x = max(_e516.y, _e518.x);
    let _e522 = u_xlat1_;
    let _e524 = u_xlat4_;
    u_xlat4_.x = max(_e522.z, _e524.x);
    let _e528 = u_xlat4_;
    u_xlat4_.x = ((_e528.x * 2f) + -1f);
    let _e536 = u_xlat4_;
    u_xlat4_.x = clamp(_e536.x, 0f, 1f);
    let _e542 = u_xlat4_;
    u_xlat2_.w = (-(_e542.x) + 1f);
    let _e547 = u_xlat2_;
    let _e549 = u_xlat1_;
    let _e551 = u_xlat1_;
    let _e553 = (_e549.xyz + _e551.xyz);
    u_xlat2_.x = _e553.x;
    u_xlat2_.y = _e553.y;
    u_xlat2_.z = _e553.z;
    let _e561 = u_xlat1_;
    let _e566 = _v_buffer2_.v_cb2_[2];
    u_xlat4_.x = (_e561.w * _e566.w);
    let _e569 = u_xlat4_;
    let _e571 = u_xlat2_;
    vs_COLOR0_ = (_e569.xxxx * _e571);
    let _e577 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = (_e577.y * 1.01f);
    let _e582 = u_xlat4_;
    let _e584 = u_xlat0_;
    u_xlat0_.x = max(_e582.x, _e584.x);
    let _e591 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = ((_e591.z * 2f) + 1f);
    let _e597 = u_xlat0_;
    let _e599 = u_xlat4_;
    let _e605 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e597.x * _e599.x) + -(_e605.z));
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
