# mq-wasm-pages

edit build script
- take the correct directory/file/project name in the build script
- make it shut up about existing directories
- make it log progress (at least say something)

make run script
- run build script
- host a local server (maybe python?)
- open it in browser

(testing how github templates work)
make a script to rename the whole project
- cargo clean
- replace name in Cargo.toml
- move out and rename directory (figure out how GitHub templates work)
- cargo build/clean (--release)

make both scripts in both ps1 ~~and sh~~

add a read_me with instructions, description and credits
- description
- instructions / dependencies
- sources

add license to github repo and cargo.toml
  
## sources:
### build script
- https://gist.github.com/tgolsson/d78f7887a8542f3fd6f125070e5e22d6
- https://gist.github.com/nobbele/0d932a993786ed081632254fb6b01e25
- https://gist.github.com/olefasting/15ae263da4cf1ba308ce55c15c9b221b
- https://not-fl3.github.io/miniquad-samples/mq_js_bundle.js

### rename script
- https://stackoverflow.com/questions/5596982/using-powershell-to-write-a-file-in-utf-8-without-the-bom
- https://stackoverflow.com/questions/44912189/is-there-any-way-to-rename-a-cargo-project
- https://github.com/rust-lang/rust/issues/55481
