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
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e37 = vs_TEXCOORD1_1;
    let _e41 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e37 + _e41.z);
    let _e45 = u_xlat0_;
    u_xlat0_.x = clamp(_e45.x, 0f, 1f);
    let _e51 = vs_TEXCOORD1_1;
    let _e55 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e51 + -(_e55.z));
    let _e60 = u_xlat3_;
    u_xlat3_.x = clamp(_e60.x, 0f, 1f);
    let _e66 = u_xlat3_;
    u_xlat3_.x = (_e66.x + -0.00001f);
    let _e72 = u_xlat3_;
    let _e75 = u_xlat0_;
    u_xlat0_.x = (-(_e72.x) + _e75.x);
    let _e81 = u_xlat0_;
    u_xlat0_.x = (1f / _e81.x);
    let _e84 = u_xlat6_;
    let _e86 = vs_TEXCOORD0_1;
    let _e87 = _e86.zw;
    u_xlat6_.x = _e87.x;
    u_xlat6_.y = _e87.y;
    let _e92 = u_xlat6_;
    let _e94 = u_xlat6_;
    let _e100 = clamp(_e94.xy, vec2(0f), vec2(1f));
    u_xlat6_.x = _e100.x;
    u_xlat6_.y = _e100.y;
    let _e105 = u_xlat6_;
    let _e107 = u_xlat6_;
    let _e109 = vs_TEXCOORD0_1;
    let _e112 = (_e107.xy + -(_e109.zw));
    u_xlat6_.x = _e112.x;
    u_xlat6_.y = _e112.y;
    let _e117 = u_xlat6_;
    let _e122 = _f_buffer1_.f_cb1_[6];
    let _e124 = u_xlat6_;
    let _e127 = vs_TEXCOORD0_1;
    let _e129 = ((_e122.xx * _e124.xy) + _e127.zw);
    u_xlat6_.x = _e129.x;
    u_xlat6_.y = _e129.y;
    let _e134 = u_xlat6_;
    let _e139 = _f_buffer0_.f_cb0_[4];
    let _e144 = hscard_bias.values[1];
    let _e147 = textureSampleBias(f_t1_, samplerf_s1_, _e134.xy, (_e139.x + _e144.x));
    u_xlat1_ = _e147;
    let _e148 = u_xlat6_;
    let _e150 = u_xlat1_;
    let _e161 = ((_e150.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat6_.x = _e161.x;
    u_xlat6_.y = _e161.y;
    let _e166 = u_xlat6_;
    let _e168 = u_xlat6_;
    let _e173 = _f_buffer1_.f_cb1_[5];
    let _e176 = vs_TEXCOORD0_1;
    let _e178 = ((_e168.xy * _e173.zw) + _e176.xy);
    u_xlat6_.x = _e178.x;
    u_xlat6_.y = _e178.y;
    let _e183 = u_xlat1_;
    let _e185 = u_xlat6_;
    let _e186 = _e185.xy;
    u_xlat1_.x = _e186.x;
    u_xlat1_.y = _e186.y;
    let _e191 = u_xlat1_;
    let _e193 = u_xlat1_;
    let _e199 = clamp(_e193.xy, vec2(0f), vec2(1f));
    u_xlat1_.x = _e199.x;
    u_xlat1_.y = _e199.y;
    let _e204 = u_xlat1_;
    let _e206 = u_xlat6_;
    let _e209 = u_xlat1_;
    let _e211 = (-(_e206.xy) + _e209.xy);
    u_xlat1_.x = _e211.x;
    u_xlat1_.y = _e211.y;
    let _e216 = u_xlat6_;
    let _e221 = _f_buffer1_.f_cb1_[3];
    let _e223 = u_xlat1_;
    let _e226 = u_xlat6_;
    let _e228 = ((_e221.zz * _e223.xy) + _e226.xy);
    u_xlat6_.x = _e228.x;
    u_xlat6_.y = _e228.y;
    let _e233 = u_xlat6_;
    let _e238 = _f_buffer0_.f_cb0_[4];
    let _e243 = hscard_bias.values[0];
    let _e246 = textureSampleBias(f_t0_, samplerf_s0_, _e233.xy, (_e238.x + _e243.x));
    u_xlat1_ = _e246.yzwx;
    let _e249 = u_xlat3_;
    let _e252 = u_xlat1_;
    u_xlat3_.x = (-(_e249.x) + _e252.w);
    let _e256 = u_xlat0_;
    let _e258 = u_xlat3_;
    u_xlat0_.x = (_e256.x * _e258.x);
    let _e262 = u_xlat0_;
    u_xlat0_.x = clamp(_e262.x, 0f, 1f);
    let _e268 = u_xlat0_;
    u_xlat3_.x = ((_e268.x * -2f) + 3f);
    let _e276 = u_xlat0_;
    let _e278 = u_xlat0_;
    u_xlat0_.x = (_e276.x * _e278.x);
    let _e282 = u_xlat0_;
    let _e284 = u_xlat3_;
    u_xlat0_.x = (_e282.x * _e284.x);
    let _e287 = u_xlat3_;
    let _e289 = u_xlat1_;
    let _e294 = _f_buffer1_.f_cb1_[2];
    let _e296 = (_e289.wxy + _e294.yyy);
    u_xlat3_.x = _e296.x;
    u_xlat3_.y = _e296.y;
    u_xlat3_.z = _e296.z;
    let _e303 = u_xlat1_;
    let _e308 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e303.w, _e308.y);
    let _e311 = u_xlat3_;
    let _e313 = u_xlat3_;
    let _e315 = u_xlat2_;
    let _e317 = (_e313.xyz * vec3(_e315));
    u_xlat3_.x = _e317.x;
    u_xlat3_.y = _e317.y;
    u_xlat3_.z = _e317.z;
    let _e324 = u_xlat1_;
    let _e326 = u_xlat3_;
    let _e331 = _f_buffer1_.f_cb1_[2];
    let _e333 = (_e326.xyz * _e331.xxx);
    u_xlat1_.x = _e333.x;
    u_xlat1_.y = _e333.y;
    u_xlat1_.z = _e333.z;
    let _e340 = u_xlat0_;
    let _e342 = u_xlat1_;
    u_xlat0_ = (_e340.xxxx * _e342);
    let _e344 = u_xlat0_;
    let _e345 = vs_COLOR0_1;
    SV_Target0_ = (_e344 * _e345);
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
