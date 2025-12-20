variable "sql_db_config" {
  type = map(object({
    sql_database_name = string
    sql_server_name  = string
    # server_id         = string
    resource_group_name = string
    location         = string
    collation         = string
    license_type      = string
    max_size_gb       = number
    sku_name          = string
    enclave_type      = string
    tags              = optional(map(string))
  }))

}
