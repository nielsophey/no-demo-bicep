targetScope = 'subscription'

param env string = 'dev'
param resLocation string = 'westeurope'

param resourceGroupNames array = [
  'management'
  'website'
  'network'
]

var resourceTags = {
  Environment: env
  Deployment: 'CI/CD'
}

module newResourceGroup 'module/rg-generic.bicep' = [for resourceGroupName in resourceGroupNames: {
  name: resourceGroupName
  params:{
    resourceGroupName: 'rg-${env}-${resourceGroupName}'
    resourceGroupLocation: resLocation
    resourceTags: resourceTags
  }
}]

module rgManagement 'management/management.bicep' = {
  name: resourceGroupNames[0]
  scope: resourceGroup('rg-${env}-${resourceGroupNames[0]}')
  params: {
    env: env
    resourceLocation: resLocation
    resourceTags: resourceTags
  }
}
