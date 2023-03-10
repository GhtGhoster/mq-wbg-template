
use macroquad::prelude::*;

#[macroquad::main("mq-wbg-template")]
async fn main() {
    loop {
        // debugging
        // std::env::set_var("RUST_BACKTRACE", "1");

        // ui
        egui_macroquad::ui(|egui_ctx| {
            egui::Window::new("Hello")
                .show(egui_ctx, |ui| {
                    ui.label("World!");
                }
            );
        });

        // rendering
        clear_background(BLACK);

        egui_macroquad::draw();
        next_frame().await
    }
}
