struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 7>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
}

struct f_buffer2_ {
    f_cb2_: array<vec4<f32>, 5>,
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
@group(1) @binding(2) 
var<uniform> _f_buffer2_: f_buffer2_;
@group(3) @binding(1) 
var samplerf_s0_: sampler;
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD6_1: vec3<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec2<f32> = vec2(0f);

    let _e36 = u_xlat0_;
    let _e41 = _f_buffer2_.f_cb2_[3];
    let _e46 = _f_buffer2_.f_cb2_[4];
    let _e48 = (_e41.wzy * _e46.yyy);
    u_xlat0_.x = _e48.x;
    u_xlat0_.y = _e48.y;
    u_xlat0_.z = _e48.z;
    let _e55 = u_xlat3_;
    let _e57 = vs_TEXCOORD0_1;
    let _e63 = u_xlat0_;
    let _e65 = ((_e57.zw * vec2<f32>(2f, 2f)) + _e63.yz);
    u_xlat3_.x = _e65.x;
    u_xlat3_.y = _e65.y;
    let _e70 = u_xlat3_;
    let _e72 = u_xlat3_;
    let _e77 = _f_buffer2_.f_cb2_[2];
    let _e79 = (_e72.xy * _e77.xx);
    u_xlat3_.x = _e79.x;
    u_xlat3_.y = _e79.y;
    let _e84 = u_xlat3_;
    let _e89 = _f_buffer0_.f_cb0_[4];
    let _e94 = hscard_bias.values[1];
    let _e97 = textureSampleBias(f_t1_, samplerf_s1_, _e84.xy, (_e89.x + _e94.x));
    u_xlat1_ = _e97;
    let _e99 = u_xlat1_;
    u_xlat3_.x = log2(_e99.x);
    let _e103 = u_xlat3_;
    let _e108 = _f_buffer2_.f_cb2_[2];
    u_xlat3_.x = (_e103.x * _e108.y);
    let _e112 = u_xlat3_;
    u_xlat3_.x = exp2(_e112.x);
    let _e116 = u_xlat3_;
    let _e121 = _f_buffer2_.f_cb2_[2];
    u_xlat3_.x = min(_e116.x, _e121.y);
    let _e128 = _f_buffer2_.f_cb2_[4];
    let _e133 = _f_buffer2_.f_cb2_[4];
    u_xlat1_.y = (_e128.x * _e133.y);
    let _e137 = vs_TEXCOORD0_1;
    u_xlat1_.x = (_e137.x * 2f);
    let _e142 = vs_TEXCOORD0_1;
    u_xlat0_.w = (_e142.y * 2f);
    let _e146 = u_xlat0_;
    let _e148 = u_xlat0_;
    let _e150 = u_xlat1_;
    let _e152 = (_e148.xw + _e150.xy);
    u_xlat0_.x = _e152.x;
    u_xlat0_.z = _e152.y;
    let _e157 = u_xlat0_;
    let _e159 = u_xlat0_;
    let _e164 = (_e159.xz * vec2<f32>(0.5f, 0.5f));
    u_xlat0_.x = _e164.x;
    u_xlat0_.z = _e164.y;
    let _e169 = u_xlat0_;
    let _e174 = _f_buffer0_.f_cb0_[4];
    let _e179 = hscard_bias.values[0];
    let _e182 = textureSampleBias(f_t0_, samplerf_s0_, _e169.xz, (_e174.x + _e179.x));
    u_xlat1_ = _e182;
    let _e184 = u_xlat3_;
    let _e186 = u_xlat1_;
    u_xlat0_.x = (_e184.x * _e186.x);
    let _e190 = u_xlat0_;
    let _e195 = _f_buffer2_.f_cb2_[2];
    let _e201 = _f_buffer2_.f_cb2_[2];
    u_xlat0_.x = ((_e190.x * _e195.z) + -(_e201.w));
    let _e206 = u_xlat0_;
    let _e211 = _f_buffer2_.f_cb2_[1];
    u_xlat0_.x = (_e206.x * _e211.w);
    let _e215 = u_xlat1_;
    let _e217 = u_xlat0_;
    SV_TARGET0_.w = (_e215.w * _e217.x);
    let _e221 = u_xlat1_;
    let _e226 = _f_buffer2_.f_cb2_[3];
    u_xlat0_.x = (_e221.x * _e226.x);
    let _e229 = u_xlat0_;
    let _e231 = u_xlat0_;
    let _e236 = _f_buffer2_.f_cb2_[1];
    let _e238 = (_e231.xxx * _e236.xyz);
    u_xlat0_.x = _e238.x;
    u_xlat0_.y = _e238.y;
    u_xlat0_.z = _e238.z;
    let _e245 = u_xlat1_;
    let _e247 = u_xlat1_;
    let _e249 = u_xlat0_;
    let _e251 = (_e247.www * _e249.xyz);
    u_xlat1_.x = _e251.x;
    u_xlat1_.y = _e251.y;
    u_xlat1_.z = _e251.z;
    let _e258 = u_xlat2_;
    let _e263 = _f_buffer0_.f_cb0_[6];
    let _e268 = _f_buffer1_.f_cb1_[11];
    let _e270 = (_e263.xyz * _e268.zzz);
    u_xlat2_.x = _e270.x;
    u_xlat2_.y = _e270.y;
    u_xlat2_.z = _e270.z;
    let _e277 = u_xlat1_;
    let _e279 = u_xlat1_;
    let _e281 = u_xlat2_;
    let _e284 = vs_TEXCOORD6_1;
    let _e286 = ((_e279.xyz * _e281.xyz) + _e284.xyz);
    u_xlat1_.x = _e286.x;
    u_xlat1_.y = _e286.y;
    u_xlat1_.z = _e286.z;
    let _e293 = SV_TARGET0_;
    let _e295 = u_xlat0_;
    let _e297 = vs_COLOR0_1;
    let _e300 = u_xlat1_;
    let _e302 = ((_e295.xyz * _e297.xyz) + _e300.xyz);
    SV_TARGET0_.x = _e302.x;
    SV_TARGET0_.y = _e302.y;
    SV_TARGET0_.z = _e302.z;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(6) vs_TEXCOORD6_: vec3<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD6_1 = vs_TEXCOORD6_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e35 = SV_TARGET0_;
    return FragmentOutput(_e35);
}
