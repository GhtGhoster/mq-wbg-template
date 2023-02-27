# Macroquad build template for WASM with support for GitHub Pages

This repository serves as a template for projects based on the rust [`macroquad`](https://github.com/not-fl3/macroquad) crate.
Its intention is making WASM building and binding generation process as painless as possible.

## Instructions and dependencies:

All scripts listed below are compatible with default Windows installation of PowerShell (v6+ not required) as well as bash for Linux (scripts are polyglot)

Once you created a repository through this template, run the [`rename.ps1`](rename.ps1) script for cargo and the [`build.ps1`](build.ps1) script to work.

If you've never done anything around rust with wasm, it's recommended to run the [`setup.ps1`](setup.ps1) script.
This will install `wasm-bindgen-cli` and add `wasm32-unknown-unknown` to possible compilation targets.

When you want to build your project for web, run the [`build.ps1`](build.ps1) script.

To test your built project locally, run a local server of your choosing to host the repository directory.
(This is necessary over just opening the [`index.html`](index.html) file in your browser so that the required resources load properly)

When you're happy with the built project, it's already ready for GitHub Pages, just enable the feature in your repository settings.

## License

Licensed under either of

- Apache License, Version 2.0
   ([LICENSE-APACHE](LICENSE-APACHE) or https://www.apache.org/licenses/LICENSE-2.0)
- MIT license
   ([LICENSE-MIT](LICENSE-MIT) or https://opensource.org/licenses/MIT)

at your option.

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.

## TODO:

- Test polyglot scripts on Linux

- Test audio capablities on web
  - https://gist.github.com/nobbele/0d932a993786ed081632254fb6b01e25

- Run script? (local server)
  - `cargo install basic-http-server`
  - `basic-http-server .`
