terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }

    azurecaf = {
      source = "aztfmod/azurecaf"
      version = "~> 1.2.20"
    }
  }
}

provider "azurerm" {
  features {
  }
}