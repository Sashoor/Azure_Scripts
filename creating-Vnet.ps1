# Set the subscription to use
Select-AzureSubscription -SubscriptionId "your_subscription_id"

# Set the resource group to use
$resourceGroupName = "your_resource_group_name"

# Set the name of the VNet
$vnetName = "your_vnet_name"

# Set the address space of the VNet
$addressSpace = "10.0.0.0/16"

# Set the location of the VNet
$location = "your_location"

# Create the VNet
New-AzVirtualNetwork -Name $vnetName -ResourceGroupName $resourceGroupName -Location $location -AddressPrefix $addressSpace
