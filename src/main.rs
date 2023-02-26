
use macroquad::prelude::*;

#[macroquad::main("mq-wasm-pages")]
async fn main() {
    loop {
        next_frame().await
    }
}
