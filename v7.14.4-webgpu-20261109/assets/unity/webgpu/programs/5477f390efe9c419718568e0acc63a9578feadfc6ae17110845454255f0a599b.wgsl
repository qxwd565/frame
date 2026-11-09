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
    var u_xlat6_: f32 = 0f;
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat10_: f32 = 0f;
    var u_xlat12_: f32 = 0f;

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
    let _e140 = u_xlat9_;
    let _e145 = _f_buffer0_.f_cb0_[4];
    let _e150 = hscard_bias.values[0];
    let _e153 = textureSampleBias(f_t0_, samplerf_s0_, _e140.xy, (_e145.x + _e150.x));
    u_xlat1_ = _e153;
    let _e155 = u_xlat1_;
    let _e160 = _f_buffer1_.f_cb1_[2];
    u_xlat2_.x = (_e155.w + _e160.y);
    let _e163 = u_xlat1_;
    let _e168 = _f_buffer1_.f_cb1_[3];
    u_xlat6_ = max(_e163.w, _e168.y);
    let _e171 = u_xlat2_;
    let _e173 = u_xlat6_;
    let _e178 = _f_buffer1_.f_cb1_[10];
    u_xlat10_ = ((_e171.x * _e173) + -(_e178.w));
    let _e183 = u_xlat6_;
    let _e184 = u_xlat2_;
    u_xlat2_.x = (_e183 * _e184.x);
    let _e187 = u_xlat10_;
    let _e188 = u_xlat12_;
    u_xlat12_ = (_e187 / _e188);
    let _e190 = u_xlat10_;
    u_xlat6_ = (_e190 * 5f);
    let _e193 = u_xlat6_;
    u_xlat6_ = clamp(_e193, 0f, 1f);
    let _e197 = u_xlat0_;
    let _e199 = u_xlat12_;
    let _e201 = u_xlat0_;
    let _e207 = _f_buffer1_.f_cb1_[9];
    let _e209 = ((vec3(_e199) * _e201.xyz) + _e207.xyz);
    u_xlat0_.x = _e209.x;
    u_xlat0_.y = _e209.y;
    u_xlat0_.z = _e209.z;
    let _e221 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e221.w);
    let _e224 = u_xlat12_;
    let _e225 = u_xlat2_;
    u_xlat12_ = (_e224 * _e225.x);
    let _e228 = u_xlat3_;
    let _e233 = _f_buffer1_.f_cb1_[9];
    let _e238 = _f_buffer1_.f_cb1_[10];
    let _e241 = (_e233.xyz + -(_e238.xyz));
    u_xlat3_.x = _e241.x;
    u_xlat3_.y = _e241.y;
    u_xlat3_.z = _e241.z;
    let _e248 = u_xlat3_;
    let _e250 = u_xlat12_;
    let _e252 = u_xlat3_;
    let _e258 = _f_buffer1_.f_cb1_[10];
    let _e260 = ((vec3(_e250) * _e252.xyz) + _e258.xyz);
    u_xlat3_.x = _e260.x;
    u_xlat3_.y = _e260.y;
    u_xlat3_.z = _e260.z;
    let _e267 = u_xlat0_;
    let _e269 = u_xlat0_;
    let _e271 = u_xlat3_;
    let _e274 = (_e269.xyz + -(_e271.xyz));
    u_xlat0_.x = _e274.x;
    u_xlat0_.y = _e274.y;
    u_xlat0_.z = _e274.z;
    let _e281 = u_xlat0_;
    let _e283 = u_xlat6_;
    let _e285 = u_xlat0_;
    let _e288 = u_xlat3_;
    let _e290 = ((vec3(_e283) * _e285.xyz) + _e288.xyz);
    u_xlat0_.x = _e290.x;
    u_xlat0_.y = _e290.y;
    u_xlat0_.z = _e290.z;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat0_;
    let _e301 = u_xlat2_;
    let _e303 = (_e299.xyz * _e301.xxx);
    u_xlat0_.x = _e303.x;
    u_xlat0_.y = _e303.y;
    u_xlat0_.z = _e303.z;
    let _e310 = u_xlat1_;
    let _e312 = u_xlat0_;
    let _e317 = _f_buffer1_.f_cb1_[2];
    let _e319 = (_e312.xyz * _e317.xxx);
    u_xlat1_.x = _e319.x;
    u_xlat1_.y = _e319.y;
    u_xlat1_.z = _e319.z;
    let _e327 = vs_TEXCOORD1_1;
    let _e331 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e327 + _e331.y);
    let _e335 = u_xlat0_;
    u_xlat0_.x = ((_e335.x * 2f) + -1f);
    let _e343 = u_xlat0_;
    let _e346 = u_xlat2_;
    u_xlat0_.x = (-(_e343.x) + _e346.w);
    let _e350 = u_xlat0_;
    u_xlat0_.x = clamp(_e350.x, 0f, 1f);
    let _e356 = u_xlat0_;
    u_xlat0_.x = log2(_e356.x);
    let _e363 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e363.z * 10f);
    let _e368 = u_xlat0_;
    let _e370 = u_xlat4_;
    u_xlat0_.x = (_e368.x * _e370.x);
    let _e374 = u_xlat0_;
    u_xlat0_.x = exp2(_e374.x);
    let _e377 = u_xlat0_;
    let _e379 = u_xlat1_;
    u_xlat2_ = (_e377.xxxx * _e379);
    let _e382 = u_xlat0_;
    u_xlat0_.x = (-(_e382.x) + 1f);
    let _e388 = u_xlat0_;
    u_xlat0_.x = log2(_e388.x);
    let _e392 = u_xlat0_;
    u_xlat0_.x = (_e392.x * 10f);
    let _e397 = u_xlat0_;
    u_xlat0_.x = exp2(_e397.x);
    let _e401 = u_xlat2_;
    u_xlat4_.x = (_e401.w * 1000000f);
    let _e406 = u_xlat4_;
    u_xlat4_.x = clamp(_e406.x, 0f, 1f);
    let _e412 = u_xlat1_;
    let _e414 = u_xlat4_;
    u_xlat4_.x = (_e412.w * _e414.x);
    let _e418 = u_xlat4_;
    let _e420 = u_xlat0_;
    u_xlat0_.x = (_e418.x * _e420.x);
    let _e423 = u_xlat4_;
    let _e428 = _f_buffer1_.f_cb1_[7];
    let _e433 = _f_buffer1_.f_cb1_[8];
    let _e435 = (_e428.xyz * _e433.xxx);
    u_xlat4_.x = _e435.x;
    u_xlat4_.y = _e435.y;
    u_xlat4_.z = _e435.z;
    let _e442 = u_xlat0_;
    let _e444 = u_xlat0_;
    let _e446 = u_xlat4_;
    let _e448 = (_e444.xxx * _e446.xyz);
    u_xlat0_.x = _e448.x;
    u_xlat0_.y = _e448.y;
    u_xlat0_.z = _e448.z;
    let _e455 = u_xlat2_;
    let _e457 = u_xlat0_;
    let _e459 = vs_COLOR1_1;
    let _e462 = u_xlat2_;
    let _e464 = ((_e457.xyz * _e459.www) + _e462.xyz);
    u_xlat2_.x = _e464.x;
    u_xlat2_.y = _e464.y;
    u_xlat2_.z = _e464.z;
    let _e471 = u_xlat2_;
    let _e472 = vs_COLOR0_1;
    SV_Target0_ = (_e471 * _e472);
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
