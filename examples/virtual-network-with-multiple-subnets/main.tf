provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "terraform-azurerm-virtual-network"
  location = "West Europe"
}

module "vnet" {
  source              = "aztfm/virtual-network/azurerm"
  version             = ">=1.2.0"
  name                = "virtual-network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
  subnets = [
    { name = "subnet1", address_prefix = "10.0.0.0/24" },
    { name = "subnet2", address_prefix = "10.1.0.0/24", service_endpoints = "Microsoft.Sql" },
    { name = "subnet3", address_prefix = "10.2.0.0/24", service_endpoints = "Microsoft.Storage,Microsoft.Web" }
  ]
}
