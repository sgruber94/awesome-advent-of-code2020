$inputs = Get-Content -Path .\input.txt
foreach ($value in $inputs) {
    foreach ($a in $inputs) {
        $add = [int]$a + [int]$value
        if ($add -eq 2020) {
            $multiple = [int]$a * [int]$value
            Write-Host "Values are $a * $value and result is $multiple" -ForegroundColor Red
            break;
        }
    }
}