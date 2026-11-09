struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 30>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 8>,
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
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e27 = in_POSITION0_1;
    let _e32 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e27.yyyy * _e32);
    let _e37 = _v_buffer1_.v_cb1_[0];
    let _e38 = in_POSITION0_1;
    let _e41 = u_xlat0_;
    u_xlat0_ = ((_e37 * _e38.xxxx) + _e41);
    let _e46 = _v_buffer1_.v_cb1_[2];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.zzzz) + _e50);
    let _e52 = u_xlat0_;
    let _e56 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e52 + _e56);
    let _e58 = u_xlat0_;
    let _e63 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e58.yyyy * _e63);
    let _e68 = _v_buffer0_.v_cb0_[79];
    let _e69 = u_xlat0_;
    let _e72 = u_xlat1_;
    u_xlat1_ = ((_e68 * _e69.xxxx) + _e72);
    let _e77 = _v_buffer0_.v_cb0_[81];
    let _e78 = u_xlat0_;
    let _e81 = u_xlat1_;
    u_xlat1_ = ((_e77 * _e78.zzzz) + _e81);
    let _e87 = _v_buffer0_.v_cb0_[82];
    let _e88 = u_xlat0_;
    let _e91 = u_xlat1_;
    gl_Position = ((_e87 * _e88.wwww) + _e91);
    let _e97 = _v_buffer2_.v_cb2_[0];
    let _e102 = _v_buffer0_.v_cb0_[15];
    let _e105 = in_TEXCOORD0_1;
    u_xlat4_.x = ((_e97.w * _e102.x) + _e105.x);
    let _e112 = _v_buffer2_.v_cb2_[1];
    let _e117 = _v_buffer0_.v_cb0_[15];
    let _e120 = in_TEXCOORD0_1;
    u_xlat4_.y = ((_e112.x * _e117.x) + _e120.y);
    let _e123 = vs_TEXCOORD1_;
    let _e125 = u_xlat4_;
    let _e130 = _v_buffer2_.v_cb2_[1];
    let _e132 = (_e125.xy * _e130.yy);
    vs_TEXCOORD1_.x = _e132.x;
    vs_TEXCOORD1_.y = _e132.y;
    let _e137 = vs_TEXCOORD0_;
    let _e139 = in_TEXCOORD0_1;
    let _e144 = _v_buffer2_.v_cb2_[6];
    let _e150 = _v_buffer2_.v_cb2_[6];
    let _e152 = ((_e139.xy * _e144.xy) + _e150.zw);
    vs_TEXCOORD0_.x = _e152.x;
    vs_TEXCOORD0_.y = _e152.y;
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
    let _e292 = _v_buffer2_.v_cb2_[7];
    let _e294 = u_xlat0_;
    u_xlat0_ = ((_e292.xxxx * _e294) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e302 = u_xlat0_;
    let _e303 = in_COLOR0_1;
    u_xlat0_ = (_e302 * _e303);
    let _e305 = u_xlat0_;
    let _e309 = _v_buffer2_.v_cb2_[2];
    vs_COLOR0_ = (_e305 * _e309);
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
