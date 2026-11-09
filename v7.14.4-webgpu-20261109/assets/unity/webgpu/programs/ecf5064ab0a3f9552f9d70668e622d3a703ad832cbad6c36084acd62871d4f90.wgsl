struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 6>,
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
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e31 = in_POSITION0_1;
    let _e36 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e31.yyyy * _e36);
    let _e41 = _v_buffer1_.v_cb1_[0];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    u_xlat0_ = ((_e41 * _e42.xxxx) + _e45);
    let _e50 = _v_buffer1_.v_cb1_[2];
    let _e51 = in_POSITION0_1;
    let _e54 = u_xlat0_;
    u_xlat0_ = ((_e50 * _e51.zzzz) + _e54);
    let _e56 = u_xlat0_;
    let _e60 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e56 + _e60);
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e62.yyyy * _e67);
    let _e72 = _v_buffer0_.v_cb0_[79];
    let _e73 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat1_ = ((_e72 * _e73.xxxx) + _e76);
    let _e81 = _v_buffer0_.v_cb0_[81];
    let _e82 = u_xlat0_;
    let _e85 = u_xlat1_;
    u_xlat1_ = ((_e81 * _e82.zzzz) + _e85);
    let _e91 = _v_buffer0_.v_cb0_[82];
    let _e92 = u_xlat0_;
    let _e95 = u_xlat1_;
    gl_Position = ((_e91 * _e92.wwww) + _e95);
    let _e97 = u_xlat0_;
    let _e99 = in_TEXCOORD0_1;
    let _e104 = _v_buffer2_.v_cb2_[0];
    let _e110 = _v_buffer2_.v_cb2_[0];
    let _e112 = ((_e99.xy * _e104.xy) + _e110.zw);
    u_xlat0_.x = _e112.x;
    u_xlat0_.y = _e112.y;
    let _e117 = u_xlat6_;
    let _e122 = _v_buffer0_.v_cb0_[15];
    let _e127 = _v_buffer2_.v_cb2_[2];
    let _e129 = (_e122.xx * _e127.zw);
    u_xlat6_.x = _e129.x;
    u_xlat6_.y = _e129.y;
    let _e134 = u_xlat0_;
    let _e136 = u_xlat0_;
    let _e141 = _v_buffer2_.v_cb2_[3];
    let _e144 = u_xlat6_;
    let _e146 = ((_e136.xy * _e141.zw) + _e144.xy);
    u_xlat0_.x = _e146.x;
    u_xlat0_.y = _e146.y;
    let _e151 = u_xlat0_;
    let _e153 = u_xlat0_;
    let _e158 = _v_buffer2_.v_cb2_[3];
    let _e160 = (_e153.xy + _e158.xy);
    u_xlat0_.x = _e160.x;
    u_xlat0_.y = _e160.y;
    let _e165 = vs_TEXCOORD0_;
    let _e167 = u_xlat0_;
    let _e172 = _v_buffer2_.v_cb2_[5];
    let _e174 = (_e167.xy + _e172.zz);
    vs_TEXCOORD0_.x = _e174.x;
    vs_TEXCOORD0_.y = _e174.y;
    let _e179 = u_xlat0_;
    let _e181 = in_TEXCOORD1_1;
    let _e186 = _v_buffer2_.v_cb2_[0];
    let _e192 = _v_buffer2_.v_cb2_[0];
    let _e194 = ((_e181.xy * _e186.xy) + _e192.zw);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    let _e199 = u_xlat6_;
    let _e204 = _v_buffer0_.v_cb0_[15];
    let _e209 = _v_buffer2_.v_cb2_[4];
    let _e211 = (_e204.xx * _e209.xy);
    u_xlat6_.x = _e211.x;
    u_xlat6_.y = _e211.y;
    let _e216 = u_xlat0_;
    let _e218 = u_xlat0_;
    let _e223 = _v_buffer2_.v_cb2_[5];
    let _e226 = u_xlat6_;
    let _e228 = ((_e218.xy * _e223.xy) + _e226.xy);
    u_xlat0_.x = _e228.x;
    u_xlat0_.y = _e228.y;
    let _e233 = u_xlat0_;
    let _e235 = u_xlat0_;
    let _e240 = _v_buffer2_.v_cb2_[4];
    let _e242 = (_e235.xy + _e240.zw);
    u_xlat0_.x = _e242.x;
    u_xlat0_.y = _e242.y;
    let _e247 = vs_TEXCOORD0_;
    let _e249 = u_xlat0_;
    let _e254 = _v_buffer2_.v_cb2_[5];
    let _e256 = (_e249.xy + _e254.zz);
    vs_TEXCOORD0_.z = _e256.x;
    vs_TEXCOORD0_.w = _e256.y;
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
    let _e396 = _v_buffer2_.v_cb2_[2];
    let _e398 = u_xlat0_;
    u_xlat0_ = ((_e396.yyyy * _e398) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e406 = in_COLOR0_1;
    let _e410 = _v_buffer2_.v_cb2_[2];
    u_xlat1_ = (_e406 * _e410.xxxx);
    let _e416 = _v_buffer2_.v_cb2_[1];
    let _e420 = _v_buffer2_.v_cb2_[1];
    u_xlat2_ = (_e416 * _e420);
    let _e422 = u_xlat1_;
    let _e423 = u_xlat2_;
    u_xlat1_ = (_e422 * _e423);
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
