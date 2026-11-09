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
    let _e140 = u_xlat0_;
    let _e145 = _v_buffer2_.v_cb2_[2];
    let _e147 = u_xlat10_;
    let _e150 = u_xlat0_;
    let _e152 = ((_e145.zz * _e147.xy) + _e150.xy);
    u_xlat0_.x = _e152.x;
    u_xlat0_.y = _e152.y;
    let _e157 = u_xlat10_;
    let _e162 = _v_buffer0_.v_cb0_[15];
    let _e167 = _v_buffer2_.v_cb2_[11];
    let _e169 = (_e162.zz * _e167.yz);
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
    vs_TEXCOORD0_.x = _e189.x;
    vs_TEXCOORD0_.y = _e189.y;
    let _e194 = u_xlat0_;
    let _e199 = _v_buffer0_.v_cb0_[21];
    let _e204 = _v_buffer1_.v_cb1_[5];
    let _e206 = (_e199.yyy * _e204.xyz);
    u_xlat0_.x = _e206.x;
    u_xlat0_.y = _e206.y;
    u_xlat0_.z = _e206.z;
    let _e213 = u_xlat0_;
    let _e218 = _v_buffer1_.v_cb1_[4];
    let _e223 = _v_buffer0_.v_cb0_[21];
    let _e226 = u_xlat0_;
    let _e228 = ((_e218.xyz * _e223.xxx) + _e226.xyz);
    u_xlat0_.x = _e228.x;
    u_xlat0_.y = _e228.y;
    u_xlat0_.z = _e228.z;
    let _e235 = u_xlat0_;
    let _e240 = _v_buffer1_.v_cb1_[6];
    let _e245 = _v_buffer0_.v_cb0_[21];
    let _e248 = u_xlat0_;
    let _e250 = ((_e240.xyz * _e245.zzz) + _e248.xyz);
    u_xlat0_.x = _e250.x;
    u_xlat0_.y = _e250.y;
    u_xlat0_.z = _e250.z;
    let _e257 = u_xlat0_;
    let _e259 = u_xlat0_;
    let _e264 = _v_buffer1_.v_cb1_[7];
    let _e266 = (_e259.xyz + _e264.xyz);
    u_xlat0_.x = _e266.x;
    u_xlat0_.y = _e266.y;
    u_xlat0_.z = _e266.z;
    let _e273 = u_xlat0_;
    let _e275 = u_xlat0_;
    let _e277 = in_POSITION0_1;
    let _e280 = (_e275.xyz + -(_e277.xyz));
    u_xlat0_.x = _e280.x;
    u_xlat0_.y = _e280.y;
    u_xlat0_.z = _e280.z;
    let _e287 = u_xlat0_;
    let _e289 = u_xlat0_;
    u_xlat15_ = dot(_e287.xyz, _e289.xyz);
    let _e292 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e292);
    let _e294 = u_xlat0_;
    let _e296 = u_xlat15_;
    let _e298 = u_xlat0_;
    let _e300 = (vec3(_e296) * _e298.xyz);
    u_xlat0_.x = _e300.x;
    u_xlat0_.y = _e300.y;
    u_xlat0_.z = _e300.z;
    let _e308 = in_NORMAL0_1;
    let _e310 = u_xlat0_;
    u_xlat0_.x = dot(_e308.xyz, _e310.xyz);
    let _e314 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e314.x)) + 1f);
    let _e321 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e321.x));
    let _e326 = u_xlat0_;
    let _e331 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e326.x * _e331.x);
    let _e335 = u_xlat0_;
    u_xlat0_.x = exp2(_e335.x);
    let _e338 = u_xlat1_;
    let _e343 = _v_buffer2_.v_cb2_[14];
    let _e348 = _v_buffer2_.v_cb2_[16];
    let _e350 = (_e343.xyz * _e348.yyy);
    u_xlat1_.x = _e350.x;
    u_xlat1_.y = _e350.y;
    u_xlat1_.z = _e350.z;
    let _e357 = u_xlat2_;
    let _e362 = _v_buffer2_.v_cb2_[15];
    let _e367 = _v_buffer2_.v_cb2_[16];
    let _e370 = u_xlat1_;
    let _e373 = ((_e362.xyz * _e367.zzz) + -(_e370.xyz));
    u_xlat2_.x = _e373.x;
    u_xlat2_.y = _e373.y;
    u_xlat2_.z = _e373.z;
    let _e384 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e384.w;
    let _e387 = u_xlat1_;
    let _e393 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e387.w) + _e393.w);
    let _e396 = u_xlat0_;
    let _e398 = u_xlat2_;
    let _e400 = u_xlat1_;
    u_xlat0_ = ((_e396.xxxx * _e398) + _e400);
    let _e402 = in_COLOR0_1;
    let _e406 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e402 * _e406);
    let _e409 = u_xlat1_;
    let _e411 = u_xlat1_;
    u_xlat2_.x = max(_e409.y, _e411.x);
    let _e415 = u_xlat1_;
    let _e417 = u_xlat2_;
    u_xlat2_.x = max(_e415.z, _e417.x);
    let _e421 = u_xlat2_;
    u_xlat2_.x = ((_e421.x * 2f) + -1f);
    let _e429 = u_xlat2_;
    u_xlat2_.x = clamp(_e429.x, 0f, 1f);
    let _e435 = u_xlat2_;
    u_xlat2_.w = (-(_e435.x) + 1f);
    let _e440 = u_xlat2_;
    let _e442 = u_xlat1_;
    let _e444 = u_xlat1_;
    let _e446 = (_e442.xyz + _e444.xyz);
    u_xlat2_.x = _e446.x;
    u_xlat2_.y = _e446.y;
    u_xlat2_.z = _e446.z;
    let _e454 = u_xlat1_;
    let _e459 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e454.w * _e459.w);
    let _e462 = u_xlat1_;
    let _e464 = u_xlat2_;
    u_xlat3_ = (_e462.xxxx * _e464);
    let _e466 = u_xlat4_;
    let _e468 = u_xlat0_;
    let _e470 = u_xlat3_;
    let _e472 = (_e468.xyz * _e470.www);
    u_xlat4_.x = _e472.x;
    u_xlat4_.y = _e472.y;
    u_xlat4_.z = _e472.z;
    let _e479 = u_xlat0_;
    let _e480 = u_xlat3_;
    u_xlat3_ = (_e479 * _e480);
    u_xlat4_.w = 0f;
    let _e484 = u_xlat2_;
    let _e485 = u_xlat1_;
    let _e488 = u_xlat4_;
    u_xlat1_ = ((_e484 * _e485.xxxx) + _e488);
    let _e490 = u_xlat1_;
    let _e491 = u_xlat0_;
    let _e494 = u_xlat3_;
    u_xlat0_ = ((_e490 * _e491.wwww) + -(_e494));
    let _e500 = _v_buffer2_.v_cb2_[16];
    let _e502 = u_xlat0_;
    let _e504 = u_xlat3_;
    vs_COLOR0_ = ((_e500.wwww * _e502) + _e504);
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
