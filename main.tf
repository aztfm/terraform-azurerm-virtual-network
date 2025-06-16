resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  bgp_community       = var.bgp_community

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id != null ? [""] : []

    content {
      id     = var.ddos_protection_plan_id
      enable = true
    }
  }

  dynamic "encryption" {
    for_each = var.encryption_mode != null ? [""] : []

    content {
      enforcement = var.encryption_mode
    }
  }
}

resource "azurerm_subnet" "subnets" {
  for_each                                      = { for subnet in var.subnets : subnet.name => subnet }
  name                                          = each.value.name
  resource_group_name                           = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name                          = azurerm_virtual_network.vnet.name
  address_prefixes                              = each.value.address_prefixes
  default_outbound_access_enabled               = each.value.default_outbound_access_enabled
  service_endpoints                             = each.value.service_endpoints
  private_endpoint_network_policies             = each.value.private_endpoint_network_policies
  private_link_service_network_policies_enabled = each.value.private_link_service_network_policies_enabled

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
