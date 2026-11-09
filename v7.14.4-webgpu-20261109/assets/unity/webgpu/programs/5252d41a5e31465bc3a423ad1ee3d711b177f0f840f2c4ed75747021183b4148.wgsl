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
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e26 = in_POSITION0_1;
    let _e31 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e26.yyyy * _e31);
    let _e36 = _v_buffer1_.v_cb1_[0];
    let _e37 = in_POSITION0_1;
    let _e40 = u_xlat0_;
    u_xlat0_ = ((_e36 * _e37.xxxx) + _e40);
    let _e45 = _v_buffer1_.v_cb1_[2];
    let _e46 = in_POSITION0_1;
    let _e49 = u_xlat0_;
    u_xlat0_ = ((_e45 * _e46.zzzz) + _e49);
    let _e51 = u_xlat0_;
    let _e55 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e51 + _e55);
    let _e57 = u_xlat0_;
    let _e62 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e57.yyyy * _e62);
    let _e67 = _v_buffer0_.v_cb0_[79];
    let _e68 = u_xlat0_;
    let _e71 = u_xlat1_;
    u_xlat1_ = ((_e67 * _e68.xxxx) + _e71);
    let _e76 = _v_buffer0_.v_cb0_[81];
    let _e77 = u_xlat0_;
    let _e80 = u_xlat1_;
    u_xlat1_ = ((_e76 * _e77.zzzz) + _e80);
    let _e86 = _v_buffer0_.v_cb0_[82];
    let _e87 = u_xlat0_;
    let _e90 = u_xlat1_;
    gl_Position = ((_e86 * _e87.wwww) + _e90);
    let _e92 = u_xlat0_;
    let _e94 = in_TEXCOORD0_1;
    let _e99 = _v_buffer2_.v_cb2_[0];
    let _e101 = (_e94.xy + _e99.zw);
    u_xlat0_.x = _e101.x;
    u_xlat0_.y = _e101.y;
    let _e106 = u_xlat4_;
    let _e111 = _v_buffer0_.v_cb0_[15];
    let _e116 = _v_buffer2_.v_cb2_[2];
    let _e118 = (_e111.xx * _e116.xy);
    u_xlat4_.x = _e118.x;
    u_xlat4_.y = _e118.y;
    let _e123 = vs_TEXCOORD0_;
    let _e125 = u_xlat0_;
    let _e130 = _v_buffer2_.v_cb2_[2];
    let _e133 = u_xlat4_;
    let _e135 = ((_e125.xy * _e130.zw) + _e133.xy);
    vs_TEXCOORD0_.x = _e135.x;
    vs_TEXCOORD0_.y = _e135.y;
    let _e140 = vs_TEXCOORD0_;
    let _e142 = in_TEXCOORD0_1;
    let _e147 = _v_buffer2_.v_cb2_[1];
    let _e153 = _v_buffer2_.v_cb2_[1];
    let _e155 = ((_e142.xy * _e147.xy) + _e153.zw);
    vs_TEXCOORD0_.z = _e155.x;
    vs_TEXCOORD0_.w = _e155.y;
    let _e164 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e164.w);
    let _e171 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e171.w);
    let _e178 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e178.w);
    let _e181 = u_xlat0_;
    let _e183 = u_xlat0_;
    let _e185 = log2(_e183.xyz);
    u_xlat0_.x = _e185.x;
    u_xlat0_.y = _e185.y;
    u_xlat0_.z = _e185.z;
    let _e192 = u_xlat0_;
    let _e194 = u_xlat0_;
    let _e200 = (_e194.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e200.x;
    u_xlat0_.y = _e200.y;
    u_xlat0_.z = _e200.z;
    let _e207 = u_xlat0_;
    let _e209 = u_xlat0_;
    let _e211 = exp2(_e209.xyz);
    u_xlat0_.x = _e211.x;
    u_xlat0_.y = _e211.y;
    u_xlat0_.z = _e211.z;
    let _e218 = u_xlat0_;
    let _e220 = u_xlat0_;
    let _e234 = ((_e220.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e234.x;
    u_xlat0_.y = _e234.y;
    u_xlat0_.z = _e234.z;
    let _e241 = u_xlat0_;
    let _e243 = u_xlat0_;
    let _e249 = clamp(_e243.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e249.x;
    u_xlat0_.y = _e249.y;
    u_xlat0_.z = _e249.z;
    let _e256 = u_xlat0_;
    let _e258 = u_xlat0_;
    let _e263 = _v_buffer0_.v_cb0_[6];
    let _e265 = (_e258.xyz + _e263.xyz);
    u_xlat0_.x = _e265.x;
    u_xlat0_.y = _e265.y;
    u_xlat0_.z = _e265.z;
    let _e272 = u_xlat0_;
    let _e274 = u_xlat0_;
    let _e283 = (_e274.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e283.x;
    u_xlat0_.y = _e283.y;
    u_xlat0_.z = _e283.z;
    u_xlat0_.w = 0f;
    let _e295 = _v_buffer2_.v_cb2_[5];
    let _e297 = u_xlat0_;
    u_xlat0_ = ((_e295.wwww * _e297) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e305 = u_xlat0_;
    let _e306 = in_COLOR0_1;
    vs_COLOR0_ = (_e305 * _e306);
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
