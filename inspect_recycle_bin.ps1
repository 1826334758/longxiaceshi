$ErrorActionPreference = 'Continue'
$p = "$env:SystemDrive\$Recycle.Bin\S-1-5-21-2884082655-2602025281-1984951734-1001"
Get-ChildItem -LiteralPath $p -Force | ForEach-Object {
  Write-Output ("--- " + $_.Name)
  try {
    Get-Content -LiteralPath $_.FullName -Raw -ErrorAction Stop
  } catch {
    Write-Output $_.Exception.Message
  }
}
