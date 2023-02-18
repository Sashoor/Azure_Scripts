# Set the subscription that contains the VM
Select-AzureSubscription -SubscriptionId "your_subscription_id"

# Set the resource group that contains the VM
$resourceGroupName = "your_resource_group_name"

# Set the name of the VM
$vmName = "your_vm_name"

# Set the name of the storage account where the boot diagnostic data should be stored
$storageAccountName = "your_storage_account_name"

# Enable boot diagnostics for the VM and specify the storage account
Set-AzVMBootDiagnostics -ResourceGroupName $resourceGroupName -VMName $vmName -StorageAccountName $storageAccountName -Enable

# Then we need to update the virtual machine
Update-AzVM -ResourceGroupName $ResourceGroupName -VM $Vm

# You can then use the Get-AzVMBootDiagnostics cmdlet to retrieve the boot diagnostic data for the VM. For example:
Get-AzVMBootDiagnostics -ResourceGroupName $resourceGroupName -VMName $vmName
