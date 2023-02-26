$ProjectName = Split-Path -Leaf $PWD

cargo build --release --target wasm32-unknown-unknown

Write-Host -ForegroundColor Blue "Generating WASM binds"
New-Item -ItemType Directory -Force -Path ".\wbindgen\"
wasm-bindgen --target web --out-dir ".\wbindgen\" ".\target\wasm32-unknown-unknown\release\$ProjectName.wasm"

Write-Host -ForegroundColor Blue "Patching generated JavaScript"
$JavaScript = Get-Content ".\wbindgen\$ProjectName.js"
$JavaScript = $JavaScript | ForEach-Object{$_ -replace [regex]::Escape("import * as __wbg_star0 from 'env';")}
$JavaScript = $JavaScript | ForEach-Object{$_ -replace [regex]::Escape("let wasm;") ,"let wasm; export const set_wasm = (w) => wasm = w;"}
$JavaScript = $JavaScript | ForEach-Object{$_ -replace [regex]::Escape("imports['env'] = __wbg_star0;"), "return imports.wbg;"}
$JavaScript = $JavaScript | ForEach-Object{$_ -replace [regex]::Escape("const imports = getImports();"), "return getImports();"}

Write-Host -ForegroundColor Blue "Moving files to .\web_res\ directory"
[System.IO.File]::WriteAllLines(".\web_res\$ProjectName.js", $JavaScript)
Move-Item -Force ".\wbindgen\$($ProjectName)_bg.wasm" ".\web_res\$ProjectName.wasm"

# Copy-Item ./wbindgen/hextacker.js ./hextacker.js

# Get-Content .\hextacker.js | ForEach-Object{$_ -replace [regex]::Escape("import * as __wbg_star0 from 'env';")} | out-file hextacker.tmp -encoding utf8NoBOM
# Remove-Item hextacker.js
# Move-Item hextacker.tmp hextacker.js

# Get-Content .\hextacker.js | ForEach-Object{$_ -replace [regex]::Escape("let wasm;"),"let wasm; export const set_wasm = (w) => wasm = w;"} | out-file hextacker.tmp -encoding utf8NoBOM
# Remove-Item hextacker.js
# Move-Item hextacker.tmp hextacker.js

# Get-Content .\hextacker.js | ForEach-Object{$_ -replace [regex]::Escape("imports['env'] = __wbg_star0;"),"return imports.wbg;"} | out-file hextacker.tmp -encoding utf8NoBOM
# Remove-Item hextacker.js
# Move-Item hextacker.tmp hextacker.js

# Get-Content .\hextacker.js | ForEach-Object{$_ -replace [regex]::Escape("const imports = getImports();"),"return getImports();"} | out-file hextacker.tmp -encoding utf8NoBOM
# Remove-Item hextacker.js
# Move-Item hextacker.tmp hextacker.js

# mkdir web_res

# Remove-Item ./web_res/hextacker.js
# Move-Item ./hextacker.js ./web_res/hextacker.js

# Remove-Item ./web_res/hextacker_bg.wasm
# Move-Item ./wbindgen/hextacker_bg.wasm ./web_res/hextacker_bg.wasm
