$topFolder = Split-Path -Leaf $PWD

Get-Content .\src\main.rs | ForEach-Object{$_ -replace [regex]::Escape("mq-wasm-pages"), $topFolder} | out-file .\src\main.rs.tmp -encoding utf8NoBOM
Remove-Item .\src\main.rs
Move-Item .\src\main.rs.tmp .\src\main.rs

Get-Content .\Cargo.toml | ForEach-Object{$_ -replace [regex]::Escape("mq-wasm-pages"), $topFolder} | out-file .\Cargo.toml.tmp -encoding utf8NoBOM
Remove-Item .\Cargo.toml
Move-Item .\Cargo.toml.tmp .\Cargo.toml

cargo clean