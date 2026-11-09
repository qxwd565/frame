struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 8>,
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
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e35 = vs_TEXCOORD0_1;
    u_xlat0_ = _e35.zwxy;
    let _e37 = u_xlat0_;
    u_xlat0_ = clamp(_e37, vec4(0f), vec4(1f));
    let _e43 = u_xlat0_;
    let _e44 = vs_TEXCOORD0_1;
    u_xlat0_ = (_e43 + -(_e44.zwxy));
    let _e48 = u_xlat0_;
    let _e53 = _f_buffer1_.f_cb1_[6];
    let _e55 = u_xlat0_;
    let _e58 = vs_TEXCOORD0_1;
    let _e60 = ((_e53.xx * _e55.xy) + _e58.zw);
    u_xlat0_.x = _e60.x;
    u_xlat0_.y = _e60.y;
    let _e65 = u_xlat6_;
    let _e70 = _f_buffer1_.f_cb1_[3];
    let _e72 = u_xlat0_;
    let _e75 = vs_TEXCOORD0_1;
    let _e77 = ((_e70.zz * _e72.zw) + _e75.xy);
    u_xlat6_.x = _e77.x;
    u_xlat6_.y = _e77.y;
    let _e82 = u_xlat6_;
    let _e87 = _f_buffer0_.f_cb0_[4];
    let _e92 = hscard_bias.values[0];
    let _e95 = textureSampleBias(f_t0_, samplerf_s0_, _e82.xy, (_e87.x + _e92.x));
    u_xlat1_ = _e95.yzwx;
    let _e97 = u_xlat0_;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[1];
    let _e110 = textureSampleBias(f_t1_, samplerf_s1_, _e97.xy, (_e102.x + _e107.x));
    u_xlat0_ = _e110;
    let _e112 = u_xlat0_;
    u_xlat0_.x = (_e112.w + -1f);
    let _e121 = _f_buffer1_.f_cb1_[7];
    let _e123 = u_xlat0_;
    u_xlat0_.x = ((_e121.w * _e123.x) + 1f);
    let _e128 = u_xlat3_;
    let _e130 = u_xlat1_;
    let _e135 = _f_buffer1_.f_cb1_[2];
    let _e137 = (_e130.wxy + _e135.yyy);
    u_xlat3_.x = _e137.x;
    u_xlat3_.y = _e137.y;
    u_xlat3_.z = _e137.z;
    let _e144 = u_xlat1_;
    let _e149 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e144.w, _e149.y);
    let _e152 = u_xlat3_;
    let _e154 = u_xlat3_;
    let _e156 = u_xlat2_;
    let _e158 = (_e154.xyz * vec3(_e156));
    u_xlat3_.x = _e158.x;
    u_xlat3_.y = _e158.y;
    u_xlat3_.z = _e158.z;
    let _e165 = u_xlat1_;
    let _e167 = u_xlat3_;
    let _e172 = _f_buffer1_.f_cb1_[2];
    let _e174 = (_e167.xyz * _e172.xxx);
    u_xlat1_.x = _e174.x;
    u_xlat1_.y = _e174.y;
    u_xlat1_.z = _e174.z;
    let _e181 = u_xlat0_;
    let _e183 = u_xlat1_;
    u_xlat0_ = (_e181.xxxx * _e183);
    let _e185 = u_xlat0_;
    let _e186 = vs_COLOR0_1;
    SV_Target0_ = (_e185 * _e186);
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
