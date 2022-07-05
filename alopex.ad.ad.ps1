Get-WindowsFeature "ser*-gui*","Web-Mgmt-Tools","wAS*","RSAT*","Ad-Dom*","Desktop-Experience","uSer*","Telnet-Client"|Install-WindowsFeature  -Verbose -IncludeAllSubFeature -IncludeManagementTools 
man Install-ADDSForest -Online
$admkw=read-host -Prompt "Adminkennwörtchen." -AsSecureString -Verbose
$Domänenname="alopex"
Import-Module ADDSDeployment -Verbose
Install-ADDSForest  -CreateDnsDelegation:$false -DatabasePath "C:\windows\NTDS" -DomainMode "WinThreshold" -DomainName "$Domänenname.local" `
					-DomainNetbiosName "$Domänenname" -ForestMode "WinThreshold" -InstallDns:$true -LogPath "C:\windows\NTDS" -NoRebootOnCompletion:$true `
					-SysvolPath "C:\windows\SYSVOL" -Force:$true -Verbose -SafeModeAdministratorPassword $admkw 
