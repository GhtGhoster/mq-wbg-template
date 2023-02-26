
use macroquad::prelude::*;

#[macroquad::main("mq-wasm-pages")]
async fn main() {
    println!("Hello, world!");

    loop {
        next_frame().await
    }
}
