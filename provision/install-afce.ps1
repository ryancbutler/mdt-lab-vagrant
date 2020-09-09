

# make sure the Administrator has a password that meets the minimum Windows
# password complexity requirements (otherwise the AD will refuse to install).
echo 'Resetting the Administrator account password and settings...'
Get-LocalUser -Name "Administrator" | Enable-LocalUser

$AdminstratorPassword = ConvertTo-SecureString 'P@ssw0rd' -AsPlainText -Force
Set-LocalUser `
    -Name Administrator `
    -AccountNeverExpires `
    -Password $AdminstratorPassword `
    -PasswordNeverExpires:$true `
    -UserMayChangePassword:$true

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
wget -uri https://github.com/haavarstein/Automation-Framework-Community-Edition/archive/master.zip -OutFile C:\Windows\Temp\Master.zip
Expand-Archive -Path C:\Windows\Temp\Master.zip -DestinationPath C:\
ren "C:\Automation-Framework-Community-Edition-master" "C:\Source"