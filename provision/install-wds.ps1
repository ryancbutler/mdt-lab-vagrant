Install-WindowsFeature wds-deployment -includemanagementtools
wdsutil /initialize-server /remInst:"C:\remInstall"
Start-Service "WDSServer"
wdsutil /Set-server /UseDhcpPorts:No /DhcpOption60:Yes /AnswerClients:All
wdsutil /Set-Server /PxepromptPolicy /New:OptOut /known:OptOut
Import-WdsBootImage -Path "C:\Hydration\boot\LiteTouchPE_x64.wim"