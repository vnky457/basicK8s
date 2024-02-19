
param location string = 'eastus'

resource mybicepasp1 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: 'mybicep-dev-eus-rg-asp1'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource bicepWebApp 'Microsoft.Web/sites@2021-01-15' = {
  name: 'mybicep-dev-eus-rg-as'
  location: location
  properties: {
    serverFarmId: mybicepasp1.id
  }
}


// resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
//   name: 'mybicep-dev-eus-rg-asp2-linux'
//   kind: 'linux'
//   properties: {
//     reserved: true
//   }
//   location: location
//   sku: {
//     name: 'F1'
//     capacity: 1
//   }
// }
