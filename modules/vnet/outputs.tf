output "vnet_id" {
  value = azurerm_virtual_network.appsvc_vnet.id
}

output "subnet_id" {
  value = azurerm_subnet.app_subnet.id
}