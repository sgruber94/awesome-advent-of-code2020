$datapath = ".\input.txt"
$debugfalse = $false
$debugtrue = $false
$rawdata = Get-Content -Path $datapath
$passports = $validpassports = @()
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
$passcheck1 = $passports | Where-Object { ($null -ne $_.byr) -and ($null -ne $_.iyr) -and ($null -ne $_.eyr) -and ($null -ne $_.hgt) -and ($null -ne $_.hcl) -and ($null -ne $_.ecl) -and ($null -ne $_.pid) }

$valideyecolor = @("amb", "blu", "brn", "gry", "grn", "hzl", "oth")
foreach ($pass in $passcheck1) {
    $iyrvalid = $eyrvalid = $byrvalid = $hgtvalid = $hclvalid = $pidvalid = $eclvalid = $false

    if ( ($pass.byr -match '[0-9]{4}') -and ($pass.byr -ge 1920) -and ($pass.byr -le 2002)) {
        # Birthday is a 4 digit and at least 1920 and at most 2002
        $byrvalid = $true
    }
    if ( ($pass.iyr -match '[0-9]{4}') -and ($pass.iyr -ge 2010) -and ($pass.iyr -le 2020)) {
        # four digits; at least 2010 and at most 2020.
        $iyrvalid = $true
    }
    if ( ($pass.eyr -match '[0-9]{4}') -and ($pass.eyr -ge 2020) -and ($pass.eyr -le 2030)) {
        # four digits; at least 2020 and at most 2030.
        $eyrvalid = $true
    }
    if ( $pass.hgt -match "^(1([5-8][0-9]|9[0-3])cm)|((59|6[0-9]|7[0-6])in)$") {
        #  a number followed by either cm or in:
        $hgtvalid = $true
    }
    if (( $pass.hcl -match '#[0-9a-fA-F]{6}$') -and ($pass.hcl.startswith("#")) -and ($pass.hcl.Length -match 7)) { $hclvalid = $true }
    if ( $valideyecolor -contains $pass.ecl) { $eclvalid = $true }
    if (( $pass.pid -match '[0-9]{9}') -and ($pass.pid.Length -match 9)) {
        # four digits; at least 2020 and at most 2030.
        $pidvalid = $true
    }
    if ( $byrvalid -and $iyrvalid -and $eyrvalid -and $hgtvalid -and $hclvalid -and $eclvalid -and $pidvalid) {
        $validpassports += $pass
        if($debugtrue){
            Write-Host "-----"
            Write-Host $pass
            Write-Host  $byrvalid  $pass.byr
            Write-Host  $iyrvalid  $pass.iyr
            Write-Host  $eyrvalid  $pass.eyr
            Write-Host  $hgtvalid  $pass.hgt
            Write-Host  $hclvalid  $pass.hcl $pass.hcl.Length
            Write-Host  $eclvalid  $pass.ecl
            Write-Host  $pidvalid  $pass.pid $pass.pid.Length
            Write-Host "-----"
        }
    }else {
        if($debugfalse){
            Write-Host "-----"
            Write-Host  $byrvalid  $pass.byr
            Write-Host  $iyrvalid  $pass.iyr
            Write-Host  $eyrvalid  $pass.eyr
            Write-Host  $hgtvalid  $pass.hgt
            Write-Host  $hclvalid  $pass.hcl
            Write-Host  $eclvalid  $pass.ecl
            Write-Host  $pidvalid  $pass.pid $pass.pid.Length
            Write-Host "-----"
        }
    }
}
$validpassportscount = $validpassports.count + 1
Write-Host "Valid passports: " $validpassportscount