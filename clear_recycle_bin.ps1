$ErrorActionPreference = 'Stop'
$shell = New-Object -ComObject Shell.Application
$rb = $shell.Namespace(10)
if ($null -eq $rb) {
  Write-Error 'Recycle Bin not available'
  exit 1
}
$items = @($rb.Items())
if ($items.Count -eq 0) {
  Write-Output 'EMPTY'
  exit 0
}
foreach ($item in $items) {
  try {
    $item.InvokeVerb('delete') | Out-Null
  } catch {
  }
}
Start-Sleep -Seconds 2
$remaining = @($rb.Items()).Count
Write-Output "REMAINING=$remaining"
if ($remaining -gt 0) {
  exit 2
}
