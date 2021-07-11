resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id != null ? [""] : []
    content {
      id     = var.ddos_protection_plan_id
      enable = true
    }
  }
}

resource "azurerm_subnet" "vnet" {
  for_each                                       = { for subnet in var.subnets : subnet.name => subnet }
  name                                           = each.value.name
  resource_group_name                            = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  address_prefixes                               = [each.value.address_prefix]
  service_endpoints                              = lookup(each.value, "service_endpoints", "") == "" ? null : split(",", each.value.service_endpoints)
  enforce_private_link_service_network_policies  = lookup(each.value, "enforce_private_link_service_network_policies", false)
  enforce_private_link_endpoint_network_policies = lookup(each.value, "enforce_private_link_endpoint_network_policies", false)

  dynamic "delegation" {
    for_each = lookup(each.value, "delegation", null) != null ? [""] : []
    content {
      name = each.value.delegation
      service_delegation {
        name    = each.value.delegation
        actions = formatlist("Microsoft.Network/%s", local.service_delegation_actions[each.value.delegation])
      }
    }
  }
}
