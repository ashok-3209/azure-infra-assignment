output "resource_group_names" {
  description = "Map of resource group names"
  value       = module.resource_group.rg_names
}

output "vnet_ids" {
  description = "Map of virtual network IDs"
  value       = module.vnet.vnet_ids
}

output "subnet_ids" {
  description = "Map of subnet IDs"
  value       = module.subnet.subnet_ids
}

output "public_ip_addresses" {
  description = "Map of public IP addresses"
  value       = module.pip.public_ip_addresses
}

output "nic_ids" {
  description = "Map of network interface IDs"
  value       = module.nic.nic_ids
}

output "nsg_ids" {
  description = "Map of network security group IDs"
  value       = module.nsg.nsg_ids
}

output "vm_public_ips" {
  description = "Map of VM public IP addresses"
  value       = module.vm.vm_public_ips
}

output "vm_private_ips" {
  description = "Map of VM private IP addresses"
  value       = module.vm.vm_private_ips
}

output "vm_ids" {
  description = "Map of VM IDs"
  value       = module.vm.vm_ids
}

output "sql_server_fqdns" {
  description = "Map of SQL server FQDNs"
  value       = module.sql_server.sql_server_fqdns
}

output "sql_database_names" {
  description = "Map of SQL database names"
  value       = module.sql_db.sql_database_names
}