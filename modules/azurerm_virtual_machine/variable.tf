variable "vm_config" {
  type = map(object({
  vm_name = string
  nic_id = string
    resource_group_name = string
    location = string
    vm_size = string
    admin_username = string
    admin_password = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}