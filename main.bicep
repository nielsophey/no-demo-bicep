targetScope = 'subscription'

param env string = 'dev-auto'
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
