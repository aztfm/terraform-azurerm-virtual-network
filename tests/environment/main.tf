resource "azurerm_resource_group" "rg" {
  name     = local.workspace_id
  location = "West Europe"
}

resource "azurerm_network_ddos_protection_plan" "ddos" {
  name                = local.workspace_id
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}
