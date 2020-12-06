$datapath = ".\input.txt"
$rawdata = Get-Content -Path $datapath
$groups = $group =@()
foreach($line in $rawdata){
    if ($line.Length -gt 0) {
        #group questions
        $group +=  $line
    }
    else {
        ##blank line
        $stringgroup = $group -Join ""
        $groups += $stringgroup
        $group =@()
    }
}
$stringgroup = $group -Join ""
$groups += $stringgroup #( add last one)
$sumuniquechars = $sumchars = 0
foreach($group in $groups)
{
    $chargroup = $group.ToCharArray()
    $chargroupcount = $chargroup.count 
    $unique = ($chargroup | Sort-Object -Unique).Count
    $sumuniquechars = $sumuniquechars + $unique # Count all the Unique Chars / Answers
    $sumchars = $sumchars + $chargroupcount # Count all the Chars
}
Write-Host  "$sumuniquechars answers are unique from $sumchars given answers"
