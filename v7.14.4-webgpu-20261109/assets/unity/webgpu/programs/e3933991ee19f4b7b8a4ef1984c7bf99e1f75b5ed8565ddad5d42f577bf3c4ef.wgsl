struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 21>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(4) vs_TEXCOORD4_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(2) @binding(1) 
var samplerv_s0_: sampler;
@group(2) @binding(0) 
var v_t0_: texture_2d<f32>;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD4_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat5_: vec2<f32> = vec2(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e49 = in_POSITION0_1;
    let _e54 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e49.yyyy * _e54);
    let _e59 = _v_buffer1_.v_cb1_[0];
    let _e60 = in_POSITION0_1;
    let _e63 = u_xlat0_;
    u_xlat0_ = ((_e59 * _e60.xxxx) + _e63);
    let _e68 = _v_buffer1_.v_cb1_[2];
    let _e69 = in_POSITION0_1;
    let _e72 = u_xlat0_;
    u_xlat0_ = ((_e68 * _e69.zzzz) + _e72);
    let _e77 = _v_buffer1_.v_cb1_[3];
    let _e78 = in_POSITION0_1;
    let _e81 = u_xlat0_;
    u_xlat0_ = ((_e77 * _e78.wwww) + _e81);
    let _e83 = u_xlat1_;
    let _e85 = u_xlat0_;
    let _e90 = _v_buffer2_.v_cb2_[1];
    let _e96 = _v_buffer2_.v_cb2_[1];
    let _e98 = ((_e85.xy * _e90.xy) + _e96.zw);
    u_xlat1_.x = _e98.x;
    u_xlat1_.y = _e98.y;
    let _e103 = u_xlat1_;
    let _e108 = _v_buffer0_.v_cb0_[15];
    let _e113 = _v_buffer2_.v_cb2_[15];
    let _e116 = u_xlat1_;
    let _e118 = ((_e108.xx * _e113.xx) + _e116.xy);
    u_xlat1_.x = _e118.x;
    u_xlat1_.y = _e118.y;
    let _e123 = u_xlat1_;
    let _e126 = textureSampleLevel(v_t0_, samplerv_s0_, _e123.xy, 0f);
    u_xlat1_ = _e126;
    let _e127 = u_xlat1_;
    u_xlat1_ = (_e127 + vec4<f32>(-0.5f, -0.5f, -0.5f, -0.5f));
    let _e138 = u_xlat1_;
    u_xlat1_ = (_e138 * vec4<f32>(0.5f, 0.5f, 0.5f, 0.5f));
    let _e145 = u_xlat1_;
    let _e149 = _v_buffer2_.v_cb2_[15];
    let _e152 = u_xlat0_;
    u_xlat0_ = ((_e145 * _e149.yyyy) + _e152);
    let _e154 = u_xlat0_;
    let _e158 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e154 + -(_e158));
    let _e161 = u_xlat0_;
    let _e165 = _v_buffer2_.v_cb2_[16];
    u_xlat0_ = (_e161 * _e165);
    let _e167 = u_xlat0_;
    let _e172 = _v_buffer2_.v_cb2_[18];
    u_xlat1_ = (_e167.yyyy * _e172);
    let _e177 = _v_buffer2_.v_cb2_[17];
    let _e178 = u_xlat0_;
    let _e181 = u_xlat1_;
    u_xlat1_ = ((_e177 * _e178.xxxx) + _e181);
    let _e186 = _v_buffer2_.v_cb2_[19];
    let _e187 = u_xlat0_;
    let _e190 = u_xlat1_;
    u_xlat1_ = ((_e186 * _e187.zzzz) + _e190);
    let _e195 = _v_buffer2_.v_cb2_[20];
    let _e196 = u_xlat0_;
    let _e199 = u_xlat1_;
    u_xlat0_ = ((_e195 * _e196.wwww) + _e199);
    let _e201 = u_xlat1_;
    let _e203 = u_xlat0_;
    let _e208 = _v_buffer1_.v_cb1_[5];
    let _e210 = (_e203.yyy * _e208.xyz);
    u_xlat1_.x = _e210.x;
    u_xlat1_.y = _e210.y;
    u_xlat1_.z = _e210.z;
    let _e217 = u_xlat1_;
    let _e222 = _v_buffer1_.v_cb1_[4];
    let _e224 = u_xlat0_;
    let _e227 = u_xlat1_;
    let _e229 = ((_e222.xyz * _e224.xxx) + _e227.xyz);
    u_xlat1_.x = _e229.x;
    u_xlat1_.y = _e229.y;
    u_xlat1_.z = _e229.z;
    let _e236 = u_xlat0_;
    let _e241 = _v_buffer1_.v_cb1_[6];
    let _e243 = u_xlat0_;
    let _e246 = u_xlat1_;
    let _e248 = ((_e241.xyz * _e243.zzz) + _e246.xyz);
    u_xlat0_.x = _e248.x;
    u_xlat0_.y = _e248.y;
    u_xlat0_.z = _e248.z;
    let _e255 = u_xlat0_;
    let _e260 = _v_buffer1_.v_cb1_[7];
    let _e262 = u_xlat0_;
    let _e265 = u_xlat0_;
    let _e267 = ((_e260.xyz * _e262.www) + _e265.xyz);
    u_xlat0_.x = _e267.x;
    u_xlat0_.y = _e267.y;
    u_xlat0_.z = _e267.z;
    let _e274 = u_xlat0_;
    let _e279 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e274.yyyy * _e279);
    let _e284 = _v_buffer1_.v_cb1_[0];
    let _e285 = u_xlat0_;
    let _e288 = u_xlat1_;
    u_xlat1_ = ((_e284 * _e285.xxxx) + _e288);
    let _e293 = _v_buffer1_.v_cb1_[2];
    let _e294 = u_xlat0_;
    let _e297 = u_xlat1_;
    u_xlat0_ = ((_e293 * _e294.zzzz) + _e297);
    let _e299 = u_xlat0_;
    let _e303 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e299 + _e303);
    let _e305 = u_xlat0_;
    let _e310 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e305.yyyy * _e310);
    let _e315 = _v_buffer0_.v_cb0_[79];
    let _e316 = u_xlat0_;
    let _e319 = u_xlat1_;
    u_xlat1_ = ((_e315 * _e316.xxxx) + _e319);
    let _e324 = _v_buffer0_.v_cb0_[81];
    let _e325 = u_xlat0_;
    let _e328 = u_xlat1_;
    u_xlat1_ = ((_e324 * _e325.zzzz) + _e328);
    let _e334 = _v_buffer0_.v_cb0_[82];
    let _e335 = u_xlat0_;
    let _e338 = u_xlat1_;
    gl_Position = ((_e334 * _e335.wwww) + _e338);
    let _e340 = vs_TEXCOORD1_;
    let _e342 = u_xlat0_;
    let _e343 = _e342.xyz;
    vs_TEXCOORD1_.x = _e343.x;
    vs_TEXCOORD1_.y = _e343.y;
    vs_TEXCOORD1_.z = _e343.z;
    let _e354 = _v_buffer0_.v_cb0_[15];
    let _e359 = _v_buffer2_.v_cb2_[13];
    let _e365 = _v_buffer2_.v_cb2_[13];
    u_xlat0_.x = ((_e354.x * _e359.y) + _e365.x);
    let _e369 = u_xlat0_;
    u_xlat1_.x = cos(_e369.x);
    let _e373 = u_xlat0_;
    u_xlat0_.x = sin(_e373.x);
    let _e377 = u_xlat0_;
    u_xlat2_.z = _e377.x;
    let _e379 = u_xlat4_;
    let _e381 = in_TEXCOORD0_1;
    let _e386 = _v_buffer2_.v_cb2_[0];
    let _e392 = _v_buffer2_.v_cb2_[0];
    let _e394 = ((_e381.xy * _e386.xy) + _e392.zw);
    u_xlat4_.x = _e394.x;
    u_xlat4_.y = _e394.y;
    let _e399 = u_xlat5_;
    let _e404 = _v_buffer2_.v_cb2_[12];
    let _e410 = _v_buffer2_.v_cb2_[13];
    let _e412 = (-(_e404.xy) + _e410.zw);
    u_xlat5_.x = _e412.x;
    u_xlat5_.y = _e412.y;
    let _e417 = u_xlat3_;
    let _e419 = u_xlat4_;
    let _e421 = u_xlat5_;
    let _e424 = (_e419.xy + -(_e421.xy));
    u_xlat3_.x = _e424.x;
    u_xlat3_.y = _e424.y;
    let _e429 = vs_TEXCOORD0_;
    let _e431 = u_xlat4_;
    let _e432 = _e431.xy;
    vs_TEXCOORD0_.x = _e432.x;
    vs_TEXCOORD0_.y = _e432.y;
    let _e438 = u_xlat1_;
    u_xlat2_.y = _e438.x;
    let _e441 = u_xlat0_;
    u_xlat2_.x = -(_e441.x);
    let _e445 = u_xlat3_;
    let _e447 = u_xlat2_;
    u_xlat8_.y = dot(_e445.xy, _e447.xy);
    let _e451 = u_xlat3_;
    let _e453 = u_xlat2_;
    u_xlat8_.x = dot(_e451.xy, _e453.yz);
    let _e456 = u_xlat0_;
    let _e458 = u_xlat5_;
    let _e460 = u_xlat8_;
    let _e462 = (_e458.xy + _e460.xy);
    u_xlat0_.x = _e462.x;
    u_xlat0_.y = _e462.y;
    let _e467 = u_xlat8_;
    let _e472 = _v_buffer2_.v_cb2_[12];
    let _e478 = _v_buffer2_.v_cb2_[14];
    let _e480 = (-(_e472.xy) + _e478.zw);
    u_xlat8_.x = _e480.x;
    u_xlat8_.y = _e480.y;
    let _e485 = u_xlat0_;
    let _e487 = u_xlat8_;
    let _e490 = u_xlat0_;
    let _e492 = (-(_e487.xy) + _e490.xy);
    u_xlat0_.x = _e492.x;
    u_xlat0_.y = _e492.y;
    let _e497 = u_xlat0_;
    let _e499 = u_xlat0_;
    let _e504 = _v_buffer2_.v_cb2_[14];
    let _e507 = u_xlat8_;
    let _e509 = ((_e499.xy * _e504.xy) + _e507.xy);
    u_xlat0_.x = _e509.x;
    u_xlat0_.y = _e509.y;
    let _e514 = u_xlat8_;
    let _e519 = _v_buffer2_.v_cb2_[12];
    let _e524 = _v_buffer0_.v_cb0_[15];
    let _e530 = _v_buffer2_.v_cb2_[12];
    let _e532 = ((_e519.zw * _e524.xx) + _e530.xy);
    u_xlat8_.x = _e532.x;
    u_xlat8_.y = _e532.y;
    let _e537 = vs_TEXCOORD0_;
    let _e539 = u_xlat8_;
    let _e541 = u_xlat0_;
    let _e543 = (_e539.xy + _e541.xy);
    vs_TEXCOORD0_.z = _e543.x;
    vs_TEXCOORD0_.w = _e543.y;
    let _e549 = in_NORMAL0_1;
    let _e554 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e549.xyz, _e554.xyz);
    let _e558 = in_NORMAL0_1;
    let _e563 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e558.xyz, _e563.xyz);
    let _e567 = in_NORMAL0_1;
    let _e572 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e567.xyz, _e572.xyz);
    let _e575 = u_xlat0_;
    let _e577 = u_xlat0_;
    u_xlat12_ = dot(_e575.xyz, _e577.xyz);
    let _e580 = u_xlat12_;
    u_xlat12_ = max(_e580, 0.000000000000000000000000000000000000011754944f);
    let _e583 = u_xlat12_;
    u_xlat12_ = inverseSqrt(_e583);
    let _e585 = u_xlat0_;
    let _e587 = u_xlat12_;
    let _e589 = u_xlat0_;
    let _e591 = (vec3(_e587) * _e589.xyz);
    u_xlat0_.x = _e591.x;
    u_xlat0_.y = _e591.y;
    u_xlat0_.z = _e591.z;
    let _e598 = u_xlat1_;
    let _e600 = u_xlat0_;
    let _e605 = _v_buffer0_.v_cb0_[68];
    let _e607 = (_e600.yyy * _e605.xyz);
    u_xlat1_.x = _e607.x;
    u_xlat1_.y = _e607.y;
    u_xlat1_.z = _e607.z;
    let _e614 = u_xlat1_;
    let _e619 = _v_buffer0_.v_cb0_[67];
    let _e621 = u_xlat0_;
    let _e624 = u_xlat1_;
    let _e626 = ((_e619.xyz * _e621.xxx) + _e624.xyz);
    u_xlat1_.x = _e626.x;
    u_xlat1_.y = _e626.y;
    u_xlat1_.z = _e626.z;
    let _e633 = u_xlat1_;
    let _e638 = _v_buffer0_.v_cb0_[69];
    let _e640 = u_xlat0_;
    let _e643 = u_xlat1_;
    let _e645 = ((_e638.xyz * _e640.zzz) + _e643.xyz);
    u_xlat1_.x = _e645.x;
    u_xlat1_.y = _e645.y;
    u_xlat1_.z = _e645.z;
    let _e652 = vs_NORMAL0_;
    let _e654 = u_xlat0_;
    let _e655 = _e654.xyz;
    vs_NORMAL0_.x = _e655.x;
    vs_NORMAL0_.y = _e655.y;
    vs_NORMAL0_.z = _e655.z;
    let _e662 = vs_TEXCOORD4_;
    let _e664 = u_xlat1_;
    let _e675 = ((_e664.xyz * vec3<f32>(0.5f, 0.5f, 0.5f)) + vec3<f32>(0.5f, 0.5f, 0.5f));
    vs_TEXCOORD4_.x = _e675.x;
    vs_TEXCOORD4_.y = _e675.y;
    vs_TEXCOORD4_.z = _e675.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD4_;
    let _e38 = vs_NORMAL0_;
    let _e40 = vs_TEXCOORD1_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
