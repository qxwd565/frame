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
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e36 = in_POSITION0_1;
    let _e41 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e36.yyyy * _e41);
    let _e46 = _v_buffer1_.v_cb1_[0];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.xxxx) + _e50);
    let _e55 = _v_buffer1_.v_cb1_[2];
    let _e56 = in_POSITION0_1;
    let _e59 = u_xlat0_;
    u_xlat0_ = ((_e55 * _e56.zzzz) + _e59);
    let _e61 = u_xlat0_;
    let _e65 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e61 + _e65);
    let _e71 = _v_buffer1_.v_cb1_[3];
    let _e73 = in_POSITION0_1;
    let _e76 = u_xlat0_;
    u_xlat0_.x = ((_e71.y * _e73.w) + _e76.y);
    let _e80 = u_xlat0_;
    let _e85 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e80.x + -(_e85.x));
    let _e89 = u_xlat0_;
    let _e94 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e89.x / _e94.w);
    let _e97 = u_xlat1_;
    let _e102 = _v_buffer0_.v_cb0_[80];
    u_xlat0_ = (_e97.yyyy * _e102);
    let _e107 = _v_buffer0_.v_cb0_[79];
    let _e108 = u_xlat1_;
    let _e111 = u_xlat0_;
    u_xlat0_ = ((_e107 * _e108.xxxx) + _e111);
    let _e116 = _v_buffer0_.v_cb0_[81];
    let _e117 = u_xlat1_;
    let _e120 = u_xlat0_;
    u_xlat0_ = ((_e116 * _e117.zzzz) + _e120);
    let _e126 = _v_buffer0_.v_cb0_[82];
    let _e127 = u_xlat1_;
    let _e130 = u_xlat0_;
    gl_Position = ((_e126 * _e127.wwww) + _e130);
    let _e132 = u_xlat0_;
    let _e134 = in_TEXCOORD0_1;
    let _e139 = _v_buffer2_.v_cb2_[4];
    let _e145 = _v_buffer2_.v_cb2_[4];
    let _e147 = ((_e134.xy * _e139.xy) + _e145.zw);
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    let _e152 = u_xlat6_;
    let _e154 = u_xlat0_;
    let _e157 = u_xlat0_;
    let _e159 = (-(_e154.xy) + _e157.yx);
    u_xlat6_.x = _e159.x;
    u_xlat6_.y = _e159.y;
    let _e164 = u_xlat0_;
    let _e169 = _v_buffer2_.v_cb2_[6];
    let _e171 = u_xlat6_;
    let _e174 = u_xlat0_;
    let _e176 = ((_e169.yy * _e171.xy) + _e174.xy);
    u_xlat0_.x = _e176.x;
    u_xlat0_.y = _e176.y;
    let _e181 = u_xlat6_;
    let _e186 = _v_buffer0_.v_cb0_[15];
    let _e191 = _v_buffer2_.v_cb2_[5];
    let _e193 = (_e186.zz * _e191.xy);
    u_xlat6_.x = _e193.x;
    u_xlat6_.y = _e193.y;
    let _e198 = u_xlat6_;
    let _e200 = u_xlat6_;
    let _e202 = fract(_e200.xy);
    u_xlat6_.x = _e202.x;
    u_xlat6_.y = _e202.y;
    let _e207 = vs_TEXCOORD0_;
    let _e209 = u_xlat6_;
    let _e211 = u_xlat0_;
    let _e213 = (_e209.xy + _e211.xy);
    vs_TEXCOORD0_.z = _e213.x;
    vs_TEXCOORD0_.w = _e213.y;
    let _e218 = u_xlat0_;
    let _e220 = in_TEXCOORD0_1;
    let _e225 = _v_buffer2_.v_cb2_[1];
    let _e231 = _v_buffer2_.v_cb2_[1];
    let _e233 = ((_e220.xy * _e225.xy) + _e231.zw);
    u_xlat0_.x = _e233.x;
    u_xlat0_.y = _e233.y;
    let _e238 = u_xlat6_;
    let _e240 = u_xlat0_;
    let _e243 = u_xlat0_;
    let _e245 = (-(_e240.xy) + _e243.yx);
    u_xlat6_.x = _e245.x;
    u_xlat6_.y = _e245.y;
    let _e250 = vs_TEXCOORD0_;
    let _e255 = _v_buffer2_.v_cb2_[2];
    let _e257 = u_xlat6_;
    let _e260 = u_xlat0_;
    let _e262 = ((_e255.zz * _e257.xy) + _e260.xy);
    vs_TEXCOORD0_.x = _e262.x;
    vs_TEXCOORD0_.y = _e262.y;
    let _e267 = u_xlat0_;
    let _e272 = _v_buffer2_.v_cb2_[19];
    let _e278 = _v_buffer2_.v_cb2_[19];
    let _e280 = (-(_e272.xz) + _e278.yw);
    u_xlat0_.x = _e280.x;
    u_xlat0_.y = _e280.y;
    let _e285 = u_xlat6_;
    let _e287 = in_TEXCOORD0_1;
    let _e292 = _v_buffer2_.v_cb2_[18];
    let _e298 = _v_buffer2_.v_cb2_[18];
    let _e300 = ((_e287.xy * _e292.xy) + _e298.zw);
    u_xlat6_.x = _e300.x;
    u_xlat6_.y = _e300.y;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat6_;
    let _e309 = u_xlat0_;
    let _e315 = _v_buffer2_.v_cb2_[19];
    let _e317 = ((_e307.xx * _e309.xy) + _e315.xz);
    u_xlat0_.x = _e317.x;
    u_xlat0_.y = _e317.y;
    let _e323 = u_xlat0_;
    let _e326 = u_xlat0_;
    u_xlat3_.x = (-(_e323.x) + _e326.y);
    let _e330 = u_xlat6_;
    let _e332 = u_xlat3_;
    let _e335 = u_xlat0_;
    u_xlat0_.x = ((_e330.y * _e332.x) + _e335.x);
    let _e338 = u_xlat3_;
    let _e340 = u_xlat6_;
    let _e351 = ((_e340.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e351.x;
    u_xlat3_.y = _e351.y;
    let _e357 = u_xlat3_;
    let _e359 = u_xlat3_;
    u_xlat3_.x = dot(_e357.xy, _e359.xy);
    let _e363 = u_xlat3_;
    u_xlat3_.x = (-(_e363.x) + 1f);
    let _e369 = u_xlat3_;
    let _e374 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e369.x * _e374.x);
    let _e378 = u_xlat3_;
    u_xlat3_.x = clamp(_e378.x, 0f, 1f);
    let _e384 = u_xlat0_;
    let _e386 = u_xlat3_;
    u_xlat0_.x = (_e384.x * _e386.x);
    let _e390 = u_xlat0_;
    u_xlat0_.x = clamp(_e390.x, 0f, 1f);
    let _e396 = u_xlat0_;
    let _e398 = in_COLOR0_1;
    u_xlat0_.w = (_e396.x * _e398.w);
    let _e401 = u_xlat0_;
    let _e403 = in_COLOR0_1;
    let _e404 = _e403.xyz;
    u_xlat0_.x = _e404.x;
    u_xlat0_.y = _e404.y;
    u_xlat0_.z = _e404.z;
    let _e411 = u_xlat0_;
    let _e415 = _v_buffer2_.v_cb2_[7];
    u_xlat1_ = (_e411 * _e415);
    let _e417 = u_xlat0_;
    let _e421 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e417 * _e421);
    let _e424 = u_xlat1_;
    let _e426 = u_xlat1_;
    u_xlat2_.x = max(_e424.y, _e426.x);
    let _e430 = u_xlat1_;
    let _e432 = u_xlat2_;
    u_xlat2_.x = max(_e430.z, _e432.x);
    let _e436 = u_xlat2_;
    u_xlat2_.x = ((_e436.x * 2f) + -1f);
    let _e444 = u_xlat2_;
    u_xlat2_.x = clamp(_e444.x, 0f, 1f);
    let _e450 = u_xlat2_;
    u_xlat2_.w = (-(_e450.x) + 1f);
    let _e455 = u_xlat1_;
    let _e457 = u_xlat1_;
    let _e459 = u_xlat1_;
    let _e461 = (_e457.xyz + _e459.xyz);
    u_xlat1_.x = _e461.x;
    u_xlat1_.y = _e461.y;
    u_xlat1_.z = _e461.z;
    let _e468 = u_xlat2_;
    let _e470 = u_xlat1_;
    let _e475 = _v_buffer2_.v_cb2_[8];
    let _e477 = (_e470.xyz * _e475.xxx);
    u_xlat2_.x = _e477.x;
    u_xlat2_.y = _e477.y;
    u_xlat2_.z = _e477.z;
    let _e484 = u_xlat1_;
    let _e486 = u_xlat2_;
    vs_COLOR1_ = (_e484.wwww * _e486);
    let _e489 = u_xlat0_;
    let _e491 = u_xlat0_;
    u_xlat1_.x = max(_e489.y, _e491.x);
    let _e495 = u_xlat0_;
    let _e497 = u_xlat1_;
    u_xlat1_.x = max(_e495.z, _e497.x);
    let _e501 = u_xlat1_;
    u_xlat1_.x = ((_e501.x * 2f) + -1f);
    let _e509 = u_xlat1_;
    u_xlat1_.x = clamp(_e509.x, 0f, 1f);
    let _e515 = u_xlat1_;
    u_xlat1_.w = (-(_e515.x) + 1f);
    let _e520 = u_xlat1_;
    let _e522 = u_xlat0_;
    let _e524 = u_xlat0_;
    let _e526 = (_e522.xyz + _e524.xyz);
    u_xlat1_.x = _e526.x;
    u_xlat1_.y = _e526.y;
    u_xlat1_.z = _e526.z;
    let _e534 = u_xlat0_;
    let _e539 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e534.w * _e539.w);
    let _e542 = u_xlat0_;
    let _e544 = u_xlat1_;
    vs_COLOR0_ = (_e542.xxxx * _e544);
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
