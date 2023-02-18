# Login to Azure account
Connect-AzAccount

# Select Azure subscription
Select-AzSubscription -SubscriptionId 126330c5-6970-41dd-adaa-8c15c9ef87a9

# Get all resources in the subscription
$resources = Get-AzResource

# Loop through each resource and delete it
foreach ($resource in $resources) {
  $resourceId = $resource.ResourceId
  Write-Output "Deleting resource $resourceId"
  Remove-AzResource -ResourceId $resourceId -Force
}

# Get all resource groups in the subscription
$resourceGroups = Get-AzResourceGroup

# Loop through each resource group and delete it
foreach ($resourceGroup in $resourceGroups) {
  $resourceGroupName = $resourceGroup.ResourceGroupName
  Write-Output "Deleting resource group $resourceGroupName"
  Remove-AzResourceGroup -Name $resourceGroupName -Force
}
