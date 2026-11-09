struct f_buffer0_ {
    f_cb0_: array<vec4<f32>, 2>,
}

struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
}

@group(1) @binding(0) 
var<uniform> _f_buffer0_: f_buffer0_;
var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    let _e7 = _f_buffer0_.f_cb0_[1];
    SV_TARGET0_ = _e7;
    return;
}

@fragment 
fn main() -> FragmentOutput {
    main_1();
    let _e6 = SV_TARGET0_;
    return FragmentOutput(_e6);
}
