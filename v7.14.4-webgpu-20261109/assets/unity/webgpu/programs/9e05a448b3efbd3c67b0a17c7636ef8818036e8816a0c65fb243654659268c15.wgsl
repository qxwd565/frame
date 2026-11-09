struct FragmentOutput {
    @location(0) SV_TARGET0_: vec4<f32>,
}

var<private> SV_TARGET0_: vec4<f32>;

fn main_1() {
    SV_TARGET0_ = vec4<f32>(0f, 0f, 0f, 0f);
    return;
}

@fragment 
fn main() -> FragmentOutput {
    main_1();
    let _e3 = SV_TARGET0_;
    return FragmentOutput(_e3);
}
