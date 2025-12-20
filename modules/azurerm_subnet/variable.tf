variable "subnet_config" {
  type = map(object({
    subnet_name          = string
    address_prefixes     = list(string)
    resource_group_name  = string
    vnet_name = string
  }))
}