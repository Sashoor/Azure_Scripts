To find all unattached disks in Azure with PowerShell, use the following command:

Get-AzureRmDisk | Where-Object {$_.DiskState -eq "Unattached"}

# This will return a list of all disks in Azure that are not currently attached to any virtual machines. You can further filter this list by specifying a resource group or disk name, for example:

Get-AzureRmDisk -ResourceGroupName "MyResourceGroup" | Where-Object {$_.DiskState -eq "Unattached"}

Get-AzureRmDisk | Where-Object {$.DiskState -eq "Unattached" -and $.Name -like "MyDisk"}

