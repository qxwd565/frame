struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 14>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(11) vs_COLOR1_: vec4<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: f32,
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
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: f32 = 0f;
    var u_xlat8_: vec2<f32> = vec2(0f);

    let _e38 = in_POSITION0_1;
    let _e43 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e38.yyyy * _e43);
    let _e48 = _v_buffer1_.v_cb1_[0];
    let _e49 = in_POSITION0_1;
    let _e52 = u_xlat0_;
    u_xlat0_ = ((_e48 * _e49.xxxx) + _e52);
    let _e57 = _v_buffer1_.v_cb1_[2];
    let _e58 = in_POSITION0_1;
    let _e61 = u_xlat0_;
    u_xlat0_ = ((_e57 * _e58.zzzz) + _e61);
    let _e63 = u_xlat0_;
    let _e67 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e63 + _e67);
    let _e69 = u_xlat0_;
    let _e74 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e69.yyyy * _e74);
    let _e79 = _v_buffer0_.v_cb0_[79];
    let _e80 = u_xlat0_;
    let _e83 = u_xlat1_;
    u_xlat1_ = ((_e79 * _e80.xxxx) + _e83);
    let _e88 = _v_buffer0_.v_cb0_[81];
    let _e89 = u_xlat0_;
    let _e92 = u_xlat1_;
    u_xlat1_ = ((_e88 * _e89.zzzz) + _e92);
    let _e98 = _v_buffer0_.v_cb0_[82];
    let _e99 = u_xlat0_;
    let _e102 = u_xlat1_;
    gl_Position = ((_e98 * _e99.wwww) + _e102);
    let _e104 = u_xlat0_;
    let _e106 = in_TEXCOORD0_1;
    let _e111 = _v_buffer2_.v_cb2_[4];
    let _e117 = _v_buffer2_.v_cb2_[4];
    let _e119 = ((_e106.xy * _e111.xy) + _e117.zw);
    u_xlat0_.x = _e119.x;
    u_xlat0_.y = _e119.y;
    let _e124 = u_xlat8_;
    let _e126 = u_xlat0_;
    let _e129 = u_xlat0_;
    let _e131 = (-(_e126.xy) + _e129.yx);
    u_xlat8_.x = _e131.x;
    u_xlat8_.y = _e131.y;
    let _e136 = u_xlat0_;
    let _e141 = _v_buffer2_.v_cb2_[6];
    let _e143 = u_xlat8_;
    let _e146 = u_xlat0_;
    let _e148 = ((_e141.yy * _e143.xy) + _e146.xy);
    u_xlat0_.x = _e148.x;
    u_xlat0_.y = _e148.y;
    let _e153 = u_xlat8_;
    let _e158 = _v_buffer0_.v_cb0_[15];
    let _e163 = _v_buffer2_.v_cb2_[5];
    let _e165 = (_e158.zz * _e163.xy);
    u_xlat8_.x = _e165.x;
    u_xlat8_.y = _e165.y;
    let _e170 = u_xlat8_;
    let _e172 = u_xlat8_;
    let _e174 = fract(_e172.xy);
    u_xlat8_.x = _e174.x;
    u_xlat8_.y = _e174.y;
    let _e179 = u_xlat0_;
    let _e181 = u_xlat8_;
    let _e183 = u_xlat0_;
    let _e185 = (_e181.xy + _e183.xy);
    u_xlat0_.x = _e185.x;
    u_xlat0_.y = _e185.y;
    let _e190 = u_xlat0_;
    let _e195 = _v_buffer2_.v_cb2_[4];
    let _e202 = u_xlat0_;
    let _e204 = ((-(_e195.xy) * vec2<f32>(0.5f, 0.5f)) + _e202.xy);
    u_xlat0_.x = _e204.x;
    u_xlat0_.y = _e204.y;
    let _e213 = _v_buffer2_.v_cb2_[6];
    u_xlat8_.x = (_e213.w * 0.017453289f);
    let _e221 = _v_buffer2_.v_cb2_[6];
    let _e226 = _v_buffer0_.v_cb0_[15];
    let _e229 = u_xlat8_;
    u_xlat8_.x = ((_e221.z * _e226.z) + -(_e229.x));
    let _e234 = u_xlat8_;
    u_xlat1_.x = sin(_e234.x);
    let _e237 = u_xlat8_;
    u_xlat2_ = cos(_e237.x);
    let _e241 = u_xlat1_;
    u_xlat3_.z = _e241.x;
    let _e244 = u_xlat2_;
    u_xlat3_.y = _e244;
    let _e246 = u_xlat1_;
    u_xlat3_.x = -(_e246.x);
    let _e250 = u_xlat0_;
    let _e252 = u_xlat3_;
    u_xlat8_.y = dot(_e250.xy, _e252.xy);
    let _e256 = u_xlat0_;
    let _e258 = u_xlat3_;
    u_xlat8_.x = dot(_e256.xy, _e258.yz);
    let _e261 = vs_TEXCOORD0_;
    let _e266 = _v_buffer2_.v_cb2_[4];
    let _e272 = u_xlat8_;
    let _e274 = ((_e266.xy * vec2<f32>(0.5f, 0.5f)) + _e272.xy);
    vs_TEXCOORD0_.z = _e274.x;
    vs_TEXCOORD0_.w = _e274.y;
    let _e279 = u_xlat0_;
    let _e281 = in_TEXCOORD0_1;
    let _e286 = _v_buffer2_.v_cb2_[1];
    let _e292 = _v_buffer2_.v_cb2_[1];
    let _e294 = ((_e281.xy * _e286.xy) + _e292.zw);
    u_xlat0_.x = _e294.x;
    u_xlat0_.y = _e294.y;
    let _e299 = u_xlat8_;
    let _e301 = u_xlat0_;
    let _e304 = u_xlat0_;
    let _e306 = (-(_e301.xy) + _e304.yx);
    u_xlat8_.x = _e306.x;
    u_xlat8_.y = _e306.y;
    let _e311 = u_xlat0_;
    let _e316 = _v_buffer2_.v_cb2_[2];
    let _e318 = u_xlat8_;
    let _e321 = u_xlat0_;
    let _e323 = ((_e316.zz * _e318.xy) + _e321.xy);
    u_xlat0_.x = _e323.x;
    u_xlat0_.y = _e323.y;
    let _e328 = u_xlat8_;
    let _e333 = _v_buffer0_.v_cb0_[15];
    let _e338 = _v_buffer2_.v_cb2_[11];
    let _e340 = (_e333.zz * _e338.yz);
    u_xlat8_.x = _e340.x;
    u_xlat8_.y = _e340.y;
    let _e345 = u_xlat8_;
    let _e347 = u_xlat8_;
    let _e349 = fract(_e347.xy);
    u_xlat8_.x = _e349.x;
    u_xlat8_.y = _e349.y;
    let _e354 = vs_TEXCOORD0_;
    let _e356 = u_xlat8_;
    let _e358 = u_xlat0_;
    let _e360 = (_e356.xy + _e358.xy);
    vs_TEXCOORD0_.x = _e360.x;
    vs_TEXCOORD0_.y = _e360.y;
    let _e366 = in_COLOR0_1;
    let _e371 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e366.w, _e371.x);
    let _e374 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e383 = u_xlat0_;
    let _e385 = in_COLOR0_1;
    let _e386 = _e385.xyz;
    u_xlat0_.x = _e386.x;
    u_xlat0_.y = _e386.y;
    u_xlat0_.z = _e386.z;
    u_xlat0_.w = 1f;
    let _e395 = u_xlat0_;
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
    let _e460 = in_COLOR0_1;
    u_xlat0_.x = (-(_e460.w) + 1f);
    let _e466 = u_xlat0_;
    let _e471 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e466.x + -(_e471.w));
    let _e478 = _v_buffer2_.v_cb2_[12];
    u_xlat4_ = (_e478.y * 1.01f);
    let _e483 = u_xlat4_;
    let _e484 = u_xlat0_;
    u_xlat0_.x = max(_e483, _e484.x);
    let _e490 = _v_buffer2_.v_cb2_[12];
    u_xlat4_ = ((_e490.z * 2f) + 1f);
    let _e496 = u_xlat0_;
    let _e498 = u_xlat4_;
    let _e503 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e496.x * _e498) + -(_e503.z));
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR1_;
    let _e34 = vs_COLOR0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
