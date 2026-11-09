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
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat9_: f32 = 0f;

    let _e40 = in_POSITION0_1;
    let _e45 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e40.yyyy * _e45);
    let _e47 = u_xlat1_;
    let _e52 = _v_buffer0_.v_cb0_[15];
    let _e57 = _v_buffer3_.v_cb3_[1];
    let _e59 = (_e52.yy * _e57.yz);
    u_xlat1_.x = _e59.x;
    u_xlat1_.y = _e59.y;
    let _e64 = u_xlat1_;
    let _e66 = u_xlat1_;
    let _e68 = sin(_e66.xy);
    u_xlat1_.x = _e68.x;
    u_xlat1_.y = _e68.y;
    let _e73 = u_xlat1_;
    let _e75 = u_xlat1_;
    let _e80 = _v_buffer3_.v_cb3_[1];
    let _e82 = (_e75.xy * _e80.xx);
    u_xlat1_.x = _e82.x;
    u_xlat1_.y = _e82.y;
    let _e87 = u_xlat4_;
    let _e89 = u_xlat1_;
    let _e91 = in_TEXCOORD2_1;
    let _e93 = (_e89.yy * _e91.xy);
    u_xlat4_.x = _e93.x;
    u_xlat4_.y = _e93.y;
    let _e98 = u_xlat1_;
    let _e100 = in_TEXCOORD1_1;
    let _e102 = u_xlat1_;
    let _e105 = u_xlat4_;
    let _e107 = ((_e100.xy * _e102.xx) + _e105.xy);
    u_xlat1_.x = _e107.x;
    u_xlat1_.y = _e107.y;
    let _e112 = u_xlat1_;
    let _e114 = u_xlat1_;
    let _e116 = in_POSITION0_1;
    let _e118 = (_e114.xy + _e116.xz);
    u_xlat1_.x = _e118.x;
    u_xlat1_.y = _e118.y;
    let _e126 = _v_buffer1_.v_cb1_[0];
    let _e127 = u_xlat1_;
    let _e130 = u_xlat0_;
    u_xlat0_ = ((_e126 * _e127.xxxx) + _e130);
    let _e135 = _v_buffer1_.v_cb1_[2];
    let _e136 = u_xlat1_;
    let _e139 = u_xlat0_;
    u_xlat0_ = ((_e135 * _e136.yyyy) + _e139);
    let _e141 = u_xlat0_;
    let _e145 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e141 + _e145);
    let _e147 = u_xlat0_;
    let _e152 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e147.yyyy * _e152);
    let _e157 = _v_buffer0_.v_cb0_[79];
    let _e158 = u_xlat0_;
    let _e161 = u_xlat2_;
    u_xlat2_ = ((_e157 * _e158.xxxx) + _e161);
    let _e166 = _v_buffer0_.v_cb0_[81];
    let _e167 = u_xlat0_;
    let _e170 = u_xlat2_;
    u_xlat2_ = ((_e166 * _e167.zzzz) + _e170);
    let _e176 = _v_buffer0_.v_cb0_[82];
    let _e177 = u_xlat0_;
    let _e180 = u_xlat2_;
    gl_Position = ((_e176 * _e177.wwww) + _e180);
    let _e182 = vs_TEXCOORD0_;
    let _e184 = in_TEXCOORD0_1;
    let _e189 = _v_buffer3_.v_cb3_[0];
    let _e195 = _v_buffer3_.v_cb3_[0];
    let _e197 = ((_e184.xy * _e189.xy) + _e195.zw);
    vs_TEXCOORD0_.x = _e197.x;
    vs_TEXCOORD0_.y = _e197.y;
    let _e202 = u_xlat0_;
    let _e204 = in_POSITION0_1;
    let _e209 = _v_buffer1_.v_cb1_[1];
    let _e211 = (_e204.yyy * _e209.xyz);
    u_xlat0_.x = _e211.x;
    u_xlat0_.y = _e211.y;
    u_xlat0_.z = _e211.z;
    let _e218 = u_xlat0_;
    let _e223 = _v_buffer1_.v_cb1_[0];
    let _e225 = u_xlat1_;
    let _e228 = u_xlat0_;
    let _e230 = ((_e223.xyz * _e225.xxx) + _e228.xyz);
    u_xlat0_.x = _e230.x;
    u_xlat0_.y = _e230.y;
    u_xlat0_.z = _e230.z;
    let _e237 = u_xlat0_;
    let _e242 = _v_buffer1_.v_cb1_[2];
    let _e244 = u_xlat1_;
    let _e247 = u_xlat0_;
    let _e249 = ((_e242.xyz * _e244.yyy) + _e247.xyz);
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
