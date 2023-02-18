# Set the tenant ID of your AAD tenant
$tenantId = "your_tenant_id"

# Set the name of the user
$userName = "jane.doe@example.com"

# Get the user object
$user = Get-AzADUser -UserPrincipalName $userName -TenantId $tenantId

# Delete the user
Remove-AzADUser -ObjectId $user.ObjectId -TenantId $tenantId
