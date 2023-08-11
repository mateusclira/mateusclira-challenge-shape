resource "azurerm_storage_account" "main" {
  name                     = "st${var.unique_person_name}"
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "main" {
  name                  = "pythonapp"
  storage_account_name  = azurerm_storage_account.main.name
  container_access_type = "private"
}
