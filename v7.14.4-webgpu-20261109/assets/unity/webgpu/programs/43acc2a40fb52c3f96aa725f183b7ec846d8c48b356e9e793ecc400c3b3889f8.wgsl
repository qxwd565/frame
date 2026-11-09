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
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat10_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;

    let _e42 = in_POSITION0_1;
    let _e47 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e42.yyyy * _e47);
    let _e52 = _v_buffer1_.v_cb1_[0];
    let _e53 = in_POSITION0_1;
    let _e56 = u_xlat0_;
    u_xlat0_ = ((_e52 * _e53.xxxx) + _e56);
    let _e61 = _v_buffer1_.v_cb1_[2];
    let _e62 = in_POSITION0_1;
    let _e65 = u_xlat0_;
    u_xlat0_ = ((_e61 * _e62.zzzz) + _e65);
    let _e67 = u_xlat0_;
    let _e71 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e67 + _e71);
    let _e73 = u_xlat0_;
    let _e78 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e73.yyyy * _e78);
    let _e83 = _v_buffer0_.v_cb0_[79];
    let _e84 = u_xlat0_;
    let _e87 = u_xlat1_;
    u_xlat1_ = ((_e83 * _e84.xxxx) + _e87);
    let _e92 = _v_buffer0_.v_cb0_[81];
    let _e93 = u_xlat0_;
    let _e96 = u_xlat1_;
    u_xlat1_ = ((_e92 * _e93.zzzz) + _e96);
    let _e102 = _v_buffer0_.v_cb0_[82];
    let _e103 = u_xlat0_;
    let _e106 = u_xlat1_;
    gl_Position = ((_e102 * _e103.wwww) + _e106);
    let _e108 = u_xlat0_;
    let _e110 = in_TEXCOORD0_1;
    let _e115 = _v_buffer2_.v_cb2_[1];
    let _e121 = _v_buffer2_.v_cb2_[1];
    let _e123 = ((_e110.xy * _e115.xy) + _e121.zw);
    u_xlat0_.x = _e123.x;
    u_xlat0_.y = _e123.y;
    let _e128 = u_xlat10_;
    let _e130 = u_xlat0_;
    let _e133 = u_xlat0_;
    let _e135 = (-(_e130.xy) + _e133.yx);
    u_xlat10_.x = _e135.x;
    u_xlat10_.y = _e135.y;
    let _e140 = vs_TEXCOORD0_;
    let _e145 = _v_buffer2_.v_cb2_[2];
    let _e147 = u_xlat10_;
    let _e150 = u_xlat0_;
    let _e152 = ((_e145.zz * _e147.xy) + _e150.xy);
    vs_TEXCOORD0_.x = _e152.x;
    vs_TEXCOORD0_.y = _e152.y;
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer0_.v_cb0_[21];
    let _e167 = _v_buffer1_.v_cb1_[5];
    let _e169 = (_e162.yyy * _e167.xyz);
    u_xlat0_.x = _e169.x;
    u_xlat0_.y = _e169.y;
    u_xlat0_.z = _e169.z;
    let _e176 = u_xlat0_;
    let _e181 = _v_buffer1_.v_cb1_[4];
    let _e186 = _v_buffer0_.v_cb0_[21];
    let _e189 = u_xlat0_;
    let _e191 = ((_e181.xyz * _e186.xxx) + _e189.xyz);
    u_xlat0_.x = _e191.x;
    u_xlat0_.y = _e191.y;
    u_xlat0_.z = _e191.z;
    let _e198 = u_xlat0_;
    let _e203 = _v_buffer1_.v_cb1_[6];
    let _e208 = _v_buffer0_.v_cb0_[21];
    let _e211 = u_xlat0_;
    let _e213 = ((_e203.xyz * _e208.zzz) + _e211.xyz);
    u_xlat0_.x = _e213.x;
    u_xlat0_.y = _e213.y;
    u_xlat0_.z = _e213.z;
    let _e220 = u_xlat0_;
    let _e222 = u_xlat0_;
    let _e227 = _v_buffer1_.v_cb1_[7];
    let _e229 = (_e222.xyz + _e227.xyz);
    u_xlat0_.x = _e229.x;
    u_xlat0_.y = _e229.y;
    u_xlat0_.z = _e229.z;
    let _e236 = u_xlat0_;
    let _e238 = u_xlat0_;
    let _e240 = in_POSITION0_1;
    let _e243 = (_e238.xyz + -(_e240.xyz));
    u_xlat0_.x = _e243.x;
    u_xlat0_.y = _e243.y;
    u_xlat0_.z = _e243.z;
    let _e250 = u_xlat0_;
    let _e252 = u_xlat0_;
    u_xlat15_ = dot(_e250.xyz, _e252.xyz);
    let _e255 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e255);
    let _e257 = u_xlat0_;
    let _e259 = u_xlat15_;
    let _e261 = u_xlat0_;
    let _e263 = (vec3(_e259) * _e261.xyz);
    u_xlat0_.x = _e263.x;
    u_xlat0_.y = _e263.y;
    u_xlat0_.z = _e263.z;
    let _e271 = in_NORMAL0_1;
    let _e273 = u_xlat0_;
    u_xlat0_.x = dot(_e271.xyz, _e273.xyz);
    let _e277 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e277.x)) + 1f);
    let _e284 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e284.x));
    let _e289 = u_xlat0_;
    let _e294 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e289.x * _e294.x);
    let _e298 = u_xlat0_;
    u_xlat0_.x = exp2(_e298.x);
    let _e301 = u_xlat1_;
    let _e306 = _v_buffer2_.v_cb2_[14];
    let _e311 = _v_buffer2_.v_cb2_[16];
    let _e313 = (_e306.xyz * _e311.yyy);
    u_xlat1_.x = _e313.x;
    u_xlat1_.y = _e313.y;
    u_xlat1_.z = _e313.z;
    let _e320 = u_xlat2_;
    let _e325 = _v_buffer2_.v_cb2_[15];
    let _e330 = _v_buffer2_.v_cb2_[16];
    let _e333 = u_xlat1_;
    let _e336 = ((_e325.xyz * _e330.zzz) + -(_e333.xyz));
    u_xlat2_.x = _e336.x;
    u_xlat2_.y = _e336.y;
    u_xlat2_.z = _e336.z;
    let _e347 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e347.w;
    let _e350 = u_xlat1_;
    let _e356 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e350.w) + _e356.w);
    let _e359 = u_xlat0_;
    let _e361 = u_xlat2_;
    let _e363 = u_xlat1_;
    u_xlat0_ = ((_e359.xxxx * _e361) + _e363);
    let _e365 = in_COLOR0_1;
    let _e369 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e365 * _e369);
    let _e372 = u_xlat1_;
    let _e374 = u_xlat1_;
    u_xlat2_.x = max(_e372.y, _e374.x);
    let _e378 = u_xlat1_;
    let _e380 = u_xlat2_;
    u_xlat2_.x = max(_e378.z, _e380.x);
    let _e384 = u_xlat2_;
    u_xlat2_.x = ((_e384.x * 2f) + -1f);
    let _e392 = u_xlat2_;
    u_xlat2_.x = clamp(_e392.x, 0f, 1f);
    let _e398 = u_xlat2_;
    u_xlat2_.w = (-(_e398.x) + 1f);
    let _e403 = u_xlat2_;
    let _e405 = u_xlat1_;
    let _e407 = u_xlat1_;
    let _e409 = (_e405.xyz + _e407.xyz);
    u_xlat2_.x = _e409.x;
    u_xlat2_.y = _e409.y;
    u_xlat2_.z = _e409.z;
    let _e417 = u_xlat1_;
    let _e422 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e417.w * _e422.w);
    let _e425 = u_xlat1_;
    let _e427 = u_xlat2_;
    u_xlat3_ = (_e425.xxxx * _e427);
    let _e429 = u_xlat4_;
    let _e431 = u_xlat0_;
    let _e433 = u_xlat3_;
    let _e435 = (_e431.xyz * _e433.www);
    u_xlat4_.x = _e435.x;
    u_xlat4_.y = _e435.y;
    u_xlat4_.z = _e435.z;
    let _e442 = u_xlat0_;
    let _e443 = u_xlat3_;
    u_xlat3_ = (_e442 * _e443);
    u_xlat4_.w = 0f;
    let _e447 = u_xlat2_;
    let _e448 = u_xlat1_;
    let _e451 = u_xlat4_;
    u_xlat1_ = ((_e447 * _e448.xxxx) + _e451);
    let _e453 = u_xlat1_;
    let _e454 = u_xlat0_;
    let _e457 = u_xlat3_;
    u_xlat0_ = ((_e453 * _e454.wwww) + -(_e457));
    let _e463 = _v_buffer2_.v_cb2_[16];
    let _e465 = u_xlat0_;
    let _e467 = u_xlat3_;
    vs_COLOR0_ = ((_e463.wwww * _e465) + _e467);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e30, _e32, _e34);
}
