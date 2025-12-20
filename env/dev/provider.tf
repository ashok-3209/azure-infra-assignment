terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ashok-rg-stg"
    storage_account_name = "ashokstgpipeline01"
    container_name       = "devtfstate"
    key                  = "terraform.dev.tfstate"
  }
}



provider "azurerm" {
  features {}
  subscription_id = "22135bdc-d3fd-4095-9a18-2094dab79b13"
}