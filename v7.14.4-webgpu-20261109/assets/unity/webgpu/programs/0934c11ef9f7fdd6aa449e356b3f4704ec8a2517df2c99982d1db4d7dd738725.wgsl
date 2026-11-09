struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 30>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_NORMAL0_1: vec3<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat9_: f32 = 0f;

    let _e36 = _f_buffer1_.f_cb1_[27];
    u_xlat0_.x = abs(_e36.w);
    let _e43 = _f_buffer1_.f_cb1_[28];
    u_xlat0_.y = abs(_e43.w);
    let _e50 = _f_buffer1_.f_cb1_[29];
    u_xlat0_.z = abs(_e50.w);
    let _e53 = u_xlat0_;
    let _e55 = u_xlat0_;
    let _e57 = log2(_e55.xyz);
    u_xlat0_.x = _e57.x;
    u_xlat0_.y = _e57.y;
    u_xlat0_.z = _e57.z;
    let _e64 = u_xlat0_;
    let _e66 = u_xlat0_;
    let _e72 = (_e66.xyz * vec3<f32>(0.41666666f, 0.41666666f, 0.41666666f));
    u_xlat0_.x = _e72.x;
    u_xlat0_.y = _e72.y;
    u_xlat0_.z = _e72.z;
    let _e79 = u_xlat0_;
    let _e81 = u_xlat0_;
    let _e83 = exp2(_e81.xyz);
    u_xlat0_.x = _e83.x;
    u_xlat0_.y = _e83.y;
    u_xlat0_.z = _e83.z;
    let _e90 = u_xlat0_;
    let _e92 = u_xlat0_;
    let _e106 = ((_e92.xyz * vec3<f32>(1.055f, 1.055f, 1.055f)) + vec3<f32>(-0.055f, -0.055f, -0.055f));
    u_xlat0_.x = _e106.x;
    u_xlat0_.y = _e106.y;
    u_xlat0_.z = _e106.z;
    let _e113 = u_xlat0_;
    let _e115 = u_xlat0_;
    let _e121 = clamp(_e115.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e121.x;
    u_xlat0_.y = _e121.y;
    u_xlat0_.z = _e121.z;
    let _e128 = vs_NORMAL0_1;
    let _e130 = vs_NORMAL0_1;
    u_xlat9_ = dot(_e128.xyz, _e130.xyz);
    let _e133 = u_xlat9_;
    u_xlat9_ = inverseSqrt(_e133);
    let _e135 = u_xlat1_;
    let _e137 = u_xlat9_;
    let _e139 = vs_NORMAL0_1;
    let _e141 = (vec3(_e137) * _e139.xyz);
    u_xlat1_.x = _e141.x;
    u_xlat1_.y = _e141.y;
    u_xlat1_.z = _e141.z;
    let _e148 = u_xlat1_;
    let _e153 = _f_buffer0_.f_cb0_[5];
    u_xlat9_ = dot(_e148.xyz, _e153.xyz);
    let _e156 = u_xlat9_;
    u_xlat9_ = clamp(_e156, 0f, 1f);
    let _e160 = u_xlat1_;
    let _e165 = _f_buffer0_.f_cb0_[6];
    let _e170 = _f_buffer1_.f_cb1_[11];
    let _e172 = (_e165.xyz * _e170.zzz);
    u_xlat1_.x = _e172.x;
    u_xlat1_.y = _e172.y;
    u_xlat1_.z = _e172.z;
    let _e179 = u_xlat0_;
    let _e181 = u_xlat1_;
    let _e183 = u_xlat9_;
    let _e186 = u_xlat0_;
    let _e188 = ((_e181.xyz * vec3(_e183)) + _e186.xyz);
    u_xlat0_.x = _e188.x;
    u_xlat0_.y = _e188.y;
    u_xlat0_.z = _e188.z;
    let _e195 = vs_TEXCOORD0_1;
    let _e200 = _f_buffer0_.f_cb0_[4];
    let _e205 = hscard_bias.values[0];
    let _e208 = textureSampleBias(f_t0_, samplerf_s0_, _e195.xy, (_e200.x + _e205.x));
    u_xlat1_ = _e208;
    let _e209 = vs_TEXCOORD1_1;
    let _e214 = _f_buffer0_.f_cb0_[4];
    let _e219 = hscard_bias.values[1];
    let _e222 = textureSampleBias(f_t1_, samplerf_s1_, _e209.xy, (_e214.x + _e219.x));
    u_xlat2_ = _e222;
    let _e223 = u_xlat1_;
    let _e225 = u_xlat1_;
    let _e227 = u_xlat2_;
    let _e229 = (_e225.xyz * _e227.xxx);
    u_xlat1_.x = _e229.x;
    u_xlat1_.y = _e229.y;
    u_xlat1_.z = _e229.z;
    let _e237 = u_xlat2_;
    SV_TARGET0_.w = _e237.x;
    let _e239 = SV_TARGET0_;
    let _e241 = u_xlat0_;
    let _e243 = u_xlat1_;
    let _e245 = (_e241.xyz * _e243.xyz);
    SV_TARGET0_.x = _e245.x;
    SV_TARGET0_.y = _e245.y;
    SV_TARGET0_.z = _e245.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(12) vs_NORMAL0_: vec3<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_NORMAL0_1 = vs_NORMAL0_;
    main_1();
    let _e32 = SV_TARGET0_;
    return FragmentOutput(_e32);
}
