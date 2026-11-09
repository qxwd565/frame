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
    @location(0) vs_TEXCOORD0_: vec3<f32>,
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
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec3<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: bool = false;
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec2<f32> = vec2(0f);
    var local: vec2<f32>;

    let _e30 = in_POSITION0_1;
    let _e35 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e30.yyyy * _e35);
    let _e40 = _v_buffer1_.v_cb1_[0];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    u_xlat0_ = ((_e40 * _e41.xxxx) + _e44);
    let _e49 = _v_buffer1_.v_cb1_[2];
    let _e50 = in_POSITION0_1;
    let _e53 = u_xlat0_;
    u_xlat0_ = ((_e49 * _e50.zzzz) + _e53);
    let _e55 = u_xlat0_;
    let _e59 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e55 + _e59);
    let _e61 = u_xlat0_;
    let _e66 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e61.yyyy * _e66);
    let _e71 = _v_buffer0_.v_cb0_[79];
    let _e72 = u_xlat0_;
    let _e75 = u_xlat1_;
    u_xlat1_ = ((_e71 * _e72.xxxx) + _e75);
    let _e80 = _v_buffer0_.v_cb0_[81];
    let _e81 = u_xlat0_;
    let _e84 = u_xlat1_;
    u_xlat1_ = ((_e80 * _e81.zzzz) + _e84);
    let _e90 = _v_buffer0_.v_cb0_[82];
    let _e91 = u_xlat0_;
    let _e94 = u_xlat1_;
    gl_Position = ((_e90 * _e91.wwww) + _e94);
    let _e99 = _v_buffer2_.v_cb2_[3];
    u_xlatb0_ = (_e99.y == 1f);
    let _e103 = u_xlat2_;
    let _e105 = in_TEXCOORD1_1;
    let _e110 = _v_buffer2_.v_cb2_[0];
    let _e116 = _v_buffer2_.v_cb2_[0];
    let _e118 = ((_e105.xy * _e110.xy) + _e116.zw);
    u_xlat2_.x = _e118.x;
    u_xlat2_.y = _e118.y;
    let _e123 = u_xlat1_;
    let _e125 = in_TEXCOORD0_1;
    let _e130 = _v_buffer2_.v_cb2_[0];
    let _e136 = _v_buffer2_.v_cb2_[0];
    let _e138 = ((_e125.xy * _e130.xy) + _e136.zw);
    u_xlat1_.x = _e138.x;
    u_xlat1_.y = _e138.y;
    let _e143 = vs_TEXCOORD0_;
    let _e145 = u_xlatb0_;
    if bool(_e145) {
        let _e147 = u_xlat2_;
        local = _e147.xy;
    } else {
        let _e149 = u_xlat1_;
        local = _e149.xy;
    }
    let _e152 = local;
    vs_TEXCOORD0_.x = _e152.x;
    vs_TEXCOORD0_.y = _e152.y;
    let _e158 = in_POSITION0_1;
    vs_TEXCOORD0_.z = _e158.x;
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
    u_xlat0_.w = 1f;
    let _e274 = u_xlat0_;
    let _e275 = in_COLOR0_1;
    u_xlat0_ = (_e274 + -(_e275));
    let _e281 = _v_buffer2_.v_cb2_[3];
    let _e283 = u_xlat0_;
    let _e285 = in_COLOR0_1;
    vs_COLOR0_ = ((_e281.xxxx * _e283) + _e285);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR0_;
    let _e34 = gl_Position;
    return VertexOutput(_e30, _e32, _e34);
}
