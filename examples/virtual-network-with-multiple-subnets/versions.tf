terraform {
  required_version = ">=0.14.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.8.0"
    }
  }
}

provider "azurerm" {
  features {}
}
