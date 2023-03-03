
use macroquad::prelude::*;

#[macroquad::main("mq-wasm-pages")]
async fn main() {
    loop {
        // ui
        egui_macroquad::ui(|egui_ctx| {
            egui::Window::new("top")
                .show(egui_ctx, |ui| {
                    ui.label("kek");
                }
            );
        });

        // rendering
        clear_background(BLACK);

        egui_macroquad::draw();
        next_frame().await
    }
}
