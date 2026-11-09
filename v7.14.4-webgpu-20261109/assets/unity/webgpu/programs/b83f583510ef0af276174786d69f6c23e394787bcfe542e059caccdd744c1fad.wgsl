struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 131>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct VertexOutput {
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

    let _e19 = u_xlat0_;
    let _e21 = in_POSITION0_1;
    let _e26 = _v_buffer1_.v_cb1_[1];
    let _e28 = (_e21.yyy * _e26.xyz);
    u_xlat0_.x = _e28.x;
    u_xlat0_.y = _e28.y;
    u_xlat0_.z = _e28.z;
    let _e35 = u_xlat0_;
    let _e40 = _v_buffer1_.v_cb1_[0];
    let _e42 = in_POSITION0_1;
    let _e45 = u_xlat0_;
    let _e47 = ((_e40.xyz * _e42.xxx) + _e45.xyz);
    u_xlat0_.x = _e47.x;
    u_xlat0_.y = _e47.y;
    u_xlat0_.z = _e47.z;
    let _e54 = u_xlat0_;
    let _e59 = _v_buffer1_.v_cb1_[2];
    let _e61 = in_POSITION0_1;
    let _e64 = u_xlat0_;
    let _e66 = ((_e59.xyz * _e61.zzz) + _e64.xyz);
    u_xlat0_.x = _e66.x;
    u_xlat0_.y = _e66.y;
    u_xlat0_.z = _e66.z;
    let _e73 = u_xlat0_;
    let _e75 = u_xlat0_;
    let _e80 = _v_buffer1_.v_cb1_[3];
    let _e82 = (_e75.xyz + _e80.xyz);
    u_xlat0_.x = _e82.x;
    u_xlat0_.y = _e82.y;
    u_xlat0_.z = _e82.z;
    let _e89 = u_xlat0_;
    let _e94 = _v_buffer0_.v_cb0_[5];
    let _e99 = _v_buffer0_.v_cb0_[130];
    let _e102 = u_xlat0_;
    let _e104 = ((_e94.xyz * _e99.xxx) + _e102.xyz);
    u_xlat0_.x = _e104.x;
    u_xlat0_.y = _e104.y;
    u_xlat0_.z = _e104.z;
    let _e112 = in_NORMAL0_1;
    let _e117 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e112.xyz, _e117.xyz);
    let _e121 = in_NORMAL0_1;
    let _e126 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e121.xyz, _e126.xyz);
    let _e130 = in_NORMAL0_1;
    let _e135 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e130.xyz, _e135.xyz);
    let _e138 = u_xlat1_;
    let _e140 = u_xlat1_;
    u_xlat6_ = dot(_e138.xyz, _e140.xyz);
    let _e143 = u_xlat6_;
    u_xlat6_ = max(_e143, 0.000000000000000000000000000000000000011754944f);
    let _e146 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e146);
    let _e148 = u_xlat1_;
    let _e150 = u_xlat6_;
    let _e152 = u_xlat1_;
    let _e154 = (vec3(_e150) * _e152.xyz);
    u_xlat1_.x = _e154.x;
    u_xlat1_.y = _e154.y;
    u_xlat1_.z = _e154.z;
    let _e164 = _v_buffer0_.v_cb0_[5];
    let _e166 = u_xlat1_;
    u_xlat6_ = dot(_e164.xyz, _e166.xyz);
    let _e169 = u_xlat6_;
    u_xlat6_ = clamp(_e169, 0f, 1f);
    let _e173 = u_xlat6_;
    u_xlat6_ = (-(_e173) + 1f);
    let _e177 = u_xlat6_;
    let _e181 = _v_buffer0_.v_cb0_[130];
    u_xlat6_ = (_e177 * _e181.y);
    let _e184 = u_xlat0_;
    let _e186 = u_xlat1_;
    let _e188 = u_xlat6_;
    let _e191 = u_xlat0_;
    let _e193 = ((_e186.xyz * vec3(_e188)) + _e191.xyz);
    u_xlat0_.x = _e193.x;
    u_xlat0_.y = _e193.y;
    u_xlat0_.z = _e193.z;
    let _e200 = u_xlat0_;
    let _e205 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e200.yyyy * _e205);
    let _e210 = _v_buffer0_.v_cb0_[79];
    let _e211 = u_xlat0_;
    let _e214 = u_xlat1_;
    u_xlat1_ = ((_e210 * _e211.xxxx) + _e214);
    let _e219 = _v_buffer0_.v_cb0_[81];
    let _e220 = u_xlat0_;
    let _e223 = u_xlat1_;
    u_xlat0_ = ((_e219 * _e220.zzzz) + _e223);
    let _e225 = u_xlat0_;
    let _e229 = _v_buffer0_.v_cb0_[82];
    u_xlat0_ = (_e225 + _e229);
    let _e233 = u_xlat0_;
    gl_Position.z = max(_e233.z, 1f);
    let _e237 = gl_Position;
    let _e239 = u_xlat0_;
    let _e240 = _e239.xyw;
    gl_Position.x = _e240.x;
    gl_Position.y = _e240.y;
    gl_Position.w = _e240.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    main_1();
    let _e15 = gl_Position;
    return VertexOutput(_e15);
}
