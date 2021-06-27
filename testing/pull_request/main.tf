locals {
  name = uuid()
}

resource "azurerm_resource_group" "rg" {
  name     = local.name
  location = "West Europe"
}

resource "azurerm_route_table" "rt" {
  name                = local.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

module "virtual_network" {
  source              = "./module"
  name                = local.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.1.0.0/16", "10.2.0.0/16", "10.3.0.0/16"]
  dns_servers         = ["8.8.8.8", "8.8.4.4"]
  subnets = [
    { name = "subnet1", address_prefix = "10.1.0.0/24", route_table_id = azurerm_route_table.rt.id },
    { name = "subnet2", address_prefix = "10.2.0.0/24", service_endpoints = "Microsoft.Sql" },
    { name = "subnet3", address_prefix = "10.3.0.0/24", service_endpoints = "Microsoft.Storage,Microsoft.Web" }
  ]
}