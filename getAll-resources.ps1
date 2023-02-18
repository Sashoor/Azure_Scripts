# Set the subscription to use
Select-AzureSubscription -SubscriptionId "your_subscription_id"
# Replace "your_subscription_id" with the actual subscription ID.

# Get a list of all resources in the subscription
Get-AzResource

# To filter the results by resource type, you can use the -ResourceType parameter. For example, to list all of the virtual machines in the subscription, you can use the following command:

Get-AzResource -ResourceType "Microsoft.Compute/virtualMachines"



# You can also use the -ResourceGroupName parameter to list the resources in a specific resource group. For example:
# Replace "myResourceGroup" with the actual name of your resource group.

Get-AzResource -ResourceGroupName "myResourceGroup"



