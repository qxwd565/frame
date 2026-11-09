struct HScardSamplerBias {
    values: array<vec4<f32>, 16>,
}

struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 5>,
}

struct f_buffer1_ {
    f_cb1_: array<vec4<f32>, 40>,
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
var<private> vs_TEXCOORD0_1: vec4<f32>;
var<private> vs_TEXCOORD1_1: vec4<f32>;
var<private> vs_TEXCOORD2_1: vec2<f32>;
var<private> vs_COLOR0_1: vec4<f32>;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    var u_xlat0_: vec4<f32> = vec4(0f);
    var u_xlatb0_: vec2<bool> = vec2(false);
    var u_xlat1_: vec4<f32> = vec4(0f);
    var u_xlat2_: vec4<f32> = vec4(0f);
    var u_xlat3_: vec4<f32> = vec4(0f);
    var u_xlat4_: vec4<f32> = vec4(0f);
    var u_xlat5_: vec4<f32> = vec4(0f);
    var u_xlatb5_: vec2<bool> = vec2(false);
    var u_xlat6_: vec4<f32> = vec4(0f);
    var u_xlatb6_: vec2<bool> = vec2(false);
    var u_xlat7_: vec4<f32> = vec4(0f);
    var u_xlat8_: vec4<f32> = vec4(0f);
    var u_xlat9_: vec3<f32> = vec3(0f);
    var u_xlat18_: vec2<f32> = vec2(0f);
    var u_xlat21_: vec2<f32> = vec2(0f);
    var u_xlat27_: f32 = 0f;
    var local: vec4<f32>;
    var local_1: vec4<f32>;
    var local_2: vec4<f32>;
    var local_3: vec4<f32>;
    var local_4: vec4<f32>;
    var local_5: vec4<f32>;

