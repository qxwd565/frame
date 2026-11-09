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
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec3<f32> = vec3(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat8_: vec2<f32> = vec2(0f);
    var u_xlat13_: f32 = 0f;

    let _e43 = u_xlat0_;
    let _e45 = vs_TEXCOORD0_1;
    let _e46 = _e45.zw;
    u_xlat0_.x = _e46.x;
    u_xlat0_.y = _e46.y;
    let _e51 = u_xlat0_;
    let _e53 = u_xlat0_;
    let _e59 = clamp(_e53.xy, vec2(0f), vec2(1f));
    u_xlat0_.x = _e59.x;
    u_xlat0_.y = _e59.y;
    let _e64 = u_xlat0_;
    let _e66 = u_xlat0_;
    let _e68 = vs_TEXCOORD0_1;
    let _e71 = (_e66.xy + -(_e68.zw));
    u_xlat0_.x = _e71.x;
    u_xlat0_.y = _e71.y;
    let _e76 = u_xlat0_;
    let _e81 = _f_buffer1_.f_cb1_[6];
    let _e83 = u_xlat0_;
    let _e86 = vs_TEXCOORD0_1;
    let _e88 = ((_e81.xx * _e83.xy) + _e86.zw);
    u_xlat0_.x = _e88.x;
    u_xlat0_.y = _e88.y;
    let _e93 = u_xlat0_;
    let _e98 = _f_buffer0_.f_cb0_[4];
    let _e103 = hscard_bias.values[1];
    let _e106 = textureSampleBias(f_t1_, samplerf_s1_, _e93.xy, (_e98.x + _e103.x));
    u_xlat0_ = _e106;
    let _e107 = u_xlat0_;
    let _e109 = u_xlat0_;
    let _e120 = ((_e109.xy * vec2<f32>(2f, 2f)) + vec2<f32>(-1f, -1f));
    u_xlat0_.x = _e120.x;
    u_xlat0_.y = _e120.y;
    let _e125 = u_xlat0_;
    let _e127 = u_xlat0_;
    let _e132 = _f_buffer1_.f_cb1_[5];
    let _e135 = vs_TEXCOORD0_1;
    let _e137 = ((_e127.xy * _e132.zw) + _e135.xy);
    u_xlat0_.x = _e137.x;
    u_xlat0_.y = _e137.y;
    let _e142 = u_xlat8_;
    let _e144 = u_xlat0_;
    let _e145 = _e144.xy;
    u_xlat8_.x = _e145.x;
    u_xlat8_.y = _e145.y;
    let _e150 = u_xlat8_;
    let _e152 = u_xlat8_;
    let _e158 = clamp(_e152.xy, vec2(0f), vec2(1f));
    u_xlat8_.x = _e158.x;
    u_xlat8_.y = _e158.y;
    let _e163 = u_xlat8_;
    let _e165 = u_xlat0_;
    let _e168 = u_xlat8_;
    let _e170 = (-(_e165.xy) + _e168.xy);
    u_xlat8_.x = _e170.x;
    u_xlat8_.y = _e170.y;
    let _e175 = u_xlat0_;
    let _e180 = _f_buffer1_.f_cb1_[3];
    let _e182 = u_xlat8_;
    let _e185 = u_xlat0_;
    let _e187 = ((_e180.zz * _e182.xy) + _e185.xy);
    u_xlat0_.x = _e187.x;
    u_xlat0_.y = _e187.y;
    let _e192 = u_xlat0_;
    let _e197 = _f_buffer0_.f_cb0_[4];
    let _e202 = hscard_bias.values[0];
    let _e205 = textureSampleBias(f_t0_, samplerf_s0_, _e192.xy, (_e197.x + _e202.x));
    u_xlat0_ = _e205;
    let _e206 = u_xlat1_;
    let _e208 = u_xlat0_;
    let _e213 = _f_buffer1_.f_cb1_[2];
    let _e215 = (_e208.xyz + _e213.yyy);
    u_xlat1_.x = _e215.x;
    u_xlat1_.y = _e215.y;
    u_xlat1_.z = _e215.z;
    let _e222 = u_xlat0_;
    let _e227 = _f_buffer1_.f_cb1_[3];
    u_xlat13_ = max(_e222.w, _e227.y);
    let _e231 = u_xlat1_;
    let _e233 = u_xlat13_;
    let _e238 = _f_buffer1_.f_cb1_[10];
    u_xlat2_.x = ((_e231.y * _e233) + -(_e238.w));
    let _e242 = u_xlat1_;
    let _e244 = u_xlat13_;
    let _e246 = u_xlat1_;
    let _e248 = (vec3(_e244) * _e246.xyz);
    u_xlat1_.x = _e248.x;
    u_xlat1_.y = _e248.y;
    u_xlat1_.z = _e248.z;
    let _e258 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (-(_e258.w) + 1f);
    let _e263 = u_xlat2_;
    let _e265 = u_xlat13_;
    u_xlat13_ = (_e263.x / _e265);
    let _e268 = u_xlat2_;
    u_xlat2_.x = (_e268.x * 5f);
    let _e273 = u_xlat2_;
    u_xlat2_.x = clamp(_e273.x, 0f, 1f);
    let _e278 = u_xlat6_;
    let _e283 = _f_buffer1_.f_cb1_[8];
    let _e288 = _f_buffer1_.f_cb1_[9];
    let _e291 = (_e283.yzw + -(_e288.xyz));
    u_xlat6_.x = _e291.x;
    u_xlat6_.y = _e291.y;
    u_xlat6_.z = _e291.z;
    let _e298 = u_xlat6_;
    let _e300 = u_xlat13_;
    let _e302 = u_xlat6_;
    let _e308 = _f_buffer1_.f_cb1_[9];
    let _e310 = ((vec3(_e300) * _e302.xyz) + _e308.xyz);
    u_xlat6_.x = _e310.x;
    u_xlat6_.y = _e310.y;
    u_xlat6_.z = _e310.z;
    let _e322 = _f_buffer1_.f_cb1_[10];
    u_xlat13_ = (1f / _e322.w);
    let _e325 = u_xlat13_;
    let _e326 = u_xlat1_;
    u_xlat13_ = (_e325 * _e326.y);
    let _e329 = u_xlat3_;
    let _e334 = _f_buffer1_.f_cb1_[9];
    let _e339 = _f_buffer1_.f_cb1_[10];
    let _e342 = (_e334.xyz + -(_e339.xyz));
    u_xlat3_.x = _e342.x;
    u_xlat3_.y = _e342.y;
    u_xlat3_.z = _e342.z;
    let _e349 = u_xlat3_;
    let _e351 = u_xlat13_;
    let _e353 = u_xlat3_;
    let _e359 = _f_buffer1_.f_cb1_[10];
    let _e361 = ((vec3(_e351) * _e353.xyz) + _e359.xyz);
    u_xlat3_.x = _e361.x;
    u_xlat3_.y = _e361.y;
    u_xlat3_.z = _e361.z;
    let _e368 = u_xlat6_;
    let _e370 = u_xlat6_;
    let _e372 = u_xlat3_;
    let _e375 = (_e370.xyz + -(_e372.xyz));
    u_xlat6_.x = _e375.x;
    u_xlat6_.y = _e375.y;
    u_xlat6_.z = _e375.z;
    let _e382 = u_xlat2_;
    let _e384 = u_xlat2_;
    let _e386 = u_xlat6_;
    let _e389 = u_xlat3_;
    let _e391 = ((_e384.xxx * _e386.xyz) + _e389.xyz);
    u_xlat2_.x = _e391.x;
    u_xlat2_.y = _e391.y;
    u_xlat2_.z = _e391.z;
    let _e398 = u_xlat1_;
    let _e400 = u_xlat1_;
    let _e402 = u_xlat2_;
    let _e404 = (_e400.xyz * _e402.xyz);
    u_xlat1_.x = _e404.x;
    u_xlat1_.y = _e404.y;
    u_xlat1_.z = _e404.z;
    let _e411 = u_xlat0_;
    let _e413 = u_xlat1_;
    let _e418 = _f_buffer1_.f_cb1_[2];
    let _e420 = (_e413.xyz * _e418.xxx);
    u_xlat0_.x = _e420.x;
    u_xlat0_.y = _e420.y;
    u_xlat0_.z = _e420.z;
    let _e427 = u_xlat0_;
    let _e428 = vs_COLOR0_1;
    SV_Target0_ = (_e427 * _e428);
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
