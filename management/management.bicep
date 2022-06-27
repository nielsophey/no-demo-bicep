targetScope = 'resourceGroup'

param env string = 'prod'
param resourceLocation string = 'westeurope'
param resourceTags object

resource myLogAnalytics 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: 'la-${env}-centralmgmt'
  location: resourceLocation
  tags: resourceTags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 7
  }
}
