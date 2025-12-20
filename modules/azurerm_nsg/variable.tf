variable "nsg_config" {
    type = map(object({
        nsg_name            = string
        resource_group_name = string
        location            = string
    }))
  
}
