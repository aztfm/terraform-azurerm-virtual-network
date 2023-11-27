output "workspace_id" {
  value = local.workspace_id
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}

output "ddos_protection_plan_id" {
  value = azurerm_network_ddos_protection_plan.ddos.id
}