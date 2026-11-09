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
@group(3) @binding(3) 
var samplerf_s1_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat11_: vec2<f32> = vec2(0f);
    var u_xlat15_: f32 = 0f;
    var u_xlat17_: f32 = 0f;
    var u_xlat18_: f32 = 0f;

    let _e50 = u_xlat0_;
    let _e55 = _f_buffer1_.f_cb1_[8];
    let _e60 = _f_buffer1_.f_cb1_[9];
    let _e63 = (_e55.yzw + -(_e60.xyz));
    u_xlat0_.x = _e63.x;
    u_xlat0_.y = _e63.y;
    u_xlat0_.z = _e63.z;
    let _e73 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (-(_e73.w) + 1f);
    let _e78 = vs_TEXCOORD0_1;
    u_xlat1_ = _e78.zwxy;
    let _e80 = u_xlat1_;
    u_xlat1_ = clamp(_e80, vec4(0f), vec4(1f));
    let _e86 = u_xlat1_;
    let _e87 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e86 + -(_e87.zwxy));
    let _e91 = u_xlat11_;
    let _e96 = _f_buffer1_.f_cb1_[3];
    let _e98 = u_xlat1_;
    let _e101 = vs_TEXCOORD0_1;
    let _e103 = ((_e96.zz * _e98.zw) + _e101.xy);
    u_xlat11_.x = _e103.x;
    u_xlat11_.y = _e103.y;
    let _e108 = u_xlat1_;
    let _e113 = _f_buffer1_.f_cb1_[6];
    let _e115 = u_xlat1_;
    let _e118 = vs_TEXCOORD0_1;
    let _e120 = ((_e113.xx * _e115.xy) + _e118.zw);
    u_xlat1_.x = _e120.x;
    u_xlat1_.y = _e120.y;
    let _e125 = u_xlat1_;
    let _e130 = _f_buffer0_.f_cb0_[4];
    let _e135 = hscard_bias.values[1];
    let _e138 = textureSampleBias(f_t1_, samplerf_s1_, _e125.xy, (_e130.x + _e135.x));
    u_xlat2_ = _e138;
    let _e139 = u_xlat11_;
    let _e144 = _f_buffer0_.f_cb0_[4];
    let _e149 = hscard_bias.values[0];
    let _e152 = textureSampleBias(f_t0_, samplerf_s0_, _e139.xy, (_e144.x + _e149.x));
    u_xlat1_ = _e152;
    let _e153 = u_xlat3_;
    let _e155 = u_xlat1_;
    let _e160 = _f_buffer1_.f_cb1_[2];
    let _e162 = (_e155.xyz + _e160.yyy);
    u_xlat3_.x = _e162.x;
    u_xlat3_.y = _e162.y;
    u_xlat3_.z = _e162.z;
    let _e169 = u_xlat1_;
    let _e174 = _f_buffer1_.f_cb1_[3];
    u_xlat17_ = max(_e169.w, _e174.y);
    let _e177 = u_xlat3_;
    let _e179 = u_xlat17_;
    let _e184 = _f_buffer1_.f_cb1_[10];
    u_xlat18_ = ((_e177.y * _e179) + -(_e184.w));
    let _e188 = u_xlat3_;
    let _e190 = u_xlat17_;
    let _e192 = u_xlat3_;
    let _e194 = (vec3(_e190) * _e192.xyz);
    u_xlat3_.x = _e194.x;
    u_xlat3_.y = _e194.y;
    u_xlat3_.z = _e194.z;
    let _e201 = u_xlat18_;
    let _e202 = u_xlat15_;
    u_xlat15_ = (_e201 / _e202);
    let _e204 = u_xlat18_;
    u_xlat17_ = (_e204 * 5f);
    let _e207 = u_xlat17_;
    u_xlat17_ = clamp(_e207, 0f, 1f);
    let _e211 = u_xlat0_;
    let _e213 = u_xlat15_;
    let _e215 = u_xlat0_;
    let _e221 = _f_buffer1_.f_cb1_[9];
    let _e223 = ((vec3(_e213) * _e215.xyz) + _e221.xyz);
    u_xlat0_.x = _e223.x;
    u_xlat0_.y = _e223.y;
    u_xlat0_.z = _e223.z;
    let _e235 = _f_buffer1_.f_cb1_[10];
    u_xlat15_ = (1f / _e235.w);
    let _e238 = u_xlat15_;
    let _e239 = u_xlat3_;
    u_xlat15_ = (_e238 * _e239.y);
    let _e242 = u_xlat4_;
    let _e247 = _f_buffer1_.f_cb1_[9];
    let _e252 = _f_buffer1_.f_cb1_[10];
    let _e255 = (_e247.xyz + -(_e252.xyz));
    u_xlat4_.x = _e255.x;
    u_xlat4_.y = _e255.y;
    u_xlat4_.z = _e255.z;
    let _e262 = u_xlat4_;
    let _e264 = u_xlat15_;
    let _e266 = u_xlat4_;
    let _e272 = _f_buffer1_.f_cb1_[10];
    let _e274 = ((vec3(_e264) * _e266.xyz) + _e272.xyz);
    u_xlat4_.x = _e274.x;
    u_xlat4_.y = _e274.y;
    u_xlat4_.z = _e274.z;
    let _e281 = u_xlat0_;
    let _e283 = u_xlat0_;
    let _e285 = u_xlat4_;
    let _e288 = (_e283.xyz + -(_e285.xyz));
    u_xlat0_.x = _e288.x;
    u_xlat0_.y = _e288.y;
    u_xlat0_.z = _e288.z;
    let _e295 = u_xlat0_;
    let _e297 = u_xlat17_;
    let _e299 = u_xlat0_;
    let _e302 = u_xlat4_;
    let _e304 = ((vec3(_e297) * _e299.xyz) + _e302.xyz);
    u_xlat0_.x = _e304.x;
    u_xlat0_.y = _e304.y;
    u_xlat0_.z = _e304.z;
    let _e311 = u_xlat0_;
    let _e313 = u_xlat0_;
    let _e315 = u_xlat3_;
    let _e317 = (_e313.xyz * _e315.xyz);
    u_xlat0_.x = _e317.x;
    u_xlat0_.y = _e317.y;
    u_xlat0_.z = _e317.z;
    let _e324 = u_xlat1_;
    let _e326 = u_xlat0_;
    let _e331 = _f_buffer1_.f_cb1_[2];
    let _e333 = (_e326.xyz * _e331.xxx);
    u_xlat1_.x = _e333.x;
    u_xlat1_.y = _e333.y;
    u_xlat1_.z = _e333.z;
    let _e340 = u_xlat2_;
    let _e342 = vs_COLOR1_1;
    let _e344 = u_xlat1_;
    u_xlat0_ = ((_e340.xyzx * _e342) + _e344);
    let _e346 = u_xlat0_;
    let _e347 = vs_COLOR0_1;
    SV_Target0_ = (_e346 * _e347);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(11) vs_COLOR1_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR1_1 = vs_COLOR1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
