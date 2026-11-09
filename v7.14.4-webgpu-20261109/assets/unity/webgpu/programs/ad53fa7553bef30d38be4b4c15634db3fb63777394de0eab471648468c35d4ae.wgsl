struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 35>,
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
@group(3) @binding(11) 
var samplerf_s5_: sampler;
@group(3) @binding(13) 
var samplerf_s6_: sampler;
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
@group(3) @binding(10) 
var f_t5_: texture_2d<f32>;
@group(3) @binding(12) 
var f_t6_: texture_2d<f32>;
var<private> vs_TEXCOORD0_1: vec2<f32>;
var<private> vs_TEXCOORD1_1: vec2<f32>;
var<private> vs_TEXCOORD2_1: vec4<f32>;
var<private> vs_TEXCOORD3_1: vec4<f32>;
var<private> vs_TEXCOORD4_1: vec4<f32>;
var<private> vs_TEXCOORD5_1: vec4<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec3<f32> = vec3(0f);
    var u_xlat4_: vec3<f32> = vec3(0f);
    var u_xlat6_: vec3<f32> = vec3(0f);
    var u_xlat12_: f32 = 0f;
    var u_xlatb12_: bool = false;
    var u_xlat13_: f32 = 0f;
    var local: vec3<f32>;
    var local_1: vec2<f32>;

    let _e64 = vs_TEXCOORD2_1;
    let _e69 = _f_buffer0_.f_cb0_[4];
    let _e74 = hscard_bias.values[4];
    let _e77 = textureSampleBias(f_t4_, samplerf_s4_, _e64.xy, (_e69.x + _e74.x));
    u_xlat0_ = _e77;
    let _e82 = _f_buffer1_.f_cb1_[8];
    u_xlatb12_ = (1f < _e82.x);
    let _e85 = u_xlat0_;
    let _e87 = u_xlatb12_;
    if bool(_e87) {
        let _e89 = u_xlat0_;
        local = _e89.xyz;
    } else {
        local = vec3<f32>(1f, 1f, 1f);
    }
    let _e96 = local;
    u_xlat0_.x = _e96.x;
    u_xlat0_.y = _e96.y;
    u_xlat0_.z = _e96.z;
    let _e104 = u_xlat0_;
    let _e109 = _f_buffer1_.f_cb1_[4];
    u_xlat1_.x = (_e104.x * _e109.w);
    let _e113 = u_xlat0_;
    let _e118 = _f_buffer1_.f_cb1_[5];
    u_xlat1_.y = (_e113.y * _e118.x);
    let _e121 = u_xlat0_;
    let _e123 = u_xlat1_;
    let _e125 = vs_TEXCOORD5_1;
    let _e127 = (_e123.xy + _e125.xy);
    u_xlat0_.x = _e127.x;
    u_xlat0_.y = _e127.y;
    let _e132 = u_xlat0_;
    let _e134 = u_xlatb12_;
    if bool(_e134) {
        let _e136 = u_xlat0_;
        local_1 = _e136.xy;
    } else {
        let _e138 = vs_TEXCOORD2_1;
        local_1 = _e138.xy;
    }
    let _e141 = local_1;
    u_xlat0_.x = _e141.x;
    u_xlat0_.y = _e141.y;
    let _e146 = u_xlat0_;
    let _e151 = _f_buffer0_.f_cb0_[4];
    let _e156 = hscard_bias.values[3];
    let _e159 = textureSampleBias(f_t3_, samplerf_s3_, _e146.xy, (_e151.x + _e156.x));
    u_xlat1_ = _e159;
    let _e160 = u_xlat0_;
    let _e162 = u_xlat1_;
    let _e168 = _f_buffer1_.f_cb1_[4];
    let _e170 = (-(_e162.xyz) + _e168.yyy);
    u_xlat0_.x = _e170.x;
    u_xlat0_.y = _e170.y;
    u_xlat0_.w = _e170.z;
    let _e177 = u_xlat4_;
    let _e179 = u_xlat0_;
    let _e181 = u_xlat0_;
    let _e184 = (_e179.zzz * abs(_e181.xyw));
    u_xlat4_.x = _e184.x;
    u_xlat4_.y = _e184.y;
    u_xlat4_.z = _e184.z;
    let _e192 = u_xlat0_;
    u_xlat0_.x = (abs(_e192.x) + -0.5f);
    let _e198 = u_xlat4_;
    let _e200 = u_xlat4_;
    let _e205 = _f_buffer1_.f_cb1_[3];
    let _e207 = (_e200.xyz * _e205.xyz);
    u_xlat4_.x = _e207.x;
    u_xlat4_.y = _e207.y;
    u_xlat4_.z = _e207.z;
    let _e214 = u_xlat4_;
    let _e216 = u_xlat4_;
    let _e221 = _f_buffer1_.f_cb1_[3];
    let _e223 = (_e216.xyz * _e221.www);
    u_xlat4_.x = _e223.x;
    u_xlat4_.y = _e223.y;
    u_xlat4_.z = _e223.z;
    let _e230 = u_xlat0_;
    let _e232 = u_xlat4_;
    let _e237 = _f_buffer1_.f_cb1_[4];
    let _e239 = (_e232.xyz * _e237.xxx);
    u_xlat0_.y = _e239.x;
    u_xlat0_.z = _e239.y;
    u_xlat0_.w = _e239.z;
    let _e246 = vs_TEXCOORD0_1;
    let _e251 = _f_buffer0_.f_cb0_[4];
    let _e256 = hscard_bias.values[2];
    let _e259 = textureSampleBias(f_t2_, samplerf_s2_, _e246.xy, (_e251.x + _e256.x));
    u_xlat1_ = _e259;
    let _e260 = u_xlat0_;
    let _e261 = u_xlat1_;
    u_xlat0_ = (_e260 * _e261.xxxx);
    let _e264 = vs_TEXCOORD4_1;
    let _e269 = _f_buffer0_.f_cb0_[4];
    let _e274 = hscard_bias.values[5];
    let _e277 = textureSampleBias(f_t5_, samplerf_s5_, _e264.xy, (_e269.x + _e274.x));
    u_xlat2_ = _e277;
    let _e278 = u_xlat2_;
    let _e280 = u_xlat2_;
    let _e286 = _f_buffer1_.f_cb1_[13];
    let _e288 = (-(_e280.xyz) + _e286.yyy);
    u_xlat2_.x = _e288.x;
    u_xlat2_.y = _e288.y;
    u_xlat2_.z = _e288.z;
    let _e295 = u_xlat6_;
    let _e297 = u_xlat2_;
    let _e303 = _f_buffer1_.f_cb1_[12];
    let _e305 = (abs(_e297.xyz) * _e303.xyz);
    u_xlat6_.x = _e305.x;
    u_xlat6_.y = _e305.y;
    u_xlat6_.z = _e305.z;
    let _e312 = u_xlat2_;
    u_xlat13_ = (abs(_e312.x) + -0.5f);
    let _e318 = u_xlat1_;
    let _e320 = u_xlat13_;
    u_xlat13_ = (_e318.y * _e320);
    let _e322 = u_xlat13_;
    let _e326 = _f_buffer1_.f_cb1_[13];
    u_xlat13_ = (_e322 * _e326.w);
    let _e329 = u_xlat2_;
    let _e331 = u_xlat6_;
    let _e336 = _f_buffer1_.f_cb1_[12];
    let _e338 = (_e331.xyz * _e336.www);
    u_xlat2_.x = _e338.x;
    u_xlat2_.y = _e338.y;
    u_xlat2_.z = _e338.z;
    let _e345 = u_xlat2_;
    let _e347 = u_xlat2_;
    let _e352 = _f_buffer1_.f_cb1_[13];
    let _e354 = (_e347.xyz * _e352.xxx);
    u_xlat2_.x = _e354.x;
    u_xlat2_.y = _e354.y;
    u_xlat2_.z = _e354.z;
    let _e361 = u_xlat2_;
    let _e363 = u_xlat1_;
    let _e365 = u_xlat2_;
    let _e367 = (_e363.yyy * _e365.xyz);
    u_xlat2_.x = _e367.x;
    u_xlat2_.y = _e367.y;
    u_xlat2_.z = _e367.z;
    let _e374 = u_xlat2_;
    let _e376 = u_xlat2_;
    let _e378 = vs_TEXCOORD3_1;
    let _e380 = (_e376.xyz * _e378.yyy);
    u_xlat2_.x = _e380.x;
    u_xlat2_.y = _e380.y;
    u_xlat2_.z = _e380.z;
    let _e387 = u_xlat3_;
    let _e389 = u_xlat0_;
    let _e391 = vs_TEXCOORD3_1;
    let _e394 = u_xlat2_;
    let _e396 = ((_e389.yzw * _e391.xxx) + _e394.xyz);
    u_xlat3_.x = _e396.x;
    u_xlat3_.y = _e396.y;
    u_xlat3_.z = _e396.z;
    let _e403 = u_xlat4_;
    let _e405 = u_xlat0_;
    let _e407 = vs_TEXCOORD3_1;
    let _e409 = (_e405.yzw * _e407.xxx);
    u_xlat4_.x = _e409.x;
    u_xlat4_.y = _e409.y;
    u_xlat4_.z = _e409.z;
    let _e416 = u_xlat3_;
    let _e418 = u_xlat3_;
    let _e424 = (_e418.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat3_.x = _e424.x;
    u_xlat3_.y = _e424.y;
    u_xlat3_.z = _e424.z;
    let _e431 = u_xlat4_;
    let _e433 = u_xlat4_;
    let _e435 = u_xlat2_;
    let _e438 = u_xlat3_;
    let _e441 = ((_e433.xyz * _e435.xyz) + -(_e438.xyz));
    u_xlat4_.x = _e441.x;
    u_xlat4_.y = _e441.y;
    u_xlat4_.z = _e441.z;
    let _e448 = u_xlat4_;
    let _e453 = _f_buffer1_.f_cb1_[13];
    let _e455 = u_xlat4_;
    let _e458 = u_xlat3_;
    let _e460 = ((_e453.zzz * _e455.xyz) + _e458.xyz);
    u_xlat4_.x = _e460.x;
    u_xlat4_.y = _e460.y;
    u_xlat4_.z = _e460.z;
    let _e467 = vs_TEXCOORD4_1;
    let _e472 = _f_buffer0_.f_cb0_[4];
    let _e477 = hscard_bias.values[6];
    let _e480 = textureSampleBias(f_t6_, samplerf_s6_, _e467.zw, (_e472.x + _e477.x));
    u_xlat2_ = _e480;
    let _e481 = u_xlat2_;
    let _e483 = u_xlat2_;
    let _e489 = _f_buffer1_.f_cb1_[20];
    let _e491 = (-(_e483.xyz) + _e489.zzz);
    u_xlat2_.x = _e491.x;
    u_xlat2_.y = _e491.y;
    u_xlat2_.z = _e491.z;
    let _e498 = u_xlat6_;
    let _e500 = u_xlat2_;
    let _e506 = _f_buffer1_.f_cb1_[19];
    let _e508 = (abs(_e500.xyz) * _e506.xyz);
    u_xlat6_.x = _e508.x;
    u_xlat6_.y = _e508.y;
    u_xlat6_.z = _e508.z;
    let _e516 = u_xlat2_;
    u_xlat2_.x = (abs(_e516.x) + -0.5f);
    let _e523 = u_xlat1_;
    let _e525 = u_xlat2_;
    u_xlat2_.x = (_e523.z * _e525.x);
    let _e528 = u_xlat2_;
    let _e533 = _f_buffer1_.f_cb1_[21];
    let _e536 = u_xlat13_;
    u_xlat13_ = ((_e528.x * _e533.x) + _e536);
    let _e538 = u_xlat2_;
    let _e540 = u_xlat6_;
    let _e545 = _f_buffer1_.f_cb1_[19];
    let _e547 = (_e540.xyz * _e545.www);
    u_xlat2_.x = _e547.x;
    u_xlat2_.y = _e547.y;
    u_xlat2_.z = _e547.z;
    let _e554 = u_xlat2_;
    let _e556 = u_xlat2_;
    let _e561 = _f_buffer1_.f_cb1_[20];
    let _e563 = (_e556.xyz * _e561.xxx);
    u_xlat2_.x = _e563.x;
    u_xlat2_.y = _e563.y;
    u_xlat2_.z = _e563.z;
    let _e570 = u_xlat2_;
    let _e572 = u_xlat1_;
    let _e574 = u_xlat2_;
    let _e576 = (_e572.zzz * _e574.xyz);
    u_xlat2_.x = _e576.x;
    u_xlat2_.y = _e576.y;
    u_xlat2_.z = _e576.z;
    let _e583 = u_xlat3_;
    let _e585 = u_xlat2_;
    let _e587 = vs_TEXCOORD3_1;
    let _e590 = u_xlat4_;
    let _e592 = ((_e585.xyz * _e587.zzz) + _e590.xyz);
    u_xlat3_.x = _e592.x;
    u_xlat3_.y = _e592.y;
    u_xlat3_.z = _e592.z;
    let _e599 = u_xlat2_;
    let _e601 = u_xlat2_;
    let _e603 = vs_TEXCOORD3_1;
    let _e605 = (_e601.xyz * _e603.zzz);
    u_xlat2_.x = _e605.x;
    u_xlat2_.y = _e605.y;
    u_xlat2_.z = _e605.z;
    let _e612 = u_xlat3_;
    let _e614 = u_xlat3_;
    let _e620 = (_e614.xyz * vec3<f32>(0.5f, 0.5f, 0.5f));
    u_xlat3_.x = _e620.x;
    u_xlat3_.y = _e620.y;
    u_xlat3_.z = _e620.z;
    let _e627 = u_xlat4_;
    let _e629 = u_xlat4_;
    let _e631 = u_xlat2_;
    let _e634 = u_xlat3_;
    let _e637 = ((_e629.xyz * _e631.xyz) + -(_e634.xyz));
    u_xlat4_.x = _e637.x;
    u_xlat4_.y = _e637.y;
    u_xlat4_.z = _e637.z;
    let _e644 = u_xlat4_;
    let _e649 = _f_buffer1_.f_cb1_[20];
    let _e651 = u_xlat4_;
    let _e654 = u_xlat3_;
    let _e656 = ((_e649.www * _e651.xyz) + _e654.xyz);
    u_xlat4_.x = _e656.x;
    u_xlat4_.y = _e656.y;
    u_xlat4_.z = _e656.z;
    let _e664 = u_xlat0_;
    let _e669 = _f_buffer1_.f_cb1_[4];
    let _e672 = u_xlat13_;
    u_xlat0_.x = ((_e664.x * _e669.z) + _e672);
    let _e674 = u_xlat2_;
    let _e679 = _f_buffer1_.f_cb1_[34];
    let _e681 = u_xlat0_;
    let _e684 = vs_TEXCOORD0_1;
    let _e686 = ((_e679.zw * _e681.xx) + _e684.xy);
    u_xlat2_.x = _e686.x;
    u_xlat2_.y = _e686.y;
    let _e691 = u_xlat2_;
    let _e696 = _f_buffer0_.f_cb0_[4];
    let _e701 = hscard_bias.values[0];
    let _e704 = textureSampleBias(f_t0_, samplerf_s0_, _e691.xy, (_e696.x + _e701.x));
    u_xlat2_ = _e704;
    let _e705 = u_xlat0_;
    let _e707 = u_xlat4_;
    let _e709 = u_xlat2_;
    let _e711 = (_e707.xyz + _e709.xyz);
    u_xlat0_.x = _e711.x;
    u_xlat0_.y = _e711.y;
    u_xlat0_.z = _e711.z;
    let _e718 = u_xlat0_;
    let _e723 = _f_buffer1_.f_cb1_[33];
    let _e728 = _f_buffer1_.f_cb1_[34];
    let _e731 = u_xlat0_;
    let _e733 = ((_e723.www * _e728.xxx) + _e731.xyz);
    u_xlat0_.x = _e733.x;
    u_xlat0_.y = _e733.y;
    u_xlat0_.z = _e733.z;
    let _e740 = u_xlat0_;
    let _e742 = u_xlat2_;
    let _e745 = u_xlat0_;
    let _e747 = (-(_e742.xyz) + _e745.xyz);
    u_xlat0_.x = _e747.x;
    u_xlat0_.y = _e747.y;
    u_xlat0_.z = _e747.z;
    let _e754 = u_xlat1_;
    let _e756 = u_xlat1_;
    u_xlat12_ = (_e754.y + _e756.x);
    let _e759 = u_xlat1_;
    let _e761 = u_xlat12_;
    u_xlat12_ = (_e759.z + _e761);
    let _e763 = u_xlat12_;
    u_xlat12_ = clamp(_e763, 0f, 1f);
    let _e767 = u_xlat0_;
    let _e769 = u_xlat12_;
    let _e771 = u_xlat0_;
    let _e774 = u_xlat2_;
    let _e776 = ((vec3(_e769) * _e771.xyz) + _e774.xyz);
    u_xlat0_.x = _e776.x;
    u_xlat0_.y = _e776.y;
    u_xlat0_.z = _e776.z;
    let _e783 = u_xlat0_;
    let _e785 = u_xlat0_;
    let _e791 = clamp(_e785.xyz, vec3(0f), vec3(1f));
    u_xlat0_.x = _e791.x;
    u_xlat0_.y = _e791.y;
    u_xlat0_.z = _e791.z;
    let _e798 = u_xlat1_;
    let _e800 = u_xlat0_;
    let _e806 = (_e800.xyz + vec3<f32>(0.15f, 0.15f, 0.15f));
    u_xlat1_.x = _e806.x;
    u_xlat1_.y = _e806.y;
    u_xlat1_.z = _e806.z;
    let _e813 = u_xlat1_;
    let _e815 = u_xlat1_;
    let _e817 = vs_COLOR0_1;
    let _e819 = (_e815.xyz * _e817.xyz);
    u_xlat1_.x = _e819.x;
    u_xlat1_.y = _e819.y;
    u_xlat1_.z = _e819.z;
    let _e826 = u_xlat0_;
    let _e828 = u_xlat0_;
    let _e830 = u_xlat1_;
    let _e832 = min(_e828.xyz, _e830.xyz);
    u_xlat0_.x = _e832.x;
    u_xlat0_.y = _e832.y;
    u_xlat0_.z = _e832.z;
    let _e839 = vs_TEXCOORD1_1;
    let _e844 = _f_buffer0_.f_cb0_[4];
    let _e849 = hscard_bias.values[1];
    let _e852 = textureSampleBias(f_t1_, samplerf_s1_, _e839.xy, (_e844.x + _e849.x));
    u_xlat1_ = _e852;
    let _e853 = SV_Target0_;
    let _e855 = u_xlat0_;
    let _e857 = u_xlat1_;
    let _e859 = (_e855.xyz * _e857.xyz);
    SV_Target0_.x = _e859.x;
    SV_Target0_.y = _e859.y;
    SV_Target0_.z = _e859.z;
    SV_Target0_.w = 1f;
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec2<f32>, @location(1) vs_TEXCOORD1_: vec2<f32>, @location(2) vs_TEXCOORD2_: vec4<f32>, @location(3) vs_TEXCOORD3_: vec4<f32>, @location(4) vs_TEXCOORD4_: vec4<f32>, @location(5) vs_TEXCOORD5_: vec4<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_TEXCOORD3_1 = vs_TEXCOORD3_;
    vs_TEXCOORD4_1 = vs_TEXCOORD4_;
    vs_TEXCOORD5_1 = vs_TEXCOORD5_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e68 = SV_Target0_;
    return FragmentOutput(_e68);
}
