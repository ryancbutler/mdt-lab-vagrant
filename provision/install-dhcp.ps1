Install-WindowsFeature DHCP -IncludeManagementTools
netsh dhcp add securitygroups
Restart-Service dhcpserver
start-sleep -Seconds 3

#Todo Doublehop scenerio which causes this to fail
#Add-DhcpServerInDC

Set-ItemProperty -Path "registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12" -Name ConfigurationState -Value 2

# [string]$userName = "mylab.com\vagrant"
# [string]$userPassword = "vagrant"
# [securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force

# [pscredential]$credOject = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)

# Set-DhcpServerDnsCredential -Credential $credOject -ComputerName "mdt01.mylab.com"

Add-DhcpServerv4Scope -name "main" -StartRange "192.168.56.101" -EndRange "192.168.56.200" -SubnetMask "255.255.255.0" -State Active

Set-DhcpServerv4OptionValue -ScopeId "192.168.56.0" -DnsServer "192.168.56.2" -DnsDomain "mylab.com"