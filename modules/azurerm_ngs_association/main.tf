
resource "azurerm_network_interface_security_group_association" "nsgassociation" {
  for_each = var.nsg_nic_config
  network_interface_id      = each.value.nic_id
  network_security_group_id = each.value.nsg_id
}


