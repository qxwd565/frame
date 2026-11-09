struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 2>,
}

struct VertexOutput {
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(2) @binding(1) 
var samplerv_s0_: sampler;
@group(2) @binding(0) 
var v_t0_: texture_2d<f32>;
var<private> in_POSITION0_1: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);

    let _e20 = u_xlat0_;
    let _e22 = in_POSITION0_1;
    let _e27 = _v_buffer1_.v_cb1_[1];
    let _e29 = (_e22.yy * _e27.xy);
    u_xlat0_.x = _e29.x;
    u_xlat0_.y = _e29.y;
    let _e34 = u_xlat0_;
    let _e39 = _v_buffer1_.v_cb1_[0];
    let _e41 = in_POSITION0_1;
    let _e44 = u_xlat0_;
    let _e46 = ((_e39.xy * _e41.xx) + _e44.xy);
    u_xlat0_.x = _e46.x;
    u_xlat0_.y = _e46.y;
    let _e51 = u_xlat0_;
    let _e56 = _v_buffer1_.v_cb1_[2];
    let _e58 = in_POSITION0_1;
    let _e61 = u_xlat0_;
    let _e63 = ((_e56.xy * _e58.zz) + _e61.xy);
    u_xlat0_.x = _e63.x;
    u_xlat0_.y = _e63.y;
    let _e68 = u_xlat0_;
    let _e73 = _v_buffer1_.v_cb1_[3];
    let _e75 = in_POSITION0_1;
    let _e78 = u_xlat0_;
    let _e80 = ((_e73.xy * _e75.ww) + _e78.xy);
    u_xlat0_.x = _e80.x;
    u_xlat0_.y = _e80.y;
    let _e85 = u_xlat0_;
    let _e87 = u_xlat0_;
    let _e92 = _v_buffer2_.v_cb2_[0];
    let _e98 = _v_buffer2_.v_cb2_[0];
    let _e100 = ((_e87.xy * _e92.xy) + _e98.zw);
    u_xlat0_.x = _e100.x;
    u_xlat0_.y = _e100.y;
    let _e105 = u_xlat0_;
    let _e110 = _v_buffer0_.v_cb0_[15];
    let _e115 = _v_buffer2_.v_cb2_[1];
    let _e118 = u_xlat0_;
    let _e120 = ((_e110.xx * _e115.xx) + _e118.xy);
    u_xlat0_.x = _e120.x;
    u_xlat0_.y = _e120.y;
    let _e125 = u_xlat0_;
    let _e128 = textureSampleLevel(v_t0_, samplerv_s0_, _e125.xy, 0f);
    u_xlat0_ = _e128;
    let _e129 = u_xlat0_;
    let _e131 = u_xlat0_;
    let _e140 = (_e131.xyz + vec3<f32>(-0.5f, -0.5f, -0.5f));
    u_xlat0_.x = _e140.x;
    u_xlat0_.y = _e140.y;
    u_xlat0_.z = _e140.z;
    let _e147 = u_xlat0_;
    let _e149 = u_xlat0_;
    let _e155 = (_e149.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat0_.x = _e155.x;
    u_xlat0_.y = _e155.y;
    u_xlat0_.z = _e155.z;
    let _e162 = u_xlat0_;
    let _e164 = u_xlat0_;
    let _e169 = _v_buffer2_.v_cb2_[1];
    let _e172 = in_POSITION0_1;
    let _e174 = ((_e164.xyz * _e169.yyy) + _e172.xyz);
    u_xlat0_.x = _e174.x;
    u_xlat0_.y = _e174.y;
    u_xlat0_.z = _e174.z;
    let _e181 = u_xlat0_;
    let _e186 = _v_buffer1_.v_cb1_[1];
    u_xlat1_ = (_e181.yyyy * _e186);
    let _e191 = _v_buffer1_.v_cb1_[0];
    let _e192 = u_xlat0_;
    let _e195 = u_xlat1_;
    u_xlat1_ = ((_e191 * _e192.xxxx) + _e195);
    let _e200 = _v_buffer1_.v_cb1_[2];
    let _e201 = u_xlat0_;
    let _e204 = u_xlat1_;
    u_xlat0_ = ((_e200 * _e201.zzzz) + _e204);
    let _e206 = u_xlat0_;
    let _e210 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e206 + _e210);
    let _e212 = u_xlat0_;
    let _e217 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e212.yyyy * _e217);
    let _e222 = _v_buffer0_.v_cb0_[79];
    let _e223 = u_xlat0_;
    let _e226 = u_xlat1_;
    u_xlat1_ = ((_e222 * _e223.xxxx) + _e226);
    let _e231 = _v_buffer0_.v_cb0_[81];
    let _e232 = u_xlat0_;
    let _e235 = u_xlat1_;
    u_xlat1_ = ((_e231 * _e232.zzzz) + _e235);
    let _e241 = _v_buffer0_.v_cb0_[82];
    let _e242 = u_xlat0_;
    let _e245 = u_xlat1_;
    gl_Position = ((_e241 * _e242.wwww) + _e245);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    main_1();
    let _e18 = gl_Position;
    return VertexOutput(_e18);
}
