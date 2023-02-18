# Set the tenant ID of your AAD tenant
$tenantId = "your_tenant_id"

# Set the name of the new user
$userName = "jane.doe@example.com"

# Set the display name of the new user
$displayName = "Jane Doe"

# Set the password for the new user
$password = "P@ssw0rd!"

# Create the new user
New-AzADUser -AccountEnabled $true -DisplayName $displayName -Password $password -UserPrincipalName $userName -TenantId $tenantId
