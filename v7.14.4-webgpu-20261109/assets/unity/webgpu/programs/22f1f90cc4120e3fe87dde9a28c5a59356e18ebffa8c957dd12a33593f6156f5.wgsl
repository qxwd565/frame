struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 7>,
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
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

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
    let _e137 = u_xlat8_;
    let _e139 = u_xlat0_;
    let _e142 = u_xlat0_;
    let _e144 = (-(_e139.xy) + _e142.yx);
    u_xlat8_.x = _e144.x;
    u_xlat8_.y = _e144.y;
    let _e149 = u_xlat0_;
    let _e154 = _v_buffer2_.v_cb2_[6];
    let _e156 = u_xlat8_;
    let _e159 = u_xlat0_;
    let _e161 = ((_e154.yy * _e156.xy) + _e159.xy);
    u_xlat0_.x = _e161.x;
    u_xlat0_.y = _e161.y;
    let _e166 = u_xlat8_;
    let _e171 = _v_buffer0_.v_cb0_[15];
    let _e176 = _v_buffer2_.v_cb2_[5];
    let _e178 = (_e171.zz * _e176.xy);
    u_xlat8_.x = _e178.x;
    u_xlat8_.y = _e178.y;
    let _e183 = u_xlat8_;
    let _e185 = u_xlat8_;
    let _e187 = fract(_e185.xy);
    u_xlat8_.x = _e187.x;
    u_xlat8_.y = _e187.y;
    let _e192 = u_xlat0_;
    let _e194 = u_xlat8_;
    let _e196 = u_xlat0_;
    let _e198 = (_e194.xy + _e196.xy);
    u_xlat0_.x = _e198.x;
    u_xlat0_.y = _e198.y;
    let _e203 = u_xlat0_;
    let _e208 = _v_buffer2_.v_cb2_[4];
    let _e215 = u_xlat0_;
    let _e217 = ((-(_e208.xy) * vec2<f32>(0.5f, 0.5f)) + _e215.xy);
    u_xlat0_.x = _e217.x;
    u_xlat0_.y = _e217.y;
    let _e226 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e226.w * 0.017453289f);
    let _e234 = _v_buffer2_.v_cb2_[6];
    let _e239 = _v_buffer0_.v_cb0_[15];
    let _e242 = u_xlat8_;
    u_xlat8_.x = ((_e234.z * _e239.z) + -(_e242.x));
    let _e247 = u_xlat8_;
    u_xlat1_.x = sin(_e247.x);
    let _e251 = u_xlat8_;
    u_xlat2_.x = cos(_e251.x);
    let _e255 = u_xlat1_;
    u_xlat3_.z = _e255.x;
    let _e258 = u_xlat2_;
    u_xlat3_.y = _e258.x;
    let _e261 = u_xlat1_;
    u_xlat3_.x = -(_e261.x);
    let _e265 = u_xlat0_;
    let _e267 = u_xlat3_;
    u_xlat8_.y = dot(_e265.xy, _e267.xy);
    let _e271 = u_xlat0_;
    let _e273 = u_xlat3_;
    u_xlat8_.x = dot(_e271.xy, _e273.yz);
    let _e276 = vs_TEXCOORD0_;
    let _e281 = _v_buffer2_.v_cb2_[4];
    let _e287 = u_xlat8_;
    let _e289 = ((_e281.xy * vec2<f32>(0.5f, 0.5f)) + _e287.xy);
    vs_TEXCOORD0_.z = _e289.x;
    vs_TEXCOORD0_.w = _e289.y;
    let _e294 = u_xlat0_;
    let _e296 = in_TEXCOORD0_1;
    let _e301 = _v_buffer2_.v_cb2_[1];
    let _e307 = _v_buffer2_.v_cb2_[1];
    let _e309 = ((_e296.xy * _e301.xy) + _e307.zw);
    u_xlat0_.x = _e309.x;
    u_xlat0_.y = _e309.y;
    let _e314 = u_xlat8_;
    let _e316 = u_xlat0_;
    let _e319 = u_xlat0_;
    let _e321 = (-(_e316.xy) + _e319.yx);
    u_xlat8_.x = _e321.x;
    u_xlat8_.y = _e321.y;
    let _e326 = vs_TEXCOORD0_;
    let _e331 = _v_buffer2_.v_cb2_[2];
    let _e333 = u_xlat8_;
    let _e336 = u_xlat0_;
    let _e338 = ((_e331.zz * _e333.xy) + _e336.xy);
    vs_TEXCOORD0_.x = _e338.x;
    vs_TEXCOORD0_.y = _e338.y;
    let _e343 = in_COLOR0_1;
    let _e347 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e343 * _e347);
    let _e350 = u_xlat0_;
    let _e352 = u_xlat0_;
    u_xlat1_.x = max(_e350.y, _e352.x);
    let _e356 = u_xlat0_;
    let _e358 = u_xlat1_;
    u_xlat1_.x = max(_e356.z, _e358.x);
    let _e362 = u_xlat1_;
    u_xlat1_.x = ((_e362.x * 2f) + -1f);
    let _e370 = u_xlat1_;
    u_xlat1_.x = clamp(_e370.x, 0f, 1f);
    let _e376 = u_xlat1_;
    u_xlat1_.w = (-(_e376.x) + 1f);
    let _e381 = u_xlat1_;
    let _e383 = u_xlat0_;
    let _e385 = u_xlat0_;
    let _e387 = (_e383.xyz + _e385.xyz);
    u_xlat1_.x = _e387.x;
    u_xlat1_.y = _e387.y;
    u_xlat1_.z = _e387.z;
    let _e395 = u_xlat0_;
    let _e400 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e395.w * _e400.w);
    let _e403 = u_xlat0_;
    let _e405 = u_xlat1_;
    vs_COLOR0_ = (_e403.xxxx * _e405);
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
