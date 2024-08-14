# Azure Virtual Network - Terraform Module

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)
[![Terraform Registry](https://img.shields.io/badge/Terraform-registry-blueviolet.svg?logo=terraform)](https://registry.terraform.io/modules/aztfm/virtual-network/azurerm/)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/aztfm/terraform-azurerm-virtual-network?label=Release)

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/aztfm/terraform-azurerm-virtual-network?quickstart=1)

## :gear: Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 4.x.x       | >= 1.3.x          | >= 3.58.0       |
| >= 3.x.x       | >= 1.3.x          | >= 3.28.0       |
| >= 2.x.x       | >= 0.13.x         | >= 2.36.0       |
| >= 1.x.x       | >= 0.13.x         | >= 2.8.0        |

## :memo: Usage

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "resource-group"
  location = "Spain Central"
}

module "virtual_network" {
  source              = "aztfm/virtual-network/azurerm"
  version             = ">=4.0.0"
  name                = "virtual-network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
  subnets = [{
    name             = "subnet"
    address_prefixes = ["10.0.0.0/24"]
  }]
}
```

Reference to more [examples](https://github.com/aztfm/terraform-azurerm-virtual-network/tree/main/examples).

<!-- BEGIN_TF_DOCS -->
## :arrow_forward: Parameters

The following parameters are supported:

| Name | Description | Type | Default | Required |
| ---- | ----------- | :--: | :-----: | :------: |
|name|The name of the virtual network.|`string`|n/a|yes|
|resource\_group\_name|The name of the resource group in which to create the virtual network.|`string`|n/a|yes|
|location|The location/region where the virtual network is created.|`string`|n/a|yes|
|tags|A mapping of tags to assign to the resource.|`map(string)`|`{}`|no|
|address\_space|The address space that is used in the virtual network. More than one address space can be provisioned.|`list(string)`|n/a|yes|
|dns\_servers|List of IP addresses of DNS servers.|`list(string)`|`[]`|no|
|ddos\_protection\_plan\_id|The ID of DDoS Protection Plan.|`string`|`null`|no|
|bgp\_community|The BGP community attribute in format `<as-number>:<community-value>`. The as-number segment is the Microsoft ASN, which is always 12076 for now.|`string`|`null`|no|
|subnets|List of objects that represent the configuration of each subnet.|`list(object({}))`|`[]`|no|

The `subnets` supports the following:

| Name | Description | Type | Default | Required |
| ---- | ----------- | :--: | :-----: | :------: |
|name|The name of the subnet.|`string`|n/a|yes|
|address\_prefixes|The address prefix/es to use for the subnet.|`list(string)`|n/a|yes|
|service\_endpoints|The list of Service endpoints to associate with the subnet. Possible values include: `Microsoft.AzureActiveDirectory`, `Microsoft.AzureCosmosDB`, `Microsoft.ContainerRegistry`, `Microsoft.EventHub`, `Microsoft.KeyVault`, `Microsoft.ServiceBus`, `Microsoft.Sql`, `Microsoft.Storage` and `Microsoft.Web`.|`string`|`null`|no|
|delegation|The name of service to delegate to. Possible values include: `GitHub.Network/networkSettings`, `Microsoft.ApiManagement/service`, `Microsoft.Apollo/npu`, `Microsoft.App/environments`, `Microsoft.App/testClients`, `Microsoft.AVS/PrivateClouds`, `Microsoft.AzureCosmosDB/clusters`, `Microsoft.BareMetal/AzureHostedService`, `Microsoft.BareMetal/AzureVMware`, `Microsoft.BareMetal/CrayServers`, `Microsoft.Batch/batchAccounts`, `Microsoft.CloudTest/hostedpools`, `Microsoft.CloudTest/images`, `Microsoft.CloudTest/pools`, `Microsoft.Codespaces/plans`, `Microsoft.ContainerInstance/containerGroups`, `Microsoft.ContainerService/managedClusters`, `Microsoft.Databricks/workspaces`, `Microsoft.DBforMySQL/flexibleServers`, `Microsoft.DBforMySQL/servers`, `Microsoft.DBforMySQL/serversv2`, `Microsoft.DBforPostgreSQL/flexibleServers`, `Microsoft.DBforPostgreSQL/serversv2`, `Microsoft.DBforPostgreSQL/singleServers`, `Microsoft.DelegatedNetwork/controller`, `Microsoft.DevCenter/networkConnection`, `Microsoft.DocumentDB/cassandraClusters`, `Microsoft.Fidalgo/networkSettings`, `Microsoft.HardwareSecurityModules/dedicatedHSMs`, `Microsoft.Kusto/clusters`, `Microsoft.LabServices/labplans`, `Microsoft.Logic/integrationServiceEnvironments`, `Microsoft.MachineLearningServices/workspaces`, `Microsoft.Netapp/volumes`, `Microsoft.Network/dnsResolvers`, `Microsoft.Orbital/orbitalGateways`, `Microsoft.PowerPlatform/enterprisePolicies`, `Microsoft.PowerPlatform/vnetaccesslinks`, `Microsoft.ServiceFabricMesh/networks`, `Microsoft.ServiceNetworking/trafficControllers`, `Microsoft.Singularity/accounts/networks`, `Microsoft.Singularity/accounts/npu`, `Microsoft.Sql/managedInstances`, `Microsoft.StoragePool/diskPools`, `Microsoft.StreamAnalytics/streamingJobs`, `Microsoft.Synapse/workspaces`, `Microsoft.Web/hostingEnvironments`, `Microsoft.Web/serverFarms`, `NGINX.NGINXPLUS/nginxDeployments`, `PaloAltoNetworks.Cloudngfw/firewalls` and `Qumulo.Storage/fileSystems`.|`string`|`null`|no|
|private\_endpoint\_network\_policies\_enabled|Enable or Disable network policies for the private link endpoint on the subnet. Conflicts with `private_link_service_network_policies_enabled`.|`bool`|`false`|no|
|private\_link\_service\_network\_policies\_enabled|Enable or Disable network policies for the private link service on the subnet. Conflicts with `private_endpoint_network_policies_enabled`.|`bool`|`false`|no|

## :arrow_backward: Outputs

The following outputs are exported:

| Name | Description | Sensitive |
| ---- | ----------- | :-------: |
|id|The virtual network configuration ID.|no|
|guid|The GUID of the virtual network.|no|
|name|The name of the virtual network.|no|
|resource_group_name|The name of the resource group in which to create the virtual network.|no|
|location|The location/region where the virtual network is created.|no|
|tags|The tags assigned to the resource.|no|
|address_space|The list of address spaces used by the virtual network.|no|
|dns_servers|The list of DNS servers used by the virtual network.|no|
|ddos_protection_plan|Block containing configuration of ddos protection plan.|no|
|subnets|Blocks containing configuration of each subnet.|no|
<!-- END_TF_DOCS -->
