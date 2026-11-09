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
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat5_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e52 = u_xlat0_;
    let _e57 = _f_buffer1_.f_cb1_[8];
    let _e62 = _f_buffer1_.f_cb1_[9];
    let _e65 = (_e57.yzw + -(_e62.xyz));
    u_xlat0_.x = _e65.x;
    u_xlat0_.y = _e65.y;
    u_xlat0_.z = _e65.z;
    let _e75 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e75.w) + 1f);
    let _e80 = vs_TEXCOORD0_1;
    u_xlat1_ = _e80.zwxy;
    let _e82 = u_xlat1_;
    u_xlat1_ = clamp(_e82, vec4(0f), vec4(1f));
    let _e88 = u_xlat1_;
    let _e89 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e88 + -(_e89.zwxy));
    let _e93 = u_xlat9_;
    let _e98 = _f_buffer1_.f_cb1_[3];
    let _e100 = u_xlat1_;
    let _e103 = vs_TEXCOORD0_1;
    let _e105 = ((_e98.zz * _e100.zw) + _e103.xy);
    u_xlat9_.x = _e105.x;
    u_xlat9_.y = _e105.y;
    let _e110 = u_xlat1_;
    let _e115 = _f_buffer1_.f_cb1_[6];
    let _e117 = u_xlat1_;
    let _e120 = vs_TEXCOORD0_1;
    let _e122 = ((_e115.xx * _e117.xy) + _e120.zw);
    u_xlat1_.x = _e122.x;
    u_xlat1_.y = _e122.y;
    let _e127 = u_xlat1_;
    let _e132 = _f_buffer0_.f_cb0_[4];
    let _e137 = hscard_bias.values[1];
    let _e140 = textureSampleBias(f_t1_, samplerf_s1_, _e127.xy, (_e132.x + _e137.x));
    u_xlat2_ = _e140;
    let _e142 = u_xlat2_;
    u_xlat1_.x = dot(_e142.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e149 = u_xlat9_;
    let _e154 = _f_buffer0_.f_cb0_[4];
    let _e159 = hscard_bias.values[0];
    let _e162 = textureSampleBias(f_t0_, samplerf_s0_, _e149.xy, (_e154.x + _e159.x));
    u_xlat2_ = _e162;
    let _e163 = u_xlat5_;
    let _e165 = u_xlat2_;
    let _e170 = _f_buffer1_.f_cb1_[2];
    let _e172 = (_e165.xyz + _e170.yyy);
    u_xlat5_.x = _e172.x;
    u_xlat5_.y = _e172.y;
    u_xlat5_.z = _e172.z;
    let _e179 = u_xlat2_;
    let _e184 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e179.w, _e184.y);
    let _e188 = u_xlat5_;
    let _e190 = u_xlat3_;
    let _e195 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e188.y * _e190) + -(_e195.w));
    let _e199 = u_xlat5_;
    let _e201 = u_xlat5_;
    let _e203 = u_xlat3_;
    let _e205 = (_e201.xyz * vec3(_e203));
    u_xlat5_.x = _e205.x;
    u_xlat5_.y = _e205.y;
    u_xlat5_.z = _e205.z;
    let _e212 = u_xlat7_;
    let _e214 = u_xlat12_;
    u_xlat12_ = (_e212.x / _e214);
    let _e216 = u_xlat7_;
    u_xlat3_ = (_e216.x * 5f);
    let _e220 = u_xlat3_;
    u_xlat3_ = clamp(_e220, 0f, 1f);
    let _e224 = u_xlat0_;
    let _e226 = u_xlat12_;
    let _e228 = u_xlat0_;
    let _e234 = _f_buffer1_.f_cb1_[9];
    let _e236 = ((vec3(_e226) * _e228.xyz) + _e234.xyz);
    u_xlat0_.x = _e236.x;
    u_xlat0_.y = _e236.y;
    u_xlat0_.z = _e236.z;
    let _e248 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e248.w);
    let _e251 = u_xlat12_;
    let _e252 = u_xlat5_;
    u_xlat12_ = (_e251 * _e252.y);
    let _e255 = u_xlat7_;
    let _e260 = _f_buffer1_.f_cb1_[9];
    let _e265 = _f_buffer1_.f_cb1_[10];
    let _e268 = (_e260.xyz + -(_e265.xyz));
    u_xlat7_.x = _e268.x;
    u_xlat7_.y = _e268.y;
    u_xlat7_.z = _e268.z;
    let _e275 = u_xlat7_;
    let _e277 = u_xlat12_;
    let _e279 = u_xlat7_;
    let _e285 = _f_buffer1_.f_cb1_[10];
    let _e287 = ((vec3(_e277) * _e279.xyz) + _e285.xyz);
    u_xlat7_.x = _e287.x;
    u_xlat7_.y = _e287.y;
    u_xlat7_.z = _e287.z;
    let _e294 = u_xlat0_;
    let _e296 = u_xlat0_;
    let _e298 = u_xlat7_;
    let _e301 = (_e296.xyz + -(_e298.xyz));
    u_xlat0_.x = _e301.x;
    u_xlat0_.y = _e301.y;
    u_xlat0_.z = _e301.z;
    let _e308 = u_xlat0_;
    let _e310 = u_xlat3_;
    let _e312 = u_xlat0_;
    let _e315 = u_xlat7_;
    let _e317 = ((vec3(_e310) * _e312.xyz) + _e315.xyz);
    u_xlat0_.x = _e317.x;
    u_xlat0_.y = _e317.y;
    u_xlat0_.z = _e317.z;
    let _e324 = u_xlat0_;
    let _e326 = u_xlat0_;
    let _e328 = u_xlat5_;
    let _e330 = (_e326.xyz * _e328.xyz);
    u_xlat0_.x = _e330.x;
    u_xlat0_.y = _e330.y;
    u_xlat0_.z = _e330.z;
    let _e337 = u_xlat2_;
    let _e339 = u_xlat0_;
    let _e344 = _f_buffer1_.f_cb1_[2];
    let _e346 = (_e339.xyz * _e344.xxx);
    u_xlat2_.x = _e346.x;
    u_xlat2_.y = _e346.y;
    u_xlat2_.z = _e346.z;
    let _e354 = vs_TEXCOORD1_1;
    let _e358 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e354 + _e358.y);
    let _e362 = u_xlat0_;
    u_xlat0_.x = ((_e362.x * 2f) + -1f);
    let _e370 = u_xlat0_;
    let _e373 = u_xlat1_;
    u_xlat0_.x = (-(_e370.x) + _e373.x);
    let _e377 = u_xlat0_;
    u_xlat0_.x = clamp(_e377.x, 0f, 1f);
    let _e383 = u_xlat0_;
    u_xlat0_.x = log2(_e383.x);
    let _e390 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e390.z * 10f);
    let _e395 = u_xlat0_;
    let _e397 = u_xlat4_;
    u_xlat0_.x = (_e395.x * _e397.x);
    let _e401 = u_xlat0_;
    u_xlat0_.x = exp2(_e401.x);
    let _e404 = u_xlat0_;
    let _e406 = u_xlat2_;
    u_xlat1_ = (_e404.xxxx * _e406);
    let _e409 = u_xlat0_;
    u_xlat0_.x = (-(_e409.x) + 1f);
    let _e415 = u_xlat0_;
    u_xlat0_.x = log2(_e415.x);
    let _e419 = u_xlat0_;
    u_xlat0_.x = (_e419.x * 10f);
    let _e424 = u_xlat0_;
    u_xlat0_.x = exp2(_e424.x);
    let _e428 = u_xlat1_;
    u_xlat4_.x = (_e428.w * 1000000f);
    let _e433 = u_xlat4_;
    u_xlat4_.x = clamp(_e433.x, 0f, 1f);
    let _e439 = u_xlat2_;
    let _e441 = u_xlat4_;
    u_xlat4_.x = (_e439.w * _e441.x);
    let _e445 = u_xlat4_;
    let _e447 = u_xlat0_;
    u_xlat0_.x = (_e445.x * _e447.x);
    let _e450 = u_xlat4_;
    let _e455 = _f_buffer1_.f_cb1_[7];
    let _e460 = _f_buffer1_.f_cb1_[8];
    let _e462 = (_e455.xyz * _e460.xxx);
    u_xlat4_.x = _e462.x;
    u_xlat4_.y = _e462.y;
    u_xlat4_.z = _e462.z;
    let _e469 = u_xlat0_;
    let _e471 = u_xlat0_;
    let _e473 = u_xlat4_;
    let _e475 = (_e471.xxx * _e473.xyz);
    u_xlat0_.x = _e475.x;
    u_xlat0_.y = _e475.y;
    u_xlat0_.z = _e475.z;
    let _e482 = u_xlat1_;
    let _e484 = u_xlat0_;
    let _e486 = vs_COLOR1_1;
    let _e489 = u_xlat1_;
    let _e491 = ((_e484.xyz * _e486.www) + _e489.xyz);
    u_xlat1_.x = _e491.x;
    u_xlat1_.y = _e491.y;
    u_xlat1_.z = _e491.z;
    let _e498 = u_xlat1_;
    let _e499 = vs_COLOR0_1;
    SV_Target0_ = (_e498 * _e499);
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
