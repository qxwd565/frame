struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 3>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
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
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
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
    let _e82 = _v_buffer0_.v_cb0_[82];
    let _e83 = u_xlat0_;
    let _e86 = u_xlat1_;
    u_xlat0_ = ((_e82 * _e83.wwww) + _e86);
    let _e89 = u_xlat0_;
    gl_Position = _e89;
    let _e90 = u_xlat0_;
    let _e92 = u_xlat0_;
    let _e97 = _v_buffer2_.v_cb2_[2];
    let _e99 = (_e92.xy * _e97.yz);
    u_xlat0_.x = _e99.x;
    u_xlat0_.y = _e99.y;
    let _e108 = _v_buffer0_.v_cb0_[15];
    let _e113 = _v_buffer2_.v_cb2_[1];
    let _e116 = u_xlat0_;
    vs_TEXCOORD1_.x = ((_e108.x * _e113.w) + _e116.x);
    let _e123 = _v_buffer0_.v_cb0_[15];
    let _e128 = _v_buffer2_.v_cb2_[2];
    let _e131 = u_xlat0_;
    vs_TEXCOORD1_.y = ((_e123.x * _e128.x) + _e131.y);
    let _e134 = vs_TEXCOORD0_;
    let _e136 = in_TEXCOORD0_1;
    let _e137 = _e136.xy;
    vs_TEXCOORD0_.x = _e137.x;
    vs_TEXCOORD0_.y = _e137.y;
    let _e146 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e146.w);
    let _e153 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e153.w);
    let _e160 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e160.w);
    let _e163 = u_xlat0_;
    let _e165 = u_xlat0_;
    let _e167 = log2(_e165.xyz);
    u_xlat0_.x = _e167.x;
    u_xlat0_.y = _e167.y;
    u_xlat0_.z = _e167.z;
    let _e174 = u_xlat0_;
    let _e176 = u_xlat0_;
    let _e182 = (_e176.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e182.x;
    u_xlat0_.y = _e182.y;
    u_xlat0_.z = _e182.z;
    let _e189 = u_xlat0_;
    let _e191 = u_xlat0_;
    let _e193 = exp2(_e191.xyz);
    u_xlat0_.x = _e193.x;
    u_xlat0_.y = _e193.y;
    u_xlat0_.z = _e193.z;
    let _e200 = u_xlat0_;
    let _e202 = u_xlat0_;
    let _e216 = ((_e202.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e216.x;
    u_xlat0_.y = _e216.y;
    u_xlat0_.z = _e216.z;
    let _e223 = u_xlat0_;
    let _e225 = u_xlat0_;
    let _e231 = clamp(_e225.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e231.x;
    u_xlat0_.y = _e231.y;
    u_xlat0_.z = _e231.z;
    let _e238 = u_xlat0_;
    let _e240 = u_xlat0_;
    let _e245 = _v_buffer0_.v_cb0_[6];
    let _e247 = (_e240.xyz + _e245.xyz);
    u_xlat0_.x = _e247.x;
    u_xlat0_.y = _e247.y;
    u_xlat0_.z = _e247.z;
    let _e254 = u_xlat0_;
    let _e256 = u_xlat0_;
    let _e265 = (_e256.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e265.x;
    u_xlat0_.y = _e265.y;
    u_xlat0_.z = _e265.z;
    u_xlat0_.w = 0f;
    let _e277 = _v_buffer2_.v_cb2_[1];
    let _e279 = u_xlat0_;
    u_xlat0_ = ((_e277.zzzz * _e279) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e287 = in_COLOR0_1;
    let _e288 = in_COLOR0_1;
    u_xlat1_ = (_e287 + _e288);
    let _e290 = u_xlat1_;
    let _e294 = _v_buffer2_.v_cb2_[1];
    u_xlat1_ = (_e290 * _e294.xxxx);
    let _e297 = u_xlat0_;
    let _e298 = u_xlat1_;
    u_xlat0_ = (_e297 * _e298);
    let _e300 = u_xlat0_;
    let _e304 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e300 * _e304.yyyy);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD1_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
