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
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
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
    u_xlat1_ = (_e72 + _e76);
    let _e78 = u_xlat0_;
    let _e83 = _v_buffer1_.v_cb1_[3];
    let _e85 = in_POSITION0_1;
    let _e88 = u_xlat0_;
    let _e90 = ((_e83.xyz * _e85.www) + _e88.xyz);
    u_xlat0_.x = _e90.x;
    u_xlat0_.y = _e90.y;
    u_xlat0_.z = _e90.z;
    let _e97 = u_xlat1_;
    let _e102 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e97.yyyy * _e102);
    let _e107 = _v_buffer0_.v_cb0_[79];
    let _e108 = u_xlat1_;
    let _e111 = u_xlat2_;
    u_xlat2_ = ((_e107 * _e108.xxxx) + _e111);
    let _e116 = _v_buffer0_.v_cb0_[81];
    let _e117 = u_xlat1_;
    let _e120 = u_xlat2_;
    u_xlat2_ = ((_e116 * _e117.zzzz) + _e120);
    let _e126 = _v_buffer0_.v_cb0_[82];
    let _e127 = u_xlat1_;
    let _e130 = u_xlat2_;
    gl_Position = ((_e126 * _e127.wwww) + _e130);
    let _e132 = u_xlat0_;
    let _e134 = u_xlat0_;
    let _e139 = _v_buffer2_.v_cb2_[4];
    let _e145 = _v_buffer2_.v_cb2_[4];
    let _e147 = ((_e134.xz * _e139.xy) + _e145.zw);
    u_xlat0_.x = _e147.x;
    u_xlat0_.z = _e147.y;
    let _e153 = u_xlat0_;
    let _e158 = _v_buffer2_.v_cb2_[12];
    u_xlat5_.x = (_e153.y + -(_e158.x));
    let _e162 = u_xlat5_;
    let _e167 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e162.x / _e167.w);
    let _e170 = u_xlat5_;
    let _e172 = u_xlat0_;
    let _e175 = u_xlat0_;
    let _e177 = (-(_e172.xz) + _e175.zx);
    u_xlat5_.x = _e177.x;
    u_xlat5_.z = _e177.y;
    let _e182 = u_xlat0_;
    let _e187 = _v_buffer2_.v_cb2_[6];
    let _e189 = u_xlat5_;
    let _e192 = u_xlat0_;
    let _e194 = ((_e187.yy * _e189.xz) + _e192.xz);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    let _e199 = u_xlat10_;
    let _e204 = _v_buffer0_.v_cb0_[15];
    let _e209 = _v_buffer2_.v_cb2_[5];
    let _e211 = (_e204.zz * _e209.xy);
    u_xlat10_.x = _e211.x;
    u_xlat10_.y = _e211.y;
    let _e216 = u_xlat10_;
    let _e218 = u_xlat10_;
    let _e220 = fract(_e218.xy);
    u_xlat10_.x = _e220.x;
    u_xlat10_.y = _e220.y;
    let _e225 = vs_TEXCOORD0_;
    let _e227 = u_xlat10_;
    let _e229 = u_xlat0_;
    let _e231 = (_e227.xy + _e229.xy);
    vs_TEXCOORD0_.z = _e231.x;
    vs_TEXCOORD0_.w = _e231.y;
    let _e236 = u_xlat0_;
    let _e238 = in_TEXCOORD0_1;
    let _e243 = _v_buffer2_.v_cb2_[1];
    let _e249 = _v_buffer2_.v_cb2_[1];
    let _e251 = ((_e238.xy * _e243.xy) + _e249.zw);
    u_xlat0_.x = _e251.x;
    u_xlat0_.y = _e251.y;
    let _e256 = u_xlat10_;
    let _e258 = u_xlat0_;
    let _e261 = u_xlat0_;
    let _e263 = (-(_e258.xy) + _e261.yx);
    u_xlat10_.x = _e263.x;
    u_xlat10_.y = _e263.y;
    let _e268 = vs_TEXCOORD0_;
    let _e273 = _v_buffer2_.v_cb2_[2];
    let _e275 = u_xlat10_;
    let _e278 = u_xlat0_;
    let _e280 = ((_e273.zz * _e275.xy) + _e278.xy);
    vs_TEXCOORD0_.x = _e280.x;
    vs_TEXCOORD0_.y = _e280.y;
    let _e285 = u_xlat0_;
    let _e290 = _v_buffer0_.v_cb0_[21];
    let _e295 = _v_buffer1_.v_cb1_[5];
    let _e297 = (_e290.yyy * _e295.xyz);
    u_xlat0_.x = _e297.x;
    u_xlat0_.y = _e297.y;
    u_xlat0_.z = _e297.z;
    let _e304 = u_xlat0_;
    let _e309 = _v_buffer1_.v_cb1_[4];
    let _e314 = _v_buffer0_.v_cb0_[21];
    let _e317 = u_xlat0_;
    let _e319 = ((_e309.xyz * _e314.xxx) + _e317.xyz);
    u_xlat0_.x = _e319.x;
    u_xlat0_.y = _e319.y;
    u_xlat0_.z = _e319.z;
    let _e326 = u_xlat0_;
    let _e331 = _v_buffer1_.v_cb1_[6];
    let _e336 = _v_buffer0_.v_cb0_[21];
    let _e339 = u_xlat0_;
    let _e341 = ((_e331.xyz * _e336.zzz) + _e339.xyz);
    u_xlat0_.x = _e341.x;
    u_xlat0_.y = _e341.y;
    u_xlat0_.z = _e341.z;
    let _e348 = u_xlat0_;
    let _e350 = u_xlat0_;
    let _e355 = _v_buffer1_.v_cb1_[7];
    let _e357 = (_e350.xyz + _e355.xyz);
    u_xlat0_.x = _e357.x;
    u_xlat0_.y = _e357.y;
    u_xlat0_.z = _e357.z;
    let _e364 = u_xlat0_;
    let _e366 = u_xlat0_;
    let _e368 = in_POSITION0_1;
    let _e371 = (_e366.xyz + -(_e368.xyz));
    u_xlat0_.x = _e371.x;
    u_xlat0_.y = _e371.y;
    u_xlat0_.z = _e371.z;
    let _e378 = u_xlat0_;
    let _e380 = u_xlat0_;
    u_xlat15_ = dot(_e378.xyz, _e380.xyz);
    let _e383 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e383);
    let _e385 = u_xlat0_;
    let _e387 = u_xlat15_;
    let _e389 = u_xlat0_;
    let _e391 = (vec3(_e387) * _e389.xyz);
    u_xlat0_.x = _e391.x;
    u_xlat0_.y = _e391.y;
    u_xlat0_.z = _e391.z;
    let _e399 = in_NORMAL0_1;
    let _e401 = u_xlat0_;
    u_xlat0_.x = dot(_e399.xyz, _e401.xyz);
    let _e405 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e405.x)) + 1f);
    let _e412 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e412.x));
    let _e417 = u_xlat0_;
    let _e422 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e417.x * _e422.x);
    let _e426 = u_xlat0_;
    u_xlat0_.x = exp2(_e426.x);
    let _e429 = u_xlat1_;
    let _e434 = _v_buffer2_.v_cb2_[14];
    let _e439 = _v_buffer2_.v_cb2_[16];
    let _e441 = (_e434.xyz * _e439.yyy);
    u_xlat1_.x = _e441.x;
    u_xlat1_.y = _e441.y;
    u_xlat1_.z = _e441.z;
    let _e448 = u_xlat2_;
    let _e453 = _v_buffer2_.v_cb2_[15];
    let _e458 = _v_buffer2_.v_cb2_[16];
    let _e461 = u_xlat1_;
    let _e464 = ((_e453.xyz * _e458.zzz) + -(_e461.xyz));
    u_xlat2_.x = _e464.x;
    u_xlat2_.y = _e464.y;
    u_xlat2_.z = _e464.z;
    let _e475 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e475.w;
    let _e478 = u_xlat1_;
    let _e484 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e478.w) + _e484.w);
    let _e487 = u_xlat0_;
    let _e489 = u_xlat2_;
    let _e491 = u_xlat1_;
    u_xlat0_ = ((_e487.xxxx * _e489) + _e491);
    let _e493 = in_COLOR0_1;
    let _e497 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e493 * _e497);
    let _e500 = u_xlat1_;
    let _e502 = u_xlat1_;
    u_xlat2_.x = max(_e500.y, _e502.x);
    let _e506 = u_xlat1_;
    let _e508 = u_xlat2_;
    u_xlat2_.x = max(_e506.z, _e508.x);
    let _e512 = u_xlat2_;
    u_xlat2_.x = ((_e512.x * 2f) + -1f);
    let _e520 = u_xlat2_;
    u_xlat2_.x = clamp(_e520.x, 0f, 1f);
    let _e526 = u_xlat2_;
    u_xlat2_.w = (-(_e526.x) + 1f);
    let _e531 = u_xlat2_;
    let _e533 = u_xlat1_;
    let _e535 = u_xlat1_;
    let _e537 = (_e533.xyz + _e535.xyz);
    u_xlat2_.x = _e537.x;
    u_xlat2_.y = _e537.y;
    u_xlat2_.z = _e537.z;
    let _e545 = u_xlat1_;
    let _e550 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e545.w * _e550.w);
    let _e553 = u_xlat1_;
    let _e555 = u_xlat2_;
    u_xlat3_ = (_e553.xxxx * _e555);
    let _e557 = u_xlat4_;
    let _e559 = u_xlat0_;
    let _e561 = u_xlat3_;
    let _e563 = (_e559.xyz * _e561.www);
    u_xlat4_.x = _e563.x;
    u_xlat4_.y = _e563.y;
    u_xlat4_.z = _e563.z;
    let _e570 = u_xlat0_;
    let _e571 = u_xlat3_;
    u_xlat3_ = (_e570 * _e571);
    u_xlat4_.w = 0f;
    let _e575 = u_xlat2_;
    let _e576 = u_xlat1_;
    let _e579 = u_xlat4_;
    u_xlat1_ = ((_e575 * _e576.xxxx) + _e579);
    let _e581 = u_xlat1_;
    let _e582 = u_xlat0_;
    let _e585 = u_xlat3_;
    u_xlat0_ = ((_e581 * _e582.wwww) + -(_e585));
    let _e591 = _v_buffer2_.v_cb2_[16];
    let _e593 = u_xlat0_;
    let _e595 = u_xlat3_;
    vs_COLOR0_ = ((_e591.wwww * _e593) + _e595);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e32 = vs_TEXCOORD0_;
    let _e34 = vs_COLOR0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
