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
    let _e119 = _f_buffer1_.f_cb1_[2];
    u_xlat4_.x = (_e114.w + _e119.y);
    let _e122 = u_xlat1_;
    let _e127 = _f_buffer1_.f_cb1_[3];
    u_xlat8_ = max(_e122.w, _e127.y);
    let _e130 = u_xlat4_;
    let _e132 = u_xlat8_;
    let _e137 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = ((_e130.x * _e132) + -(_e137.w));
    let _e142 = u_xlat8_;
    let _e143 = u_xlat4_;
    u_xlat4_.x = (_e142 * _e143.x);
    let _e147 = u_xlat12_;
    let _e148 = u_xlat0_;
    u_xlat0_.x = (_e147 / _e148.x);
    let _e151 = u_xlat12_;
    u_xlat8_ = (_e151 * 5f);
    let _e154 = u_xlat8_;
    u_xlat8_ = clamp(_e154, 0f, 1f);
    let _e158 = u_xlat2_;
    let _e163 = _f_buffer1_.f_cb1_[8];
    let _e168 = _f_buffer1_.f_cb1_[9];
    let _e171 = (_e163.yzw + -(_e168.xyz));
    u_xlat2_.x = _e171.x;
    u_xlat2_.y = _e171.y;
    u_xlat2_.z = _e171.z;
    let _e178 = u_xlat2_;
    let _e180 = u_xlat0_;
    let _e182 = u_xlat2_;
    let _e188 = _f_buffer1_.f_cb1_[9];
    let _e190 = ((_e180.xxx * _e182.xyz) + _e188.xyz);
    u_xlat2_.x = _e190.x;
    u_xlat2_.y = _e190.y;
    u_xlat2_.z = _e190.z;
    let _e203 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (1f / _e203.w);
    let _e207 = u_xlat0_;
    let _e209 = u_xlat4_;
    u_xlat0_.x = (_e207.x * _e209.x);
    let _e212 = u_xlat3_;
    let _e217 = _f_buffer1_.f_cb1_[9];
    let _e222 = _f_buffer1_.f_cb1_[10];
    let _e225 = (_e217.xyz + -(_e222.xyz));
    u_xlat3_.x = _e225.x;
    u_xlat3_.y = _e225.y;
    u_xlat3_.z = _e225.z;
    let _e232 = u_xlat3_;
    let _e234 = u_xlat0_;
    let _e236 = u_xlat3_;
    let _e242 = _f_buffer1_.f_cb1_[10];
    let _e244 = ((_e234.xxx * _e236.xyz) + _e242.xyz);
    u_xlat3_.x = _e244.x;
    u_xlat3_.y = _e244.y;
    u_xlat3_.z = _e244.z;
    let _e251 = u_xlat2_;
    let _e253 = u_xlat2_;
    let _e255 = u_xlat3_;
    let _e258 = (_e253.xyz + -(_e255.xyz));
    u_xlat2_.x = _e258.x;
    u_xlat2_.y = _e258.y;
    u_xlat2_.z = _e258.z;
    let _e265 = u_xlat0_;
    let _e267 = u_xlat8_;
    let _e269 = u_xlat2_;
    let _e272 = u_xlat3_;
    let _e274 = ((vec3(_e267) * _e269.xyz) + _e272.xyz);
    u_xlat0_.x = _e274.x;
    u_xlat0_.z = _e274.y;
    u_xlat0_.w = _e274.z;
    let _e281 = u_xlat0_;
    let _e283 = u_xlat0_;
    let _e285 = u_xlat4_;
    let _e287 = (_e283.xzw * _e285.xxx);
    u_xlat0_.x = _e287.x;
    u_xlat0_.y = _e287.y;
    u_xlat0_.z = _e287.z;
    let _e294 = u_xlat1_;
    let _e296 = u_xlat0_;
    let _e301 = _f_buffer1_.f_cb1_[2];
    let _e303 = (_e296.xyz * _e301.xxx);
    u_xlat1_.x = _e303.x;
    u_xlat1_.y = _e303.y;
    u_xlat1_.z = _e303.z;
    let _e310 = u_xlat1_;
    let _e311 = vs_COLOR0_1;
    SV_Target0_ = (_e310 * _e311);
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
