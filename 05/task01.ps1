$datapath = ".\input.txt"
$rawdata = Get-Content -Path $datapath
$seats = @()
$multiplier = 8
foreach($line in $rawdata)
{
    $row = $column = ""
    $firststring = $line.Substring(0,7) #determinate range of seat colummn
    $laststring =  $line.Substring(7,3) #determinate exact colummn
    $chararray1 =  $firststring.ToCharArray()
    $chararray2 =  $laststring.ToCharArray()
    foreach($char in $chararray1 ) {
        #F = Front
        #B = Back
        if($char -match "B") {
             $row += "1"
            }
        if($char -eq "F"){
            $row += "0"
        } 
    }
    #exact location    
    foreach($char in $chararray2) {
        #r = upper half +1
        #l = lower half 0
        if($char -eq "R") { $column += "1" }
        if($char -eq "L") { $column += "0" } 
    }
   $column= [convert]::ToInt32($column,2) #convert from Binary
   $row= [convert]::ToInt32($row,2) #convert from Binary
   $seat = (($row * $multiplier)  + $column)
   $seats += $seat
}
$highestseat = $seats | Sort-Object -Descending
Write-Host "Highest Seat : $($highestseat[0])"