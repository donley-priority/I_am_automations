Import-Module ActiveDirectory 
$csv = Import-Csv C:\Users\donley.gustave\Documents\EmployeeType.csv
foreach ($name in $csv) {

$username= $name.name
$server='atl-dc-corp01.corp.pps.io'
$emptype = "EmployeeType"
$ctr = "CTR"
$fte = "FTE" 
#$props="EmployeeID", "EmployeeType", "EmployeeNumber", "SamAccountName", "DistinguishedName", "CN", "CanonicalName", "Company", "Department", "Division", "Enabled", "Title", "EmailAddress", "Manager", "Created", "Modified", "LastLogonDate", "LastBadPasswordAttempt", "PasswordExpired", "PasswordLastSet", "PasswordNeverExpires", "PasswordNotRequired", "LockedOut", "AccountLockoutTime", "logonCount", "AccountExpirationDate"
  
#Clear Screen
clear

#Get AD Details
Get-ADuser $username -properties * -Server $server| select $emptype | foreach-object {  
#if ($emptype  -and $username -contains 'ctr.'){Set-ADuser  $username -EmployeeID $ctr}
#if ($emptype -and $username -notcontains 'ctr.'){Set-ADuser $username -EmployeeType $fte}
if ($emptype  -and $username -contains 'ctr.'){Set-ADuser  $username -Replace @{employeeType = $ctr}}
if ($emptype -and $username -notcontains 'ctr.'){Set-ADuser $username -Replace @{employeeType = $fte}}
}

}


Get-ADuser $username -properties * -Server $server| select $emptype
