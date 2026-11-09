struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 13>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(31) 
var<uniform> hscard_bias: HScardSamplerBias;
@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
@group(1) @binding(1) 
var<uniform> _f_buffer1_: f_buffer1_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlat13_: f32 = 0f;

    let _e51 = u_xlat0_;
    let _e56 = _f_buffer1_.f_cb1_[8];
    let _e61 = _f_buffer1_.f_cb1_[9];
    let _e64 = (_e56.yzw + -(_e61.xyz));
    u_xlat0_.x = _e64.x;
    u_xlat0_.y = _e64.y;
    u_xlat0_.z = _e64.z;
    let _e74 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e74.w) + 1f);
    let _e79 = vs_TEXCOORD0_1;
    u_xlat1_ = _e79.zwxy;
    let _e81 = u_xlat1_;
    u_xlat1_ = clamp(_e81, vec4(0f), vec4(1f));
    let _e87 = u_xlat1_;
    let _e88 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e87 + -(_e88.zwxy));
    let _e92 = u_xlat9_;
    let _e97 = _f_buffer1_.f_cb1_[3];
    let _e99 = u_xlat1_;
    let _e102 = vs_TEXCOORD0_1;
    let _e104 = ((_e97.zz * _e99.zw) + _e102.xy);
    u_xlat9_.x = _e104.x;
    u_xlat9_.y = _e104.y;
    let _e109 = u_xlat1_;
    let _e114 = _f_buffer1_.f_cb1_[6];
    let _e116 = u_xlat1_;
    let _e119 = vs_TEXCOORD0_1;
    let _e121 = ((_e114.xx * _e116.xy) + _e119.zw);
    u_xlat1_.x = _e121.x;
    u_xlat1_.y = _e121.y;
    let _e126 = u_xlat1_;
    let _e131 = _f_buffer0_.f_cb0_[4];
    let _e136 = hscard_bias.values[1];
    let _e139 = textureSampleBias(f_t1_, samplerf_s1_, _e126.xy, (_e131.x + _e136.x));
    u_xlat2_ = _e139;
    let _e141 = u_xlat2_;
    u_xlat1_.x = dot(_e141.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e148 = u_xlat9_;
    let _e153 = _f_buffer0_.f_cb0_[4];
    let _e158 = hscard_bias.values[0];
    let _e161 = textureSampleBias(f_t0_, samplerf_s0_, _e148.xy, (_e153.x + _e158.x));
    u_xlat2_ = _e161;
    let _e163 = u_xlat2_;
    u_xlat2_.w = dot(_e163.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e170 = u_xlat2_;
    let _e175 = _f_buffer1_.f_cb1_[2];
    u_xlat5_ = (_e170.w + _e175.y);
    let _e179 = u_xlat2_;
    let _e184 = _f_buffer1_.f_cb1_[3];
    u_xlat9_.x = max(_e179.w, _e184.y);
    let _e187 = u_xlat5_;
    let _e188 = u_xlat9_;
    let _e194 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e187 * _e188.x) + -(_e194.w));
    let _e198 = u_xlat9_;
    let _e200 = u_xlat5_;
    u_xlat5_ = (_e198.x * _e200);
    let _e202 = u_xlat13_;
    let _e203 = u_xlat12_;
    u_xlat12_ = (_e202 / _e203);
    let _e206 = u_xlat13_;
    u_xlat9_.x = (_e206 * 5f);
    let _e210 = u_xlat9_;
    u_xlat9_.x = clamp(_e210.x, 0f, 1f);
    let _e215 = u_xlat0_;
    let _e217 = u_xlat12_;
    let _e219 = u_xlat0_;
    let _e225 = _f_buffer1_.f_cb1_[9];
    let _e227 = ((vec3(_e217) * _e219.xyz) + _e225.xyz);
    u_xlat0_.x = _e227.x;
    u_xlat0_.y = _e227.y;
    u_xlat0_.z = _e227.z;
    let _e239 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e239.w);
    let _e242 = u_xlat12_;
    let _e243 = u_xlat5_;
    u_xlat12_ = (_e242 * _e243);
    let _e245 = u_xlat3_;
    let _e250 = _f_buffer1_.f_cb1_[9];
    let _e255 = _f_buffer1_.f_cb1_[10];
    let _e258 = (_e250.xyz + -(_e255.xyz));
    u_xlat3_.x = _e258.x;
    u_xlat3_.y = _e258.y;
    u_xlat3_.z = _e258.z;
    let _e265 = u_xlat3_;
    let _e267 = u_xlat12_;
    let _e269 = u_xlat3_;
    let _e275 = _f_buffer1_.f_cb1_[10];
    let _e277 = ((vec3(_e267) * _e269.xyz) + _e275.xyz);
    u_xlat3_.x = _e277.x;
    u_xlat3_.y = _e277.y;
    u_xlat3_.z = _e277.z;
    let _e284 = u_xlat0_;
    let _e286 = u_xlat0_;
    let _e288 = u_xlat3_;
    let _e291 = (_e286.xyz + -(_e288.xyz));
    u_xlat0_.x = _e291.x;
    u_xlat0_.y = _e291.y;
    u_xlat0_.z = _e291.z;
    let _e298 = u_xlat0_;
    let _e300 = u_xlat9_;
    let _e302 = u_xlat0_;
    let _e305 = u_xlat3_;
    let _e307 = ((_e300.xxx * _e302.xyz) + _e305.xyz);
    u_xlat0_.x = _e307.x;
    u_xlat0_.y = _e307.y;
    u_xlat0_.z = _e307.z;
    let _e314 = u_xlat0_;
    let _e316 = u_xlat0_;
    let _e318 = u_xlat5_;
    let _e320 = (_e316.xyz * vec3(_e318));
    u_xlat0_.x = _e320.x;
    u_xlat0_.y = _e320.y;
    u_xlat0_.z = _e320.z;
    let _e327 = u_xlat2_;
    let _e329 = u_xlat0_;
    let _e334 = _f_buffer1_.f_cb1_[2];
    let _e336 = (_e329.xyz * _e334.xxx);
    u_xlat2_.x = _e336.x;
    u_xlat2_.y = _e336.y;
    u_xlat2_.z = _e336.z;
    let _e344 = vs_TEXCOORD1_1;
    let _e348 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e344 + _e348.y);
    let _e352 = u_xlat0_;
    u_xlat0_.x = ((_e352.x * 2f) + -1f);
    let _e360 = u_xlat0_;
    let _e363 = u_xlat1_;
    u_xlat0_.x = (-(_e360.x) + _e363.x);
    let _e367 = u_xlat0_;
    u_xlat0_.x = clamp(_e367.x, 0f, 1f);
    let _e373 = u_xlat0_;
    u_xlat0_.x = log2(_e373.x);
    let _e380 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e380.z * 10f);
    let _e385 = u_xlat0_;
    let _e387 = u_xlat4_;
    u_xlat0_.x = (_e385.x * _e387.x);
    let _e391 = u_xlat0_;
    u_xlat0_.x = exp2(_e391.x);
    let _e394 = u_xlat0_;
    let _e396 = u_xlat2_;
    u_xlat1_ = (_e394.xxxx * _e396);
    let _e399 = u_xlat0_;
    u_xlat0_.x = (-(_e399.x) + 1f);
    let _e405 = u_xlat0_;
    u_xlat0_.x = log2(_e405.x);
    let _e409 = u_xlat0_;
    u_xlat0_.x = (_e409.x * 10f);
    let _e414 = u_xlat0_;
    u_xlat0_.x = exp2(_e414.x);
    let _e418 = u_xlat1_;
    u_xlat4_.x = (_e418.w * 1000000f);
    let _e423 = u_xlat4_;
    u_xlat4_.x = clamp(_e423.x, 0f, 1f);
    let _e429 = u_xlat2_;
    let _e431 = u_xlat4_;
    u_xlat4_.x = (_e429.w * _e431.x);
    let _e435 = u_xlat4_;
    let _e437 = u_xlat0_;
    u_xlat0_.x = (_e435.x * _e437.x);
    let _e440 = u_xlat4_;
    let _e445 = _f_buffer1_.f_cb1_[7];
    let _e450 = _f_buffer1_.f_cb1_[8];
    let _e452 = (_e445.xyz * _e450.xxx);
    u_xlat4_.x = _e452.x;
    u_xlat4_.y = _e452.y;
    u_xlat4_.z = _e452.z;
    let _e459 = u_xlat0_;
    let _e461 = u_xlat0_;
    let _e463 = u_xlat4_;
    let _e465 = (_e461.xxx * _e463.xyz);
    u_xlat0_.x = _e465.x;
    u_xlat0_.y = _e465.y;
    u_xlat0_.z = _e465.z;
    let _e472 = u_xlat1_;
    let _e474 = u_xlat0_;
    let _e476 = vs_COLOR1_1;
    let _e479 = u_xlat1_;
    let _e481 = ((_e474.xyz * _e476.www) + _e479.xyz);
    u_xlat1_.x = _e481.x;
    u_xlat1_.y = _e481.y;
    u_xlat1_.z = _e481.z;
    let _e488 = u_xlat1_;
    let _e489 = vs_COLOR0_1;
    SV_Target0_ = (_e488 * _e489);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e36 = SV_Target0_;
    return FragmentOutput(_e36);
}
