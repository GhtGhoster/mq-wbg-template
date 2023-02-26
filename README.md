# Macroquad build template for WASM with support for GitHub Pages

This repository serves as a template for projects based on the rust `macroquad` crate.
Its intention is making WASM building and binding generation process as painless as possible.

## Instructions and dependencies:

Once you created a repository through this template, run the `rename.sh` script for cargo to work.

When you want to build your project for web, run the `build.sh` script. (This script assumes you have the `wasm-bindgen` command available to you.)

To test your built project locally, run a local server of your choosing to host the repository directory. (This is necessary over just opening the `index.html` file in your browser so that the required resources load properly)

When you're happy with the built project, it's already ready for GitHub Pages, just enable the feature in your repository settings.

## Sources:

- https://gist.github.com/tgolsson/d78f7887a8542f3fd6f125070e5e22d6
- https://gist.github.com/nobbele/0d932a993786ed081632254fb6b01e25
- https://gist.github.com/olefasting/15ae263da4cf1ba308ce55c15c9b221b
- https://not-fl3.github.io/miniquad-samples/mq_js_bundle.js

## TODO:

- Make scripts available in .sh for Linux

- Add license to github repo and cargo.toml
