param(
    [string]$Destination = "$env:USERPROFILE\.claude\skills"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$source = Join-Path $repoRoot "skills"

if (-not (Test-Path $source)) {
    throw "Skills folder not found: $source"
}

New-Item -ItemType Directory -Force -Path $Destination | Out-Null

Get-ChildItem -Path $source -Directory | ForEach-Object {
    $target = Join-Path $Destination $_.Name
    Copy-Item -Recurse -Force -Path $_.FullName -Destination $target
    Write-Host "Installed $($_.Name) -> $target"
}

Write-Host "Claude Code skills installed to $Destination"
