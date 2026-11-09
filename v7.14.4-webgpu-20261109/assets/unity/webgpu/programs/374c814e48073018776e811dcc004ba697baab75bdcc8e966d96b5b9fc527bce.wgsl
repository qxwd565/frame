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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat8_: f32 = 0f;
    var u_xlat12_: f32 = 0f;

    let _e44 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (-(_e44.w) + 1f);
    let _e49 = u_xlat4_;
    let _e51 = vs_TEXCOORD0_1;
    let _e52 = _e51.xy;
    u_xlat4_.x = _e52.x;
    u_xlat4_.y = _e52.y;
    let _e57 = u_xlat4_;
    let _e59 = u_xlat4_;
    let _e65 = clamp(_e59.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e65.x;
    u_xlat4_.y = _e65.y;
    let _e70 = u_xlat4_;
    let _e72 = u_xlat4_;
    let _e74 = vs_TEXCOORD0_1;
    let _e77 = (_e72.xy + -(_e74.xy));
    u_xlat4_.x = _e77.x;
    u_xlat4_.y = _e77.y;
    let _e82 = u_xlat4_;
    let _e87 = _f_buffer1_.f_cb1_[3];
    let _e89 = u_xlat4_;
    let _e92 = vs_TEXCOORD0_1;
    let _e94 = ((_e87.zz * _e89.xy) + _e92.xy);
    u_xlat4_.x = _e94.x;
    u_xlat4_.y = _e94.y;
    let _e99 = u_xlat4_;
    let _e104 = _f_buffer0_.f_cb0_[4];
    let _e109 = hscard_bias.values[0];
    let _e112 = textureSampleBias(f_t0_, samplerf_s0_, _e99.xy, (_e104.x + _e109.x));
    u_xlat1_ = _e112;
    let _e114 = u_xlat1_;
    u_xlat1_.w = dot(_e114.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e122 = u_xlat1_;
    let _e127 = _f_buffer1_.f_cb1_[2];
    u_xlat4_.x = (_e122.w + _e127.y);
    let _e130 = u_xlat1_;
    let _e135 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = max(_e130.w, _e135.y);
    let _e138 = u_xlat4_;
    let _e140 = u_xlat8_;
    let _e145 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = ((_e138.x * _e140) + -(_e145.w));
    let _e150 = u_xlat8_;
    let _e151 = u_xlat4_;
    u_xlat4_.x = (_e150 * _e151.x);
    let _e155 = u_xlat12_;
    let _e156 = u_xlat0_;
    u_xlat0_.x = (_e155 / _e156.x);
    let _e159 = u_xlat12_;
    u_xlat8_ = (_e159 * 5f);
    let _e162 = u_xlat8_;
    u_xlat8_ = clamp(_e162, 0f, 1f);
    let _e166 = u_xlat2_;
    let _e171 = _f_buffer1_.f_cb1_[8];
    let _e176 = _f_buffer1_.f_cb1_[9];
    let _e179 = (_e171.yzw + -(_e176.xyz));
    u_xlat2_.x = _e179.x;
    u_xlat2_.y = _e179.y;
    u_xlat2_.z = _e179.z;
    let _e186 = u_xlat2_;
    let _e188 = u_xlat0_;
    let _e190 = u_xlat2_;
    let _e196 = _f_buffer1_.f_cb1_[9];
    let _e198 = ((_e188.xxx * _e190.xyz) + _e196.xyz);
    u_xlat2_.x = _e198.x;
    u_xlat2_.y = _e198.y;
    u_xlat2_.z = _e198.z;
    let _e211 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (1f / _e211.w);
    let _e215 = u_xlat0_;
    let _e217 = u_xlat4_;
    u_xlat0_.x = (_e215.x * _e217.x);
    let _e220 = u_xlat3_;
    let _e225 = _f_buffer1_.f_cb1_[9];
    let _e230 = _f_buffer1_.f_cb1_[10];
    let _e233 = (_e225.xyz + -(_e230.xyz));
    u_xlat3_.x = _e233.x;
    u_xlat3_.y = _e233.y;
    u_xlat3_.z = _e233.z;
    let _e240 = u_xlat3_;
    let _e242 = u_xlat0_;
    let _e244 = u_xlat3_;
    let _e250 = _f_buffer1_.f_cb1_[10];
    let _e252 = ((_e242.xxx * _e244.xyz) + _e250.xyz);
    u_xlat3_.x = _e252.x;
    u_xlat3_.y = _e252.y;
    u_xlat3_.z = _e252.z;
    let _e259 = u_xlat2_;
    let _e261 = u_xlat2_;
    let _e263 = u_xlat3_;
    let _e266 = (_e261.xyz + -(_e263.xyz));
    u_xlat2_.x = _e266.x;
    u_xlat2_.y = _e266.y;
    u_xlat2_.z = _e266.z;
    let _e273 = u_xlat0_;
    let _e275 = u_xlat8_;
    let _e277 = u_xlat2_;
    let _e280 = u_xlat3_;
    let _e282 = ((vec3(_e275) * _e277.xyz) + _e280.xyz);
    u_xlat0_.x = _e282.x;
    u_xlat0_.z = _e282.y;
    u_xlat0_.w = _e282.z;
    let _e289 = u_xlat0_;
    let _e291 = u_xlat0_;
    let _e293 = u_xlat4_;
    let _e295 = (_e291.xzw * _e293.xxx);
    u_xlat0_.x = _e295.x;
    u_xlat0_.y = _e295.y;
    u_xlat0_.z = _e295.z;
    let _e302 = u_xlat1_;
    let _e304 = u_xlat0_;
    let _e309 = _f_buffer1_.f_cb1_[2];
    let _e311 = (_e304.xyz * _e309.xxx);
    u_xlat1_.x = _e311.x;
    u_xlat1_.y = _e311.y;
    u_xlat1_.z = _e311.z;
    let _e318 = u_xlat1_;
    let _e319 = vs_COLOR0_1;
    SV_Target0_ = (_e318 * _e319);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_Target0_;
    return FragmentOutput(_e24);
}
