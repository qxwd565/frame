struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 17>,
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
var<private> in_NORMAL0_1: vec3<f32>;
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
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;

    let _e47 = in_POSITION0_1;
    let _e52 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e47.yyyy * _e52);
    let _e57 = _v_buffer1_.v_cb1_[0];
    let _e58 = in_POSITION0_1;
    let _e61 = u_xlat0_;
    u_xlat0_ = ((_e57 * _e58.xxxx) + _e61);
    let _e66 = _v_buffer1_.v_cb1_[2];
    let _e67 = in_POSITION0_1;
    let _e70 = u_xlat0_;
    u_xlat0_ = ((_e66 * _e67.zzzz) + _e70);
    let _e72 = u_xlat0_;
    let _e76 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e72 + _e76);
    let _e78 = u_xlat0_;
    let _e83 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e78.yyyy * _e83);
    let _e88 = _v_buffer0_.v_cb0_[79];
    let _e89 = u_xlat0_;
    let _e92 = u_xlat1_;
    u_xlat1_ = ((_e88 * _e89.xxxx) + _e92);
    let _e97 = _v_buffer0_.v_cb0_[81];
    let _e98 = u_xlat0_;
    let _e101 = u_xlat1_;
    u_xlat1_ = ((_e97 * _e98.zzzz) + _e101);
    let _e107 = _v_buffer0_.v_cb0_[82];
    let _e108 = u_xlat0_;
    let _e111 = u_xlat1_;
    gl_Position = ((_e107 * _e108.wwww) + _e111);
    let _e113 = u_xlat0_;
    let _e115 = in_TEXCOORD0_1;
    let _e120 = _v_buffer2_.v_cb2_[4];
    let _e126 = _v_buffer2_.v_cb2_[4];
    let _e128 = ((_e115.xy * _e120.xy) + _e126.zw);
    u_xlat0_.x = _e128.x;
    u_xlat0_.y = _e128.y;
    let _e133 = u_xlat10_;
    let _e135 = u_xlat0_;
    let _e138 = u_xlat0_;
    let _e140 = (-(_e135.xy) + _e138.yx);
    u_xlat10_.x = _e140.x;
    u_xlat10_.y = _e140.y;
    let _e145 = u_xlat0_;
    let _e150 = _v_buffer2_.v_cb2_[6];
    let _e152 = u_xlat10_;
    let _e155 = u_xlat0_;
    let _e157 = ((_e150.yy * _e152.xy) + _e155.xy);
    u_xlat0_.x = _e157.x;
    u_xlat0_.y = _e157.y;
    let _e162 = u_xlat10_;
    let _e167 = _v_buffer0_.v_cb0_[15];
    let _e172 = _v_buffer2_.v_cb2_[5];
    let _e174 = (_e167.zz * _e172.xy);
    u_xlat10_.x = _e174.x;
    u_xlat10_.y = _e174.y;
    let _e179 = u_xlat10_;
    let _e181 = u_xlat10_;
    let _e183 = fract(_e181.xy);
    u_xlat10_.x = _e183.x;
    u_xlat10_.y = _e183.y;
    let _e188 = vs_TEXCOORD0_;
    let _e190 = u_xlat10_;
    let _e192 = u_xlat0_;
    let _e194 = (_e190.xy + _e192.xy);
    vs_TEXCOORD0_.z = _e194.x;
    vs_TEXCOORD0_.w = _e194.y;
    let _e199 = u_xlat0_;
    let _e201 = in_TEXCOORD0_1;
    let _e206 = _v_buffer2_.v_cb2_[1];
    let _e212 = _v_buffer2_.v_cb2_[1];
    let _e214 = ((_e201.xy * _e206.xy) + _e212.zw);
    u_xlat0_.x = _e214.x;
    u_xlat0_.y = _e214.y;
    let _e219 = u_xlat10_;
    let _e221 = u_xlat0_;
    let _e224 = u_xlat0_;
    let _e226 = (-(_e221.xy) + _e224.yx);
    u_xlat10_.x = _e226.x;
    u_xlat10_.y = _e226.y;
    let _e231 = vs_TEXCOORD0_;
    let _e236 = _v_buffer2_.v_cb2_[2];
    let _e238 = u_xlat10_;
    let _e241 = u_xlat0_;
    let _e243 = ((_e236.zz * _e238.xy) + _e241.xy);
    vs_TEXCOORD0_.x = _e243.x;
    vs_TEXCOORD0_.y = _e243.y;
    let _e249 = in_COLOR0_1;
    let _e254 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e249.w, _e254.x);
    let _e257 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e266 = u_xlat0_;
    let _e271 = _v_buffer0_.v_cb0_[21];
    let _e276 = _v_buffer1_.v_cb1_[5];
    let _e278 = (_e271.yyy * _e276.xyz);
    u_xlat0_.x = _e278.x;
    u_xlat0_.y = _e278.y;
    u_xlat0_.z = _e278.z;
    let _e285 = u_xlat0_;
    let _e290 = _v_buffer1_.v_cb1_[4];
    let _e295 = _v_buffer0_.v_cb0_[21];
    let _e298 = u_xlat0_;
    let _e300 = ((_e290.xyz * _e295.xxx) + _e298.xyz);
    u_xlat0_.x = _e300.x;
    u_xlat0_.y = _e300.y;
    u_xlat0_.z = _e300.z;
    let _e307 = u_xlat0_;
    let _e312 = _v_buffer1_.v_cb1_[6];
    let _e317 = _v_buffer0_.v_cb0_[21];
    let _e320 = u_xlat0_;
    let _e322 = ((_e312.xyz * _e317.zzz) + _e320.xyz);
    u_xlat0_.x = _e322.x;
    u_xlat0_.y = _e322.y;
    u_xlat0_.z = _e322.z;
    let _e329 = u_xlat0_;
    let _e331 = u_xlat0_;
    let _e336 = _v_buffer1_.v_cb1_[7];
    let _e338 = (_e331.xyz + _e336.xyz);
    u_xlat0_.x = _e338.x;
    u_xlat0_.y = _e338.y;
    u_xlat0_.z = _e338.z;
    let _e345 = u_xlat0_;
    let _e347 = u_xlat0_;
    let _e349 = in_POSITION0_1;
    let _e352 = (_e347.xyz + -(_e349.xyz));
    u_xlat0_.x = _e352.x;
    u_xlat0_.y = _e352.y;
    u_xlat0_.z = _e352.z;
    let _e359 = u_xlat0_;
    let _e361 = u_xlat0_;
    u_xlat15_ = dot(_e359.xyz, _e361.xyz);
    let _e364 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e364);
    let _e366 = u_xlat0_;
    let _e368 = u_xlat15_;
    let _e370 = u_xlat0_;
    let _e372 = (vec3(_e368) * _e370.xyz);
    u_xlat0_.x = _e372.x;
    u_xlat0_.y = _e372.y;
    u_xlat0_.z = _e372.z;
    let _e380 = in_NORMAL0_1;
    let _e382 = u_xlat0_;
    u_xlat0_.x = dot(_e380.xyz, _e382.xyz);
    let _e386 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e386.x)) + 1f);
    let _e393 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e393.x));
    let _e398 = u_xlat0_;
    let _e403 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e398.x * _e403.x);
    let _e407 = u_xlat0_;
    u_xlat0_.x = exp2(_e407.x);
    let _e410 = u_xlat1_;
    let _e415 = _v_buffer2_.v_cb2_[14];
    let _e420 = _v_buffer2_.v_cb2_[16];
    let _e422 = (_e415.xyz * _e420.yyy);
    u_xlat1_.x = _e422.x;
    u_xlat1_.y = _e422.y;
    u_xlat1_.z = _e422.z;
    let _e429 = u_xlat2_;
    let _e434 = _v_buffer2_.v_cb2_[15];
    let _e439 = _v_buffer2_.v_cb2_[16];
    let _e442 = u_xlat1_;
    let _e445 = ((_e434.xyz * _e439.zzz) + -(_e442.xyz));
    u_xlat2_.x = _e445.x;
    u_xlat2_.y = _e445.y;
    u_xlat2_.z = _e445.z;
    let _e456 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e456.w;
    let _e459 = u_xlat1_;
    let _e465 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e459.w) + _e465.w);
    let _e468 = u_xlat0_;
    let _e470 = u_xlat2_;
    let _e472 = u_xlat1_;
    u_xlat0_ = ((_e468.xxxx * _e470) + _e472);
    let _e474 = u_xlat1_;
    let _e476 = in_COLOR0_1;
    let _e477 = _e476.xyz;
    u_xlat1_.x = _e477.x;
    u_xlat1_.y = _e477.y;
    u_xlat1_.z = _e477.z;
    u_xlat1_.w = 1f;
    let _e486 = u_xlat1_;
    let _e490 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e486 * _e490);
    let _e493 = u_xlat1_;
    let _e495 = u_xlat1_;
    u_xlat2_.x = max(_e493.y, _e495.x);
    let _e499 = u_xlat1_;
    let _e501 = u_xlat2_;
    u_xlat2_.x = max(_e499.z, _e501.x);
    let _e505 = u_xlat2_;
    u_xlat2_.x = ((_e505.x * 2f) + -1f);
    let _e513 = u_xlat2_;
    u_xlat2_.x = clamp(_e513.x, 0f, 1f);
    let _e519 = u_xlat2_;
    u_xlat2_.w = (-(_e519.x) + 1f);
    let _e524 = u_xlat2_;
    let _e526 = u_xlat1_;
    let _e528 = u_xlat1_;
    let _e530 = (_e526.xyz + _e528.xyz);
    u_xlat2_.x = _e530.x;
    u_xlat2_.y = _e530.y;
    u_xlat2_.z = _e530.z;
    let _e538 = u_xlat1_;
    let _e543 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e538.w * _e543.w);
    let _e546 = u_xlat1_;
    let _e548 = u_xlat2_;
    u_xlat3_ = (_e546.xxxx * _e548);
    let _e550 = u_xlat4_;
    let _e552 = u_xlat0_;
    let _e554 = u_xlat3_;
    let _e556 = (_e552.xyz * _e554.www);
    u_xlat4_.x = _e556.x;
    u_xlat4_.y = _e556.y;
    u_xlat4_.z = _e556.z;
    let _e563 = u_xlat0_;
    let _e564 = u_xlat3_;
    u_xlat3_ = (_e563 * _e564);
    u_xlat4_.w = 0f;
    let _e568 = u_xlat2_;
    let _e569 = u_xlat1_;
    let _e572 = u_xlat4_;
    u_xlat1_ = ((_e568 * _e569.xxxx) + _e572);
    let _e574 = u_xlat1_;
    let _e575 = u_xlat0_;
    let _e578 = u_xlat3_;
    u_xlat0_ = ((_e574 * _e575.wwww) + -(_e578));
    let _e584 = _v_buffer2_.v_cb2_[16];
    let _e586 = u_xlat0_;
    let _e588 = u_xlat3_;
    vs_COLOR0_ = ((_e584.wwww * _e586) + _e588);
    let _e591 = in_COLOR0_1;
    u_xlat0_.x = (-(_e591.w) + 1f);
    let _e597 = u_xlat0_;
    let _e602 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e597.x + -(_e602.w));
    let _e609 = _v_buffer2_.v_cb2_[12];
    u_xlat5_ = (_e609.y * 1.01f);
    let _e614 = u_xlat5_;
    let _e615 = u_xlat0_;
    u_xlat0_.x = max(_e614, _e615.x);
    let _e621 = _v_buffer2_.v_cb2_[12];
    u_xlat5_ = ((_e621.z * 2f) + 1f);
    let _e627 = u_xlat0_;
    let _e629 = u_xlat5_;
    let _e634 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e627.x * _e629) + -(_e634.z));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_COLOR1_;
    let _e38 = vs_COLOR0_;
    let _e40 = vs_TEXCOORD1_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
