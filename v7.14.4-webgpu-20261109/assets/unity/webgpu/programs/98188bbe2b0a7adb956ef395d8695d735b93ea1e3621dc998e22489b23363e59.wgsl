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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: f32;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: f32 = 0f;
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec2<f32> = vec2(0f);

    let _e35 = vs_TEXCOORD1_1;
    let _e39 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e35 + _e39.z);
    let _e43 = u_xlat0_;
    u_xlat0_.x = clamp(_e43.x, 0f, 1f);
    let _e49 = vs_TEXCOORD1_1;
    let _e53 = _f_buffer1_.f_cb1_[12];
    u_xlat3_.x = (_e49 + -(_e53.z));
    let _e58 = u_xlat3_;
    u_xlat3_.x = clamp(_e58.x, 0f, 1f);
    let _e64 = u_xlat3_;
    u_xlat3_.x = (_e64.x + -0.00001f);
    let _e70 = u_xlat3_;
    let _e73 = u_xlat0_;
    u_xlat0_.x = (-(_e70.x) + _e73.x);
    let _e79 = u_xlat0_;
    u_xlat0_.x = (1f / _e79.x);
    let _e82 = u_xlat6_;
    let _e84 = vs_TEXCOORD0_1;
    let _e85 = _e84.xy;
    u_xlat6_.x = _e85.x;
    u_xlat6_.y = _e85.y;
    let _e90 = u_xlat6_;
    let _e92 = u_xlat6_;
    let _e98 = clamp(_e92.xy, vec2(0f), vec2(1f));
    u_xlat6_.x = _e98.x;
    u_xlat6_.y = _e98.y;
    let _e103 = u_xlat6_;
    let _e105 = u_xlat6_;
    let _e107 = vs_TEXCOORD0_1;
    let _e110 = (_e105.xy + -(_e107.xy));
    u_xlat6_.x = _e110.x;
    u_xlat6_.y = _e110.y;
    let _e115 = u_xlat6_;
    let _e120 = _f_buffer1_.f_cb1_[3];
    let _e122 = u_xlat6_;
    let _e125 = vs_TEXCOORD0_1;
    let _e127 = ((_e120.zz * _e122.xy) + _e125.xy);
    u_xlat6_.x = _e127.x;
    u_xlat6_.y = _e127.y;
    let _e132 = u_xlat6_;
    let _e137 = _f_buffer0_.f_cb0_[4];
    let _e142 = hscard_bias.values[0];
    let _e145 = textureSampleBias(f_t0_, samplerf_s0_, _e132.xy, (_e137.x + _e142.x));
    u_xlat1_ = _e145.yzwx;
    let _e148 = u_xlat3_;
    let _e151 = u_xlat1_;
    u_xlat3_.x = (-(_e148.x) + _e151.w);
    let _e155 = u_xlat0_;
    let _e157 = u_xlat3_;
    u_xlat0_.x = (_e155.x * _e157.x);
    let _e161 = u_xlat0_;
    u_xlat0_.x = clamp(_e161.x, 0f, 1f);
    let _e167 = u_xlat0_;
    u_xlat3_.x = ((_e167.x * -2f) + 3f);
    let _e175 = u_xlat0_;
    let _e177 = u_xlat0_;
    u_xlat0_.x = (_e175.x * _e177.x);
    let _e181 = u_xlat0_;
    let _e183 = u_xlat3_;
    u_xlat0_.x = (_e181.x * _e183.x);
    let _e186 = u_xlat3_;
    let _e188 = u_xlat1_;
    let _e193 = _f_buffer1_.f_cb1_[2];
    let _e195 = (_e188.wxy + _e193.yyy);
    u_xlat3_.x = _e195.x;
    u_xlat3_.y = _e195.y;
    u_xlat3_.z = _e195.z;
    let _e202 = u_xlat1_;
    let _e207 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e202.w, _e207.y);
    let _e210 = u_xlat3_;
    let _e212 = u_xlat3_;
    let _e214 = u_xlat2_;
    let _e216 = (_e212.xyz * vec3(_e214));
    u_xlat3_.x = _e216.x;
    u_xlat3_.y = _e216.y;
    u_xlat3_.z = _e216.z;
    let _e223 = u_xlat1_;
    let _e225 = u_xlat3_;
    let _e230 = _f_buffer1_.f_cb1_[2];
    let _e232 = (_e225.xyz * _e230.xxx);
    u_xlat1_.x = _e232.x;
    u_xlat1_.y = _e232.y;
    u_xlat1_.z = _e232.z;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat1_;
    u_xlat0_ = (_e239.xxxx * _e241);
    let _e243 = u_xlat0_;
    let _e244 = vs_COLOR0_1;
    SV_Target0_ = (_e243 * _e244);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: f32, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e28 = SV_Target0_;
    return FragmentOutput(_e28);
}
