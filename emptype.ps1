Import-Module ActiveDirectory 
$your_firstname = 'donley'
$your_lastname = 'gustave'
$filename = 'EmployeeType'
$csv = Import-Csv C:\Users\$your_firstname.$your_lastname\Documents\$filename.csv
foreach ($name in $csv) {

$username= $name.name
$server='atl-dc-corp01.corp.pps.io'
$emptype = "EmployeeType"
$ctr = "CTR"
$fte = "FTE" 

Get-ADuser $username -properties * -Server $server| select $emptype | foreach-object {  
if ($emptype -and $username -match 'ctr.'){Set-ADuser  $username -Replace @{employeeType = $ctr}}
else {Set-ADuser $username -Replace @{employeeType = $fte}}
}

}


Get-ADuser $username -properties * -Server $server| select $emptype
