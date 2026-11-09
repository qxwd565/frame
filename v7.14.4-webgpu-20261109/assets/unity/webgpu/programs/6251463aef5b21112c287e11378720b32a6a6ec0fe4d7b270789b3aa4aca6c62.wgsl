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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e32 = vs_TEXCOORD0_1;
    u_xlat0_ = _e32.zwxy;
    let _e34 = u_xlat0_;
    u_xlat0_ = clamp(_e34, vec4(0f), vec4(1f));
    let _e40 = u_xlat0_;
    let _e41 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e40 + -(_e41.zwxy));
    let _e45 = u_xlat0_;
    let _e50 = _f_buffer1_.f_cb1_[6];
    let _e52 = u_xlat0_;
    let _e55 = vs_TEXCOORD0_1;
    let _e57 = ((_e50.xx * _e52.xy) + _e55.zw);
    u_xlat0_.x = _e57.x;
    u_xlat0_.y = _e57.y;
    let _e62 = u_xlat4_;
    let _e67 = _f_buffer1_.f_cb1_[3];
    let _e69 = u_xlat0_;
    let _e72 = vs_TEXCOORD0_1;
    let _e74 = ((_e67.zz * _e69.zw) + _e72.xy);
    u_xlat4_.x = _e74.x;
    u_xlat4_.y = _e74.y;
    let _e79 = u_xlat4_;
    let _e84 = _f_buffer0_.f_cb0_[4];
    let _e89 = hscard_bias.values[0];
    let _e92 = textureSampleBias(f_t0_, samplerf_s0_, _e79.xy, (_e84.x + _e89.x));
    u_xlat1_ = _e92;
    let _e94 = u_xlat1_;
    u_xlat1_.w = dot(_e94.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e101 = u_xlat0_;
    let _e106 = _f_buffer0_.f_cb0_[4];
    let _e111 = hscard_bias.values[1];
    let _e114 = textureSampleBias(f_t1_, samplerf_s1_, _e101.xy, (_e106.x + _e111.x));
    u_xlat0_ = _e114;
    let _e116 = u_xlat0_;
    u_xlat0_.x = (_e116.x + -1f);
    let _e125 = _f_buffer1_.f_cb1_[7];
    let _e127 = u_xlat0_;
    u_xlat0_.x = ((_e125.w * _e127.x) + 1f);
    let _e132 = vs_TEXCOORD1_1;
    let _e136 = _f_buffer1_.f_cb1_[12];
    u_xlat2_ = (_e132 + _e136.z);
    let _e139 = u_xlat2_;
    u_xlat2_ = clamp(_e139, 0f, 1f);
    let _e144 = vs_TEXCOORD1_1;
    let _e148 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e144 + -(_e148.z));
    let _e153 = u_xlat4_;
    u_xlat4_.x = clamp(_e153.x, 0f, 1f);
    let _e159 = u_xlat4_;
    u_xlat4_.x = (_e159.x + -0.00001f);
    let _e164 = u_xlat4_;
    let _e167 = u_xlat2_;
    u_xlat2_ = (-(_e164.x) + _e167);
    let _e170 = u_xlat4_;
    let _e173 = u_xlat1_;
    u_xlat4_.x = (-(_e170.x) + _e173.w);
    let _e178 = u_xlat2_;
    u_xlat2_ = (1f / _e178);
    let _e180 = u_xlat2_;
    let _e181 = u_xlat4_;
    u_xlat2_ = (_e180 * _e181.x);
    let _e184 = u_xlat2_;
    u_xlat2_ = clamp(_e184, 0f, 1f);
    let _e189 = u_xlat2_;
    u_xlat4_.x = ((_e189 * -2f) + 3f);
    let _e195 = u_xlat2_;
    let _e196 = u_xlat2_;
    u_xlat2_ = (_e195 * _e196);
    let _e198 = u_xlat2_;
    let _e199 = u_xlat4_;
    u_xlat2_ = (_e198 * _e199.x);
    let _e203 = u_xlat0_;
    let _e205 = u_xlat2_;
    u_xlat0_.x = (_e203.x * _e205);
    let _e207 = u_xlat1_;
    let _e212 = _f_buffer1_.f_cb1_[2];
    u_xlat2_ = (_e207.w + _e212.y);
    let _e216 = u_xlat1_;
    let _e221 = _f_buffer1_.f_cb1_[3];
    u_xlat4_.x = max(_e216.w, _e221.y);
    let _e224 = u_xlat4_;
    let _e226 = u_xlat2_;
    u_xlat2_ = (_e224.x * _e226);
    let _e228 = u_xlat1_;
    let _e230 = u_xlat2_;
    let _e235 = _f_buffer1_.f_cb1_[2];
    let _e237 = (vec3(_e230) * _e235.xxx);
    u_xlat1_.x = _e237.x;
    u_xlat1_.y = _e237.y;
    u_xlat1_.z = _e237.z;
    let _e244 = u_xlat0_;
    let _e246 = u_xlat1_;
    u_xlat0_ = (_e244.xxxx * _e246);
    let _e248 = u_xlat0_;
    let _e249 = vs_COLOR0_1;
    SV_Target0_ = (_e248 * _e249);
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
