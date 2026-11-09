struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 7>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 4>,
}

struct v_buffer3_ {
    v_cb3_: array<vec4<f32>, 3>,
}

struct VertexOutput {
    @location(12) vs_NORMAL0_: vec3<f32>,
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(1) vs_TEXCOORD1_: vec2<f32>,
    @location(2) vs_TEXCOORD2_: vec3<f32>,
    @location(3) vs_TEXCOORDindex3_: vec4<f32>,
    @builtin(position) gl_Position: vec4<f32>,
}

@group(0) @binding(0) 
var<uniform> _v_buffer0_: v_buffer0_;
@group(0) @binding(1) 
var<uniform> _v_buffer1_: v_buffer1_;
@group(0) @binding(2) 
var<uniform> _v_buffer2_: v_buffer2_;
@group(0) @binding(3) 
var<uniform> _v_buffer3_: v_buffer3_;
var<private> in_POSITION0_1: vec4<f32>;
var<private> in_NORMAL0_1: vec3<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> in_TEXCOORD1_1: vec2<f32>;
var<private> vs_NORMAL0_: vec3<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD1_: vec2<f32>;
var<private> vs_TEXCOORD2_: vec3<f32>;
var<private> vs_TEXCOORDindex3_: vec4<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat6_: f32 = 0f;

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
    let _e99 = in_NORMAL0_1;
    let _e104 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e99.xyz, _e104.xyz);
    let _e108 = in_NORMAL0_1;
    let _e113 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e108.xyz, _e113.xyz);
    let _e117 = in_NORMAL0_1;
    let _e122 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e117.xyz, _e122.xyz);
    let _e125 = u_xlat1_;
    let _e127 = u_xlat1_;
    u_xlat6_ = dot(_e125.xyz, _e127.xyz);
    let _e130 = u_xlat6_;
    u_xlat6_ = max(_e130, 0.000000000000000000000000000000000000011754944f);
    let _e133 = u_xlat6_;
    u_xlat6_ = inverseSqrt(_e133);
    let _e135 = u_xlat1_;
    let _e137 = u_xlat6_;
    let _e139 = u_xlat1_;
    let _e141 = (vec3(_e137) * _e139.xyz);
    u_xlat1_.x = _e141.x;
    u_xlat1_.y = _e141.y;
    u_xlat1_.z = _e141.z;
    let _e148 = vs_NORMAL0_;
    let _e150 = u_xlat1_;
    let _e151 = _e150.xyz;
    vs_NORMAL0_.x = _e151.x;
    vs_NORMAL0_.y = _e151.y;
    vs_NORMAL0_.z = _e151.z;
    let _e158 = u_xlat1_;
    let _e160 = u_xlat1_;
    let _e162 = in_TEXCOORD1_1;
    let _e165 = (_e160.xz * -(_e162.xx));
    u_xlat1_.x = _e165.x;
    u_xlat1_.y = _e165.y;
    let _e170 = u_xlat1_;
    let _e172 = u_xlat1_;
    let _e178 = u_xlat0_;
    let _e180 = ((_e172.xy * vec2<f32>(0.3f, 0.3f)) + _e178.xz);
    u_xlat1_.x = _e180.x;
    u_xlat1_.y = _e180.y;
    let _e188 = _v_buffer0_.v_cb0_[15];
    let _e193 = _v_buffer3_.v_cb3_[2];
    u_xlat6_ = (_e188.x * _e193.y);
    let _e196 = vs_TEXCOORD1_;
    let _e198 = u_xlat1_;
    let _e204 = u_xlat6_;
    let _e206 = ((_e198.xy * vec2<f32>(0.07f, 0.07f)) + vec2(_e204));
    vs_TEXCOORD1_.x = _e206.x;
    vs_TEXCOORD1_.y = _e206.y;
    let _e211 = vs_TEXCOORD0_;
    let _e213 = in_TEXCOORD0_1;
    let _e214 = _e213.xy;
    vs_TEXCOORD0_.x = _e214.x;
    vs_TEXCOORD0_.y = _e214.y;
    let _e219 = vs_TEXCOORD2_;
    let _e221 = u_xlat0_;
    let _e222 = _e221.xyz;
    vs_TEXCOORD2_.x = _e222.x;
    vs_TEXCOORD2_.y = _e222.y;
    vs_TEXCOORD2_.z = _e222.z;
    let _e229 = u_xlat1_;
    let _e231 = u_xlat0_;
    let _e236 = _v_buffer2_.v_cb2_[1];
    let _e238 = (_e231.yyy * _e236.xyz);
    u_xlat1_.x = _e238.x;
    u_xlat1_.y = _e238.y;
    u_xlat1_.z = _e238.z;
    let _e245 = u_xlat0_;
    let _e250 = _v_buffer2_.v_cb2_[0];
    let _e252 = u_xlat0_;
    let _e255 = u_xlat1_;
    let _e257 = ((_e250.xyz * _e252.xxx) + _e255.xyz);
    u_xlat0_.x = _e257.x;
    u_xlat0_.y = _e257.y;
    u_xlat0_.w = _e257.z;
    let _e264 = u_xlat0_;
    let _e269 = _v_buffer2_.v_cb2_[2];
    let _e271 = u_xlat0_;
    let _e274 = u_xlat0_;
    let _e276 = ((_e269.xyz * _e271.zzz) + _e274.xyw);
    u_xlat0_.x = _e276.x;
    u_xlat0_.y = _e276.y;
    u_xlat0_.z = _e276.z;
    let _e283 = vs_TEXCOORDindex3_;
    let _e285 = u_xlat0_;
    let _e290 = _v_buffer2_.v_cb2_[3];
    let _e292 = (_e285.xyz + _e290.xyz);
    vs_TEXCOORDindex3_.x = _e292.x;
    vs_TEXCOORDindex3_.y = _e292.y;
    vs_TEXCOORDindex3_.z = _e292.z;
    vs_TEXCOORDindex3_.w = 0f;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(5) in_TEXCOORD1_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_TEXCOORD1_1 = in_TEXCOORD1_;
    main_1();
    let _e39 = vs_NORMAL0_;
    let _e41 = vs_TEXCOORD0_;
    let _e43 = vs_TEXCOORD1_;
    let _e45 = vs_TEXCOORD2_;
    let _e47 = vs_TEXCOORDindex3_;
    let _e49 = gl_Position;
    return VertexOutput(_e39, _e41, _e43, _e45, _e47, _e49);
}
