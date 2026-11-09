struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 6>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
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
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);

    let _e37 = vs_TEXCOORD1_1;
    let _e42 = _f_buffer0_.f_cb0_[4];
    let _e47 = hscard_bias.values[1];
    let _e50 = textureSampleBias(f_t1_, samplerf_s1_, _e37.xy, (_e42.x + _e47.x));
    u_xlat0_ = _e50;
    let _e52 = u_xlat0_;
    u_xlat0_.x = (-(_e52.x) + 1f);
    let _e58 = u_xlat0_;
    let _e63 = _f_buffer1_.f_cb1_[5];
    u_xlat0_.x = (_e58.x + _e63.x);
    let _e67 = u_xlat0_;
    u_xlat0_.x = clamp(_e67.x, 0f, 1f);
    let _e73 = u_xlat0_;
    u_xlat0_.x = log2(_e73.x);
    let _e76 = u_xlat0_;
    let _e78 = u_xlat0_;
    let _e83 = _f_buffer1_.f_cb1_[5];
    let _e85 = (_e78.xx * _e83.yz);
    u_xlat0_.x = _e85.x;
    u_xlat0_.y = _e85.y;
    let _e90 = u_xlat0_;
    let _e92 = u_xlat0_;
    let _e94 = exp2(_e92.xy);
    u_xlat0_.x = _e94.x;
    u_xlat0_.y = _e94.y;
    let _e99 = u_xlat0_;
    let _e101 = u_xlat0_;
    let _e107 = (-(_e101.xy) + vec2<f32>(1f, 1f));
    u_xlat0_.x = _e107.x;
    u_xlat0_.y = _e107.y;
    let _e112 = vs_TEXCOORD0_1;
    let _e117 = _f_buffer0_.f_cb0_[4];
    let _e122 = hscard_bias.values[0];
    let _e125 = textureSampleBias(f_t0_, samplerf_s0_, _e112.xy, (_e117.x + _e122.x));
    u_xlat1_ = _e125;
    let _e126 = u_xlat2_;
    let _e128 = u_xlat1_;
    let _e133 = _f_buffer1_.f_cb1_[0];
    let _e135 = (_e128.xyz * _e133.xyz);
    u_xlat2_.x = _e135.x;
    u_xlat2_.y = _e135.y;
    u_xlat2_.z = _e135.z;
    let _e142 = u_xlat3_;
    let _e144 = u_xlat1_;
    let _e150 = _f_buffer1_.f_cb1_[0];
    let _e156 = _f_buffer1_.f_cb1_[2];
    let _e158 = ((-(_e144.xyz) * _e150.xyz) + _e156.xyz);
    u_xlat3_.x = _e158.x;
    u_xlat3_.y = _e158.y;
    u_xlat3_.z = _e158.z;
    let _e165 = u_xlat1_;
    let _e167 = u_xlat1_;
    let _e172 = _f_buffer1_.f_cb1_[1];
    let _e178 = _f_buffer1_.f_cb1_[2];
    let _e181 = ((_e167.xyz * _e172.xyz) + -(_e178.xyz));
    u_xlat1_.x = _e181.x;
    u_xlat1_.y = _e181.y;
    u_xlat1_.z = _e181.z;
    let _e188 = u_xlat4_;
    let _e190 = u_xlat0_;
    let _e192 = u_xlat1_;
    let _e198 = _f_buffer1_.f_cb1_[2];
    let _e200 = ((_e190.yyy * _e192.xyz) + _e198.xyz);
    u_xlat4_.x = _e200.x;
    u_xlat4_.y = _e200.y;
    u_xlat4_.z = _e200.z;
    let _e207 = u_xlat1_;
    let _e209 = u_xlat0_;
    let _e211 = u_xlat3_;
    let _e214 = u_xlat2_;
    let _e216 = ((_e209.xxx * _e211.xyz) + _e214.xyz);
    u_xlat1_.x = _e216.x;
    u_xlat1_.y = _e216.y;
    u_xlat1_.z = _e216.z;
    let _e223 = u_xlat4_;
    let _e225 = u_xlat4_;
    let _e227 = u_xlat1_;
    let _e230 = (_e225.xyz + -(_e227.xyz));
    u_xlat4_.x = _e230.x;
    u_xlat4_.y = _e230.y;
    u_xlat4_.z = _e230.z;
    let _e237 = u_xlat0_;
    let _e239 = u_xlat0_;
    let _e241 = u_xlat4_;
    let _e244 = u_xlat1_;
    let _e246 = ((_e239.xxx * _e241.xyz) + _e244.xyz);
    u_xlat0_.x = _e246.x;
    u_xlat0_.y = _e246.y;
    u_xlat0_.z = _e246.z;
    u_xlat0_.w = 1f;
    let _e255 = u_xlat0_;
    let _e256 = vs_COLOR0_1;
    SV_TARGET0_ = (_e255 * _e256);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e32 = SV_TARGET0_;
    return FragmentOutput(_e32);
}
