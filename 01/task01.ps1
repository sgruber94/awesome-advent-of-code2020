$inputs = Get-Content -Path .\input.txt
$a1 = $inputs
foreach($value in $inputs)
{
    foreach($a in $a1)
    {
        $add = [int]$a + [int]$value
        if ($add -eq 2020) {
            Write-Host "$a + $value" -ForegroundColor Red 
            $multiple = [int]$a * [int]$value
            Write-Host "Values are $a * $value and result is $multiple" -ForegroundColor Red
            break;
        }
    }
}