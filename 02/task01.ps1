$inputs = Get-Content -Path .\input.txt
foreach ($passwd in $inputs) {
    $split = $passwd.Split("-")
    $leastnum = $split[0]
    $restsplit = $split[1].Split()
    $maxnum = $restsplit[0]
    $selectedchar = $restsplit[1].Replace(":", "")
    $password = $restsplit[2].ToCharArray()
    $charcount = 0
    foreach($char in $password)
    {
        if($char -eq $selectedchar)
        {
            $charcount = $charcount + 1
        }
    }
    if(($charcount -le $maxnum) -and ($charcount -ge $leastnum) ){
        $resultnumber = $resultnumber + 1
        Write-Host "$leastnum|$maxnum|$selectedchar|$password| $charcount" -ForegroundColor Green
    }else {
        Write-Host "$leastnum|$maxnum|$selectedchar|$password| $charcount" -ForegroundColor Red
    }
}
Write-Host "$resultnumber of $($inputs.count)"