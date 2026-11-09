struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 22>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(4) vs_TEXCOORD4_: vec4<f32>,
    @location(5) vs_TEXCOORD5_: vec3<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(10) vs_COLOR0_: vec3<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_TEXCOORD5_: vec3<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_COLOR0_: vec3<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec2<f32> = vec2(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat10_: f32 = 0f;
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat12_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;
    var local: f32;

    let _e59 = in_POSITION0_1;
    let _e64 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e59.yyyy * _e64);
    let _e69 = _v_buffer1_.v_cb1_[0];
    let _e70 = in_POSITION0_1;
    let _e73 = u_xlat0_;
    u_xlat0_ = ((_e69 * _e70.xxxx) + _e73);
    let _e78 = _v_buffer1_.v_cb1_[2];
    let _e79 = in_POSITION0_1;
    let _e82 = u_xlat0_;
    u_xlat0_ = ((_e78 * _e79.zzzz) + _e82);
    let _e84 = u_xlat0_;
    let _e88 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e84 + _e88);
    let _e90 = u_xlat0_;
    let _e95 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e90.yyyy * _e95);
    let _e100 = _v_buffer0_.v_cb0_[79];
    let _e101 = u_xlat0_;
    let _e104 = u_xlat1_;
    u_xlat1_ = ((_e100 * _e101.xxxx) + _e104);
    let _e109 = _v_buffer0_.v_cb0_[81];
    let _e110 = u_xlat0_;
    let _e113 = u_xlat1_;
    u_xlat1_ = ((_e109 * _e110.zzzz) + _e113);
    let _e119 = _v_buffer0_.v_cb0_[82];
    let _e120 = u_xlat0_;
    let _e123 = u_xlat1_;
    gl_Position = ((_e119 * _e120.wwww) + _e123);
    let _e125 = vs_TEXCOORD1_;
    let _e127 = u_xlat0_;
    let _e128 = _e127.xyz;
    vs_TEXCOORD1_.x = _e128.x;
    vs_TEXCOORD1_.y = _e128.y;
    vs_TEXCOORD1_.z = _e128.z;
    let _e139 = _v_buffer2_.v_cb2_[21];
    u_xlatb0_ = (0f < _e139.w);
    let _e146 = _v_buffer2_.v_cb2_[21];
    let _e151 = _v_buffer2_.v_cb2_[21];
    u_xlat5_.x = (_e146.w + _e151.z);
    let _e157 = _v_buffer0_.v_cb0_[15];
    let _e162 = _v_buffer2_.v_cb2_[21];
    u_xlat10_ = (_e157.x + _e162.z);
    let _e166 = u_xlatb0_;
    if _e166 {
        let _e167 = u_xlat5_;
        local = _e167.x;
    } else {
        let _e169 = u_xlat10_;
        local = _e169;
    }
    let _e171 = local;
    u_xlat0_.x = _e171;
    let _e173 = u_xlat0_;
    let _e178 = _v_buffer2_.v_cb2_[13];
    let _e184 = _v_buffer2_.v_cb2_[13];
    u_xlat5_.x = ((_e173.x * _e178.y) + _e184.x);
    let _e188 = u_xlat5_;
    u_xlat1_.x = sin(_e188.x);
    let _e192 = u_xlat5_;
    u_xlat2_.x = cos(_e192.x);
    let _e196 = u_xlat1_;
    u_xlat3_.z = _e196.x;
    let _e199 = u_xlat2_;
    u_xlat3_.y = _e199.x;
    let _e202 = u_xlat1_;
    u_xlat3_.x = -(_e202.x);
    let _e205 = u_xlat5_;
    let _e210 = _v_buffer2_.v_cb2_[12];
    let _e216 = _v_buffer2_.v_cb2_[13];
    let _e218 = (-(_e210.xy) + _e216.zw);
    u_xlat5_.x = _e218.x;
    u_xlat5_.y = _e218.y;
    let _e223 = u_xlat1_;
    let _e225 = in_TEXCOORD0_1;
    let _e230 = _v_buffer2_.v_cb2_[0];
    let _e236 = _v_buffer2_.v_cb2_[0];
    let _e238 = ((_e225.xy * _e230.xy) + _e236.zw);
    u_xlat1_.x = _e238.x;
    u_xlat1_.y = _e238.y;
    let _e243 = u_xlat11_;
    let _e245 = u_xlat5_;
    let _e248 = u_xlat1_;
    let _e250 = (-(_e245.xy) + _e248.xy);
    u_xlat11_.x = _e250.x;
    u_xlat11_.y = _e250.y;
    let _e256 = u_xlat11_;
    let _e258 = u_xlat3_;
    u_xlat12_.x = dot(_e256.xy, _e258.yz);
    let _e262 = u_xlat11_;
    let _e264 = u_xlat3_;
    u_xlat12_.y = dot(_e262.xy, _e264.xy);
    let _e267 = u_xlat5_;
    let _e269 = u_xlat5_;
    let _e271 = u_xlat12_;
    let _e273 = (_e269.xy + _e271.xy);
    u_xlat5_.x = _e273.x;
    u_xlat5_.y = _e273.y;
    let _e278 = u_xlat11_;
    let _e283 = _v_buffer2_.v_cb2_[12];
    let _e289 = _v_buffer2_.v_cb2_[14];
    let _e291 = (-(_e283.xy) + _e289.zw);
    u_xlat11_.x = _e291.x;
    u_xlat11_.y = _e291.y;
    let _e296 = u_xlat5_;
    let _e298 = u_xlat5_;
    let _e300 = u_xlat11_;
    let _e303 = (_e298.xy + -(_e300.xy));
    u_xlat5_.x = _e303.x;
    u_xlat5_.y = _e303.y;
    let _e308 = u_xlat5_;
    let _e310 = u_xlat5_;
    let _e315 = _v_buffer2_.v_cb2_[14];
    let _e318 = u_xlat11_;
    let _e320 = ((_e310.xy * _e315.xy) + _e318.xy);
    u_xlat5_.x = _e320.x;
    u_xlat5_.y = _e320.y;
    let _e325 = u_xlat11_;
    let _e330 = _v_buffer2_.v_cb2_[12];
    let _e332 = u_xlat0_;
    let _e338 = _v_buffer2_.v_cb2_[12];
    let _e340 = ((_e330.zw * _e332.xx) + _e338.xy);
    u_xlat11_.x = _e340.x;
    u_xlat11_.y = _e340.y;
    let _e345 = vs_TEXCOORD0_;
    let _e347 = u_xlat5_;
    let _e349 = u_xlat11_;
    let _e351 = (_e347.xy + _e349.xy);
    vs_TEXCOORD0_.z = _e351.x;
    vs_TEXCOORD0_.w = _e351.y;
    let _e356 = vs_TEXCOORD0_;
    let _e358 = u_xlat1_;
    let _e359 = _e358.xy;
    vs_TEXCOORD0_.x = _e359.x;
    vs_TEXCOORD0_.y = _e359.y;
    let _e365 = u_xlat0_;
    let _e370 = _v_buffer2_.v_cb2_[19];
    let _e376 = _v_buffer2_.v_cb2_[19];
    u_xlat5_.x = ((_e365.x * _e370.y) + _e376.x);
    let _e379 = u_xlat0_;
    let _e384 = _v_buffer2_.v_cb2_[18];
    let _e386 = u_xlat0_;
    let _e392 = _v_buffer2_.v_cb2_[18];
    let _e394 = ((_e384.zw * _e386.xx) + _e392.xy);
    u_xlat0_.x = _e394.x;
    u_xlat0_.z = _e394.y;
    let _e400 = u_xlat5_;
    u_xlat2_.x = sin(_e400.x);
    let _e404 = u_xlat5_;
    u_xlat3_.x = cos(_e404.x);
    let _e408 = u_xlat2_;
    u_xlat4_.z = _e408.x;
    let _e410 = u_xlat5_;
    let _e415 = _v_buffer2_.v_cb2_[18];
    let _e421 = _v_buffer2_.v_cb2_[19];
    let _e423 = (-(_e415.xy) + _e421.zw);
    u_xlat5_.x = _e423.x;
    u_xlat5_.z = _e423.y;
    let _e428 = u_xlat1_;
    let _e430 = u_xlat5_;
    let _e433 = u_xlat1_;
    let _e435 = (-(_e430.xz) + _e433.xy);
    u_xlat1_.x = _e435.x;
    u_xlat1_.y = _e435.y;
    let _e441 = u_xlat3_;
    u_xlat4_.y = _e441.x;
    let _e444 = u_xlat2_;
    u_xlat4_.x = -(_e444.x);
    let _e448 = u_xlat1_;
    let _e450 = u_xlat4_;
    u_xlat2_.y = dot(_e448.xy, _e450.xy);
    let _e454 = u_xlat1_;
    let _e456 = u_xlat4_;
    u_xlat2_.x = dot(_e454.xy, _e456.yz);
    let _e459 = u_xlat5_;
    let _e461 = u_xlat5_;
    let _e463 = u_xlat2_;
    let _e465 = (_e461.xz + _e463.xy);
    u_xlat5_.x = _e465.x;
    u_xlat5_.z = _e465.y;
    let _e470 = u_xlat1_;
    let _e475 = _v_buffer2_.v_cb2_[18];
    let _e481 = _v_buffer2_.v_cb2_[20];
    let _e483 = (-(_e475.xy) + _e481.zw);
    u_xlat1_.x = _e483.x;
    u_xlat1_.y = _e483.y;
    let _e488 = u_xlat5_;
    let _e490 = u_xlat5_;
    let _e492 = u_xlat1_;
    let _e495 = (_e490.xz + -(_e492.xy));
    u_xlat5_.x = _e495.x;
    u_xlat5_.z = _e495.y;
    let _e500 = u_xlat5_;
    let _e502 = u_xlat5_;
    let _e507 = _v_buffer2_.v_cb2_[20];
    let _e510 = u_xlat1_;
    let _e512 = ((_e502.xz * _e507.xy) + _e510.xy);
    u_xlat5_.x = _e512.x;
    u_xlat5_.z = _e512.y;
    let _e517 = vs_TEXCOORD4_;
    let _e519 = u_xlat0_;
    let _e521 = u_xlat5_;
    let _e523 = (_e519.xz + _e521.xz);
    vs_TEXCOORD4_.x = _e523.x;
    vs_TEXCOORD4_.y = _e523.y;
    let _e528 = u_xlat0_;
    let _e533 = _v_buffer0_.v_cb0_[21];
    let _e538 = _v_buffer1_.v_cb1_[5];
    let _e540 = (_e533.yyy * _e538.xyz);
    u_xlat0_.x = _e540.x;
    u_xlat0_.y = _e540.y;
    u_xlat0_.z = _e540.z;
    let _e547 = u_xlat0_;
    let _e552 = _v_buffer1_.v_cb1_[4];
    let _e557 = _v_buffer0_.v_cb0_[21];
    let _e560 = u_xlat0_;
    let _e562 = ((_e552.xyz * _e557.xxx) + _e560.xyz);
    u_xlat0_.x = _e562.x;
    u_xlat0_.y = _e562.y;
    u_xlat0_.z = _e562.z;
    let _e569 = u_xlat0_;
    let _e574 = _v_buffer1_.v_cb1_[6];
    let _e579 = _v_buffer0_.v_cb0_[21];
    let _e582 = u_xlat0_;
    let _e584 = ((_e574.xyz * _e579.zzz) + _e582.xyz);
    u_xlat0_.x = _e584.x;
    u_xlat0_.y = _e584.y;
    u_xlat0_.z = _e584.z;
    let _e591 = u_xlat0_;
    let _e593 = u_xlat0_;
    let _e598 = _v_buffer1_.v_cb1_[7];
    let _e600 = (_e593.xyz + _e598.xyz);
    u_xlat0_.x = _e600.x;
    u_xlat0_.y = _e600.y;
    u_xlat0_.z = _e600.z;
    let _e607 = u_xlat0_;
    let _e609 = u_xlat0_;
    let _e611 = in_POSITION0_1;
    let _e614 = (_e609.xyz + -(_e611.xyz));
    u_xlat0_.x = _e614.x;
    u_xlat0_.y = _e614.y;
    u_xlat0_.z = _e614.z;
    let _e621 = u_xlat0_;
    let _e623 = u_xlat0_;
    u_xlat15_ = dot(_e621.xyz, _e623.xyz);
    let _e626 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e626);
    let _e628 = vs_TEXCOORD5_;
    let _e630 = u_xlat15_;
    let _e632 = u_xlat0_;
    let _e634 = (vec3(_e630) * _e632.xyz);
    vs_TEXCOORD5_.x = _e634.x;
    vs_TEXCOORD5_.y = _e634.y;
    vs_TEXCOORD5_.z = _e634.z;
    let _e642 = in_NORMAL0_1;
    let _e647 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e642.xyz, _e647.xyz);
    let _e651 = in_NORMAL0_1;
    let _e656 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e651.xyz, _e656.xyz);
    let _e660 = in_NORMAL0_1;
    let _e665 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e660.xyz, _e665.xyz);
    let _e668 = u_xlat0_;
    let _e670 = u_xlat0_;
    u_xlat15_ = dot(_e668.xyz, _e670.xyz);
    let _e673 = u_xlat15_;
    u_xlat15_ = max(_e673, 0.000000000000000000000000000000000000011754944f);
    let _e676 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e676);
    let _e678 = vs_NORMAL0_;
    let _e680 = u_xlat15_;
    let _e682 = u_xlat0_;
    let _e684 = (vec3(_e680) * _e682.xyz);
    vs_NORMAL0_.x = _e684.x;
    vs_NORMAL0_.y = _e684.y;
    vs_NORMAL0_.z = _e684.z;
    let _e691 = vs_COLOR0_;
    let _e693 = in_NORMAL0_1;
    let _e694 = _e693.xyz;
    vs_COLOR0_.x = _e694.x;
    vs_COLOR0_.y = _e694.y;
    vs_COLOR0_.z = _e694.z;
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
    let _e38 = vs_TEXCOORD5_;
    let _e40 = vs_NORMAL0_;
    let _e42 = vs_COLOR0_;
    let _e44 = vs_TEXCOORD1_;
    let _e46 = gl_Position;
    return VertexOutput(_e34, _e36, _e38, _e40, _e42, _e44, _e46);
}
