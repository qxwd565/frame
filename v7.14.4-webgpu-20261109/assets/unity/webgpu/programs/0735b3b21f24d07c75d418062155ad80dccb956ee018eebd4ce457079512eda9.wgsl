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
    var u_xlat1_: f32 = 0f;
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec2<f32> = vec2(0f);

    let _e30 = u_xlat0_;
    let _e32 = vs_TEXCOORD0_1;
    let _e33 = _e32.zw;
    u_xlat0_.x = _e33.x;
    u_xlat0_.y = _e33.y;
    let _e38 = u_xlat0_;
    let _e40 = u_xlat0_;
    let _e46 = clamp(_e40.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e46.x;
    u_xlat0_.y = _e46.y;
    let _e51 = u_xlat0_;
    let _e53 = u_xlat0_;
    let _e55 = vs_TEXCOORD0_1;
    let _e58 = (_e53.xy + -(_e55.zw));
    u_xlat0_.x = _e58.x;
    u_xlat0_.y = _e58.y;
    let _e63 = u_xlat0_;
    let _e68 = _f_buffer1_.f_cb1_[6];
    let _e70 = u_xlat0_;
    let _e73 = vs_TEXCOORD0_1;
    let _e75 = ((_e68.xx * _e70.xy) + _e73.zw);
    u_xlat0_.x = _e75.x;
    u_xlat0_.y = _e75.y;
    let _e80 = u_xlat0_;
    let _e85 = _f_buffer0_.f_cb0_[4];
    let _e90 = hscard_bias.values[1];
    let _e93 = textureSampleBias(f_t1_, samplerf_s1_, _e80.xy, (_e85.x + _e90.x));
    u_xlat0_ = _e93;
    let _e94 = u_xlat0_;
    let _e96 = u_xlat0_;
    let _e107 = ((_e96.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e107.x;
    u_xlat0_.y = _e107.y;
    let _e112 = u_xlat0_;
    let _e114 = u_xlat0_;
    let _e119 = _f_buffer1_.f_cb1_[5];
    let _e122 = vs_TEXCOORD0_1;
    let _e124 = ((_e114.xy * _e119.zw) + _e122.xy);
    u_xlat0_.x = _e124.x;
    u_xlat0_.y = _e124.y;
    let _e129 = u_xlat4_;
    let _e131 = u_xlat0_;
    let _e132 = _e131.xy;
    u_xlat4_.x = _e132.x;
    u_xlat4_.y = _e132.y;
    let _e137 = u_xlat4_;
    let _e139 = u_xlat4_;
    let _e145 = clamp(_e139.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e145.x;
    u_xlat4_.y = _e145.y;
    let _e150 = u_xlat4_;
    let _e152 = u_xlat0_;
    let _e155 = u_xlat4_;
    let _e157 = (-(_e152.xy) + _e155.xy);
    u_xlat4_.x = _e157.x;
    u_xlat4_.y = _e157.y;
    let _e162 = u_xlat0_;
    let _e167 = _f_buffer1_.f_cb1_[3];
    let _e169 = u_xlat4_;
    let _e172 = u_xlat0_;
    let _e174 = ((_e167.zz * _e169.xy) + _e172.xy);
    u_xlat0_.x = _e174.x;
    u_xlat0_.y = _e174.y;
    let _e179 = u_xlat0_;
    let _e184 = _f_buffer0_.f_cb0_[4];
    let _e189 = hscard_bias.values[0];
    let _e192 = textureSampleBias(f_t0_, samplerf_s0_, _e179.xy, (_e184.x + _e189.x));
    u_xlat0_ = _e192;
    let _e194 = u_xlat0_;
    u_xlat0_.w = dot(_e194.xyz, vec3<f32>(0.299f, 0.587f, 0.114f));
    let _e201 = u_xlat0_;
    let _e206 = _f_buffer1_.f_cb1_[2];
    u_xlat1_ = (_e201.w + _e206.y);
    let _e209 = u_xlat0_;
    let _e214 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e209.w, _e214.y);
    let _e217 = u_xlat3_;
    let _e218 = u_xlat1_;
    u_xlat1_ = (_e217 * _e218);
    let _e220 = u_xlat0_;
    let _e222 = u_xlat1_;
    let _e227 = _f_buffer1_.f_cb1_[2];
    let _e229 = (vec3(_e222) * _e227.xxx);
    u_xlat0_.x = _e229.x;
    u_xlat0_.y = _e229.y;
    u_xlat0_.z = _e229.z;
    let _e236 = u_xlat0_;
    let _e237 = vs_COLOR0_1;
    SV_Target0_ = (_e236 * _e237);
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
