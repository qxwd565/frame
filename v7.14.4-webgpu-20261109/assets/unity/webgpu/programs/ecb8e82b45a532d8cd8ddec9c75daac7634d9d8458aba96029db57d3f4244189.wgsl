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
    u_xlat1_ = (_e67 + _e71);
    let _e73 = u_xlat0_;
    let _e78 = _v_buffer1_.v_cb1_[3];
    let _e80 = in_POSITION0_1;
    let _e83 = u_xlat0_;
    let _e85 = ((_e78.xz * _e80.ww) + _e83.xz);
    u_xlat0_.x = _e85.x;
    u_xlat0_.y = _e85.y;
    let _e90 = u_xlat0_;
    let _e92 = u_xlat0_;
    let _e97 = _v_buffer2_.v_cb2_[4];
    let _e103 = _v_buffer2_.v_cb2_[4];
    let _e105 = ((_e92.xy * _e97.xy) + _e103.zw);
    u_xlat0_.x = _e105.x;
    u_xlat0_.y = _e105.y;
    let _e110 = u_xlat1_;
    let _e115 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e110.yyyy * _e115);
    let _e120 = _v_buffer0_.v_cb0_[79];
    let _e121 = u_xlat1_;
    let _e124 = u_xlat2_;
    u_xlat2_ = ((_e120 * _e121.xxxx) + _e124);
    let _e129 = _v_buffer0_.v_cb0_[81];
    let _e130 = u_xlat1_;
    let _e133 = u_xlat2_;
    u_xlat2_ = ((_e129 * _e130.zzzz) + _e133);
    let _e139 = _v_buffer0_.v_cb0_[82];
    let _e140 = u_xlat1_;
    let _e143 = u_xlat2_;
    gl_Position = ((_e139 * _e140.wwww) + _e143);
    let _e145 = u_xlat10_;
    let _e147 = u_xlat0_;
    let _e150 = u_xlat0_;
    let _e152 = (-(_e147.xy) + _e150.yx);
    u_xlat10_.x = _e152.x;
    u_xlat10_.y = _e152.y;
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer2_.v_cb2_[6];
    let _e164 = u_xlat10_;
    let _e167 = u_xlat0_;
    let _e169 = ((_e162.yy * _e164.xy) + _e167.xy);
    u_xlat0_.x = _e169.x;
    u_xlat0_.y = _e169.y;
    let _e174 = u_xlat10_;
    let _e179 = _v_buffer0_.v_cb0_[15];
    let _e184 = _v_buffer2_.v_cb2_[5];
    let _e186 = (_e179.zz * _e184.xy);
    u_xlat10_.x = _e186.x;
    u_xlat10_.y = _e186.y;
    let _e191 = u_xlat10_;
    let _e193 = u_xlat10_;
    let _e195 = fract(_e193.xy);
    u_xlat10_.x = _e195.x;
    u_xlat10_.y = _e195.y;
    let _e200 = vs_TEXCOORD0_;
    let _e202 = u_xlat10_;
    let _e204 = u_xlat0_;
    let _e206 = (_e202.xy + _e204.xy);
    vs_TEXCOORD0_.z = _e206.x;
    vs_TEXCOORD0_.w = _e206.y;
    let _e211 = u_xlat0_;
    let _e213 = in_TEXCOORD0_1;
    let _e218 = _v_buffer2_.v_cb2_[1];
    let _e224 = _v_buffer2_.v_cb2_[1];
    let _e226 = ((_e213.xy * _e218.xy) + _e224.zw);
    u_xlat0_.x = _e226.x;
    u_xlat0_.y = _e226.y;
    let _e231 = u_xlat10_;
    let _e233 = u_xlat0_;
    let _e236 = u_xlat0_;
    let _e238 = (-(_e233.xy) + _e236.yx);
    u_xlat10_.x = _e238.x;
    u_xlat10_.y = _e238.y;
    let _e243 = vs_TEXCOORD0_;
    let _e248 = _v_buffer2_.v_cb2_[2];
    let _e250 = u_xlat10_;
    let _e253 = u_xlat0_;
    let _e255 = ((_e248.zz * _e250.xy) + _e253.xy);
    vs_TEXCOORD0_.x = _e255.x;
    vs_TEXCOORD0_.y = _e255.y;
    let _e260 = u_xlat0_;
    let _e265 = _v_buffer0_.v_cb0_[21];
    let _e270 = _v_buffer1_.v_cb1_[5];
    let _e272 = (_e265.yyy * _e270.xyz);
    u_xlat0_.x = _e272.x;
    u_xlat0_.y = _e272.y;
    u_xlat0_.z = _e272.z;
    let _e279 = u_xlat0_;
    let _e284 = _v_buffer1_.v_cb1_[4];
    let _e289 = _v_buffer0_.v_cb0_[21];
    let _e292 = u_xlat0_;
    let _e294 = ((_e284.xyz * _e289.xxx) + _e292.xyz);
    u_xlat0_.x = _e294.x;
    u_xlat0_.y = _e294.y;
    u_xlat0_.z = _e294.z;
    let _e301 = u_xlat0_;
    let _e306 = _v_buffer1_.v_cb1_[6];
    let _e311 = _v_buffer0_.v_cb0_[21];
    let _e314 = u_xlat0_;
    let _e316 = ((_e306.xyz * _e311.zzz) + _e314.xyz);
    u_xlat0_.x = _e316.x;
    u_xlat0_.y = _e316.y;
    u_xlat0_.z = _e316.z;
    let _e323 = u_xlat0_;
    let _e325 = u_xlat0_;
    let _e330 = _v_buffer1_.v_cb1_[7];
    let _e332 = (_e325.xyz + _e330.xyz);
    u_xlat0_.x = _e332.x;
    u_xlat0_.y = _e332.y;
    u_xlat0_.z = _e332.z;
    let _e339 = u_xlat0_;
    let _e341 = u_xlat0_;
    let _e343 = in_POSITION0_1;
    let _e346 = (_e341.xyz + -(_e343.xyz));
    u_xlat0_.x = _e346.x;
    u_xlat0_.y = _e346.y;
    u_xlat0_.z = _e346.z;
    let _e353 = u_xlat0_;
    let _e355 = u_xlat0_;
    u_xlat15_ = dot(_e353.xyz, _e355.xyz);
    let _e358 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e358);
    let _e360 = u_xlat0_;
    let _e362 = u_xlat15_;
    let _e364 = u_xlat0_;
    let _e366 = (vec3(_e362) * _e364.xyz);
    u_xlat0_.x = _e366.x;
    u_xlat0_.y = _e366.y;
    u_xlat0_.z = _e366.z;
    let _e374 = in_NORMAL0_1;
    let _e376 = u_xlat0_;
    u_xlat0_.x = dot(_e374.xyz, _e376.xyz);
    let _e380 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e380.x)) + 1f);
    let _e387 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e387.x));
    let _e392 = u_xlat0_;
    let _e397 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e392.x * _e397.x);
    let _e401 = u_xlat0_;
    u_xlat0_.x = exp2(_e401.x);
    let _e404 = u_xlat1_;
    let _e409 = _v_buffer2_.v_cb2_[14];
    let _e414 = _v_buffer2_.v_cb2_[16];
    let _e416 = (_e409.xyz * _e414.yyy);
    u_xlat1_.x = _e416.x;
    u_xlat1_.y = _e416.y;
    u_xlat1_.z = _e416.z;
    let _e423 = u_xlat2_;
    let _e428 = _v_buffer2_.v_cb2_[15];
    let _e433 = _v_buffer2_.v_cb2_[16];
    let _e436 = u_xlat1_;
    let _e439 = ((_e428.xyz * _e433.zzz) + -(_e436.xyz));
    u_xlat2_.x = _e439.x;
    u_xlat2_.y = _e439.y;
    u_xlat2_.z = _e439.z;
    let _e450 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e450.w;
    let _e453 = u_xlat1_;
    let _e459 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e453.w) + _e459.w);
    let _e462 = u_xlat0_;
    let _e464 = u_xlat2_;
    let _e466 = u_xlat1_;
    u_xlat0_ = ((_e462.xxxx * _e464) + _e466);
    let _e468 = in_COLOR0_1;
    let _e472 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e468 * _e472);
    let _e475 = u_xlat1_;
    let _e477 = u_xlat1_;
    u_xlat2_.x = max(_e475.y, _e477.x);
    let _e481 = u_xlat1_;
    let _e483 = u_xlat2_;
    u_xlat2_.x = max(_e481.z, _e483.x);
    let _e487 = u_xlat2_;
    u_xlat2_.x = ((_e487.x * 2f) + -1f);
    let _e495 = u_xlat2_;
    u_xlat2_.x = clamp(_e495.x, 0f, 1f);
    let _e501 = u_xlat2_;
    u_xlat2_.w = (-(_e501.x) + 1f);
    let _e506 = u_xlat2_;
    let _e508 = u_xlat1_;
    let _e510 = u_xlat1_;
    let _e512 = (_e508.xyz + _e510.xyz);
    u_xlat2_.x = _e512.x;
    u_xlat2_.y = _e512.y;
    u_xlat2_.z = _e512.z;
    let _e520 = u_xlat1_;
    let _e525 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e520.w * _e525.w);
    let _e528 = u_xlat1_;
    let _e530 = u_xlat2_;
    u_xlat3_ = (_e528.xxxx * _e530);
    let _e532 = u_xlat4_;
    let _e534 = u_xlat0_;
    let _e536 = u_xlat3_;
    let _e538 = (_e534.xyz * _e536.www);
    u_xlat4_.x = _e538.x;
    u_xlat4_.y = _e538.y;
    u_xlat4_.z = _e538.z;
    let _e545 = u_xlat0_;
    let _e546 = u_xlat3_;
    u_xlat3_ = (_e545 * _e546);
    u_xlat4_.w = 0f;
    let _e550 = u_xlat2_;
    let _e551 = u_xlat1_;
    let _e554 = u_xlat4_;
    u_xlat1_ = ((_e550 * _e551.xxxx) + _e554);
    let _e556 = u_xlat1_;
    let _e557 = u_xlat0_;
    let _e560 = u_xlat3_;
    u_xlat0_ = ((_e556 * _e557.wwww) + -(_e560));
    let _e566 = _v_buffer2_.v_cb2_[16];
    let _e568 = u_xlat0_;
    let _e570 = u_xlat3_;
    vs_COLOR0_ = ((_e566.wwww * _e568) + _e570);
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
