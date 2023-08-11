output "appId" {
    value = azurerm_linux_web_app.webApp.identity[0].principal_id
}