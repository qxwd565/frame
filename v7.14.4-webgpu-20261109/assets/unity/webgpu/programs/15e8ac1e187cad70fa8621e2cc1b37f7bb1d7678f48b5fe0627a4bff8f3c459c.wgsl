struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
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
    let _e99 = _v_buffer2_.v_cb2_[3];
    let _e105 = _v_buffer2_.v_cb2_[3];
    let _e107 = ((_e94.xy * _e99.xy) + _e105.zw);
    u_xlat0_.x = _e107.x;
    u_xlat0_.y = _e107.y;
    let _e112 = u_xlat4_;
    let _e117 = _v_buffer0_.v_cb0_[15];
    let _e122 = _v_buffer2_.v_cb2_[1];
    let _e124 = (_e117.xx * _e122.yz);
    u_xlat4_.x = _e124.x;
    u_xlat4_.y = _e124.y;
    let _e130 = u_xlat0_;
    let _e135 = _v_buffer2_.v_cb2_[1];
    let _e138 = u_xlat4_;
    vs_TEXCOORD0_.x = ((_e130.x * _e135.w) + _e138.x);
    let _e142 = u_xlat0_;
    let _e147 = _v_buffer2_.v_cb2_[2];
    let _e150 = u_xlat4_;
    vs_TEXCOORD0_.y = ((_e142.y * _e147.x) + _e150.y);
    let _e157 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e157.w);
    let _e164 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e164.w);
    let _e171 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e171.w);
    let _e174 = u_xlat0_;
    let _e176 = u_xlat0_;
    let _e178 = log2(_e176.xyz);
    u_xlat0_.x = _e178.x;
    u_xlat0_.y = _e178.y;
    u_xlat0_.z = _e178.z;
    let _e185 = u_xlat0_;
    let _e187 = u_xlat0_;
    let _e193 = (_e187.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e193.x;
    u_xlat0_.y = _e193.y;
    u_xlat0_.z = _e193.z;
    let _e200 = u_xlat0_;
    let _e202 = u_xlat0_;
    let _e204 = exp2(_e202.xyz);
    u_xlat0_.x = _e204.x;
    u_xlat0_.y = _e204.y;
    u_xlat0_.z = _e204.z;
    let _e211 = u_xlat0_;
    let _e213 = u_xlat0_;
    let _e227 = ((_e213.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e227.x;
    u_xlat0_.y = _e227.y;
    u_xlat0_.z = _e227.z;
    let _e234 = u_xlat0_;
    let _e236 = u_xlat0_;
    let _e242 = clamp(_e236.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e242.x;
    u_xlat0_.y = _e242.y;
    u_xlat0_.z = _e242.z;
    let _e249 = u_xlat0_;
    let _e251 = u_xlat0_;
    let _e256 = _v_buffer0_.v_cb0_[6];
    let _e258 = (_e251.xyz + _e256.xyz);
    u_xlat0_.x = _e258.x;
    u_xlat0_.y = _e258.y;
    u_xlat0_.z = _e258.z;
    let _e265 = u_xlat0_;
    let _e267 = u_xlat0_;
    let _e276 = (_e267.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e276.x;
    u_xlat0_.y = _e276.y;
    u_xlat0_.z = _e276.z;
    u_xlat0_.w = 0f;
    let _e288 = _v_buffer2_.v_cb2_[1];
    let _e290 = u_xlat0_;
    u_xlat0_ = ((_e288.xxxx * _e290) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e298 = u_xlat0_;
    let _e299 = in_COLOR0_1;
    u_xlat0_ = (_e298 * _e299);
    let _e301 = u_xlat0_;
    let _e305 = _v_buffer2_.v_cb2_[0];
    vs_COLOR0_ = (_e301 * _e305);
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
