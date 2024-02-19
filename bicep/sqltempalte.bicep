param location string
param pBicepDemoSqlServer string 
param pSqlServerDatabase string 

resource bicepDemoSqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: pBicepDemoSqlServer
  location: location
  properties: {
    administratorLogin: 'tstdemo'
    administratorLoginPassword: 'Tst@123456'
  }
}

resource sqlServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-02-01-preview' = {
  parent: bicepDemoSqlServer
  name: 'firewallRules-demoBicep'
  properties: {
    startIpAddress: '1.1.1.1'
    endIpAddress: '1.1.1.1'
  }
}


resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
  parent: bicepDemoSqlServer
  name: pSqlServerDatabase
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: '2147483648'
    requestedServiceObjectiveName: 'Basic'
  }
}
