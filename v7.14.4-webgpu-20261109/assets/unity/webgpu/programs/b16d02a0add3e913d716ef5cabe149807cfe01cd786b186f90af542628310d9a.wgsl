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

    let _e45 = u_xlat0_;
    let _e50 = _f_buffer1_.f_cb1_[8];
    let _e55 = _f_buffer1_.f_cb1_[9];
    let _e58 = (_e50.yzw + -(_e55.xyz));
    u_xlat0_.x = _e58.x;
    u_xlat0_.y = _e58.y;
    u_xlat0_.z = _e58.z;
    let _e68 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e68.w) + 1f);
    let _e73 = vs_TEXCOORD0_1;
    u_xlat1_ = _e73.zwxy;
    let _e75 = u_xlat1_;
    u_xlat1_ = clamp(_e75, vec4(0f), vec4(1f));
    let _e81 = u_xlat1_;
    let _e82 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e81 + -(_e82.zwxy));
    let _e86 = u_xlat9_;
    let _e91 = _f_buffer1_.f_cb1_[3];
    let _e93 = u_xlat1_;
    let _e96 = vs_TEXCOORD0_1;
    let _e98 = ((_e91.zz * _e93.zw) + _e96.xy);
    u_xlat9_.x = _e98.x;
    u_xlat9_.y = _e98.y;
    let _e103 = u_xlat1_;
    let _e108 = _f_buffer1_.f_cb1_[6];
    let _e110 = u_xlat1_;
    let _e113 = vs_TEXCOORD0_1;
    let _e115 = ((_e108.xx * _e110.xy) + _e113.zw);
    u_xlat1_.x = _e115.x;
    u_xlat1_.y = _e115.y;
    let _e120 = u_xlat1_;
    let _e125 = _f_buffer0_.f_cb0_[4];
    let _e130 = hscard_bias.values[1];
    let _e133 = textureSampleBias(f_t1_, samplerf_s1_, _e120.xy, (_e125.x + _e130.x));
    u_xlat2_ = _e133;
    let _e135 = u_xlat2_;
    u_xlat1_.x = (_e135.x + -1f);
    let _e144 = _f_buffer1_.f_cb1_[7];
    let _e146 = u_xlat1_;
    u_xlat1_.x = ((_e144.w * _e146.x) + 1f);
    let _e151 = u_xlat9_;
    let _e156 = _f_buffer0_.f_cb0_[4];
    let _e161 = hscard_bias.values[0];
    let _e164 = textureSampleBias(f_t0_, samplerf_s0_, _e151.xy, (_e156.x + _e161.x));
    u_xlat2_ = _e164;
    let _e166 = u_xlat2_;
    u_xlat2_.w = dot(_e166.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e173 = u_xlat2_;
    let _e178 = _f_buffer1_.f_cb1_[2];
    u_xlat5_ = (_e173.w + _e178.y);
    let _e182 = u_xlat2_;
    let _e187 = _f_buffer1_.f_cb1_[3];
    u_xlat9_.x = max(_e182.w, _e187.y);
    let _e190 = u_xlat5_;
    let _e191 = u_xlat9_;
    let _e197 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e190 * _e191.x) + -(_e197.w));
    let _e201 = u_xlat9_;
    let _e203 = u_xlat5_;
    u_xlat5_ = (_e201.x * _e203);
    let _e205 = u_xlat13_;
    let _e206 = u_xlat12_;
    u_xlat12_ = (_e205 / _e206);
    let _e209 = u_xlat13_;
    u_xlat9_.x = (_e209 * 5f);
    let _e213 = u_xlat9_;
    u_xlat9_.x = clamp(_e213.x, 0f, 1f);
    let _e218 = u_xlat0_;
    let _e220 = u_xlat12_;
    let _e222 = u_xlat0_;
    let _e228 = _f_buffer1_.f_cb1_[9];
    let _e230 = ((vec3(_e220) * _e222.xyz) + _e228.xyz);
    u_xlat0_.x = _e230.x;
    u_xlat0_.y = _e230.y;
    u_xlat0_.z = _e230.z;
    let _e242 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e242.w);
    let _e245 = u_xlat12_;
    let _e246 = u_xlat5_;
    u_xlat12_ = (_e245 * _e246);
    let _e248 = u_xlat3_;
    let _e253 = _f_buffer1_.f_cb1_[9];
    let _e258 = _f_buffer1_.f_cb1_[10];
    let _e261 = (_e253.xyz + -(_e258.xyz));
    u_xlat3_.x = _e261.x;
    u_xlat3_.y = _e261.y;
    u_xlat3_.z = _e261.z;
    let _e268 = u_xlat3_;
    let _e270 = u_xlat12_;
    let _e272 = u_xlat3_;
    let _e278 = _f_buffer1_.f_cb1_[10];
    let _e280 = ((vec3(_e270) * _e272.xyz) + _e278.xyz);
    u_xlat3_.x = _e280.x;
    u_xlat3_.y = _e280.y;
    u_xlat3_.z = _e280.z;
    let _e287 = u_xlat0_;
    let _e289 = u_xlat0_;
    let _e291 = u_xlat3_;
    let _e294 = (_e289.xyz + -(_e291.xyz));
    u_xlat0_.x = _e294.x;
    u_xlat0_.y = _e294.y;
    u_xlat0_.z = _e294.z;
    let _e301 = u_xlat0_;
    let _e303 = u_xlat9_;
    let _e305 = u_xlat0_;
    let _e308 = u_xlat3_;
    let _e310 = ((_e303.xxx * _e305.xyz) + _e308.xyz);
    u_xlat0_.x = _e310.x;
    u_xlat0_.y = _e310.y;
    u_xlat0_.z = _e310.z;
    let _e317 = u_xlat0_;
    let _e319 = u_xlat0_;
    let _e321 = u_xlat5_;
    let _e323 = (_e319.xyz * vec3(_e321));
    u_xlat0_.x = _e323.x;
    u_xlat0_.y = _e323.y;
    u_xlat0_.z = _e323.z;
    let _e330 = u_xlat2_;
    let _e332 = u_xlat0_;
    let _e337 = _f_buffer1_.f_cb1_[2];
    let _e339 = (_e332.xyz * _e337.xxx);
    u_xlat2_.x = _e339.x;
    u_xlat2_.y = _e339.y;
    u_xlat2_.z = _e339.z;
    let _e346 = u_xlat1_;
    let _e348 = u_xlat2_;
    u_xlat0_ = (_e346.xxxx * _e348);
    let _e350 = u_xlat0_;
    let _e351 = vs_COLOR0_1;
    SV_Target0_ = (_e350 * _e351);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
