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
    v_cb3_: vec4<f32>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(3) vs_TEXCOORDindex3_: vec4<f32>,
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat6_: f32 = 0f;

    let _e42 = _v_buffer0_.v_cb0_[15];
    let _e44 = _v_buffer3_;
    u_xlat0_.x = (_e42.x * _e44.v_cb3_.w);
    let _e48 = u_xlat0_;
    let _e50 = _v_buffer3_;
    u_xlat2_ = (_e48.x * _e50.v_cb3_.z);
    let _e54 = u_xlat2_;
    u_xlat2_ = sin(_e54);
    let _e56 = u_xlat2_;
    u_xlat2_ = (_e56 + 2f);
    let _e59 = u_xlat2_;
    let _e60 = _v_buffer3_;
    u_xlat2_ = (_e59 * _e60.v_cb3_.x);
    let _e64 = u_xlat2_;
    u_xlat2_ = (_e64 * 0.2f);
    let _e67 = u_xlat4_;
    let _e69 = in_POSITION0_1;
    let _e71 = _v_buffer3_;
    let _e74 = (_e69.xz * _e71.v_cb3_.yy);
    u_xlat4_.x = _e74.x;
    u_xlat4_.y = _e74.y;
    let _e79 = u_xlat0_;
    let _e81 = u_xlat0_;
    let _e87 = u_xlat4_;
    let _e89 = ((_e81.xx * vec2<f32>(30f, 42f)) + _e87.xy);
    u_xlat0_.x = _e89.x;
    u_xlat0_.z = _e89.y;
    let _e95 = u_xlat0_;
    u_xlat0_.x = sin(_e95.x);
    let _e99 = u_xlat0_;
    u_xlat0_.z = cos(_e99.z);
    let _e102 = u_xlat0_;
    let _e104 = u_xlat2_;
    let _e106 = u_xlat0_;
    let _e108 = (vec2(_e104) * _e106.xz);
    u_xlat0_.x = _e108.x;
    u_xlat0_.z = _e108.y;
    let _e113 = u_xlat0_;
    let _e115 = u_xlat0_;
    let _e120 = (_e115.xz * vec2<f32>(0.01f, 0.02f));
    u_xlat0_.x = _e120.x;
    u_xlat0_.z = _e120.y;
    let _e125 = u_xlat0_;
    let _e127 = u_xlat0_;
    let _e129 = in_COLOR0_1;
    let _e131 = (_e127.xz * _e129.xx);
    u_xlat0_.x = _e131.x;
    u_xlat0_.z = _e131.y;
    let _e136 = u_xlat0_;
    let _e138 = u_xlat0_;
    let _e146 = in_POSITION0_1;
    let _e148 = ((_e138.xxx * vec3<f32>(-0.5f, 0f, 0.25f)) + _e146.xyz);
    u_xlat0_.x = _e148.x;
    u_xlat0_.y = _e148.y;
    u_xlat0_.w = _e148.z;
    let _e155 = u_xlat0_;
    let _e157 = u_xlat0_;
    let _e166 = u_xlat0_;
    let _e168 = ((_e157.zzz * vec3<f32>(-0.3f, 0f, -0.5f)) + _e166.xyw);
    u_xlat0_.x = _e168.x;
    u_xlat0_.y = _e168.y;
    u_xlat0_.z = _e168.z;
    let _e175 = u_xlat0_;
    let _e180 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e175.yyyy * _e180);
    let _e185 = _v_buffer1_.v_cb1_[0];
    let _e186 = u_xlat0_;
    let _e189 = u_xlat1_;
    u_xlat1_ = ((_e185 * _e186.xxxx) + _e189);
    let _e194 = _v_buffer1_.v_cb1_[2];
    let _e195 = u_xlat0_;
    let _e198 = u_xlat1_;
    u_xlat0_ = ((_e194 * _e195.zzzz) + _e198);
    let _e200 = u_xlat0_;
    let _e204 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e200 + _e204);
    let _e206 = u_xlat0_;
    let _e211 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e206.yyyy * _e211);
    let _e216 = _v_buffer0_.v_cb0_[79];
    let _e217 = u_xlat0_;
    let _e220 = u_xlat1_;
    u_xlat1_ = ((_e216 * _e217.xxxx) + _e220);
    let _e225 = _v_buffer0_.v_cb0_[81];
    let _e226 = u_xlat0_;
    let _e229 = u_xlat1_;
    u_xlat1_ = ((_e225 * _e226.zzzz) + _e229);
    let _e235 = _v_buffer0_.v_cb0_[82];
    let _e236 = u_xlat0_;
    let _e239 = u_xlat1_;
    gl_Position = ((_e235 * _e236.wwww) + _e239);
    let _e242 = in_NORMAL0_1;
    let _e247 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e242.xyz, _e247.xyz);
    let _e251 = in_NORMAL0_1;
    let _e256 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e251.xyz, _e256.xyz);
    let _e260 = in_NORMAL0_1;
    let _e265 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e260.xyz, _e265.xyz);
    let _e268 = u_xlat0_;
    let _e270 = u_xlat0_;
    u_xlat6_ = dot(_e268.xyz, _e270.xyz);
    let _e273 = u_xlat6_;
    u_xlat6_ = max(_e273, 0.000000000000000000000000000000000000011754944f);
    let _e276 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e276);
    let _e278 = vs_NORMAL0_;
    let _e280 = u_xlat6_;
    let _e282 = u_xlat0_;
    let _e284 = (vec3(_e280) * _e282.xyz);
    vs_NORMAL0_.x = _e284.x;
    vs_NORMAL0_.y = _e284.y;
    vs_NORMAL0_.z = _e284.z;
    let _e291 = vs_TEXCOORD0_;
    let _e293 = in_TEXCOORD0_1;
    let _e294 = _e293.xy;
    vs_TEXCOORD0_.x = _e294.x;
    vs_TEXCOORD0_.y = _e294.y;
    let _e299 = u_xlat0_;
    let _e301 = in_POSITION0_1;
    let _e306 = _v_buffer1_.v_cb1_[1];
    let _e308 = (_e301.yyy * _e306.xyz);
    u_xlat0_.x = _e308.x;
    u_xlat0_.y = _e308.y;
    u_xlat0_.z = _e308.z;
    let _e315 = u_xlat0_;
    let _e320 = _v_buffer1_.v_cb1_[0];
    let _e322 = in_POSITION0_1;
    let _e325 = u_xlat0_;
    let _e327 = ((_e320.xyz * _e322.xxx) + _e325.xyz);
    u_xlat0_.x = _e327.x;
    u_xlat0_.y = _e327.y;
    u_xlat0_.z = _e327.z;
    let _e334 = u_xlat0_;
    let _e339 = _v_buffer1_.v_cb1_[2];
    let _e341 = in_POSITION0_1;
    let _e344 = u_xlat0_;
    let _e346 = ((_e339.xyz * _e341.zzz) + _e344.xyz);
    u_xlat0_.x = _e346.x;
    u_xlat0_.y = _e346.y;
    u_xlat0_.z = _e346.z;
    let _e353 = u_xlat0_;
    let _e355 = u_xlat0_;
    let _e360 = _v_buffer1_.v_cb1_[3];
    let _e362 = (_e355.xyz + _e360.xyz);
    u_xlat0_.x = _e362.x;
    u_xlat0_.y = _e362.y;
    u_xlat0_.z = _e362.z;
    let _e369 = vs_TEXCOORD1_;
    let _e371 = u_xlat0_;
    let _e372 = _e371.xyz;
    vs_TEXCOORD1_.x = _e372.x;
    vs_TEXCOORD1_.y = _e372.y;
    vs_TEXCOORD1_.z = _e372.z;
    let _e379 = u_xlat1_;
    let _e381 = u_xlat0_;
    let _e386 = _v_buffer2_.v_cb2_[1];
    let _e388 = (_e381.yyy * _e386.xyz);
    u_xlat1_.x = _e388.x;
    u_xlat1_.y = _e388.y;
    u_xlat1_.z = _e388.z;
    let _e395 = u_xlat0_;
    let _e400 = _v_buffer2_.v_cb2_[0];
    let _e402 = u_xlat0_;
    let _e405 = u_xlat1_;
    let _e407 = ((_e400.xyz * _e402.xxx) + _e405.xyz);
    u_xlat0_.x = _e407.x;
    u_xlat0_.y = _e407.y;
    u_xlat0_.w = _e407.z;
    let _e414 = u_xlat0_;
    let _e419 = _v_buffer2_.v_cb2_[2];
    let _e421 = u_xlat0_;
    let _e424 = u_xlat0_;
    let _e426 = ((_e419.xyz * _e421.zzz) + _e424.xyw);
    u_xlat0_.x = _e426.x;
    u_xlat0_.y = _e426.y;
    u_xlat0_.z = _e426.z;
    let _e433 = vs_TEXCOORDindex3_;
    let _e435 = u_xlat0_;
    let _e440 = _v_buffer2_.v_cb2_[3];
    let _e442 = (_e435.xyz + _e440.xyz);
    vs_TEXCOORDindex3_.x = _e442.x;
    vs_TEXCOORDindex3_.y = _e442.y;
    vs_TEXCOORDindex3_.z = _e442.z;
    vs_TEXCOORDindex3_.w = 0f;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e37 = vs_NORMAL0_;
    let _e39 = vs_TEXCOORD0_;
    let _e41 = vs_TEXCOORD1_;
    let _e43 = vs_TEXCOORDindex3_;
    let _e45 = gl_Position;
    return VertexOutput(_e37, _e39, _e41, _e43, _e45);
}
