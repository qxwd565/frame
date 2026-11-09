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

    let _e43 = in_POSITION0_1;
    let _e48 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e43.yyyy * _e48);
    let _e53 = _v_buffer1_.v_cb1_[0];
    let _e54 = in_POSITION0_1;
    let _e57 = u_xlat0_;
    u_xlat0_ = ((_e53 * _e54.xxxx) + _e57);
    let _e62 = _v_buffer1_.v_cb1_[2];
    let _e63 = in_POSITION0_1;
    let _e66 = u_xlat0_;
    u_xlat0_ = ((_e62 * _e63.zzzz) + _e66);
    let _e68 = u_xlat0_;
    let _e72 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e68 + _e72);
    let _e78 = _v_buffer1_.v_cb1_[3];
    let _e80 = in_POSITION0_1;
    let _e83 = u_xlat0_;
    u_xlat0_.x = ((_e78.y * _e80.w) + _e83.y);
    let _e87 = u_xlat0_;
    let _e92 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e87.x + -(_e92.x));
    let _e96 = u_xlat0_;
    let _e101 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e96.x / _e101.w);
    let _e104 = u_xlat1_;
    let _e109 = _v_buffer0_.v_cb0_[80];
    u_xlat0_ = (_e104.yyyy * _e109);
    let _e114 = _v_buffer0_.v_cb0_[79];
    let _e115 = u_xlat1_;
    let _e118 = u_xlat0_;
    u_xlat0_ = ((_e114 * _e115.xxxx) + _e118);
    let _e123 = _v_buffer0_.v_cb0_[81];
    let _e124 = u_xlat1_;
    let _e127 = u_xlat0_;
    u_xlat0_ = ((_e123 * _e124.zzzz) + _e127);
    let _e133 = _v_buffer0_.v_cb0_[82];
    let _e134 = u_xlat1_;
    let _e137 = u_xlat0_;
    gl_Position = ((_e133 * _e134.wwww) + _e137);
    let _e139 = u_xlat0_;
    let _e141 = in_TEXCOORD0_1;
    let _e146 = _v_buffer2_.v_cb2_[1];
    let _e152 = _v_buffer2_.v_cb2_[1];
    let _e154 = ((_e141.xy * _e146.xy) + _e152.zw);
    u_xlat0_.x = _e154.x;
    u_xlat0_.y = _e154.y;
    let _e159 = u_xlat10_;
    let _e161 = u_xlat0_;
    let _e164 = u_xlat0_;
    let _e166 = (-(_e161.xy) + _e164.yx);
    u_xlat10_.x = _e166.x;
    u_xlat10_.y = _e166.y;
    let _e171 = u_xlat0_;
    let _e176 = _v_buffer2_.v_cb2_[2];
    let _e178 = u_xlat10_;
    let _e181 = u_xlat0_;
    let _e183 = ((_e176.zz * _e178.xy) + _e181.xy);
    u_xlat0_.x = _e183.x;
    u_xlat0_.y = _e183.y;
    let _e188 = u_xlat10_;
    let _e193 = _v_buffer0_.v_cb0_[15];
    let _e198 = _v_buffer2_.v_cb2_[11];
    let _e200 = (_e193.zz * _e198.yz);
    u_xlat10_.x = _e200.x;
    u_xlat10_.y = _e200.y;
    let _e205 = u_xlat10_;
    let _e207 = u_xlat10_;
    let _e209 = fract(_e207.xy);
    u_xlat10_.x = _e209.x;
    u_xlat10_.y = _e209.y;
    let _e214 = vs_TEXCOORD0_;
    let _e216 = u_xlat10_;
    let _e218 = u_xlat0_;
    let _e220 = (_e216.xy + _e218.xy);
    vs_TEXCOORD0_.x = _e220.x;
    vs_TEXCOORD0_.y = _e220.y;
    let _e225 = u_xlat0_;
    let _e230 = _v_buffer0_.v_cb0_[21];
    let _e235 = _v_buffer1_.v_cb1_[5];
    let _e237 = (_e230.yyy * _e235.xyz);
    u_xlat0_.x = _e237.x;
    u_xlat0_.y = _e237.y;
    u_xlat0_.z = _e237.z;
    let _e244 = u_xlat0_;
    let _e249 = _v_buffer1_.v_cb1_[4];
    let _e254 = _v_buffer0_.v_cb0_[21];
    let _e257 = u_xlat0_;
    let _e259 = ((_e249.xyz * _e254.xxx) + _e257.xyz);
    u_xlat0_.x = _e259.x;
    u_xlat0_.y = _e259.y;
    u_xlat0_.z = _e259.z;
    let _e266 = u_xlat0_;
    let _e271 = _v_buffer1_.v_cb1_[6];
    let _e276 = _v_buffer0_.v_cb0_[21];
    let _e279 = u_xlat0_;
    let _e281 = ((_e271.xyz * _e276.zzz) + _e279.xyz);
    u_xlat0_.x = _e281.x;
    u_xlat0_.y = _e281.y;
    u_xlat0_.z = _e281.z;
    let _e288 = u_xlat0_;
    let _e290 = u_xlat0_;
    let _e295 = _v_buffer1_.v_cb1_[7];
    let _e297 = (_e290.xyz + _e295.xyz);
    u_xlat0_.x = _e297.x;
    u_xlat0_.y = _e297.y;
    u_xlat0_.z = _e297.z;
    let _e304 = u_xlat0_;
    let _e306 = u_xlat0_;
    let _e308 = in_POSITION0_1;
    let _e311 = (_e306.xyz + -(_e308.xyz));
    u_xlat0_.x = _e311.x;
    u_xlat0_.y = _e311.y;
    u_xlat0_.z = _e311.z;
    let _e318 = u_xlat0_;
    let _e320 = u_xlat0_;
    u_xlat15_ = dot(_e318.xyz, _e320.xyz);
    let _e323 = u_xlat15_;
    u_xlat15_ = inverseSqrt(_e323);
    let _e325 = u_xlat0_;
    let _e327 = u_xlat15_;
    let _e329 = u_xlat0_;
    let _e331 = (vec3(_e327) * _e329.xyz);
    u_xlat0_.x = _e331.x;
    u_xlat0_.y = _e331.y;
    u_xlat0_.z = _e331.z;
    let _e339 = in_NORMAL0_1;
    let _e341 = u_xlat0_;
    u_xlat0_.x = dot(_e339.xyz, _e341.xyz);
    let _e345 = u_xlat0_;
    u_xlat0_.x = (-(abs(_e345.x)) + 1f);
    let _e352 = u_xlat0_;
    u_xlat0_.x = log2(abs(_e352.x));
    let _e357 = u_xlat0_;
    let _e362 = _v_buffer2_.v_cb2_[16];
    u_xlat0_.x = (_e357.x * _e362.x);
    let _e366 = u_xlat0_;
    u_xlat0_.x = exp2(_e366.x);
    let _e369 = u_xlat1_;
    let _e374 = _v_buffer2_.v_cb2_[14];
    let _e379 = _v_buffer2_.v_cb2_[16];
    let _e381 = (_e374.xyz * _e379.yyy);
    u_xlat1_.x = _e381.x;
    u_xlat1_.y = _e381.y;
    u_xlat1_.z = _e381.z;
    let _e388 = u_xlat2_;
    let _e393 = _v_buffer2_.v_cb2_[15];
    let _e398 = _v_buffer2_.v_cb2_[16];
    let _e401 = u_xlat1_;
    let _e404 = ((_e393.xyz * _e398.zzz) + -(_e401.xyz));
    u_xlat2_.x = _e404.x;
    u_xlat2_.y = _e404.y;
    u_xlat2_.z = _e404.z;
    let _e415 = _v_buffer2_.v_cb2_[14];
    u_xlat1_.w = _e415.w;
    let _e418 = u_xlat1_;
    let _e424 = _v_buffer2_.v_cb2_[15];
    u_xlat2_.w = (-(_e418.w) + _e424.w);
    let _e427 = u_xlat0_;
    let _e429 = u_xlat2_;
    let _e431 = u_xlat1_;
    u_xlat0_ = ((_e427.xxxx * _e429) + _e431);
    let _e433 = in_COLOR0_1;
    let _e437 = _v_buffer2_.v_cb2_[0];
    u_xlat1_ = (_e433 * _e437);
    let _e440 = u_xlat1_;
    let _e442 = u_xlat1_;
    u_xlat2_.x = max(_e440.y, _e442.x);
    let _e446 = u_xlat1_;
    let _e448 = u_xlat2_;
    u_xlat2_.x = max(_e446.z, _e448.x);
    let _e452 = u_xlat2_;
    u_xlat2_.x = ((_e452.x * 2f) + -1f);
    let _e460 = u_xlat2_;
    u_xlat2_.x = clamp(_e460.x, 0f, 1f);
    let _e466 = u_xlat2_;
    u_xlat2_.w = (-(_e466.x) + 1f);
    let _e471 = u_xlat2_;
    let _e473 = u_xlat1_;
    let _e475 = u_xlat1_;
    let _e477 = (_e473.xyz + _e475.xyz);
    u_xlat2_.x = _e477.x;
    u_xlat2_.y = _e477.y;
    u_xlat2_.z = _e477.z;
    let _e485 = u_xlat1_;
    let _e490 = _v_buffer2_.v_cb2_[2];
    u_xlat1_.x = (_e485.w * _e490.w);
    let _e493 = u_xlat1_;
    let _e495 = u_xlat2_;
    u_xlat3_ = (_e493.xxxx * _e495);
    let _e497 = u_xlat4_;
    let _e499 = u_xlat0_;
    let _e501 = u_xlat3_;
    let _e503 = (_e499.xyz * _e501.www);
    u_xlat4_.x = _e503.x;
    u_xlat4_.y = _e503.y;
    u_xlat4_.z = _e503.z;
    let _e510 = u_xlat0_;
    let _e511 = u_xlat3_;
    u_xlat3_ = (_e510 * _e511);
    u_xlat4_.w = 0f;
    let _e515 = u_xlat2_;
    let _e516 = u_xlat1_;
    let _e519 = u_xlat4_;
    u_xlat1_ = ((_e515 * _e516.xxxx) + _e519);
    let _e521 = u_xlat1_;
    let _e522 = u_xlat0_;
    let _e525 = u_xlat3_;
    u_xlat0_ = ((_e521 * _e522.wwww) + -(_e525));
    let _e531 = _v_buffer2_.v_cb2_[16];
    let _e533 = u_xlat0_;
    let _e535 = u_xlat3_;
    vs_COLOR0_ = ((_e531.wwww * _e533) + _e535);
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
    let _e34 = vs_TEXCOORD1_;
    let _e36 = vs_COLOR0_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
