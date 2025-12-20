

resource "azurerm_network_interface" "vnic" {
  for_each            = var.vnic_config
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.private_ip_allocation
    public_ip_address_id          = each.value.public_ip_id
  }
}