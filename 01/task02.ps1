$inputs = Get-Content -Path .\input.txt
foreach ($val1 in $inputs) {
    foreach ($val2 in $inputs) {
        foreach ($val3 in $inputs) {
            $add = [int]$val1 + [int]$val2 + [int]$val3
            if ($add -eq 2020) {
                $multiple = [int]$val1 * [int]$val2 * [int]$val3
                Write-Host "Values are $val1 * $val2 * $val3 and result is $multiple" -ForegroundColor Red
                break;
            }
        }
    }
}