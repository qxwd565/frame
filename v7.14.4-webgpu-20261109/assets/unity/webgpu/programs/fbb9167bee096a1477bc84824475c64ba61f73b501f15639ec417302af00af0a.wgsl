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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec2<f32> = vec2(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e34 = in_POSITION0_1;
    let _e39 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e34.yyyy * _e39);
    let _e44 = _v_buffer1_.v_cb1_[0];
    let _e45 = in_POSITION0_1;
    let _e48 = u_xlat0_;
    u_xlat0_ = ((_e44 * _e45.xxxx) + _e48);
    let _e53 = _v_buffer1_.v_cb1_[2];
    let _e54 = in_POSITION0_1;
    let _e57 = u_xlat0_;
    u_xlat0_ = ((_e53 * _e54.zzzz) + _e57);
    let _e59 = u_xlat0_;
    let _e63 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e59 + _e63);
    let _e65 = u_xlat0_;
    let _e70 = _v_buffer1_.v_cb1_[3];
    let _e72 = in_POSITION0_1;
    let _e75 = u_xlat0_;
    let _e77 = ((_e70.xz * _e72.ww) + _e75.xz);
    u_xlat0_.x = _e77.x;
    u_xlat0_.y = _e77.y;
    let _e82 = u_xlat0_;
    let _e84 = u_xlat0_;
    let _e89 = _v_buffer2_.v_cb2_[4];
    let _e95 = _v_buffer2_.v_cb2_[4];
    let _e97 = ((_e84.xy * _e89.xy) + _e95.zw);
    u_xlat0_.x = _e97.x;
    u_xlat0_.y = _e97.y;
    let _e102 = u_xlat1_;
    let _e107 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e102.yyyy * _e107);
    let _e112 = _v_buffer0_.v_cb0_[79];
    let _e113 = u_xlat1_;
    let _e116 = u_xlat2_;
    u_xlat2_ = ((_e112 * _e113.xxxx) + _e116);
    let _e121 = _v_buffer0_.v_cb0_[81];
    let _e122 = u_xlat1_;
    let _e125 = u_xlat2_;
    u_xlat2_ = ((_e121 * _e122.zzzz) + _e125);
    let _e131 = _v_buffer0_.v_cb0_[82];
    let _e132 = u_xlat1_;
    let _e135 = u_xlat2_;
    gl_Position = ((_e131 * _e132.wwww) + _e135);
    let _e137 = u_xlat6_;
    let _e139 = u_xlat0_;
    let _e142 = u_xlat0_;
    let _e144 = (-(_e139.xy) + _e142.yx);
    u_xlat6_.x = _e144.x;
    u_xlat6_.y = _e144.y;
    let _e149 = u_xlat0_;
    let _e154 = _v_buffer2_.v_cb2_[6];
    let _e156 = u_xlat6_;
    let _e159 = u_xlat0_;
    let _e161 = ((_e154.yy * _e156.xy) + _e159.xy);
    u_xlat0_.x = _e161.x;
    u_xlat0_.y = _e161.y;
    let _e166 = u_xlat6_;
    let _e171 = _v_buffer0_.v_cb0_[15];
    let _e176 = _v_buffer2_.v_cb2_[5];
    let _e178 = (_e171.zz * _e176.xy);
    u_xlat6_.x = _e178.x;
    u_xlat6_.y = _e178.y;
    let _e183 = u_xlat6_;
    let _e185 = u_xlat6_;
    let _e187 = fract(_e185.xy);
    u_xlat6_.x = _e187.x;
    u_xlat6_.y = _e187.y;
    let _e192 = vs_TEXCOORD0_;
    let _e194 = u_xlat6_;
    let _e196 = u_xlat0_;
    let _e198 = (_e194.xy + _e196.xy);
    vs_TEXCOORD0_.z = _e198.x;
    vs_TEXCOORD0_.w = _e198.y;
    let _e203 = u_xlat0_;
    let _e205 = in_TEXCOORD0_1;
    let _e210 = _v_buffer2_.v_cb2_[1];
    let _e216 = _v_buffer2_.v_cb2_[1];
    let _e218 = ((_e205.xy * _e210.xy) + _e216.zw);
    u_xlat0_.x = _e218.x;
    u_xlat0_.y = _e218.y;
    let _e223 = u_xlat6_;
    let _e225 = u_xlat0_;
    let _e228 = u_xlat0_;
    let _e230 = (-(_e225.xy) + _e228.yx);
    u_xlat6_.x = _e230.x;
    u_xlat6_.y = _e230.y;
    let _e235 = u_xlat0_;
    let _e240 = _v_buffer2_.v_cb2_[2];
    let _e242 = u_xlat6_;
    let _e245 = u_xlat0_;
    let _e247 = ((_e240.zz * _e242.xy) + _e245.xy);
    u_xlat0_.x = _e247.x;
    u_xlat0_.y = _e247.y;
    let _e252 = u_xlat6_;
    let _e257 = _v_buffer0_.v_cb0_[15];
    let _e262 = _v_buffer2_.v_cb2_[11];
    let _e264 = (_e257.zz * _e262.yz);
    u_xlat6_.x = _e264.x;
    u_xlat6_.y = _e264.y;
    let _e269 = u_xlat6_;
    let _e271 = u_xlat6_;
    let _e273 = fract(_e271.xy);
    u_xlat6_.x = _e273.x;
    u_xlat6_.y = _e273.y;
    let _e278 = vs_TEXCOORD0_;
    let _e280 = u_xlat6_;
    let _e282 = u_xlat0_;
    let _e284 = (_e280.xy + _e282.xy);
    vs_TEXCOORD0_.x = _e284.x;
    vs_TEXCOORD0_.y = _e284.y;
    let _e289 = u_xlat0_;
    let _e294 = _v_buffer2_.v_cb2_[19];
    let _e300 = _v_buffer2_.v_cb2_[19];
    let _e302 = (-(_e294.xz) + _e300.yw);
    u_xlat0_.x = _e302.x;
    u_xlat0_.y = _e302.y;
    let _e307 = u_xlat6_;
    let _e309 = in_TEXCOORD0_1;
    let _e314 = _v_buffer2_.v_cb2_[18];
    let _e320 = _v_buffer2_.v_cb2_[18];
    let _e322 = ((_e309.xy * _e314.xy) + _e320.zw);
    u_xlat6_.x = _e322.x;
    u_xlat6_.y = _e322.y;
    let _e327 = u_xlat0_;
    let _e329 = u_xlat6_;
    let _e331 = u_xlat0_;
    let _e337 = _v_buffer2_.v_cb2_[19];
    let _e339 = ((_e329.xx * _e331.xy) + _e337.xz);
    u_xlat0_.x = _e339.x;
    u_xlat0_.y = _e339.y;
    let _e345 = u_xlat0_;
    let _e348 = u_xlat0_;
    u_xlat3_.x = (-(_e345.x) + _e348.y);
    let _e352 = u_xlat6_;
    let _e354 = u_xlat3_;
    let _e357 = u_xlat0_;
    u_xlat0_.x = ((_e352.y * _e354.x) + _e357.x);
    let _e360 = u_xlat3_;
    let _e362 = u_xlat6_;
    let _e373 = ((_e362.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat3_.x = _e373.x;
    u_xlat3_.y = _e373.y;
    let _e379 = u_xlat3_;
    let _e381 = u_xlat3_;
    u_xlat3_.x = dot(_e379.xy, _e381.xy);
    let _e385 = u_xlat3_;
    u_xlat3_.x = (-(_e385.x) + 1f);
    let _e391 = u_xlat3_;
    let _e396 = _v_buffer2_.v_cb2_[17];
    u_xlat3_.x = (_e391.x * _e396.x);
    let _e400 = u_xlat3_;
    u_xlat3_.x = clamp(_e400.x, 0f, 1f);
    let _e406 = u_xlat0_;
    let _e408 = u_xlat3_;
    u_xlat0_.x = (_e406.x * _e408.x);
    let _e412 = u_xlat0_;
    u_xlat0_.x = clamp(_e412.x, 0f, 1f);
    let _e418 = u_xlat0_;
    let _e420 = in_COLOR0_1;
    u_xlat0_.w = (_e418.x * _e420.w);
    let _e423 = u_xlat0_;
    let _e425 = in_COLOR0_1;
    let _e426 = _e425.xyz;
    u_xlat0_.x = _e426.x;
    u_xlat0_.y = _e426.y;
    u_xlat0_.z = _e426.z;
    let _e433 = u_xlat0_;
    let _e437 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e433 * _e437);
    let _e440 = u_xlat0_;
    let _e442 = u_xlat0_;
    u_xlat1_.x = max(_e440.y, _e442.x);
    let _e446 = u_xlat0_;
    let _e448 = u_xlat1_;
    u_xlat1_.x = max(_e446.z, _e448.x);
    let _e452 = u_xlat1_;
    u_xlat1_.x = ((_e452.x * 2f) + -1f);
    let _e460 = u_xlat1_;
    u_xlat1_.x = clamp(_e460.x, 0f, 1f);
    let _e466 = u_xlat1_;
    u_xlat1_.w = (-(_e466.x) + 1f);
    let _e471 = u_xlat1_;
    let _e473 = u_xlat0_;
    let _e475 = u_xlat0_;
    let _e477 = (_e473.xyz + _e475.xyz);
    u_xlat1_.x = _e477.x;
    u_xlat1_.y = _e477.y;
    u_xlat1_.z = _e477.z;
    let _e485 = u_xlat0_;
    let _e490 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e485.w * _e490.w);
    let _e493 = u_xlat0_;
    let _e495 = u_xlat1_;
    vs_COLOR0_ = (_e493.xxxx * _e495);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e26 = vs_TEXCOORD0_;
    let _e28 = vs_COLOR0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
