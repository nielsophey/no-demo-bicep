targetScope = 'subscription'

param resourceGroupName string
param resourceGroupLocation string
param resourceTags object

resource newRG 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  tags: resourceTags
}
