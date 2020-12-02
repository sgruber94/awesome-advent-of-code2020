$inputs = Get-Content -Path .\input.txt
foreach ($passwd in $inputs) {
    $split = $passwd.Split("-")
    [int]$leastnum = $split[0]-1
    $restsplit = $split[1].Split()
    [int]$maxnum = $restsplit[0]-1
    [char]$selectedchar = $restsplit[1].Replace(":", "")
    $password = $restsplit[2].ToCharArray()
    if((($password[$leastnum] -match $selectedchar) -and ($password[$maxnum] -notmatch $selectedchar))-or(($password[$leastnum] -notmatch $selectedchar) -and ($password[$maxnum] -match $selectedchar))){
        $resultnumber = $resultnumber + 1
        Write-Host "$leastnum|$maxnum|$selectedchar|$($password[$leastnum])|$($password[$maxnum])|END" -ForegroundColor Green
    }else {
        Write-Host "$leastnum|$maxnum|$selectedchar|$($password[$leastnum])|$($password[$maxnum])|END" -ForegroundColor Red
    }
}
Write-Host "Valid: $resultnumber of $($inputs.count)"