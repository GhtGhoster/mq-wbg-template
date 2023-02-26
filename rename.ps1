$NewName = Split-Path -Leaf $PWD
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False

$Content = Get-Content .\src\main.rs | ForEach-Object{$_ -replace [regex]::Escape("mq-wasm-pages"), $NewName}
[System.IO.File]::WriteAllLines(".\src\main.rs", $Content, $Utf8NoBomEncoding)

$Content = Get-Content .\Cargo.toml | ForEach-Object{$_ -replace [regex]::Escape("mq-wasm-pages"), $NewName}
[System.IO.File]::WriteAllLines(".\Cargo.toml", $Content, $Utf8NoBomEncoding)

cargo clean