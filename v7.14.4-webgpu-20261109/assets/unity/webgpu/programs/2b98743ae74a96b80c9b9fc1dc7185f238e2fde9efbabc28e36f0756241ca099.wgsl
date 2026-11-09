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
    let _e115 = _v_buffer2_.v_cb2_[4];
    let _e121 = _v_buffer2_.v_cb2_[4];
    let _e123 = ((_e110.xy * _e115.xy) + _e121.zw);
    u_xlat0_.x = _e123.x;
    u_xlat0_.y = _e123.y;
    let _e128 = u_xlat10_;
    let _e130 = u_xlat0_;
    let _e133 = u_xlat0_;
    let _e135 = (-(_e130.xy) + _e133.yx);
    u_xlat10_.x = _e135.x;
    u_xlat10_.y = _e135.y;
    let _e140 = u_xlat0_;
    let _e145 = _v_buffer2_.v_cb2_[6];
    let _e147 = u_xlat10_;
    let _e150 = u_xlat0_;
    let _e152 = ((_e145.yy * _e147.xy) + _e150.xy);
    u_xlat0_.x = _e152.x;
    u_xlat0_.y = _e152.y;
    let _e157 = u_xlat10_;
    let _e162 = _v_buffer0_.v_cb0_[15];
    let _e167 = _v_buffer2_.v_cb2_[5];
    let _e169 = (_e162.zz * _e167.xy);
    u_xlat10_.x = _e169.x;
    u_xlat10_.y = _e169.y;
    let _e174 = u_xlat10_;
    let _e176 = u_xlat10_;
    let _e178 = fract(_e176.xy);
    u_xlat10_.x = _e178.x;
    u_xlat10_.y = _e178.y;
    let _e183 = vs_TEXCOORD0_;
    let _e185 = u_xlat10_;
    let _e187 = u_xlat0_;
    let _e189 = (_e185.xy + _e187.xy);
    vs_TEXCOORD0_.z = _e189.x;
    vs_TEXCOORD0_.w = _e189.y;
    let _e194 = u_xlat0_;
    let _e196 = in_TEXCOORD0_1;
    let _e201 = _v_buffer2_.v_cb2_[1];
    let _e207 = _v_buffer2_.v_cb2_[1];
    let _e209 = ((_e196.xy * _e201.xy) + _e207.zw);
    u_xlat0_.x = _e209.x;
    u_xlat0_.y = _e209.y;
    let _e214 = u_xlat10_;
    let _e216 = u_xlat0_;
    let _e219 = u_xlat0_;
    let _e221 = (-(_e216.xy) + _e219.yx);
    u_xlat10_.x = _e221.x;
    u_xlat10_.y = _e221.y;
    let _e226 = vs_TEXCOORD0_;
    let _e231 = _v_buffer2_.v_cb2_[2];
    let _e233 = u_xlat10_;
    let _e236 = u_xlat0_;
    let _e238 = ((_e231.zz * _e233.xy) + _e236.xy);
    vs_TEXCOORD0_.x = _e238.x;
    vs_TEXCOORD0_.y = _e238.y;
    let _e243 = u_xlat0_;
    let _e248 = _v_buffer0_.v_cb0_[21];
    let _e253 = _v_buffer1_.v_cb1_[5];
    let _e255 = (_e248.yyy * _e253.xyz);
    u_xlat0_.x = _e255.x;
    u_xlat0_.y = _e255.y;
    u_xlat0_.z = _e255.z;
    let _e262 = u_xlat0_;
    let _e267 = _v_buffer1_.v_cb1_[4];
    let _e272 = _v_buffer0_.v_cb0_[21];
    let _e275 = u_xlat0_;
    let _e277 = ((_e267.xyz * _e272.xxx) + _e275.xyz);
    u_xlat0_.x = _e277.x;
    u_xlat0_.y = _e277.y;
    u_xlat0_.z = _e277.z;
    let _e284 = u_xlat0_;
    let _e289 = _v_buffer1_.v_cb1_[6];
    let _e294 = _v_buffer0_.v_cb0_[21];
    let _e297 = u_xlat0_;
    let _e299 = ((_e289.xyz * _e294.zzz) + _e297.xyz);
    u_xlat0_.x = _e299.x;
    u_xlat0_.y = _e299.y;
    u_xlat0_.z = _e299.z;
    let _e306 = u_xlat0_;
    let _e308 = u_xlat0_;
    let _e313 = _v_buffer1_.v_cb1_[7];
    let _e315 = (_e308.xyz + _e313.xyz);
    u_xlat0_.x = _e315.x;
    u_xlat0_.y = _e315.y;
    u_xlat0_.z = _e315.z;
    let _e322 = u_xlat0_;
    let _e324 = u_xlat0_;
    let _e326 = in_POSITION0_1;
    let _e329 = (_e324.xyz + -(_e326.xyz));
    u_xlat0_.x = _e329.x;
    u_xlat0_.y = _e329.y;
    u_xlat0_.z = _e329.z;
    let _e336 = u_xlat0_;
    let _e338 = u_xlat0_;
    u_xlat15_ = dot(_e336.xyz, _e338.xyz);
    let _e341 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e341);
    let _e343 = u_xlat0_;
    let _e345 = u_xlat15_;
    let _e347 = u_xlat0_;
    let _e349 = (vec3(_e345) * _e347.xyz);
    u_xlat0_.x = _e349.x;
    u_xlat0_.y = _e349.y;
    u_xlat0_.z = _e349.z;
    let _e357 = in_NORMAL0_1;
    let _e359 = u_xlat0_;
    u_xlat0_.x = dot(_e357.xyz, _e359.xyz);
    let _e363 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e363.x)) + 1f);
    let _e370 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e370.x));
    let _e375 = u_xlat0_;
    let _e380 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e375.x * _e380.x);
    let _e384 = u_xlat0_;
    u_xlat0_.x = exp2(_e384.x);
    let _e387 = u_xlat1_;
    let _e392 = _v_buffer2_.v_cb2_[14];
    let _e397 = _v_buffer2_.v_cb2_[16];
    let _e399 = (_e392.xyz * _e397.yyy);
    u_xlat1_.x = _e399.x;
    u_xlat1_.y = _e399.y;
    u_xlat1_.z = _e399.z;
    let _e406 = u_xlat2_;
    let _e411 = _v_buffer2_.v_cb2_[15];
    let _e416 = _v_buffer2_.v_cb2_[16];
    let _e419 = u_xlat1_;
    let _e422 = ((_e411.xyz * _e416.zzz) + -(_e419.xyz));
    u_xlat2_.x = _e422.x;
    u_xlat2_.y = _e422.y;
    u_xlat2_.z = _e422.z;
    let _e433 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e433.w;
    let _e436 = u_xlat1_;
    let _e442 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e436.w) + _e442.w);
    let _e445 = u_xlat0_;
    let _e447 = u_xlat2_;
    let _e449 = u_xlat1_;
    u_xlat0_ = ((_e445.xxxx * _e447) + _e449);
    let _e451 = in_COLOR0_1;
    let _e455 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e451 * _e455);
    let _e458 = u_xlat1_;
    let _e460 = u_xlat1_;
    u_xlat2_.x = max(_e458.y, _e460.x);
    let _e464 = u_xlat1_;
    let _e466 = u_xlat2_;
    u_xlat2_.x = max(_e464.z, _e466.x);
    let _e470 = u_xlat2_;
    u_xlat2_.x = ((_e470.x * 2f) + -1f);
    let _e478 = u_xlat2_;
    u_xlat2_.x = clamp(_e478.x, 0f, 1f);
    let _e484 = u_xlat2_;
    u_xlat2_.w = (-(_e484.x) + 1f);
    let _e489 = u_xlat2_;
    let _e491 = u_xlat1_;
    let _e493 = u_xlat1_;
    let _e495 = (_e491.xyz + _e493.xyz);
    u_xlat2_.x = _e495.x;
    u_xlat2_.y = _e495.y;
    u_xlat2_.z = _e495.z;
    let _e503 = u_xlat1_;
    let _e508 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e503.w * _e508.w);
    let _e511 = u_xlat1_;
    let _e513 = u_xlat2_;
    u_xlat3_ = (_e511.xxxx * _e513);
    let _e515 = u_xlat4_;
    let _e517 = u_xlat0_;
    let _e519 = u_xlat3_;
    let _e521 = (_e517.xyz * _e519.www);
    u_xlat4_.x = _e521.x;
    u_xlat4_.y = _e521.y;
    u_xlat4_.z = _e521.z;
    let _e528 = u_xlat0_;
    let _e529 = u_xlat3_;
    u_xlat3_ = (_e528 * _e529);
    u_xlat4_.w = 0f;
    let _e533 = u_xlat2_;
    let _e534 = u_xlat1_;
    let _e537 = u_xlat4_;
    u_xlat1_ = ((_e533 * _e534.xxxx) + _e537);
    let _e539 = u_xlat1_;
    let _e540 = u_xlat0_;
    let _e543 = u_xlat3_;
    u_xlat0_ = ((_e539 * _e540.wwww) + -(_e543));
    let _e549 = _v_buffer2_.v_cb2_[16];
    let _e551 = u_xlat0_;
    let _e553 = u_xlat3_;
    vs_COLOR0_ = ((_e549.wwww * _e551) + _e553);
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
