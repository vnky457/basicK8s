targetScope = 'subscription'

param location string = 'eastus'
resource azbicepresourcegroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: 'bicepDemoRG'
  location: location
}
