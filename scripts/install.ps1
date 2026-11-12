# Installs the UE Indie Superpowers skills for Codex (or another agent).
# Usage: .\scripts\install.ps1 [-Target "C:\path\to\skills"]
param(
  [string]$Target = ""
)

$ErrorActionPreference = "Stop"
$Src = Join-Path (Split-Path -Parent $PSScriptRoot) "skills"

if ([string]::IsNullOrWhiteSpace($Target)) {
  $CodexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $env:USERPROFILE ".codex" }
  $Target = Join-Path $CodexHome "skills"
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null
$count = 0
Get-ChildItem -Directory $Src | ForEach-Object {
  $dest = Join-Path $Target $_.Name
  if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
  Copy-Item -Recurse $_.FullName $dest
  $count++
}
Write-Host "Installed $count skills into: $Target"
Write-Host "Restart your agent, then add templates/AGENTS.md to your Unreal project."
