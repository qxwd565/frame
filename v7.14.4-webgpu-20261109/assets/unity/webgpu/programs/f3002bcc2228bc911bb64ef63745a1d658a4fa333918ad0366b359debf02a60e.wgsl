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
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e23 = in_POSITION0_1;
    let _e28 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e23.yyyy * _e28);
    let _e33 = _v_buffer1_.v_cb1_[0];
    let _e34 = in_POSITION0_1;
    let _e37 = u_xlat0_;
    u_xlat0_ = ((_e33 * _e34.xxxx) + _e37);
    let _e42 = _v_buffer1_.v_cb1_[2];
    let _e43 = in_POSITION0_1;
    let _e46 = u_xlat0_;
    u_xlat0_ = ((_e42 * _e43.zzzz) + _e46);
    let _e48 = u_xlat0_;
    let _e52 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e48 + _e52);
    let _e54 = u_xlat0_;
    let _e59 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e54.yyyy * _e59);
    let _e64 = _v_buffer0_.v_cb0_[79];
    let _e65 = u_xlat0_;
    let _e68 = u_xlat1_;
    u_xlat1_ = ((_e64 * _e65.xxxx) + _e68);
    let _e73 = _v_buffer0_.v_cb0_[81];
    let _e74 = u_xlat0_;
    let _e77 = u_xlat1_;
    u_xlat1_ = ((_e73 * _e74.zzzz) + _e77);
    let _e83 = _v_buffer0_.v_cb0_[82];
    let _e84 = u_xlat0_;
    let _e87 = u_xlat1_;
    gl_Position = ((_e83 * _e84.wwww) + _e87);
    let _e93 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e93.w);
    let _e100 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e100.w);
    let _e107 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e107.w);
    let _e110 = u_xlat0_;
    let _e112 = u_xlat0_;
    let _e114 = log2(_e112.xyz);
    u_xlat0_.x = _e114.x;
    u_xlat0_.y = _e114.y;
    u_xlat0_.z = _e114.z;
    let _e121 = u_xlat0_;
    let _e123 = u_xlat0_;
    let _e129 = (_e123.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e129.x;
    u_xlat0_.y = _e129.y;
    u_xlat0_.z = _e129.z;
    let _e136 = u_xlat0_;
    let _e138 = u_xlat0_;
    let _e140 = exp2(_e138.xyz);
    u_xlat0_.x = _e140.x;
    u_xlat0_.y = _e140.y;
    u_xlat0_.z = _e140.z;
    let _e147 = u_xlat0_;
    let _e149 = u_xlat0_;
    let _e163 = ((_e149.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e163.x;
    u_xlat0_.y = _e163.y;
    u_xlat0_.z = _e163.z;
    let _e170 = u_xlat0_;
    let _e172 = u_xlat0_;
    let _e178 = clamp(_e172.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e178.x;
    u_xlat0_.y = _e178.y;
    u_xlat0_.z = _e178.z;
    let _e185 = u_xlat0_;
    let _e187 = u_xlat0_;
    let _e192 = _v_buffer0_.v_cb0_[6];
    let _e194 = (_e187.xyz + _e192.xyz);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    u_xlat0_.z = _e194.z;
    let _e201 = u_xlat0_;
    let _e203 = u_xlat0_;
    let _e212 = (_e203.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e212.x;
    u_xlat0_.y = _e212.y;
    u_xlat0_.z = _e212.z;
    u_xlat0_.w = 0f;
    let _e224 = _v_buffer2_.v_cb2_[3];
    let _e226 = u_xlat0_;
    u_xlat0_ = ((_e224.wwww * _e226) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e234 = u_xlat0_;
    let _e235 = in_COLOR0_1;
    vs_COLOR0_ = (_e234 * _e235);
    let _e237 = vs_TEXCOORD0_;
    let _e239 = in_TEXCOORD0_1;
    let _e240 = _e239.xy;
    vs_TEXCOORD0_.x = _e240.x;
    vs_TEXCOORD0_.y = _e240.y;
    let _e245 = vs_TEXCOORD1_;
    let _e250 = _v_buffer0_.v_cb0_[15];
    let _e255 = _v_buffer2_.v_cb2_[1];
    let _e258 = in_TEXCOORD0_1;
    let _e260 = ((_e250.xx * _e255.yz) + _e258.xy);
    vs_TEXCOORD1_.x = _e260.x;
    vs_TEXCOORD1_.y = _e260.y;
    let _e265 = vs_TEXCOORD1_;
    let _e270 = _v_buffer0_.v_cb0_[15];
    let _e275 = _v_buffer2_.v_cb2_[3];
    let _e278 = in_TEXCOORD0_1;
    let _e280 = ((_e270.xx * _e275.yz) + _e278.xy);
    vs_TEXCOORD1_.z = _e280.x;
    vs_TEXCOORD1_.w = _e280.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_COLOR0_1 = in_COLOR0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e28 = vs_COLOR0_;
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_TEXCOORD1_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
