# Set the subscription that contains the NSG to be deleted
Select-AzureSubscription -SubscriptionId "your_subscription_id"

# Set the resource group that contains the NSG to be deleted
$resourceGroupName = "your_resource_group_name"

# Set the name of the NSG to be deleted
$nsgName = "your_nsg_name"

# Delete the NSG
Remove-AzureRmNetworkSecurityGroup -ResourceGroupName $resourceGroupName -Name $nsgName
