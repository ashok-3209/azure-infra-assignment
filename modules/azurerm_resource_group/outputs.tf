output "rg_names" {
  description = "Map of resource group names keyed by for_each key"
  value       = { for k, v in azurerm_resource_group.rg : k => v.name }
}