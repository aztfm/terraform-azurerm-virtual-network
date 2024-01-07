resource "azurerm_resource_group" "rg" {
  name     = "resource-group"
  location = "West Europe"
}

module "virtual_network" {
  source              = "aztfm/virtual-network/azurerm"
  version             = ">=4.0.0"
  name                = "virtual-network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
  subnets = [
    {
      name             = "subnet1"
      address_prefixes = ["10.1.0.0/24"]
      delegation       = "Microsoft.Sql/managedInstances"
    },
    {
      name              = "subnet2"
      address_prefixes  = ["10.2.0.0/24"]
      service_endpoints = ["Microsoft.Sql"]
    },
    {
      name              = "subnet3"
      address_prefixes  = ["10.3.0.0/24"]
      service_endpoints = ["Microsoft.Storage", "Microsoft.Web"]
      delegation        = "Microsoft.Web/serverFarms"
    }
  ]
}
