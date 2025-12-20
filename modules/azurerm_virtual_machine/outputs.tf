output "vm_public_ips" {
  description = "Map of VM public IP addresses keyed by for_each key"
  value       = { for k, v in azurerm_linux_virtual_machine.example : k => v.public_ip_address }
}

output "vm_private_ips" {
  description = "Map of VM private IP addresses keyed by for_each key"
  value       = { for k, v in azurerm_linux_virtual_machine.example : k => v.private_ip_address }
}

output "vm_ids" {
  description = "Map of VM IDs keyed by for_each key"
  value       = { for k, v in azurerm_linux_virtual_machine.example : k => v.id }
}