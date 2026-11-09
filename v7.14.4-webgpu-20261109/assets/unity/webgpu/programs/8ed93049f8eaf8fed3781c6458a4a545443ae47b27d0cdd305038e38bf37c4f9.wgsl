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
    let _e193 = u_xlat0_;
    let _e198 = _v_buffer2_.v_cb2_[2];
    let _e200 = u_xlat10_;
    let _e203 = u_xlat0_;
    let _e205 = ((_e198.zz * _e200.xy) + _e203.xy);
    u_xlat0_.x = _e205.x;
    u_xlat0_.y = _e205.y;
    let _e210 = u_xlat10_;
    let _e215 = _v_buffer0_.v_cb0_[15];
    let _e220 = _v_buffer2_.v_cb2_[11];
    let _e222 = (_e215.zz * _e220.yz);
    u_xlat10_.x = _e222.x;
    u_xlat10_.y = _e222.y;
    let _e227 = u_xlat10_;
    let _e229 = u_xlat10_;
    let _e231 = fract(_e229.xy);
    u_xlat10_.x = _e231.x;
    u_xlat10_.y = _e231.y;
    let _e236 = vs_TEXCOORD0_;
    let _e238 = u_xlat10_;
    let _e240 = u_xlat0_;
    let _e242 = (_e238.xy + _e240.xy);
    vs_TEXCOORD0_.x = _e242.x;
    vs_TEXCOORD0_.y = _e242.y;
    vs_COLOR1_ = vec4<f32>(0f, 0f, 0f, 0f);
    let _e252 = u_xlat0_;
    let _e257 = _v_buffer0_.v_cb0_[21];
    let _e262 = _v_buffer1_.v_cb1_[5];
    let _e264 = (_e257.yyy * _e262.xyz);
    u_xlat0_.x = _e264.x;
    u_xlat0_.y = _e264.y;
    u_xlat0_.z = _e264.z;
    let _e271 = u_xlat0_;
    let _e276 = _v_buffer1_.v_cb1_[4];
    let _e281 = _v_buffer0_.v_cb0_[21];
    let _e284 = u_xlat0_;
    let _e286 = ((_e276.xyz * _e281.xxx) + _e284.xyz);
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    u_xlat0_.z = _e286.z;
    let _e293 = u_xlat0_;
    let _e298 = _v_buffer1_.v_cb1_[6];
    let _e303 = _v_buffer0_.v_cb0_[21];
    let _e306 = u_xlat0_;
    let _e308 = ((_e298.xyz * _e303.zzz) + _e306.xyz);
    u_xlat0_.x = _e308.x;
    u_xlat0_.y = _e308.y;
    u_xlat0_.z = _e308.z;
    let _e315 = u_xlat0_;
    let _e317 = u_xlat0_;
    let _e322 = _v_buffer1_.v_cb1_[7];
    let _e324 = (_e317.xyz + _e322.xyz);
    u_xlat0_.x = _e324.x;
    u_xlat0_.y = _e324.y;
    u_xlat0_.z = _e324.z;
    let _e331 = u_xlat0_;
    let _e333 = u_xlat0_;
    let _e335 = in_POSITION0_1;
    let _e338 = (_e333.xyz + -(_e335.xyz));
    u_xlat0_.x = _e338.x;
    u_xlat0_.y = _e338.y;
    u_xlat0_.z = _e338.z;
    let _e345 = u_xlat0_;
    let _e347 = u_xlat0_;
    u_xlat15_ = dot(_e345.xyz, _e347.xyz);
    let _e350 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e350);
    let _e352 = u_xlat0_;
    let _e354 = u_xlat15_;
    let _e356 = u_xlat0_;
    let _e358 = (vec3(_e354) * _e356.xyz);
    u_xlat0_.x = _e358.x;
    u_xlat0_.y = _e358.y;
    u_xlat0_.z = _e358.z;
    let _e366 = in_NORMAL0_1;
    let _e368 = u_xlat0_;
    u_xlat0_.x = dot(_e366.xyz, _e368.xyz);
    let _e372 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e372.x)) + 1f);
    let _e379 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e379.x));
    let _e384 = u_xlat0_;
    let _e389 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e384.x * _e389.x);
    let _e393 = u_xlat0_;
    u_xlat0_.x = exp2(_e393.x);
    let _e396 = u_xlat1_;
    let _e401 = _v_buffer2_.v_cb2_[14];
    let _e406 = _v_buffer2_.v_cb2_[16];
    let _e408 = (_e401.xyz * _e406.yyy);
    u_xlat1_.x = _e408.x;
    u_xlat1_.y = _e408.y;
    u_xlat1_.z = _e408.z;
    let _e415 = u_xlat2_;
    let _e420 = _v_buffer2_.v_cb2_[15];
    let _e425 = _v_buffer2_.v_cb2_[16];
    let _e428 = u_xlat1_;
    let _e431 = ((_e420.xyz * _e425.zzz) + -(_e428.xyz));
    u_xlat2_.x = _e431.x;
    u_xlat2_.y = _e431.y;
    u_xlat2_.z = _e431.z;
    let _e442 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e442.w;
    let _e445 = u_xlat1_;
    let _e451 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e445.w) + _e451.w);
    let _e454 = u_xlat0_;
    let _e456 = u_xlat2_;
    let _e458 = u_xlat1_;
    u_xlat0_ = ((_e454.xxxx * _e456) + _e458);
    let _e461 = in_COLOR0_1;
    let _e466 = _v_buffer2_.v_cb2_[13];
    u_xlat1_.w = max(_e461.w, _e466.x);
    let _e469 = u_xlat1_;
    let _e471 = in_COLOR0_1;
    let _e472 = _e471.xyz;
    u_xlat1_.x = _e472.x;
    u_xlat1_.y = _e472.y;
    u_xlat1_.z = _e472.z;
    let _e479 = u_xlat1_;
    let _e483 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e479 * _e483);
    let _e486 = u_xlat1_;
    let _e488 = u_xlat1_;
    u_xlat2_.x = max(_e486.y, _e488.x);
    let _e492 = u_xlat1_;
    let _e494 = u_xlat2_;
    u_xlat2_.x = max(_e492.z, _e494.x);
    let _e498 = u_xlat2_;
    u_xlat2_.x = ((_e498.x * 2f) + -1f);
    let _e506 = u_xlat2_;
    u_xlat2_.x = clamp(_e506.x, 0f, 1f);
    let _e512 = u_xlat2_;
    u_xlat2_.w = (-(_e512.x) + 1f);
    let _e517 = u_xlat2_;
    let _e519 = u_xlat1_;
    let _e521 = u_xlat1_;
    let _e523 = (_e519.xyz + _e521.xyz);
    u_xlat2_.x = _e523.x;
    u_xlat2_.y = _e523.y;
    u_xlat2_.z = _e523.z;
    let _e531 = u_xlat1_;
    let _e536 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e531.w * _e536.w);
    let _e539 = u_xlat1_;
    let _e541 = u_xlat2_;
    u_xlat3_ = (_e539.xxxx * _e541);
    let _e543 = u_xlat4_;
    let _e545 = u_xlat0_;
    let _e547 = u_xlat3_;
    let _e549 = (_e545.xyz * _e547.www);
    u_xlat4_.x = _e549.x;
    u_xlat4_.y = _e549.y;
    u_xlat4_.z = _e549.z;
    let _e556 = u_xlat0_;
    let _e557 = u_xlat3_;
    u_xlat3_ = (_e556 * _e557);
    u_xlat4_.w = 0f;
    let _e561 = u_xlat2_;
    let _e562 = u_xlat1_;
    let _e565 = u_xlat4_;
    u_xlat1_ = ((_e561 * _e562.xxxx) + _e565);
    let _e567 = u_xlat1_;
    let _e568 = u_xlat0_;
    let _e571 = u_xlat3_;
    u_xlat0_ = ((_e567 * _e568.wwww) + -(_e571));
    let _e577 = _v_buffer2_.v_cb2_[16];
    let _e579 = u_xlat0_;
    let _e581 = u_xlat3_;
    vs_COLOR0_ = ((_e577.wwww * _e579) + _e581);
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
