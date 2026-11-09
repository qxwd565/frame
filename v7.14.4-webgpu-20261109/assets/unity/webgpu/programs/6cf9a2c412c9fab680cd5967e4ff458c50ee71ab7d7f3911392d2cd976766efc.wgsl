struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 134>,
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
    var u_xlat3_: f32 = 0f;
    var u_xlatb3_: bool = false;
    var u_xlat6_: f32 = 0f;
    var local: f32;

    let _e25 = u_xlat0_;
    let _e27 = in_POSITION0_1;
    let _e32 = _v_buffer1_.v_cb1_[1];
    let _e34 = (_e27.yyy * _e32.xyz);
    u_xlat0_.x = _e34.x;
    u_xlat0_.y = _e34.y;
    u_xlat0_.z = _e34.z;
    let _e41 = u_xlat0_;
    let _e46 = _v_buffer1_.v_cb1_[0];
    let _e48 = in_POSITION0_1;
    let _e51 = u_xlat0_;
    let _e53 = ((_e46.xyz * _e48.xxx) + _e51.xyz);
    u_xlat0_.x = _e53.x;
    u_xlat0_.y = _e53.y;
    u_xlat0_.z = _e53.z;
    let _e60 = u_xlat0_;
    let _e65 = _v_buffer1_.v_cb1_[2];
    let _e67 = in_POSITION0_1;
    let _e70 = u_xlat0_;
    let _e72 = ((_e65.xyz * _e67.zzz) + _e70.xyz);
    u_xlat0_.x = _e72.x;
    u_xlat0_.y = _e72.y;
    u_xlat0_.z = _e72.z;
    let _e79 = u_xlat0_;
    let _e81 = u_xlat0_;
    let _e86 = _v_buffer1_.v_cb1_[3];
    let _e88 = (_e81.xyz + _e86.xyz);
    u_xlat0_.x = _e88.x;
    u_xlat0_.y = _e88.y;
    u_xlat0_.z = _e88.z;
    let _e95 = u_xlat0_;
    let _e100 = _v_buffer0_.v_cb0_[133];
    let _e105 = _v_buffer0_.v_cb0_[132];
    let _e108 = u_xlat0_;
    let _e110 = ((_e100.xyz * _e105.xxx) + _e108.xyz);
    u_xlat0_.x = _e110.x;
    u_xlat0_.y = _e110.y;
    u_xlat0_.z = _e110.z;
    let _e118 = in_NORMAL0_1;
    let _e123 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e118.xyz, _e123.xyz);
    let _e127 = in_NORMAL0_1;
    let _e132 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e127.xyz, _e132.xyz);
    let _e136 = in_NORMAL0_1;
    let _e141 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e136.xyz, _e141.xyz);
    let _e144 = u_xlat1_;
    let _e146 = u_xlat1_;
    u_xlat6_ = dot(_e144.xyz, _e146.xyz);
    let _e149 = u_xlat6_;
    u_xlat6_ = max(_e149, 0.000000000000000000000000000000000000011754944f);
    let _e152 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e152);
    let _e154 = u_xlat1_;
    let _e156 = u_xlat6_;
    let _e158 = u_xlat1_;
    let _e160 = (vec3(_e156) * _e158.xyz);
    u_xlat1_.x = _e160.x;
    u_xlat1_.y = _e160.y;
    u_xlat1_.z = _e160.z;
    let _e170 = _v_buffer0_.v_cb0_[133];
    let _e172 = u_xlat1_;
    u_xlat6_ = dot(_e170.xyz, _e172.xyz);
    let _e175 = u_xlat6_;
    u_xlat6_ = clamp(_e175, 0f, 1f);
    let _e179 = u_xlat6_;
    u_xlat6_ = (-(_e179) + 1f);
    let _e183 = u_xlat6_;
    let _e187 = _v_buffer0_.v_cb0_[132];
    u_xlat6_ = (_e183 * _e187.y);
    let _e190 = u_xlat0_;
    let _e192 = u_xlat1_;
    let _e194 = u_xlat6_;
    let _e197 = u_xlat0_;
    let _e199 = ((_e192.xyz * vec3(_e194)) + _e197.xyz);
    u_xlat0_.x = _e199.x;
    u_xlat0_.y = _e199.y;
    u_xlat0_.z = _e199.z;
    let _e206 = u_xlat0_;
    let _e211 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e206.yyyy * _e211);
    let _e216 = _v_buffer0_.v_cb0_[79];
    let _e217 = u_xlat0_;
    let _e220 = u_xlat1_;
    u_xlat1_ = ((_e216 * _e217.xxxx) + _e220);
    let _e225 = _v_buffer0_.v_cb0_[81];
    let _e226 = u_xlat0_;
    let _e229 = u_xlat1_;
    u_xlat0_ = ((_e225 * _e226.zzzz) + _e229);
    let _e231 = u_xlat0_;
    let _e235 = _v_buffer0_.v_cb0_[82];
    u_xlat0_ = (_e231 + _e235);
    let _e238 = u_xlat0_;
    let _e240 = u_xlat0_;
    u_xlat1_.x = min(_e238.w, _e240.z);
    let _e244 = u_xlat0_;
    let _e247 = u_xlat1_;
    u_xlat1_.x = (-(_e244.z) + _e247.x);
    let _e253 = _v_buffer0_.v_cb0_[132];
    u_xlat3_ = round(_e253.z);
    let _e256 = u_xlat3_;
    u_xlatb3_ = (_e256 == 1f);
    let _e259 = u_xlatb3_;
    if _e259 {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e264 = local;
    u_xlat3_ = _e264;
    let _e267 = u_xlat3_;
    let _e268 = u_xlat1_;
    let _e271 = u_xlat0_;
    gl_Position.z = ((_e267 * _e268.x) + _e271.z);
    let _e274 = gl_Position;
    let _e276 = u_xlat0_;
    let _e277 = _e276.xyw;
    gl_Position.x = _e277.x;
    gl_Position.y = _e277.y;
    gl_Position.w = _e277.z;
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
