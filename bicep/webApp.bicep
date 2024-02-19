param pAppPlanBicepDemo string 
param pwebAppBicepDemo string 
param location string
param pInstrumentationKey string

resource appPlanBicepDemo 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: pAppPlanBicepDemo
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webAppBicepDemo 'Microsoft.Web/sites@2021-01-01' = {
  name: pwebAppBicepDemo
  location: location
  properties: {
    serverFarmId: appPlanBicepDemo.id
    siteConfig: {
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMATIONKEY'
          value : pInstrumentationKey
        }
      ]
    }
  }
}

