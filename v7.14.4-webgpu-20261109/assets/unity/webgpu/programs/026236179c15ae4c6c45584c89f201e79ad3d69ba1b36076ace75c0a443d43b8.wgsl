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
    var u_xlat0_: vec3<f32> = vec3(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: f32 = 0f;
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e52 = u_xlat0_;
    let _e57 = _f_buffer1_.f_cb1_[8];
    let _e62 = _f_buffer1_.f_cb1_[9];
    let _e65 = (_e57.yzw + -(_e62.xyz));
    u_xlat0_.x = _e65.x;
    u_xlat0_.y = _e65.y;
    u_xlat0_.z = _e65.z;
    let _e75 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e75.w) + 1f);
    let _e80 = vs_TEXCOORD0_1;
    u_xlat1_ = _e80.zwxy;
    let _e82 = u_xlat1_;
    u_xlat1_ = clamp(_e82, vec4(0f), vec4(1f));
    let _e88 = u_xlat1_;
    let _e89 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e88 + -(_e89.zwxy));
    let _e93 = u_xlat9_;
    let _e98 = _f_buffer1_.f_cb1_[3];
    let _e100 = u_xlat1_;
    let _e103 = vs_TEXCOORD0_1;
    let _e105 = ((_e98.zz * _e100.zw) + _e103.xy);
    u_xlat9_.x = _e105.x;
    u_xlat9_.y = _e105.y;
    let _e110 = u_xlat1_;
    let _e115 = _f_buffer1_.f_cb1_[6];
    let _e117 = u_xlat1_;
    let _e120 = vs_TEXCOORD0_1;
    let _e122 = ((_e115.xx * _e117.xy) + _e120.zw);
    u_xlat1_.x = _e122.x;
    u_xlat1_.y = _e122.y;
    let _e127 = u_xlat1_;
    let _e132 = _f_buffer0_.f_cb0_[4];
    let _e137 = hscard_bias.values[1];
    let _e140 = textureSampleBias(f_t1_, samplerf_s1_, _e127.xy, (_e132.x + _e137.x));
    u_xlat2_ = _e140;
    let _e141 = u_xlat9_;
    let _e146 = _f_buffer0_.f_cb0_[4];
    let _e151 = hscard_bias.values[0];
    let _e154 = textureSampleBias(f_t0_, samplerf_s0_, _e141.xy, (_e146.x + _e151.x));
    u_xlat1_ = _e154.yzwx;
    let _e156 = u_xlat6_;
    let _e158 = u_xlat1_;
    let _e163 = _f_buffer1_.f_cb1_[2];
    let _e165 = (_e158.wxy + _e163.yyy);
    u_xlat6_.x = _e165.x;
    u_xlat6_.y = _e165.y;
    u_xlat6_.z = _e165.z;
    let _e172 = u_xlat1_;
    let _e177 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e172.w, _e177.y);
    let _e181 = u_xlat6_;
    let _e183 = u_xlat3_;
    let _e188 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e181.y * _e183) + -(_e188.w));
    let _e192 = u_xlat6_;
    let _e194 = u_xlat6_;
    let _e196 = u_xlat3_;
    let _e198 = (_e194.xyz * vec3(_e196));
    u_xlat6_.x = _e198.x;
    u_xlat6_.y = _e198.y;
    u_xlat6_.z = _e198.z;
    let _e205 = u_xlat7_;
    let _e207 = u_xlat12_;
    u_xlat12_ = (_e205.x / _e207);
    let _e209 = u_xlat7_;
    u_xlat3_ = (_e209.x * 5f);
    let _e213 = u_xlat3_;
    u_xlat3_ = clamp(_e213, 0f, 1f);
    let _e217 = u_xlat0_;
    let _e219 = u_xlat12_;
    let _e221 = u_xlat0_;
    let _e227 = _f_buffer1_.f_cb1_[9];
    let _e229 = ((vec3(_e219) * _e221.xyz) + _e227.xyz);
    u_xlat0_.x = _e229.x;
    u_xlat0_.y = _e229.y;
    u_xlat0_.z = _e229.z;
    let _e241 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e241.w);
    let _e244 = u_xlat12_;
    let _e245 = u_xlat6_;
    u_xlat12_ = (_e244 * _e245.y);
    let _e248 = u_xlat7_;
    let _e253 = _f_buffer1_.f_cb1_[9];
    let _e258 = _f_buffer1_.f_cb1_[10];
    let _e261 = (_e253.xyz + -(_e258.xyz));
    u_xlat7_.x = _e261.x;
    u_xlat7_.y = _e261.y;
    u_xlat7_.z = _e261.z;
    let _e268 = u_xlat7_;
    let _e270 = u_xlat12_;
    let _e272 = u_xlat7_;
    let _e278 = _f_buffer1_.f_cb1_[10];
    let _e280 = ((vec3(_e270) * _e272.xyz) + _e278.xyz);
    u_xlat7_.x = _e280.x;
    u_xlat7_.y = _e280.y;
    u_xlat7_.z = _e280.z;
    let _e287 = u_xlat0_;
    let _e289 = u_xlat0_;
    let _e291 = u_xlat7_;
    let _e294 = (_e289.xyz + -(_e291.xyz));
    u_xlat0_.x = _e294.x;
    u_xlat0_.y = _e294.y;
    u_xlat0_.z = _e294.z;
    let _e301 = u_xlat0_;
    let _e303 = u_xlat3_;
    let _e305 = u_xlat0_;
    let _e308 = u_xlat7_;
    let _e310 = ((vec3(_e303) * _e305.xyz) + _e308.xyz);
    u_xlat0_.x = _e310.x;
    u_xlat0_.y = _e310.y;
    u_xlat0_.z = _e310.z;
    let _e317 = u_xlat0_;
    let _e319 = u_xlat0_;
    let _e321 = u_xlat6_;
    let _e323 = (_e319.xyz * _e321.xyz);
    u_xlat0_.x = _e323.x;
    u_xlat0_.y = _e323.y;
    u_xlat0_.z = _e323.z;
    let _e330 = u_xlat1_;
    let _e332 = u_xlat0_;
    let _e337 = _f_buffer1_.f_cb1_[2];
    let _e339 = (_e332.xyz * _e337.xxx);
    u_xlat1_.x = _e339.x;
    u_xlat1_.y = _e339.y;
    u_xlat1_.z = _e339.z;
    let _e347 = vs_TEXCOORD1_1;
    let _e351 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e347 + _e351.y);
    let _e355 = u_xlat0_;
    u_xlat0_.x = ((_e355.x * 2f) + -1f);
    let _e363 = u_xlat0_;
    let _e366 = u_xlat2_;
    u_xlat0_.x = (-(_e363.x) + _e366.x);
    let _e370 = u_xlat0_;
    u_xlat0_.x = clamp(_e370.x, 0f, 1f);
    let _e376 = u_xlat0_;
    u_xlat0_.x = log2(_e376.x);
    let _e383 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e383.z * 10f);
    let _e388 = u_xlat0_;
    let _e390 = u_xlat4_;
    u_xlat0_.x = (_e388.x * _e390.x);
    let _e394 = u_xlat0_;
    u_xlat0_.x = exp2(_e394.x);
    let _e397 = u_xlat0_;
    let _e399 = u_xlat1_;
    u_xlat2_ = (_e397.xxxx * _e399);
    let _e402 = u_xlat0_;
    u_xlat0_.x = (-(_e402.x) + 1f);
    let _e408 = u_xlat0_;
    u_xlat0_.x = log2(_e408.x);
    let _e412 = u_xlat0_;
    u_xlat0_.x = (_e412.x * 10f);
    let _e417 = u_xlat0_;
    u_xlat0_.x = exp2(_e417.x);
    let _e421 = u_xlat2_;
    u_xlat4_.x = (_e421.w * 1000000f);
    let _e426 = u_xlat4_;
    u_xlat4_.x = clamp(_e426.x, 0f, 1f);
    let _e432 = u_xlat1_;
    let _e434 = u_xlat4_;
    u_xlat4_.x = (_e432.w * _e434.x);
    let _e438 = u_xlat4_;
    let _e440 = u_xlat0_;
    u_xlat0_.x = (_e438.x * _e440.x);
    let _e443 = u_xlat4_;
    let _e448 = _f_buffer1_.f_cb1_[7];
    let _e453 = _f_buffer1_.f_cb1_[8];
    let _e455 = (_e448.xyz * _e453.xxx);
    u_xlat4_.x = _e455.x;
    u_xlat4_.y = _e455.y;
    u_xlat4_.z = _e455.z;
    let _e462 = u_xlat0_;
    let _e464 = u_xlat0_;
    let _e466 = u_xlat4_;
    let _e468 = (_e464.xxx * _e466.xyz);
    u_xlat0_.x = _e468.x;
    u_xlat0_.y = _e468.y;
    u_xlat0_.z = _e468.z;
    let _e475 = u_xlat2_;
    let _e477 = u_xlat0_;
    let _e479 = vs_COLOR1_1;
    let _e482 = u_xlat2_;
    let _e484 = ((_e477.xyz * _e479.www) + _e482.xyz);
    u_xlat2_.x = _e484.x;
    u_xlat2_.y = _e484.y;
    u_xlat2_.z = _e484.z;
    let _e491 = u_xlat2_;
    let _e492 = vs_COLOR0_1;
    SV_Target0_ = (_e491 * _e492);
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
