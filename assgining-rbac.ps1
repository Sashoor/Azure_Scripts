# Set the subscription to use
Select-AzureSubscription -SubscriptionId "your_subscription_id"

# Set the name of the user
$userName = "jane.doe@example.com"

# Get the user object
$user = Get-AzADUser -UserPrincipalName $userName

# Assign the "Reader" role to the user
New-AzRoleAssignment -ObjectId $user.Id -RoleDefinitionName "Reader"
