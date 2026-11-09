struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 12>,
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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e33 = u_xlat0_;
    let _e35 = vs_TEXCOORD0_1;
    let _e36 = _e35.zw;
    u_xlat0_.x = _e36.x;
    u_xlat0_.y = _e36.y;
    let _e41 = u_xlat0_;
    let _e43 = u_xlat0_;
    let _e49 = clamp(_e43.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e49.x;
    u_xlat0_.y = _e49.y;
    let _e54 = u_xlat0_;
    let _e56 = u_xlat0_;
    let _e58 = vs_TEXCOORD0_1;
    let _e61 = (_e56.xy + -(_e58.zw));
    u_xlat0_.x = _e61.x;
    u_xlat0_.y = _e61.y;
    let _e66 = u_xlat0_;
    let _e71 = _f_buffer1_.f_cb1_[6];
    let _e73 = u_xlat0_;
    let _e76 = vs_TEXCOORD0_1;
    let _e78 = ((_e71.xx * _e73.xy) + _e76.zw);
    u_xlat0_.x = _e78.x;
    u_xlat0_.y = _e78.y;
    let _e83 = u_xlat0_;
    let _e88 = _f_buffer0_.f_cb0_[4];
    let _e93 = hscard_bias.values[1];
    let _e96 = textureSampleBias(f_t1_, samplerf_s1_, _e83.xy, (_e88.x + _e93.x));
    u_xlat0_ = _e96;
    let _e97 = u_xlat0_;
    let _e99 = u_xlat0_;
    let _e110 = ((_e99.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e110.x;
    u_xlat0_.y = _e110.y;
    let _e115 = u_xlat0_;
    let _e117 = u_xlat0_;
    let _e122 = _f_buffer1_.f_cb1_[5];
    let _e125 = vs_TEXCOORD0_1;
    let _e127 = ((_e117.xy * _e122.zw) + _e125.xy);
    u_xlat0_.x = _e127.x;
    u_xlat0_.y = _e127.y;
    let _e132 = u_xlat4_;
    let _e134 = u_xlat0_;
    let _e135 = _e134.xy;
    u_xlat4_.x = _e135.x;
    u_xlat4_.y = _e135.y;
    let _e140 = u_xlat4_;
    let _e142 = u_xlat4_;
    let _e148 = clamp(_e142.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e148.x;
    u_xlat4_.y = _e148.y;
    let _e153 = u_xlat4_;
    let _e155 = u_xlat0_;
    let _e158 = u_xlat4_;
    let _e160 = (-(_e155.xy) + _e158.xy);
    u_xlat4_.x = _e160.x;
    u_xlat4_.y = _e160.y;
    let _e165 = u_xlat0_;
    let _e170 = _f_buffer1_.f_cb1_[3];
    let _e172 = u_xlat4_;
    let _e175 = u_xlat0_;
    let _e177 = ((_e170.zz * _e172.xy) + _e175.xy);
    u_xlat0_.x = _e177.x;
    u_xlat0_.y = _e177.y;
    let _e182 = u_xlat0_;
    let _e187 = _f_buffer0_.f_cb0_[4];
    let _e192 = hscard_bias.values[0];
    let _e195 = textureSampleBias(f_t0_, samplerf_s0_, _e182.xy, (_e187.x + _e192.x));
    u_xlat0_ = _e195.yzwx;
    let _e198 = u_xlat0_;
    let _e203 = _f_buffer1_.f_cb1_[2];
    u_xlat1_.x = (_e198.w + _e203.y);
    let _e206 = u_xlat0_;
    let _e211 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e206.w, _e211.y);
    let _e215 = u_xlat3_;
    let _e216 = u_xlat1_;
    u_xlat1_.x = (_e215 * _e216.x);
    let _e223 = _f_buffer1_.f_cb1_[11];
    u_xlat1_.y = ((_e223.x * 0.03125f) + 0.015625f);
    let _e229 = u_xlat1_;
    let _e234 = _f_buffer0_.f_cb0_[4];
    let _e239 = hscard_bias.values[2];
    let _e242 = textureSampleBias(f_t2_, samplerf_s2_, _e229.xy, (_e234.x + _e239.x));
    u_xlat1_ = _e242;
    let _e243 = u_xlat0_;
    let _e245 = u_xlat1_;
    let _e250 = _f_buffer1_.f_cb1_[2];
    let _e252 = (_e245.xyz * _e250.xxx);
    u_xlat0_.x = _e252.x;
    u_xlat0_.y = _e252.y;
    u_xlat0_.z = _e252.z;
    let _e259 = u_xlat0_;
    let _e260 = vs_COLOR0_1;
    SV_Target0_ = (_e259 * _e260);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
