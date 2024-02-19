param pAppPlanBicepDemo string = 'mybicep-dev-eus-rg-p1'
param pwebAppBicepDemo string =  'mybicep-dev-eus-webapp'
param pappInsightsBicepDemo string = 'mybicep-dev-eus-rg-app-insight'
param location string = 'eastus'

param pBicepDemoSqlServer string = 'mybicep-dev-eus-dbsvr'
param pSqlServerDatabase string = 'mybicep-dev-eus-db'



module appServiceMainBicep 'webApp.bicep' = {
  name: 'appServiceMainPlan'
  params: {
    pAppPlanBicepDemo: pAppPlanBicepDemo
    pwebAppBicepDemo: pwebAppBicepDemo
    location: location
    pInstrumentationKey: appInsightsBicep.outputs.oInstrumentationKey
  }
}

module appInsightsBicep 'appInsight.bicep' = {
  name: 'appInsightsBicepDemo'
  params: {
    location: location
    pappInsightsBicepDemo: pappInsightsBicepDemo
  }
}

module SQLDatabaseBicep 'sqltempalte.bicep' = {
  name: 'SQLDatabaseBicep'
  params: {
    location: location
    pBicepDemoSqlServer: pBicepDemoSqlServer
    pSqlServerDatabase:  pSqlServerDatabase
  }
}