    let _e91 = u_xlat0_;
    let _e96 = _f_buffer1_.f_cb1_[26];
    let _e98 = vs_TEXCOORD2_1;
    let _e104 = _f_buffer1_.f_cb1_[26];
    let _e106 = ((_e96.zw * _e98.xx) + _e104.xy);
    u_xlat0_.x = _e106.x;
    u_xlat0_.y = _e106.y;
    let _e111 = vs_TEXCOORD1_1;
    let _e116 = _f_buffer0_.f_cb0_[4];
    let _e121 = hscard_bias.values[6];
    let _e124 = textureSampleBias(f_t6_, samplerf_s6_, _e111.zw, (_e116.x + _e121.x));
    u_xlat1_ = _e124;
    let _e125 = u_xlat18_;
    let _e130 = _f_buffer1_.f_cb1_[35];
    let _e136 = _f_buffer1_.f_cb1_[36];
    let _e138 = (-(_e130.xy) + _e136.zw);
    u_xlat18_.x = _e138.x;
    u_xlat18_.y = _e138.y;
    let _e143 = u_xlat1_;
    let _e145 = u_xlat18_;
    let _e148 = u_xlat1_;
    let _e150 = (-(_e145.xy) + _e148.xy);
    u_xlat1_.x = _e150.x;
    u_xlat1_.y = _e150.y;
    let _e155 = u_xlat18_;
    let _e157 = u_xlat1_;
    let _e162 = _f_buffer1_.f_cb1_[36];
    let _e165 = u_xlat18_;
    let _e167 = ((_e157.xy * _e162.xy) + _e165.xy);
    u_xlat18_.x = _e167.x;
    u_xlat18_.y = _e167.y;
    let _e172 = u_xlat1_;
    let _e177 = _f_buffer1_.f_cb1_[35];
    let _e179 = vs_TEXCOORD2_1;
    let _e185 = _f_buffer1_.f_cb1_[35];
    let _e187 = ((_e177.zw * _e179.xx) + _e185.xy);
    u_xlat1_.x = _e187.x;
    u_xlat1_.y = _e187.y;
    let _e192 = u_xlat18_;
    let _e194 = u_xlat18_;
    let _e196 = u_xlat1_;
    let _e198 = (_e194.xy + _e196.xy);
    u_xlat18_.x = _e198.x;
    u_xlat18_.y = _e198.y;
    let _e203 = u_xlat18_;
    let _e208 = _f_buffer0_.f_cb0_[4];
    let _e213 = hscard_bias.values[5];
    let _e216 = textureSampleBias(f_t5_, samplerf_s5_, _e203.xy, (_e208.x + _e213.x));
    u_xlat2_ = _e216;
    let _e217 = u_xlat2_;
    let _e222 = _f_buffer1_.f_cb1_[34];
    u_xlat3_ = (_e217.xyxy * _e222);
    let _e225 = u_xlat1_;
    let _e227 = u_xlat2_;
    u_xlat2_.w = (_e225.z * _e227.w);
    let _e230 = vs_TEXCOORD0_1;
    let _e235 = _f_buffer0_.f_cb0_[4];
    let _e240 = hscard_bias.values[1];
    let _e243 = textureSampleBias(f_t1_, samplerf_s1_, _e230.xy, (_e235.x + _e240.x));
    u_xlat1_ = _e243;
    let _e245 = u_xlat1_;
    let _e249 = _f_buffer1_.f_cb1_[28];
    u_xlat18_.x = dot(_e245, _e249);
    let _e252 = u_xlat18_;
    u_xlat18_.x = min(_e252.x, 1f);
    let _e257 = u_xlat18_;
    let _e259 = u_xlat2_;
    u_xlat18_.x = (_e257.x * _e259.w);
    let _e262 = u_xlat4_;
    let _e264 = u_xlat3_;
    let _e266 = u_xlat18_;
    let _e269 = vs_TEXCOORD1_1;
    let _e271 = ((_e264.zw * _e266.xx) + _e269.xy);
    u_xlat4_.x = _e271.x;
    u_xlat4_.y = _e271.y;
    let _e276 = u_xlat18_;
    let _e278 = u_xlat3_;
    u_xlat3_ = (_e276.xxxx * _e278);
    let _e280 = u_xlat4_;
    let _e285 = _f_buffer0_.f_cb0_[4];
    let _e290 = hscard_bias.values[4];
    let _e293 = textureSampleBias(f_t4_, samplerf_s4_, _e280.xy, (_e285.x + _e290.x));
    u_xlat4_ = _e293;
    let _e294 = u_xlat5_;
    let _e299 = _f_buffer1_.f_cb1_[26];
    let _e305 = _f_buffer1_.f_cb1_[27];
    let _e307 = (-(_e299.xy) + _e305.zw);
    u_xlat5_.x = _e307.x;
    u_xlat5_.y = _e307.y;
    let _e312 = u_xlat4_;
    let _e314 = u_xlat4_;
    let _e316 = u_xlat5_;
    let _e319 = (_e314.xy + -(_e316.xy));
    u_xlat4_.x = _e319.x;
    u_xlat4_.y = _e319.y;
    let _e324 = u_xlat4_;
    let _e326 = u_xlat4_;
    let _e331 = _f_buffer1_.f_cb1_[27];
    let _e334 = u_xlat5_;
    let _e336 = ((_e326.xy * _e331.xy) + _e334.xy);
    u_xlat4_.x = _e336.x;
    u_xlat4_.y = _e336.y;
    let _e341 = u_xlat0_;
    let _e343 = u_xlat0_;
    let _e345 = u_xlat4_;
    let _e347 = (_e343.xy + _e345.xy);
    u_xlat0_.x = _e347.x;
    u_xlat0_.y = _e347.y;
    let _e352 = u_xlat0_;
    let _e357 = _f_buffer0_.f_cb0_[4];
    let _e362 = hscard_bias.values[3];
    let _e365 = textureSampleBias(f_t3_, samplerf_s3_, _e352.xy, (_e357.x + _e362.x));
    u_xlat5_ = _e365;
    let _e366 = u_xlat5_;
    let _e371 = _f_buffer1_.f_cb1_[25];
    u_xlat6_ = (_e366.xyxy * _e371);
    let _e374 = u_xlat4_;
    let _e376 = u_xlat5_;
    u_xlat5_.w = (_e374.z * _e376.w);
    let _e380 = u_xlat1_;
    let _e384 = _f_buffer1_.f_cb1_[19];
    u_xlat0_.x = dot(_e380, _e384);
    let _e387 = u_xlat0_;
    u_xlat0_.x = min(_e387.x, 1f);
    let _e392 = u_xlat0_;
    let _e394 = u_xlat5_;
    u_xlat0_.x = (_e392.x * _e394.w);
    let _e397 = u_xlat6_;
    let _e398 = u_xlat0_;
    let _e401 = u_xlat3_;
    u_xlat3_ = ((_e397 * _e398.xxxx) + _e401);
    let _e404 = u_xlat1_;
    let _e408 = _f_buffer1_.f_cb1_[10];
    u_xlat9_.x = dot(_e404, _e408);
    let _e411 = u_xlat1_;
    let _e415 = _f_buffer1_.f_cb1_[39];
    u_xlat9_.z = dot(_e411, _e415);
    let _e417 = u_xlat9_;
    let _e419 = u_xlat9_;
    let _e424 = min(_e419.xz, vec2<f32>(1f, 1f));
    u_xlat9_.x = _e424.x;
    u_xlat9_.z = _e424.y;
    let _e429 = u_xlat9_;
    let _e431 = vs_TEXCOORD2_1;
    u_xlat27_ = (_e429.z * _e431.y);
    let _e434 = u_xlat1_;
    let _e436 = u_xlat3_;
    let _e438 = vs_TEXCOORD0_1;
    let _e440 = (_e436.zw + _e438.zw);
    u_xlat1_.x = _e440.x;
    u_xlat1_.y = _e440.y;
    let _e445 = u_xlat1_;
    let _e450 = _f_buffer0_.f_cb0_[4];
    let _e455 = hscard_bias.values[2];
    let _e458 = textureSampleBias(f_t2_, samplerf_s2_, _e445.xy, (_e450.x + _e455.x));
    u_xlat1_ = _e458;
    let _e460 = u_xlat9_;
    let _e462 = u_xlat1_;
    u_xlat9_.x = (_e460.x * _e462.w);
    let _e465 = u_xlat21_;
    let _e467 = u_xlat1_;
    let _e472 = _f_buffer1_.f_cb1_[16];
    let _e474 = (_e467.xy * _e472.xy);
    u_xlat21_.x = _e474.x;
    u_xlat21_.y = _e474.y;
    let _e479 = u_xlat3_;
    let _e481 = u_xlat21_;
    let _e483 = u_xlat9_;
    let _e486 = u_xlat3_;
    let _e488 = ((_e481.xy * _e483.xx) + _e486.xy);
    u_xlat3_.x = _e488.x;
    u_xlat3_.y = _e488.y;
    let _e493 = u_xlat3_;
    let _e495 = u_xlat3_;
    let _e497 = vs_TEXCOORD0_1;
    let _e499 = (_e495.xy + _e497.xy);
    u_xlat3_.x = _e499.x;
    u_xlat3_.y = _e499.y;
    let _e504 = u_xlat3_;
    let _e509 = _f_buffer0_.f_cb0_[4];
    let _e514 = hscard_bias.values[0];
    let _e517 = textureSampleBias(f_t0_, samplerf_s0_, _e504.xy, (_e509.x + _e514.x));
    u_xlat3_ = _e517;
    let _e521 = _f_buffer1_.f_cb1_[11];
    let _e526 = _f_buffer1_.f_cb1_[11];
    u_xlat4_ = (_e521.wwww * _e526);
    let _e528 = u_xlat1_;
    let _e529 = u_xlat4_;
    let _e531 = u_xlat3_;
    u_xlat6_ = ((_e528 * _e529) + -(_e531));
    let _e534 = u_xlat1_;
    let _e535 = u_xlat4_;
    u_xlat7_ = (_e534 * _e535);
    let _e537 = u_xlat1_;
    let _e539 = u_xlat4_;
    u_xlat1_ = ((-(_e537) * _e539) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e548 = u_xlat7_;
    let _e553 = _f_buffer1_.f_cb1_[15];
    u_xlat4_.x = (_e548.w * _e553.w);
    let _e557 = u_xlat4_;
    u_xlat4_.x = clamp(_e557.x, 0f, 1f);
    let _e562 = u_xlat4_;
    let _e564 = u_xlat6_;
    let _e566 = u_xlat3_;
    u_xlat4_ = ((_e562.xxxx * _e564) + _e566);
    let _e568 = u_xlatb6_;
    let _e578 = _f_buffer1_.f_cb1_[15];
    let _e581 = (vec4<f32>(0f, 0f, 0f, 0f) < _e578.wzww).xy;
    u_xlatb6_.x = _e581.x;
    u_xlatb6_.y = _e581.y;
    let _e586 = u_xlatb6_;
    if _e586.x {
        let _e588 = u_xlat4_;
        local = _e588;
    } else {
        let _e589 = u_xlat3_;
        local = _e589;
    }
    let _e591 = local;
    u_xlat4_ = _e591;
    let _e592 = u_xlat7_;
    let _e593 = u_xlat4_;
    u_xlat8_ = (_e592 * _e593);
    let _e595 = u_xlat8_;
    let _e599 = _f_buffer1_.f_cb1_[15];
    let _e602 = u_xlat4_;
    u_xlat4_ = ((_e595 * _e599.yyyy) + _e602);
    let _e604 = u_xlat7_;
    let _e608 = _f_buffer1_.f_cb1_[15];
    let _e611 = u_xlat4_;
    u_xlat4_ = ((_e604 * _e608.xxxx) + _e611);
    let _e613 = u_xlat4_;
    u_xlat8_ = (-(_e613) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e621 = u_xlat8_;
    let _e622 = u_xlat8_;
    u_xlat8_ = (_e621 + _e622);
    let _e624 = u_xlat8_;
    let _e626 = u_xlat1_;
    u_xlat1_ = ((-(_e624) * _e626) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e634 = u_xlat4_;
    let _e635 = u_xlat4_;
    u_xlat8_ = (_e634 + _e635);
    let _e637 = u_xlat8_;
    let _e639 = u_xlat7_;
    let _e641 = u_xlat1_;
    u_xlat1_ = ((-(_e637) * _e639) + _e641);
    let _e643 = u_xlat7_;
    let _e644 = u_xlat8_;
    u_xlat7_ = (_e643 * _e644);
    let _e646 = u_xlat8_;
    u_xlat8_ = floor(_e646);
    let _e648 = u_xlat8_;
    u_xlat8_ = min(_e648, vec4<f32>(1f, 1f, 1f, 1f));
    let _e655 = u_xlat8_;
    let _e656 = u_xlat1_;
    let _e658 = u_xlat7_;
    u_xlat1_ = ((_e655 * _e656) + _e658);
    let _e660 = u_xlat3_;
    let _e662 = u_xlat1_;
    u_xlat1_ = (-(_e660) + _e662);
    let _e667 = _f_buffer1_.f_cb1_[15];
    let _e669 = u_xlat1_;
    let _e671 = u_xlat3_;
    u_xlat1_ = ((_e667.zzzz * _e669) + _e671);
    let _e673 = u_xlatb6_;
    if _e673.y {
        let _e675 = u_xlat1_;
        local_1 = _e675;
    } else {
        let _e676 = u_xlat4_;
        local_1 = _e676;
    }
    let _e678 = local_1;
    u_xlat1_ = _e678;
    let _e679 = u_xlat3_;
    let _e681 = u_xlat1_;
    u_xlat1_ = (-(_e679) + _e681);
    let _e683 = u_xlat9_;
    let _e685 = u_xlat1_;
    let _e687 = u_xlat3_;
    u_xlat1_ = ((_e683.xxxx * _e685) + _e687);
    let _e689 = u_xlat0_;
    let _e694 = _f_buffer1_.f_cb1_[20];
    u_xlat3_ = (_e689.xxxx * _e694);
    let _e696 = u_xlat3_;
    let _e700 = _f_buffer1_.f_cb1_[20];
    u_xlat3_ = (_e696 * _e700.wwww);
    let _e703 = u_xlat5_;
    let _e704 = u_xlat3_;
    let _e706 = u_xlat1_;
    u_xlat4_ = ((_e703 * _e704) + -(_e706));
    let _e709 = u_xlat3_;
    let _e710 = u_xlat5_;
    u_xlat6_ = (_e709 * _e710);
    let _e712 = u_xlat5_;
    let _e714 = u_xlat3_;
    u_xlat3_ = ((-(_e712) * _e714) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e723 = u_xlat6_;
    let _e728 = _f_buffer1_.f_cb1_[24];
    u_xlat9_.x = (_e723.w * _e728.w);
    let _e732 = u_xlat9_;
    u_xlat9_.x = clamp(_e732.x, 0f, 1f);
    let _e737 = u_xlat9_;
    let _e739 = u_xlat4_;
    let _e741 = u_xlat1_;
    u_xlat4_ = ((_e737.xxxx * _e739) + _e741);
    let _e743 = u_xlatb5_;
    let _e753 = _f_buffer1_.f_cb1_[24];
    let _e756 = (vec4<f32>(0f, 0f, 0f, 0f) < _e753.wzww).xy;
    u_xlatb5_.x = _e756.x;
    u_xlatb5_.y = _e756.y;
    let _e761 = u_xlatb5_;
    if _e761.x {
        let _e763 = u_xlat4_;
        local_2 = _e763;
    } else {
        let _e764 = u_xlat1_;
        local_2 = _e764;
    }
    let _e766 = local_2;
    u_xlat4_ = _e766;
    let _e767 = u_xlat6_;
    let _e768 = u_xlat4_;
    u_xlat7_ = (_e767 * _e768);
    let _e770 = u_xlat7_;
    let _e774 = _f_buffer1_.f_cb1_[24];
    let _e777 = u_xlat4_;
    u_xlat4_ = ((_e770 * _e774.yyyy) + _e777);
    let _e779 = u_xlat6_;
    let _e783 = _f_buffer1_.f_cb1_[24];
    let _e786 = u_xlat4_;
    u_xlat4_ = ((_e779 * _e783.xxxx) + _e786);
    let _e788 = u_xlat4_;
    u_xlat7_ = (-(_e788) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e796 = u_xlat7_;
    let _e797 = u_xlat7_;
    u_xlat7_ = (_e796 + _e797);
    let _e799 = u_xlat7_;
    let _e801 = u_xlat3_;
    u_xlat3_ = ((-(_e799) * _e801) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e809 = u_xlat4_;
    let _e810 = u_xlat4_;
    u_xlat7_ = (_e809 + _e810);
    let _e812 = u_xlat7_;
    let _e814 = u_xlat6_;
    let _e816 = u_xlat3_;
    u_xlat3_ = ((-(_e812) * _e814) + _e816);
    let _e818 = u_xlat6_;
    let _e819 = u_xlat7_;
    u_xlat6_ = (_e818 * _e819);
    let _e821 = u_xlat7_;
    u_xlat7_ = floor(_e821);
    let _e823 = u_xlat7_;
    u_xlat7_ = min(_e823, vec4<f32>(1f, 1f, 1f, 1f));
    let _e830 = u_xlat7_;
    let _e831 = u_xlat3_;
    let _e833 = u_xlat6_;
    u_xlat3_ = ((_e830 * _e831) + _e833);
    let _e835 = u_xlat1_;
    let _e837 = u_xlat3_;
    u_xlat3_ = (-(_e835) + _e837);
    let _e842 = _f_buffer1_.f_cb1_[24];
    let _e844 = u_xlat3_;
    let _e846 = u_xlat1_;
    u_xlat3_ = ((_e842.zzzz * _e844) + _e846);
    let _e848 = u_xlatb5_;
    if _e848.y {
        let _e850 = u_xlat3_;
        local_3 = _e850;
    } else {
        let _e851 = u_xlat4_;
        local_3 = _e851;
    }
    let _e853 = local_3;
    u_xlat3_ = _e853;
    let _e854 = u_xlat1_;
    let _e856 = u_xlat3_;
    u_xlat3_ = (-(_e854) + _e856);
    let _e858 = u_xlat0_;
    let _e860 = u_xlat3_;
    let _e862 = u_xlat1_;
    u_xlat1_ = ((_e858.xxxx * _e860) + _e862);
    let _e864 = u_xlat18_;
    let _e869 = _f_buffer1_.f_cb1_[29];
    u_xlat3_ = (_e864.xxxx * _e869);
    let _e871 = u_xlat3_;
    let _e875 = _f_buffer1_.f_cb1_[29];
    u_xlat3_ = (_e871 * _e875.wwww);
    let _e878 = u_xlat2_;
    let _e879 = u_xlat3_;
    let _e881 = u_xlat1_;
    u_xlat4_ = ((_e878 * _e879) + -(_e881));
    let _e884 = u_xlat2_;
    let _e885 = u_xlat3_;
    u_xlat5_ = (_e884 * _e885);
    let _e887 = u_xlat2_;
    let _e889 = u_xlat3_;
    u_xlat2_ = ((-(_e887) * _e889) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e898 = u_xlat5_;
    let _e903 = _f_buffer1_.f_cb1_[33];
    u_xlat0_.x = (_e898.w * _e903.w);
    let _e907 = u_xlat0_;
    u_xlat0_.x = clamp(_e907.x, 0f, 1f);
    let _e912 = u_xlat0_;
    let _e914 = u_xlat4_;
    let _e916 = u_xlat1_;
    u_xlat3_ = ((_e912.xxxx * _e914) + _e916);
    let _e918 = u_xlatb0_;
    let _e928 = _f_buffer1_.f_cb1_[33];
    let _e931 = (vec4<f32>(0f, 0f, 0f, 0f) < _e928.wzww).xy;
    u_xlatb0_.x = _e931.x;
    u_xlatb0_.y = _e931.y;
    let _e936 = u_xlatb0_;
    if _e936.x {
        let _e938 = u_xlat3_;
        local_4 = _e938;
    } else {
        let _e939 = u_xlat1_;
        local_4 = _e939;
    }
    let _e941 = local_4;
    u_xlat3_ = _e941;
    let _e942 = u_xlat5_;
    let _e943 = u_xlat3_;
    u_xlat4_ = (_e942 * _e943);
    let _e945 = u_xlat4_;
    let _e949 = _f_buffer1_.f_cb1_[33];
    let _e952 = u_xlat3_;
    u_xlat3_ = ((_e945 * _e949.yyyy) + _e952);
    let _e954 = u_xlat5_;
    let _e958 = _f_buffer1_.f_cb1_[33];
    let _e961 = u_xlat3_;
    u_xlat3_ = ((_e954 * _e958.xxxx) + _e961);
    let _e963 = u_xlat3_;
    u_xlat4_ = (-(_e963) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e971 = u_xlat4_;
    let _e972 = u_xlat4_;
    u_xlat4_ = (_e971 + _e972);
    let _e974 = u_xlat4_;
    let _e976 = u_xlat2_;
    u_xlat2_ = ((-(_e974) * _e976) + vec4<f32>(1f, 1f, 1f, 1f));
    let _e984 = u_xlat3_;
    let _e985 = u_xlat3_;
    u_xlat4_ = (_e984 + _e985);
    let _e987 = u_xlat4_;
    let _e989 = u_xlat5_;
    let _e991 = u_xlat2_;
    u_xlat2_ = ((-(_e987) * _e989) + _e991);
    let _e993 = u_xlat5_;
    let _e994 = u_xlat4_;
    u_xlat5_ = (_e993 * _e994);
    let _e996 = u_xlat4_;
    u_xlat4_ = floor(_e996);
    let _e998 = u_xlat4_;
    u_xlat4_ = min(_e998, vec4<f32>(1f, 1f, 1f, 1f));
    let _e1005 = u_xlat4_;
    let _e1006 = u_xlat2_;
    let _e1008 = u_xlat5_;
    u_xlat2_ = ((_e1005 * _e1006) + _e1008);
    let _e1010 = u_xlat1_;
    let _e1012 = u_xlat2_;
    u_xlat2_ = (-(_e1010) + _e1012);
    let _e1017 = _f_buffer1_.f_cb1_[33];
    let _e1019 = u_xlat2_;
    let _e1021 = u_xlat1_;
    u_xlat2_ = ((_e1017.zzzz * _e1019) + _e1021);
    let _e1023 = u_xlatb0_;
    if _e1023.y {
        let _e1025 = u_xlat2_;
        local_5 = _e1025;
    } else {
        let _e1026 = u_xlat3_;
        local_5 = _e1026;
    }
    let _e1028 = local_5;
    u_xlat2_ = _e1028;
    let _e1029 = u_xlat1_;
    let _e1031 = u_xlat2_;
    u_xlat2_ = (-(_e1029) + _e1031);
    let _e1033 = u_xlat18_;
    let _e1035 = u_xlat2_;
    let _e1037 = u_xlat1_;
    u_xlat1_ = ((_e1033.xxxx * _e1035) + _e1037);
    let _e1039 = u_xlat1_;
    u_xlat1_ = clamp(_e1039, vec4(0f), vec4(1f));
    let _e1045 = u_xlat1_;
    u_xlat2_ = log2(_e1045);
    let _e1047 = u_xlat2_;
    let _e1051 = _f_buffer1_.f_cb1_[38];
    u_xlat2_ = (_e1047 * _e1051.zzzz);
    let _e1054 = u_xlat2_;
    u_xlat2_ = exp2(_e1054);
    let _e1056 = u_xlat27_;
    let _e1058 = u_xlat2_;
    let _e1060 = u_xlat1_;
    u_xlat0_ = ((vec4(_e1056) * _e1058) + _e1060);
    let _e1062 = u_xlat0_;
    let _e1063 = vs_COLOR0_1;
    SV_Target0_ = (_e1062 * _e1063);
    return;
}

@fragment 
fn main(@location(0) vs_TEXCOORD0_: vec4<f32>, @location(1) vs_TEXCOORD1_: vec4<f32>, @location(2) vs_TEXCOORD2_: vec2<f32>, @location(10) vs_COLOR0_: vec4<f32>) -> FragmentOutput {
    vs_TEXCOORD0_1 = vs_TEXCOORD0_;
    vs_TEXCOORD1_1 = vs_TEXCOORD1_;
    vs_TEXCOORD2_1 = vs_TEXCOORD2_;
    vs_COLOR0_1 = vs_COLOR0_;
    main_1();
    let _e56 = SV_Target0_;
    return FragmentOutput(_e56);
}
