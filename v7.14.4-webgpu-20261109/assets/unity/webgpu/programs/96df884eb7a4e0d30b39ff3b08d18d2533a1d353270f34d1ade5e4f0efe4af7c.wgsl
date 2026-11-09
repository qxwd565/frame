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
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e21 = in_POSITION0_1;
    let _e26 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e21.yyyy * _e26);
    let _e31 = _v_buffer1_.v_cb1_[0];
    let _e32 = in_POSITION0_1;
    let _e35 = u_xlat0_;
    u_xlat0_ = ((_e31 * _e32.xxxx) + _e35);
    let _e40 = _v_buffer1_.v_cb1_[2];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    u_xlat0_ = ((_e40 * _e41.zzzz) + _e44);
    let _e46 = u_xlat0_;
    let _e50 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e46 + _e50);
    let _e52 = u_xlat0_;
    let _e57 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e52.yyyy * _e57);
    let _e62 = _v_buffer0_.v_cb0_[79];
    let _e63 = u_xlat0_;
    let _e66 = u_xlat1_;
    u_xlat1_ = ((_e62 * _e63.xxxx) + _e66);
    let _e71 = _v_buffer0_.v_cb0_[81];
    let _e72 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_ = ((_e71 * _e72.zzzz) + _e75);
    let _e81 = _v_buffer0_.v_cb0_[82];
    let _e82 = u_xlat0_;
    let _e85 = u_xlat1_;
    gl_Position = ((_e81 * _e82.wwww) + _e85);
    let _e87 = u_xlat0_;
    let _e92 = _v_buffer0_.v_cb0_[15];
    let _e97 = _v_buffer2_.v_cb2_[5];
    let _e99 = (_e92.xx * _e97.yx);
    u_xlat0_.x = _e99.x;
    u_xlat0_.y = _e99.y;
    let _e104 = vs_TEXCOORD0_;
    let _e106 = in_TEXCOORD0_1;
    let _e111 = _v_buffer2_.v_cb2_[5];
    let _e114 = u_xlat0_;
    let _e116 = ((_e106.xy * _e111.zw) + _e114.xy);
    vs_TEXCOORD0_.z = _e116.x;
    vs_TEXCOORD0_.w = _e116.y;
    let _e121 = vs_TEXCOORD0_;
    let _e123 = in_TEXCOORD0_1;
    let _e128 = _v_buffer2_.v_cb2_[4];
    let _e134 = _v_buffer2_.v_cb2_[4];
    let _e136 = ((_e123.xy * _e128.xy) + _e134.zw);
    vs_TEXCOORD0_.x = _e136.x;
    vs_TEXCOORD0_.y = _e136.y;
    let _e145 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e145.w);
    let _e152 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e152.w);
    let _e159 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e159.w);
    let _e162 = u_xlat0_;
    let _e164 = u_xlat0_;
    let _e166 = log2(_e164.xyz);
    u_xlat0_.x = _e166.x;
    u_xlat0_.y = _e166.y;
    u_xlat0_.z = _e166.z;
    let _e173 = u_xlat0_;
    let _e175 = u_xlat0_;
    let _e181 = (_e175.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e181.x;
    u_xlat0_.y = _e181.y;
    u_xlat0_.z = _e181.z;
    let _e188 = u_xlat0_;
    let _e190 = u_xlat0_;
    let _e192 = exp2(_e190.xyz);
    u_xlat0_.x = _e192.x;
    u_xlat0_.y = _e192.y;
    u_xlat0_.z = _e192.z;
    let _e199 = u_xlat0_;
    let _e201 = u_xlat0_;
    let _e215 = ((_e201.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e215.x;
    u_xlat0_.y = _e215.y;
    u_xlat0_.z = _e215.z;
    let _e222 = u_xlat0_;
    let _e224 = u_xlat0_;
    let _e230 = clamp(_e224.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e230.x;
    u_xlat0_.y = _e230.y;
    u_xlat0_.z = _e230.z;
    let _e237 = u_xlat0_;
    let _e239 = u_xlat0_;
    let _e244 = _v_buffer0_.v_cb0_[6];
    let _e246 = (_e239.xyz + _e244.xyz);
    u_xlat0_.x = _e246.x;
    u_xlat0_.y = _e246.y;
    u_xlat0_.z = _e246.z;
    let _e253 = u_xlat0_;
    let _e255 = u_xlat0_;
    let _e264 = (_e255.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e264.x;
    u_xlat0_.y = _e264.y;
    u_xlat0_.z = _e264.z;
    u_xlat0_.w = 0f;
    let _e276 = _v_buffer2_.v_cb2_[6];
    let _e278 = u_xlat0_;
    u_xlat0_ = ((_e276.xxxx * _e278) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e286 = u_xlat0_;
    let _e290 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e286 * _e290);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e22 = vs_TEXCOORD0_;
    let _e24 = vs_COLOR0_;
    let _e26 = gl_Position;
    return VertexOutput(_e22, _e24, _e26);
}
