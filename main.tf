# Terraform Definition
terraform {
  required_version = "~>1.9.1"

  required_providers {
    azurerm = {
      version = "~>3.111.0"
    }
  }
}

# AzureRM Provider
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
      purge_soft_deleted_secrets_on_destroy = true
      purge_soft_deleted_keys_on_destroy = true
      purge_soft_deleted_certificates_on_destroy = true
      purge_soft_deleted_hardware_security_modules_on_destroy = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}

# Current Context
data "azurerm_client_config" "current" { }

# Resource Group
resource "azurerm_resource_group" "app" {
  name       = "${local.prefix_dashed}${var.app_name}${local.suffix_dashed}"
  location   = var.location
  managed_by = data.azurerm_client_config.current.client_id
  tags       = local.tags
}