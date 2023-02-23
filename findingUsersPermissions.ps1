# Login to Azure
Connect-AzAccount

# Get all Azure subscriptions
$subscriptions = Get-AzSubscription

# Loop through each subscription
foreach ($subscription in $subscriptions) {
  # Set the current subscription context
  Set-AzContext -SubscriptionId $subscription.Id

  # Get all role assignments
  $roleAssignments = Get-AzRoleAssignment

  # Create an empty array to store user permissions
  $userPermissions = @()

  # Loop through each role assignment
  foreach ($roleAssignment in $roleAssignments) {
    # Check if the role assignment is for a user
    if ($roleAssignment.PrincipalType -eq "User") {
      # Create a hashtable to store the user's display name, email, and role definition name
      $user = @{
        DisplayName        = $roleAssignment.DisplayName
        Email              = $roleAssignment.SignInName
        RoleDefinitionName = $roleAssignment.RoleDefinitionName
      }

      # Add the user hashtable to the userPermissions array
      $userPermissions += New-Object PSObject -Property $user
    }
  }

  # Output the userPermissions array to a CSV file
  $userPermissions | Export-Csv -Path "C:\UsersPermissions.csv" -Append -NoTypeInformation
}
