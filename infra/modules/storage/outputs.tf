output "sa_id" {
    value = azurerm_storage_account.main.id
}

output "sa_connection_string" {
    value = azurerm_storage_account.main.primary_blob_connection_string
}

output "sa_name" {
    value = azurerm_storage_account.main.name
}

output "sa_key" {
    value = azurerm_storage_account.main.primary_access_key
}