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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat7_: f32 = 0f;

    let _e31 = u_xlat0_;
    let _e33 = vs_TEXCOORD0_1;
    let _e34 = _e33.zw;
    u_xlat0_.x = _e34.x;
    u_xlat0_.y = _e34.y;
    let _e39 = u_xlat0_;
    let _e41 = u_xlat0_;
    let _e47 = clamp(_e41.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e47.x;
    u_xlat0_.y = _e47.y;
    let _e52 = u_xlat0_;
    let _e54 = u_xlat0_;
    let _e56 = vs_TEXCOORD0_1;
    let _e59 = (_e54.xy + -(_e56.zw));
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    let _e64 = u_xlat0_;
    let _e69 = _f_buffer1_.f_cb1_[6];
    let _e71 = u_xlat0_;
    let _e74 = vs_TEXCOORD0_1;
    let _e76 = ((_e69.xx * _e71.xy) + _e74.zw);
    u_xlat0_.x = _e76.x;
    u_xlat0_.y = _e76.y;
    let _e81 = u_xlat0_;
    let _e86 = _f_buffer0_.f_cb0_[4];
    let _e91 = hscard_bias.values[1];
    let _e94 = textureSampleBias(f_t1_, samplerf_s1_, _e81.xy, (_e86.x + _e91.x));
    u_xlat0_ = _e94;
    let _e95 = u_xlat0_;
    let _e97 = u_xlat0_;
    let _e108 = ((_e97.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e108.x;
    u_xlat0_.y = _e108.y;
    let _e113 = u_xlat0_;
    let _e115 = u_xlat0_;
    let _e120 = _f_buffer1_.f_cb1_[5];
    let _e123 = vs_TEXCOORD0_1;
    let _e125 = ((_e115.xy * _e120.zw) + _e123.xy);
    u_xlat0_.x = _e125.x;
    u_xlat0_.y = _e125.y;
    let _e130 = u_xlat4_;
    let _e132 = u_xlat0_;
    let _e133 = _e132.xy;
    u_xlat4_.x = _e133.x;
    u_xlat4_.y = _e133.y;
    let _e138 = u_xlat4_;
    let _e140 = u_xlat4_;
    let _e146 = clamp(_e140.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e146.x;
    u_xlat4_.y = _e146.y;
    let _e151 = u_xlat4_;
    let _e153 = u_xlat0_;
    let _e156 = u_xlat4_;
    let _e158 = (-(_e153.xy) + _e156.xy);
    u_xlat4_.x = _e158.x;
    u_xlat4_.y = _e158.y;
    let _e163 = u_xlat0_;
    let _e168 = _f_buffer1_.f_cb1_[3];
    let _e170 = u_xlat4_;
    let _e173 = u_xlat0_;
    let _e175 = ((_e168.zz * _e170.xy) + _e173.xy);
    u_xlat0_.x = _e175.x;
    u_xlat0_.y = _e175.y;
    let _e180 = u_xlat0_;
    let _e185 = _f_buffer0_.f_cb0_[4];
    let _e190 = hscard_bias.values[0];
    let _e193 = textureSampleBias(f_t0_, samplerf_s0_, _e180.xy, (_e185.x + _e190.x));
    u_xlat0_ = _e193.yzwx;
    let _e195 = u_xlat1_;
    let _e197 = u_xlat0_;
    let _e202 = _f_buffer1_.f_cb1_[2];
    let _e204 = (_e197.wxy + _e202.yyy);
    u_xlat1_.x = _e204.x;
    u_xlat1_.y = _e204.y;
    u_xlat1_.z = _e204.z;
    let _e211 = u_xlat0_;
    let _e216 = _f_buffer1_.f_cb1_[3];
    u_xlat7_ = max(_e211.w, _e216.y);
    let _e219 = u_xlat1_;
    let _e221 = u_xlat7_;
    let _e223 = u_xlat1_;
    let _e225 = (vec3(_e221) * _e223.xyz);
    u_xlat1_.x = _e225.x;
    u_xlat1_.y = _e225.y;
    u_xlat1_.z = _e225.z;
    let _e232 = u_xlat0_;
    let _e234 = u_xlat1_;
    let _e239 = _f_buffer1_.f_cb1_[2];
    let _e241 = (_e234.xyz * _e239.xxx);
    u_xlat0_.x = _e241.x;
    u_xlat0_.y = _e241.y;
    u_xlat0_.z = _e241.z;
    let _e248 = u_xlat0_;
    let _e249 = vs_COLOR0_1;
    SV_Target0_ = (_e248 * _e249);
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
