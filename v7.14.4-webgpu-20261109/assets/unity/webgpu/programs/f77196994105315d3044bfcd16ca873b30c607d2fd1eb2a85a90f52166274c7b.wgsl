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
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
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
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e22 = in_POSITION0_1;
    let _e27 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e22.yyyy * _e27);
    let _e32 = _v_buffer1_.v_cb1_[0];
    let _e33 = in_POSITION0_1;
    let _e36 = u_xlat0_;
    u_xlat0_ = ((_e32 * _e33.xxxx) + _e36);
    let _e41 = _v_buffer1_.v_cb1_[2];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    u_xlat0_ = ((_e41 * _e42.zzzz) + _e45);
    let _e47 = u_xlat0_;
    let _e51 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e47 + _e51);
    let _e53 = u_xlat0_;
    let _e58 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e53.yyyy * _e58);
    let _e63 = _v_buffer0_.v_cb0_[79];
    let _e64 = u_xlat0_;
    let _e67 = u_xlat1_;
    u_xlat1_ = ((_e63 * _e64.xxxx) + _e67);
    let _e72 = _v_buffer0_.v_cb0_[81];
    let _e73 = u_xlat0_;
    let _e76 = u_xlat1_;
    u_xlat1_ = ((_e72 * _e73.zzzz) + _e76);
    let _e82 = _v_buffer0_.v_cb0_[82];
    let _e83 = u_xlat0_;
    let _e86 = u_xlat1_;
    gl_Position = ((_e82 * _e83.wwww) + _e86);
    let _e92 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e92.w);
    let _e99 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e99.w);
    let _e106 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e106.w);
    let _e109 = u_xlat0_;
    let _e111 = u_xlat0_;
    let _e113 = log2(_e111.xyz);
    u_xlat0_.x = _e113.x;
    u_xlat0_.y = _e113.y;
    u_xlat0_.z = _e113.z;
    let _e120 = u_xlat0_;
    let _e122 = u_xlat0_;
    let _e128 = (_e122.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e128.x;
    u_xlat0_.y = _e128.y;
    u_xlat0_.z = _e128.z;
    let _e135 = u_xlat0_;
    let _e137 = u_xlat0_;
    let _e139 = exp2(_e137.xyz);
    u_xlat0_.x = _e139.x;
    u_xlat0_.y = _e139.y;
    u_xlat0_.z = _e139.z;
    let _e146 = u_xlat0_;
    let _e148 = u_xlat0_;
    let _e162 = ((_e148.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e162.x;
    u_xlat0_.y = _e162.y;
    u_xlat0_.z = _e162.z;
    let _e169 = u_xlat0_;
    let _e171 = u_xlat0_;
    let _e177 = clamp(_e171.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e177.x;
    u_xlat0_.y = _e177.y;
    u_xlat0_.z = _e177.z;
    let _e184 = u_xlat0_;
    let _e186 = u_xlat0_;
    let _e191 = _v_buffer0_.v_cb0_[6];
    let _e193 = (_e186.xyz + _e191.xyz);
    u_xlat0_.x = _e193.x;
    u_xlat0_.y = _e193.y;
    u_xlat0_.z = _e193.z;
    let _e200 = u_xlat0_;
    let _e202 = u_xlat0_;
    let _e211 = (_e202.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e211.x;
    u_xlat0_.y = _e211.y;
    u_xlat0_.z = _e211.z;
    u_xlat0_.w = 0f;
    let _e223 = _v_buffer2_.v_cb2_[1];
    let _e225 = u_xlat0_;
    u_xlat0_ = ((_e223.xxxx * _e225) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e233 = u_xlat0_;
    let _e234 = in_COLOR0_1;
    vs_COLOR0_ = (_e233 * _e234);
    let _e236 = vs_TEXCOORD0_;
    let _e238 = in_TEXCOORD0_1;
    let _e243 = _v_buffer2_.v_cb2_[2];
    let _e249 = _v_buffer2_.v_cb2_[2];
    let _e251 = ((_e238.xy * _e243.xy) + _e249.zw);
    vs_TEXCOORD0_.x = _e251.x;
    vs_TEXCOORD0_.y = _e251.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_COLOR0_1 = in_COLOR0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e26 = vs_COLOR0_;
    let _e28 = vs_TEXCOORD0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
