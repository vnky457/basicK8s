param pappInsightsBicepDemo string 
param location string

resource appInsightsBicepDemo 'Microsoft.Insights/components@2020-02-02' = {
  name: pappInsightsBicepDemo
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
  }
}

output oInstrumentationKey string = appInsightsBicepDemo.properties.InstrumentationKey
