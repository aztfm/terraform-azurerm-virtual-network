# Azure Virtual Network - Terraform Module

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 1.x.x       | 0.13.x            | >= 2.8.0        |

## Parameters

The following parameters are supported:

| Name                  | Description                                                                                            |        Type         | Default | Required |
| --------------------- | ------------------------------------------------------------------------------------------------------ | :-----------------: | :-----: | :------: |
| name                  | The name of the virtual network.                                                                       |      `string`       |   n/a   |   yes    |
| resource\_group\_name | The name of the resource group in which to create the virtual network.                                 |      `string`       |   n/a   |   yes    |
| location              | The location/region where the virtual network is created.                                              |      `string`       |   n/a   |   yes    |
| address\_space        | The address space that is used in the virtual network. More than one address space can be provisioned. |   `list(string)`    |   n/a   |   yes    |
| dns\_servers          | The address space that is used in the virtual network. More than one address space can be provisioned. |   `list(string)`    |  `[]`   |    no    |
| subnets               | List containing the blocks for the configuration of the subnets.                                       | `list(map(string))` |  `[]`   |    no    |
| tags                  | A mapping of tags to assign to the resource.                                                           |    `map(string)`    |  `{}`   |    no    |

##
The subnets supports the following:

| Name            | Description                               |   Type   | Default | Required |
| --------------- | ----------------------------------------- | :------: | :-----: | :------: |
| name            | The name of the subnet.                   | `string` |   n/a   |   yes    |
| address\_prefix | The address prefix to use for the subnet. | `string` |   n/a   |   yes    |

## Outputs

The following outputs are exported:

| Name                  | Description                                                            |
| --------------------- | ---------------------------------------------------------------------- |
| id                    | The virtual network configuration ID.                                  |
| guid                  | The GUID of the virtual network.                                       |
| name                  | The name of the virtual network.                                       |
| resource\_group\_name | The name of the resource group in which to create the virtual network. |
| location              | The location/region where the virtual network is created.              |
| address\_space        | The list of address spaces used by the virtual network.                |
| dns\_servers          | The list of DNS servers used by the virtual network.                   |
| subnets               | Blocks containing configuration of each subnet.                        |
| tags                  | The tags assigned to the resource.                                     |

## Example

```hcl
module "virtual-network" {
  source              = "aztfm/virtual-network/azurerm"
  version             = "1.0.0"
  name                = "azftm-vnet"
  resource_group_name = "aztfm-rg"
  location            = "West Europe"
  address_space       = ["10.0.0.0/16"]
  subnets = [
    { name = "subnet1", address_prefix = "10.0.0.0/24" },
    { name = "subnet2", address_prefix = "10.0.1.0/24" },
    { name = "subnet3", address_prefix = "10.0.2.0/24" }
  ]
}
```