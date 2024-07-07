# Authentication
variable "tenant_id" {
  type        = string
  description = "Azure tenant ID."
  sensitive   = true
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID."
  sensitive   = true
}

variable "client_id" {
  type        = string
  description = "Azure service principal ID."
  sensitive   = true
}

variable "client_secret" {
  type        = string
  description = "Azure service principal secrect."
  sensitive   = true
}

# General
variable "organization" {
  type        = string
  description = "Organization Name."
}

variable "environment" {
  type        = string
  description = "Environment Name."
}

variable "owner" {
  type        = string
  description = "Owner E-Mail."
}

variable "location" {
  type        = string
  description = "Azure Region."
  default     = "westeurope"
}

# Application
variable "app_name" {
  type        = string
  description = "Application Name."
}

# Locals
locals {
  tags = {
    Environment = var.environment
    Owner       = var.owner
  }

  prefix = "${var.organization}"
  suffix = "${var.environment}"
  prefix_dashed = "${var.organization}-"
  suffix_dashed = "-${var.environment}"
}