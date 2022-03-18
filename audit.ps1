$username='donley.gustave'
$server='atl-dc-corp01.corp.pps.io'
$props="EmployeeID", "EmployeeType", "EmployeeNumber", "SamAccountName", "DistinguishedName", "CN", "CanonicalName", "Company", "Department", "Division", "Enabled", "Title", "EmailAddress", "Manager", "Created", "Modified", "LastLogonDate", "LastBadPasswordAttempt", "PasswordExpired", "PasswordLastSet", "PasswordNeverExpires", "PasswordNotRequired", "LockedOut", "AccountLockoutTime", "logonCount", "AccountExpirationDate"
  
#Clear Screen
clear

#Get AD Details
Get-ADuser $username -properties * -Server $server| select $props


#Get AD Group Memberships
Get-ADPrincipalGroupMembership -Identity $username -Server $server | Sort-Object name | Format-Table name