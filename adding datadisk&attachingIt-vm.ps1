First, create a new data disk:

$diskName = "DataDisk"
$diskSize = "100GB"
$diskType = "Standard_LRS"

New-AzureRmDisk -DiskName $diskName -DiskSizeGB $diskSize -SkuName $diskType

Next, attach the data disk to a VM:

$vmName = "MyVM"
$disk = Get-AzureRmDisk -DiskName $diskName

Add-AzureRmVMDataDisk -VM $vmName -Name $disk.Name -CreateOption Attach -ManagedDiskId $disk.Id -Lun 0

Finally, initialize the data disk on the VM:

Restart-AzureRmVM -Name $vmName -ResourceGroupName $vm.ResourceGroupName

Invoke-Command -ComputerName $vmName -ScriptBlock {

$disk = Get-WmiObject -Class Win32_DiskDrive | Where-Object {$.Model -match $diskName}
$diskSignature = $disk.Signature
$partitions = Get-WmiObject -Class Win32_DiskPartition | Where-Object {$.Signature -eq $diskSignature}
$partition = $partitions[0]
$diskPartition = Get-WmiObject -Class Win32_LogicalDiskToPartition | Where-Object {$_.Antecedent -eq $partition.__Path}
$diskNumber = $diskPartition.Dependent.split("#")[1]

Initialize-Disk -Number $diskNumber -PartitionStyle MBR
New-Partition -DiskNumber $diskNumber -UseMaximumSize -AssignDriveLetter
Format-Volume -DriveLetter "D" -FileSystem NTFS -Confirm:$false

}