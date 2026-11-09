struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 8>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 6>,
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
    var u_xlat9_: f32 = 0f;

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
    let _e62 = _v_buffer1_.v_cb1_[3];
    let _e63 = in_POSITION0_1;
    let _e66 = u_xlat0_;
    u_xlat1_ = ((_e62 * _e63.wwww) + _e66);
    let _e68 = u_xlat0_;
    let _e70 = u_xlat0_;
    let _e75 = _v_buffer1_.v_cb1_[3];
    let _e77 = (_e70.xyz + _e75.xyz);
    u_xlat0_.x = _e77.x;
    u_xlat0_.y = _e77.y;
    u_xlat0_.z = _e77.z;
    let _e84 = u_xlat1_;
    let _e88 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e84 + -(_e88));
    let _e91 = u_xlat1_;
    let _e95 = _v_buffer3_.v_cb3_[1];
    u_xlat1_ = (_e91 * _e95);
    let _e97 = u_xlat1_;
    let _e102 = _v_buffer3_.v_cb3_[3];
    u_xlat2_ = (_e97.yyyy * _e102);
    let _e107 = _v_buffer3_.v_cb3_[2];
    let _e108 = u_xlat1_;
    let _e111 = u_xlat2_;
    u_xlat2_ = ((_e107 * _e108.xxxx) + _e111);
    let _e116 = _v_buffer3_.v_cb3_[4];
    let _e117 = u_xlat1_;
    let _e120 = u_xlat2_;
    u_xlat2_ = ((_e116 * _e117.zzzz) + _e120);
    let _e125 = _v_buffer3_.v_cb3_[5];
    let _e126 = u_xlat1_;
    let _e129 = u_xlat2_;
    u_xlat1_ = ((_e125 * _e126.wwww) + _e129);
    let _e131 = u_xlat1_;
    let _e135 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e131 + _e135);
    let _e137 = u_xlat2_;
    let _e139 = u_xlat1_;
    let _e144 = _v_buffer1_.v_cb1_[5];
    let _e146 = (_e139.yyy * _e144.xyz);
    u_xlat2_.x = _e146.x;
    u_xlat2_.y = _e146.y;
    u_xlat2_.z = _e146.z;
    let _e153 = u_xlat2_;
    let _e158 = _v_buffer1_.v_cb1_[4];
    let _e160 = u_xlat1_;
    let _e163 = u_xlat2_;
    let _e165 = ((_e158.xyz * _e160.xxx) + _e163.xyz);
    u_xlat2_.x = _e165.x;
    u_xlat2_.y = _e165.y;
    u_xlat2_.z = _e165.z;
    let _e172 = u_xlat1_;
    let _e177 = _v_buffer1_.v_cb1_[6];
    let _e179 = u_xlat1_;
    let _e182 = u_xlat2_;
    let _e184 = ((_e177.xyz * _e179.zzz) + _e182.xyz);
    u_xlat1_.x = _e184.x;
    u_xlat1_.y = _e184.y;
    u_xlat1_.z = _e184.z;
    let _e191 = u_xlat1_;
    let _e196 = _v_buffer1_.v_cb1_[7];
    let _e198 = u_xlat1_;
    let _e201 = u_xlat1_;
    let _e203 = ((_e196.xyz * _e198.www) + _e201.xyz);
    u_xlat1_.x = _e203.x;
    u_xlat1_.y = _e203.y;
    u_xlat1_.z = _e203.z;
    let _e210 = u_xlat1_;
    let _e215 = _v_buffer1_.v_cb1_[1];
    u_xlat2_ = (_e210.yyyy * _e215);
    let _e220 = _v_buffer1_.v_cb1_[0];
    let _e221 = u_xlat1_;
    let _e224 = u_xlat2_;
    u_xlat2_ = ((_e220 * _e221.xxxx) + _e224);
    let _e229 = _v_buffer1_.v_cb1_[2];
    let _e230 = u_xlat1_;
    let _e233 = u_xlat2_;
    u_xlat1_ = ((_e229 * _e230.zzzz) + _e233);
    let _e235 = u_xlat1_;
    let _e239 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e235 + _e239);
    let _e241 = u_xlat1_;
    let _e246 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e241.yyyy * _e246);
    let _e251 = _v_buffer0_.v_cb0_[79];
    let _e252 = u_xlat1_;
    let _e255 = u_xlat2_;
    u_xlat2_ = ((_e251 * _e252.xxxx) + _e255);
    let _e260 = _v_buffer0_.v_cb0_[81];
    let _e261 = u_xlat1_;
    let _e264 = u_xlat2_;
    u_xlat2_ = ((_e260 * _e261.zzzz) + _e264);
    let _e270 = _v_buffer0_.v_cb0_[82];
    let _e271 = u_xlat1_;
    let _e274 = u_xlat2_;
    gl_Position = ((_e270 * _e271.wwww) + _e274);
    let _e276 = vs_TEXCOORD0_;
    let _e278 = in_TEXCOORD0_1;
    let _e283 = _v_buffer3_.v_cb3_[0];
    let _e289 = _v_buffer3_.v_cb3_[0];
    let _e291 = ((_e278.xy * _e283.xy) + _e289.zw);
    vs_TEXCOORD0_.x = _e291.x;
    vs_TEXCOORD0_.y = _e291.y;
    let _e296 = vs_TEXCOORD1_;
    let _e298 = u_xlat0_;
    let _e299 = _e298.xyz;
    vs_TEXCOORD1_.x = _e299.x;
    vs_TEXCOORD1_.y = _e299.y;
    vs_TEXCOORD1_.z = _e299.z;
    let _e306 = u_xlat1_;
    let _e308 = u_xlat0_;
    let _e313 = _v_buffer2_.v_cb2_[1];
    let _e315 = (_e308.yyy * _e313.xyz);
    u_xlat1_.x = _e315.x;
    u_xlat1_.y = _e315.y;
    u_xlat1_.z = _e315.z;
    let _e322 = u_xlat0_;
    let _e327 = _v_buffer2_.v_cb2_[0];
    let _e329 = u_xlat0_;
    let _e332 = u_xlat1_;
    let _e334 = ((_e327.xyz * _e329.xxx) + _e332.xyz);
    u_xlat0_.x = _e334.x;
    u_xlat0_.y = _e334.y;
    u_xlat0_.w = _e334.z;
    let _e341 = u_xlat0_;
    let _e346 = _v_buffer2_.v_cb2_[2];
    let _e348 = u_xlat0_;
    let _e351 = u_xlat0_;
    let _e353 = ((_e346.xyz * _e348.zzz) + _e351.xyw);
    u_xlat0_.x = _e353.x;
    u_xlat0_.y = _e353.y;
    u_xlat0_.z = _e353.z;
    let _e360 = vs_TEXCOORDindex3_;
    let _e362 = u_xlat0_;
    let _e367 = _v_buffer2_.v_cb2_[3];
    let _e369 = (_e362.xyz + _e367.xyz);
    vs_TEXCOORDindex3_.x = _e369.x;
    vs_TEXCOORDindex3_.y = _e369.y;
    vs_TEXCOORDindex3_.z = _e369.z;
    vs_TEXCOORDindex3_.w = 0f;
    let _e379 = in_NORMAL0_1;
    let _e384 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e379.xyz, _e384.xyz);
    let _e388 = in_NORMAL0_1;
    let _e393 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e388.xyz, _e393.xyz);
    let _e397 = in_NORMAL0_1;
    let _e402 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e397.xyz, _e402.xyz);
    let _e405 = u_xlat0_;
    let _e407 = u_xlat0_;
    u_xlat9_ = dot(_e405.xyz, _e407.xyz);
    let _e410 = u_xlat9_;
    u_xlat9_ = max(_e410, 0.000000000000000000000000000000000000011754944f);
    let _e413 = u_xlat9_;
    u_xlat9_ = inverseSqrt(_e413);
    let _e415 = vs_NORMAL0_;
    let _e417 = u_xlat9_;
    let _e419 = u_xlat0_;
    let _e421 = (vec3(_e417) * _e419.xyz);
    vs_NORMAL0_.x = _e421.x;
    vs_NORMAL0_.y = _e421.y;
    vs_NORMAL0_.z = _e421.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e33 = vs_TEXCOORD0_;
    let _e35 = vs_TEXCOORD1_;
    let _e37 = vs_TEXCOORDindex3_;
    let _e39 = vs_NORMAL0_;
    let _e41 = gl_Position;
    return VertexOutput(_e33, _e35, _e37, _e39, _e41);
}
