output "sql_database_ids" {
  description = "Map of SQL database IDs keyed by for_each key"
  value       = { for k, v in azurerm_mssql_database.sql_db : k => v.id }
}

output "sql_database_names" {
  description = "Map of SQL database names keyed by for_each key"
  value       = { for k, v in azurerm_mssql_database.sql_db : k => v.name }
}