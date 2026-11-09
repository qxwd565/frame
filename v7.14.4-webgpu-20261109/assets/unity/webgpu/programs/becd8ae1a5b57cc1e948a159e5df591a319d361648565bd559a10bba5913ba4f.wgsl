struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 16>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 14>,
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
@group(3) @binding(5) 
var samplerf_s2_: sampler;
@group(3) @binding(7) 
var samplerf_s3_: sampler;
@group(3) @binding(9) 
var samplerf_s4_: sampler;
@group(3) @binding(0) 
var f_t0_: texture_2d<f32>;
@group(3) @binding(2) 
var f_t1_: texture_2d<f32>;
@group(3) @binding(4) 
var f_t2_: texture_2d<f32>;
@group(3) @binding(6) 
var f_t3_: texture_2d<f32>;
@group(3) @binding(8) 
var f_t4_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD5_1: vec2<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec3<f32> = vec3(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlatb4_: bool = false;
    var u_xlat6_: vec2<f32> = vec2(0f);
    var u_xlatb6_: bool = false;
    var u_xlat7_: f32 = 0f;
    var u_xlat9_: f32 = 0f;
    var u_xlatb10_: bool = false;
    var local: f32;
    var local_1: f32;
    var local_2: f32;

    let _e61 = vs_TEXCOORD0_1;
    let _e66 = _f_buffer0_.f_cb0_[4];
    let _e71 = hscard_bias.values[1];
    let _e74 = textureSampleBias(f_t1_, samplerf_s1_, _e61.xy, (_e66.x + _e71.x));
    u_xlat0_ = _e74;
    let _e76 = u_xlat0_;
    let _e79 = u_xlat0_;
    u_xlat0_.x = (-(_e76.z) + _e79.x);
    let _e83 = u_xlat0_;
    u_xlat0_.x = (_e83.x * 0.01f);
    let _e88 = u_xlat0_;
    let _e93 = _f_buffer1_.f_cb1_[13];
    let _e96 = vs_TEXCOORD0_1;
    u_xlat0_.x = ((_e88.x * _e93.z) + _e96.x);
    let _e100 = vs_TEXCOORD0_1;
    u_xlat0_.y = _e100.y;
    let _e102 = u_xlat6_;
    let _e104 = u_xlat0_;
    let _e111 = (_e104.xy + vec2<f32>(-0.5f, -0.5f));
    u_xlat6_.x = _e111.x;
    u_xlat6_.y = _e111.y;
    let _e117 = u_xlat6_;
    let _e120 = u_xlat6_;
    u_xlat1_.x = max(abs(_e117.y), abs(_e120.x));
    let _e127 = u_xlat1_;
    u_xlat1_.x = (1f / _e127.x);
    let _e131 = u_xlat6_;
    let _e134 = u_xlat6_;
    u_xlat4_.x = min(abs(_e131.y), abs(_e134.x));
    let _e139 = u_xlat1_;
    let _e141 = u_xlat4_;
    u_xlat1_.x = (_e139.x * _e141.x);
    let _e145 = u_xlat1_;
    let _e147 = u_xlat1_;
    u_xlat4_.x = (_e145.x * _e147.x);
    let _e150 = u_xlat4_;
    u_xlat7_ = ((_e150.x * 0.0208351f) + -0.085133f);
    let _e157 = u_xlat4_;
    let _e159 = u_xlat7_;
    u_xlat7_ = ((_e157.x * _e159) + 0.180141f);
    let _e163 = u_xlat4_;
    let _e165 = u_xlat7_;
    u_xlat7_ = ((_e163.x * _e165) + -0.3302995f);
    let _e171 = u_xlat4_;
    let _e173 = u_xlat7_;
    u_xlat4_.x = ((_e171.x * _e173) + 0.999866f);
    let _e177 = u_xlat4_;
    let _e179 = u_xlat1_;
    u_xlat7_ = (_e177.x * _e179.x);
    let _e182 = u_xlat7_;
    u_xlat7_ = ((_e182 * -2f) + 1.5707964f);
    let _e188 = u_xlat6_;
    let _e191 = u_xlat6_;
    u_xlatb10_ = (abs(_e188.y) < abs(_e191.x));
    let _e195 = u_xlatb10_;
    if _e195 {
        let _e196 = u_xlat7_;
        local = _e196;
    } else {
        local = 0f;
    }
    let _e200 = local;
    u_xlat7_ = _e200;
    let _e202 = u_xlat1_;
    let _e204 = u_xlat4_;
    let _e207 = u_xlat7_;
    u_xlat1_.x = ((_e202.x * _e204.x) + _e207);
    let _e209 = u_xlat6_;
    let _e211 = u_xlat6_;
    u_xlatb4_ = (_e209.y < -(_e211.y));
    let _e216 = u_xlatb4_;
    if _e216 {
        local_1 = -3.1415927f;
    } else {
        local_1 = 0f;
    }
    let _e222 = local_1;
    u_xlat4_.x = _e222;
    let _e224 = u_xlat4_;
    let _e226 = u_xlat1_;
    u_xlat1_.x = (_e224.x + _e226.x);
    let _e230 = u_xlat6_;
    let _e232 = u_xlat6_;
    u_xlat4_.x = min(_e230.y, _e232.x);
    let _e235 = u_xlat4_;
    let _e237 = u_xlat4_;
    u_xlatb4_ = (_e235.x < -(_e237.x));
    let _e241 = u_xlat6_;
    let _e243 = u_xlat6_;
    u_xlat7_ = max(_e241.y, _e243.x);
    let _e247 = u_xlat6_;
    let _e249 = u_xlat6_;
    u_xlat6_.x = dot(_e247.xy, _e249.xy);
    let _e253 = u_xlat6_;
    u_xlat6_.x = sqrt(_e253.x);
    let _e257 = u_xlat6_;
    let _e262 = _f_buffer1_.f_cb1_[12];
    u_xlat2_.x = (_e257.x * _e262.x);
    let _e265 = u_xlat7_;
    let _e266 = u_xlat7_;
    u_xlatb6_ = (_e265 >= -(_e266));
    let _e269 = u_xlatb6_;
    let _e270 = u_xlatb4_;
    u_xlatb6_ = (_e269 && _e270);
    let _e273 = u_xlatb6_;
    if _e273 {
        let _e274 = u_xlat1_;
        local_2 = -(_e274.x);
    } else {
        let _e277 = u_xlat1_;
        local_2 = _e277.x;
    }
    let _e280 = local_2;
    u_xlat6_.x = _e280;
    let _e282 = u_xlat6_;
    let _e287 = _f_buffer1_.f_cb1_[12];
    u_xlat2_.y = (_e282.x * _e287.y);
    let _e290 = u_xlat6_;
    let _e295 = _f_buffer0_.f_cb0_[15];
    let _e300 = _f_buffer1_.f_cb1_[12];
    let _e302 = (_e295.yy * _e300.zw);
    u_xlat6_.x = _e302.x;
    u_xlat6_.y = _e302.y;
    let _e307 = u_xlat6_;
    let _e309 = u_xlat2_;
    let _e315 = u_xlat6_;
    let _e317 = ((_e309.xy * vec2<f32>(2f, 0.15923566f)) + _e315.xy);
    u_xlat6_.x = _e317.x;
    u_xlat6_.y = _e317.y;
    let _e322 = u_xlat6_;
    let _e327 = _f_buffer0_.f_cb0_[4];
    let _e332 = hscard_bias.values[3];
    let _e335 = textureSampleBias(f_t4_, samplerf_s3_, _e322.xy, (_e327.x + _e332.x));
    u_xlat1_ = _e335;
    let _e336 = u_xlat6_;
    let _e338 = u_xlat0_;
    let _e341 = u_xlat1_;
    let _e343 = (-(_e338.xy) + _e341.xy);
    u_xlat6_.x = _e343.x;
    u_xlat6_.y = _e343.y;
    let _e348 = u_xlat0_;
    let _e353 = _f_buffer0_.f_cb0_[4];
    let _e358 = hscard_bias.values[2];
    let _e361 = textureSampleBias(f_t2_, samplerf_s2_, _e348.xy, (_e353.x + _e358.x));
    u_xlat1_ = _e361;
    let _e362 = u_xlat1_;
    let _e367 = _f_buffer1_.f_cb1_[11];
    u_xlat7_ = (_e362.z * _e367.z);
    let _e370 = u_xlat0_;
    let _e372 = u_xlat7_;
    let _e374 = u_xlat6_;
    let _e377 = u_xlat0_;
    let _e379 = ((vec2(_e372) * _e374.xy) + _e377.xy);
    u_xlat0_.x = _e379.x;
    u_xlat0_.y = _e379.y;
    let _e384 = u_xlat0_;
    let _e389 = _f_buffer0_.f_cb0_[4];
    let _e394 = hscard_bias.values[0];
    let _e397 = textureSampleBias(f_t0_, samplerf_s0_, _e384.xy, (_e389.x + _e394.x));
    u_xlat0_ = _e397;
    let _e398 = u_xlat3_;
    let _e403 = _f_buffer1_.f_cb1_[5];
    let _e409 = _f_buffer1_.f_cb1_[6];
    let _e411 = (-(_e403.xyz) + _e409.xyz);
    u_xlat3_.x = _e411.x;
    u_xlat3_.y = _e411.y;
    u_xlat3_.z = _e411.z;
    let _e418 = u_xlat3_;
    let _e420 = u_xlat0_;
    let _e422 = u_xlat3_;
    let _e428 = _f_buffer1_.f_cb1_[5];
    let _e430 = ((_e420.xxx * _e422.xyz) + _e428.xyz);
    u_xlat3_.x = _e430.x;
    u_xlat3_.y = _e430.y;
    u_xlat3_.z = _e430.z;
    let _e437 = u_xlat2_;
    let _e442 = _f_buffer1_.f_cb1_[7];
    let _e448 = _f_buffer1_.f_cb1_[8];
    let _e450 = (-(_e442.xyz) + _e448.xyz);
    u_xlat2_.x = _e450.x;
    u_xlat2_.y = _e450.y;
    u_xlat2_.z = _e450.z;
    let _e457 = u_xlat2_;
    let _e459 = u_xlat0_;
    let _e461 = u_xlat2_;
    let _e467 = _f_buffer1_.f_cb1_[7];
    let _e469 = ((_e459.xxx * _e461.xyz) + _e467.xyz);
    u_xlat2_.x = _e469.x;
    u_xlat2_.y = _e469.y;
    u_xlat2_.z = _e469.z;
    let _e476 = u_xlat0_;
    let _e478 = u_xlat3_;
    let _e480 = u_xlat2_;
    let _e483 = (_e478.xyz + -(_e480.xyz));
    u_xlat0_.x = _e483.x;
    u_xlat0_.y = _e483.y;
    u_xlat0_.z = _e483.z;
    let _e490 = u_xlat0_;
    let _e492 = u_xlat1_;
    let _e494 = u_xlat0_;
    let _e497 = u_xlat2_;
    let _e499 = ((_e492.yyy * _e494.xyz) + _e497.xyz);
    u_xlat0_.x = _e499.x;
    u_xlat0_.y = _e499.y;
    u_xlat0_.z = _e499.z;
    let _e506 = u_xlat4_;
    let _e508 = u_xlat0_;
    let _e514 = _f_buffer1_.f_cb1_[9];
    let _e516 = (-(_e508.xyz) + _e514.xyz);
    u_xlat4_.x = _e516.x;
    u_xlat4_.y = _e516.y;
    u_xlat4_.z = _e516.z;
    let _e523 = u_xlat0_;
    let _e525 = u_xlat1_;
    let _e527 = u_xlat4_;
    let _e530 = u_xlat0_;
    let _e532 = ((_e525.xxx * _e527.xyz) + _e530.xyz);
    u_xlat0_.x = _e532.x;
    u_xlat0_.y = _e532.y;
    u_xlat0_.z = _e532.z;
    let _e539 = u_xlat1_;
    u_xlat9_ = (-(_e539.x) + 1f);
    let _e544 = vs_TEXCOORD5_1;
    let _e549 = _f_buffer0_.f_cb0_[4];
    let _e554 = hscard_bias.values[4];
    let _e557 = textureSampleBias(f_t3_, samplerf_s4_, _e544.xy, (_e549.x + _e554.x));
    u_xlat1_ = _e557;
    let _e558 = u_xlat2_;
    let _e560 = u_xlat1_;
    let _e565 = _f_buffer1_.f_cb1_[10];
    let _e567 = (_e560.zzz * _e565.xyz);
    u_xlat2_.x = _e567.x;
    u_xlat2_.y = _e567.y;
    u_xlat2_.z = _e567.z;
    let _e574 = u_xlat1_;
    let _e576 = u_xlat1_;
    let _e581 = _f_buffer1_.f_cb1_[11];
    let _e583 = (_e576.xy * _e581.xy);
    u_xlat1_.x = _e583.x;
    u_xlat1_.y = _e583.y;
    let _e588 = u_xlat0_;
    let _e590 = u_xlat0_;
    let _e592 = u_xlat1_;
    let _e595 = u_xlat2_;
    let _e597 = ((_e590.xyz * _e592.xxx) + _e595.xyz);
    u_xlat0_.x = _e597.x;
    u_xlat0_.y = _e597.y;
    u_xlat0_.z = _e597.z;
    let _e604 = SV_Target0_;
    let _e606 = u_xlat1_;
    let _e608 = u_xlat9_;
    let _e611 = u_xlat0_;
    let _e613 = ((_e606.yyy * vec3(_e608)) + _e611.xyz);
    SV_Target0_.x = _e613.x;
    SV_Target0_.y = _e613.y;
    SV_Target0_.z = _e613.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(5) vs_TEXCOORD5_: vec2<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    main_1();
    let _e40 = SV_Target0_;
    return FragmentOutput(_e40);
}
