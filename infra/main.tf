terraform {
    backend "azurerm" {
      resource_group_name  = "rg-dev-mateusclira-sp"
      storage_account_name = "mateuscliradevsp"
      container_name       = "terraform"
      key                  = "terraform.tfstate"        
    }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.0"
    }
    resource = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  subscription_id = var.SUBSCRIPTION_ID
  features {}
  skip_provider_registration = true
}

provider "random" {
  features {}
}

resource "random_string" "random_suffix" {
  length  = 3
  special = false
  upper   = false
}

locals {
  unique_person_name = "${var.person_name}${random_string.random_suffix.result}"
}

module "storage" {
  source   = "./modules/storage"

  location           = var.location
  rg_name            = var.rg_name
  unique_person_name = local.unique_person_name
}

module "apps" {
  source   = "./modules/apps"

  location             = var.location
  rg_name              = var.rg_name
  env_id               = var.ENV_ID
  unique_person_name   = local.unique_person_name
  sa_connection_string = module.storage.sa_connection_string
  sa_name              = module.storage.sa_name
  acr_login_server     = module.acr.acr_login_server
  acr_password         = module.acr.acr_password
  acr_username         = module.acr.acr_username
  sa_key               = module.storage.sa_key
  acr_address          = module.acr.acr_address
}

module "acr" {
  source   = "./modules/acr"

  location           = var.location
  rg_name            = var.rg_name
  unique_person_name = local.unique_person_name
}

module "security" {
  source   = "./modules/security"

  appId           = module.apps.appId
  sa_id           = module.storage.sa_id
  subscription_id = var.SUBSCRIPTION_ID
}
