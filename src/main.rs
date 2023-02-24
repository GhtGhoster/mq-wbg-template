
use macroquad::prelude::*;

#[macroquad::main("macroquad_web_template")]
async fn main() {
    println!("Hello, world!");

    loop {
        next_frame().await
    }
}
