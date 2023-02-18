Set the resource group name and VM name
$resourceGroupName = "myResourceGroup"
$vmName = "myVM"

Remove the VM
Remove-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -Force

Confirm that the VM has been removed
if (Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName -ErrorAction Ignore) {
  Write-Output "Failed to delete VM: $vmName"
}
else {
  Write-Output "Successfully deleted VM: $vmName"
}