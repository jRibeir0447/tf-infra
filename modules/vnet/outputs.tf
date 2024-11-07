output "vnet_id" {
  value = azurerm_virtual_network.appsvc_vnet.id
}

output "subnet_ids" {
  value = azurerm_virtual_network.appsvc_vnet.subnet
}