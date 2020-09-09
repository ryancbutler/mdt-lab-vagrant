Invoke-WebRequest -Uri "https://download.microsoft.com/download/3/0/6/306AC1B2-59BE-43B8-8C65-E141EF287A5E/KB4564442/MDT_KB4564442.exe" -OutFile "C:\tmp\MDT_KB4564442.exe"
C:\tmp\MDT_KB4564442.exe /extract:"c:\tmp" /quiet
Start-Sleep -Seconds 5
copy-item "C:\tmp\x64\microsoft.bdd.utility.dll" "C:\Program Files\Microsoft Deployment Toolkit\Templates\Distribution\Tools\x64\"
copy-item "C:\tmp\x86\microsoft.bdd.utility.dll" "C:\Program Files\Microsoft Deployment Toolkit\Templates\Distribution\Tools\x86\"
copy-item "C:\tmp\x64\microsoft.bdd.utility.dll" "C:\Hydration\Tools\x64\"
copy-item "C:\tmp\x86\microsoft.bdd.utility.dll" "C:\Hydration\Tools\x86\"

Import-Module "C:\Program Files\Microsoft Deployment Toolkit\bin\MicrosoftDeploymentToolkit.psd1"

Remove-PSDrive -Name "DS001" -Force -ErrorAction SilentlyContinue
New-PSDrive -Name "DS001" -PSProvider "MDTProvider" -Root "C:\Hydration" -NetworkPath "\\$ENV:COMPUTERNAME\$Share" -Description "Hydration" | Add-MDTPersistentDrive

update-MDTDeploymentShare -path "DS001:" -Force