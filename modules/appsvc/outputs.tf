output "app_id" {
  value = azurerm_linux_web_app.tfapp.*.id
}