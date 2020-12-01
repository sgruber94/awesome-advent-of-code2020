$inputs = Get-Content -Path .\input.txt
$a1 = $a2 = $inputs
foreach($val1 in $inputs)
{
    foreach($val2 in $a1)
    {
        foreach($val3 in $a2){
        $add = [int]$val1 + [int]$val2 + [int]$val3
        if ($add -eq 2020) {
            $multiple = [int]$val1 * [int]$val2 * [int]$val3
            Write-Host "Values are  [int]$val1 * [int]$val2 * [int]$val3 and result is $multiple" -ForegroundColor Red
            break;
        }
        }
        
    }
}