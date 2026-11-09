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
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: f32 = 0f;
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e53 = u_xlat0_;
    let _e58 = _f_buffer1_.f_cb1_[8];
    let _e63 = _f_buffer1_.f_cb1_[9];
    let _e66 = (_e58.yzw + -(_e63.xyz));
    u_xlat0_.x = _e66.x;
    u_xlat0_.y = _e66.y;
    u_xlat0_.z = _e66.z;
    let _e76 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e76.w) + 1f);
    let _e81 = vs_TEXCOORD0_1;
    u_xlat1_ = _e81.zwxy;
    let _e83 = u_xlat1_;
    u_xlat1_ = clamp(_e83, vec4(0f), vec4(1f));
    let _e89 = u_xlat1_;
    let _e90 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e89 + -(_e90.zwxy));
    let _e94 = u_xlat9_;
    let _e99 = _f_buffer1_.f_cb1_[3];
    let _e101 = u_xlat1_;
    let _e104 = vs_TEXCOORD0_1;
    let _e106 = ((_e99.zz * _e101.zw) + _e104.xy);
    u_xlat9_.x = _e106.x;
    u_xlat9_.y = _e106.y;
    let _e111 = u_xlat1_;
    let _e116 = _f_buffer1_.f_cb1_[6];
    let _e118 = u_xlat1_;
    let _e121 = vs_TEXCOORD0_1;
    let _e123 = ((_e116.xx * _e118.xy) + _e121.zw);
    u_xlat1_.x = _e123.x;
    u_xlat1_.y = _e123.y;
    let _e128 = u_xlat1_;
    let _e133 = _f_buffer0_.f_cb0_[4];
    let _e138 = hscard_bias.values[1];
    let _e141 = textureSampleBias(f_t1_, samplerf_s1_, _e128.xy, (_e133.x + _e138.x));
    u_xlat2_ = _e141;
    let _e143 = u_xlat2_;
    u_xlat1_.x = (_e143.w + -1f);
    let _e152 = _f_buffer1_.f_cb1_[7];
    let _e154 = u_xlat1_;
    u_xlat1_.x = ((_e152.w * _e154.x) + 1f);
    let _e159 = u_xlat9_;
    let _e164 = _f_buffer0_.f_cb0_[4];
    let _e169 = hscard_bias.values[0];
    let _e172 = textureSampleBias(f_t0_, samplerf_s0_, _e159.xy, (_e164.x + _e169.x));
    u_xlat2_ = _e172.yzwx;
    let _e174 = u_xlat5_;
    let _e176 = u_xlat2_;
    let _e181 = _f_buffer1_.f_cb1_[2];
    let _e183 = (_e176.wxy + _e181.yyy);
    u_xlat5_.x = _e183.x;
    u_xlat5_.y = _e183.y;
    u_xlat5_.z = _e183.z;
    let _e190 = u_xlat2_;
    let _e195 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e190.w, _e195.y);
    let _e199 = u_xlat5_;
    let _e201 = u_xlat3_;
    let _e206 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e199.y * _e201) + -(_e206.w));
    let _e210 = u_xlat5_;
    let _e212 = u_xlat5_;
    let _e214 = u_xlat3_;
    let _e216 = (_e212.xyz * vec3(_e214));
    u_xlat5_.x = _e216.x;
    u_xlat5_.y = _e216.y;
    u_xlat5_.z = _e216.z;
    let _e223 = u_xlat7_;
    let _e225 = u_xlat12_;
    u_xlat12_ = (_e223.x / _e225);
    let _e227 = u_xlat7_;
    u_xlat3_ = (_e227.x * 5f);
    let _e231 = u_xlat3_;
    u_xlat3_ = clamp(_e231, 0f, 1f);
    let _e235 = u_xlat0_;
    let _e237 = u_xlat12_;
    let _e239 = u_xlat0_;
    let _e245 = _f_buffer1_.f_cb1_[9];
    let _e247 = ((vec3(_e237) * _e239.xyz) + _e245.xyz);
    u_xlat0_.x = _e247.x;
    u_xlat0_.y = _e247.y;
    u_xlat0_.z = _e247.z;
    let _e259 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e259.w);
    let _e262 = u_xlat12_;
    let _e263 = u_xlat5_;
    u_xlat12_ = (_e262 * _e263.y);
    let _e266 = u_xlat7_;
    let _e271 = _f_buffer1_.f_cb1_[9];
    let _e276 = _f_buffer1_.f_cb1_[10];
    let _e279 = (_e271.xyz + -(_e276.xyz));
    u_xlat7_.x = _e279.x;
    u_xlat7_.y = _e279.y;
    u_xlat7_.z = _e279.z;
    let _e286 = u_xlat7_;
    let _e288 = u_xlat12_;
    let _e290 = u_xlat7_;
    let _e296 = _f_buffer1_.f_cb1_[10];
    let _e298 = ((vec3(_e288) * _e290.xyz) + _e296.xyz);
    u_xlat7_.x = _e298.x;
    u_xlat7_.y = _e298.y;
    u_xlat7_.z = _e298.z;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat0_;
    let _e309 = u_xlat7_;
    let _e312 = (_e307.xyz + -(_e309.xyz));
    u_xlat0_.x = _e312.x;
    u_xlat0_.y = _e312.y;
    u_xlat0_.z = _e312.z;
    let _e319 = u_xlat0_;
    let _e321 = u_xlat3_;
    let _e323 = u_xlat0_;
    let _e326 = u_xlat7_;
    let _e328 = ((vec3(_e321) * _e323.xyz) + _e326.xyz);
    u_xlat0_.x = _e328.x;
    u_xlat0_.y = _e328.y;
    u_xlat0_.z = _e328.z;
    let _e335 = u_xlat0_;
    let _e337 = u_xlat0_;
    let _e339 = u_xlat5_;
    let _e341 = (_e337.xyz * _e339.xyz);
    u_xlat0_.x = _e341.x;
    u_xlat0_.y = _e341.y;
    u_xlat0_.z = _e341.z;
    let _e348 = u_xlat2_;
    let _e350 = u_xlat0_;
    let _e355 = _f_buffer1_.f_cb1_[2];
    let _e357 = (_e350.xyz * _e355.xxx);
    u_xlat2_.x = _e357.x;
    u_xlat2_.y = _e357.y;
    u_xlat2_.z = _e357.z;
    let _e365 = vs_TEXCOORD1_1;
    let _e369 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e365 + -(_e369.z));
    let _e374 = u_xlat0_;
    u_xlat0_.x = clamp(_e374.x, 0f, 1f);
    let _e380 = u_xlat0_;
    u_xlat0_.x = (_e380.x + -0.00001f);
    let _e385 = u_xlat0_;
    let _e388 = u_xlat2_;
    u_xlat4_ = (-(_e385.x) + _e388.w);
    let _e391 = vs_TEXCOORD1_1;
    let _e395 = _f_buffer1_.f_cb1_[12];
    u_xlat8_ = (_e391 + _e395.z);
    let _e398 = u_xlat8_;
    u_xlat8_ = clamp(_e398, 0f, 1f);
    let _e403 = u_xlat0_;
    let _e406 = u_xlat8_;
    u_xlat0_.x = (-(_e403.x) + _e406);
    let _e411 = u_xlat0_;
    u_xlat0_.x = (1f / _e411.x);
    let _e415 = u_xlat0_;
    let _e417 = u_xlat4_;
    u_xlat0_.x = (_e415.x * _e417);
    let _e420 = u_xlat0_;
    u_xlat0_.x = clamp(_e420.x, 0f, 1f);
    let _e425 = u_xlat0_;
    u_xlat4_ = ((_e425.x * -2f) + 3f);
    let _e433 = u_xlat0_;
    let _e435 = u_xlat0_;
    u_xlat0_.x = (_e433.x * _e435.x);
    let _e439 = u_xlat0_;
    let _e441 = u_xlat4_;
    u_xlat0_.x = (_e439.x * _e441);
    let _e444 = u_xlat1_;
    let _e446 = u_xlat0_;
    u_xlat0_.x = (_e444.x * _e446.x);
    let _e449 = u_xlat0_;
    let _e451 = u_xlat2_;
    u_xlat0_ = (_e449.xxxx * _e451);
    let _e453 = u_xlat0_;
    let _e454 = vs_COLOR0_1;
    SV_Target0_ = (_e453 * _e454);
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
