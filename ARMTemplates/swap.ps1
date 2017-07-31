Param(
	[string] $Name
	
)

if(!(Get-Module Azure) -or !(Get-Module AzureRM))
{
	Import-Module Azure
	Import-Module AzureRM
}

#Swap backend first and then frontend
Switch-AzureRmWebAppSlot -ResourceGroupName $Name -SourceSlot "${Name}Api-staging" -DestinationSlot $Name  -Verbose
Switch-AzureRmWebAppSlot -ResourceGroupName $Name -SourceSlot "${Name}-staging" -DestinationSlot $Name -Verbose

Write-Host "Done"