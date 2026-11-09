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
    u_xlat1_.x = (_e136.x + -1f);
    let _e145 = _f_buffer1_.f_cb1_[7];
    let _e147 = u_xlat1_;
    u_xlat1_.x = ((_e145.w * _e147.x) + 1f);
    let _e152 = u_xlat9_;
    let _e157 = _f_buffer0_.f_cb0_[4];
    let _e162 = hscard_bias.values[0];
    let _e165 = textureSampleBias(f_t0_, samplerf_s0_, _e152.xy, (_e157.x + _e162.x));
    u_xlat2_ = _e165;
    let _e167 = u_xlat2_;
    u_xlat2_.w = dot(_e167.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e174 = u_xlat2_;
    let _e179 = _f_buffer1_.f_cb1_[2];
    u_xlat5_ = (_e174.w + _e179.y);
    let _e183 = u_xlat2_;
    let _e188 = _f_buffer1_.f_cb1_[3];
    u_xlat9_.x = max(_e183.w, _e188.y);
    let _e191 = u_xlat5_;
    let _e192 = u_xlat9_;
    let _e198 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = ((_e191 * _e192.x) + -(_e198.w));
    let _e202 = u_xlat9_;
    let _e204 = u_xlat5_;
    u_xlat5_ = (_e202.x * _e204);
    let _e206 = u_xlat13_;
    let _e207 = u_xlat12_;
    u_xlat12_ = (_e206 / _e207);
    let _e210 = u_xlat13_;
    u_xlat9_.x = (_e210 * 5f);
    let _e214 = u_xlat9_;
    u_xlat9_.x = clamp(_e214.x, 0f, 1f);
    let _e219 = u_xlat0_;
    let _e221 = u_xlat12_;
    let _e223 = u_xlat0_;
    let _e229 = _f_buffer1_.f_cb1_[9];
    let _e231 = ((vec3(_e221) * _e223.xyz) + _e229.xyz);
    u_xlat0_.x = _e231.x;
    u_xlat0_.y = _e231.y;
    u_xlat0_.z = _e231.z;
    let _e243 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e243.w);
    let _e246 = u_xlat12_;
    let _e247 = u_xlat5_;
    u_xlat12_ = (_e246 * _e247);
    let _e249 = u_xlat3_;
    let _e254 = _f_buffer1_.f_cb1_[9];
    let _e259 = _f_buffer1_.f_cb1_[10];
    let _e262 = (_e254.xyz + -(_e259.xyz));
    u_xlat3_.x = _e262.x;
    u_xlat3_.y = _e262.y;
    u_xlat3_.z = _e262.z;
    let _e269 = u_xlat3_;
    let _e271 = u_xlat12_;
    let _e273 = u_xlat3_;
    let _e279 = _f_buffer1_.f_cb1_[10];
    let _e281 = ((vec3(_e271) * _e273.xyz) + _e279.xyz);
    u_xlat3_.x = _e281.x;
    u_xlat3_.y = _e281.y;
    u_xlat3_.z = _e281.z;
    let _e288 = u_xlat0_;
    let _e290 = u_xlat0_;
    let _e292 = u_xlat3_;
    let _e295 = (_e290.xyz + -(_e292.xyz));
    u_xlat0_.x = _e295.x;
    u_xlat0_.y = _e295.y;
    u_xlat0_.z = _e295.z;
    let _e302 = u_xlat0_;
    let _e304 = u_xlat9_;
    let _e306 = u_xlat0_;
    let _e309 = u_xlat3_;
    let _e311 = ((_e304.xxx * _e306.xyz) + _e309.xyz);
    u_xlat0_.x = _e311.x;
    u_xlat0_.y = _e311.y;
    u_xlat0_.z = _e311.z;
    let _e318 = u_xlat0_;
    let _e320 = u_xlat0_;
    let _e322 = u_xlat5_;
    let _e324 = (_e320.xyz * vec3(_e322));
    u_xlat0_.x = _e324.x;
    u_xlat0_.y = _e324.y;
    u_xlat0_.z = _e324.z;
    let _e331 = u_xlat2_;
    let _e333 = u_xlat0_;
    let _e338 = _f_buffer1_.f_cb1_[2];
    let _e340 = (_e333.xyz * _e338.xxx);
    u_xlat2_.x = _e340.x;
    u_xlat2_.y = _e340.y;
    u_xlat2_.z = _e340.z;
    let _e347 = u_xlat1_;
    let _e349 = u_xlat2_;
    u_xlat0_ = (_e347.xxxx * _e349);
    let _e352 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e352;
    let _e354 = u_xlat1_;
    u_xlat1_.x = clamp(_e354.x, 0f, 1f);
    let _e359 = u_xlat1_;
    let _e361 = vs_COLOR0_1;
    u_xlat1_ = (_e359.xxxx * _e361);
    let _e363 = u_xlat0_;
    let _e364 = u_xlat1_;
    SV_Target0_ = (_e363 * _e364);
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
