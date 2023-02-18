# Set the resource group name and VM name
$resourceGroupName = "myResourceGroup"
$vmName = "myVM"

Get the VM
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

Stop the VM
Stop-AzVM-ResourceGroupName $resourceGroupName -Name $vmName -Force

Wait for the VM to be stopped
while ($vm.PowerState -eq "VM running") {
  Start-Sleep -Seconds 10
  $vm = Get-AzVM-ResourceGroupName $resourceGroupName -Name $vmName
}

Confirm that the VM has been stopped
if ($vm.PowerState -eq "VM deallocated") {
  Write-Output "Successfully stopped VM: $vmName"
}
else {
  Write-Output "Failed to stop VM: $vmName"
}