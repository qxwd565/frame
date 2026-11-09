struct v_buffer0_ {
    v_cb0_: array<vec4<f32>, 83>,
}

struct v_buffer1_ {
    v_cb1_: array<vec4<f32>, 10>,
}

struct v_buffer2_ {
    v_cb2_: vec4<f32>,
}

struct VertexOutput {
    @location(0) vs_TEXCOORD0_: vec2<f32>,
    @location(5) vs_TEXCOORD5_: f32,
    @location(1) vs_TEXCOORD1_: vec3<f32>,
    @location(2) vs_TEXCOORD2_: vec4<f32>,
    @location(3) vs_TEXCOORD3_: vec4<f32>,
    @location(4) vs_TEXCOORD4_: vec4<f32>,
    @location(7) vs_TEXCOORD7_: vec3<f32>,
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
var<private> in_TANGENT0_1: vec4<f32>;
var<private> in_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD0_: vec2<f32>;
var<private> vs_TEXCOORD5_: f32;
var<private> vs_TEXCOORD1_: vec3<f32>;
var<private> vs_TEXCOORD2_: vec4<f32>;
var<private> vs_TEXCOORD3_: vec4<f32>;
var<private> vs_TEXCOORD4_: vec4<f32>;
var<private> vs_TEXCOORD7_: vec3<f32>;
var<private> gl_Position: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlatb12_: bool = false;
    var u_xlat13_: f32 = 0f;
    var local: f32;
    var local_1: f32;
    var local_2: f32;
    var local_3: f32;

