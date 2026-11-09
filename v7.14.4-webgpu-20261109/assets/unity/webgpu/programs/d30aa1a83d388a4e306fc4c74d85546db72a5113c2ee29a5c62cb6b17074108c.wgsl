struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 134>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: vec4<f32>,
}

struct VertexOutput {
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
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlatb3_: bool = false;
    var u_xlat6_: f32 = 0f;
    var local: f32;

    let _e30 = vs_TEXCOORD0_;
    let _e32 = in_TEXCOORD0_1;
    let _e34 = _v_buffer2_;
    let _e38 = _v_buffer2_;
    let _e41 = ((_e32.xy * _e34.v_cb2_.xy) + _e38.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e41.x;
    vs_TEXCOORD0_.y = _e41.y;
    let _e46 = u_xlat0_;
    let _e48 = in_POSITION0_1;
    let _e53 = _v_buffer1_.v_cb1_[1];
    let _e55 = (_e48.yyy * _e53.xyz);
    u_xlat0_.x = _e55.x;
    u_xlat0_.y = _e55.y;
    u_xlat0_.z = _e55.z;
    let _e62 = u_xlat0_;
    let _e67 = _v_buffer1_.v_cb1_[0];
    let _e69 = in_POSITION0_1;
    let _e72 = u_xlat0_;
    let _e74 = ((_e67.xyz * _e69.xxx) + _e72.xyz);
    u_xlat0_.x = _e74.x;
    u_xlat0_.y = _e74.y;
    u_xlat0_.z = _e74.z;
    let _e81 = u_xlat0_;
    let _e86 = _v_buffer1_.v_cb1_[2];
    let _e88 = in_POSITION0_1;
    let _e91 = u_xlat0_;
    let _e93 = ((_e86.xyz * _e88.zzz) + _e91.xyz);
    u_xlat0_.x = _e93.x;
    u_xlat0_.y = _e93.y;
    u_xlat0_.z = _e93.z;
    let _e100 = u_xlat0_;
    let _e102 = u_xlat0_;
    let _e107 = _v_buffer1_.v_cb1_[3];
    let _e109 = (_e102.xyz + _e107.xyz);
    u_xlat0_.x = _e109.x;
    u_xlat0_.y = _e109.y;
    u_xlat0_.z = _e109.z;
    let _e116 = u_xlat0_;
    let _e121 = _v_buffer0_.v_cb0_[133];
    let _e126 = _v_buffer0_.v_cb0_[132];
    let _e129 = u_xlat0_;
    let _e131 = ((_e121.xyz * _e126.xxx) + _e129.xyz);
    u_xlat0_.x = _e131.x;
    u_xlat0_.y = _e131.y;
    u_xlat0_.z = _e131.z;
    let _e139 = in_NORMAL0_1;
    let _e144 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e139.xyz, _e144.xyz);
    let _e148 = in_NORMAL0_1;
    let _e153 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e148.xyz, _e153.xyz);
    let _e157 = in_NORMAL0_1;
    let _e162 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e157.xyz, _e162.xyz);
    let _e165 = u_xlat1_;
    let _e167 = u_xlat1_;
    u_xlat6_ = dot(_e165.xyz, _e167.xyz);
    let _e170 = u_xlat6_;
    u_xlat6_ = max(_e170, 0.000000000000000000000000000000000000011754944f);
    let _e173 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e173);
    let _e175 = u_xlat1_;
    let _e177 = u_xlat6_;
    let _e179 = u_xlat1_;
    let _e181 = (vec3(_e177) * _e179.xyz);
    u_xlat1_.x = _e181.x;
    u_xlat1_.y = _e181.y;
    u_xlat1_.z = _e181.z;
    let _e191 = _v_buffer0_.v_cb0_[133];
    let _e193 = u_xlat1_;
    u_xlat6_ = dot(_e191.xyz, _e193.xyz);
    let _e196 = u_xlat6_;
    u_xlat6_ = clamp(_e196, 0f, 1f);
    let _e200 = u_xlat6_;
    u_xlat6_ = (-(_e200) + 1f);
    let _e204 = u_xlat6_;
    let _e208 = _v_buffer0_.v_cb0_[132];
    u_xlat6_ = (_e204 * _e208.y);
    let _e211 = u_xlat0_;
    let _e213 = u_xlat1_;
    let _e215 = u_xlat6_;
    let _e218 = u_xlat0_;
    let _e220 = ((_e213.xyz * vec3(_e215)) + _e218.xyz);
    u_xlat0_.x = _e220.x;
    u_xlat0_.y = _e220.y;
    u_xlat0_.z = _e220.z;
    let _e227 = u_xlat0_;
    let _e232 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e227.yyyy * _e232);
    let _e237 = _v_buffer0_.v_cb0_[79];
    let _e238 = u_xlat0_;
    let _e241 = u_xlat1_;
    u_xlat1_ = ((_e237 * _e238.xxxx) + _e241);
    let _e246 = _v_buffer0_.v_cb0_[81];
    let _e247 = u_xlat0_;
    let _e250 = u_xlat1_;
    u_xlat0_ = ((_e246 * _e247.zzzz) + _e250);
    let _e252 = u_xlat0_;
    let _e256 = _v_buffer0_.v_cb0_[82];
    u_xlat0_ = (_e252 + _e256);
    let _e259 = u_xlat0_;
    let _e261 = u_xlat0_;
    u_xlat1_.x = min(_e259.w, _e261.z);
    let _e265 = u_xlat0_;
    let _e268 = u_xlat1_;
    u_xlat1_.x = (-(_e265.z) + _e268.x);
    let _e274 = _v_buffer0_.v_cb0_[132];
    u_xlat3_ = round(_e274.z);
    let _e277 = u_xlat3_;
    u_xlatb3_ = (_e277 == 1f);
    let _e280 = u_xlatb3_;
    if _e280 {
        local = 1f;
    } else {
        local = 0f;
    }
    let _e285 = local;
    u_xlat3_ = _e285;
    let _e288 = u_xlat3_;
    let _e289 = u_xlat1_;
    let _e292 = u_xlat0_;
    gl_Position.z = ((_e288 * _e289.x) + _e292.z);
    let _e295 = gl_Position;
    let _e297 = u_xlat0_;
    let _e298 = _e297.xyw;
    gl_Position.x = _e298.x;
    gl_Position.y = _e298.y;
    gl_Position.w = _e298.z;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e24 = vs_TEXCOORD0_;
    let _e26 = gl_Position;
    return VertexOutput(_e24, _e26);
}
