terraform {
  required_version = ">= 1.0.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.76.0"
    }
  }
  backend "azurerm" {
  }
}

provider "azurerm" {
  disable_terraform_partner_id = true
  features {}
}