    let _e45 = vs_TEXCOORD0_;
    let _e47 = in_TEXCOORD0_1;
    let _e49 = _v_buffer2_;
    let _e53 = _v_buffer2_;
    let _e56 = ((_e47.xy * _e49.v_cb2_.xy) + _e53.v_cb2_.zw);
    vs_TEXCOORD0_.x = _e56.x;
    vs_TEXCOORD0_.y = _e56.y;
    vs_TEXCOORD5_ = 0f;
    let _e62 = u_xlat0_;
    let _e64 = in_POSITION0_1;
    let _e69 = _v_buffer1_.v_cb1_[1];
    let _e71 = (_e64.yyy * _e69.xyz);
    u_xlat0_.x = _e71.x;
    u_xlat0_.y = _e71.y;
    u_xlat0_.z = _e71.z;
    let _e78 = u_xlat0_;
    let _e83 = _v_buffer1_.v_cb1_[0];
    let _e85 = in_POSITION0_1;
    let _e88 = u_xlat0_;
    let _e90 = ((_e83.xyz * _e85.xxx) + _e88.xyz);
    u_xlat0_.x = _e90.x;
    u_xlat0_.y = _e90.y;
    u_xlat0_.z = _e90.z;
    let _e97 = u_xlat0_;
    let _e102 = _v_buffer1_.v_cb1_[2];
    let _e104 = in_POSITION0_1;
    let _e107 = u_xlat0_;
    let _e109 = ((_e102.xyz * _e104.zzz) + _e107.xyz);
    u_xlat0_.x = _e109.x;
    u_xlat0_.y = _e109.y;
    u_xlat0_.z = _e109.z;
    let _e116 = u_xlat0_;
    let _e118 = u_xlat0_;
    let _e123 = _v_buffer1_.v_cb1_[3];
    let _e125 = (_e118.xyz + _e123.xyz);
    u_xlat0_.x = _e125.x;
    u_xlat0_.y = _e125.y;
    u_xlat0_.z = _e125.z;
    let _e132 = vs_TEXCOORD1_;
    let _e134 = u_xlat0_;
    let _e135 = _e134.xyz;
    vs_TEXCOORD1_.x = _e135.x;
    vs_TEXCOORD1_.y = _e135.y;
    vs_TEXCOORD1_.z = _e135.z;
    let _e143 = in_NORMAL0_1;
    let _e148 = _v_buffer1_.v_cb1_[4];
    u_xlat1_.x = dot(_e143.xyz, _e148.xyz);
    let _e152 = in_NORMAL0_1;
    let _e157 = _v_buffer1_.v_cb1_[5];
    u_xlat1_.y = dot(_e152.xyz, _e157.xyz);
    let _e161 = in_NORMAL0_1;
    let _e166 = _v_buffer1_.v_cb1_[6];
    u_xlat1_.z = dot(_e161.xyz, _e166.xyz);
    let _e169 = u_xlat1_;
    let _e171 = u_xlat1_;
    u_xlat12_ = dot(_e169.xyz, _e171.xyz);
    let _e174 = u_xlat12_;
    u_xlat12_ = max(_e174, 0.000000000000000000000000000000000000011754944f);
    let _e177 = u_xlat12_;
    u_xlat12_ = inverseSqrt(_e177);
    let _e179 = u_xlat1_;
    let _e181 = u_xlat12_;
    let _e183 = u_xlat1_;
    let _e185 = (vec3(_e181) * _e183.xyz);
    u_xlat1_.x = _e185.x;
    u_xlat1_.y = _e185.y;
    u_xlat1_.z = _e185.z;
    let _e192 = vs_TEXCOORD2_;
    let _e194 = u_xlat1_;
    let _e195 = _e194.xyz;
    vs_TEXCOORD2_.x = _e195.x;
    vs_TEXCOORD2_.y = _e195.y;
    vs_TEXCOORD2_.z = _e195.z;
    let _e202 = u_xlat2_;
    let _e204 = u_xlat0_;
    let _e210 = _v_buffer0_.v_cb0_[21];
    let _e212 = (-(_e204.xyz) + _e210.xyz);
    u_xlat2_.x = _e212.x;
    u_xlat2_.y = _e212.y;
    u_xlat2_.z = _e212.z;
    let _e222 = _v_buffer0_.v_cb0_[25];
    u_xlatb12_ = (_e222.w == 0f);
    let _e227 = u_xlatb12_;
    if _e227 {
        let _e228 = u_xlat2_;
        local = _e228.x;
    } else {
        let _e233 = _v_buffer0_.v_cb0_[67];
        local = _e233.z;
    }
    let _e236 = local;
    vs_TEXCOORD2_.w = _e236;
    let _e237 = u_xlat3_;
    let _e239 = in_TANGENT0_1;
    let _e244 = _v_buffer1_.v_cb1_[1];
    let _e246 = (_e239.yyy * _e244.xyz);
    u_xlat3_.x = _e246.x;
    u_xlat3_.y = _e246.y;
    u_xlat3_.z = _e246.z;
    let _e253 = u_xlat3_;
    let _e258 = _v_buffer1_.v_cb1_[0];
    let _e260 = in_TANGENT0_1;
    let _e263 = u_xlat3_;
    let _e265 = ((_e258.xyz * _e260.xxx) + _e263.xyz);
    u_xlat3_.x = _e265.x;
    u_xlat3_.y = _e265.y;
    u_xlat3_.z = _e265.z;
    let _e272 = u_xlat3_;
    let _e277 = _v_buffer1_.v_cb1_[2];
    let _e279 = in_TANGENT0_1;
    let _e282 = u_xlat3_;
    let _e284 = ((_e277.xyz * _e279.zzz) + _e282.xyz);
    u_xlat3_.x = _e284.x;
    u_xlat3_.y = _e284.y;
    u_xlat3_.z = _e284.z;
    let _e291 = u_xlat3_;
    let _e293 = u_xlat3_;
    u_xlat13_ = dot(_e291.xyz, _e293.xyz);
    let _e296 = u_xlat13_;
    u_xlat13_ = max(_e296, 0.000000000000000000000000000000000000011754944f);
    let _e299 = u_xlat13_;
    u_xlat13_ = inverseSqrt(_e299);
    let _e301 = u_xlat3_;
    let _e303 = u_xlat13_;
    let _e305 = u_xlat3_;
    let _e307 = (vec3(_e303) * _e305.xyz);
    u_xlat3_.x = _e307.x;
    u_xlat3_.y = _e307.y;
    u_xlat3_.z = _e307.z;
    let _e314 = vs_TEXCOORD3_;
    let _e316 = u_xlat3_;
    let _e317 = _e316.xyz;
    vs_TEXCOORD3_.x = _e317.x;
    vs_TEXCOORD3_.y = _e317.y;
    vs_TEXCOORD3_.z = _e317.z;
    let _e325 = u_xlatb12_;
    if _e325 {
        let _e326 = u_xlat2_;
        local_1 = _e326.y;
    } else {
        let _e331 = _v_buffer0_.v_cb0_[68];
        local_1 = _e331.z;
    }
    let _e334 = local_1;
    vs_TEXCOORD3_.w = _e334;
    let _e336 = u_xlatb12_;
    if _e336 {
        let _e337 = u_xlat2_;
        local_2 = _e337.z;
    } else {
        let _e342 = _v_buffer0_.v_cb0_[69];
        local_2 = _e342.z;
    }
    let _e345 = local_2;
    vs_TEXCOORD4_.w = _e345;
    let _e346 = u_xlat2_;
    let _e348 = u_xlat1_;
    let _e350 = u_xlat3_;
    let _e352 = (_e348.zxy * _e350.yzx);
    u_xlat2_.x = _e352.x;
    u_xlat2_.y = _e352.y;
    u_xlat2_.z = _e352.z;
    let _e359 = u_xlat1_;
    let _e361 = u_xlat1_;
    let _e363 = u_xlat3_;
    let _e366 = u_xlat2_;
    let _e369 = ((_e361.yzx * _e363.zxy) + -(_e366.xyz));
    u_xlat1_.x = _e369.x;
    u_xlat1_.y = _e369.y;
    u_xlat1_.z = _e369.z;
    let _e379 = _v_buffer1_.v_cb1_[9];
    u_xlatb12_ = (_e379.w >= 0f);
    let _e383 = u_xlatb12_;
    if _e383 {
        local_3 = 1f;
    } else {
        local_3 = -1f;
    }
    let _e388 = local_3;
    u_xlat12_ = _e388;
    let _e389 = u_xlat12_;
    let _e390 = in_TANGENT0_1;
    u_xlat12_ = (_e389 * _e390.w);
    let _e393 = vs_TEXCOORD4_;
    let _e395 = u_xlat12_;
    let _e397 = u_xlat1_;
    let _e399 = (vec3(_e395) * _e397.xyz);
    vs_TEXCOORD4_.x = _e399.x;
    vs_TEXCOORD4_.y = _e399.y;
    vs_TEXCOORD4_.z = _e399.z;
    let _e406 = vs_TEXCOORD7_;
    vs_TEXCOORD7_.x = 0f;
    vs_TEXCOORD7_.y = 0f;
    vs_TEXCOORD7_.z = 0f;
    let _e415 = u_xlat0_;
    let _e420 = _v_buffer0_.v_cb0_[80];
    u_xlat1_ = (_e415.yyyy * _e420);
    let _e425 = _v_buffer0_.v_cb0_[79];
    let _e426 = u_xlat0_;
    let _e429 = u_xlat1_;
    u_xlat1_ = ((_e425 * _e426.xxxx) + _e429);
    let _e434 = _v_buffer0_.v_cb0_[81];
    let _e435 = u_xlat0_;
    let _e438 = u_xlat1_;
    u_xlat0_ = ((_e434 * _e435.zzzz) + _e438);
    let _e441 = u_xlat0_;
    let _e445 = _v_buffer0_.v_cb0_[82];
    gl_Position = (_e441 + _e445);
    return;
}

@vertex 
fn main(@location(0) in_POSITION0_: vec4<f32>, @location(1) in_NORMAL0_: vec3<f32>, @location(2) in_TANGENT0_: vec4<f32>, @location(4) in_TEXCOORD0_: vec2<f32>) -> VertexOutput {
    in_POSITION0_1 = in_POSITION0_;
    in_NORMAL0_1 = in_NORMAL0_;
    in_TANGENT0_1 = in_TANGENT0_;
    in_TEXCOORD0_1 = in_TEXCOORD0_;
    main_1();
    let _e40 = vs_TEXCOORD0_;
    let _e42 = vs_TEXCOORD5_;
    let _e44 = vs_TEXCOORD1_;
    let _e46 = vs_TEXCOORD2_;
    let _e48 = vs_TEXCOORD3_;
    let _e50 = vs_TEXCOORD4_;
    let _e52 = vs_TEXCOORD7_;
    let _e54 = gl_Position;
    return VertexOutput(_e40, _e42, _e44, _e46, _e48, _e50, _e52, _e54);
}
