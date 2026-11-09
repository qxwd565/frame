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
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat6_: vec2<f32> = vec2(0f);

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
    let _e138 = u_xlat6_;
    let _e140 = u_xlat0_;
    let _e143 = u_xlat0_;
    let _e145 = (-(_e140.xy) + _e143.yx);
    u_xlat6_.x = _e145.x;
    u_xlat6_.y = _e145.y;
    let _e150 = u_xlat0_;
    let _e155 = _v_buffer2_.v_cb2_[6];
    let _e157 = u_xlat6_;
    let _e160 = u_xlat0_;
    let _e162 = ((_e155.yy * _e157.xy) + _e160.xy);
    u_xlat0_.x = _e162.x;
    u_xlat0_.y = _e162.y;
    let _e167 = u_xlat6_;
    let _e172 = _v_buffer0_.v_cb0_[15];
    let _e177 = _v_buffer2_.v_cb2_[5];
    let _e179 = (_e172.zz * _e177.xy);
    u_xlat6_.x = _e179.x;
    u_xlat6_.y = _e179.y;
    let _e184 = u_xlat6_;
    let _e186 = u_xlat6_;
    let _e188 = fract(_e186.xy);
    u_xlat6_.x = _e188.x;
    u_xlat6_.y = _e188.y;
    let _e193 = vs_TEXCOORD0_;
    let _e195 = u_xlat6_;
    let _e197 = u_xlat0_;
    let _e199 = (_e195.xy + _e197.xy);
    vs_TEXCOORD0_.z = _e199.x;
    vs_TEXCOORD0_.w = _e199.y;
    let _e204 = u_xlat0_;
    let _e206 = in_TEXCOORD0_1;
    let _e211 = _v_buffer2_.v_cb2_[1];
    let _e217 = _v_buffer2_.v_cb2_[1];
    let _e219 = ((_e206.xy * _e211.xy) + _e217.zw);
    u_xlat0_.x = _e219.x;
    u_xlat0_.y = _e219.y;
    let _e224 = u_xlat6_;
    let _e226 = u_xlat0_;
    let _e229 = u_xlat0_;
    let _e231 = (-(_e226.xy) + _e229.yx);
    u_xlat6_.x = _e231.x;
    u_xlat6_.y = _e231.y;
    let _e236 = vs_TEXCOORD0_;
    let _e241 = _v_buffer2_.v_cb2_[2];
    let _e243 = u_xlat6_;
    let _e246 = u_xlat0_;
    let _e248 = ((_e241.zz * _e243.xy) + _e246.xy);
    vs_TEXCOORD0_.x = _e248.x;
    vs_TEXCOORD0_.y = _e248.y;
    let _e254 = in_COLOR0_1;
    let _e259 = _v_buffer2_.v_cb2_[13];
    vs_COLOR1_.w = max(_e254.w, _e259.x);
    let _e262 = vs_COLOR1_;
    vs_COLOR1_.x = 0f;
    vs_COLOR1_.y = 0f;
    vs_COLOR1_.z = 0f;
    let _e271 = u_xlat0_;
    let _e273 = in_COLOR0_1;
    let _e274 = _e273.xyz;
    u_xlat0_.x = _e274.x;
    u_xlat0_.y = _e274.y;
    u_xlat0_.z = _e274.z;
    u_xlat0_.w = 1f;
    let _e283 = u_xlat0_;
    let _e287 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e283 * _e287);
    let _e290 = u_xlat0_;
    let _e292 = u_xlat0_;
    u_xlat1_.x = max(_e290.y, _e292.x);
    let _e296 = u_xlat0_;
    let _e298 = u_xlat1_;
    u_xlat1_.x = max(_e296.z, _e298.x);
    let _e302 = u_xlat1_;
    u_xlat1_.x = ((_e302.x * 2f) + -1f);
    let _e310 = u_xlat1_;
    u_xlat1_.x = clamp(_e310.x, 0f, 1f);
    let _e316 = u_xlat1_;
    u_xlat1_.w = (-(_e316.x) + 1f);
    let _e321 = u_xlat1_;
    let _e323 = u_xlat0_;
    let _e325 = u_xlat0_;
    let _e327 = (_e323.xyz + _e325.xyz);
    u_xlat1_.x = _e327.x;
    u_xlat1_.y = _e327.y;
    u_xlat1_.z = _e327.z;
    let _e335 = u_xlat0_;
    let _e340 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e335.w * _e340.w);
    let _e343 = u_xlat0_;
    let _e345 = u_xlat1_;
    vs_COLOR0_ = (_e343.xxxx * _e345);
    let _e348 = in_COLOR0_1;
    u_xlat0_.x = (-(_e348.w) + 1f);
    let _e354 = u_xlat0_;
    let _e359 = _v_buffer2_.v_cb2_[12];
    u_xlat0_.x = (_e354.x + -(_e359.w));
    let _e366 = _v_buffer2_.v_cb2_[12];
    u_xlat3_ = (_e366.y * 1.01f);
    let _e371 = u_xlat3_;
    let _e372 = u_xlat0_;
    u_xlat0_.x = max(_e371, _e372.x);
    let _e378 = _v_buffer2_.v_cb2_[12];
    u_xlat3_ = ((_e378.z * 2f) + 1f);
    let _e384 = u_xlat0_;
    let _e386 = u_xlat3_;
    let _e391 = _v_buffer2_.v_cb2_[12];
    vs_TEXCOORD1_ = ((_e384.x * _e386) + -(_e391.z));
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
