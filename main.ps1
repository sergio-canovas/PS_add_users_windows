#Load CSV file with user and password to add as local users at Windows machine.
<#
    File exemple:
        Name; Password 
        demo;demo
        demo1;demo1
        demo2;demo2
#>

#Path of CSV
$ruta = $PSscriptroot/yourfile.csv
$fichero = Import-Csv $ruta -delimiter ";" 


#Set password for each user and add this account to Windows.
$fichero | ForEach-Object {
    $name = $_.Name
    $pass = $_.Password
    $pass = ConvertTo-SecureString $pass -AsPlainText -Force
    set-LocalUser -name $name -Password $pass
}
