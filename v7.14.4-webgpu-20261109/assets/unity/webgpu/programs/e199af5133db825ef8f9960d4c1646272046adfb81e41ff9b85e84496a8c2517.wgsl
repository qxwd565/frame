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
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e27 = in_POSITION0_1;
    let _e32 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e27.yyyy * _e32);
    let _e37 = _v_buffer1_.v_cb1_[0];
    let _e38 = in_POSITION0_1;
    let _e41 = u_xlat0_;
    u_xlat0_ = ((_e37 * _e38.xxxx) + _e41);
    let _e46 = _v_buffer1_.v_cb1_[2];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.zzzz) + _e50);
    let _e52 = u_xlat0_;
    let _e56 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e52 + _e56);
    let _e58 = u_xlat0_;
    let _e63 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e58.yyyy * _e63);
    let _e68 = _v_buffer0_.v_cb0_[79];
    let _e69 = u_xlat0_;
    let _e72 = u_xlat1_;
    u_xlat1_ = ((_e68 * _e69.xxxx) + _e72);
    let _e77 = _v_buffer0_.v_cb0_[81];
    let _e78 = u_xlat0_;
    let _e81 = u_xlat1_;
    u_xlat1_ = ((_e77 * _e78.zzzz) + _e81);
    let _e87 = _v_buffer0_.v_cb0_[82];
    let _e88 = u_xlat0_;
    let _e91 = u_xlat1_;
    gl_Position = ((_e87 * _e88.wwww) + _e91);
    let _e93 = u_xlat0_;
    let _e95 = in_TEXCOORD0_1;
    let _e100 = _v_buffer2_.v_cb2_[1];
    let _e106 = _v_buffer2_.v_cb2_[1];
    let _e108 = ((_e95.xy * _e100.xy) + _e106.zw);
    u_xlat0_.x = _e108.x;
    u_xlat0_.y = _e108.y;
    let _e113 = u_xlat4_;
    let _e115 = u_xlat0_;
    let _e118 = u_xlat0_;
    let _e120 = (-(_e115.xy) + _e118.yx);
    u_xlat4_.x = _e120.x;
    u_xlat4_.y = _e120.y;
    let _e125 = u_xlat0_;
    let _e130 = _v_buffer2_.v_cb2_[2];
    let _e132 = u_xlat4_;
    let _e135 = u_xlat0_;
    let _e137 = ((_e130.zz * _e132.xy) + _e135.xy);
    u_xlat0_.x = _e137.x;
    u_xlat0_.y = _e137.y;
    let _e142 = u_xlat4_;
    let _e147 = _v_buffer0_.v_cb0_[15];
    let _e152 = _v_buffer2_.v_cb2_[11];
    let _e154 = (_e147.zz * _e152.yz);
    u_xlat4_.x = _e154.x;
    u_xlat4_.y = _e154.y;
    let _e159 = u_xlat4_;
    let _e161 = u_xlat4_;
    let _e163 = fract(_e161.xy);
    u_xlat4_.x = _e163.x;
    u_xlat4_.y = _e163.y;
    let _e168 = vs_TEXCOORD0_;
    let _e170 = u_xlat4_;
    let _e172 = u_xlat0_;
    let _e174 = (_e170.xy + _e172.xy);
    vs_TEXCOORD0_.x = _e174.x;
    vs_TEXCOORD0_.y = _e174.y;
    let _e179 = u_xlat0_;
    let _e181 = in_TEXCOORD0_1;
    let _e186 = _v_buffer2_.v_cb2_[4];
    let _e192 = _v_buffer2_.v_cb2_[4];
    let _e194 = ((_e181.xy * _e186.xy) + _e192.zw);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    let _e199 = u_xlat4_;
    let _e201 = u_xlat0_;
    let _e204 = u_xlat0_;
    let _e206 = (-(_e201.xy) + _e204.yx);
    u_xlat4_.x = _e206.x;
    u_xlat4_.y = _e206.y;
    let _e211 = u_xlat0_;
    let _e216 = _v_buffer2_.v_cb2_[6];
    let _e218 = u_xlat4_;
    let _e221 = u_xlat0_;
    let _e223 = ((_e216.yy * _e218.xy) + _e221.xy);
    u_xlat0_.x = _e223.x;
    u_xlat0_.y = _e223.y;
    let _e228 = u_xlat4_;
    let _e233 = _v_buffer0_.v_cb0_[15];
    let _e238 = _v_buffer2_.v_cb2_[5];
    let _e240 = (_e233.zz * _e238.xy);
    u_xlat4_.x = _e240.x;
    u_xlat4_.y = _e240.y;
    let _e245 = u_xlat4_;
    let _e247 = u_xlat4_;
    let _e249 = fract(_e247.xy);
    u_xlat4_.x = _e249.x;
    u_xlat4_.y = _e249.y;
    let _e254 = vs_TEXCOORD0_;
    let _e256 = u_xlat4_;
    let _e258 = u_xlat0_;
    let _e260 = (_e256.xy + _e258.xy);
    vs_TEXCOORD0_.z = _e260.x;
    vs_TEXCOORD0_.w = _e260.y;
    let _e265 = in_COLOR0_1;
    let _e269 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e265 * _e269);
    let _e272 = u_xlat0_;
    let _e274 = u_xlat0_;
    u_xlat1_.x = max(_e272.y, _e274.x);
    let _e278 = u_xlat0_;
    let _e280 = u_xlat1_;
    u_xlat1_.x = max(_e278.z, _e280.x);
    let _e284 = u_xlat1_;
    u_xlat1_.x = ((_e284.x * 2f) + -1f);
    let _e292 = u_xlat1_;
    u_xlat1_.x = clamp(_e292.x, 0f, 1f);
    let _e298 = u_xlat1_;
    u_xlat1_.w = (-(_e298.x) + 1f);
    let _e303 = u_xlat0_;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat0_;
    let _e309 = (_e305.xyz + _e307.xyz);
    u_xlat0_.x = _e309.x;
    u_xlat0_.y = _e309.y;
    u_xlat0_.z = _e309.z;
    let _e316 = u_xlat1_;
    let _e318 = u_xlat0_;
    let _e323 = _v_buffer2_.v_cb2_[8];
    let _e325 = (_e318.xyz * _e323.xxx);
    u_xlat1_.x = _e325.x;
    u_xlat1_.y = _e325.y;
    u_xlat1_.z = _e325.z;
    let _e332 = u_xlat0_;
    let _e334 = u_xlat1_;
    vs_COLOR1_ = (_e332.wwww * _e334);
    let _e336 = in_COLOR0_1;
    let _e340 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e336 * _e340);
    let _e343 = u_xlat0_;
    let _e345 = u_xlat0_;
    u_xlat1_.x = max(_e343.y, _e345.x);
    let _e349 = u_xlat0_;
    let _e351 = u_xlat1_;
    u_xlat1_.x = max(_e349.z, _e351.x);
    let _e355 = u_xlat1_;
    u_xlat1_.x = ((_e355.x * 2f) + -1f);
    let _e363 = u_xlat1_;
    u_xlat1_.x = clamp(_e363.x, 0f, 1f);
    let _e369 = u_xlat1_;
    u_xlat1_.w = (-(_e369.x) + 1f);
    let _e374 = u_xlat1_;
    let _e376 = u_xlat0_;
    let _e378 = u_xlat0_;
    let _e380 = (_e376.xyz + _e378.xyz);
    u_xlat1_.x = _e380.x;
    u_xlat1_.y = _e380.y;
    u_xlat1_.z = _e380.z;
    let _e388 = u_xlat0_;
    let _e393 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e388.w * _e393.w);
    let _e396 = u_xlat0_;
    let _e398 = u_xlat1_;
    vs_COLOR0_ = (_e396.xxxx * _e398);
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
