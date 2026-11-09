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
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec4<f32>,
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
var<private> vs_TEXCOORD2_: vec4<f32>;
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
    let _e96 = _v_buffer2_.v_cb2_[0];
    let _e102 = _v_buffer2_.v_cb2_[0];
    let _e104 = ((_e91.xy * _e96.xy) + _e102.zw);
    u_xlat0_.x = _e104.x;
    u_xlat0_.y = _e104.y;
    let _e109 = vs_TEXCOORD0_;
    let _e111 = u_xlat0_;
    let _e112 = _e111.xy;
    vs_TEXCOORD0_.x = _e112.x;
    vs_TEXCOORD0_.y = _e112.y;
    let _e117 = vs_TEXCOORD2_;
    let _e119 = u_xlat0_;
    let _e124 = _v_buffer2_.v_cb2_[2];
    let _e130 = _v_buffer2_.v_cb2_[2];
    let _e132 = ((_e119.xy * _e124.zw) + _e130.xy);
    vs_TEXCOORD2_.x = _e132.x;
    vs_TEXCOORD2_.y = _e132.y;
    let _e137 = vs_TEXCOORD2_;
    let _e139 = u_xlat0_;
    let _e144 = _v_buffer2_.v_cb2_[5];
    let _e150 = _v_buffer2_.v_cb2_[5];
    let _e152 = ((_e139.xy * _e144.zw) + _e150.xy);
    vs_TEXCOORD2_.z = _e152.x;
    vs_TEXCOORD2_.w = _e152.y;
    let _e161 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e161.w);
    let _e168 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e168.w);
    let _e175 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e175.w);
    let _e178 = u_xlat0_;
    let _e180 = u_xlat0_;
    let _e182 = log2(_e180.xyz);
    u_xlat0_.x = _e182.x;
    u_xlat0_.y = _e182.y;
    u_xlat0_.z = _e182.z;
    let _e189 = u_xlat0_;
    let _e191 = u_xlat0_;
    let _e197 = (_e191.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e197.x;
    u_xlat0_.y = _e197.y;
    u_xlat0_.z = _e197.z;
    let _e204 = u_xlat0_;
    let _e206 = u_xlat0_;
    let _e208 = exp2(_e206.xyz);
    u_xlat0_.x = _e208.x;
    u_xlat0_.y = _e208.y;
    u_xlat0_.z = _e208.z;
    let _e215 = u_xlat0_;
    let _e217 = u_xlat0_;
    let _e231 = ((_e217.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e231.x;
    u_xlat0_.y = _e231.y;
    u_xlat0_.z = _e231.z;
    let _e238 = u_xlat0_;
    let _e240 = u_xlat0_;
    let _e246 = clamp(_e240.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e246.x;
    u_xlat0_.y = _e246.y;
    u_xlat0_.z = _e246.z;
    let _e253 = u_xlat0_;
    let _e255 = u_xlat0_;
    let _e260 = _v_buffer0_.v_cb0_[6];
    let _e262 = (_e255.xyz + _e260.xyz);
    u_xlat0_.x = _e262.x;
    u_xlat0_.y = _e262.y;
    u_xlat0_.z = _e262.z;
    let _e269 = u_xlat0_;
    let _e271 = u_xlat0_;
    let _e280 = (_e271.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e280.x;
    u_xlat0_.y = _e280.y;
    u_xlat0_.z = _e280.z;
    u_xlat0_.w = 0f;
    let _e292 = _v_buffer2_.v_cb2_[6];
    let _e294 = u_xlat0_;
    u_xlat0_ = ((_e292.xxxx * _e294) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e302 = u_xlat0_;
    let _e303 = in_COLOR0_1;
    vs_COLOR0_ = (_e302 * _e303);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e28 = vs_TEXCOORD0_;
    let _e30 = vs_TEXCOORD2_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e28, _e30, _e32, _e34);
}
