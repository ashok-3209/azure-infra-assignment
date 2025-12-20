output "nsg_ids" {
  description = "Map of network security group ids keyed by for_each key"
  value = { for k, n in azurerm_network_security_group.nsg : k => n.id }
}
