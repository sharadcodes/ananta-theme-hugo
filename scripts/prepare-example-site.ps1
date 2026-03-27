# Links exampleSite/themes/ananta-theme-hugo -> repo root (theme layouts/static).
# Required before `hugo` from exampleSite/. Safe to re-run.
$ErrorActionPreference = "Stop"
$root = Resolve-Path (Join-Path $PSScriptRoot "..")
$themesDir = Join-Path $root "exampleSite\themes"
$name = "ananta-theme-hugo"
$link = Join-Path $themesDir $name
New-Item -ItemType Directory -Path $themesDir -Force | Out-Null
if (Test-Path $link) {
  Remove-Item $link -Force -Recurse
}
cmd /c mklink /J "$link" "$root" | Out-Null
Write-Host "Linked $link -> $root"
