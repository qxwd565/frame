struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: vec4<f32>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec2<f32> = vec2(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat6_: f32 = 0f;

    let _e38 = _v_buffer0_.v_cb0_[15];
    let _e40 = _v_buffer2_;
    u_xlat0_.x = (_e38.x * _e40.v_cb2_.z);
    let _e45 = u_xlat0_;
    u_xlat0_.x = sin(_e45.x);
    let _e49 = u_xlat0_;
    u_xlat0_.x = (_e49.x + 2f);
    let _e54 = u_xlat0_;
    let _e56 = _v_buffer2_;
    u_xlat0_.x = (_e54.x * _e56.v_cb2_.x);
    let _e61 = u_xlat0_;
    u_xlat0_.x = (_e61.x * 0.2f);
    let _e65 = u_xlat2_;
    let _e67 = in_POSITION0_1;
    let _e69 = _v_buffer2_;
    let _e72 = (_e67.xz * _e69.v_cb2_.yy);
    u_xlat2_.x = _e72.x;
    u_xlat2_.y = _e72.y;
    let _e77 = u_xlat2_;
    let _e82 = _v_buffer0_.v_cb0_[15];
    let _e88 = u_xlat2_;
    let _e90 = ((_e82.xx * vec2<f32>(30f, 42f)) + _e88.xy);
    u_xlat2_.x = _e90.x;
    u_xlat2_.y = _e90.y;
    let _e96 = u_xlat2_;
    u_xlat2_.x = sin(_e96.x);
    let _e99 = u_xlat2_;
    u_xlat4_ = cos(_e99.y);
    let _e103 = u_xlat0_;
    let _e105 = u_xlat4_;
    u_xlat0_.z = (_e103.x * _e105);
    let _e108 = u_xlat0_;
    let _e110 = u_xlat2_;
    u_xlat0_.x = (_e108.x * _e110.x);
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
    let _e353 = vs_TEXCOORD1_;
    let _e355 = u_xlat0_;
    let _e360 = _v_buffer1_.v_cb1_[3];
    let _e362 = (_e355.xyz + _e360.xyz);
    vs_TEXCOORD1_.x = _e362.x;
    vs_TEXCOORD1_.y = _e362.y;
    vs_TEXCOORD1_.z = _e362.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e32 = vs_NORMAL0_;
    let _e34 = vs_TEXCOORD0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e32, _e34, _e36, _e38);
}
