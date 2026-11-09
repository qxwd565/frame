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
    u_xlat1_.x = (_e135.w + -1f);
    let _e144 = _f_buffer1_.f_cb1_[7];
    let _e146 = u_xlat1_;
    u_xlat1_.x = ((_e144.w * _e146.x) + 1f);
    let _e151 = u_xlat9_;
    let _e156 = _f_buffer0_.f_cb0_[4];
    let _e161 = hscard_bias.values[0];
    let _e164 = textureSampleBias(f_t0_, samplerf_s0_, _e151.xy, (_e156.x + _e161.x));
    u_xlat2_ = _e164;
    let _e165 = u_xlat2_;
    let _e170 = _f_buffer1_.f_cb1_[2];
    u_xlat5_ = (_e165.w + _e170.y);
    let _e174 = u_xlat2_;
    let _e179 = _f_buffer1_.f_cb1_[3];
    u_xlat9_.x = max(_e174.w, _e179.y);
    let _e182 = u_xlat5_;
    let _e183 = u_xlat9_;
    let _e189 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e182 * _e183.x) + -(_e189.w));
    let _e193 = u_xlat9_;
    let _e195 = u_xlat5_;
    u_xlat5_ = (_e193.x * _e195);
    let _e197 = u_xlat13_;
    let _e198 = u_xlat12_;
    u_xlat12_ = (_e197 / _e198);
    let _e201 = u_xlat13_;
    u_xlat9_.x = (_e201 * 5f);
    let _e205 = u_xlat9_;
    u_xlat9_.x = clamp(_e205.x, 0f, 1f);
    let _e210 = u_xlat0_;
    let _e212 = u_xlat12_;
    let _e214 = u_xlat0_;
    let _e220 = _f_buffer1_.f_cb1_[9];
    let _e222 = ((vec3(_e212) * _e214.xyz) + _e220.xyz);
    u_xlat0_.x = _e222.x;
    u_xlat0_.y = _e222.y;
    u_xlat0_.z = _e222.z;
    let _e234 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e234.w);
    let _e237 = u_xlat12_;
    let _e238 = u_xlat5_;
    u_xlat12_ = (_e237 * _e238);
    let _e240 = u_xlat3_;
    let _e245 = _f_buffer1_.f_cb1_[9];
    let _e250 = _f_buffer1_.f_cb1_[10];
    let _e253 = (_e245.xyz + -(_e250.xyz));
    u_xlat3_.x = _e253.x;
    u_xlat3_.y = _e253.y;
    u_xlat3_.z = _e253.z;
    let _e260 = u_xlat3_;
    let _e262 = u_xlat12_;
    let _e264 = u_xlat3_;
    let _e270 = _f_buffer1_.f_cb1_[10];
    let _e272 = ((vec3(_e262) * _e264.xyz) + _e270.xyz);
    u_xlat3_.x = _e272.x;
    u_xlat3_.y = _e272.y;
    u_xlat3_.z = _e272.z;
    let _e279 = u_xlat0_;
    let _e281 = u_xlat0_;
    let _e283 = u_xlat3_;
    let _e286 = (_e281.xyz + -(_e283.xyz));
    u_xlat0_.x = _e286.x;
    u_xlat0_.y = _e286.y;
    u_xlat0_.z = _e286.z;
    let _e293 = u_xlat0_;
    let _e295 = u_xlat9_;
    let _e297 = u_xlat0_;
    let _e300 = u_xlat3_;
    let _e302 = ((_e295.xxx * _e297.xyz) + _e300.xyz);
    u_xlat0_.x = _e302.x;
    u_xlat0_.y = _e302.y;
    u_xlat0_.z = _e302.z;
    let _e309 = u_xlat0_;
    let _e311 = u_xlat0_;
    let _e313 = u_xlat5_;
    let _e315 = (_e311.xyz * vec3(_e313));
    u_xlat0_.x = _e315.x;
    u_xlat0_.y = _e315.y;
    u_xlat0_.z = _e315.z;
    let _e322 = u_xlat2_;
    let _e324 = u_xlat0_;
    let _e329 = _f_buffer1_.f_cb1_[2];
    let _e331 = (_e324.xyz * _e329.xxx);
    u_xlat2_.x = _e331.x;
    u_xlat2_.y = _e331.y;
    u_xlat2_.z = _e331.z;
    let _e338 = u_xlat1_;
    let _e340 = u_xlat2_;
    u_xlat0_ = (_e338.xxxx * _e340);
    let _e342 = u_xlat0_;
    let _e343 = vs_COLOR0_1;
    SV_Target0_ = (_e342 * _e343);
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
