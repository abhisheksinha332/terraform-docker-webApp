terraform {
    required_version = ">= 1.12.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }

  backend "azurerm" {
}
}

provider "azurerm" {
  client_id                   = var.client_id
  client_secret               =var.client_secret
  tenant_id                   = var.tenant_id
  subscription_id             = var.subscription_id
  features {}
}

resource "azurerm_resource_group" "react-app-rg" {
  name     = var.resource_group
  location = "West Europe"
  
}

resource "azurerm_app_service_plan" "react-app-service-plan" {
  name                = var.app-service_plan_name
  location            = azurerm_resource_group.react-app-rg.location
  resource_group_name = azurerm_resource_group.react-app-rg.name
  kind = "Linux"
  reserved = true
  sku {
    tier     = "Basic"
    size     = "B1"
  }
}

resource "azurerm_linux_web_app" "react-app" {
  name                = var.web_app_name
  location            = azurerm_resource_group.react-app-rg.location
  resource_group_name = azurerm_resource_group.react-app-rg.name
  service_plan_id     = azurerm_app_service_plan.react-app-service-plan.id

 site_config {
    application_stack {
      docker_image_name     = var.docker_image_name
    }
    always_on = true
  }

  app_settings = {
    "WEBSITES_PORT"                = "5000"
    "WEBSITE_NODE_DEFAULT_VERSION" = "14.17"
  }
}