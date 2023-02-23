# Authenticate to Azure and select all subscriptions
Connect-AzAccount
$subIds = Get-AzSubscription | Select-Object -ExpandProperty SubscriptionId

# Loop through all subscriptions and find user permissions
foreach ($subId in $subIds) {
  Set-AzContext -SubscriptionId $subId
  $roles = Get-AzRoleDefinition | Select-Object -ExpandProperty Name
  foreach ($role in $roles) {
    $roleAssignments = Get-AzRoleAssignment -RoleDefinitionName $role
    foreach ($assignment in $roleAssignments) {
      Write-Output "Subscription ID: $($assignment.Scope.Split('/')[2])"
      Write-Output "Role: $($role)"
      Write-Output "User or Group: $($assignment.DisplayName)"
      Write-Output "Object ID: $($assignment.ObjectId)"
      Write-Output ""
    }
  }
}
