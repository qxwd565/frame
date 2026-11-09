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
var<private> in_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD0_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlatb4_: bool = false;
    var local: f32;

    let _e32 = in_POSITION0_1;
    let _e37 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e32.yyyy * _e37);
    let _e42 = _v_buffer1_.v_cb1_[0];
    let _e43 = in_POSITION0_1;
    let _e46 = u_xlat0_;
    u_xlat0_ = ((_e42 * _e43.xxxx) + _e46);
    let _e51 = _v_buffer1_.v_cb1_[2];
    let _e52 = in_POSITION0_1;
    let _e55 = u_xlat0_;
    u_xlat0_ = ((_e51 * _e52.zzzz) + _e55);
    let _e57 = u_xlat0_;
    let _e61 = _v_buffer1_.v_cb1_[3];
    u_xlat0_ = (_e57 + _e61);
    let _e63 = u_xlat0_;
    let _e68 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e63.yyyy * _e68);
    let _e73 = _v_buffer0_.v_cb0_[79];
    let _e74 = u_xlat0_;
    let _e77 = u_xlat1_;
    u_xlat1_ = ((_e73 * _e74.xxxx) + _e77);
    let _e82 = _v_buffer0_.v_cb0_[81];
    let _e83 = u_xlat0_;
    let _e86 = u_xlat1_;
    u_xlat1_ = ((_e82 * _e83.zzzz) + _e86);
    let _e92 = _v_buffer0_.v_cb0_[82];
    let _e93 = u_xlat0_;
    let _e96 = u_xlat1_;
    gl_Position = ((_e92 * _e93.wwww) + _e96);
    let _e102 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = floor(_e102.z);
    let _e106 = u_xlat0_;
    u_xlat0_.y = (_e106.x + -1.001f);
    let _e111 = u_xlat0_;
    let _e113 = u_xlat0_;
    let _e118 = _v_buffer2_.v_cb2_[2];
    let _e120 = (_e113.xy / _e118.xx);
    u_xlat0_.x = _e120.x;
    u_xlat0_.y = _e120.y;
    let _e125 = u_xlat0_;
    let _e127 = u_xlat0_;
    u_xlatb4_ = (_e125.y >= -(_e127.y));
    let _e131 = u_xlat0_;
    u_xlat2_ = fract(abs(_e131.y));
    let _e135 = u_xlatb4_;
    if _e135 {
        let _e136 = u_xlat2_;
        local = _e136;
    } else {
        let _e137 = u_xlat2_;
        local = -(_e137);
    }
    let _e140 = local;
    u_xlat2_ = _e140;
    let _e142 = u_xlat2_;
    let _e146 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.y = (_e142 * _e146.x);
    let _e149 = u_xlat0_;
    let _e151 = u_xlat0_;
    let _e153 = ceil(_e151.xy);
    u_xlat0_.x = _e153.x;
    u_xlat0_.y = _e153.y;
    let _e158 = u_xlat4_;
    let _e160 = in_TEXCOORD0_1;
    let _e165 = _v_buffer2_.v_cb2_[2];
    let _e167 = (_e160.xy / _e165.xy);
    u_xlat4_.x = _e167.x;
    u_xlat4_.y = _e167.y;
    let _e172 = u_xlat1_;
    let _e180 = _v_buffer2_.v_cb2_[2];
    let _e182 = (vec2<f32>(1f, 1f) / _e180.xy);
    u_xlat1_.x = _e182.x;
    u_xlat1_.y = _e182.y;
    let _e188 = u_xlat0_;
    let _e190 = u_xlat1_;
    let _e193 = u_xlat4_;
    vs_TEXCOORD0_.z = ((_e188.y * _e190.x) + _e193.x);
    let _e197 = u_xlat0_;
    let _e200 = u_xlat1_;
    let _e203 = u_xlat4_;
    vs_TEXCOORD0_.w = ((-(_e197.x) * _e200.y) + _e203.y);
    let _e206 = vs_TEXCOORD0_;
    let _e208 = in_TEXCOORD0_1;
    let _e213 = _v_buffer2_.v_cb2_[0];
    let _e219 = _v_buffer2_.v_cb2_[0];
    let _e221 = ((_e208.xy * _e213.xy) + _e219.zw);
    vs_TEXCOORD0_.x = _e221.x;
    vs_TEXCOORD0_.y = _e221.y;
    let _e230 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e230.w);
    let _e237 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e237.w);
    let _e244 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e244.w);
    let _e247 = u_xlat0_;
    let _e249 = u_xlat0_;
    let _e251 = log2(_e249.xyz);
    u_xlat0_.x = _e251.x;
    u_xlat0_.y = _e251.y;
    u_xlat0_.z = _e251.z;
    let _e258 = u_xlat0_;
    let _e260 = u_xlat0_;
    let _e266 = (_e260.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e266.x;
    u_xlat0_.y = _e266.y;
    u_xlat0_.z = _e266.z;
    let _e273 = u_xlat0_;
    let _e275 = u_xlat0_;
    let _e277 = exp2(_e275.xyz);
    u_xlat0_.x = _e277.x;
    u_xlat0_.y = _e277.y;
    u_xlat0_.z = _e277.z;
    let _e284 = u_xlat0_;
    let _e286 = u_xlat0_;
    let _e300 = ((_e286.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e300.x;
    u_xlat0_.y = _e300.y;
    u_xlat0_.z = _e300.z;
    let _e307 = u_xlat0_;
    let _e309 = u_xlat0_;
    let _e315 = clamp(_e309.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e315.x;
    u_xlat0_.y = _e315.y;
    u_xlat0_.z = _e315.z;
    let _e322 = u_xlat0_;
    let _e324 = u_xlat0_;
    let _e329 = _v_buffer0_.v_cb0_[6];
    let _e331 = (_e324.xyz + _e329.xyz);
    u_xlat0_.x = _e331.x;
    u_xlat0_.y = _e331.y;
    u_xlat0_.z = _e331.z;
    u_xlat0_.w = 1f;
    let _e340 = u_xlat0_;
    let _e341 = in_COLOR0_1;
    u_xlat0_ = (_e340 + -(_e341));
    let _e347 = _v_buffer2_.v_cb2_[2];
    let _e349 = u_xlat0_;
    let _e351 = in_COLOR0_1;
    u_xlat0_ = ((_e347.wwww * _e349) + _e351);
    let _e353 = u_xlat0_;
    let _e357 = _v_buffer2_.v_cb2_[1];
    vs_COLOR0_ = (_e353 * _e357);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e26 = vs_TEXCOORD0_;
    let _e28 = vs_COLOR0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
