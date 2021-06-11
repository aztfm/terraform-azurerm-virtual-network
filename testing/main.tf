resource "azurerm_resource_group" "rg" {
  name     = "laboratory-virtual-network"
  location = "West Europe"
}

resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = "ddos-protection-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

module "virtual_network" {
  source                  = "./virtual-network"
  name                    = "virtual-network"
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  address_space           = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
  ddos_protection_plan_id = azurerm_network_ddos_protection_plan.ddos.id
  subnets = [
    { name = "subnet1", address_prefixes = ["10.1.0.0/24"] },
    { name = "subnet2", address_prefixes = ["10.2.0.0/24"], service_endpoints = ["Microsoft.Sql"] },
    { name = "subnet3", address_prefixes = ["10.3.0.0/24"], service_endpoints = ["Microsoft.Storage", "Microsoft.Web"] }
  ]
}