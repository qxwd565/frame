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
    var u_xlat14_: f32 = 0f;

    let _e54 = u_xlat0_;
    let _e59 = _f_buffer1_.f_cb1_[8];
    let _e64 = _f_buffer1_.f_cb1_[9];
    let _e67 = (_e59.yzw + -(_e64.xyz));
    u_xlat0_.x = _e67.x;
    u_xlat0_.y = _e67.y;
    u_xlat0_.z = _e67.z;
    let _e77 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e77.w) + 1f);
    let _e82 = vs_TEXCOORD0_1;
    u_xlat1_ = _e82.zwxy;
    let _e84 = u_xlat1_;
    u_xlat1_ = clamp(_e84, vec4(0f), vec4(1f));
    let _e90 = u_xlat1_;
    let _e91 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e90 + -(_e91.zwxy));
    let _e95 = u_xlat9_;
    let _e100 = _f_buffer1_.f_cb1_[3];
    let _e102 = u_xlat1_;
    let _e105 = vs_TEXCOORD0_1;
    let _e107 = ((_e100.zz * _e102.zw) + _e105.xy);
    u_xlat9_.x = _e107.x;
    u_xlat9_.y = _e107.y;
    let _e112 = u_xlat1_;
    let _e117 = _f_buffer1_.f_cb1_[6];
    let _e119 = u_xlat1_;
    let _e122 = vs_TEXCOORD0_1;
    let _e124 = ((_e117.xx * _e119.xy) + _e122.zw);
    u_xlat1_.x = _e124.x;
    u_xlat1_.y = _e124.y;
    let _e129 = u_xlat1_;
    let _e134 = _f_buffer0_.f_cb0_[4];
    let _e139 = hscard_bias.values[1];
    let _e142 = textureSampleBias(f_t1_, samplerf_s1_, _e129.xy, (_e134.x + _e139.x));
    u_xlat2_ = _e142;
    let _e143 = u_xlat9_;
    let _e148 = _f_buffer0_.f_cb0_[4];
    let _e153 = hscard_bias.values[0];
    let _e156 = textureSampleBias(f_t0_, samplerf_s0_, _e143.xy, (_e148.x + _e153.x));
    u_xlat1_ = _e156;
    let _e158 = u_xlat1_;
    u_xlat1_.w = dot(_e158.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e165 = u_xlat1_;
    let _e170 = _f_buffer1_.f_cb1_[2];
    u_xlat6_ = (_e165.w + _e170.y);
    let _e173 = u_xlat1_;
    let _e178 = _f_buffer1_.f_cb1_[3];
    u_xlat10_ = max(_e173.w, _e178.y);
    let _e181 = u_xlat6_;
    let _e182 = u_xlat10_;
    let _e187 = _f_buffer1_.f_cb1_[10];
    u_xlat14_ = ((_e181 * _e182) + -(_e187.w));
    let _e191 = u_xlat10_;
    let _e192 = u_xlat6_;
    u_xlat6_ = (_e191 * _e192);
    let _e194 = u_xlat14_;
    let _e195 = u_xlat12_;
    u_xlat12_ = (_e194 / _e195);
    let _e197 = u_xlat14_;
    u_xlat10_ = (_e197 * 5f);
    let _e200 = u_xlat10_;
    u_xlat10_ = clamp(_e200, 0f, 1f);
    let _e204 = u_xlat0_;
    let _e206 = u_xlat12_;
    let _e208 = u_xlat0_;
    let _e214 = _f_buffer1_.f_cb1_[9];
    let _e216 = ((vec3(_e206) * _e208.xyz) + _e214.xyz);
    u_xlat0_.x = _e216.x;
    u_xlat0_.y = _e216.y;
    u_xlat0_.z = _e216.z;
    let _e228 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e228.w);
    let _e231 = u_xlat12_;
    let _e232 = u_xlat6_;
    u_xlat12_ = (_e231 * _e232);
    let _e234 = u_xlat3_;
    let _e239 = _f_buffer1_.f_cb1_[9];
    let _e244 = _f_buffer1_.f_cb1_[10];
    let _e247 = (_e239.xyz + -(_e244.xyz));
    u_xlat3_.x = _e247.x;
    u_xlat3_.y = _e247.y;
    u_xlat3_.z = _e247.z;
    let _e254 = u_xlat3_;
    let _e256 = u_xlat12_;
    let _e258 = u_xlat3_;
    let _e264 = _f_buffer1_.f_cb1_[10];
    let _e266 = ((vec3(_e256) * _e258.xyz) + _e264.xyz);
    u_xlat3_.x = _e266.x;
    u_xlat3_.y = _e266.y;
    u_xlat3_.z = _e266.z;
    let _e273 = u_xlat0_;
    let _e275 = u_xlat0_;
    let _e277 = u_xlat3_;
    let _e280 = (_e275.xyz + -(_e277.xyz));
    u_xlat0_.x = _e280.x;
    u_xlat0_.y = _e280.y;
    u_xlat0_.z = _e280.z;
    let _e287 = u_xlat0_;
    let _e289 = u_xlat10_;
    let _e291 = u_xlat0_;
    let _e294 = u_xlat3_;
    let _e296 = ((vec3(_e289) * _e291.xyz) + _e294.xyz);
    u_xlat0_.x = _e296.x;
    u_xlat0_.y = _e296.y;
    u_xlat0_.z = _e296.z;
    let _e303 = u_xlat0_;
    let _e305 = u_xlat0_;
    let _e307 = u_xlat6_;
    let _e309 = (_e305.xyz * vec3(_e307));
    u_xlat0_.x = _e309.x;
    u_xlat0_.y = _e309.y;
    u_xlat0_.z = _e309.z;
    let _e316 = u_xlat1_;
    let _e318 = u_xlat0_;
    let _e323 = _f_buffer1_.f_cb1_[2];
    let _e325 = (_e318.xyz * _e323.xxx);
    u_xlat1_.x = _e325.x;
    u_xlat1_.y = _e325.y;
    u_xlat1_.z = _e325.z;
    let _e333 = vs_TEXCOORD1_1;
    let _e337 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e333 + _e337.y);
    let _e341 = u_xlat0_;
    u_xlat0_.x = ((_e341.x * 2f) + -1f);
    let _e349 = u_xlat0_;
    let _e352 = u_xlat2_;
    u_xlat0_.x = (-(_e349.x) + _e352.x);
    let _e356 = u_xlat0_;
    u_xlat0_.x = clamp(_e356.x, 0f, 1f);
    let _e362 = u_xlat0_;
    u_xlat0_.x = log2(_e362.x);
    let _e369 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e369.z * 10f);
    let _e374 = u_xlat0_;
    let _e376 = u_xlat4_;
    u_xlat0_.x = (_e374.x * _e376.x);
    let _e380 = u_xlat0_;
    u_xlat0_.x = exp2(_e380.x);
    let _e383 = u_xlat0_;
    let _e385 = u_xlat1_;
    u_xlat2_ = (_e383.xxxx * _e385);
    let _e388 = u_xlat0_;
    u_xlat0_.x = (-(_e388.x) + 1f);
    let _e394 = u_xlat0_;
    u_xlat0_.x = log2(_e394.x);
    let _e398 = u_xlat0_;
    u_xlat0_.x = (_e398.x * 10f);
    let _e403 = u_xlat0_;
    u_xlat0_.x = exp2(_e403.x);
    let _e407 = u_xlat2_;
    u_xlat4_.x = (_e407.w * 1000000f);
    let _e412 = u_xlat4_;
    u_xlat4_.x = clamp(_e412.x, 0f, 1f);
    let _e418 = u_xlat1_;
    let _e420 = u_xlat4_;
    u_xlat4_.x = (_e418.w * _e420.x);
    let _e424 = u_xlat4_;
    let _e426 = u_xlat0_;
    u_xlat0_.x = (_e424.x * _e426.x);
    let _e429 = u_xlat4_;
    let _e434 = _f_buffer1_.f_cb1_[7];
    let _e439 = _f_buffer1_.f_cb1_[8];
    let _e441 = (_e434.xyz * _e439.xxx);
    u_xlat4_.x = _e441.x;
    u_xlat4_.y = _e441.y;
    u_xlat4_.z = _e441.z;
    let _e448 = u_xlat0_;
    let _e450 = u_xlat0_;
    let _e452 = u_xlat4_;
    let _e454 = (_e450.xxx * _e452.xyz);
    u_xlat0_.x = _e454.x;
    u_xlat0_.y = _e454.y;
    u_xlat0_.z = _e454.z;
    let _e461 = u_xlat2_;
    let _e463 = u_xlat0_;
    let _e465 = vs_COLOR1_1;
    let _e468 = u_xlat2_;
    let _e470 = ((_e463.xyz * _e465.www) + _e468.xyz);
    u_xlat2_.x = _e470.x;
    u_xlat2_.y = _e470.y;
    u_xlat2_.z = _e470.z;
    let _e477 = u_xlat2_;
    let _e478 = vs_COLOR0_1;
    SV_Target0_ = (_e477 * _e478);
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
