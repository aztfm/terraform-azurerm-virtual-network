# Azure Virtual Network - Terraform Module

[devcontainer]: https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/aztfm/terraform-azurerm-virtual-network
[registry]: https://registry.terraform.io/modules/aztfm/virtual-network/azurerm/
[releases]: https://github.com/aztfm/terraform-azurerm-virtual-network/releases

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)
[![Terraform Registry](https://img.shields.io/badge/terraform-registry-blueviolet?logo=terraform&logoColor=white)][registry]
[![Dev Container](https://img.shields.io/badge/devcontainer-VSCode-blue?logo=linuxcontainers)][devcontainer]
[![License](https://img.shields.io/github/license/aztfm/terraform-azurerm-virtual-network)](LICENSE)
[![Last release](https://img.shields.io/github/v/release/aztfm/terraform-azurerm-virtual-network)][releases]

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/aztfm/terraform-azurerm-virtual-network?quickstart=1)

## :gear: Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 5.x.x       | >= 1.9.x          | >= 4.27.0       |
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
  version             = ">=5.0.0"
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
|encryption\_mode|The encryption mode for the virtual network. Possible values are 'AllowUnencrypted' or 'DropUnencrypted'.|`string`|`null`|no|
|subnets|List of objects that represent the configuration of each subnet.|`list(object({}))`|`[]`|no|

The `subnets` supports the following:

| Name | Description | Type | Default | Required |
| ---- | ------------| :--: | :-----: | :------: |
|name|The name of the subnet.|`string`|n/a|yes|
|address\_prefixes|The address prefix/es to use for the subnet.|`list(string)`|n/a|yes|
|default\_outbound\_access\_enabled|Enable default outbound access to the internet for the subnet.|`bool`|`false`|no|
|service\_endpoints|The list of Service endpoints to associate with the subnet. Possible values include: `Microsoft.AzureActiveDirectory`, `Microsoft.AzureCosmosDB`, `Microsoft.ContainerRegistry`, `Microsoft.EventHub`, `Microsoft.KeyVault`, `Microsoft.ServiceBus`, `Microsoft.Sql`, `Microsoft.Storage`, `Microsoft.Storage.Global` and `Microsoft.Web`.|`string`|`null`|no|
|delegation|The name of service to delegate to. Possible values include: `GitHub.Network/networkSettings`, `Informatica.DataManagement/organizations`, `Microsoft.ApiManagement/service`, `Microsoft.Apollo/npu`, `Microsoft.App/environments`, `Microsoft.App/testClients`, `Microsoft.AVS/PrivateClouds`, `Microsoft.AzureCosmosDB/clusters`, `Microsoft.BareMetal/AzureHostedService`, `Microsoft.BareMetal/AzureVMware`, `Microsoft.BareMetal/CrayServers`, `Microsoft.Batch/batchAccounts`, `Microsoft.CloudTest/hostedpools`, `Microsoft.CloudTest/images`, `Microsoft.CloudTest/pools`, `Microsoft.Codespaces/plans`, `Microsoft.ContainerInstance/containerGroups`, `Microsoft.ContainerService/managedClusters`, `Microsoft.Databricks/workspaces`, `Microsoft.DBforMySQL/flexibleServers`, `Microsoft.DBforMySQL/servers`, `Microsoft.DBforMySQL/serversv2`, `Microsoft.DBforPostgreSQL/flexibleServers`, `Microsoft.DBforPostgreSQL/serversv2`, `Microsoft.DBforPostgreSQL/singleServers`, `Microsoft.DelegatedNetwork/controller`, `Microsoft.DevCenter/networkConnection`, `Microsoft.DevOpsInfrastructure/pools`, `Microsoft.DocumentDB/cassandraClusters`, `Microsoft.Fidalgo/networkSettings`, `Microsoft.HardwareSecurityModules/dedicatedHSMs`, `Microsoft.Kusto/clusters`, `Microsoft.LabServices/labplans`, `Microsoft.Logic/integrationServiceEnvironments`, `Microsoft.MachineLearningServices/workspaces`, `Microsoft.Netapp/volumes`, `Microsoft.Network/applicationGateways`, `Microsoft.Network/dnsResolvers`, `Microsoft.Network/networkWatchers`, `Microsoft.Orbital/orbitalGateways`, `Microsoft.PowerAutomate/hostedRpa`, `Microsoft.PowerPlatform/enterprisePolicies`, `Microsoft.PowerPlatform/vnetaccesslinks`, `Microsoft.ServiceFabricMesh/networks`, `Microsoft.ServiceNetworking/trafficControllers`, `Microsoft.Singularity/accounts/networks`, `Microsoft.Singularity/accounts/npu`, `Microsoft.Sql/managedInstances`, `Microsoft.StoragePool/diskPools`, `Microsoft.StreamAnalytics/streamingJobs`, `Microsoft.Synapse/workspaces`, `Microsoft.Web/hostingEnvironments`, `Microsoft.Web/serverFarms`, `NGINX.NGINXPLUS/nginxDeployments`, `PaloAltoNetworks.Cloudngfw/firewalls`, `Qumulo.Storage/fileSystems` and `Oracle.Database/networkAttachments`.|`string`|`null`|no|
|private\_endpoint\_network\_policies|Enable or Disable network policies for the private endpoint on the subnet. Possible values include: `Disabled`, `Enabled`, `NetworkSecurityGroupEnabled` and `RouteTableEnabled`.|`string`|`Disabled`|no|
|private\_link\_service\_network\_policies\_enabled|Enable or Disable network policies for the private link service on the subnet.|`bool`|`false`|no|

## :arrow_backward: Outputs

The following outputs are exported:

| Name | Description | Sensitive |
| ---- | ------------| :-------: |
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
