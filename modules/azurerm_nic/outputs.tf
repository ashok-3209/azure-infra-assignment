output "nic_ids" {
  description = "Map of network interface ids keyed by for_each key"
  value = { for k, n in azurerm_network_interface.vnic : k => n.id }
}
