# Azure Virtual Network - Terraform Module
![Testing module](https://github.com/aztfm/terraform-azurerm-virtual-network/workflows/Testing%20module/badge.svg?branch=main)
[![TF Registry](https://img.shields.io/badge/terraform-registry-blueviolet.svg)](https://registry.terraform.io/modules/aztfm/virtual-network/azurerm/)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/aztfm/terraform-azurerm-virtual-network)

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 1.x.x       | >= 0.13.x         | >= 2.8.0        |

## Parameters

The following parameters are supported:

| Name                       | Description                                                                                            |        Type         | Default | Required |
| -------------------------- | ------------------------------------------------------------------------------------------------------ | :-----------------: | :-----: | :------: |
| name                       | The name of the virtual network.                                                                       |      `string`       |   n/a   |   yes    |
| resource\_group\_name      | The name of the resource group in which to create the virtual network.                                 |      `string`       |   n/a   |   yes    |
| location                   | The location/region where the virtual network is created.                                              |      `string`       |   n/a   |   yes    |
| address\_space             | The address space that is used in the virtual network. More than one address space can be provisioned. |   `list(string)`    |   n/a   |   yes    |
| dns\_servers               | List of IP addresses of DNS servers.                                                                   |   `list(string)`    |  `[]`   |    no    |
| ddos\_protection\_plan\_id | The ID of DDoS Protection Plan.                                                                        |      `string`       | `null`  |    no    |
| subnets                    | List of objects that represent the configuration of each subnet.                                       | `list(map(string))` |  `[]`   |    no    |
| tags                       | A mapping of tags to assign to the resource.                                                           |    `map(string)`    |  `{}`   |    no    |

The `subnets` supports the following:

| Name               | Description                                                                                                                                                                                                                                                                                                    |   Type   | Default | Required |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: | :-----: | :------: |
| name               | The name of the subnet.                                                                                                                                                                                                                                                                                        | `string` |   n/a   |   yes    |
| address\_prefix    | The address prefix to use for the subnet.                                                                                                                                                                                                                                                                      | `string` |   n/a   |   yes    |
| service\_endpoints | The list of Service endpoints to associate with the subnet. Possible values include: `Microsoft.AzureActiveDirectory`, `Microsoft.AzureCosmosDB`, `Microsoft.ContainerRegistry`, `Microsoft.EventHub`, `Microsoft.KeyVault`, `Microsoft.ServiceBus`, `Microsoft.Sql`, `Microsoft.Storage` and `Microsoft.Web`. | `string` | `null`  |    no    |

## Outputs

The following outputs are exported:

| Name                   | Description                                                            |
| ---------------------- | ---------------------------------------------------------------------- |
| id                     | The virtual network configuration ID.                                  |
| guid                   | The GUID of the virtual network.                                       |
| name                   | The name of the virtual network.                                       |
| resource\_group\_name  | The name of the resource group in which to create the virtual network. |
| location               | The location/region where the virtual network is created.              |
| address\_space         | The list of address spaces used by the virtual network.                |
| dns\_servers           | The list of DNS servers used by the virtual network.                   |
| ddos\_protection\_plan | Block containing configuration of ddos protection plan.                |
| subnets                | Blocks containing configuration of each subnet.                        |
| tags                   | The tags assigned to the resource.                                     |
