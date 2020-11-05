provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "virtual-network" {
  name     = "terraform-azurerm-virtual-network"
  location = "West Europe"
}

module "virtual-network" {
  source              = "./terraform-azurerm-virtual-network"
  name                = "virtual-network-vnet"
  resource_group_name = azurerm_resource_group.virtual-network.name
  location            = azurerm_resource_group.virtual-network.location
  address_space       = ["10.0.0.0/16"]
  subnets = [
    { name = "subnet1", address_prefix = "10.0.0.0/24" },
    { name = "subnet2", address_prefix = "10.0.1.0/24" },
    { name = "subnet3", address_prefix = "10.0.2.0/24" }
  ]
}
