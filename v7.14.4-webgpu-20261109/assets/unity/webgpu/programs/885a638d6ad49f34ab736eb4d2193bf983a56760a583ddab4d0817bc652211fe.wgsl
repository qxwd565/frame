struct FragmentOutput {
    @location(0) SV_Target0_: vec4<f32>,
}

var<private> SV_Target0_: vec4<f32>;

fn main_1() {
    SV_Target0_ = vec4<f32>(1f, 1f, 1f, 1f);
    return;
}

@fragment 
fn main() -> FragmentOutput {
    main_1();
    let _e3 = SV_Target0_;
    return FragmentOutput(_e3);
}
