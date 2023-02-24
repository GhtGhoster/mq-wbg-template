cargo build --release --target wasm32-unknown-unknown

mkdir wbindgen

wasm-bindgen --target web --out-dir wbindgen/ target/wasm32-unknown-unknown/release/hextacker.wasm

Copy-Item ./wbindgen/hextacker.js ./hextacker.js

Get-Content .\hextacker.js | ForEach-Object{$_ -replace [regex]::Escape("import * as __wbg_star0 from 'env';")} | out-file hextacker.tmp -encoding utf8
Remove-Item hextacker.js
Move-Item hextacker.tmp hextacker.js

Get-Content .\hextacker.js | ForEach-Object{$_ -replace [regex]::Escape("let wasm;"),"let wasm; export const set_wasm = (w) => wasm = w;"} | out-file hextacker.tmp -encoding utf8
Remove-Item hextacker.js
Move-Item hextacker.tmp hextacker.js

Get-Content .\hextacker.js | ForEach-Object{$_ -replace [regex]::Escape("imports['env'] = __wbg_star0;"),"return imports.wbg;"} | out-file hextacker.tmp -encoding utf8
Remove-Item hextacker.js
Move-Item hextacker.tmp hextacker.js

Get-Content .\hextacker.js | ForEach-Object{$_ -replace [regex]::Escape("const imports = getImports();"),"return getImports();"} | out-file hextacker.tmp -encoding utf8
Remove-Item hextacker.js
Move-Item hextacker.tmp hextacker.js

mkdir web_res

Remove-Item ./web_res/hextacker.js
Move-Item ./hextacker.js ./web_res/hextacker.js

Remove-Item ./web_res/hextacker_bg.wasm
Move-Item ./wbindgen/hextacker_bg.wasm ./web_res/hextacker_bg.wasm
