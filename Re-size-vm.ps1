# First, login to your Azure account
Connect-AzAccount

# Get the virtual machine you want to resize
$vm = Get-AzVM -ResourceGroupName "myResourceGroup" -Name "myVM"

# Set the new size for the virtual machine
$vm.HardwareProfile.VmSize = "Standard_B2s"

# Update the virtual machine with the new size
Update-AzVM -VM $vm -ResourceGroupName "myResourceGroup"
