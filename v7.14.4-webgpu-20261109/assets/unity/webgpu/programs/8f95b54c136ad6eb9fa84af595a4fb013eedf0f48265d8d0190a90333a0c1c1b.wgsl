struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 11>,
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
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);

    let _e45 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (-(_e45.w) + 1f);
    let _e50 = u_xlat4_;
    let _e52 = vs_TEXCOORD0_1;
    let _e53 = _e52.xy;
    u_xlat4_.x = _e53.x;
    u_xlat4_.y = _e53.y;
    let _e58 = u_xlat4_;
    let _e60 = u_xlat4_;
    let _e66 = clamp(_e60.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e66.x;
    u_xlat4_.y = _e66.y;
    let _e71 = u_xlat4_;
    let _e73 = u_xlat4_;
    let _e75 = vs_TEXCOORD0_1;
    let _e78 = (_e73.xy + -(_e75.xy));
    u_xlat4_.x = _e78.x;
    u_xlat4_.y = _e78.y;
    let _e83 = u_xlat4_;
    let _e88 = _f_buffer1_.f_cb1_[3];
    let _e90 = u_xlat4_;
    let _e93 = vs_TEXCOORD0_1;
    let _e95 = ((_e88.zz * _e90.xy) + _e93.xy);
    u_xlat4_.x = _e95.x;
    u_xlat4_.y = _e95.y;
    let _e100 = u_xlat4_;
    let _e105 = _f_buffer0_.f_cb0_[4];
    let _e110 = hscard_bias.values[0];
    let _e113 = textureSampleBias(f_t0_, samplerf_s0_, _e100.xy, (_e105.x + _e110.x));
    u_xlat1_ = _e113;
    let _e114 = u_xlat4_;
    let _e116 = u_xlat1_;
    let _e121 = _f_buffer1_.f_cb1_[2];
    let _e123 = (_e116.xyz + _e121.yyy);
    u_xlat4_.x = _e123.x;
    u_xlat4_.y = _e123.y;
    u_xlat4_.z = _e123.z;
    let _e131 = u_xlat1_;
    let _e136 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e131.w, _e136.y);
    let _e140 = u_xlat4_;
    let _e142 = u_xlat2_;
    let _e148 = _f_buffer1_.f_cb1_[10];
    u_xlat6_.x = ((_e140.y * _e142.x) + -(_e148.w));
    let _e152 = u_xlat4_;
    let _e154 = u_xlat4_;
    let _e156 = u_xlat2_;
    let _e158 = (_e154.xyz * _e156.xxx);
    u_xlat4_.x = _e158.x;
    u_xlat4_.y = _e158.y;
    u_xlat4_.z = _e158.z;
    let _e166 = u_xlat6_;
    let _e168 = u_xlat0_;
    u_xlat0_.x = (_e166.x / _e168.x);
    let _e172 = u_xlat6_;
    u_xlat2_.x = (_e172.x * 5f);
    let _e177 = u_xlat2_;
    u_xlat2_.x = clamp(_e177.x, 0f, 1f);
    let _e182 = u_xlat6_;
    let _e187 = _f_buffer1_.f_cb1_[8];
    let _e192 = _f_buffer1_.f_cb1_[9];
    let _e195 = (_e187.yzw + -(_e192.xyz));
    u_xlat6_.x = _e195.x;
    u_xlat6_.y = _e195.y;
    u_xlat6_.z = _e195.z;
    let _e202 = u_xlat6_;
    let _e204 = u_xlat0_;
    let _e206 = u_xlat6_;
    let _e212 = _f_buffer1_.f_cb1_[9];
    let _e214 = ((_e204.xxx * _e206.xyz) + _e212.xyz);
    u_xlat6_.x = _e214.x;
    u_xlat6_.y = _e214.y;
    u_xlat6_.z = _e214.z;
    let _e227 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (1f / _e227.w);
    let _e231 = u_xlat0_;
    let _e233 = u_xlat4_;
    u_xlat0_.x = (_e231.x * _e233.y);
    let _e236 = u_xlat3_;
    let _e241 = _f_buffer1_.f_cb1_[9];
    let _e246 = _f_buffer1_.f_cb1_[10];
    let _e249 = (_e241.xyz + -(_e246.xyz));
    u_xlat3_.x = _e249.x;
    u_xlat3_.y = _e249.y;
    u_xlat3_.z = _e249.z;
    let _e256 = u_xlat3_;
    let _e258 = u_xlat0_;
    let _e260 = u_xlat3_;
    let _e266 = _f_buffer1_.f_cb1_[10];
    let _e268 = ((_e258.xxx * _e260.xyz) + _e266.xyz);
    u_xlat3_.x = _e268.x;
    u_xlat3_.y = _e268.y;
    u_xlat3_.z = _e268.z;
    let _e275 = u_xlat6_;
    let _e277 = u_xlat6_;
    let _e279 = u_xlat3_;
    let _e282 = (_e277.xyz + -(_e279.xyz));
    u_xlat6_.x = _e282.x;
    u_xlat6_.y = _e282.y;
    u_xlat6_.z = _e282.z;
    let _e289 = u_xlat2_;
    let _e291 = u_xlat2_;
    let _e293 = u_xlat6_;
    let _e296 = u_xlat3_;
    let _e298 = ((_e291.xxx * _e293.xyz) + _e296.xyz);
    u_xlat2_.x = _e298.x;
    u_xlat2_.y = _e298.y;
    u_xlat2_.z = _e298.z;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat4_;
    let _e309 = u_xlat2_;
    let _e311 = (_e307.xyz * _e309.xyz);
    u_xlat0_.x = _e311.x;
    u_xlat0_.y = _e311.y;
    u_xlat0_.z = _e311.z;
    let _e318 = u_xlat1_;
    let _e320 = u_xlat0_;
    let _e325 = _f_buffer1_.f_cb1_[2];
    let _e327 = (_e320.xyz * _e325.xxx);
    u_xlat1_.x = _e327.x;
    u_xlat1_.y = _e327.y;
    u_xlat1_.z = _e327.z;
    let _e334 = vs_TEXCOORD0_1;
    let _e339 = _f_buffer0_.f_cb0_[4];
    let _e344 = hscard_bias.values[1];
    let _e347 = textureSampleBias(f_t1_, samplerf_s1_, _e334.zw, (_e339.x + _e344.x));
    u_xlat0_ = _e347;
    let _e348 = u_xlat0_;
    let _e350 = vs_COLOR1_1;
    let _e352 = u_xlat1_;
    u_xlat0_ = ((_e348.xyzx * _e350) + _e352);
    let _e354 = u_xlat0_;
    let _e355 = vs_COLOR0_1;
    SV_Target0_ = (_e354 * _e355);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
