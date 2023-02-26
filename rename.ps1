$NewName = Split-Path -Leaf $PWD

$Content = Get-Content .\src\main.rs | ForEach-Object{$_ -replace [regex]::Escape("mq-wasm-pages"), $NewName}
[System.IO.File]::WriteAllLines(".\src\main.rs", $Content)

$Content = Get-Content .\Cargo.toml | ForEach-Object{$_ -replace [regex]::Escape("mq-wasm-pages"), $NewName}
[System.IO.File]::WriteAllLines(".\Cargo.toml", $Content)

$Content = Get-Content .\index.html | ForEach-Object{$_ -replace [regex]::Escape("mq-wasm-pages"), $NewName}
[System.IO.File]::WriteAllLines(".\index.html", $Content)

cargo clean