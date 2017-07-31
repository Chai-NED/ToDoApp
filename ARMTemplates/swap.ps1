Param(
	[string] $Name
	
)

if(!(Get-Module Azure) -or !(Get-Module AzureRM))
{
	Import-Module Azure
	Import-Module AzureRM
}

#Swap backend first and then frontend
Switch-AzureRmWebAppSlot -ResourceGroupName $Name -SourceSlotName "staging" -Name "${Name}api"  -Verbose
Switch-AzureRmWebAppSlot -ResourceGroupName $Name -SourceSlotName "staging" -Name $Name -Verbose

Write-Host "Done"