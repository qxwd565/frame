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
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e37 = in_POSITION0_1;
    let _e42 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e37.yyyy * _e42);
    let _e47 = _v_buffer1_.v_cb1_[0];
    let _e48 = in_POSITION0_1;
    let _e51 = u_xlat0_;
    u_xlat0_ = ((_e47 * _e48.xxxx) + _e51);
    let _e56 = _v_buffer1_.v_cb1_[2];
    let _e57 = in_POSITION0_1;
    let _e60 = u_xlat0_;
    u_xlat0_ = ((_e56 * _e57.zzzz) + _e60);
    let _e62 = u_xlat0_;
    let _e66 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e62 + _e66);
    let _e68 = u_xlat0_;
    let _e73 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e68.yyyy * _e73);
    let _e78 = _v_buffer0_.v_cb0_[79];
    let _e79 = u_xlat0_;
    let _e82 = u_xlat1_;
    u_xlat1_ = ((_e78 * _e79.xxxx) + _e82);
    let _e87 = _v_buffer0_.v_cb0_[81];
    let _e88 = u_xlat0_;
    let _e91 = u_xlat1_;
    u_xlat1_ = ((_e87 * _e88.zzzz) + _e91);
    let _e97 = _v_buffer0_.v_cb0_[82];
    let _e98 = u_xlat0_;
    let _e101 = u_xlat1_;
    gl_Position = ((_e97 * _e98.wwww) + _e101);
    let _e103 = u_xlat0_;
    let _e105 = in_TEXCOORD0_1;
    let _e110 = _v_buffer2_.v_cb2_[4];
    let _e116 = _v_buffer2_.v_cb2_[4];
    let _e118 = ((_e105.xy * _e110.xy) + _e116.zw);
    u_xlat0_.x = _e118.x;
    u_xlat0_.y = _e118.y;
    let _e123 = u_xlat8_;
    let _e125 = u_xlat0_;
    let _e128 = u_xlat0_;
    let _e130 = (-(_e125.xy) + _e128.yx);
    u_xlat8_.x = _e130.x;
    u_xlat8_.y = _e130.y;
    let _e135 = u_xlat0_;
    let _e140 = _v_buffer2_.v_cb2_[6];
    let _e142 = u_xlat8_;
    let _e145 = u_xlat0_;
    let _e147 = ((_e140.yy * _e142.xy) + _e145.xy);
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    let _e152 = u_xlat8_;
    let _e157 = _v_buffer0_.v_cb0_[15];
    let _e162 = _v_buffer2_.v_cb2_[5];
    let _e164 = (_e157.zz * _e162.xy);
    u_xlat8_.x = _e164.x;
    u_xlat8_.y = _e164.y;
    let _e169 = u_xlat8_;
    let _e171 = u_xlat8_;
    let _e173 = fract(_e171.xy);
    u_xlat8_.x = _e173.x;
    u_xlat8_.y = _e173.y;
    let _e178 = u_xlat0_;
    let _e180 = u_xlat8_;
    let _e182 = u_xlat0_;
    let _e184 = (_e180.xy + _e182.xy);
    u_xlat0_.x = _e184.x;
    u_xlat0_.y = _e184.y;
    let _e189 = u_xlat0_;
    let _e194 = _v_buffer2_.v_cb2_[4];
    let _e201 = u_xlat0_;
    let _e203 = ((-(_e194.xy) * vec2<f32>(0.5f, 0.5f)) + _e201.xy);
    u_xlat0_.x = _e203.x;
    u_xlat0_.y = _e203.y;
    let _e212 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e212.w * 0.017453289f);
    let _e220 = _v_buffer2_.v_cb2_[6];
    let _e225 = _v_buffer0_.v_cb0_[15];
    let _e228 = u_xlat8_;
    u_xlat8_.x = ((_e220.z * _e225.z) + -(_e228.x));
    let _e233 = u_xlat8_;
    u_xlat1_.x = sin(_e233.x);
    let _e236 = u_xlat8_;
    u_xlat2_ = cos(_e236.x);
    let _e240 = u_xlat1_;
    u_xlat3_.z = _e240.x;
    let _e243 = u_xlat2_;
    u_xlat3_.y = _e243;
    let _e245 = u_xlat1_;
    u_xlat3_.x = -(_e245.x);
    let _e249 = u_xlat0_;
    let _e251 = u_xlat3_;
    u_xlat8_.y = dot(_e249.xy, _e251.xy);
    let _e255 = u_xlat0_;
    let _e257 = u_xlat3_;
    u_xlat8_.x = dot(_e255.xy, _e257.yz);
    let _e260 = vs_TEXCOORD0_;
    let _e265 = _v_buffer2_.v_cb2_[4];
    let _e271 = u_xlat8_;
    let _e273 = ((_e265.xy * vec2<f32>(0.5f, 0.5f)) + _e271.xy);
    vs_TEXCOORD0_.z = _e273.x;
    vs_TEXCOORD0_.w = _e273.y;
    let _e278 = u_xlat0_;
    let _e280 = in_TEXCOORD0_1;
    let _e285 = _v_buffer2_.v_cb2_[1];
    let _e291 = _v_buffer2_.v_cb2_[1];
    let _e293 = ((_e280.xy * _e285.xy) + _e291.zw);
    u_xlat0_.x = _e293.x;
    u_xlat0_.y = _e293.y;
    let _e298 = u_xlat8_;
    let _e300 = u_xlat0_;
    let _e303 = u_xlat0_;
    let _e305 = (-(_e300.xy) + _e303.yx);
    u_xlat8_.x = _e305.x;
    u_xlat8_.y = _e305.y;
    let _e310 = u_xlat0_;
    let _e315 = _v_buffer2_.v_cb2_[2];
    let _e317 = u_xlat8_;
    let _e320 = u_xlat0_;
    let _e322 = ((_e315.zz * _e317.xy) + _e320.xy);
    u_xlat0_.x = _e322.x;
    u_xlat0_.y = _e322.y;
    let _e327 = u_xlat8_;
    let _e332 = _v_buffer0_.v_cb0_[15];
    let _e337 = _v_buffer2_.v_cb2_[11];
    let _e339 = (_e332.zz * _e337.yz);
    u_xlat8_.x = _e339.x;
    u_xlat8_.y = _e339.y;
    let _e344 = u_xlat8_;
    let _e346 = u_xlat8_;
    let _e348 = fract(_e346.xy);
    u_xlat8_.x = _e348.x;
    u_xlat8_.y = _e348.y;
    let _e353 = vs_TEXCOORD0_;
    let _e355 = u_xlat8_;
    let _e357 = u_xlat0_;
    let _e359 = (_e355.xy + _e357.xy);
    vs_TEXCOORD0_.x = _e359.x;
    vs_TEXCOORD0_.y = _e359.y;
    let _e364 = u_xlat0_;
    let _e369 = _v_buffer2_.v_cb2_[19];
    let _e375 = _v_buffer2_.v_cb2_[19];
    let _e377 = (-(_e369.xz) + _e375.yw);
    u_xlat0_.x = _e377.x;
    u_xlat0_.y = _e377.y;
    let _e382 = u_xlat8_;
    let _e384 = in_TEXCOORD0_1;
    let _e389 = _v_buffer2_.v_cb2_[18];
    let _e395 = _v_buffer2_.v_cb2_[18];
    let _e397 = ((_e384.xy * _e389.xy) + _e395.zw);
    u_xlat8_.x = _e397.x;
    u_xlat8_.y = _e397.y;
    let _e402 = u_xlat0_;
    let _e404 = u_xlat8_;
    let _e406 = u_xlat0_;
    let _e412 = _v_buffer2_.v_cb2_[19];
    let _e414 = ((_e404.xx * _e406.xy) + _e412.xz);
    u_xlat0_.x = _e414.x;
    u_xlat0_.y = _e414.y;
    let _e420 = u_xlat0_;
    let _e423 = u_xlat0_;
    u_xlat4_.x = (-(_e420.x) + _e423.y);
    let _e427 = u_xlat8_;
    let _e429 = u_xlat4_;
    let _e432 = u_xlat0_;
    u_xlat0_.x = ((_e427.y * _e429.x) + _e432.x);
    let _e435 = u_xlat4_;
    let _e437 = u_xlat8_;
    let _e448 = ((_e437.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e448.x;
    u_xlat4_.y = _e448.y;
    let _e454 = u_xlat4_;
    let _e456 = u_xlat4_;
    u_xlat4_.x = dot(_e454.xy, _e456.xy);
    let _e460 = u_xlat4_;
    u_xlat4_.x = (-(_e460.x) + 1f);
    let _e466 = u_xlat4_;
    let _e471 = _v_buffer2_.v_cb2_[17];
    u_xlat4_.x = (_e466.x * _e471.x);
    let _e475 = u_xlat4_;
    u_xlat4_.x = clamp(_e475.x, 0f, 1f);
    let _e481 = u_xlat0_;
    let _e483 = u_xlat4_;
    u_xlat0_.x = (_e481.x * _e483.x);
    let _e487 = u_xlat0_;
    u_xlat0_.x = clamp(_e487.x, 0f, 1f);
    let _e493 = u_xlat0_;
    let _e495 = in_COLOR0_1;
    u_xlat0_.w = (_e493.x * _e495.w);
    let _e498 = u_xlat0_;
    let _e500 = in_COLOR0_1;
    let _e501 = _e500.xyz;
    u_xlat0_.x = _e501.x;
    u_xlat0_.y = _e501.y;
    u_xlat0_.z = _e501.z;
    let _e508 = u_xlat0_;
    let _e512 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e508 * _e512);
    let _e515 = u_xlat0_;
    let _e517 = u_xlat0_;
    u_xlat1_.x = max(_e515.y, _e517.x);
    let _e521 = u_xlat0_;
    let _e523 = u_xlat1_;
    u_xlat1_.x = max(_e521.z, _e523.x);
    let _e527 = u_xlat1_;
    u_xlat1_.x = ((_e527.x * 2f) + -1f);
    let _e535 = u_xlat1_;
    u_xlat1_.x = clamp(_e535.x, 0f, 1f);
    let _e541 = u_xlat1_;
    u_xlat1_.w = (-(_e541.x) + 1f);
    let _e546 = u_xlat1_;
    let _e548 = u_xlat0_;
    let _e550 = u_xlat0_;
    let _e552 = (_e548.xyz + _e550.xyz);
    u_xlat1_.x = _e552.x;
    u_xlat1_.y = _e552.y;
    u_xlat1_.z = _e552.z;
    let _e560 = u_xlat0_;
    let _e565 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e560.w * _e565.w);
    let _e568 = u_xlat0_;
    let _e570 = u_xlat1_;
    vs_COLOR0_ = (_e568.xxxx * _e570);
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
