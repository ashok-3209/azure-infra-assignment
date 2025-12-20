output "public_ip_ids" {
  description = "Map of public ip ids keyed by for_each key"
  value = { for k, p in azurerm_public_ip.public_ip : k => p.id }
}
