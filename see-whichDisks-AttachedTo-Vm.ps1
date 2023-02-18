# To see which disks are attached to virtual machines in Azure

Get-AzureRmDisk | Where-Object { $_.DiskState -eq "Attached" }

# This will return a list of all disks in Azure that are currently attached to virtual machines. You can further filter this list by specifying a resource group or disk name, for example:

Get-AzureRmDisk -ResourceGroupName "MyResourceGroup" | Where-Object { $_.DiskState -eq "Attached" }

Get-AzureRmDisk | Where-Object { $.DiskState -eq "Attached" -and $.Name -like "MyDisk" }

# You can also view the disks attached to a specific virtual machine by using the Get-AzureRmVM cmdlet, like this:

$vm = Get-AzureRmVM -Name "MyVM" -ResourceGroupName "MyResourceGroup"
$vm.DataDisks

# This will return a list of all data disks attached to the virtual machine "MyVM".