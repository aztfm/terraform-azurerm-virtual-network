resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_protection_plan_id != null ? [""] : []
    content {
      id     = var.ddos_protection_plan_id
      enable = true
    }
  }

  lifecycle {
    ignore_changes = [
      bgp_community,
      vm_protection_enabled
    ]
  }

  tags = var.tags
}

resource "azurerm_subnet" "vnet" {
  for_each             = { for subnet in var.subnets : subnet.name => subnet }
  name                 = each.value.name
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.address_prefix]
  service_endpoints    = lookup(each.value, "service_endpoints", "") == "" ? null : split(",", each.value.service_endpoints)

  lifecycle {
    ignore_changes = [
      delegation,
      enforce_private_link_endpoint_network_policies,
      enforce_private_link_service_network_policies,
      service_endpoint_policy_ids
    ]
  }
}

resource "azurerm_subnet_route_table_association" "vnet" {
  for_each       = { for subnet in var.subnets : subnet.name => subnet if subnet.route_table_id != null }
  subnet_id      = azurerm_subnet.vnet[each.value.name].id
  route_table_id = each.value.route_table_id
}
