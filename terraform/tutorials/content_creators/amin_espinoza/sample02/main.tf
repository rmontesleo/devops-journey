terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {    
  }
}

resource "azurerm_resource_group" "rg" {
    name = var.rg_name
    location = var.location  
}

resource "azurerm_service_plan" "service_plan" {
  name =  var.app_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  os_type = "Linux"
  sku_name = "S1"
}

resource "azurerm_linux_web_app" "web_app" {
  name = var.app_service_name
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  service_plan_id = azurerm_service_plan.service_plan.id

  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
  }

}