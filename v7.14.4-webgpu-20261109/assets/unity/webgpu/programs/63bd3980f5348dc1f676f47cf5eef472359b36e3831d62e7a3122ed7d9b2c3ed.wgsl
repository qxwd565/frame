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
    var u_xlat2_: vec2<f32> = vec2(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat6_: f32 = 0f;

    let _e42 = _v_buffer0_.v_cb0_[15];
    let _e44 = _v_buffer3_;
    u_xlat0_.x = (_e42.x * _e44.v_cb3_.z);
    let _e49 = u_xlat0_;
    u_xlat0_.x = sin(_e49.x);
    let _e53 = u_xlat0_;
    u_xlat0_.x = (_e53.x + 2f);
    let _e58 = u_xlat0_;
    let _e60 = _v_buffer3_;
    u_xlat0_.x = (_e58.x * _e60.v_cb3_.x);
    let _e65 = u_xlat0_;
    u_xlat0_.x = (_e65.x * 0.2f);
    let _e69 = u_xlat2_;
    let _e71 = in_POSITION0_1;
    let _e73 = _v_buffer3_;
    let _e76 = (_e71.xz * _e73.v_cb3_.yy);
    u_xlat2_.x = _e76.x;
    u_xlat2_.y = _e76.y;
    let _e81 = u_xlat2_;
    let _e86 = _v_buffer0_.v_cb0_[15];
    let _e92 = u_xlat2_;
    let _e94 = ((_e86.xx * vec2<f32>(30f, 42f)) + _e92.xy);
    u_xlat2_.x = _e94.x;
    u_xlat2_.y = _e94.y;
    let _e100 = u_xlat2_;
    u_xlat2_.x = sin(_e100.x);
    let _e103 = u_xlat2_;
    u_xlat4_ = cos(_e103.y);
    let _e107 = u_xlat0_;
    let _e109 = u_xlat4_;
    u_xlat0_.z = (_e107.x * _e109);
    let _e112 = u_xlat0_;
    let _e114 = u_xlat2_;
    u_xlat0_.x = (_e112.x * _e114.x);
    let _e117 = u_xlat0_;
    let _e119 = u_xlat0_;
    let _e124 = (_e119.xz * vec2<f32>(0.01f, 0.02f));
    u_xlat0_.x = _e124.x;
    u_xlat0_.z = _e124.y;
    let _e129 = u_xlat0_;
    let _e131 = u_xlat0_;
    let _e133 = in_COLOR0_1;
    let _e135 = (_e131.xz * _e133.xx);
    u_xlat0_.x = _e135.x;
    u_xlat0_.z = _e135.y;
    let _e140 = u_xlat0_;
    let _e142 = u_xlat0_;
    let _e150 = in_POSITION0_1;
    let _e152 = ((_e142.xxx * vec3<f32>(-0.5f, 0f, 0.25f)) + _e150.xyz);
    u_xlat0_.x = _e152.x;
    u_xlat0_.y = _e152.y;
    u_xlat0_.w = _e152.z;
    let _e159 = u_xlat0_;
    let _e161 = u_xlat0_;
    let _e170 = u_xlat0_;
    let _e172 = ((_e161.zzz * vec3<f32>(-0.3f, 0f, -0.5f)) + _e170.xyw);
    u_xlat0_.x = _e172.x;
    u_xlat0_.y = _e172.y;
    u_xlat0_.z = _e172.z;
    let _e179 = u_xlat0_;
    let _e184 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e179.yyyy * _e184);
    let _e189 = _v_buffer1_.v_cb1_[0];
    let _e190 = u_xlat0_;
    let _e193 = u_xlat1_;
    u_xlat1_ = ((_e189 * _e190.xxxx) + _e193);
    let _e198 = _v_buffer1_.v_cb1_[2];
    let _e199 = u_xlat0_;
    let _e202 = u_xlat1_;
    u_xlat0_ = ((_e198 * _e199.zzzz) + _e202);
    let _e204 = u_xlat0_;
    let _e208 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e204 + _e208);
    let _e210 = u_xlat0_;
    let _e215 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e210.yyyy * _e215);
    let _e220 = _v_buffer0_.v_cb0_[79];
    let _e221 = u_xlat0_;
    let _e224 = u_xlat1_;
    u_xlat1_ = ((_e220 * _e221.xxxx) + _e224);
    let _e229 = _v_buffer0_.v_cb0_[81];
    let _e230 = u_xlat0_;
    let _e233 = u_xlat1_;
    u_xlat1_ = ((_e229 * _e230.zzzz) + _e233);
    let _e239 = _v_buffer0_.v_cb0_[82];
    let _e240 = u_xlat0_;
    let _e243 = u_xlat1_;
    gl_Position = ((_e239 * _e240.wwww) + _e243);
    let _e246 = in_NORMAL0_1;
    let _e251 = _v_buffer1_.v_cb1_[4];
    u_xlat0_.x = dot(_e246.xyz, _e251.xyz);
    let _e255 = in_NORMAL0_1;
    let _e260 = _v_buffer1_.v_cb1_[5];
    u_xlat0_.y = dot(_e255.xyz, _e260.xyz);
    let _e264 = in_NORMAL0_1;
    let _e269 = _v_buffer1_.v_cb1_[6];
    u_xlat0_.z = dot(_e264.xyz, _e269.xyz);
    let _e272 = u_xlat0_;
    let _e274 = u_xlat0_;
    u_xlat6_ = dot(_e272.xyz, _e274.xyz);
    let _e277 = u_xlat6_;
    u_xlat6_ = max(_e277, 0.000000000000000000000000000000000000011754944f);
    let _e280 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e280);
    let _e282 = vs_NORMAL0_;
    let _e284 = u_xlat6_;
    let _e286 = u_xlat0_;
    let _e288 = (vec3(_e284) * _e286.xyz);
    vs_NORMAL0_.x = _e288.x;
    vs_NORMAL0_.y = _e288.y;
    vs_NORMAL0_.z = _e288.z;
    let _e295 = vs_TEXCOORD0_;
    let _e297 = in_TEXCOORD0_1;
    let _e298 = _e297.xy;
    vs_TEXCOORD0_.x = _e298.x;
    vs_TEXCOORD0_.y = _e298.y;
    let _e303 = u_xlat0_;
    let _e305 = in_POSITION0_1;
    let _e310 = _v_buffer1_.v_cb1_[1];
    let _e312 = (_e305.yyy * _e310.xyz);
    u_xlat0_.x = _e312.x;
    u_xlat0_.y = _e312.y;
    u_xlat0_.z = _e312.z;
    let _e319 = u_xlat0_;
    let _e324 = _v_buffer1_.v_cb1_[0];
    let _e326 = in_POSITION0_1;
    let _e329 = u_xlat0_;
    let _e331 = ((_e324.xyz * _e326.xxx) + _e329.xyz);
    u_xlat0_.x = _e331.x;
    u_xlat0_.y = _e331.y;
    u_xlat0_.z = _e331.z;
    let _e338 = u_xlat0_;
    let _e343 = _v_buffer1_.v_cb1_[2];
    let _e345 = in_POSITION0_1;
    let _e348 = u_xlat0_;
    let _e350 = ((_e343.xyz * _e345.zzz) + _e348.xyz);
    u_xlat0_.x = _e350.x;
    u_xlat0_.y = _e350.y;
    u_xlat0_.z = _e350.z;
    let _e357 = u_xlat0_;
    let _e359 = u_xlat0_;
    let _e364 = _v_buffer1_.v_cb1_[3];
    let _e366 = (_e359.xyz + _e364.xyz);
    u_xlat0_.x = _e366.x;
    u_xlat0_.y = _e366.y;
    u_xlat0_.z = _e366.z;
    let _e373 = vs_TEXCOORD1_;
    let _e375 = u_xlat0_;
    let _e376 = _e375.xyz;
    vs_TEXCOORD1_.x = _e376.x;
    vs_TEXCOORD1_.y = _e376.y;
    vs_TEXCOORD1_.z = _e376.z;
    let _e383 = u_xlat1_;
    let _e385 = u_xlat0_;
    let _e390 = _v_buffer2_.v_cb2_[1];
    let _e392 = (_e385.yyy * _e390.xyz);
    u_xlat1_.x = _e392.x;
    u_xlat1_.y = _e392.y;
    u_xlat1_.z = _e392.z;
    let _e399 = u_xlat0_;
    let _e404 = _v_buffer2_.v_cb2_[0];
    let _e406 = u_xlat0_;
    let _e409 = u_xlat1_;
    let _e411 = ((_e404.xyz * _e406.xxx) + _e409.xyz);
    u_xlat0_.x = _e411.x;
    u_xlat0_.y = _e411.y;
    u_xlat0_.w = _e411.z;
    let _e418 = u_xlat0_;
    let _e423 = _v_buffer2_.v_cb2_[2];
    let _e425 = u_xlat0_;
    let _e428 = u_xlat0_;
    let _e430 = ((_e423.xyz * _e425.zzz) + _e428.xyw);
    u_xlat0_.x = _e430.x;
    u_xlat0_.y = _e430.y;
    u_xlat0_.z = _e430.z;
    let _e437 = vs_TEXCOORDindex3_;
    let _e439 = u_xlat0_;
    let _e444 = _v_buffer2_.v_cb2_[3];
    let _e446 = (_e439.xyz + _e444.xyz);
    vs_TEXCOORDindex3_.x = _e446.x;
    vs_TEXCOORDindex3_.y = _e446.y;
    vs_TEXCOORDindex3_.z = _e446.z;
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
