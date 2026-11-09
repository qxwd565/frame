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
    var u_xlat1_: f32 = 0f;
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);
    var u_xlat5_: f32 = 0f;

    let _e34 = u_xlat0_;
    let _e36 = vs_TEXCOORD0_1;
    let _e37 = _e36.zw;
    u_xlat0_.x = _e37.x;
    u_xlat0_.y = _e37.y;
    let _e42 = u_xlat0_;
    let _e44 = u_xlat0_;
    let _e50 = clamp(_e44.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e50.x;
    u_xlat0_.y = _e50.y;
    let _e55 = u_xlat0_;
    let _e57 = u_xlat0_;
    let _e59 = vs_TEXCOORD0_1;
    let _e62 = (_e57.xy + -(_e59.zw));
    u_xlat0_.x = _e62.x;
    u_xlat0_.y = _e62.y;
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
    u_xlat0_ = _e97;
    let _e98 = u_xlat0_;
    let _e100 = u_xlat0_;
    let _e111 = ((_e100.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e111.x;
    u_xlat0_.y = _e111.y;
    let _e116 = u_xlat0_;
    let _e118 = u_xlat0_;
    let _e123 = _f_buffer1_.f_cb1_[5];
    let _e126 = vs_TEXCOORD0_1;
    let _e128 = ((_e118.xy * _e123.zw) + _e126.xy);
    u_xlat0_.x = _e128.x;
    u_xlat0_.y = _e128.y;
    let _e133 = u_xlat4_;
    let _e135 = u_xlat0_;
    let _e136 = _e135.xy;
    u_xlat4_.x = _e136.x;
    u_xlat4_.y = _e136.y;
    let _e141 = u_xlat4_;
    let _e143 = u_xlat4_;
    let _e149 = clamp(_e143.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e149.x;
    u_xlat4_.y = _e149.y;
    let _e154 = u_xlat4_;
    let _e156 = u_xlat0_;
    let _e159 = u_xlat4_;
    let _e161 = (-(_e156.xy) + _e159.xy);
    u_xlat4_.x = _e161.x;
    u_xlat4_.y = _e161.y;
    let _e166 = u_xlat0_;
    let _e171 = _f_buffer1_.f_cb1_[3];
    let _e173 = u_xlat4_;
    let _e176 = u_xlat0_;
    let _e178 = ((_e171.zz * _e173.xy) + _e176.xy);
    u_xlat0_.x = _e178.x;
    u_xlat0_.y = _e178.y;
    let _e183 = u_xlat0_;
    let _e188 = _f_buffer0_.f_cb0_[4];
    let _e193 = hscard_bias.values[0];
    let _e196 = textureSampleBias(f_t0_, samplerf_s0_, _e183.xy, (_e188.x + _e193.x));
    u_xlat0_ = _e196;
    let _e198 = u_xlat0_;
    u_xlat0_.w = dot(_e198.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e205 = vs_TEXCOORD1_1;
    let _e209 = _f_buffer1_.f_cb1_[12];
    u_xlat1_ = (_e205 + -(_e209.z));
    let _e213 = u_xlat1_;
    u_xlat1_ = clamp(_e213, 0f, 1f);
    let _e217 = u_xlat1_;
    u_xlat1_ = (_e217 + -0.00001f);
    let _e221 = u_xlat0_;
    let _e223 = u_xlat1_;
    u_xlat3_ = (_e221.w + -(_e223));
    let _e226 = vs_TEXCOORD1_1;
    let _e230 = _f_buffer1_.f_cb1_[12];
    u_xlat5_ = (_e226 + _e230.z);
    let _e233 = u_xlat5_;
    u_xlat5_ = clamp(_e233, 0f, 1f);
    let _e237 = u_xlat1_;
    let _e239 = u_xlat5_;
    u_xlat1_ = (-(_e237) + _e239);
    let _e243 = u_xlat1_;
    u_xlat1_ = (1f / _e243);
    let _e245 = u_xlat1_;
    let _e246 = u_xlat3_;
    u_xlat1_ = (_e245 * _e246);
    let _e248 = u_xlat1_;
    u_xlat1_ = clamp(_e248, 0f, 1f);
    let _e252 = u_xlat1_;
    u_xlat3_ = ((_e252 * -2f) + 3f);
    let _e258 = u_xlat1_;
    let _e259 = u_xlat1_;
    u_xlat1_ = (_e258 * _e259);
    let _e261 = u_xlat1_;
    let _e262 = u_xlat3_;
    u_xlat1_ = (_e261 * _e262);
    let _e264 = u_xlat0_;
    let _e269 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e264.w + _e269.y);
    let _e272 = u_xlat0_;
    let _e277 = _f_buffer1_.f_cb1_[3];
    u_xlat5_ = max(_e272.w, _e277.y);
    let _e280 = u_xlat5_;
    let _e281 = u_xlat3_;
    u_xlat3_ = (_e280 * _e281);
    let _e283 = u_xlat0_;
    let _e285 = u_xlat3_;
    let _e290 = _f_buffer1_.f_cb1_[2];
    let _e292 = (vec3(_e285) * _e290.xxx);
    u_xlat0_.x = _e292.x;
    u_xlat0_.y = _e292.y;
    u_xlat0_.z = _e292.z;
    let _e299 = u_xlat0_;
    let _e300 = u_xlat1_;
    u_xlat0_ = (_e299 * vec4(_e300));
    let _e303 = u_xlat0_;
    let _e304 = vs_COLOR0_1;
    SV_Target0_ = (_e303 * _e304);
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
