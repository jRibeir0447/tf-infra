resource "azurerm_virtual_network" "appsvc_vnet" {
  name                = "${var.plan_name}-vnet"
  location            = var.plan_location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]

}

resource "azurerm_subnet" "app_subnet" {
  name                 = "subnet1"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.appsvc_vnet.name
  address_prefixes    = ["10.0.1.0/24"]

  delegation {
    name = "delegation"

    service_delegation {
    name = "Microsoft.Web/serverFarms"
    }
  }

}