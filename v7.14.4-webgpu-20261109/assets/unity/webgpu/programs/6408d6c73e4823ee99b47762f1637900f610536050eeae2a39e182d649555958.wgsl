struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 4>,
}

struct v_buffer2_ {
    v_cb2_: array<vec4<f32>, 13>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec4<f32>,
    @location(11) vs_COLOR1_: vec4<f32>,
    @location(10) vs_COLOR0_: vec4<f32>,
    @location(1) vs_TEXCOORD1_: f32,
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
var<private> vs_COLOR1_: vec4<f32>;
var<private> vs_COLOR0_: vec4<f32>;
var<private> vs_TEXCOORD1_: f32;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e36 = in_POSITION0_1;
    let _e41 = _v_buffer1_.v_cb1_[1];
    u_xlat0_ = (_e36.yyyy * _e41);
    let _e46 = _v_buffer1_.v_cb1_[0];
    let _e47 = in_POSITION0_1;
    let _e50 = u_xlat0_;
    u_xlat0_ = ((_e46 * _e47.xxxx) + _e50);
    let _e55 = _v_buffer1_.v_cb1_[2];
    let _e56 = in_POSITION0_1;
    let _e59 = u_xlat0_;
    u_xlat0_ = ((_e55 * _e56.zzzz) + _e59);
    let _e61 = u_xlat0_;
    let _e65 = _v_buffer1_.v_cb1_[3];
    u_xlat1_ = (_e61 + _e65);
    let _e67 = u_xlat0_;
    let _e72 = _v_buffer1_.v_cb1_[3];
    let _e74 = in_POSITION0_1;
    let _e77 = u_xlat0_;
    let _e79 = ((_e72.xyz * _e74.www) + _e77.xyz);
    u_xlat0_.x = _e79.x;
    u_xlat0_.y = _e79.y;
    u_xlat0_.z = _e79.z;
    let _e86 = u_xlat1_;
    let _e91 = _v_buffer0_.v_cb0_[80];
    u_xlat2_ = (_e86.yyyy * _e91);
    let _e96 = _v_buffer0_.v_cb0_[79];
    let _e97 = u_xlat1_;
    let _e100 = u_xlat2_;
    u_xlat2_ = ((_e96 * _e97.xxxx) + _e100);
    let _e105 = _v_buffer0_.v_cb0_[81];
    let _e106 = u_xlat1_;
    let _e109 = u_xlat2_;
    u_xlat2_ = ((_e105 * _e106.zzzz) + _e109);
    let _e115 = _v_buffer0_.v_cb0_[82];
    let _e116 = u_xlat1_;
    let _e119 = u_xlat2_;
    gl_Position = ((_e115 * _e116.wwww) + _e119);
    let _e121 = u_xlat0_;
    let _e123 = u_xlat0_;
    let _e128 = _v_buffer2_.v_cb2_[4];
    let _e134 = _v_buffer2_.v_cb2_[4];
    let _e136 = ((_e123.xz * _e128.xy) + _e134.zw);
    u_xlat0_.x = _e136.x;
    u_xlat0_.z = _e136.y;
    let _e142 = u_xlat0_;
    let _e147 = _v_buffer2_.v_cb2_[12];
    u_xlat3_.x = (_e142.y + -(_e147.x));
    let _e151 = u_xlat3_;
    let _e156 = _v_buffer2_.v_cb2_[11];
    vs_TEXCOORD1_ = (_e151.x / _e156.w);
    let _e159 = u_xlat3_;
    let _e161 = u_xlat0_;
    let _e164 = u_xlat0_;
    let _e166 = (-(_e161.xz) + _e164.zx);
    u_xlat3_.x = _e166.x;
    u_xlat3_.z = _e166.y;
    let _e171 = u_xlat0_;
    let _e176 = _v_buffer2_.v_cb2_[6];
    let _e178 = u_xlat3_;
    let _e181 = u_xlat0_;
    let _e183 = ((_e176.yy * _e178.xz) + _e181.xz);
    u_xlat0_.x = _e183.x;
    u_xlat0_.y = _e183.y;
    let _e188 = u_xlat6_;
    let _e193 = _v_buffer0_.v_cb0_[15];
    let _e198 = _v_buffer2_.v_cb2_[5];
    let _e200 = (_e193.zz * _e198.xy);
    u_xlat6_.x = _e200.x;
    u_xlat6_.y = _e200.y;
    let _e205 = u_xlat6_;
    let _e207 = u_xlat6_;
    let _e209 = fract(_e207.xy);
    u_xlat6_.x = _e209.x;
    u_xlat6_.y = _e209.y;
    let _e214 = vs_TEXCOORD0_;
    let _e216 = u_xlat6_;
    let _e218 = u_xlat0_;
    let _e220 = (_e216.xy + _e218.xy);
    vs_TEXCOORD0_.z = _e220.x;
    vs_TEXCOORD0_.w = _e220.y;
    let _e225 = u_xlat0_;
    let _e227 = in_TEXCOORD0_1;
    let _e232 = _v_buffer2_.v_cb2_[1];
    let _e238 = _v_buffer2_.v_cb2_[1];
    let _e240 = ((_e227.xy * _e232.xy) + _e238.zw);
    u_xlat0_.x = _e240.x;
    u_xlat0_.y = _e240.y;
    let _e245 = u_xlat6_;
    let _e247 = u_xlat0_;
    let _e250 = u_xlat0_;
    let _e252 = (-(_e247.xy) + _e250.yx);
    u_xlat6_.x = _e252.x;
    u_xlat6_.y = _e252.y;
    let _e257 = vs_TEXCOORD0_;
    let _e262 = _v_buffer2_.v_cb2_[2];
    let _e264 = u_xlat6_;
    let _e267 = u_xlat0_;
    let _e269 = ((_e262.zz * _e264.xy) + _e267.xy);
    vs_TEXCOORD0_.x = _e269.x;
    vs_TEXCOORD0_.y = _e269.y;
    let _e274 = in_COLOR0_1;
    let _e278 = _v_buffer2_.v_cb2_[7];
    u_xlat0_ = (_e274 * _e278);
    let _e281 = u_xlat0_;
    let _e283 = u_xlat0_;
    u_xlat1_.x = max(_e281.y, _e283.x);
    let _e287 = u_xlat0_;
    let _e289 = u_xlat1_;
    u_xlat1_.x = max(_e287.z, _e289.x);
    let _e293 = u_xlat1_;
    u_xlat1_.x = ((_e293.x * 2f) + -1f);
    let _e301 = u_xlat1_;
    u_xlat1_.x = clamp(_e301.x, 0f, 1f);
    let _e307 = u_xlat1_;
    u_xlat1_.w = (-(_e307.x) + 1f);
    let _e312 = u_xlat0_;
    let _e314 = u_xlat0_;
    let _e316 = u_xlat0_;
    let _e318 = (_e314.xyz + _e316.xyz);
    u_xlat0_.x = _e318.x;
    u_xlat0_.y = _e318.y;
    u_xlat0_.z = _e318.z;
    let _e325 = u_xlat1_;
    let _e327 = u_xlat0_;
    let _e332 = _v_buffer2_.v_cb2_[8];
    let _e334 = (_e327.xyz * _e332.xxx);
    u_xlat1_.x = _e334.x;
    u_xlat1_.y = _e334.y;
    u_xlat1_.z = _e334.z;
    let _e341 = u_xlat0_;
    let _e343 = u_xlat1_;
    vs_COLOR1_ = (_e341.wwww * _e343);
    let _e345 = in_COLOR0_1;
    let _e349 = _v_buffer2_.v_cb2_[0];
    u_xlat0_ = (_e345 * _e349);
    let _e352 = u_xlat0_;
    let _e354 = u_xlat0_;
    u_xlat1_.x = max(_e352.y, _e354.x);
    let _e358 = u_xlat0_;
    let _e360 = u_xlat1_;
    u_xlat1_.x = max(_e358.z, _e360.x);
    let _e364 = u_xlat1_;
    u_xlat1_.x = ((_e364.x * 2f) + -1f);
    let _e372 = u_xlat1_;
    u_xlat1_.x = clamp(_e372.x, 0f, 1f);
    let _e378 = u_xlat1_;
    u_xlat1_.w = (-(_e378.x) + 1f);
    let _e383 = u_xlat1_;
    let _e385 = u_xlat0_;
    let _e387 = u_xlat0_;
    let _e389 = (_e385.xyz + _e387.xyz);
    u_xlat1_.x = _e389.x;
    u_xlat1_.y = _e389.y;
    u_xlat1_.z = _e389.z;
    let _e397 = u_xlat0_;
    let _e402 = _v_buffer2_.v_cb2_[2];
    u_xlat0_.x = (_e397.w * _e402.w);
    let _e405 = u_xlat0_;
    let _e407 = u_xlat1_;
    vs_COLOR0_ = (_e405.xxxx * _e407);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>, @location(3) in_COLOR0_: vec4<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    in_COLOR0_1 = in_COLOR0_;
    main_1();
    let _e30 = vs_TEXCOORD0_;
    let _e32 = vs_COLOR1_;
    let _e34 = vs_COLOR0_;
    let _e36 = vs_TEXCOORD1_;
    let _e38 = gl_Position;
    return VertexOutput(_e30, _e32, _e34, _e36, _e38);
}
