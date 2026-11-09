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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat9_: f32 = 0f;
    var u_xlat13_: f32 = 0f;

    let _e50 = u_xlat0_;
    let _e52 = vs_TEXCOORD0_1;
    let _e53 = _e52.zw;
    u_xlat0_.x = _e53.x;
    u_xlat0_.y = _e53.y;
    let _e58 = u_xlat0_;
    let _e60 = u_xlat0_;
    let _e66 = clamp(_e60.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e66.x;
    u_xlat0_.y = _e66.y;
    let _e71 = u_xlat0_;
    let _e73 = u_xlat0_;
    let _e75 = vs_TEXCOORD0_1;
    let _e78 = (_e73.xy + -(_e75.zw));
    u_xlat0_.x = _e78.x;
    u_xlat0_.y = _e78.y;
    let _e83 = u_xlat0_;
    let _e88 = _f_buffer1_.f_cb1_[6];
    let _e90 = u_xlat0_;
    let _e93 = vs_TEXCOORD0_1;
    let _e95 = ((_e88.xx * _e90.xy) + _e93.zw);
    u_xlat0_.x = _e95.x;
    u_xlat0_.y = _e95.y;
    let _e100 = u_xlat0_;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[1];
    let _e113 = textureSampleBias(f_t1_, samplerf_s1_, _e100.xy, (_e105.x + _e110.x));
    u_xlat0_ = _e113;
    let _e114 = u_xlat0_;
    let _e116 = u_xlat0_;
    let _e127 = ((_e116.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e127.x;
    u_xlat0_.y = _e127.y;
    let _e132 = u_xlat0_;
    let _e134 = u_xlat0_;
    let _e139 = _f_buffer1_.f_cb1_[5];
    let _e142 = vs_TEXCOORD0_1;
    let _e144 = ((_e134.xy * _e139.zw) + _e142.xy);
    u_xlat0_.x = _e144.x;
    u_xlat0_.y = _e144.y;
    let _e149 = u_xlat8_;
    let _e151 = u_xlat0_;
    let _e152 = _e151.xy;
    u_xlat8_.x = _e152.x;
    u_xlat8_.y = _e152.y;
    let _e157 = u_xlat8_;
    let _e159 = u_xlat8_;
    let _e165 = clamp(_e159.xy, vec2(0f), vec2(1f));
    u_xlat8_.x = _e165.x;
    u_xlat8_.y = _e165.y;
    let _e170 = u_xlat8_;
    let _e172 = u_xlat0_;
    let _e175 = u_xlat8_;
    let _e177 = (-(_e172.xy) + _e175.xy);
    u_xlat8_.x = _e177.x;
    u_xlat8_.y = _e177.y;
    let _e182 = u_xlat0_;
    let _e187 = _f_buffer1_.f_cb1_[3];
    let _e189 = u_xlat8_;
    let _e192 = u_xlat0_;
    let _e194 = ((_e187.zz * _e189.xy) + _e192.xy);
    u_xlat0_.x = _e194.x;
    u_xlat0_.y = _e194.y;
    let _e199 = u_xlat0_;
    let _e204 = _f_buffer0_.f_cb0_[4];
    let _e209 = hscard_bias.values[0];
    let _e212 = textureSampleBias(f_t0_, samplerf_s0_, _e199.xy, (_e204.x + _e209.x));
    u_xlat0_ = _e212.yzwx;
    let _e214 = u_xlat1_;
    let _e216 = u_xlat0_;
    let _e221 = _f_buffer1_.f_cb1_[2];
    let _e223 = (_e216.wxy + _e221.yyy);
    u_xlat1_.x = _e223.x;
    u_xlat1_.y = _e223.y;
    u_xlat1_.z = _e223.z;
    let _e230 = u_xlat0_;
    let _e235 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e230.w, _e235.y);
    let _e239 = u_xlat1_;
    let _e241 = u_xlat13_;
    let _e246 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e239.y * _e241) + -(_e246.w));
    let _e250 = u_xlat1_;
    let _e252 = u_xlat13_;
    let _e254 = u_xlat1_;
    let _e256 = (vec3(_e252) * _e254.xyz);
    u_xlat1_.x = _e256.x;
    u_xlat1_.y = _e256.y;
    u_xlat1_.z = _e256.z;
    let _e266 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e266.w) + 1f);
    let _e271 = u_xlat2_;
    let _e273 = u_xlat13_;
    u_xlat13_ = (_e271.x / _e273);
    let _e276 = u_xlat2_;
    u_xlat2_.x = (_e276.x * 5f);
    let _e281 = u_xlat2_;
    u_xlat2_.x = clamp(_e281.x, 0f, 1f);
    let _e286 = u_xlat6_;
    let _e291 = _f_buffer1_.f_cb1_[8];
    let _e296 = _f_buffer1_.f_cb1_[9];
    let _e299 = (_e291.yzw + -(_e296.xyz));
    u_xlat6_.x = _e299.x;
    u_xlat6_.y = _e299.y;
    u_xlat6_.z = _e299.z;
    let _e306 = u_xlat6_;
    let _e308 = u_xlat13_;
    let _e310 = u_xlat6_;
    let _e316 = _f_buffer1_.f_cb1_[9];
    let _e318 = ((vec3(_e308) * _e310.xyz) + _e316.xyz);
    u_xlat6_.x = _e318.x;
    u_xlat6_.y = _e318.y;
    u_xlat6_.z = _e318.z;
    let _e330 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e330.w);
    let _e333 = u_xlat13_;
    let _e334 = u_xlat1_;
    u_xlat13_ = (_e333 * _e334.y);
    let _e337 = u_xlat3_;
    let _e342 = _f_buffer1_.f_cb1_[9];
    let _e347 = _f_buffer1_.f_cb1_[10];
    let _e350 = (_e342.xyz + -(_e347.xyz));
    u_xlat3_.x = _e350.x;
    u_xlat3_.y = _e350.y;
    u_xlat3_.z = _e350.z;
    let _e357 = u_xlat3_;
    let _e359 = u_xlat13_;
    let _e361 = u_xlat3_;
    let _e367 = _f_buffer1_.f_cb1_[10];
    let _e369 = ((vec3(_e359) * _e361.xyz) + _e367.xyz);
    u_xlat3_.x = _e369.x;
    u_xlat3_.y = _e369.y;
    u_xlat3_.z = _e369.z;
    let _e376 = u_xlat6_;
    let _e378 = u_xlat6_;
    let _e380 = u_xlat3_;
    let _e383 = (_e378.xyz + -(_e380.xyz));
    u_xlat6_.x = _e383.x;
    u_xlat6_.y = _e383.y;
    u_xlat6_.z = _e383.z;
    let _e390 = u_xlat2_;
    let _e392 = u_xlat2_;
    let _e394 = u_xlat6_;
    let _e397 = u_xlat3_;
    let _e399 = ((_e392.xxx * _e394.xyz) + _e397.xyz);
    u_xlat2_.x = _e399.x;
    u_xlat2_.y = _e399.y;
    u_xlat2_.z = _e399.z;
    let _e406 = u_xlat1_;
    let _e408 = u_xlat1_;
    let _e410 = u_xlat2_;
    let _e412 = (_e408.xyz * _e410.xyz);
    u_xlat1_.x = _e412.x;
    u_xlat1_.y = _e412.y;
    u_xlat1_.z = _e412.z;
    let _e419 = u_xlat0_;
    let _e421 = u_xlat1_;
    let _e426 = _f_buffer1_.f_cb1_[2];
    let _e428 = (_e421.xyz * _e426.xxx);
    u_xlat0_.x = _e428.x;
    u_xlat0_.y = _e428.y;
    u_xlat0_.z = _e428.z;
    let _e436 = vs_TEXCOORD1_1;
    let _e440 = _f_buffer1_.f_cb1_[12];
    u_xlat1_.x = (_e436 + -(_e440.z));
    let _e445 = u_xlat1_;
    u_xlat1_.x = clamp(_e445.x, 0f, 1f);
    let _e451 = u_xlat1_;
    u_xlat1_.x = (_e451.x + -0.00001f);
    let _e456 = u_xlat0_;
    let _e458 = u_xlat1_;
    u_xlat5_ = (_e456.w + -(_e458.x));
    let _e462 = vs_TEXCOORD1_1;
    let _e466 = _f_buffer1_.f_cb1_[12];
    u_xlat9_ = (_e462 + _e466.z);
    let _e469 = u_xlat9_;
    u_xlat9_ = clamp(_e469, 0f, 1f);
    let _e474 = u_xlat1_;
    let _e477 = u_xlat9_;
    u_xlat1_.x = (-(_e474.x) + _e477);
    let _e482 = u_xlat1_;
    u_xlat1_.x = (1f / _e482.x);
    let _e486 = u_xlat1_;
    let _e488 = u_xlat5_;
    u_xlat1_.x = (_e486.x * _e488);
    let _e491 = u_xlat1_;
    u_xlat1_.x = clamp(_e491.x, 0f, 1f);
    let _e496 = u_xlat1_;
    u_xlat5_ = ((_e496.x * -2f) + 3f);
    let _e504 = u_xlat1_;
    let _e506 = u_xlat1_;
    u_xlat1_.x = (_e504.x * _e506.x);
    let _e510 = u_xlat1_;
    let _e512 = u_xlat5_;
    u_xlat1_.x = (_e510.x * _e512);
    let _e514 = u_xlat0_;
    let _e515 = u_xlat1_;
    u_xlat0_ = (_e514 * _e515.xxxx);
    let _e518 = u_xlat0_;
    let _e519 = vs_COLOR0_1;
    SV_Target0_ = (_e518 * _e519);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>, @location(1) vs_TEXCOORD1_: f32) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
