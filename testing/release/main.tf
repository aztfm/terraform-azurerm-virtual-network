resource "azurerm_resource_group" "rg" {
  name     = uuid()
  location = "West Europe"
}

resource "azurerm_network_security_group" "nsg" {
  name                = azurerm_resource_group.rg.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = azurerm_resource_group.rg.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

module "virtual_network" {
  source                  = "./module"
  name                    = azurerm_resource_group.rg.name
  resource_group_name     = azurerm_resource_group.rg.name
  location                = azurerm_resource_group.rg.location
  address_space           = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
  dns_servers             = ["8.8.8.8", "8.8.4.4"]
  ddos_protection_plan_id = azurerm_network_ddos_protection_plan.ddos.id
  subnets = [
    {
      name                                          = "subnet1"
      address_prefix                                = "10.1.0.0/24"
      network_security_group_id                     = azurerm_network_security_group.nsg.id
      delegation                                    = "Microsoft.Sql/managedInstances"
      enforce_private_link_service_network_policies = true
    },
    {
      name                                           = "subnet2"
      address_prefix                                 = "10.2.0.0/24"
      service_endpoints                              = "Microsoft.Sql"
      enforce_private_link_endpoint_network_policies = true
    },
    {
      name              = "subnet3"
      address_prefix    = "10.3.0.0/24"
      service_endpoints = "Microsoft.Storage,Microsoft.Web"
      delegation        = "Microsoft.Web/serverFarms"
    }
  ]
}
