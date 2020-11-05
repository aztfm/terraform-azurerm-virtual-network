provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "virtual-network" {
  name     = "terraform-azurerm-virtual-network"
  location = "West Europe"
}

resource "azurerm_network_ddos_protection_plan" "virtual-network" {
  name                = "virtual-network-ddos"
  resource_group_name = azurerm_resource_group.virtual-network.name
  location            = azurerm_resource_group.virtual-network.location
}

module "virtual-network" {
  source                  = "./terraform-azurerm-virtual-network"
  name                    = "virtual-network-vnet"
  resource_group_name     = azurerm_resource_group.virtual-network.name
  location                = azurerm_resource_group.virtual-network.location
  address_space           = ["10.0.0.0/16"]
  ddos_protection_plan_id = azurerm_network_ddos_protection_plan.virtual-network.id
  subnets                 = [{ name = "subnet1", address_prefix = "10.0.0.0/24" }]
}
