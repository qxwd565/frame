struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 7>,
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
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlat10_: f32 = 0f;

    let _e37 = vs_TEXCOORD0_1;
    u_xlat0_ = _e37.zwxy;
    let _e39 = u_xlat0_;
    u_xlat0_ = clamp(_e39, vec4(0f), vec4(1f));
    let _e45 = u_xlat0_;
    let _e46 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e45 + -(_e46.zwxy));
    let _e50 = u_xlat6_;
    let _e55 = _f_buffer1_.f_cb1_[3];
    let _e57 = u_xlat0_;
    let _e60 = vs_TEXCOORD0_1;
    let _e62 = ((_e55.zz * _e57.zw) + _e60.xy);
    u_xlat6_.x = _e62.x;
    u_xlat6_.y = _e62.y;
    let _e67 = u_xlat0_;
    let _e72 = _f_buffer1_.f_cb1_[6];
    let _e74 = u_xlat0_;
    let _e77 = vs_TEXCOORD0_1;
    let _e79 = ((_e72.xx * _e74.xy) + _e77.zw);
    u_xlat0_.x = _e79.x;
    u_xlat0_.y = _e79.y;
    let _e84 = u_xlat0_;
    let _e89 = _f_buffer0_.f_cb0_[4];
    let _e94 = hscard_bias.values[1];
    let _e97 = textureSampleBias(f_t1_, samplerf_s1_, _e84.xy, (_e89.x + _e94.x));
    u_xlat1_ = _e97;
    let _e98 = u_xlat6_;
    let _e103 = _f_buffer0_.f_cb0_[4];
    let _e108 = hscard_bias.values[0];
    let _e111 = textureSampleBias(f_t0_, samplerf_s0_, _e98.xy, (_e103.x + _e108.x));
    u_xlat0_ = _e111;
    let _e112 = u_xlat2_;
    let _e114 = u_xlat0_;
    let _e119 = _f_buffer1_.f_cb1_[2];
    let _e121 = (_e114.xyz + _e119.yyy);
    u_xlat2_.x = _e121.x;
    u_xlat2_.y = _e121.y;
    u_xlat2_.z = _e121.z;
    let _e128 = u_xlat0_;
    let _e133 = _f_buffer1_.f_cb1_[3];
    u_xlat10_ = max(_e128.w, _e133.y);
    let _e136 = u_xlat2_;
    let _e138 = u_xlat10_;
    let _e140 = u_xlat2_;
    let _e142 = (vec3(_e138) * _e140.xyz);
    u_xlat2_.x = _e142.x;
    u_xlat2_.y = _e142.y;
    u_xlat2_.z = _e142.z;
    let _e149 = u_xlat0_;
    let _e151 = u_xlat2_;
    let _e156 = _f_buffer1_.f_cb1_[2];
    let _e158 = (_e151.xyz * _e156.xxx);
    u_xlat0_.x = _e158.x;
    u_xlat0_.y = _e158.y;
    u_xlat0_.z = _e158.z;
    let _e165 = u_xlat1_;
    let _e167 = vs_COLOR1_1;
    let _e169 = u_xlat0_;
    u_xlat0_ = ((_e165.xyzx * _e167) + _e169);
    let _e172 = vs_TEXCOORD1_1;
    u_xlat1_.x = _e172;
    let _e174 = u_xlat1_;
    u_xlat1_.x = clamp(_e174.x, 0f, 1f);
    let _e179 = u_xlat1_;
    let _e181 = vs_COLOR0_1;
    u_xlat1_ = (_e179.xxxx * _e181);
    let _e183 = u_xlat0_;
    let _e184 = u_xlat1_;
    SV_Target0_ = (_e183 * _e184);
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
