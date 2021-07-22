terraform {
  required_version = ">=0.13.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.35.0" # Good 2.36.0
    }
  }
}

provider "azurerm" {
  features {}
}
