struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 7>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
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
    let _e95 = in_TEXCOORD1_1;
    let _e100 = _v_buffer2_.v_cb2_[5];
    let _e106 = _v_buffer2_.v_cb2_[5];
    let _e108 = ((_e95.xy * _e100.xy) + _e106.zw);
    u_xlat0_.x = _e108.x;
    u_xlat0_.y = _e108.y;
    let _e113 = u_xlat4_;
    let _e118 = _v_buffer0_.v_cb0_[15];
    let _e123 = _v_buffer2_.v_cb2_[3];
    let _e125 = (_e118.xx * _e123.yz);
    u_xlat4_.x = _e125.x;
    u_xlat4_.y = _e125.y;
    let _e130 = u_xlat0_;
    let _e132 = u_xlat0_;
    let _e137 = _v_buffer2_.v_cb2_[4];
    let _e140 = u_xlat4_;
    let _e142 = ((_e132.xy * _e137.yz) + _e140.xy);
    u_xlat0_.x = _e142.x;
    u_xlat0_.y = _e142.y;
    let _e148 = u_xlat0_;
    let _e153 = _v_buffer2_.v_cb2_[3];
    u_xlat4_.x = (_e148.x + _e153.w);
    let _e157 = u_xlat0_;
    let _e162 = _v_buffer2_.v_cb2_[4];
    u_xlat4_.y = (_e157.y + _e162.x);
    let _e165 = vs_TEXCOORD0_;
    let _e167 = u_xlat4_;
    let _e172 = _v_buffer2_.v_cb2_[4];
    let _e174 = (_e167.xy + _e172.ww);
    vs_TEXCOORD0_.z = _e174.x;
    vs_TEXCOORD0_.w = _e174.y;
    let _e179 = u_xlat0_;
    let _e181 = in_TEXCOORD0_1;
    let _e186 = _v_buffer2_.v_cb2_[5];
    let _e192 = _v_buffer2_.v_cb2_[5];
    let _e194 = ((_e181.xy * _e186.xy) + _e192.zw);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    let _e199 = u_xlat4_;
    let _e204 = _v_buffer0_.v_cb0_[15];
    let _e209 = _v_buffer2_.v_cb2_[0];
    let _e211 = (_e204.xx * _e209.xy);
    u_xlat4_.x = _e211.x;
    u_xlat4_.y = _e211.y;
    let _e216 = u_xlat0_;
    let _e218 = u_xlat0_;
    let _e223 = _v_buffer2_.v_cb2_[1];
    let _e226 = u_xlat4_;
    let _e228 = ((_e218.xy * _e223.xy) + _e226.xy);
    u_xlat0_.x = _e228.x;
    u_xlat0_.y = _e228.y;
    let _e233 = u_xlat0_;
    let _e235 = u_xlat0_;
    let _e240 = _v_buffer2_.v_cb2_[0];
    let _e242 = (_e235.xy + _e240.zw);
    u_xlat0_.x = _e242.x;
    u_xlat0_.y = _e242.y;
    let _e247 = vs_TEXCOORD0_;
    let _e249 = u_xlat0_;
    let _e254 = _v_buffer2_.v_cb2_[4];
    let _e256 = (_e249.xy + _e254.ww);
    vs_TEXCOORD0_.x = _e256.x;
    vs_TEXCOORD0_.y = _e256.y;
    let _e265 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e265.w);
    let _e272 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e272.w);
    let _e279 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e279.w);
    let _e282 = u_xlat0_;
    let _e284 = u_xlat0_;
    let _e286 = log2(_e284.xyz);
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    u_xlat0_.z = _e286.z;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat0_;
    let _e301 = (_e295.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e301.x;
    u_xlat0_.y = _e301.y;
    u_xlat0_.z = _e301.z;
    let _e308 = u_xlat0_;
    let _e310 = u_xlat0_;
    let _e312 = exp2(_e310.xyz);
    u_xlat0_.x = _e312.x;
    u_xlat0_.y = _e312.y;
    u_xlat0_.z = _e312.z;
    let _e319 = u_xlat0_;
    let _e321 = u_xlat0_;
    let _e335 = ((_e321.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e335.x;
    u_xlat0_.y = _e335.y;
    u_xlat0_.z = _e335.z;
    let _e342 = u_xlat0_;
    let _e344 = u_xlat0_;
    let _e350 = clamp(_e344.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e350.x;
    u_xlat0_.y = _e350.y;
    u_xlat0_.z = _e350.z;
    let _e357 = u_xlat0_;
    let _e359 = u_xlat0_;
    let _e364 = _v_buffer0_.v_cb0_[6];
    let _e366 = (_e359.xyz + _e364.xyz);
    u_xlat0_.x = _e366.x;
    u_xlat0_.y = _e366.y;
    u_xlat0_.z = _e366.z;
    let _e373 = u_xlat0_;
    let _e375 = u_xlat0_;
    let _e384 = (_e375.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e384.x;
    u_xlat0_.y = _e384.y;
    u_xlat0_.z = _e384.z;
    u_xlat0_.w = 0f;
    let _e396 = _v_buffer2_.v_cb2_[6];
    let _e398 = u_xlat0_;
    u_xlat0_ = ((_e396.xxxx * _e398) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e406 = u_xlat0_;
    let _e407 = in_COLOR0_1;
    u_xlat0_ = (_e406 * _e407);
    let _e409 = u_xlat0_;
    let _e413 = _v_buffer2_.v_cb2_[3];
    u_xlat0_ = (_e409 * _e413.xxxx);
    let _e419 = _v_buffer2_.v_cb2_[2];
    let _e423 = _v_buffer2_.v_cb2_[2];
    u_xlat1_ = (_e419 * _e423);
    let _e425 = u_xlat0_;
    let _e426 = u_xlat1_;
    vs_COLOR0_ = (_e425 * _e426);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e30, _e32, _e34);
}
