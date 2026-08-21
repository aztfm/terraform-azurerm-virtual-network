output "workspace_id" {
  value       = local.workspace_id
  description = "The workspace ID used as the resource name prefix."
}

output "resource_group_id" {
  value       = azurerm_resource_group.rg.id
  description = "The ID of the resource group."
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group."
}

output "resource_group_location" {
  value       = azurerm_resource_group.rg.location
  description = "The location of the resource group."
}

output "resource_group_tags" {
  value       = azurerm_resource_group.rg.tags
  description = "The tags assigned to the resource group."
}
