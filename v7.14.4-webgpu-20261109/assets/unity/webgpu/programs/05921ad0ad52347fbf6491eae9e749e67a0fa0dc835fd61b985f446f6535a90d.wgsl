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
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e37 = vs_TEXCOORD1_1;
    let _e41 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e37 + _e41.z);
    let _e45 = u_xlat0_;
    u_xlat0_.x = clamp(_e45.x, 0f, 1f);
    let _e50 = vs_TEXCOORD1_1;
    let _e54 = _f_buffer1_.f_cb1_[12];
    u_xlat3_ = (_e50 + -(_e54.z));
    let _e58 = u_xlat3_;
    u_xlat3_ = clamp(_e58, 0f, 1f);
    let _e62 = u_xlat3_;
    u_xlat3_ = (_e62 + -0.00001f);
    let _e67 = u_xlat3_;
    let _e69 = u_xlat0_;
    u_xlat0_.x = (-(_e67) + _e69.x);
    let _e75 = u_xlat0_;
    u_xlat0_.x = (1f / _e75.x);
    let _e78 = u_xlat6_;
    let _e80 = vs_TEXCOORD0_1;
    let _e81 = _e80.xy;
    u_xlat6_.x = _e81.x;
    u_xlat6_.y = _e81.y;
    let _e86 = u_xlat6_;
    let _e88 = u_xlat6_;
    let _e94 = clamp(_e88.xy, vec2(0f), vec2(1f));
    u_xlat6_.x = _e94.x;
    u_xlat6_.y = _e94.y;
    let _e99 = u_xlat6_;
    let _e101 = u_xlat6_;
    let _e103 = vs_TEXCOORD0_1;
    let _e106 = (_e101.xy + -(_e103.xy));
    u_xlat6_.x = _e106.x;
    u_xlat6_.y = _e106.y;
    let _e111 = u_xlat6_;
    let _e116 = _f_buffer1_.f_cb1_[3];
    let _e118 = u_xlat6_;
    let _e121 = vs_TEXCOORD0_1;
    let _e123 = ((_e116.zz * _e118.xy) + _e121.xy);
    u_xlat6_.x = _e123.x;
    u_xlat6_.y = _e123.y;
    let _e128 = u_xlat6_;
    let _e133 = _f_buffer0_.f_cb0_[4];
    let _e138 = hscard_bias.values[0];
    let _e141 = textureSampleBias(f_t0_, samplerf_s0_, _e128.xy, (_e133.x + _e138.x));
    u_xlat1_ = _e141;
    let _e142 = u_xlat3_;
    let _e144 = u_xlat1_;
    u_xlat3_ = (-(_e142) + _e144.w);
    let _e148 = u_xlat0_;
    let _e150 = u_xlat3_;
    u_xlat0_.x = (_e148.x * _e150);
    let _e153 = u_xlat0_;
    u_xlat0_.x = clamp(_e153.x, 0f, 1f);
    let _e158 = u_xlat0_;
    u_xlat3_ = ((_e158.x * -2f) + 3f);
    let _e166 = u_xlat0_;
    let _e168 = u_xlat0_;
    u_xlat0_.x = (_e166.x * _e168.x);
    let _e172 = u_xlat0_;
    let _e174 = u_xlat3_;
    u_xlat0_.x = (_e172.x * _e174);
    let _e176 = u_xlat1_;
    let _e181 = _f_buffer1_.f_cb1_[2];
    u_xlat3_ = (_e176.x + _e181.y);
    let _e185 = u_xlat1_;
    let _e190 = _f_buffer1_.f_cb1_[3];
    u_xlat6_.x = max(_e185.w, _e190.y);
    let _e194 = u_xlat6_;
    let _e196 = u_xlat3_;
    u_xlat2_.x = (_e194.x * _e196);
    let _e202 = _f_buffer1_.f_cb1_[11];
    u_xlat2_.y = ((_e202.x * 0.03125f) + 0.015625f);
    let _e208 = u_xlat2_;
    let _e213 = _f_buffer0_.f_cb0_[4];
    let _e218 = hscard_bias.values[1];
    let _e221 = textureSampleBias(f_t1_, samplerf_s1_, _e208.xy, (_e213.x + _e218.x));
    u_xlat2_ = _e221;
    let _e222 = u_xlat1_;
    let _e224 = u_xlat2_;
    let _e229 = _f_buffer1_.f_cb1_[2];
    let _e231 = (_e224.xyz * _e229.xxx);
    u_xlat1_.x = _e231.x;
    u_xlat1_.y = _e231.y;
    u_xlat1_.z = _e231.z;
    let _e238 = u_xlat0_;
    let _e240 = u_xlat1_;
    u_xlat0_ = (_e238.xxxx * _e240);
    let _e242 = u_xlat0_;
    let _e243 = vs_COLOR0_1;
    SV_Target0_ = (_e242 * _e243);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_Target0_;
    return FragmentOutput(_e32);
}
