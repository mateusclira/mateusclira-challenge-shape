resource "azurerm_service_plan" "main" {
  name                = "asp-interview-${var.unique_person_name}"
  location            = var.location
  resource_group_name = var.rg_name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "webApp" {
  name                       = "app${var.env_id}${var.unique_person_name}"
  location                   = var.location
  resource_group_name        = var.rg_name
  service_plan_id            = azurerm_service_plan.main.id
   storage_account {
    account_name = var.sa_name
    share_name   = "pythonapp"
    type         = "AzureBlob"
    access_key   = var.sa_key
    name         = var.sa_name
   }
    site_config {
      application_stack {
      docker_image     = "acrmateusgc4.azurecr.io/pythonapp"
      docker_image_tag = "301"
    }
    health_check_path        = "/healthz"
    app_command_line         = "docker run --rm -p 80:9555 acrmateusgc4.azurecr.io/pythonapp:301"
  }
    app_settings = {
        https_only                       = true
        DOCKER_REGISTRY_SERVER_URL       = "https://acrmateusgc4.azurecr.io"
        DOCKER_REGISTRY_SERVER_USERNAME  = var.acr_username
        DOCKER_REGISTRY_SERVER_PASSWORD  = var.acr_password
        storage_name                     = var.sa_name
    }
  identity {
    type = "SystemAssigned"
  }
}

# resource "docker_image" "pythonApp" {
#   name = "python-shape"
#   build {
#     context = "."
#     tag     = ["v1.0.0"]
#     label = {
#       author : "Mateus Lira"
#     }
#   }
# }

# terraform {
#  required_providers {
#     docker = {
#       source = "kreuzwerker/docker"
#     }
#   }
# }

#   provider "docker" {
#   host = "unix:///var/run/docker.sock"
#   # host = var.acr_login_server
# }

# resource "docker_registry_image" "main" {
#   name          = docker_image.image.name
#   keep_remotely = true
# }

# resource "docker_image" "image" {
#   name = "acrmateus04w.azurecr.io/pythonapp:1.0"
#   build {
#     context = "."
#     build_arg = {
#       arg : "-t"
#     }
#     label   = {
#       author : "Mateus Lira"
#     }
#   }
# }
