variable "nsg_nic_config" {
  description = "A map containing NIC and NSG ids for association"
  type = map(object({
    nic_id = string
    nsg_id = string
  }))
  
}