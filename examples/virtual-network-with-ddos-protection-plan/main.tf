provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-azurerm-virtual-network"
  location = "West Europe"
}

resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = "ddos_protection_plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

module "virtual-network" {
  source                  = "aztfm/virtual-network/azurerm"
  version                 = ">=1.0.0"
  name                    = "virtual-network"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  address_space           = ["10.0.0.0/16"]
  ddos_protection_plan_id = azurerm_network_ddos_protection_plan.ddos.id
  subnets                 = [{ name = "subnet1", address_prefix = "10.0.0.0/24" }]
}
