struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 9>,
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
    var u_xlat2_: f32 = 0f;
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
    u_xlat0_ = (_e59 + _e63);
    let _e65 = u_xlat0_;
    let _e70 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e65.yyyy * _e70);
    let _e75 = _v_buffer0_.v_cb0_[79];
    let _e76 = u_xlat0_;
    let _e79 = u_xlat1_;
    u_xlat1_ = ((_e75 * _e76.xxxx) + _e79);
    let _e84 = _v_buffer0_.v_cb0_[81];
    let _e85 = u_xlat0_;
    let _e88 = u_xlat1_;
    u_xlat1_ = ((_e84 * _e85.zzzz) + _e88);
    let _e94 = _v_buffer0_.v_cb0_[82];
    let _e95 = u_xlat0_;
    let _e98 = u_xlat1_;
    gl_Position = ((_e94 * _e95.wwww) + _e98);
    let _e100 = u_xlat0_;
    let _e102 = in_TEXCOORD0_1;
    let _e107 = _v_buffer2_.v_cb2_[4];
    let _e113 = _v_buffer2_.v_cb2_[4];
    let _e115 = ((_e102.xy * _e107.xy) + _e113.zw);
    u_xlat0_.x = _e115.x;
    u_xlat0_.y = _e115.y;
    let _e120 = u_xlat8_;
    let _e122 = u_xlat0_;
    let _e125 = u_xlat0_;
    let _e127 = (-(_e122.xy) + _e125.yx);
    u_xlat8_.x = _e127.x;
    u_xlat8_.y = _e127.y;
    let _e132 = u_xlat0_;
    let _e137 = _v_buffer2_.v_cb2_[6];
    let _e139 = u_xlat8_;
    let _e142 = u_xlat0_;
    let _e144 = ((_e137.yy * _e139.xy) + _e142.xy);
    u_xlat0_.x = _e144.x;
    u_xlat0_.y = _e144.y;
    let _e149 = u_xlat8_;
    let _e154 = _v_buffer0_.v_cb0_[15];
    let _e159 = _v_buffer2_.v_cb2_[5];
    let _e161 = (_e154.zz * _e159.xy);
    u_xlat8_.x = _e161.x;
    u_xlat8_.y = _e161.y;
    let _e166 = u_xlat8_;
    let _e168 = u_xlat8_;
    let _e170 = fract(_e168.xy);
    u_xlat8_.x = _e170.x;
    u_xlat8_.y = _e170.y;
    let _e175 = u_xlat0_;
    let _e177 = u_xlat8_;
    let _e179 = u_xlat0_;
    let _e181 = (_e177.xy + _e179.xy);
    u_xlat0_.x = _e181.x;
    u_xlat0_.y = _e181.y;
    let _e186 = u_xlat0_;
    let _e191 = _v_buffer2_.v_cb2_[4];
    let _e198 = u_xlat0_;
    let _e200 = ((-(_e191.xy) * vec2<f32>(0.5f, 0.5f)) + _e198.xy);
    u_xlat0_.x = _e200.x;
    u_xlat0_.y = _e200.y;
    let _e209 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e209.w * 0.017453289f);
    let _e217 = _v_buffer2_.v_cb2_[6];
    let _e222 = _v_buffer0_.v_cb0_[15];
    let _e225 = u_xlat8_;
    u_xlat8_.x = ((_e217.z * _e222.z) + -(_e225.x));
    let _e230 = u_xlat8_;
    u_xlat1_.x = sin(_e230.x);
    let _e233 = u_xlat8_;
    u_xlat2_ = cos(_e233.x);
    let _e237 = u_xlat1_;
    u_xlat3_.z = _e237.x;
    let _e240 = u_xlat2_;
    u_xlat3_.y = _e240;
    let _e242 = u_xlat1_;
    u_xlat3_.x = -(_e242.x);
    let _e246 = u_xlat0_;
    let _e248 = u_xlat3_;
    u_xlat8_.y = dot(_e246.xy, _e248.xy);
    let _e252 = u_xlat0_;
    let _e254 = u_xlat3_;
    u_xlat8_.x = dot(_e252.xy, _e254.yz);
    let _e257 = vs_TEXCOORD0_;
    let _e262 = _v_buffer2_.v_cb2_[4];
    let _e268 = u_xlat8_;
    let _e270 = ((_e262.xy * vec2<f32>(0.5f, 0.5f)) + _e268.xy);
    vs_TEXCOORD0_.z = _e270.x;
    vs_TEXCOORD0_.w = _e270.y;
    let _e275 = u_xlat0_;
    let _e277 = in_TEXCOORD0_1;
    let _e282 = _v_buffer2_.v_cb2_[1];
    let _e288 = _v_buffer2_.v_cb2_[1];
    let _e290 = ((_e277.xy * _e282.xy) + _e288.zw);
    u_xlat0_.x = _e290.x;
    u_xlat0_.y = _e290.y;
    let _e295 = u_xlat8_;
    let _e297 = u_xlat0_;
    let _e300 = u_xlat0_;
    let _e302 = (-(_e297.xy) + _e300.yx);
    u_xlat8_.x = _e302.x;
    u_xlat8_.y = _e302.y;
    let _e307 = vs_TEXCOORD0_;
    let _e312 = _v_buffer2_.v_cb2_[2];
    let _e314 = u_xlat8_;
    let _e317 = u_xlat0_;
    let _e319 = ((_e312.zz * _e314.xy) + _e317.xy);
    vs_TEXCOORD0_.x = _e319.x;
    vs_TEXCOORD0_.y = _e319.y;
    let _e324 = in_COLOR0_1;
    let _e328 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e324 * _e328);
    let _e331 = u_xlat0_;
    let _e333 = u_xlat0_;
    u_xlat1_.x = max(_e331.y, _e333.x);
    let _e337 = u_xlat0_;
    let _e339 = u_xlat1_;
    u_xlat1_.x = max(_e337.z, _e339.x);
    let _e343 = u_xlat1_;
    u_xlat1_.x = ((_e343.x * 2f) + -1f);
    let _e351 = u_xlat1_;
    u_xlat1_.x = clamp(_e351.x, 0f, 1f);
    let _e357 = u_xlat1_;
    u_xlat1_.w = (-(_e357.x) + 1f);
    let _e362 = u_xlat0_;
    let _e364 = u_xlat0_;
    let _e366 = u_xlat0_;
    let _e368 = (_e364.xyz + _e366.xyz);
    u_xlat0_.x = _e368.x;
    u_xlat0_.y = _e368.y;
    u_xlat0_.z = _e368.z;
    let _e375 = u_xlat1_;
    let _e377 = u_xlat0_;
    let _e382 = _v_buffer2_.v_cb2_[8];
    let _e384 = (_e377.xyz * _e382.xxx);
    u_xlat1_.x = _e384.x;
    u_xlat1_.y = _e384.y;
    u_xlat1_.z = _e384.z;
    let _e391 = u_xlat0_;
    let _e393 = u_xlat1_;
    vs_COLOR1_ = (_e391.wwww * _e393);
    let _e395 = in_COLOR0_1;
    let _e399 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e395 * _e399);
    let _e402 = u_xlat0_;
    let _e404 = u_xlat0_;
    u_xlat1_.x = max(_e402.y, _e404.x);
    let _e408 = u_xlat0_;
    let _e410 = u_xlat1_;
    u_xlat1_.x = max(_e408.z, _e410.x);
    let _e414 = u_xlat1_;
    u_xlat1_.x = ((_e414.x * 2f) + -1f);
    let _e422 = u_xlat1_;
    u_xlat1_.x = clamp(_e422.x, 0f, 1f);
    let _e428 = u_xlat1_;
    u_xlat1_.w = (-(_e428.x) + 1f);
    let _e433 = u_xlat1_;
    let _e435 = u_xlat0_;
    let _e437 = u_xlat0_;
    let _e439 = (_e435.xyz + _e437.xyz);
    u_xlat1_.x = _e439.x;
    u_xlat1_.y = _e439.y;
    u_xlat1_.z = _e439.z;
    let _e447 = u_xlat0_;
    let _e452 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e447.w * _e452.w);
    let _e455 = u_xlat0_;
    let _e457 = u_xlat1_;
    vs_COLOR0_ = (_e455.xxxx * _e457);
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
