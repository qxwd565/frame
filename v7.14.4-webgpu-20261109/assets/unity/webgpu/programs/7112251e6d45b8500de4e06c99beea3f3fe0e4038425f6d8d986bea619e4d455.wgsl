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
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e253 = u_xlat0_;
    let _e258 = _v_buffer0_.v_cb0_[21];
    let _e263 = _v_buffer1_.v_cb1_[5];
    let _e265 = (_e258.yyy * _e263.xyz);
    u_xlat0_.x = _e265.x;
    u_xlat0_.y = _e265.y;
    u_xlat0_.z = _e265.z;
    let _e272 = u_xlat0_;
    let _e277 = _v_buffer1_.v_cb1_[4];
    let _e282 = _v_buffer0_.v_cb0_[21];
    let _e285 = u_xlat0_;
    let _e287 = ((_e277.xyz * _e282.xxx) + _e285.xyz);
    u_xlat0_.x = _e287.x;
    u_xlat0_.y = _e287.y;
    u_xlat0_.z = _e287.z;
    let _e294 = u_xlat0_;
    let _e299 = _v_buffer1_.v_cb1_[6];
    let _e304 = _v_buffer0_.v_cb0_[21];
    let _e307 = u_xlat0_;
    let _e309 = ((_e299.xyz * _e304.zzz) + _e307.xyz);
    u_xlat0_.x = _e309.x;
    u_xlat0_.y = _e309.y;
    u_xlat0_.z = _e309.z;
    let _e316 = u_xlat0_;
    let _e318 = u_xlat0_;
    let _e323 = _v_buffer1_.v_cb1_[7];
    let _e325 = (_e318.xyz + _e323.xyz);
    u_xlat0_.x = _e325.x;
    u_xlat0_.y = _e325.y;
    u_xlat0_.z = _e325.z;
    let _e332 = u_xlat0_;
    let _e334 = u_xlat0_;
    let _e336 = in_POSITION0_1;
    let _e339 = (_e334.xyz + -(_e336.xyz));
    u_xlat0_.x = _e339.x;
    u_xlat0_.y = _e339.y;
    u_xlat0_.z = _e339.z;
    let _e346 = u_xlat0_;
    let _e348 = u_xlat0_;
    u_xlat15_ = dot(_e346.xyz, _e348.xyz);
    let _e351 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e351);
    let _e353 = u_xlat0_;
    let _e355 = u_xlat15_;
    let _e357 = u_xlat0_;
    let _e359 = (vec3(_e355) * _e357.xyz);
    u_xlat0_.x = _e359.x;
    u_xlat0_.y = _e359.y;
    u_xlat0_.z = _e359.z;
    let _e367 = in_NORMAL0_1;
    let _e369 = u_xlat0_;
    u_xlat0_.x = dot(_e367.xyz, _e369.xyz);
    let _e373 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e373.x)) + 1f);
    let _e380 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e380.x));
    let _e385 = u_xlat0_;
    let _e390 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e385.x * _e390.x);
    let _e394 = u_xlat0_;
    u_xlat0_.x = exp2(_e394.x);
    let _e397 = u_xlat1_;
    let _e402 = _v_buffer2_.v_cb2_[14];
    let _e407 = _v_buffer2_.v_cb2_[16];
    let _e409 = (_e402.xyz * _e407.yyy);
    u_xlat1_.x = _e409.x;
    u_xlat1_.y = _e409.y;
    u_xlat1_.z = _e409.z;
    let _e416 = u_xlat2_;
    let _e421 = _v_buffer2_.v_cb2_[15];
    let _e426 = _v_buffer2_.v_cb2_[16];
    let _e429 = u_xlat1_;
    let _e432 = ((_e421.xyz * _e426.zzz) + -(_e429.xyz));
    u_xlat2_.x = _e432.x;
    u_xlat2_.y = _e432.y;
    u_xlat2_.z = _e432.z;
    let _e443 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e443.w;
    let _e446 = u_xlat1_;
    let _e452 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e446.w) + _e452.w);
    let _e455 = u_xlat0_;
    let _e457 = u_xlat2_;
    let _e459 = u_xlat1_;
    u_xlat0_ = ((_e455.xxxx * _e457) + _e459);
    let _e462 = in_COLOR0_1;
    let _e467 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e462.w, _e467.x);
    let _e470 = u_xlat1_;
    let _e472 = in_COLOR0_1;
    let _e473 = _e472.xyz;
    u_xlat1_.x = _e473.x;
    u_xlat1_.y = _e473.y;
    u_xlat1_.z = _e473.z;
    let _e480 = u_xlat1_;
    let _e484 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e480 * _e484);
    let _e487 = u_xlat1_;
    let _e489 = u_xlat1_;
    u_xlat2_.x = max(_e487.y, _e489.x);
    let _e493 = u_xlat1_;
    let _e495 = u_xlat2_;
    u_xlat2_.x = max(_e493.z, _e495.x);
    let _e499 = u_xlat2_;
    u_xlat2_.x = ((_e499.x * 2f) + -1f);
    let _e507 = u_xlat2_;
    u_xlat2_.x = clamp(_e507.x, 0f, 1f);
    let _e513 = u_xlat2_;
    u_xlat2_.w = (-(_e513.x) + 1f);
    let _e518 = u_xlat2_;
    let _e520 = u_xlat1_;
    let _e522 = u_xlat1_;
    let _e524 = (_e520.xyz + _e522.xyz);
    u_xlat2_.x = _e524.x;
    u_xlat2_.y = _e524.y;
    u_xlat2_.z = _e524.z;
    let _e532 = u_xlat1_;
    let _e537 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e532.w * _e537.w);
    let _e540 = u_xlat1_;
    let _e542 = u_xlat2_;
    u_xlat3_ = (_e540.xxxx * _e542);
    let _e544 = u_xlat4_;
    let _e546 = u_xlat0_;
    let _e548 = u_xlat3_;
    let _e550 = (_e546.xyz * _e548.www);
    u_xlat4_.x = _e550.x;
    u_xlat4_.y = _e550.y;
    u_xlat4_.z = _e550.z;
    let _e557 = u_xlat0_;
    let _e558 = u_xlat3_;
    u_xlat3_ = (_e557 * _e558);
    u_xlat4_.w = 0f;
    let _e562 = u_xlat2_;
    let _e563 = u_xlat1_;
    let _e566 = u_xlat4_;
    u_xlat1_ = ((_e562 * _e563.xxxx) + _e566);
    let _e568 = u_xlat1_;
    let _e569 = u_xlat0_;
    let _e572 = u_xlat3_;
    u_xlat0_ = ((_e568 * _e569.wwww) + -(_e572));
    let _e578 = _v_buffer2_.v_cb2_[16];
    let _e580 = u_xlat0_;
    let _e582 = u_xlat3_;
    vs_COLOR0_ = ((_e578.wwww * _e580) + _e582);
    let _e585 = in_COLOR0_1;
    u_xlat0_.x = (-(_e585.w) + 1f);
    let _e591 = u_xlat0_;
    let _e596 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e591.x + -(_e596.w));
    let _e603 = _v_buffer2_.v_cb2_[12];
    u_xlat5_ = (_e603.y * 1.01f);
    let _e608 = u_xlat5_;
    let _e609 = u_xlat0_;
    u_xlat0_.x = max(_e608, _e609.x);
    let _e615 = _v_buffer2_.v_cb2_[12];
    u_xlat5_ = ((_e615.z * 2f) + 1f);
    let _e621 = u_xlat0_;
    let _e623 = u_xlat5_;
    let _e628 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e621.x * _e623) + -(_e628.z));
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
