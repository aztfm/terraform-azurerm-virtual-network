resource "azurerm_resource_group" "rg" {
  name     = "resource-group"
  location = "West Europe"
}

resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = "ddos-protection-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

module "virtual_network" {
  source                  = "aztfm/virtual-network/azurerm"
  version                 = ">=4.0.0"
  name                    = "virtual-network"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  address_space           = ["10.0.0.0/16"]
  ddos_protection_plan_id = azurerm_network_ddos_protection_plan.ddos.id
  subnets = [
    {
      name             = "subnet1"
      address_prefixes = ["10.0.0.0/24"]
    }
  ]
}
