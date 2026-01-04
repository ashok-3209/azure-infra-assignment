## Terraform tfvars input for dev environment for 1 Dev VM###
###
rg_config = {
  "dev-rg1" = {
    resource_group_name = "dev-askrg01"
    location            = "centralindia"
  },
  # "dev-rg2" = {
  #   resource_group_name = "test-askrg02"
  #   location            = "centralindia"
  # }
}

vnet_config = {
  "dev-vnet1" = {
    vnet_name           = "dev-askvnet01"
    resource_group_name = "dev-askrg01"
    location            = "centralindia"
    address_space       = ["10.0.0.0/16"]
  },
  "dev-vnet2" = {
    vnet_name           = "dev-askvnet02"
    resource_group_name = "dev-askrg01"
    location            = "centralindia"
    address_space       = ["10.1.0.0/16"]
  }
}

subnet_config = {
  "dev-subnet1" = {
    subnet_name         = "frontend-subnet"
    resource_group_name = "dev-askrg01"
    vnet_name           = "dev-askvnet01"
    address_prefixes    = ["10.0.1.0/24"]
  },
  "dev-subnet2" = {
    subnet_name         = "backend-subnet"
    resource_group_name = "dev-askrg01"
    vnet_name           = "dev-askvnet02"
    address_prefixes    = ["10.1.1.0/24"]
  }
}

pip_config = {
  "dev-pip1" = {
    public_ip_name      = "frontend-askpip01"
    resource_group_name = "dev-askrg01"
    location            = "centralindia"
    allocation_method   = "Static"
  },
  # "dev-pip2" = {
  #   public_ip_name      = "backend-askpip02"
  #   resource_group_name = "dev-askrg01"
  #   location            = "centralindia"
  #   allocation_method   = "Static"
  # }
}

nic_config = {
  "dev-nic1" = {
    nic_name              = "frontend-asknic01"
    resource_group_name   = "dev-askrg01"
    location              = "centralindia"
    subnet_key            = "dev-subnet1"
    pip_key               = "dev-pip1"
    private_ip_allocation = "Dynamic"
    public_ip_name        = "frontend-askpip01"
  },
  # "dev-nic2" = {
  #   nic_name              = "backend-asknic02"
  #   resource_group_name   = "dev-askrg01"
  #   location              = "centralindia"
  #   subnet_key            = "dev-subnet2"
  #   pip_key               = "dev-pip2"
  #   private_ip_allocation = "Dynamic"
  #   public_ip_name        = "backend-askpip02"
  # }
}

nsg_config = {
  "dev-nsg1" = {
    nsg_name            = "frontend-asknsg01"
    resource_group_name = "dev-askrg01"
    location            = "centralindia"
  },
  # "dev-nsg2" = {
  #   nsg_name            = "backend-asknsg02"
  #   resource_group_name = "dev-askrg01"
  #   location            = "centralindia"
  # }
}

nsg_nic_config = {
  "dev-nsg-nic1" = {
    nic_key = "dev-nic1"
    nsg_key = "dev-nsg1"
  },
  "dev-nsg-nic2" = {
    nic_key = "dev-nic2"
    nsg_key = "dev-nsg2"
  }
}

vm_config = {
  "dev-vm1" = {
    vm_name             = "frontend-askvm01"
    resource_group_name = "dev-askrg01"
    location            = "centralindia"
    nic_key             = "dev-nic1"
    vm_size             = "Standard_B1s"
    admin_username      = "azureuser"
    admin_password      = "P@ssword@1234"
    os_disk_type        = "Standard_LRS"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "18.04-LTS"
      version   = "latest"
    }
  },
  # "dev-vm2" = {
  #   vm_name             = "backend-askvm02"
  #   resource_group_name = "dev-askrg01"
  #   location            = "centralindia"
  #   nic_key             = "dev-nic2"
  #   vm_size             = "Standard_B1s"
  #   admin_username      = "azureuser"
  #   admin_password      = "P@ssword@1234"
  #   os_disk_type        = "Standard_LRS"
  #   source_image_reference = {
  #     publisher = "Canonical"
  #     offer     = "UbuntuServer"
  #     sku       = "18.04-LTS"
  #     version   = "latest"
  #   }
  # }
}

sql_server_config = {
  "dev-sqlserver1" = {
    sql_server_name              = "dev-asksqlsrv01"
    resource_group_name          = "dev-askrg01"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "sqladminuser"
    administrator_login_password = "SqlP@ssword@1234"
    minimum_tls_version          = "1.2"
    tags = {
      environment = "dev"
      project     = "azure_infra"
    }
  }
}

sql_db_config = {
  "dev-sqldb1" = {
    sql_database_name = "dev-asksqldb01"
    # server_id           = "dev-asksqlsrv01"
    sql_server_name     = "dev-asksqlsrv01"
    resource_group_name = "dev-askrg01"
    location            = "centralindia"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
    tags = {
      environment = "dev"
      project     = "azure_infra"
    }
  }
}
