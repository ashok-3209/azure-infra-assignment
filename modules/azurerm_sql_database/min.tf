data "azurerm_mssql_server" "sql_server" {
  for_each            = var.sql_db_config
  name                = each.value.sql_server_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_mssql_database" "sql_db" {
  for_each = var.sql_db_config
  name     = each.value.sql_database_name
  server_id    = data.azurerm_mssql_server.sql_server[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
  tags = lookup(each.value, "tags", null)

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
    
    