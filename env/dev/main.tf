module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rg_config = var.rg_config
}

module "vnet" {
    depends_on = [ module.resource_group ]
    source = "../../modules/azurerm_virtual_network"    
    vnet_config = var.vnet_config
}

module "subnet" {
    depends_on = [ module.resource_group, module.vnet ]
    source = "../../modules/azurerm_subnet"
    subnet_config = var.subnet_config
}

module "pip" {
    depends_on = [ module.resource_group ]
    source = "../../modules/azurerm_public_ip"
    public_ip = var.pip_config
 }

locals {
   nic_with_ids = {
      for k, v in var.nic_config :
      k => merge(v, {
         subnet_id    = module.subnet.subnet_ids[v.subnet_key]
         public_ip_id = module.pip.public_ip_ids[v.pip_key]
      })
   }

   nsg_assoc_with_ids = {
      for k, v in var.nsg_nic_config :
      k => {
         nic_id = module.nic.nic_ids[v.nic_key]
         nsg_id = module.nsg.nsg_ids[v.nsg_key]
      }
   }

   vm_with_ids = {
      for k, v in var.vm_config :
      k => merge(v, {
         nic_id = module.nic.nic_ids[v.nic_key]
      })
   }
}

 module "nic" {
    depends_on = [ module.subnet, module.pip ]
    source = "../../modules/azurerm_nic"
    vnic_config = local.nic_with_ids
 }

 module "nsg" {
    depends_on = [ module.resource_group, module.subnet ]
    source = "../../modules/azurerm_nsg"
    nsg_config = var.nsg_config
 }

 module "nsg_assoc" {
    depends_on = [ module.nic, module.nsg , module.subnet ]
    source = "../../modules/azurerm_ngs_association"
    nsg_nic_config = local.nsg_assoc_with_ids
   
 }

 module "vm" {
    depends_on = [ module.nic, module.nsg , module.subnet , module.resource_group, module.vnet]
    source = "../../modules/azurerm_virtual_machine"
    vm_config = local.vm_with_ids
   
 }

 module "sql_server" {
   depends_on = [ module.resource_group ]
   source = "../../modules/azurerm_sql_server"
   sql_server_config = var.sql_server_config
 }

 module "sql_db" {
   depends_on = [ module.sql_server ]
   source = "../../modules/azurerm_sql_database"
   sql_db_config = var.sql_db_config
   
 }