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
var<private> vs_COLOR1_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e39 = vs_TEXCOORD1_1;
    let _e43 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e39 + _e43.z);
    let _e47 = u_xlat0_;
    u_xlat0_.x = clamp(_e47.x, 0f, 1f);
    let _e53 = vs_TEXCOORD1_1;
    let _e57 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e53 + -(_e57.z));
    let _e62 = u_xlat3_;
    u_xlat3_.x = clamp(_e62.x, 0f, 1f);
    let _e68 = u_xlat3_;
    u_xlat3_.x = (_e68.x + -0.00001f);
    let _e74 = u_xlat3_;
    let _e77 = u_xlat0_;
    u_xlat0_.x = (-(_e74.x) + _e77.x);
    let _e83 = u_xlat0_;
    u_xlat0_.x = (1f / _e83.x);
    let _e86 = u_xlat6_;
    let _e88 = vs_TEXCOORD0_1;
    let _e89 = _e88.xy;
    u_xlat6_.x = _e89.x;
    u_xlat6_.y = _e89.y;
    let _e94 = u_xlat6_;
    let _e96 = u_xlat6_;
    let _e102 = clamp(_e96.xy, vec2(0f), vec2(1f));
    u_xlat6_.x = _e102.x;
    u_xlat6_.y = _e102.y;
    let _e107 = u_xlat6_;
    let _e109 = u_xlat6_;
    let _e111 = vs_TEXCOORD0_1;
    let _e114 = (_e109.xy + -(_e111.xy));
    u_xlat6_.x = _e114.x;
    u_xlat6_.y = _e114.y;
    let _e119 = u_xlat6_;
    let _e124 = _f_buffer1_.f_cb1_[3];
    let _e126 = u_xlat6_;
    let _e129 = vs_TEXCOORD0_1;
    let _e131 = ((_e124.zz * _e126.xy) + _e129.xy);
    u_xlat6_.x = _e131.x;
    u_xlat6_.y = _e131.y;
    let _e136 = u_xlat6_;
    let _e141 = _f_buffer0_.f_cb0_[4];
    let _e146 = hscard_bias.values[0];
    let _e149 = textureSampleBias(f_t0_, samplerf_s0_, _e136.xy, (_e141.x + _e146.x));
    u_xlat1_ = _e149.yzwx;
    let _e152 = u_xlat3_;
    let _e155 = u_xlat1_;
    u_xlat3_.x = (-(_e152.x) + _e155.w);
    let _e159 = u_xlat0_;
    let _e161 = u_xlat3_;
    u_xlat0_.x = (_e159.x * _e161.x);
    let _e165 = u_xlat0_;
    u_xlat0_.x = clamp(_e165.x, 0f, 1f);
    let _e171 = u_xlat0_;
    u_xlat3_.x = ((_e171.x * -2f) + 3f);
    let _e179 = u_xlat0_;
    let _e181 = u_xlat0_;
    u_xlat0_.x = (_e179.x * _e181.x);
    let _e185 = u_xlat0_;
    let _e187 = u_xlat3_;
    u_xlat0_.x = (_e185.x * _e187.x);
    let _e190 = u_xlat3_;
    let _e192 = u_xlat1_;
    let _e197 = _f_buffer1_.f_cb1_[2];
    let _e199 = (_e192.wxy + _e197.yyy);
    u_xlat3_.x = _e199.x;
    u_xlat3_.y = _e199.y;
    u_xlat3_.z = _e199.z;
    let _e207 = u_xlat1_;
    let _e212 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e207.w, _e212.y);
    let _e215 = u_xlat3_;
    let _e217 = u_xlat3_;
    let _e219 = u_xlat2_;
    let _e221 = (_e217.xyz * _e219.xxx);
    u_xlat3_.x = _e221.x;
    u_xlat3_.y = _e221.y;
    u_xlat3_.z = _e221.z;
    let _e228 = u_xlat1_;
    let _e230 = u_xlat3_;
    let _e235 = _f_buffer1_.f_cb1_[2];
    let _e237 = (_e230.xyz * _e235.xxx);
    u_xlat1_.x = _e237.x;
    u_xlat1_.y = _e237.y;
    u_xlat1_.z = _e237.z;
    let _e244 = vs_TEXCOORD0_1;
    let _e249 = _f_buffer0_.f_cb0_[4];
    let _e254 = hscard_bias.values[1];
    let _e257 = textureSampleBias(f_t1_, samplerf_s1_, _e244.zw, (_e249.x + _e254.x));
    u_xlat2_ = _e257;
    let _e258 = u_xlat2_;
    let _e260 = vs_COLOR1_1;
    u_xlat2_ = (_e258.xyzx * _e260);
    let _e262 = u_xlat1_;
    let _e263 = u_xlat0_;
    let _e266 = u_xlat2_;
    u_xlat0_ = ((_e262 * _e263.xxxx) + _e266);
    let _e268 = u_xlat0_;
    let _e269 = vs_COLOR0_1;
    SV_Target0_ = (_e268 * _e269);
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
