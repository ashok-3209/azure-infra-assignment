output "vnet_ids" {
  description = "Map of virtual network IDs keyed by for_each key"
  value       = { for k, v in azurerm_virtual_network.vnet : k => v.id }
}