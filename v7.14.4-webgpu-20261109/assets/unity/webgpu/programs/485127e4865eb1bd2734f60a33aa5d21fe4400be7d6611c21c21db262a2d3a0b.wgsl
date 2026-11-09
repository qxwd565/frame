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
    let _e83 = _v_buffer0_.v_cb0_[82];
    let _e84 = u_xlat0_;
    let _e87 = u_xlat1_;
    gl_Position = ((_e83 * _e84.wwww) + _e87);
    let _e89 = u_xlat0_;
    let _e91 = in_TEXCOORD0_1;
    let _e96 = _v_buffer2_.v_cb2_[3];
    let _e98 = (_e91.xy + _e96.zw);
    u_xlat0_.x = _e98.x;
    u_xlat0_.y = _e98.y;
    let _e103 = vs_TEXCOORD0_;
    let _e105 = u_xlat0_;
    let _e110 = _v_buffer2_.v_cb2_[3];
    let _e112 = (_e105.xy * _e110.xy);
    vs_TEXCOORD0_.x = _e112.x;
    vs_TEXCOORD0_.y = _e112.y;
    let _e117 = u_xlat0_;
    let _e119 = in_TEXCOORD0_1;
    let _e124 = _v_buffer2_.v_cb2_[4];
    let _e126 = (_e119.xy + _e124.zw);
    u_xlat0_.x = _e126.x;
    u_xlat0_.y = _e126.y;
    let _e131 = vs_TEXCOORD1_;
    let _e133 = u_xlat0_;
    let _e138 = _v_buffer2_.v_cb2_[4];
    let _e140 = (_e133.xy * _e138.xy);
    vs_TEXCOORD1_.x = _e140.x;
    vs_TEXCOORD1_.y = _e140.y;
    let _e149 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e149.w);
    let _e156 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e156.w);
    let _e163 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e163.w);
    let _e166 = u_xlat0_;
    let _e168 = u_xlat0_;
    let _e170 = log2(_e168.xyz);
    u_xlat0_.x = _e170.x;
    u_xlat0_.y = _e170.y;
    u_xlat0_.z = _e170.z;
    let _e177 = u_xlat0_;
    let _e179 = u_xlat0_;
    let _e185 = (_e179.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e185.x;
    u_xlat0_.y = _e185.y;
    u_xlat0_.z = _e185.z;
    let _e192 = u_xlat0_;
    let _e194 = u_xlat0_;
    let _e196 = exp2(_e194.xyz);
    u_xlat0_.x = _e196.x;
    u_xlat0_.y = _e196.y;
    u_xlat0_.z = _e196.z;
    let _e203 = u_xlat0_;
    let _e205 = u_xlat0_;
    let _e219 = ((_e205.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e219.x;
    u_xlat0_.y = _e219.y;
    u_xlat0_.z = _e219.z;
    let _e226 = u_xlat0_;
    let _e228 = u_xlat0_;
    let _e234 = clamp(_e228.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e234.x;
    u_xlat0_.y = _e234.y;
    u_xlat0_.z = _e234.z;
    let _e241 = u_xlat0_;
    let _e243 = u_xlat0_;
    let _e248 = _v_buffer0_.v_cb0_[6];
    let _e250 = (_e243.xyz + _e248.xyz);
    u_xlat0_.x = _e250.x;
    u_xlat0_.y = _e250.y;
    u_xlat0_.z = _e250.z;
    let _e257 = u_xlat0_;
    let _e259 = u_xlat0_;
    let _e268 = (_e259.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e268.x;
    u_xlat0_.y = _e268.y;
    u_xlat0_.z = _e268.z;
    u_xlat0_.w = 0f;
    let _e280 = _v_buffer2_.v_cb2_[5];
    let _e282 = u_xlat0_;
    u_xlat0_ = ((_e280.wwww * _e282) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e290 = u_xlat0_;
    let _e291 = in_COLOR0_1;
    vs_COLOR0_ = (_e290 * _e291);
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
