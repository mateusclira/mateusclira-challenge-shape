resource "azurerm_role_assignment" "storage" {
  scope                = "/subscriptions/e0f97400-6af5-4cef-a603-12ba3d2a3d05/resourceGroups/rg-mateusclira"
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = var.appId
}
