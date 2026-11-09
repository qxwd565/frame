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
    @location(11) vs_COLOR1_: vec4<f32>,
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
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e35 = in_POSITION0_1;
    let _e40 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e35.yyyy * _e40);
    let _e45 = _v_buffer1_.v_cb1_[0];
    let _e46 = in_POSITION0_1;
    let _e49 = u_xlat0_;
    u_xlat0_ = ((_e45 * _e46.xxxx) + _e49);
    let _e54 = _v_buffer1_.v_cb1_[2];
    let _e55 = in_POSITION0_1;
    let _e58 = u_xlat0_;
    u_xlat0_ = ((_e54 * _e55.zzzz) + _e58);
    let _e60 = u_xlat0_;
    let _e64 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e60 + _e64);
    let _e66 = u_xlat0_;
    let _e71 = _v_buffer1_.v_cb1_[3];
    let _e73 = in_POSITION0_1;
    let _e76 = u_xlat0_;
    let _e78 = ((_e71.xz * _e73.ww) + _e76.xz);
    u_xlat0_.x = _e78.x;
    u_xlat0_.y = _e78.y;
    let _e83 = u_xlat0_;
    let _e85 = u_xlat0_;
    let _e90 = _v_buffer2_.v_cb2_[4];
    let _e96 = _v_buffer2_.v_cb2_[4];
    let _e98 = ((_e85.xy * _e90.xy) + _e96.zw);
    u_xlat0_.x = _e98.x;
    u_xlat0_.y = _e98.y;
    let _e103 = u_xlat1_;
    let _e108 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e103.yyyy * _e108);
    let _e113 = _v_buffer0_.v_cb0_[79];
    let _e114 = u_xlat1_;
    let _e117 = u_xlat2_;
    u_xlat2_ = ((_e113 * _e114.xxxx) + _e117);
    let _e122 = _v_buffer0_.v_cb0_[81];
    let _e123 = u_xlat1_;
    let _e126 = u_xlat2_;
    u_xlat2_ = ((_e122 * _e123.zzzz) + _e126);
    let _e132 = _v_buffer0_.v_cb0_[82];
    let _e133 = u_xlat1_;
    let _e136 = u_xlat2_;
    gl_Position = ((_e132 * _e133.wwww) + _e136);
    let _e138 = u_xlat8_;
    let _e140 = u_xlat0_;
    let _e143 = u_xlat0_;
    let _e145 = (-(_e140.xy) + _e143.yx);
    u_xlat8_.x = _e145.x;
    u_xlat8_.y = _e145.y;
    let _e150 = u_xlat0_;
    let _e155 = _v_buffer2_.v_cb2_[6];
    let _e157 = u_xlat8_;
    let _e160 = u_xlat0_;
    let _e162 = ((_e155.yy * _e157.xy) + _e160.xy);
    u_xlat0_.x = _e162.x;
    u_xlat0_.y = _e162.y;
    let _e167 = u_xlat8_;
    let _e172 = _v_buffer0_.v_cb0_[15];
    let _e177 = _v_buffer2_.v_cb2_[5];
    let _e179 = (_e172.zz * _e177.xy);
    u_xlat8_.x = _e179.x;
    u_xlat8_.y = _e179.y;
    let _e184 = u_xlat8_;
    let _e186 = u_xlat8_;
    let _e188 = fract(_e186.xy);
    u_xlat8_.x = _e188.x;
    u_xlat8_.y = _e188.y;
    let _e193 = u_xlat0_;
    let _e195 = u_xlat8_;
    let _e197 = u_xlat0_;
    let _e199 = (_e195.xy + _e197.xy);
    u_xlat0_.x = _e199.x;
    u_xlat0_.y = _e199.y;
    let _e204 = u_xlat0_;
    let _e209 = _v_buffer2_.v_cb2_[4];
    let _e216 = u_xlat0_;
    let _e218 = ((-(_e209.xy) * vec2<f32>(0.5f, 0.5f)) + _e216.xy);
    u_xlat0_.x = _e218.x;
    u_xlat0_.y = _e218.y;
    let _e227 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e227.w * 0.017453289f);
    let _e235 = _v_buffer2_.v_cb2_[6];
    let _e240 = _v_buffer0_.v_cb0_[15];
    let _e243 = u_xlat8_;
    u_xlat8_.x = ((_e235.z * _e240.z) + -(_e243.x));
    let _e248 = u_xlat8_;
    u_xlat1_.x = sin(_e248.x);
    let _e252 = u_xlat8_;
    u_xlat2_.x = cos(_e252.x);
    let _e256 = u_xlat1_;
    u_xlat3_.z = _e256.x;
    let _e259 = u_xlat2_;
    u_xlat3_.y = _e259.x;
    let _e262 = u_xlat1_;
    u_xlat3_.x = -(_e262.x);
    let _e266 = u_xlat0_;
    let _e268 = u_xlat3_;
    u_xlat8_.y = dot(_e266.xy, _e268.xy);
    let _e272 = u_xlat0_;
    let _e274 = u_xlat3_;
    u_xlat8_.x = dot(_e272.xy, _e274.yz);
    let _e277 = vs_TEXCOORD0_;
    let _e282 = _v_buffer2_.v_cb2_[4];
    let _e288 = u_xlat8_;
    let _e290 = ((_e282.xy * vec2<f32>(0.5f, 0.5f)) + _e288.xy);
    vs_TEXCOORD0_.z = _e290.x;
    vs_TEXCOORD0_.w = _e290.y;
    let _e295 = u_xlat0_;
    let _e297 = in_TEXCOORD0_1;
    let _e302 = _v_buffer2_.v_cb2_[1];
    let _e308 = _v_buffer2_.v_cb2_[1];
    let _e310 = ((_e297.xy * _e302.xy) + _e308.zw);
    u_xlat0_.x = _e310.x;
    u_xlat0_.y = _e310.y;
    let _e315 = u_xlat8_;
    let _e317 = u_xlat0_;
    let _e320 = u_xlat0_;
    let _e322 = (-(_e317.xy) + _e320.yx);
    u_xlat8_.x = _e322.x;
    u_xlat8_.y = _e322.y;
    let _e327 = u_xlat0_;
    let _e332 = _v_buffer2_.v_cb2_[2];
    let _e334 = u_xlat8_;
    let _e337 = u_xlat0_;
    let _e339 = ((_e332.zz * _e334.xy) + _e337.xy);
    u_xlat0_.x = _e339.x;
    u_xlat0_.y = _e339.y;
    let _e344 = u_xlat8_;
    let _e349 = _v_buffer0_.v_cb0_[15];
    let _e354 = _v_buffer2_.v_cb2_[11];
    let _e356 = (_e349.zz * _e354.yz);
    u_xlat8_.x = _e356.x;
    u_xlat8_.y = _e356.y;
    let _e361 = u_xlat8_;
    let _e363 = u_xlat8_;
    let _e365 = fract(_e363.xy);
    u_xlat8_.x = _e365.x;
    u_xlat8_.y = _e365.y;
    let _e370 = vs_TEXCOORD0_;
    let _e372 = u_xlat8_;
    let _e374 = u_xlat0_;
    let _e376 = (_e372.xy + _e374.xy);
    vs_TEXCOORD0_.x = _e376.x;
    vs_TEXCOORD0_.y = _e376.y;
    let _e381 = in_COLOR0_1;
    let _e385 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e381 * _e385);
    let _e388 = u_xlat0_;
    let _e390 = u_xlat0_;
    u_xlat1_.x = max(_e388.y, _e390.x);
    let _e394 = u_xlat0_;
    let _e396 = u_xlat1_;
    u_xlat1_.x = max(_e394.z, _e396.x);
    let _e400 = u_xlat1_;
    u_xlat1_.x = ((_e400.x * 2f) + -1f);
    let _e408 = u_xlat1_;
    u_xlat1_.x = clamp(_e408.x, 0f, 1f);
    let _e414 = u_xlat1_;
    u_xlat1_.w = (-(_e414.x) + 1f);
    let _e419 = u_xlat0_;
    let _e421 = u_xlat0_;
    let _e423 = u_xlat0_;
    let _e425 = (_e421.xyz + _e423.xyz);
    u_xlat0_.x = _e425.x;
    u_xlat0_.y = _e425.y;
    u_xlat0_.z = _e425.z;
    let _e432 = u_xlat1_;
    let _e434 = u_xlat0_;
    let _e439 = _v_buffer2_.v_cb2_[8];
    let _e441 = (_e434.xyz * _e439.xxx);
    u_xlat1_.x = _e441.x;
    u_xlat1_.y = _e441.y;
    u_xlat1_.z = _e441.z;
    let _e448 = u_xlat0_;
    let _e450 = u_xlat1_;
    vs_COLOR1_ = (_e448.wwww * _e450);
    let _e452 = in_COLOR0_1;
    let _e456 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e452 * _e456);
    let _e459 = u_xlat0_;
    let _e461 = u_xlat0_;
    u_xlat1_.x = max(_e459.y, _e461.x);
    let _e465 = u_xlat0_;
    let _e467 = u_xlat1_;
    u_xlat1_.x = max(_e465.z, _e467.x);
    let _e471 = u_xlat1_;
    u_xlat1_.x = ((_e471.x * 2f) + -1f);
    let _e479 = u_xlat1_;
    u_xlat1_.x = clamp(_e479.x, 0f, 1f);
    let _e485 = u_xlat1_;
    u_xlat1_.w = (-(_e485.x) + 1f);
    let _e490 = u_xlat1_;
    let _e492 = u_xlat0_;
    let _e494 = u_xlat0_;
    let _e496 = (_e492.xyz + _e494.xyz);
    u_xlat1_.x = _e496.x;
    u_xlat1_.y = _e496.y;
    u_xlat1_.z = _e496.z;
    let _e504 = u_xlat0_;
    let _e509 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e504.w * _e509.w);
    let _e512 = u_xlat0_;
    let _e514 = u_xlat1_;
    vs_COLOR0_ = (_e512.xxxx * _e514);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_COLOR1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
