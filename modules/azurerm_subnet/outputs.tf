output "subnet_ids" {
  description = "Map of subnet ids keyed by for_each key"
  value = { for k, s in azurerm_subnet.subnet : k => s.id }
}
