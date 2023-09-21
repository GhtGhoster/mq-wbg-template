#!/bin/bash
echo `# <#`

# Bash goes here (tested on Ubuntu)

sudo apt install libasound2-dev
sudo apt install libssl-dev

# Do not exit, run commands either way

#> > $null

# PowerShell goes here

cargo install -f wasm-bindgen-cli@0.2.84

cargo install basic-http-server

rustup target add wasm32-unknown-unknown
