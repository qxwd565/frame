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
    u_xlat1_ = (_e65 + _e69);
    let _e71 = u_xlat0_;
    let _e76 = _v_buffer1_.v_cb1_[3];
    let _e78 = in_POSITION0_1;
    let _e81 = u_xlat0_;
    let _e83 = ((_e76.xz * _e78.ww) + _e81.xz);
    u_xlat0_.x = _e83.x;
    u_xlat0_.y = _e83.y;
    let _e88 = u_xlat0_;
    let _e90 = u_xlat0_;
    let _e95 = _v_buffer2_.v_cb2_[4];
    let _e101 = _v_buffer2_.v_cb2_[4];
    let _e103 = ((_e90.xy * _e95.xy) + _e101.zw);
    u_xlat0_.x = _e103.x;
    u_xlat0_.y = _e103.y;
    let _e108 = u_xlat1_;
    let _e113 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e108.yyyy * _e113);
    let _e118 = _v_buffer0_.v_cb0_[79];
    let _e119 = u_xlat1_;
    let _e122 = u_xlat2_;
    u_xlat2_ = ((_e118 * _e119.xxxx) + _e122);
    let _e127 = _v_buffer0_.v_cb0_[81];
    let _e128 = u_xlat1_;
    let _e131 = u_xlat2_;
    u_xlat2_ = ((_e127 * _e128.zzzz) + _e131);
    let _e137 = _v_buffer0_.v_cb0_[82];
    let _e138 = u_xlat1_;
    let _e141 = u_xlat2_;
    gl_Position = ((_e137 * _e138.wwww) + _e141);
    let _e143 = u_xlat8_;
    let _e145 = u_xlat0_;
    let _e148 = u_xlat0_;
    let _e150 = (-(_e145.xy) + _e148.yx);
    u_xlat8_.x = _e150.x;
    u_xlat8_.y = _e150.y;
    let _e155 = u_xlat0_;
    let _e160 = _v_buffer2_.v_cb2_[6];
    let _e162 = u_xlat8_;
    let _e165 = u_xlat0_;
    let _e167 = ((_e160.yy * _e162.xy) + _e165.xy);
    u_xlat0_.x = _e167.x;
    u_xlat0_.y = _e167.y;
    let _e172 = u_xlat8_;
    let _e177 = _v_buffer0_.v_cb0_[15];
    let _e182 = _v_buffer2_.v_cb2_[5];
    let _e184 = (_e177.zz * _e182.xy);
    u_xlat8_.x = _e184.x;
    u_xlat8_.y = _e184.y;
    let _e189 = u_xlat8_;
    let _e191 = u_xlat8_;
    let _e193 = fract(_e191.xy);
    u_xlat8_.x = _e193.x;
    u_xlat8_.y = _e193.y;
    let _e198 = u_xlat0_;
    let _e200 = u_xlat8_;
    let _e202 = u_xlat0_;
    let _e204 = (_e200.xy + _e202.xy);
    u_xlat0_.x = _e204.x;
    u_xlat0_.y = _e204.y;
    let _e209 = u_xlat0_;
    let _e214 = _v_buffer2_.v_cb2_[4];
    let _e221 = u_xlat0_;
    let _e223 = ((-(_e214.xy) * vec2<f32>(0.5f, 0.5f)) + _e221.xy);
    u_xlat0_.x = _e223.x;
    u_xlat0_.y = _e223.y;
    let _e232 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e232.w * 0.017453289f);
    let _e240 = _v_buffer2_.v_cb2_[6];
    let _e245 = _v_buffer0_.v_cb0_[15];
    let _e248 = u_xlat8_;
    u_xlat8_.x = ((_e240.z * _e245.z) + -(_e248.x));
    let _e253 = u_xlat8_;
    u_xlat1_.x = sin(_e253.x);
    let _e257 = u_xlat8_;
    u_xlat2_.x = cos(_e257.x);
    let _e261 = u_xlat1_;
    u_xlat3_.z = _e261.x;
    let _e264 = u_xlat2_;
    u_xlat3_.y = _e264.x;
    let _e267 = u_xlat1_;
    u_xlat3_.x = -(_e267.x);
    let _e271 = u_xlat0_;
    let _e273 = u_xlat3_;
    u_xlat8_.y = dot(_e271.xy, _e273.xy);
    let _e277 = u_xlat0_;
    let _e279 = u_xlat3_;
    u_xlat8_.x = dot(_e277.xy, _e279.yz);
    let _e282 = vs_TEXCOORD0_;
    let _e287 = _v_buffer2_.v_cb2_[4];
    let _e293 = u_xlat8_;
    let _e295 = ((_e287.xy * vec2<f32>(0.5f, 0.5f)) + _e293.xy);
    vs_TEXCOORD0_.z = _e295.x;
    vs_TEXCOORD0_.w = _e295.y;
    let _e300 = u_xlat0_;
    let _e302 = in_TEXCOORD0_1;
    let _e307 = _v_buffer2_.v_cb2_[1];
    let _e313 = _v_buffer2_.v_cb2_[1];
    let _e315 = ((_e302.xy * _e307.xy) + _e313.zw);
    u_xlat0_.x = _e315.x;
    u_xlat0_.y = _e315.y;
    let _e320 = u_xlat8_;
    let _e322 = u_xlat0_;
    let _e325 = u_xlat0_;
    let _e327 = (-(_e322.xy) + _e325.yx);
    u_xlat8_.x = _e327.x;
    u_xlat8_.y = _e327.y;
    let _e332 = u_xlat0_;
    let _e337 = _v_buffer2_.v_cb2_[2];
    let _e339 = u_xlat8_;
    let _e342 = u_xlat0_;
    let _e344 = ((_e337.zz * _e339.xy) + _e342.xy);
    u_xlat0_.x = _e344.x;
    u_xlat0_.y = _e344.y;
    let _e349 = u_xlat8_;
    let _e354 = _v_buffer0_.v_cb0_[15];
    let _e359 = _v_buffer2_.v_cb2_[11];
    let _e361 = (_e354.zz * _e359.yz);
    u_xlat8_.x = _e361.x;
    u_xlat8_.y = _e361.y;
    let _e366 = u_xlat8_;
    let _e368 = u_xlat8_;
    let _e370 = fract(_e368.xy);
    u_xlat8_.x = _e370.x;
    u_xlat8_.y = _e370.y;
    let _e375 = vs_TEXCOORD0_;
    let _e377 = u_xlat8_;
    let _e379 = u_xlat0_;
    let _e381 = (_e377.xy + _e379.xy);
    vs_TEXCOORD0_.x = _e381.x;
    vs_TEXCOORD0_.y = _e381.y;
    let _e386 = u_xlat0_;
    let _e391 = _v_buffer2_.v_cb2_[19];
    let _e397 = _v_buffer2_.v_cb2_[19];
    let _e399 = (-(_e391.xz) + _e397.yw);
    u_xlat0_.x = _e399.x;
    u_xlat0_.y = _e399.y;
    let _e404 = u_xlat8_;
    let _e406 = in_TEXCOORD0_1;
    let _e411 = _v_buffer2_.v_cb2_[18];
    let _e417 = _v_buffer2_.v_cb2_[18];
    let _e419 = ((_e406.xy * _e411.xy) + _e417.zw);
    u_xlat8_.x = _e419.x;
    u_xlat8_.y = _e419.y;
    let _e424 = u_xlat0_;
    let _e426 = u_xlat8_;
    let _e428 = u_xlat0_;
    let _e434 = _v_buffer2_.v_cb2_[19];
    let _e436 = ((_e426.xx * _e428.xy) + _e434.xz);
    u_xlat0_.x = _e436.x;
    u_xlat0_.y = _e436.y;
    let _e442 = u_xlat0_;
    let _e445 = u_xlat0_;
    u_xlat4_.x = (-(_e442.x) + _e445.y);
    let _e449 = u_xlat8_;
    let _e451 = u_xlat4_;
    let _e454 = u_xlat0_;
    u_xlat0_.x = ((_e449.y * _e451.x) + _e454.x);
    let _e457 = u_xlat4_;
    let _e459 = u_xlat8_;
    let _e470 = ((_e459.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat4_.x = _e470.x;
    u_xlat4_.y = _e470.y;
    let _e476 = u_xlat4_;
    let _e478 = u_xlat4_;
    u_xlat4_.x = dot(_e476.xy, _e478.xy);
    let _e482 = u_xlat4_;
    u_xlat4_.x = (-(_e482.x) + 1f);
    let _e488 = u_xlat4_;
    let _e493 = _v_buffer2_.v_cb2_[17];
    u_xlat4_.x = (_e488.x * _e493.x);
    let _e497 = u_xlat4_;
    u_xlat4_.x = clamp(_e497.x, 0f, 1f);
    let _e503 = u_xlat0_;
    let _e505 = u_xlat4_;
    u_xlat0_.x = (_e503.x * _e505.x);
    let _e509 = u_xlat0_;
    u_xlat0_.x = clamp(_e509.x, 0f, 1f);
    let _e515 = u_xlat0_;
    let _e517 = in_COLOR0_1;
    u_xlat4_.x = (_e515.x * _e517.w);
    let _e521 = in_COLOR0_1;
    let _e524 = u_xlat0_;
    u_xlat0_.x = ((-(_e521.w) * _e524.x) + 1f);
    let _e530 = u_xlat0_;
    let _e535 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e530.x + -(_e535.w));
    let _e540 = u_xlat4_;
    let _e545 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e540.x, _e545.x);
    let _e548 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e557 = u_xlat1_;
    let _e559 = in_COLOR0_1;
    let _e560 = _e559.xyz;
    u_xlat1_.x = _e560.x;
    u_xlat1_.y = _e560.y;
    u_xlat1_.z = _e560.z;
    u_xlat1_.w = 1f;
    let _e569 = u_xlat1_;
    let _e573 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e569 * _e573);
    let _e576 = u_xlat1_;
    let _e578 = u_xlat1_;
    u_xlat4_.x = max(_e576.y, _e578.x);
    let _e582 = u_xlat1_;
    let _e584 = u_xlat4_;
    u_xlat4_.x = max(_e582.z, _e584.x);
    let _e588 = u_xlat4_;
    u_xlat4_.x = ((_e588.x * 2f) + -1f);
    let _e596 = u_xlat4_;
    u_xlat4_.x = clamp(_e596.x, 0f, 1f);
    let _e602 = u_xlat4_;
    u_xlat2_.w = (-(_e602.x) + 1f);
    let _e607 = u_xlat2_;
    let _e609 = u_xlat1_;
    let _e611 = u_xlat1_;
    let _e613 = (_e609.xyz + _e611.xyz);
    u_xlat2_.x = _e613.x;
    u_xlat2_.y = _e613.y;
    u_xlat2_.z = _e613.z;
    let _e621 = u_xlat1_;
    let _e626 = _v_buffer2_.v_cb2_[2];
    u_xlat4_.x = (_e621.w * _e626.w);
    let _e629 = u_xlat4_;
    let _e631 = u_xlat2_;
    vs_COLOR0_ = (_e629.xxxx * _e631);
    let _e637 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = (_e637.y * 1.01f);
    let _e642 = u_xlat4_;
    let _e644 = u_xlat0_;
    u_xlat0_.x = max(_e642.x, _e644.x);
    let _e651 = _v_buffer2_.v_cb2_[12];
    u_xlat4_.x = ((_e651.z * 2f) + 1f);
    let _e657 = u_xlat0_;
    let _e659 = u_xlat4_;
    let _e665 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e657.x * _e659.x) + -(_e665.z));
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
