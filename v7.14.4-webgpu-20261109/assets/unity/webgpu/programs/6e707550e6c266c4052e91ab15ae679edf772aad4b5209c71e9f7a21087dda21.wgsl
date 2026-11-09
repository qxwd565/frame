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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat5_: f32 = 0f;
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlat13_: f32 = 0f;

    let _e46 = u_xlat0_;
    let _e51 = _f_buffer1_.f_cb1_[8];
    let _e56 = _f_buffer1_.f_cb1_[9];
    let _e59 = (_e51.yzw + -(_e56.xyz));
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    u_xlat0_.z = _e59.z;
    let _e69 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e69.w) + 1f);
    let _e74 = vs_TEXCOORD0_1;
    u_xlat1_ = _e74.zwxy;
    let _e76 = u_xlat1_;
    u_xlat1_ = clamp(_e76, vec4(0f), vec4(1f));
    let _e82 = u_xlat1_;
    let _e83 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e82 + -(_e83.zwxy));
    let _e87 = u_xlat9_;
    let _e92 = _f_buffer1_.f_cb1_[3];
    let _e94 = u_xlat1_;
    let _e97 = vs_TEXCOORD0_1;
    let _e99 = ((_e92.zz * _e94.zw) + _e97.xy);
    u_xlat9_.x = _e99.x;
    u_xlat9_.y = _e99.y;
    let _e104 = u_xlat1_;
    let _e109 = _f_buffer1_.f_cb1_[6];
    let _e111 = u_xlat1_;
    let _e114 = vs_TEXCOORD0_1;
    let _e116 = ((_e109.xx * _e111.xy) + _e114.zw);
    u_xlat1_.x = _e116.x;
    u_xlat1_.y = _e116.y;
    let _e121 = u_xlat1_;
    let _e126 = _f_buffer0_.f_cb0_[4];
    let _e131 = hscard_bias.values[1];
    let _e134 = textureSampleBias(f_t1_, samplerf_s1_, _e121.xy, (_e126.x + _e131.x));
    u_xlat2_ = _e134;
    let _e136 = u_xlat2_;
    u_xlat1_.x = dot(_e136.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e144 = u_xlat1_;
    u_xlat1_.x = (_e144.x + -1f);
    let _e153 = _f_buffer1_.f_cb1_[7];
    let _e155 = u_xlat1_;
    u_xlat1_.x = ((_e153.w * _e155.x) + 1f);
    let _e160 = u_xlat9_;
    let _e165 = _f_buffer0_.f_cb0_[4];
    let _e170 = hscard_bias.values[0];
    let _e173 = textureSampleBias(f_t0_, samplerf_s0_, _e160.xy, (_e165.x + _e170.x));
    u_xlat2_ = _e173;
    let _e175 = u_xlat2_;
    u_xlat2_.w = dot(_e175.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e182 = u_xlat2_;
    let _e187 = _f_buffer1_.f_cb1_[2];
    u_xlat5_ = (_e182.w + _e187.y);
    let _e191 = u_xlat2_;
    let _e196 = _f_buffer1_.f_cb1_[3];
    u_xlat9_.x = max(_e191.w, _e196.y);
    let _e199 = u_xlat5_;
    let _e200 = u_xlat9_;
    let _e206 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e199 * _e200.x) + -(_e206.w));
    let _e210 = u_xlat9_;
    let _e212 = u_xlat5_;
    u_xlat5_ = (_e210.x * _e212);
    let _e214 = u_xlat13_;
    let _e215 = u_xlat12_;
    u_xlat12_ = (_e214 / _e215);
    let _e218 = u_xlat13_;
    u_xlat9_.x = (_e218 * 5f);
    let _e222 = u_xlat9_;
    u_xlat9_.x = clamp(_e222.x, 0f, 1f);
    let _e227 = u_xlat0_;
    let _e229 = u_xlat12_;
    let _e231 = u_xlat0_;
    let _e237 = _f_buffer1_.f_cb1_[9];
    let _e239 = ((vec3(_e229) * _e231.xyz) + _e237.xyz);
    u_xlat0_.x = _e239.x;
    u_xlat0_.y = _e239.y;
    u_xlat0_.z = _e239.z;
    let _e251 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e251.w);
    let _e254 = u_xlat12_;
    let _e255 = u_xlat5_;
    u_xlat12_ = (_e254 * _e255);
    let _e257 = u_xlat3_;
    let _e262 = _f_buffer1_.f_cb1_[9];
    let _e267 = _f_buffer1_.f_cb1_[10];
    let _e270 = (_e262.xyz + -(_e267.xyz));
    u_xlat3_.x = _e270.x;
    u_xlat3_.y = _e270.y;
    u_xlat3_.z = _e270.z;
    let _e277 = u_xlat3_;
    let _e279 = u_xlat12_;
    let _e281 = u_xlat3_;
    let _e287 = _f_buffer1_.f_cb1_[10];
    let _e289 = ((vec3(_e279) * _e281.xyz) + _e287.xyz);
    u_xlat3_.x = _e289.x;
    u_xlat3_.y = _e289.y;
    u_xlat3_.z = _e289.z;
    let _e296 = u_xlat0_;
    let _e298 = u_xlat0_;
    let _e300 = u_xlat3_;
    let _e303 = (_e298.xyz + -(_e300.xyz));
    u_xlat0_.x = _e303.x;
    u_xlat0_.y = _e303.y;
    u_xlat0_.z = _e303.z;
    let _e310 = u_xlat0_;
    let _e312 = u_xlat9_;
    let _e314 = u_xlat0_;
    let _e317 = u_xlat3_;
    let _e319 = ((_e312.xxx * _e314.xyz) + _e317.xyz);
    u_xlat0_.x = _e319.x;
    u_xlat0_.y = _e319.y;
    u_xlat0_.z = _e319.z;
    let _e326 = u_xlat0_;
    let _e328 = u_xlat0_;
    let _e330 = u_xlat5_;
    let _e332 = (_e328.xyz * vec3(_e330));
    u_xlat0_.x = _e332.x;
    u_xlat0_.y = _e332.y;
    u_xlat0_.z = _e332.z;
    let _e339 = u_xlat2_;
    let _e341 = u_xlat0_;
    let _e346 = _f_buffer1_.f_cb1_[2];
    let _e348 = (_e341.xyz * _e346.xxx);
    u_xlat2_.x = _e348.x;
    u_xlat2_.y = _e348.y;
    u_xlat2_.z = _e348.z;
    let _e355 = u_xlat1_;
    let _e357 = u_xlat2_;
    u_xlat0_ = (_e355.xxxx * _e357);
    let _e360 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e360;
    let _e362 = u_xlat1_;
    u_xlat1_.x = clamp(_e362.x, 0f, 1f);
    let _e367 = u_xlat1_;
    let _e369 = vs_COLOR0_1;
    u_xlat1_ = (_e367.xxxx * _e369);
    let _e371 = u_xlat0_;
    let _e372 = u_xlat1_;
    SV_Target0_ = (_e371 * _e372);
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
