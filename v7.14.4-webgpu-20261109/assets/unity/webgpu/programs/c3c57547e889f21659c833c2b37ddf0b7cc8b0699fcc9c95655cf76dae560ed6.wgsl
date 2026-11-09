struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 5>,
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
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;

    let _e32 = in_POSITION0_1;
    let _e37 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e32.yyyy * _e37);
    let _e42 = _v_buffer1_.v_cb1_[0];
    let _e43 = in_POSITION0_1;
    let _e46 = u_xlat0_;
    u_xlat0_ = ((_e42 * _e43.xxxx) + _e46);
    let _e51 = _v_buffer1_.v_cb1_[2];
    let _e52 = in_POSITION0_1;
    let _e55 = u_xlat0_;
    u_xlat0_ = ((_e51 * _e52.zzzz) + _e55);
    let _e57 = u_xlat0_;
    let _e61 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e57 + _e61);
    let _e63 = u_xlat0_;
    let _e68 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e63.yyyy * _e68);
    let _e73 = _v_buffer0_.v_cb0_[79];
    let _e74 = u_xlat0_;
    let _e77 = u_xlat1_;
    u_xlat1_ = ((_e73 * _e74.xxxx) + _e77);
    let _e82 = _v_buffer0_.v_cb0_[81];
    let _e83 = u_xlat0_;
    let _e86 = u_xlat1_;
    u_xlat1_ = ((_e82 * _e83.zzzz) + _e86);
    let _e92 = _v_buffer0_.v_cb0_[82];
    let _e93 = u_xlat0_;
    let _e96 = u_xlat1_;
    gl_Position = ((_e92 * _e93.wwww) + _e96);
    let _e98 = u_xlat0_;
    let _e100 = in_TEXCOORD0_1;
    let _e105 = _v_buffer2_.v_cb2_[3];
    let _e111 = _v_buffer2_.v_cb2_[3];
    let _e113 = ((_e100.xy * _e105.xy) + _e111.zw);
    u_xlat0_.x = _e113.x;
    u_xlat0_.y = _e113.y;
    let _e118 = u_xlat0_;
    let _e120 = u_xlat0_;
    let _e125 = _v_buffer2_.v_cb2_[1];
    let _e127 = (_e120.xy + _e125.zw);
    u_xlat0_.x = _e127.x;
    u_xlat0_.y = _e127.y;
    let _e132 = u_xlat0_;
    let _e134 = u_xlat0_;
    let _e141 = (_e134.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat0_.x = _e141.x;
    u_xlat0_.y = _e141.y;
    let _e146 = u_xlat0_;
    let _e148 = u_xlat0_;
    let _e153 = _v_buffer2_.v_cb2_[2];
    let _e155 = (_e148.xy * _e153.xy);
    u_xlat0_.x = _e155.x;
    u_xlat0_.y = _e155.y;
    let _e163 = _v_buffer0_.v_cb0_[15];
    let _e168 = _v_buffer2_.v_cb2_[1];
    u_xlat8_ = (_e163.x * _e168.y);
    let _e172 = u_xlat8_;
    u_xlat1_.x = sin(_e172);
    let _e174 = u_xlat8_;
    u_xlat2_ = cos(_e174);
    let _e177 = u_xlat1_;
    u_xlat3_.z = _e177.x;
    let _e180 = u_xlat2_;
    u_xlat3_.y = _e180;
    let _e182 = u_xlat1_;
    u_xlat3_.x = -(_e182.x);
    let _e186 = u_xlat0_;
    let _e188 = u_xlat3_;
    u_xlat1_.y = dot(_e186.xy, _e188.xy);
    let _e192 = u_xlat0_;
    let _e194 = u_xlat3_;
    u_xlat1_.x = dot(_e192.xy, _e194.yz);
    let _e197 = vs_TEXCOORD0_;
    let _e199 = u_xlat1_;
    let _e204 = (_e199.xy + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD0_.x = _e204.x;
    vs_TEXCOORD0_.y = _e204.y;
    let _e213 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e213.w);
    let _e220 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e220.w);
    let _e227 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e227.w);
    let _e230 = u_xlat0_;
    let _e232 = u_xlat0_;
    let _e234 = log2(_e232.xyz);
    u_xlat0_.x = _e234.x;
    u_xlat0_.y = _e234.y;
    u_xlat0_.z = _e234.z;
    let _e241 = u_xlat0_;
    let _e243 = u_xlat0_;
    let _e249 = (_e243.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e249.x;
    u_xlat0_.y = _e249.y;
    u_xlat0_.z = _e249.z;
    let _e256 = u_xlat0_;
    let _e258 = u_xlat0_;
    let _e260 = exp2(_e258.xyz);
    u_xlat0_.x = _e260.x;
    u_xlat0_.y = _e260.y;
    u_xlat0_.z = _e260.z;
    let _e267 = u_xlat0_;
    let _e269 = u_xlat0_;
    let _e283 = ((_e269.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e283.x;
    u_xlat0_.y = _e283.y;
    u_xlat0_.z = _e283.z;
    let _e290 = u_xlat0_;
    let _e292 = u_xlat0_;
    let _e298 = clamp(_e292.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e298.x;
    u_xlat0_.y = _e298.y;
    u_xlat0_.z = _e298.z;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat0_;
    let _e312 = _v_buffer0_.v_cb0_[6];
    let _e314 = (_e307.xyz + _e312.xyz);
    u_xlat0_.x = _e314.x;
    u_xlat0_.y = _e314.y;
    u_xlat0_.z = _e314.z;
    let _e321 = u_xlat0_;
    let _e323 = u_xlat0_;
    let _e332 = (_e323.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e332.x;
    u_xlat0_.y = _e332.y;
    u_xlat0_.z = _e332.z;
    u_xlat0_.w = 0f;
    let _e344 = _v_buffer2_.v_cb2_[4];
    let _e346 = u_xlat0_;
    u_xlat0_ = ((_e344.xxxx * _e346) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e354 = u_xlat0_;
    let _e355 = in_COLOR0_1;
    vs_COLOR0_ = (_e354 * _e355);
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
