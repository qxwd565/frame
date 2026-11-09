struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(3) vs_TEXCOORDindex3_: vec4<f32>,
    @location(12) vs_NORMAL0_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_TEXCOORD2_1: vec2<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat9_: f32 = 0f;

    let _e40 = u_xlat0_;
    let _e45 = _v_buffer0_.v_cb0_[15];
    let _e50 = _v_buffer3_.v_cb3_[1];
    let _e52 = (_e45.yy * _e50.yz);
    u_xlat0_.x = _e52.x;
    u_xlat0_.y = _e52.y;
    let _e57 = u_xlat0_;
    let _e59 = u_xlat0_;
    let _e61 = sin(_e59.xy);
    u_xlat0_.x = _e61.x;
    u_xlat0_.y = _e61.y;
    let _e66 = u_xlat0_;
    let _e68 = u_xlat0_;
    let _e73 = _v_buffer3_.v_cb3_[1];
    let _e75 = (_e68.xy * _e73.xx);
    u_xlat0_.x = _e75.x;
    u_xlat0_.y = _e75.y;
    let _e80 = u_xlat3_;
    let _e82 = u_xlat0_;
    let _e84 = in_TEXCOORD2_1;
    let _e86 = (_e82.yy * _e84.xy);
    u_xlat3_.x = _e86.x;
    u_xlat3_.y = _e86.y;
    let _e91 = u_xlat0_;
    let _e93 = in_TEXCOORD1_1;
    let _e95 = u_xlat0_;
    let _e98 = u_xlat3_;
    let _e100 = ((_e93.xy * _e95.xx) + _e98.xy);
    u_xlat0_.x = _e100.x;
    u_xlat0_.y = _e100.y;
    let _e105 = u_xlat0_;
    let _e107 = u_xlat0_;
    let _e109 = in_POSITION0_1;
    let _e111 = (_e107.xy + _e109.xy);
    u_xlat0_.x = _e111.x;
    u_xlat0_.y = _e111.y;
    let _e116 = u_xlat0_;
    let _e121 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e116.yyyy * _e121);
    let _e126 = _v_buffer1_.v_cb1_[0];
    let _e127 = u_xlat0_;
    let _e130 = u_xlat1_;
    u_xlat1_ = ((_e126 * _e127.xxxx) + _e130);
    let _e135 = _v_buffer1_.v_cb1_[2];
    let _e136 = in_POSITION0_1;
    let _e139 = u_xlat1_;
    u_xlat1_ = ((_e135 * _e136.zzzz) + _e139);
    let _e141 = u_xlat1_;
    let _e145 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e141 + _e145);
    let _e147 = u_xlat1_;
    let _e152 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e147.yyyy * _e152);
    let _e157 = _v_buffer0_.v_cb0_[79];
    let _e158 = u_xlat1_;
    let _e161 = u_xlat2_;
    u_xlat2_ = ((_e157 * _e158.xxxx) + _e161);
    let _e166 = _v_buffer0_.v_cb0_[81];
    let _e167 = u_xlat1_;
    let _e170 = u_xlat2_;
    u_xlat2_ = ((_e166 * _e167.zzzz) + _e170);
    let _e176 = _v_buffer0_.v_cb0_[82];
    let _e177 = u_xlat1_;
    let _e180 = u_xlat2_;
    gl_Position = ((_e176 * _e177.wwww) + _e180);
    let _e182 = vs_TEXCOORD0_;
    let _e184 = in_TEXCOORD0_1;
    let _e189 = _v_buffer3_.v_cb3_[0];
    let _e195 = _v_buffer3_.v_cb3_[0];
    let _e197 = ((_e184.xy * _e189.xy) + _e195.zw);
    vs_TEXCOORD0_.x = _e197.x;
    vs_TEXCOORD0_.y = _e197.y;
    let _e202 = u_xlat3_;
    let _e204 = u_xlat0_;
    let _e209 = _v_buffer1_.v_cb1_[1];
    let _e211 = (_e204.yyy * _e209.xyz);
    u_xlat3_.x = _e211.x;
    u_xlat3_.y = _e211.y;
    u_xlat3_.z = _e211.z;
    let _e218 = u_xlat0_;
    let _e223 = _v_buffer1_.v_cb1_[0];
    let _e225 = u_xlat0_;
    let _e228 = u_xlat3_;
    let _e230 = ((_e223.xyz * _e225.xxx) + _e228.xyz);
    u_xlat0_.x = _e230.x;
    u_xlat0_.y = _e230.y;
    u_xlat0_.z = _e230.z;
    let _e237 = u_xlat0_;
    let _e242 = _v_buffer1_.v_cb1_[2];
    let _e244 = in_POSITION0_1;
    let _e247 = u_xlat0_;
    let _e249 = ((_e242.xyz * _e244.zzz) + _e247.xyz);
    u_xlat0_.x = _e249.x;
    u_xlat0_.y = _e249.y;
    u_xlat0_.z = _e249.z;
    let _e256 = u_xlat0_;
    let _e258 = u_xlat0_;
    let _e263 = _v_buffer1_.v_cb1_[3];
    let _e265 = (_e258.xyz + _e263.xyz);
    u_xlat0_.x = _e265.x;
    u_xlat0_.y = _e265.y;
    u_xlat0_.z = _e265.z;
    let _e272 = vs_TEXCOORD1_;
    let _e274 = u_xlat0_;
    let _e275 = _e274.xyz;
    vs_TEXCOORD1_.x = _e275.x;
    vs_TEXCOORD1_.y = _e275.y;
    vs_TEXCOORD1_.z = _e275.z;
    let _e282 = u_xlat1_;
    let _e284 = u_xlat0_;
    let _e289 = _v_buffer2_.v_cb2_[1];
    let _e291 = (_e284.yyy * _e289.xyz);
    u_xlat1_.x = _e291.x;
    u_xlat1_.y = _e291.y;
    u_xlat1_.z = _e291.z;
    let _e298 = u_xlat0_;
    let _e303 = _v_buffer2_.v_cb2_[0];
    let _e305 = u_xlat0_;
    let _e308 = u_xlat1_;
    let _e310 = ((_e303.xyz * _e305.xxx) + _e308.xyz);
    u_xlat0_.x = _e310.x;
    u_xlat0_.y = _e310.y;
    u_xlat0_.w = _e310.z;
    let _e317 = u_xlat0_;
    let _e322 = _v_buffer2_.v_cb2_[2];
    let _e324 = u_xlat0_;
    let _e327 = u_xlat0_;
    let _e329 = ((_e322.xyz * _e324.zzz) + _e327.xyw);
    u_xlat0_.x = _e329.x;
    u_xlat0_.y = _e329.y;
    u_xlat0_.z = _e329.z;
    let _e336 = vs_TEXCOORDindex3_;
    let _e338 = u_xlat0_;
    let _e343 = _v_buffer2_.v_cb2_[3];
    let _e345 = (_e338.xyz + _e343.xyz);
    vs_TEXCOORDindex3_.x = _e345.x;
    vs_TEXCOORDindex3_.y = _e345.y;
    vs_TEXCOORDindex3_.z = _e345.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e355 = in_NORMAL0_1;
    let _e360 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e355.xyz, _e360.xyz);
    let _e364 = in_NORMAL0_1;
    let _e369 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e364.xyz, _e369.xyz);
    let _e373 = in_NORMAL0_1;
    let _e378 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e373.xyz, _e378.xyz);
    let _e381 = u_xlat0_;
    let _e383 = u_xlat0_;
    u_xlat9_ = dot(_e381.xyz, _e383.xyz);
    let _e386 = u_xlat9_;
    u_xlat9_ = max(_e386, 0.000000000000000000000000000000000000011754944f);
    let _e389 = u_xlat9_;
    u_xlat9_ = inverseSqrt(_e389);
    let _e391 = vs_NORMAL0_;
    let _e393 = u_xlat9_;
    let _e395 = u_xlat0_;
    let _e397 = (vec3(_e393) * _e395.xyz);
    vs_NORMAL0_.x = _e397.x;
    vs_NORMAL0_.y = _e397.y;
    vs_NORMAL0_.z = _e397.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(6) in_TEXCOORD2_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_TEXCOORD2_1 = in_TEXCOORD2_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e41 = vs_TEXCOORD0_;
    let _e43 = vs_TEXCOORD1_;
    let _e45 = vs_TEXCOORDindex3_;
    let _e47 = vs_NORMAL0_;
    let _e49 = gl_Position;
    return VertexOutput(_e41, _e43, _e45, _e47, _e49);
}
