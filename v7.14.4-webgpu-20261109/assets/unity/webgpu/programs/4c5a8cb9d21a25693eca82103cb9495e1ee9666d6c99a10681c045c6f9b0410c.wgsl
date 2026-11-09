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
    @location(10) vs_COLOR0_: vec4<f32>,
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
var<private> in_COLOR0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec2<f32> = vec2(0f);

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
    let _e100 = _v_buffer1_.v_cb1_[27];
    u_xlat0_.x = abs(_e100.w);
    let _e107 = _v_buffer1_.v_cb1_[28];
    u_xlat0_.y = abs(_e107.w);
    let _e114 = _v_buffer1_.v_cb1_[29];
    u_xlat0_.z = abs(_e114.w);
    let _e117 = u_xlat0_;
    let _e119 = u_xlat0_;
    let _e121 = log2(_e119.xyz);
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    u_xlat0_.z = _e121.z;
    let _e128 = u_xlat0_;
    let _e130 = u_xlat0_;
    let _e136 = (_e130.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e136.x;
    u_xlat0_.y = _e136.y;
    u_xlat0_.z = _e136.z;
    let _e143 = u_xlat0_;
    let _e145 = u_xlat0_;
    let _e147 = exp2(_e145.xyz);
    u_xlat0_.x = _e147.x;
    u_xlat0_.y = _e147.y;
    u_xlat0_.z = _e147.z;
    let _e154 = u_xlat0_;
    let _e156 = u_xlat0_;
    let _e170 = ((_e156.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e170.x;
    u_xlat0_.y = _e170.y;
    u_xlat0_.z = _e170.z;
    let _e177 = u_xlat0_;
    let _e179 = u_xlat0_;
    let _e185 = clamp(_e179.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e185.x;
    u_xlat0_.y = _e185.y;
    u_xlat0_.z = _e185.z;
    let _e192 = u_xlat0_;
    let _e194 = u_xlat0_;
    let _e203 = (_e194.xyz + vec3<f32>(-1f, -1f, -1f));
    u_xlat0_.x = _e203.x;
    u_xlat0_.y = _e203.y;
    u_xlat0_.z = _e203.z;
    u_xlat0_.w = 0f;
    let _e215 = _v_buffer2_.v_cb2_[2];
    let _e217 = u_xlat0_;
    u_xlat0_ = ((_e215.yyyy * _e217) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e225 = in_COLOR0_1;
    let _e226 = in_COLOR0_1;
    u_xlat1_ = (_e225 + _e226);
    let _e228 = u_xlat1_;
    let _e232 = _v_buffer2_.v_cb2_[1];
    u_xlat1_ = (_e228 * _e232);
    let _e234 = u_xlat0_;
    let _e235 = u_xlat1_;
    vs_COLOR0_ = (_e234 * _e235);
    let _e241 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e241.z * 0.017453289f);
    let _e249 = _v_buffer2_.v_cb2_[2];
    let _e254 = _v_buffer0_.v_cb0_[15];
    let _e257 = u_xlat0_;
    u_xlat0_.x = ((_e249.x * _e254.x) + -(_e257.x));
    let _e262 = u_xlat0_;
    u_xlat1_.x = cos(_e262.x);
    let _e266 = u_xlat0_;
    u_xlat0_.x = sin(_e266.x);
    let _e270 = u_xlat0_;
    u_xlat2_.z = _e270.x;
    let _e272 = u_xlat3_;
    let _e274 = in_TEXCOORD0_1;
    let _e279 = _v_buffer2_.v_cb2_[0];
    let _e285 = _v_buffer2_.v_cb2_[0];
    let _e287 = ((_e274.xy * _e279.xy) + _e285.zw);
    u_xlat3_.x = _e287.x;
    u_xlat3_.y = _e287.y;
    let _e292 = u_xlat3_;
    let _e294 = u_xlat3_;
    let _e301 = (_e294.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat3_.x = _e301.x;
    u_xlat3_.y = _e301.y;
    let _e307 = u_xlat1_;
    u_xlat2_.y = _e307.x;
    let _e310 = u_xlat0_;
    u_xlat2_.x = -(_e310.x);
    let _e314 = u_xlat3_;
    let _e316 = u_xlat2_;
    u_xlat1_.y = dot(_e314.xy, _e316.xy);
    let _e320 = u_xlat3_;
    let _e322 = u_xlat2_;
    u_xlat1_.x = dot(_e320.xy, _e322.yz);
    let _e325 = vs_TEXCOORD0_;
    let _e327 = u_xlat1_;
    let _e332 = (_e327.xy + vec2<f32>(0.5f, 0.5f));
    vs_TEXCOORD0_.x = _e332.x;
    vs_TEXCOORD0_.y = _e332.y;
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(3) in_COLOR0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_COLOR0_1 = in_COLOR0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e26 = vs_COLOR0_;
    let _e28 = vs_TEXCOORD0_;
    let _e30 = gl_Position;
    return VertexOutput(_e26, _e28, _e30);
}
