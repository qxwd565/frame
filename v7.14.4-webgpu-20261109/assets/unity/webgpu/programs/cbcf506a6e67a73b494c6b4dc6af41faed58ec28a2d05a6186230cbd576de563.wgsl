struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 12>,
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
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e33 = in_POSITION0_1;
    let _e38 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e33.yyyy * _e38);
    let _e43 = _v_buffer1_.v_cb1_[0];
    let _e44 = in_POSITION0_1;
    let _e47 = u_xlat0_;
    u_xlat0_ = ((_e43 * _e44.xxxx) + _e47);
    let _e52 = _v_buffer1_.v_cb1_[2];
    let _e53 = in_POSITION0_1;
    let _e56 = u_xlat0_;
    u_xlat0_ = ((_e52 * _e53.zzzz) + _e56);
    let _e58 = u_xlat0_;
    let _e62 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e58 + _e62);
    let _e64 = u_xlat0_;
    let _e69 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e64.yyyy * _e69);
    let _e74 = _v_buffer0_.v_cb0_[79];
    let _e75 = u_xlat0_;
    let _e78 = u_xlat1_;
    u_xlat1_ = ((_e74 * _e75.xxxx) + _e78);
    let _e83 = _v_buffer0_.v_cb0_[81];
    let _e84 = u_xlat0_;
    let _e87 = u_xlat1_;
    u_xlat1_ = ((_e83 * _e84.zzzz) + _e87);
    let _e93 = _v_buffer0_.v_cb0_[82];
    let _e94 = u_xlat0_;
    let _e97 = u_xlat1_;
    gl_Position = ((_e93 * _e94.wwww) + _e97);
    let _e99 = u_xlat0_;
    let _e101 = in_TEXCOORD0_1;
    let _e106 = _v_buffer2_.v_cb2_[4];
    let _e112 = _v_buffer2_.v_cb2_[4];
    let _e114 = ((_e101.xy * _e106.xy) + _e112.zw);
    u_xlat0_.x = _e114.x;
    u_xlat0_.y = _e114.y;
    let _e119 = u_xlat8_;
    let _e121 = u_xlat0_;
    let _e124 = u_xlat0_;
    let _e126 = (-(_e121.xy) + _e124.yx);
    u_xlat8_.x = _e126.x;
    u_xlat8_.y = _e126.y;
    let _e131 = u_xlat0_;
    let _e136 = _v_buffer2_.v_cb2_[6];
    let _e138 = u_xlat8_;
    let _e141 = u_xlat0_;
    let _e143 = ((_e136.yy * _e138.xy) + _e141.xy);
    u_xlat0_.x = _e143.x;
    u_xlat0_.y = _e143.y;
    let _e148 = u_xlat8_;
    let _e153 = _v_buffer0_.v_cb0_[15];
    let _e158 = _v_buffer2_.v_cb2_[5];
    let _e160 = (_e153.zz * _e158.xy);
    u_xlat8_.x = _e160.x;
    u_xlat8_.y = _e160.y;
    let _e165 = u_xlat8_;
    let _e167 = u_xlat8_;
    let _e169 = fract(_e167.xy);
    u_xlat8_.x = _e169.x;
    u_xlat8_.y = _e169.y;
    let _e174 = u_xlat0_;
    let _e176 = u_xlat8_;
    let _e178 = u_xlat0_;
    let _e180 = (_e176.xy + _e178.xy);
    u_xlat0_.x = _e180.x;
    u_xlat0_.y = _e180.y;
    let _e185 = u_xlat0_;
    let _e190 = _v_buffer2_.v_cb2_[4];
    let _e197 = u_xlat0_;
    let _e199 = ((-(_e190.xy) * vec2<f32>(0.5f, 0.5f)) + _e197.xy);
    u_xlat0_.x = _e199.x;
    u_xlat0_.y = _e199.y;
    let _e208 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e208.w * 0.017453289f);
    let _e216 = _v_buffer2_.v_cb2_[6];
    let _e221 = _v_buffer0_.v_cb0_[15];
    let _e224 = u_xlat8_;
    u_xlat8_.x = ((_e216.z * _e221.z) + -(_e224.x));
    let _e229 = u_xlat8_;
    u_xlat1_.x = sin(_e229.x);
    let _e232 = u_xlat8_;
    u_xlat2_ = cos(_e232.x);
    let _e236 = u_xlat1_;
    u_xlat3_.z = _e236.x;
    let _e239 = u_xlat2_;
    u_xlat3_.y = _e239;
    let _e241 = u_xlat1_;
    u_xlat3_.x = -(_e241.x);
    let _e245 = u_xlat0_;
    let _e247 = u_xlat3_;
    u_xlat8_.y = dot(_e245.xy, _e247.xy);
    let _e251 = u_xlat0_;
    let _e253 = u_xlat3_;
    u_xlat8_.x = dot(_e251.xy, _e253.yz);
    let _e256 = vs_TEXCOORD0_;
    let _e261 = _v_buffer2_.v_cb2_[4];
    let _e267 = u_xlat8_;
    let _e269 = ((_e261.xy * vec2<f32>(0.5f, 0.5f)) + _e267.xy);
    vs_TEXCOORD0_.z = _e269.x;
    vs_TEXCOORD0_.w = _e269.y;
    let _e274 = u_xlat0_;
    let _e276 = in_TEXCOORD0_1;
    let _e281 = _v_buffer2_.v_cb2_[1];
    let _e287 = _v_buffer2_.v_cb2_[1];
    let _e289 = ((_e276.xy * _e281.xy) + _e287.zw);
    u_xlat0_.x = _e289.x;
    u_xlat0_.y = _e289.y;
    let _e294 = u_xlat8_;
    let _e296 = u_xlat0_;
    let _e299 = u_xlat0_;
    let _e301 = (-(_e296.xy) + _e299.yx);
    u_xlat8_.x = _e301.x;
    u_xlat8_.y = _e301.y;
    let _e306 = u_xlat0_;
    let _e311 = _v_buffer2_.v_cb2_[2];
    let _e313 = u_xlat8_;
    let _e316 = u_xlat0_;
    let _e318 = ((_e311.zz * _e313.xy) + _e316.xy);
    u_xlat0_.x = _e318.x;
    u_xlat0_.y = _e318.y;
    let _e323 = u_xlat8_;
    let _e328 = _v_buffer0_.v_cb0_[15];
    let _e333 = _v_buffer2_.v_cb2_[11];
    let _e335 = (_e328.zz * _e333.yz);
    u_xlat8_.x = _e335.x;
    u_xlat8_.y = _e335.y;
    let _e340 = u_xlat8_;
    let _e342 = u_xlat8_;
    let _e344 = fract(_e342.xy);
    u_xlat8_.x = _e344.x;
    u_xlat8_.y = _e344.y;
    let _e349 = vs_TEXCOORD0_;
    let _e351 = u_xlat8_;
    let _e353 = u_xlat0_;
    let _e355 = (_e351.xy + _e353.xy);
    vs_TEXCOORD0_.x = _e355.x;
    vs_TEXCOORD0_.y = _e355.y;
    let _e360 = in_COLOR0_1;
    let _e364 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e360 * _e364);
    let _e367 = u_xlat0_;
    let _e369 = u_xlat0_;
    u_xlat1_.x = max(_e367.y, _e369.x);
    let _e373 = u_xlat0_;
    let _e375 = u_xlat1_;
    u_xlat1_.x = max(_e373.z, _e375.x);
    let _e379 = u_xlat1_;
    u_xlat1_.x = ((_e379.x * 2f) + -1f);
    let _e387 = u_xlat1_;
    u_xlat1_.x = clamp(_e387.x, 0f, 1f);
    let _e393 = u_xlat1_;
    u_xlat1_.w = (-(_e393.x) + 1f);
    let _e398 = u_xlat1_;
    let _e400 = u_xlat0_;
    let _e402 = u_xlat0_;
    let _e404 = (_e400.xyz + _e402.xyz);
    u_xlat1_.x = _e404.x;
    u_xlat1_.y = _e404.y;
    u_xlat1_.z = _e404.z;
    let _e412 = u_xlat0_;
    let _e417 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e412.w * _e417.w);
    let _e420 = u_xlat0_;
    let _e422 = u_xlat1_;
    vs_COLOR0_ = (_e420.xxxx * _e422);
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
