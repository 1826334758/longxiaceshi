$ErrorActionPreference = 'Continue'

function Get-RecycleBinVisibleItems {
    $shell = New-Object -ComObject Shell.Application
    $rb = $shell.Namespace(10)
    if ($null -eq $rb) {
        throw 'Recycle Bin not available.'
    }
    return @($rb.Items())
}

function Get-RecycleBinVisibleCount {
    return @(Get-RecycleBinVisibleItems).Count
}

$before = Get-RecycleBinVisibleCount
Write-Output "VISIBLE_BEFORE=$before"

$clearError = $null
try {
    Clear-RecycleBin -Force -ErrorAction Stop
    Write-Output 'CLEAR_CMD=OK'
} catch {
    $clearError = $_
    Write-Output ('CLEAR_CMD=ERROR: ' + $_.Exception.Message)
}

Start-Sleep -Seconds 2
$after = Get-RecycleBinVisibleCount
Write-Output "VISIBLE_AFTER=$after"

if ($after -eq 0) {
    Write-Output 'RESULT=SUCCESS'
    exit 0
}

# Fallback: try deleting visible Shell items one by one.
$items = Get-RecycleBinVisibleItems
foreach ($item in $items) {
    try {
        $item.InvokeVerb('delete') | Out-Null
    } catch {
    }
}

Start-Sleep -Seconds 2
$afterFallback = Get-RecycleBinVisibleCount
Write-Output "VISIBLE_AFTER_FALLBACK=$afterFallback"

if ($afterFallback -eq 0) {
    Write-Output 'RESULT=SUCCESS_AFTER_FALLBACK'
    exit 0
}

if ($null -ne $clearError) {
    Write-Output ('RESULT=FAILED_WITH_CMD_ERROR')
    exit 2
}

Write-Output 'RESULT=FAILED_NOT_EMPTY'
exit 3
