$datapath = ".\input.txt"
$rawdata = Get-Content -Path $datapath
$passports = @()
$passport = New-Object -TypeName psobject
foreach ($line in $rawdata) {
    if ($line.Length -gt 0) {
        $split = $line.Split(" ")
        foreach ($s in $split) {
            $s2 = $s.Split(":") 
            $passport | Add-Member -Name $s2[0] -Value $s2[1] -MemberType NoteProperty
        }
    }
    else {
        $passports += $passport
        $passport = New-Object -TypeName psobject
    }
}
$valids = $passports | Where-Object { ($null -ne $_.byr) -and ($null -ne $_.iyr) -and ($null -ne $_.eyr) -and ($null -ne $_.hgt) -and ($null -ne $_.hcl) -and ($null -ne $_.ecl) -and ($null -ne $_.pid) }
$validcounts = $valids.count + 1
Write-Host $validcounts
