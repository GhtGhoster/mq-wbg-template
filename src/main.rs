
use macroquad::prelude::*;

#[macroquad::main("mq-wasm-pages")]
async fn main() {
    loop {
        clear_background(BLACK);

        next_frame().await
    }
}
