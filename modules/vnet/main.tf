resource "azurerm_virtual_network" "appsvc_vnet" {
  name                = "${var.plan_name}-vnet"
  location            = var.plan_location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
}