variable "vnic_config" {
    type = map(object({
        nic_name            = string
        resource_group_name = string
        location            = string
        subnet_id           = string
        public_ip_id        = string
        private_ip_allocation = string
    }))
  
}