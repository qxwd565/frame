struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec2<f32> = vec2(0f);
    var u_xlat4_: f32 = 0f;

    let _e33 = _v_buffer0_.v_cb0_[15];
    let _e38 = _v_buffer2_.v_cb2_[1];
    u_xlat0_.x = (_e33.x * _e38.z);
    let _e42 = u_xlat0_;
    u_xlat0_.x = sin(_e42.x);
    let _e46 = u_xlat0_;
    u_xlat0_.x = (_e46.x + 2f);
    let _e51 = u_xlat0_;
    let _e56 = _v_buffer2_.v_cb2_[1];
    u_xlat0_.x = (_e51.x * _e56.x);
    let _e60 = u_xlat0_;
    u_xlat0_.x = (_e60.x * 0.2f);
    let _e64 = u_xlat2_;
    let _e66 = in_POSITION0_1;
    let _e71 = _v_buffer2_.v_cb2_[1];
    let _e73 = (_e66.xz * _e71.yy);
    u_xlat2_.x = _e73.x;
    u_xlat2_.y = _e73.y;
    let _e78 = u_xlat2_;
    let _e83 = _v_buffer0_.v_cb0_[15];
    let _e89 = u_xlat2_;
    let _e91 = ((_e83.xx * vec2<f32>(30f, 42f)) + _e89.xy);
    u_xlat2_.x = _e91.x;
    u_xlat2_.y = _e91.y;
    let _e97 = u_xlat2_;
    u_xlat2_.x = sin(_e97.x);
    let _e100 = u_xlat2_;
    u_xlat4_ = cos(_e100.y);
    let _e104 = u_xlat0_;
    let _e106 = u_xlat4_;
    u_xlat0_.z = (_e104.x * _e106);
    let _e109 = u_xlat0_;
    let _e111 = u_xlat2_;
    u_xlat0_.x = (_e109.x * _e111.x);
    let _e114 = u_xlat0_;
    let _e116 = u_xlat0_;
    let _e121 = (_e116.xz * vec2<f32>(0.01f, 0.02f));
    u_xlat0_.x = _e121.x;
    u_xlat0_.z = _e121.y;
    let _e126 = u_xlat0_;
    let _e128 = u_xlat0_;
    let _e130 = in_COLOR0_1;
    let _e132 = (_e128.xz * _e130.xx);
    u_xlat0_.x = _e132.x;
    u_xlat0_.z = _e132.y;
    let _e137 = u_xlat0_;
    let _e139 = u_xlat0_;
    let _e147 = in_POSITION0_1;
    let _e149 = ((_e139.xxx * vec3<f32>(-0.5f, 0f, 0.25f)) + _e147.xyz);
    u_xlat0_.x = _e149.x;
    u_xlat0_.y = _e149.y;
    u_xlat0_.w = _e149.z;
    let _e156 = u_xlat0_;
    let _e158 = u_xlat0_;
    let _e167 = u_xlat0_;
    let _e169 = ((_e158.zzz * vec3<f32>(-0.3f, 0f, -0.5f)) + _e167.xyw);
    u_xlat0_.x = _e169.x;
    u_xlat0_.y = _e169.y;
    u_xlat0_.z = _e169.z;
    let _e176 = u_xlat0_;
    let _e181 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e176.yyyy * _e181);
    let _e186 = _v_buffer1_.v_cb1_[0];
    let _e187 = u_xlat0_;
    let _e190 = u_xlat1_;
    u_xlat1_ = ((_e186 * _e187.xxxx) + _e190);
    let _e195 = _v_buffer1_.v_cb1_[2];
    let _e196 = u_xlat0_;
    let _e199 = u_xlat1_;
    u_xlat0_ = ((_e195 * _e196.zzzz) + _e199);
    let _e201 = u_xlat0_;
    let _e205 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e201 + _e205);
    let _e207 = u_xlat0_;
    let _e212 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e207.yyyy * _e212);
    let _e217 = _v_buffer0_.v_cb0_[79];
    let _e218 = u_xlat0_;
    let _e221 = u_xlat1_;
    u_xlat1_ = ((_e217 * _e218.xxxx) + _e221);
    let _e226 = _v_buffer0_.v_cb0_[81];
    let _e227 = u_xlat0_;
    let _e230 = u_xlat1_;
    u_xlat1_ = ((_e226 * _e227.zzzz) + _e230);
    let _e236 = _v_buffer0_.v_cb0_[82];
    let _e237 = u_xlat0_;
    let _e240 = u_xlat1_;
    gl_Position = ((_e236 * _e237.wwww) + _e240);
    let _e242 = vs_TEXCOORD0_;
    let _e244 = in_TEXCOORD0_1;
    let _e249 = _v_buffer2_.v_cb2_[0];
    let _e255 = _v_buffer2_.v_cb2_[0];
    let _e257 = ((_e244.xy * _e249.xy) + _e255.zw);
    vs_TEXCOORD0_.x = _e257.x;
    vs_TEXCOORD0_.y = _e257.y;
    let _e266 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e266.w);
    let _e273 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e273.w);
    let _e280 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e280.w);
    let _e283 = u_xlat0_;
    let _e285 = u_xlat0_;
    let _e287 = log2(_e285.xyz);
    u_xlat0_.x = _e287.x;
    u_xlat0_.y = _e287.y;
    u_xlat0_.z = _e287.z;
    let _e294 = u_xlat0_;
    let _e296 = u_xlat0_;
    let _e302 = (_e296.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e302.x;
    u_xlat0_.y = _e302.y;
    u_xlat0_.z = _e302.z;
    let _e309 = u_xlat0_;
    let _e311 = u_xlat0_;
    let _e313 = exp2(_e311.xyz);
    u_xlat0_.x = _e313.x;
    u_xlat0_.y = _e313.y;
    u_xlat0_.z = _e313.z;
    let _e320 = u_xlat0_;
    let _e322 = u_xlat0_;
    let _e336 = ((_e322.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e336.x;
    u_xlat0_.y = _e336.y;
    u_xlat0_.z = _e336.z;
    let _e343 = u_xlat0_;
    let _e345 = u_xlat0_;
    let _e351 = clamp(_e345.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e351.x;
    u_xlat0_.y = _e351.y;
    u_xlat0_.z = _e351.z;
    let _e358 = u_xlat0_;
    let _e360 = u_xlat0_;
    let _e365 = _v_buffer0_.v_cb0_[6];
    let _e367 = (_e360.xyz + _e365.xyz);
    u_xlat0_.x = _e367.x;
    u_xlat0_.y = _e367.y;
    u_xlat0_.z = _e367.z;
    let _e374 = u_xlat0_;
    let _e376 = u_xlat0_;
    let _e385 = (_e376.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e385.x;
    u_xlat0_.y = _e385.y;
    u_xlat0_.z = _e385.z;
    u_xlat0_.w = 0f;
    let _e397 = _v_buffer2_.v_cb2_[1];
    let _e399 = u_xlat0_;
    vs_COLOR0_ = ((_e397.wwww * _e399) + vec4<f32>(1f, 1f, 1f, 1f));
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
