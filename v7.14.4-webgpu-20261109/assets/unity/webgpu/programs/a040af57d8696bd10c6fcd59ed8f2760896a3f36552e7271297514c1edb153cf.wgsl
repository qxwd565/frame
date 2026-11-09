struct f_buffer0_ {
    f_cb0_: vec4<f32>,
}

struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    let _e4 = _f_buffer0_;
    SV_Target0_ = _e4.f_cb0_;
    return;
}

@fragment 
fn main() -> FragmentOutput {
    main_1();
    let _e6 = SV_Target0_;
    return FragmentOutput(_e6);
}
