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
    var u_xlat7_: vec3<f32> = vec3(0f);
    var u_xlat9_: vec2<f32> = vec2(0f);
    var u_xlat12_: f32 = 0f;

    let _e48 = u_xlat0_;
    let _e53 = _f_buffer1_.f_cb1_[8];
    let _e58 = _f_buffer1_.f_cb1_[9];
    let _e61 = (_e53.yzw + -(_e58.xyz));
    u_xlat0_.x = _e61.x;
    u_xlat0_.y = _e61.y;
    u_xlat0_.z = _e61.z;
    let _e71 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (-(_e71.w) + 1f);
    let _e76 = vs_TEXCOORD0_1;
    u_xlat1_ = _e76.zwxy;
    let _e78 = u_xlat1_;
    u_xlat1_ = clamp(_e78, vec4(0f), vec4(1f));
    let _e84 = u_xlat1_;
    let _e85 = vs_TEXCOORD0_1;
    u_xlat1_ = (_e84 + -(_e85.zwxy));
    let _e89 = u_xlat9_;
    let _e94 = _f_buffer1_.f_cb1_[3];
    let _e96 = u_xlat1_;
    let _e99 = vs_TEXCOORD0_1;
    let _e101 = ((_e94.zz * _e96.zw) + _e99.xy);
    u_xlat9_.x = _e101.x;
    u_xlat9_.y = _e101.y;
    let _e106 = u_xlat1_;
    let _e111 = _f_buffer1_.f_cb1_[6];
    let _e113 = u_xlat1_;
    let _e116 = vs_TEXCOORD0_1;
    let _e118 = ((_e111.xx * _e113.xy) + _e116.zw);
    u_xlat1_.x = _e118.x;
    u_xlat1_.y = _e118.y;
    let _e123 = u_xlat1_;
    let _e128 = _f_buffer0_.f_cb0_[4];
    let _e133 = hscard_bias.values[1];
    let _e136 = textureSampleBias(f_t1_, samplerf_s1_, _e123.xy, (_e128.x + _e133.x));
    u_xlat2_ = _e136;
    let _e137 = u_xlat9_;
    let _e142 = _f_buffer0_.f_cb0_[4];
    let _e147 = hscard_bias.values[0];
    let _e150 = textureSampleBias(f_t0_, samplerf_s0_, _e137.xy, (_e142.x + _e147.x));
    u_xlat1_ = _e150.yzwx;
    let _e152 = u_xlat2_;
    let _e154 = u_xlat1_;
    let _e159 = _f_buffer1_.f_cb1_[2];
    let _e161 = (_e154.wxy + _e159.yyy);
    u_xlat2_.x = _e161.x;
    u_xlat2_.y = _e161.y;
    u_xlat2_.z = _e161.z;
    let _e168 = u_xlat1_;
    let _e173 = _f_buffer1_.f_cb1_[3];
    u_xlat3_ = max(_e168.w, _e173.y);
    let _e177 = u_xlat2_;
    let _e179 = u_xlat3_;
    let _e184 = _f_buffer1_.f_cb1_[10];
    u_xlat7_.x = ((_e177.y * _e179) + -(_e184.w));
    let _e188 = u_xlat2_;
    let _e190 = u_xlat2_;
    let _e192 = u_xlat3_;
    let _e194 = (_e190.xyz * vec3(_e192));
    u_xlat2_.x = _e194.x;
    u_xlat2_.y = _e194.y;
    u_xlat2_.z = _e194.z;
    let _e201 = u_xlat7_;
    let _e203 = u_xlat12_;
    u_xlat12_ = (_e201.x / _e203);
    let _e205 = u_xlat7_;
    u_xlat3_ = (_e205.x * 5f);
    let _e209 = u_xlat3_;
    u_xlat3_ = clamp(_e209, 0f, 1f);
    let _e213 = u_xlat0_;
    let _e215 = u_xlat12_;
    let _e217 = u_xlat0_;
    let _e223 = _f_buffer1_.f_cb1_[9];
    let _e225 = ((vec3(_e215) * _e217.xyz) + _e223.xyz);
    u_xlat0_.x = _e225.x;
    u_xlat0_.y = _e225.y;
    u_xlat0_.z = _e225.z;
    let _e237 = _f_buffer1_.f_cb1_[10];
    u_xlat12_ = (1f / _e237.w);
    let _e240 = u_xlat12_;
    let _e241 = u_xlat2_;
    u_xlat12_ = (_e240 * _e241.y);
    let _e244 = u_xlat7_;
    let _e249 = _f_buffer1_.f_cb1_[9];
    let _e254 = _f_buffer1_.f_cb1_[10];
    let _e257 = (_e249.xyz + -(_e254.xyz));
    u_xlat7_.x = _e257.x;
    u_xlat7_.y = _e257.y;
    u_xlat7_.z = _e257.z;
    let _e264 = u_xlat7_;
    let _e266 = u_xlat12_;
    let _e268 = u_xlat7_;
    let _e274 = _f_buffer1_.f_cb1_[10];
    let _e276 = ((vec3(_e266) * _e268.xyz) + _e274.xyz);
    u_xlat7_.x = _e276.x;
    u_xlat7_.y = _e276.y;
    u_xlat7_.z = _e276.z;
    let _e283 = u_xlat0_;
    let _e285 = u_xlat0_;
    let _e287 = u_xlat7_;
    let _e290 = (_e285.xyz + -(_e287.xyz));
    u_xlat0_.x = _e290.x;
    u_xlat0_.y = _e290.y;
    u_xlat0_.z = _e290.z;
    let _e297 = u_xlat0_;
    let _e299 = u_xlat3_;
    let _e301 = u_xlat0_;
    let _e304 = u_xlat7_;
    let _e306 = ((vec3(_e299) * _e301.xyz) + _e304.xyz);
    u_xlat0_.x = _e306.x;
    u_xlat0_.y = _e306.y;
    u_xlat0_.z = _e306.z;
    let _e313 = u_xlat0_;
    let _e315 = u_xlat0_;
    let _e317 = u_xlat2_;
    let _e319 = (_e315.xyz * _e317.xyz);
    u_xlat0_.x = _e319.x;
    u_xlat0_.y = _e319.y;
    u_xlat0_.z = _e319.z;
    let _e326 = u_xlat1_;
    let _e328 = u_xlat0_;
    let _e333 = _f_buffer1_.f_cb1_[2];
    let _e335 = (_e328.xyz * _e333.xxx);
    u_xlat1_.x = _e335.x;
    u_xlat1_.y = _e335.y;
    u_xlat1_.z = _e335.z;
    let _e343 = vs_TEXCOORD1_1;
    let _e347 = _f_buffer1_.f_cb1_[12];
    u_xlat0_.x = (_e343 + _e347.y);
    let _e351 = u_xlat0_;
    u_xlat0_.x = ((_e351.x * 2f) + -1f);
    let _e359 = u_xlat0_;
    let _e362 = u_xlat2_;
    u_xlat0_.x = (-(_e359.x) + _e362.w);
    let _e366 = u_xlat0_;
    u_xlat0_.x = clamp(_e366.x, 0f, 1f);
    let _e372 = u_xlat0_;
    u_xlat0_.x = log2(_e372.x);
    let _e379 = _f_buffer1_.f_cb1_[12];
    u_xlat4_.x = (_e379.z * 10f);
    let _e384 = u_xlat0_;
    let _e386 = u_xlat4_;
    u_xlat0_.x = (_e384.x * _e386.x);
    let _e390 = u_xlat0_;
    u_xlat0_.x = exp2(_e390.x);
    let _e393 = u_xlat0_;
    let _e395 = u_xlat1_;
    u_xlat2_ = (_e393.xxxx * _e395);
    let _e398 = u_xlat0_;
    u_xlat0_.x = (-(_e398.x) + 1f);
    let _e404 = u_xlat0_;
    u_xlat0_.x = log2(_e404.x);
    let _e408 = u_xlat0_;
    u_xlat0_.x = (_e408.x * 10f);
    let _e413 = u_xlat0_;
    u_xlat0_.x = exp2(_e413.x);
    let _e417 = u_xlat2_;
    u_xlat4_.x = (_e417.w * 1000000f);
    let _e422 = u_xlat4_;
    u_xlat4_.x = clamp(_e422.x, 0f, 1f);
    let _e428 = u_xlat1_;
    let _e430 = u_xlat4_;
    u_xlat4_.x = (_e428.w * _e430.x);
    let _e434 = u_xlat4_;
    let _e436 = u_xlat0_;
    u_xlat0_.x = (_e434.x * _e436.x);
    let _e439 = u_xlat4_;
    let _e444 = _f_buffer1_.f_cb1_[7];
    let _e449 = _f_buffer1_.f_cb1_[8];
    let _e451 = (_e444.xyz * _e449.xxx);
    u_xlat4_.x = _e451.x;
    u_xlat4_.y = _e451.y;
    u_xlat4_.z = _e451.z;
    let _e458 = u_xlat0_;
    let _e460 = u_xlat0_;
    let _e462 = u_xlat4_;
    let _e464 = (_e460.xxx * _e462.xyz);
    u_xlat0_.x = _e464.x;
    u_xlat0_.y = _e464.y;
    u_xlat0_.z = _e464.z;
    let _e471 = u_xlat2_;
    let _e473 = u_xlat0_;
    let _e475 = vs_COLOR1_1;
    let _e478 = u_xlat2_;
    let _e480 = ((_e473.xyz * _e475.www) + _e478.xyz);
    u_xlat2_.x = _e480.x;
    u_xlat2_.y = _e480.y;
    u_xlat2_.z = _e480.z;
    let _e487 = u_xlat2_;
    let _e488 = vs_COLOR0_1;
    SV_Target0_ = (_e487 * _e488);
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
