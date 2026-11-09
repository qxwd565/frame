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
    u_xlat1_ = _e246;
    let _e248 = u_xlat3_;
    let _e251 = u_xlat1_;
    u_xlat3_.x = (-(_e248.x) + _e251.w);
    let _e255 = u_xlat0_;
    let _e257 = u_xlat3_;
    u_xlat0_.x = (_e255.x * _e257.x);
    let _e261 = u_xlat0_;
    u_xlat0_.x = clamp(_e261.x, 0f, 1f);
    let _e267 = u_xlat0_;
    u_xlat3_.x = ((_e267.x * -2f) + 3f);
    let _e275 = u_xlat0_;
    let _e277 = u_xlat0_;
    u_xlat0_.x = (_e275.x * _e277.x);
    let _e281 = u_xlat0_;
    let _e283 = u_xlat3_;
    u_xlat0_.x = (_e281.x * _e283.x);
    let _e286 = u_xlat3_;
    let _e288 = u_xlat1_;
    let _e293 = _f_buffer1_.f_cb1_[2];
    let _e295 = (_e288.xyz + _e293.yyy);
    u_xlat3_.x = _e295.x;
    u_xlat3_.y = _e295.y;
    u_xlat3_.z = _e295.z;
    let _e302 = u_xlat1_;
    let _e307 = _f_buffer1_.f_cb1_[3];
    u_xlat2_ = max(_e302.w, _e307.y);
    let _e310 = u_xlat3_;
    let _e312 = u_xlat3_;
    let _e314 = u_xlat2_;
    let _e316 = (_e312.xyz * vec3(_e314));
    u_xlat3_.x = _e316.x;
    u_xlat3_.y = _e316.y;
    u_xlat3_.z = _e316.z;
    let _e323 = u_xlat1_;
    let _e325 = u_xlat3_;
    let _e330 = _f_buffer1_.f_cb1_[2];
    let _e332 = (_e325.xyz * _e330.xxx);
    u_xlat1_.x = _e332.x;
    u_xlat1_.y = _e332.y;
    u_xlat1_.z = _e332.z;
    let _e339 = u_xlat0_;
    let _e341 = u_xlat1_;
    u_xlat0_ = (_e339.xxxx * _e341);
    let _e343 = u_xlat0_;
    let _e344 = vs_COLOR0_1;
    SV_Target0_ = (_e343 * _e344);
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
