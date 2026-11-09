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
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: f32,
    @location(11) vs_COLOR1_: vec4<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
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
    let _e114 = in_COLOR0_1;
    u_xlat0_.x = (-(_e114.w) + 1f);
    let _e120 = u_xlat0_;
    let _e125 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e120.x + -(_e125.w));
    let _e132 = _v_buffer2_.v_cb2_[12];
    u_xlat5_ = (_e132.y * 1.01f);
    let _e137 = u_xlat5_;
    let _e138 = u_xlat0_;
    u_xlat0_.x = max(_e137, _e138.x);
    let _e144 = _v_buffer2_.v_cb2_[12];
    u_xlat5_ = ((_e144.z * 2f) + 1f);
    let _e150 = u_xlat0_;
    let _e152 = u_xlat5_;
    let _e157 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e150.x * _e152) + -(_e157.z));
    let _e161 = u_xlat0_;
    let _e163 = in_TEXCOORD0_1;
    let _e168 = _v_buffer2_.v_cb2_[1];
    let _e174 = _v_buffer2_.v_cb2_[1];
    let _e176 = ((_e163.xy * _e168.xy) + _e174.zw);
    u_xlat0_.x = _e176.x;
    u_xlat0_.y = _e176.y;
    let _e181 = u_xlat10_;
    let _e183 = u_xlat0_;
    let _e186 = u_xlat0_;
    let _e188 = (-(_e183.xy) + _e186.yx);
    u_xlat10_.x = _e188.x;
    u_xlat10_.y = _e188.y;
    let _e193 = vs_TEXCOORD0_;
    let _e198 = _v_buffer2_.v_cb2_[2];
    let _e200 = u_xlat10_;
    let _e203 = u_xlat0_;
    let _e205 = ((_e198.zz * _e200.xy) + _e203.xy);
    vs_TEXCOORD0_.x = _e205.x;
    vs_TEXCOORD0_.y = _e205.y;
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e215 = u_xlat0_;
    let _e220 = _v_buffer0_.v_cb0_[21];
    let _e225 = _v_buffer1_.v_cb1_[5];
    let _e227 = (_e220.yyy * _e225.xyz);
    u_xlat0_.x = _e227.x;
    u_xlat0_.y = _e227.y;
    u_xlat0_.z = _e227.z;
    let _e234 = u_xlat0_;
    let _e239 = _v_buffer1_.v_cb1_[4];
    let _e244 = _v_buffer0_.v_cb0_[21];
    let _e247 = u_xlat0_;
    let _e249 = ((_e239.xyz * _e244.xxx) + _e247.xyz);
    u_xlat0_.x = _e249.x;
    u_xlat0_.y = _e249.y;
    u_xlat0_.z = _e249.z;
    let _e256 = u_xlat0_;
    let _e261 = _v_buffer1_.v_cb1_[6];
    let _e266 = _v_buffer0_.v_cb0_[21];
    let _e269 = u_xlat0_;
    let _e271 = ((_e261.xyz * _e266.zzz) + _e269.xyz);
    u_xlat0_.x = _e271.x;
    u_xlat0_.y = _e271.y;
    u_xlat0_.z = _e271.z;
    let _e278 = u_xlat0_;
    let _e280 = u_xlat0_;
    let _e285 = _v_buffer1_.v_cb1_[7];
    let _e287 = (_e280.xyz + _e285.xyz);
    u_xlat0_.x = _e287.x;
    u_xlat0_.y = _e287.y;
    u_xlat0_.z = _e287.z;
    let _e294 = u_xlat0_;
    let _e296 = u_xlat0_;
    let _e298 = in_POSITION0_1;
    let _e301 = (_e296.xyz + -(_e298.xyz));
    u_xlat0_.x = _e301.x;
    u_xlat0_.y = _e301.y;
    u_xlat0_.z = _e301.z;
    let _e308 = u_xlat0_;
    let _e310 = u_xlat0_;
    u_xlat15_ = dot(_e308.xyz, _e310.xyz);
    let _e313 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e313);
    let _e315 = u_xlat0_;
    let _e317 = u_xlat15_;
    let _e319 = u_xlat0_;
    let _e321 = (vec3(_e317) * _e319.xyz);
    u_xlat0_.x = _e321.x;
    u_xlat0_.y = _e321.y;
    u_xlat0_.z = _e321.z;
    let _e329 = in_NORMAL0_1;
    let _e331 = u_xlat0_;
    u_xlat0_.x = dot(_e329.xyz, _e331.xyz);
    let _e335 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e335.x)) + 1f);
    let _e342 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e342.x));
    let _e347 = u_xlat0_;
    let _e352 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e347.x * _e352.x);
    let _e356 = u_xlat0_;
    u_xlat0_.x = exp2(_e356.x);
    let _e359 = u_xlat1_;
    let _e364 = _v_buffer2_.v_cb2_[14];
    let _e369 = _v_buffer2_.v_cb2_[16];
    let _e371 = (_e364.xyz * _e369.yyy);
    u_xlat1_.x = _e371.x;
    u_xlat1_.y = _e371.y;
    u_xlat1_.z = _e371.z;
    let _e378 = u_xlat2_;
    let _e383 = _v_buffer2_.v_cb2_[15];
    let _e388 = _v_buffer2_.v_cb2_[16];
    let _e391 = u_xlat1_;
    let _e394 = ((_e383.xyz * _e388.zzz) + -(_e391.xyz));
    u_xlat2_.x = _e394.x;
    u_xlat2_.y = _e394.y;
    u_xlat2_.z = _e394.z;
    let _e405 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e405.w;
    let _e408 = u_xlat1_;
    let _e414 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e408.w) + _e414.w);
    let _e417 = u_xlat0_;
    let _e419 = u_xlat2_;
    let _e421 = u_xlat1_;
    u_xlat0_ = ((_e417.xxxx * _e419) + _e421);
    let _e424 = in_COLOR0_1;
    let _e429 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e424.w, _e429.x);
    let _e432 = u_xlat1_;
    let _e434 = in_COLOR0_1;
    let _e435 = _e434.xyz;
    u_xlat1_.x = _e435.x;
    u_xlat1_.y = _e435.y;
    u_xlat1_.z = _e435.z;
    let _e442 = u_xlat1_;
    let _e446 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e442 * _e446);
    let _e449 = u_xlat1_;
    let _e451 = u_xlat1_;
    u_xlat2_.x = max(_e449.y, _e451.x);
    let _e455 = u_xlat1_;
    let _e457 = u_xlat2_;
    u_xlat2_.x = max(_e455.z, _e457.x);
    let _e461 = u_xlat2_;
    u_xlat2_.x = ((_e461.x * 2f) + -1f);
    let _e469 = u_xlat2_;
    u_xlat2_.x = clamp(_e469.x, 0f, 1f);
    let _e475 = u_xlat2_;
    u_xlat2_.w = (-(_e475.x) + 1f);
    let _e480 = u_xlat2_;
    let _e482 = u_xlat1_;
    let _e484 = u_xlat1_;
    let _e486 = (_e482.xyz + _e484.xyz);
    u_xlat2_.x = _e486.x;
    u_xlat2_.y = _e486.y;
    u_xlat2_.z = _e486.z;
    let _e494 = u_xlat1_;
    let _e499 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e494.w * _e499.w);
    let _e502 = u_xlat1_;
    let _e504 = u_xlat2_;
    u_xlat3_ = (_e502.xxxx * _e504);
    let _e506 = u_xlat4_;
    let _e508 = u_xlat0_;
    let _e510 = u_xlat3_;
    let _e512 = (_e508.xyz * _e510.www);
    u_xlat4_.x = _e512.x;
    u_xlat4_.y = _e512.y;
    u_xlat4_.z = _e512.z;
    let _e519 = u_xlat0_;
    let _e520 = u_xlat3_;
    u_xlat3_ = (_e519 * _e520);
    u_xlat4_.w = 0f;
    let _e524 = u_xlat2_;
    let _e525 = u_xlat1_;
    let _e528 = u_xlat4_;
    u_xlat1_ = ((_e524 * _e525.xxxx) + _e528);
    let _e530 = u_xlat1_;
    let _e531 = u_xlat0_;
    let _e534 = u_xlat3_;
    u_xlat0_ = ((_e530 * _e531.wwww) + -(_e534));
    let _e540 = _v_buffer2_.v_cb2_[16];
    let _e542 = u_xlat0_;
    let _e544 = u_xlat3_;
    vs_COLOR0_ = ((_e540.wwww * _e542) + _e544);
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
    let _e36 = vs_TEXCOORD1_;
    let _e38 = vs_COLOR1_;
    let _e40 = vs_COLOR0_;
    let _e42 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42);
}
