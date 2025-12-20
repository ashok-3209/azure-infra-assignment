output "sql_server_ids" {
  description = "Map of SQL server IDs keyed by for_each key"
  value       = { for k, v in azurerm_mssql_server.sql_server : k => v.id }
}

output "sql_server_fqdns" {
  description = "Map of SQL server fully qualified domain names keyed by for_each key"
  value       = { for k, v in azurerm_mssql_server.sql_server : k => v.fully_qualified_domain_name }
}