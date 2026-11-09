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
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);

    let _e42 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (-(_e42.w) + 1f);
    let _e47 = u_xlat4_;
    let _e49 = vs_TEXCOORD0_1;
    let _e50 = _e49.xy;
    u_xlat4_.x = _e50.x;
    u_xlat4_.y = _e50.y;
    let _e55 = u_xlat4_;
    let _e57 = u_xlat4_;
    let _e63 = clamp(_e57.xy, vec2(0f), vec2(1f));
    u_xlat4_.x = _e63.x;
    u_xlat4_.y = _e63.y;
    let _e68 = u_xlat4_;
    let _e70 = u_xlat4_;
    let _e72 = vs_TEXCOORD0_1;
    let _e75 = (_e70.xy + -(_e72.xy));
    u_xlat4_.x = _e75.x;
    u_xlat4_.y = _e75.y;
    let _e80 = u_xlat4_;
    let _e85 = _f_buffer1_.f_cb1_[3];
    let _e87 = u_xlat4_;
    let _e90 = vs_TEXCOORD0_1;
    let _e92 = ((_e85.zz * _e87.xy) + _e90.xy);
    u_xlat4_.x = _e92.x;
    u_xlat4_.y = _e92.y;
    let _e97 = u_xlat4_;
    let _e102 = _f_buffer0_.f_cb0_[4];
    let _e107 = hscard_bias.values[0];
    let _e110 = textureSampleBias(f_t0_, samplerf_s0_, _e97.xy, (_e102.x + _e107.x));
    u_xlat1_ = _e110;
    let _e111 = u_xlat4_;
    let _e113 = u_xlat1_;
    let _e118 = _f_buffer1_.f_cb1_[2];
    let _e120 = (_e113.xyz + _e118.yyy);
    u_xlat4_.x = _e120.x;
    u_xlat4_.y = _e120.y;
    u_xlat4_.z = _e120.z;
    let _e128 = u_xlat1_;
    let _e133 = _f_buffer1_.f_cb1_[3];
    u_xlat2_.x = max(_e128.w, _e133.y);
    let _e137 = u_xlat4_;
    let _e139 = u_xlat2_;
    let _e145 = _f_buffer1_.f_cb1_[10];
    u_xlat6_.x = ((_e137.y * _e139.x) + -(_e145.w));
    let _e149 = u_xlat4_;
    let _e151 = u_xlat4_;
    let _e153 = u_xlat2_;
    let _e155 = (_e151.xyz * _e153.xxx);
    u_xlat4_.x = _e155.x;
    u_xlat4_.y = _e155.y;
    u_xlat4_.z = _e155.z;
    let _e163 = u_xlat6_;
    let _e165 = u_xlat0_;
    u_xlat0_.x = (_e163.x / _e165.x);
    let _e169 = u_xlat6_;
    u_xlat2_.x = (_e169.x * 5f);
    let _e174 = u_xlat2_;
    u_xlat2_.x = clamp(_e174.x, 0f, 1f);
    let _e179 = u_xlat6_;
    let _e184 = _f_buffer1_.f_cb1_[8];
    let _e189 = _f_buffer1_.f_cb1_[9];
    let _e192 = (_e184.yzw + -(_e189.xyz));
    u_xlat6_.x = _e192.x;
    u_xlat6_.y = _e192.y;
    u_xlat6_.z = _e192.z;
    let _e199 = u_xlat6_;
    let _e201 = u_xlat0_;
    let _e203 = u_xlat6_;
    let _e209 = _f_buffer1_.f_cb1_[9];
    let _e211 = ((_e201.xxx * _e203.xyz) + _e209.xyz);
    u_xlat6_.x = _e211.x;
    u_xlat6_.y = _e211.y;
    u_xlat6_.z = _e211.z;
    let _e224 = _f_buffer1_.f_cb1_[10];
    u_xlat0_.x = (1f / _e224.w);
    let _e228 = u_xlat0_;
    let _e230 = u_xlat4_;
    u_xlat0_.x = (_e228.x * _e230.y);
    let _e233 = u_xlat3_;
    let _e238 = _f_buffer1_.f_cb1_[9];
    let _e243 = _f_buffer1_.f_cb1_[10];
    let _e246 = (_e238.xyz + -(_e243.xyz));
    u_xlat3_.x = _e246.x;
    u_xlat3_.y = _e246.y;
    u_xlat3_.z = _e246.z;
    let _e253 = u_xlat3_;
    let _e255 = u_xlat0_;
    let _e257 = u_xlat3_;
    let _e263 = _f_buffer1_.f_cb1_[10];
    let _e265 = ((_e255.xxx * _e257.xyz) + _e263.xyz);
    u_xlat3_.x = _e265.x;
    u_xlat3_.y = _e265.y;
    u_xlat3_.z = _e265.z;
    let _e272 = u_xlat6_;
    let _e274 = u_xlat6_;
    let _e276 = u_xlat3_;
    let _e279 = (_e274.xyz + -(_e276.xyz));
    u_xlat6_.x = _e279.x;
    u_xlat6_.y = _e279.y;
    u_xlat6_.z = _e279.z;
    let _e286 = u_xlat2_;
    let _e288 = u_xlat2_;
    let _e290 = u_xlat6_;
    let _e293 = u_xlat3_;
    let _e295 = ((_e288.xxx * _e290.xyz) + _e293.xyz);
    u_xlat2_.x = _e295.x;
    u_xlat2_.y = _e295.y;
    u_xlat2_.z = _e295.z;
    let _e302 = u_xlat0_;
    let _e304 = u_xlat4_;
    let _e306 = u_xlat2_;
    let _e308 = (_e304.xyz * _e306.xyz);
    u_xlat0_.x = _e308.x;
    u_xlat0_.y = _e308.y;
    u_xlat0_.z = _e308.z;
    let _e315 = u_xlat1_;
    let _e317 = u_xlat0_;
    let _e322 = _f_buffer1_.f_cb1_[2];
    let _e324 = (_e317.xyz * _e322.xxx);
    u_xlat1_.x = _e324.x;
    u_xlat1_.y = _e324.y;
    u_xlat1_.z = _e324.z;
    let _e331 = u_xlat1_;
    let _e332 = vs_COLOR0_1;
    SV_Target0_ = (_e331 * _e332);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e24 = SV_Target0_;
    return FragmentOutput(_e24);
}
